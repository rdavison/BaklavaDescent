; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/morph.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/morph.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.morph_data = type { ptr, [1000 x %struct.vms_vector], [1000 x %struct.vms_vector], [1000 x i32], [10 x i32], [10 x i32], [10 x i32], i32, i8, i8, %struct.physics_info, i32 }
%struct.vms_vector = type { i32, i32, i32 }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%struct.polymodel = type { i32, i32, ptr, [10 x i32], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x i32], [10 x i8], [10 x %struct.vms_vector], [10 x %struct.vms_vector], %struct.vms_vector, %struct.vms_vector, i32, i8, i16, i8 }
%struct.bitmap_index = type { i16 }
%struct._grs_bitmap = type { i16, i16, i16, i16, i8, i8, i16, ptr, i16, i8, i8 }
%struct.g3s_point = type { %struct.vms_vector, i32, i32, i32, i32, i32, i8, i8, i16 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%union.anon = type { %struct.physics_info }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%"struct.std::__1::__less" = type { i8 }

@morph_objects = global [5 x %struct.morph_data] zeroinitializer, align 8, !dbg !0
@Newdemo_state = external global i32, align 4
@.str = private unnamed_addr constant [23 x i8] c"type == 7 || type == 1\00", align 1, !dbg !26
@.str.1 = private unnamed_addr constant [55 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/morph.cpp\00", align 1, !dbg !34
@morph_rate = global i32 196608, align 4, !dbg !39
@.str.2 = private unnamed_addr constant [20 x i8] c"i+nverts < MAX_VECS\00", align 1, !dbg !41
@FrameTime = external global i32, align 4
@Polygon_models = external global [0 x %struct.polymodel], align 8
@morph_rotvel = global %struct.vms_vector { i32 16384, i32 8192, i32 4096 }, align 4, !dbg !46
@.str.3 = private unnamed_addr constant [31 x i8] c"obj->render_type == RT_POLYOBJ\00", align 1, !dbg !48
@.str.4 = private unnamed_addr constant [27 x i8] c"obj->control_type == CT_AI\00", align 1, !dbg !53
@ObjBitmaps = external global [600 x %struct.bitmap_index], align 2
@ObjBitmapPtrs = external global [600 x i16], align 2
@texture_list_index = external global [100 x %struct.bitmap_index], align 2
@GameBitmaps = external global [2620 x %struct._grs_bitmap], align 8
@texture_list = external global [100 x ptr], align 8
@piggy_page_flushed = external global i32, align 4
@.str.5 = private unnamed_addr constant [24 x i8] c"piggy_page_flushed == 0\00", align 1, !dbg !58
@.str.6 = private unnamed_addr constant [11 x i8] c"md != NULL\00", align 1, !dbg !63
@N_polygon_models = external global i32, align 4
@.str.7 = private unnamed_addr constant [50 x i8] c"obj->rtype.pobj_info.model_num < N_polygon_models\00", align 1, !dbg !68
@robot_points = external global [0 x %struct.g3s_point], align 4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef ptr @_Z15find_morph_dataP6object(ptr noundef %0) #0 !dbg !1487 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1492, !DIExpression(), !1493)
    #dbg_declare(ptr %4, !1494, !DIExpression(), !1495)
  %5 = load i32, ptr @Newdemo_state, align 4, !dbg !1496
  %6 = icmp eq i32 %5, 2, !dbg !1498
  br i1 %6, label %7, label %9, !dbg !1498

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8, !dbg !1499
  store ptr %8, ptr @morph_objects, align 8, !dbg !1501
  store ptr @morph_objects, ptr %2, align 8, !dbg !1502
  br label %30, !dbg !1502

9:                                                ; preds = %1
  store i32 0, ptr %4, align 4, !dbg !1503
  br label %10, !dbg !1505

10:                                               ; preds = %26, %9
  %11 = load i32, ptr %4, align 4, !dbg !1506
  %12 = icmp slt i32 %11, 5, !dbg !1508
  br i1 %12, label %13, label %29, !dbg !1509

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4, !dbg !1510
  %15 = sext i32 %14 to i64, !dbg !1512
  %16 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %15, !dbg !1512
  %17 = getelementptr inbounds nuw %struct.morph_data, ptr %16, i32 0, i32 0, !dbg !1513
  %18 = load ptr, ptr %17, align 8, !dbg !1513
  %19 = load ptr, ptr %3, align 8, !dbg !1514
  %20 = icmp eq ptr %18, %19, !dbg !1515
  br i1 %20, label %21, label %25, !dbg !1515

21:                                               ; preds = %13
  %22 = load i32, ptr %4, align 4, !dbg !1516
  %23 = sext i32 %22 to i64, !dbg !1517
  %24 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %23, !dbg !1517
  store ptr %24, ptr %2, align 8, !dbg !1518
  br label %30, !dbg !1518

25:                                               ; preds = %13
  br label %26, !dbg !1514

26:                                               ; preds = %25
  %27 = load i32, ptr %4, align 4, !dbg !1519
  %28 = add nsw i32 %27, 1, !dbg !1519
  store i32 %28, ptr %4, align 4, !dbg !1519
  br label %10, !dbg !1520, !llvm.loop !1521

29:                                               ; preds = %10
  store ptr null, ptr %2, align 8, !dbg !1524
  br label %30, !dbg !1524

30:                                               ; preds = %29, %21, %7
  %31 = load ptr, ptr %2, align 8, !dbg !1525
  ret ptr %31, !dbg !1525
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12find_min_maxP9polymodeliP10vms_vectorS2_(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #1 !dbg !1526 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i16, align 2
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1555, !DIExpression(), !1556)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !1557, !DIExpression(), !1558)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !1559, !DIExpression(), !1560)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !1561, !DIExpression(), !1562)
    #dbg_declare(ptr %9, !1563, !DIExpression(), !1564)
    #dbg_declare(ptr %10, !1565, !DIExpression(), !1566)
    #dbg_declare(ptr %11, !1567, !DIExpression(), !1568)
    #dbg_declare(ptr %12, !1569, !DIExpression(), !1570)
  %13 = load ptr, ptr %5, align 8, !dbg !1571
  %14 = getelementptr inbounds nuw %struct.polymodel, ptr %13, i32 0, i32 2, !dbg !1572
  %15 = load ptr, ptr %14, align 8, !dbg !1572
  %16 = load ptr, ptr %5, align 8, !dbg !1573
  %17 = getelementptr inbounds nuw %struct.polymodel, ptr %16, i32 0, i32 3, !dbg !1574
  %18 = load i32, ptr %6, align 4, !dbg !1575
  %19 = sext i32 %18 to i64, !dbg !1573
  %20 = getelementptr inbounds [10 x i32], ptr %17, i64 0, i64 %19, !dbg !1573
  %21 = load i32, ptr %20, align 4, !dbg !1573
  %22 = sext i32 %21 to i64, !dbg !1571
  %23 = getelementptr inbounds i8, ptr %15, i64 %22, !dbg !1571
  store ptr %23, ptr %11, align 8, !dbg !1576
  %24 = load ptr, ptr %11, align 8, !dbg !1577
  %25 = getelementptr inbounds nuw i16, ptr %24, i32 1, !dbg !1577
  store ptr %25, ptr %11, align 8, !dbg !1577
  %26 = load i16, ptr %24, align 2, !dbg !1578
  store i16 %26, ptr %12, align 2, !dbg !1579
  %27 = load i16, ptr %12, align 2, !dbg !1580
  %28 = zext i16 %27 to i32, !dbg !1580
  %29 = icmp eq i32 %28, 7, !dbg !1580
  br i1 %29, label %34, label %30, !dbg !1580

30:                                               ; preds = %4
  %31 = load i16, ptr %12, align 2, !dbg !1580
  %32 = zext i16 %31 to i32, !dbg !1580
  %33 = icmp eq i32 %32, 1, !dbg !1580
  br label %34, !dbg !1580

34:                                               ; preds = %30, %4
  %35 = phi i1 [ true, %4 ], [ %33, %30 ]
  %36 = zext i1 %35 to i32, !dbg !1580
  call void @_Z7_AssertiPKcS0_i(i32 noundef %36, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 71), !dbg !1580
  %37 = load ptr, ptr %11, align 8, !dbg !1581
  %38 = getelementptr inbounds nuw i16, ptr %37, i32 1, !dbg !1581
  store ptr %38, ptr %11, align 8, !dbg !1581
  %39 = load i16, ptr %37, align 2, !dbg !1582
  store i16 %39, ptr %9, align 2, !dbg !1583
  %40 = load i16, ptr %12, align 2, !dbg !1584
  %41 = zext i16 %40 to i32, !dbg !1584
  %42 = icmp eq i32 %41, 7, !dbg !1586
  br i1 %42, label %43, label %46, !dbg !1586

43:                                               ; preds = %34
  %44 = load ptr, ptr %11, align 8, !dbg !1587
  %45 = getelementptr inbounds i16, ptr %44, i64 2, !dbg !1587
  store ptr %45, ptr %11, align 8, !dbg !1587
  br label %46, !dbg !1588

46:                                               ; preds = %43, %34
  %47 = load ptr, ptr %11, align 8, !dbg !1589
  store ptr %47, ptr %10, align 8, !dbg !1590
  %48 = load ptr, ptr %10, align 8, !dbg !1591
  %49 = getelementptr inbounds nuw %struct.vms_vector, ptr %48, i32 1, !dbg !1591
  store ptr %49, ptr %10, align 8, !dbg !1591
  %50 = load ptr, ptr %8, align 8, !dbg !1592
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %50, ptr align 4 %48, i64 12, i1 false), !dbg !1593
  %51 = load ptr, ptr %7, align 8, !dbg !1594
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %51, ptr align 4 %50, i64 12, i1 false), !dbg !1595
  %52 = load i16, ptr %9, align 2, !dbg !1596
  %53 = add i16 %52, -1, !dbg !1596
  store i16 %53, ptr %9, align 2, !dbg !1596
  br label %54, !dbg !1597

54:                                               ; preds = %142, %46
  %55 = load i16, ptr %9, align 2, !dbg !1598
  %56 = add i16 %55, -1, !dbg !1598
  store i16 %56, ptr %9, align 2, !dbg !1598
  %57 = icmp ne i16 %55, 0, !dbg !1599
  br i1 %57, label %58, label %145, !dbg !1597

58:                                               ; preds = %54
  %59 = load ptr, ptr %10, align 8, !dbg !1600
  %60 = getelementptr inbounds nuw %struct.vms_vector, ptr %59, i32 0, i32 0, !dbg !1603
  %61 = load i32, ptr %60, align 4, !dbg !1603
  %62 = load ptr, ptr %8, align 8, !dbg !1604
  %63 = getelementptr inbounds nuw %struct.vms_vector, ptr %62, i32 0, i32 0, !dbg !1605
  %64 = load i32, ptr %63, align 4, !dbg !1605
  %65 = icmp sgt i32 %61, %64, !dbg !1606
  br i1 %65, label %66, label %72, !dbg !1606

66:                                               ; preds = %58
  %67 = load ptr, ptr %10, align 8, !dbg !1607
  %68 = getelementptr inbounds nuw %struct.vms_vector, ptr %67, i32 0, i32 0, !dbg !1608
  %69 = load i32, ptr %68, align 4, !dbg !1608
  %70 = load ptr, ptr %8, align 8, !dbg !1609
  %71 = getelementptr inbounds nuw %struct.vms_vector, ptr %70, i32 0, i32 0, !dbg !1610
  store i32 %69, ptr %71, align 4, !dbg !1611
  br label %72, !dbg !1609

72:                                               ; preds = %66, %58
  %73 = load ptr, ptr %10, align 8, !dbg !1612
  %74 = getelementptr inbounds nuw %struct.vms_vector, ptr %73, i32 0, i32 1, !dbg !1614
  %75 = load i32, ptr %74, align 4, !dbg !1614
  %76 = load ptr, ptr %8, align 8, !dbg !1615
  %77 = getelementptr inbounds nuw %struct.vms_vector, ptr %76, i32 0, i32 1, !dbg !1616
  %78 = load i32, ptr %77, align 4, !dbg !1616
  %79 = icmp sgt i32 %75, %78, !dbg !1617
  br i1 %79, label %80, label %86, !dbg !1617

80:                                               ; preds = %72
  %81 = load ptr, ptr %10, align 8, !dbg !1618
  %82 = getelementptr inbounds nuw %struct.vms_vector, ptr %81, i32 0, i32 1, !dbg !1619
  %83 = load i32, ptr %82, align 4, !dbg !1619
  %84 = load ptr, ptr %8, align 8, !dbg !1620
  %85 = getelementptr inbounds nuw %struct.vms_vector, ptr %84, i32 0, i32 1, !dbg !1621
  store i32 %83, ptr %85, align 4, !dbg !1622
  br label %86, !dbg !1620

86:                                               ; preds = %80, %72
  %87 = load ptr, ptr %10, align 8, !dbg !1623
  %88 = getelementptr inbounds nuw %struct.vms_vector, ptr %87, i32 0, i32 2, !dbg !1625
  %89 = load i32, ptr %88, align 4, !dbg !1625
  %90 = load ptr, ptr %8, align 8, !dbg !1626
  %91 = getelementptr inbounds nuw %struct.vms_vector, ptr %90, i32 0, i32 2, !dbg !1627
  %92 = load i32, ptr %91, align 4, !dbg !1627
  %93 = icmp sgt i32 %89, %92, !dbg !1628
  br i1 %93, label %94, label %100, !dbg !1628

94:                                               ; preds = %86
  %95 = load ptr, ptr %10, align 8, !dbg !1629
  %96 = getelementptr inbounds nuw %struct.vms_vector, ptr %95, i32 0, i32 2, !dbg !1630
  %97 = load i32, ptr %96, align 4, !dbg !1630
  %98 = load ptr, ptr %8, align 8, !dbg !1631
  %99 = getelementptr inbounds nuw %struct.vms_vector, ptr %98, i32 0, i32 2, !dbg !1632
  store i32 %97, ptr %99, align 4, !dbg !1633
  br label %100, !dbg !1631

100:                                              ; preds = %94, %86
  %101 = load ptr, ptr %10, align 8, !dbg !1634
  %102 = getelementptr inbounds nuw %struct.vms_vector, ptr %101, i32 0, i32 0, !dbg !1636
  %103 = load i32, ptr %102, align 4, !dbg !1636
  %104 = load ptr, ptr %7, align 8, !dbg !1637
  %105 = getelementptr inbounds nuw %struct.vms_vector, ptr %104, i32 0, i32 0, !dbg !1638
  %106 = load i32, ptr %105, align 4, !dbg !1638
  %107 = icmp slt i32 %103, %106, !dbg !1639
  br i1 %107, label %108, label %114, !dbg !1639

108:                                              ; preds = %100
  %109 = load ptr, ptr %10, align 8, !dbg !1640
  %110 = getelementptr inbounds nuw %struct.vms_vector, ptr %109, i32 0, i32 0, !dbg !1641
  %111 = load i32, ptr %110, align 4, !dbg !1641
  %112 = load ptr, ptr %7, align 8, !dbg !1642
  %113 = getelementptr inbounds nuw %struct.vms_vector, ptr %112, i32 0, i32 0, !dbg !1643
  store i32 %111, ptr %113, align 4, !dbg !1644
  br label %114, !dbg !1642

114:                                              ; preds = %108, %100
  %115 = load ptr, ptr %10, align 8, !dbg !1645
  %116 = getelementptr inbounds nuw %struct.vms_vector, ptr %115, i32 0, i32 1, !dbg !1647
  %117 = load i32, ptr %116, align 4, !dbg !1647
  %118 = load ptr, ptr %7, align 8, !dbg !1648
  %119 = getelementptr inbounds nuw %struct.vms_vector, ptr %118, i32 0, i32 1, !dbg !1649
  %120 = load i32, ptr %119, align 4, !dbg !1649
  %121 = icmp slt i32 %117, %120, !dbg !1650
  br i1 %121, label %122, label %128, !dbg !1650

122:                                              ; preds = %114
  %123 = load ptr, ptr %10, align 8, !dbg !1651
  %124 = getelementptr inbounds nuw %struct.vms_vector, ptr %123, i32 0, i32 1, !dbg !1652
  %125 = load i32, ptr %124, align 4, !dbg !1652
  %126 = load ptr, ptr %7, align 8, !dbg !1653
  %127 = getelementptr inbounds nuw %struct.vms_vector, ptr %126, i32 0, i32 1, !dbg !1654
  store i32 %125, ptr %127, align 4, !dbg !1655
  br label %128, !dbg !1653

128:                                              ; preds = %122, %114
  %129 = load ptr, ptr %10, align 8, !dbg !1656
  %130 = getelementptr inbounds nuw %struct.vms_vector, ptr %129, i32 0, i32 2, !dbg !1658
  %131 = load i32, ptr %130, align 4, !dbg !1658
  %132 = load ptr, ptr %7, align 8, !dbg !1659
  %133 = getelementptr inbounds nuw %struct.vms_vector, ptr %132, i32 0, i32 2, !dbg !1660
  %134 = load i32, ptr %133, align 4, !dbg !1660
  %135 = icmp slt i32 %131, %134, !dbg !1661
  br i1 %135, label %136, label %142, !dbg !1661

136:                                              ; preds = %128
  %137 = load ptr, ptr %10, align 8, !dbg !1662
  %138 = getelementptr inbounds nuw %struct.vms_vector, ptr %137, i32 0, i32 2, !dbg !1663
  %139 = load i32, ptr %138, align 4, !dbg !1663
  %140 = load ptr, ptr %7, align 8, !dbg !1664
  %141 = getelementptr inbounds nuw %struct.vms_vector, ptr %140, i32 0, i32 2, !dbg !1665
  store i32 %139, ptr %141, align 4, !dbg !1666
  br label %142, !dbg !1664

142:                                              ; preds = %136, %128
  %143 = load ptr, ptr %10, align 8, !dbg !1667
  %144 = getelementptr inbounds nuw %struct.vms_vector, ptr %143, i32 1, !dbg !1667
  store ptr %144, ptr %10, align 8, !dbg !1667
  br label %54, !dbg !1597, !llvm.loop !1668

145:                                              ; preds = %54
  ret void, !dbg !1670
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11init_pointsP9polymodelP10vms_vectoriP10morph_data(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #1 !dbg !1671 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i16, align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1674, !DIExpression(), !1675)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1676, !DIExpression(), !1677)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1678, !DIExpression(), !1679)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !1680, !DIExpression(), !1681)
    #dbg_declare(ptr %9, !1682, !DIExpression(), !1683)
    #dbg_declare(ptr %10, !1684, !DIExpression(), !1685)
    #dbg_declare(ptr %11, !1686, !DIExpression(), !1687)
    #dbg_declare(ptr %12, !1688, !DIExpression(), !1689)
    #dbg_declare(ptr %13, !1690, !DIExpression(), !1691)
  %17 = load ptr, ptr %5, align 8, !dbg !1692
  %18 = getelementptr inbounds nuw %struct.polymodel, ptr %17, i32 0, i32 2, !dbg !1693
  %19 = load ptr, ptr %18, align 8, !dbg !1693
  %20 = load ptr, ptr %5, align 8, !dbg !1694
  %21 = getelementptr inbounds nuw %struct.polymodel, ptr %20, i32 0, i32 3, !dbg !1695
  %22 = load i32, ptr %7, align 4, !dbg !1696
  %23 = sext i32 %22 to i64, !dbg !1694
  %24 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %23, !dbg !1694
  %25 = load i32, ptr %24, align 4, !dbg !1694
  %26 = sext i32 %25 to i64, !dbg !1692
  %27 = getelementptr inbounds i8, ptr %19, i64 %26, !dbg !1692
  store ptr %27, ptr %11, align 8, !dbg !1697
  %28 = load ptr, ptr %11, align 8, !dbg !1698
  %29 = getelementptr inbounds nuw i16, ptr %28, i32 1, !dbg !1698
  store ptr %29, ptr %11, align 8, !dbg !1698
  %30 = load i16, ptr %28, align 2, !dbg !1699
  store i16 %30, ptr %12, align 2, !dbg !1700
  %31 = load i16, ptr %12, align 2, !dbg !1701
  %32 = zext i16 %31 to i32, !dbg !1701
  %33 = icmp eq i32 %32, 7, !dbg !1701
  br i1 %33, label %38, label %34, !dbg !1701

34:                                               ; preds = %4
  %35 = load i16, ptr %12, align 2, !dbg !1701
  %36 = zext i16 %35 to i32, !dbg !1701
  %37 = icmp eq i32 %36, 1, !dbg !1701
  br label %38, !dbg !1701

38:                                               ; preds = %34, %4
  %39 = phi i1 [ true, %4 ], [ %37, %34 ]
  %40 = zext i1 %39 to i32, !dbg !1701
  call void @_Z7_AssertiPKcS0_i(i32 noundef %40, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 112), !dbg !1701
  %41 = load ptr, ptr %11, align 8, !dbg !1702
  %42 = getelementptr inbounds nuw i16, ptr %41, i32 1, !dbg !1702
  store ptr %42, ptr %11, align 8, !dbg !1702
  %43 = load i16, ptr %41, align 2, !dbg !1703
  store i16 %43, ptr %9, align 2, !dbg !1704
  %44 = load ptr, ptr %8, align 8, !dbg !1705
  %45 = getelementptr inbounds nuw %struct.morph_data, ptr %44, i32 0, i32 5, !dbg !1706
  %46 = load i32, ptr %7, align 4, !dbg !1707
  %47 = sext i32 %46 to i64, !dbg !1705
  %48 = getelementptr inbounds [10 x i32], ptr %45, i64 0, i64 %47, !dbg !1705
  store i32 0, ptr %48, align 4, !dbg !1708
  %49 = load i16, ptr %12, align 2, !dbg !1709
  %50 = zext i16 %49 to i32, !dbg !1709
  %51 = icmp eq i32 %50, 7, !dbg !1711
  br i1 %51, label %52, label %59, !dbg !1711

52:                                               ; preds = %38
  %53 = load ptr, ptr %11, align 8, !dbg !1712
  %54 = getelementptr inbounds nuw i16, ptr %53, i32 1, !dbg !1712
  store ptr %54, ptr %11, align 8, !dbg !1712
  %55 = load i16, ptr %53, align 2, !dbg !1714
  %56 = zext i16 %55 to i32, !dbg !1714
  store i32 %56, ptr %13, align 4, !dbg !1715
  %57 = load ptr, ptr %11, align 8, !dbg !1716
  %58 = getelementptr inbounds nuw i16, ptr %57, i32 1, !dbg !1716
  store ptr %58, ptr %11, align 8, !dbg !1716
  br label %60, !dbg !1717

59:                                               ; preds = %38
  store i32 0, ptr %13, align 4, !dbg !1718
  br label %60

60:                                               ; preds = %59, %52
  %61 = load i32, ptr %13, align 4, !dbg !1719
  %62 = load i16, ptr %9, align 2, !dbg !1719
  %63 = zext i16 %62 to i32, !dbg !1719
  %64 = add nsw i32 %61, %63, !dbg !1719
  %65 = icmp slt i32 %64, 1000, !dbg !1719
  %66 = zext i1 %65 to i32, !dbg !1719
  call void @_Z7_AssertiPKcS0_i(i32 noundef %66, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 126), !dbg !1719
  %67 = load i32, ptr %13, align 4, !dbg !1720
  %68 = load ptr, ptr %8, align 8, !dbg !1721
  %69 = getelementptr inbounds nuw %struct.morph_data, ptr %68, i32 0, i32 6, !dbg !1722
  %70 = load i32, ptr %7, align 4, !dbg !1723
  %71 = sext i32 %70 to i64, !dbg !1721
  %72 = getelementptr inbounds [10 x i32], ptr %69, i64 0, i64 %71, !dbg !1721
  store i32 %67, ptr %72, align 4, !dbg !1724
  %73 = load ptr, ptr %11, align 8, !dbg !1725
  store ptr %73, ptr %10, align 8, !dbg !1726
  br label %74, !dbg !1727

74:                                               ; preds = %218, %60
  %75 = load i16, ptr %9, align 2, !dbg !1728
  %76 = add i16 %75, -1, !dbg !1728
  store i16 %76, ptr %9, align 2, !dbg !1728
  %77 = icmp ne i16 %75, 0, !dbg !1729
  br i1 %77, label %78, label %230, !dbg !1727

78:                                               ; preds = %74
    #dbg_declare(ptr %14, !1730, !DIExpression(), !1732)
    #dbg_declare(ptr %15, !1733, !DIExpression(), !1734)
  %79 = load ptr, ptr %6, align 8, !dbg !1735
  %80 = icmp ne ptr %79, null, !dbg !1735
  br i1 %80, label %81, label %173, !dbg !1735

81:                                               ; preds = %78
    #dbg_declare(ptr %16, !1737, !DIExpression(), !1739)
  store i32 2147483647, ptr %14, align 4, !dbg !1740
  %82 = load ptr, ptr %10, align 8, !dbg !1741
  %83 = getelementptr inbounds nuw %struct.vms_vector, ptr %82, i32 0, i32 0, !dbg !1743
  %84 = load i32, ptr %83, align 4, !dbg !1743
  %85 = icmp ne i32 %84, 0, !dbg !1741
  br i1 %85, label %86, label %110, !dbg !1744

86:                                               ; preds = %81
  %87 = load ptr, ptr %6, align 8, !dbg !1745
  %88 = getelementptr inbounds nuw %struct.vms_vector, ptr %87, i32 0, i32 0, !dbg !1746
  %89 = load i32, ptr %88, align 4, !dbg !1746
  %90 = call noundef i32 @_Z3f2ii(i32 noundef %89), !dbg !1747
  %91 = load ptr, ptr %10, align 8, !dbg !1748
  %92 = getelementptr inbounds nuw %struct.vms_vector, ptr %91, i32 0, i32 0, !dbg !1749
  %93 = load i32, ptr %92, align 4, !dbg !1749
  %94 = call i32 @llvm.abs.i32(i32 %93, i1 true), !dbg !1750
  %95 = sdiv i32 %94, 2, !dbg !1751
  %96 = icmp slt i32 %90, %95, !dbg !1752
  br i1 %96, label %97, label %110, !dbg !1753

97:                                               ; preds = %86
  %98 = load ptr, ptr %6, align 8, !dbg !1754
  %99 = getelementptr inbounds nuw %struct.vms_vector, ptr %98, i32 0, i32 0, !dbg !1755
  %100 = load i32, ptr %99, align 4, !dbg !1755
  %101 = load ptr, ptr %10, align 8, !dbg !1756
  %102 = getelementptr inbounds nuw %struct.vms_vector, ptr %101, i32 0, i32 0, !dbg !1757
  %103 = load i32, ptr %102, align 4, !dbg !1757
  %104 = call i32 @llvm.abs.i32(i32 %103, i1 true), !dbg !1758
  %105 = call noundef i32 @_Z6fixdivii(i32 noundef %100, i32 noundef %104), !dbg !1759
  store i32 %105, ptr %16, align 4, !dbg !1760
  %106 = load i32, ptr %14, align 4, !dbg !1761
  %107 = icmp slt i32 %105, %106, !dbg !1762
  br i1 %107, label %108, label %110, !dbg !1753

108:                                              ; preds = %97
  %109 = load i32, ptr %16, align 4, !dbg !1763
  store i32 %109, ptr %14, align 4, !dbg !1764
  br label %110, !dbg !1765

110:                                              ; preds = %108, %97, %86, %81
  %111 = load ptr, ptr %10, align 8, !dbg !1766
  %112 = getelementptr inbounds nuw %struct.vms_vector, ptr %111, i32 0, i32 1, !dbg !1768
  %113 = load i32, ptr %112, align 4, !dbg !1768
  %114 = icmp ne i32 %113, 0, !dbg !1766
  br i1 %114, label %115, label %139, !dbg !1769

115:                                              ; preds = %110
  %116 = load ptr, ptr %6, align 8, !dbg !1770
  %117 = getelementptr inbounds nuw %struct.vms_vector, ptr %116, i32 0, i32 1, !dbg !1771
  %118 = load i32, ptr %117, align 4, !dbg !1771
  %119 = call noundef i32 @_Z3f2ii(i32 noundef %118), !dbg !1772
  %120 = load ptr, ptr %10, align 8, !dbg !1773
  %121 = getelementptr inbounds nuw %struct.vms_vector, ptr %120, i32 0, i32 1, !dbg !1774
  %122 = load i32, ptr %121, align 4, !dbg !1774
  %123 = call i32 @llvm.abs.i32(i32 %122, i1 true), !dbg !1775
  %124 = sdiv i32 %123, 2, !dbg !1776
  %125 = icmp slt i32 %119, %124, !dbg !1777
  br i1 %125, label %126, label %139, !dbg !1778

126:                                              ; preds = %115
  %127 = load ptr, ptr %6, align 8, !dbg !1779
  %128 = getelementptr inbounds nuw %struct.vms_vector, ptr %127, i32 0, i32 1, !dbg !1780
  %129 = load i32, ptr %128, align 4, !dbg !1780
  %130 = load ptr, ptr %10, align 8, !dbg !1781
  %131 = getelementptr inbounds nuw %struct.vms_vector, ptr %130, i32 0, i32 1, !dbg !1782
  %132 = load i32, ptr %131, align 4, !dbg !1782
  %133 = call i32 @llvm.abs.i32(i32 %132, i1 true), !dbg !1783
  %134 = call noundef i32 @_Z6fixdivii(i32 noundef %129, i32 noundef %133), !dbg !1784
  store i32 %134, ptr %16, align 4, !dbg !1785
  %135 = load i32, ptr %14, align 4, !dbg !1786
  %136 = icmp slt i32 %134, %135, !dbg !1787
  br i1 %136, label %137, label %139, !dbg !1778

137:                                              ; preds = %126
  %138 = load i32, ptr %16, align 4, !dbg !1788
  store i32 %138, ptr %14, align 4, !dbg !1789
  br label %139, !dbg !1790

139:                                              ; preds = %137, %126, %115, %110
  %140 = load ptr, ptr %10, align 8, !dbg !1791
  %141 = getelementptr inbounds nuw %struct.vms_vector, ptr %140, i32 0, i32 2, !dbg !1793
  %142 = load i32, ptr %141, align 4, !dbg !1793
  %143 = icmp ne i32 %142, 0, !dbg !1791
  br i1 %143, label %144, label %168, !dbg !1794

144:                                              ; preds = %139
  %145 = load ptr, ptr %6, align 8, !dbg !1795
  %146 = getelementptr inbounds nuw %struct.vms_vector, ptr %145, i32 0, i32 2, !dbg !1796
  %147 = load i32, ptr %146, align 4, !dbg !1796
  %148 = call noundef i32 @_Z3f2ii(i32 noundef %147), !dbg !1797
  %149 = load ptr, ptr %10, align 8, !dbg !1798
  %150 = getelementptr inbounds nuw %struct.vms_vector, ptr %149, i32 0, i32 2, !dbg !1799
  %151 = load i32, ptr %150, align 4, !dbg !1799
  %152 = call i32 @llvm.abs.i32(i32 %151, i1 true), !dbg !1800
  %153 = sdiv i32 %152, 2, !dbg !1801
  %154 = icmp slt i32 %148, %153, !dbg !1802
  br i1 %154, label %155, label %168, !dbg !1803

155:                                              ; preds = %144
  %156 = load ptr, ptr %6, align 8, !dbg !1804
  %157 = getelementptr inbounds nuw %struct.vms_vector, ptr %156, i32 0, i32 2, !dbg !1805
  %158 = load i32, ptr %157, align 4, !dbg !1805
  %159 = load ptr, ptr %10, align 8, !dbg !1806
  %160 = getelementptr inbounds nuw %struct.vms_vector, ptr %159, i32 0, i32 2, !dbg !1807
  %161 = load i32, ptr %160, align 4, !dbg !1807
  %162 = call i32 @llvm.abs.i32(i32 %161, i1 true), !dbg !1808
  %163 = call noundef i32 @_Z6fixdivii(i32 noundef %158, i32 noundef %162), !dbg !1809
  store i32 %163, ptr %16, align 4, !dbg !1810
  %164 = load i32, ptr %14, align 4, !dbg !1811
  %165 = icmp slt i32 %163, %164, !dbg !1812
  br i1 %165, label %166, label %168, !dbg !1803

166:                                              ; preds = %155
  %167 = load i32, ptr %16, align 4, !dbg !1813
  store i32 %167, ptr %14, align 4, !dbg !1814
  br label %168, !dbg !1815

168:                                              ; preds = %166, %155, %144, %139
  %169 = load i32, ptr %14, align 4, !dbg !1816
  %170 = icmp eq i32 %169, 2147483647, !dbg !1818
  br i1 %170, label %171, label %172, !dbg !1818

171:                                              ; preds = %168
  store i32 0, ptr %14, align 4, !dbg !1819
  br label %172, !dbg !1820

172:                                              ; preds = %171, %168
  br label %174, !dbg !1821

173:                                              ; preds = %78
  store i32 0, ptr %14, align 4, !dbg !1822
  br label %174

174:                                              ; preds = %173, %172
  %175 = load ptr, ptr %8, align 8, !dbg !1823
  %176 = getelementptr inbounds nuw %struct.morph_data, ptr %175, i32 0, i32 1, !dbg !1824
  %177 = load i32, ptr %13, align 4, !dbg !1825
  %178 = sext i32 %177 to i64, !dbg !1823
  %179 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %176, i64 0, i64 %178, !dbg !1823
  %180 = load ptr, ptr %10, align 8, !dbg !1826
  %181 = load i32, ptr %14, align 4, !dbg !1827
  %182 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %179, ptr noundef %180, i32 noundef %181), !dbg !1828
  %183 = load ptr, ptr %8, align 8, !dbg !1829
  %184 = getelementptr inbounds nuw %struct.morph_data, ptr %183, i32 0, i32 2, !dbg !1830
  %185 = load i32, ptr %13, align 4, !dbg !1831
  %186 = sext i32 %185 to i64, !dbg !1829
  %187 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %184, i64 0, i64 %186, !dbg !1829
  %188 = load ptr, ptr %10, align 8, !dbg !1832
  %189 = load ptr, ptr %8, align 8, !dbg !1833
  %190 = getelementptr inbounds nuw %struct.morph_data, ptr %189, i32 0, i32 1, !dbg !1834
  %191 = load i32, ptr %13, align 4, !dbg !1835
  %192 = sext i32 %191 to i64, !dbg !1833
  %193 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %190, i64 0, i64 %192, !dbg !1833
  %194 = call noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef %187, ptr noundef %188, ptr noundef %193), !dbg !1836
  store i32 %194, ptr %15, align 4, !dbg !1837
  %195 = load i32, ptr %15, align 4, !dbg !1838
  %196 = load i32, ptr @morph_rate, align 4, !dbg !1839
  %197 = call noundef i32 @_Z6fixdivii(i32 noundef %195, i32 noundef %196), !dbg !1840
  %198 = load ptr, ptr %8, align 8, !dbg !1841
  %199 = getelementptr inbounds nuw %struct.morph_data, ptr %198, i32 0, i32 3, !dbg !1842
  %200 = load i32, ptr %13, align 4, !dbg !1843
  %201 = sext i32 %200 to i64, !dbg !1841
  %202 = getelementptr inbounds [1000 x i32], ptr %199, i64 0, i64 %201, !dbg !1841
  store i32 %197, ptr %202, align 4, !dbg !1844
  %203 = load ptr, ptr %8, align 8, !dbg !1845
  %204 = getelementptr inbounds nuw %struct.morph_data, ptr %203, i32 0, i32 3, !dbg !1847
  %205 = load i32, ptr %13, align 4, !dbg !1848
  %206 = sext i32 %205 to i64, !dbg !1845
  %207 = getelementptr inbounds [1000 x i32], ptr %204, i64 0, i64 %206, !dbg !1845
  %208 = load i32, ptr %207, align 4, !dbg !1845
  %209 = icmp ne i32 %208, 0, !dbg !1849
  br i1 %209, label %210, label %218, !dbg !1849

210:                                              ; preds = %174
  %211 = load ptr, ptr %8, align 8, !dbg !1850
  %212 = getelementptr inbounds nuw %struct.morph_data, ptr %211, i32 0, i32 5, !dbg !1851
  %213 = load i32, ptr %7, align 4, !dbg !1852
  %214 = sext i32 %213 to i64, !dbg !1850
  %215 = getelementptr inbounds [10 x i32], ptr %212, i64 0, i64 %214, !dbg !1850
  %216 = load i32, ptr %215, align 4, !dbg !1853
  %217 = add nsw i32 %216, 1, !dbg !1853
  store i32 %217, ptr %215, align 4, !dbg !1853
  br label %218, !dbg !1850

218:                                              ; preds = %210, %174
  %219 = load ptr, ptr %8, align 8, !dbg !1854
  %220 = getelementptr inbounds nuw %struct.morph_data, ptr %219, i32 0, i32 2, !dbg !1855
  %221 = load i32, ptr %13, align 4, !dbg !1856
  %222 = sext i32 %221 to i64, !dbg !1854
  %223 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %220, i64 0, i64 %222, !dbg !1854
  %224 = load i32, ptr @morph_rate, align 4, !dbg !1857
  %225 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %223, i32 noundef %224), !dbg !1858
  %226 = load ptr, ptr %10, align 8, !dbg !1859
  %227 = getelementptr inbounds nuw %struct.vms_vector, ptr %226, i32 1, !dbg !1859
  store ptr %227, ptr %10, align 8, !dbg !1859
  %228 = load i32, ptr %13, align 4, !dbg !1860
  %229 = add nsw i32 %228, 1, !dbg !1860
  store i32 %229, ptr %13, align 4, !dbg !1860
  br label %74, !dbg !1727, !llvm.loop !1861

230:                                              ; preds = %74
  ret void, !dbg !1863
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #0 !dbg !1864 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !1867, !DIExpression(), !1868)
  %3 = load i32, ptr %2, align 4, !dbg !1869
  %4 = ashr i32 %3, 16, !dbg !1870
  ret i32 %4, !dbg !1871
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #0 !dbg !1872 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !1875, !DIExpression(), !1876)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1877, !DIExpression(), !1878)
  %6 = load i32, ptr %5, align 4, !dbg !1879
  %7 = icmp eq i32 %6, 0, !dbg !1881
  br i1 %7, label %8, label %9, !dbg !1881

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !1882
  br label %17, !dbg !1882

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !1883
  %11 = sext i32 %10 to i64, !dbg !1883
  %12 = shl i64 %11, 16, !dbg !1884
  %13 = load i32, ptr %5, align 4, !dbg !1885
  %14 = sext i32 %13 to i64, !dbg !1885
  %15 = sdiv i64 %12, %14, !dbg !1886
  %16 = trunc i64 %15 to i32, !dbg !1887
  store i32 %16, ptr %3, align 4, !dbg !1888
  br label %17, !dbg !1888

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !1889
  ret i32 %18, !dbg !1889
}

declare noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #2

declare noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #2

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13update_pointsP9polymodeliP10morph_data(ptr noundef %0, i32 noundef %1, ptr noundef %2) #1 !dbg !1890 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i16, align 2
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i16, align 2
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1893, !DIExpression(), !1894)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1895, !DIExpression(), !1896)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !1897, !DIExpression(), !1898)
    #dbg_declare(ptr %7, !1899, !DIExpression(), !1900)
    #dbg_declare(ptr %8, !1901, !DIExpression(), !1902)
    #dbg_declare(ptr %9, !1903, !DIExpression(), !1904)
    #dbg_declare(ptr %10, !1905, !DIExpression(), !1906)
    #dbg_declare(ptr %11, !1907, !DIExpression(), !1908)
  %12 = load ptr, ptr %4, align 8, !dbg !1909
  %13 = getelementptr inbounds nuw %struct.polymodel, ptr %12, i32 0, i32 2, !dbg !1910
  %14 = load ptr, ptr %13, align 8, !dbg !1910
  %15 = load ptr, ptr %4, align 8, !dbg !1911
  %16 = getelementptr inbounds nuw %struct.polymodel, ptr %15, i32 0, i32 3, !dbg !1912
  %17 = load i32, ptr %5, align 4, !dbg !1913
  %18 = sext i32 %17 to i64, !dbg !1911
  %19 = getelementptr inbounds [10 x i32], ptr %16, i64 0, i64 %18, !dbg !1911
  %20 = load i32, ptr %19, align 4, !dbg !1911
  %21 = sext i32 %20 to i64, !dbg !1909
  %22 = getelementptr inbounds i8, ptr %14, i64 %21, !dbg !1909
  store ptr %22, ptr %9, align 8, !dbg !1914
  %23 = load ptr, ptr %9, align 8, !dbg !1915
  %24 = getelementptr inbounds nuw i16, ptr %23, i32 1, !dbg !1915
  store ptr %24, ptr %9, align 8, !dbg !1915
  %25 = load i16, ptr %23, align 2, !dbg !1916
  store i16 %25, ptr %10, align 2, !dbg !1917
  %26 = load i16, ptr %10, align 2, !dbg !1918
  %27 = zext i16 %26 to i32, !dbg !1918
  %28 = icmp eq i32 %27, 7, !dbg !1918
  br i1 %28, label %33, label %29, !dbg !1918

29:                                               ; preds = %3
  %30 = load i16, ptr %10, align 2, !dbg !1918
  %31 = zext i16 %30 to i32, !dbg !1918
  %32 = icmp eq i32 %31, 1, !dbg !1918
  br label %33, !dbg !1918

33:                                               ; preds = %29, %3
  %34 = phi i1 [ true, %3 ], [ %32, %29 ]
  %35 = zext i1 %34 to i32, !dbg !1918
  call void @_Z7_AssertiPKcS0_i(i32 noundef %35, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 200), !dbg !1918
  %36 = load ptr, ptr %9, align 8, !dbg !1919
  %37 = getelementptr inbounds nuw i16, ptr %36, i32 1, !dbg !1919
  store ptr %37, ptr %9, align 8, !dbg !1919
  %38 = load i16, ptr %36, align 2, !dbg !1920
  store i16 %38, ptr %7, align 2, !dbg !1921
  %39 = load i16, ptr %10, align 2, !dbg !1922
  %40 = zext i16 %39 to i32, !dbg !1922
  %41 = icmp eq i32 %40, 7, !dbg !1924
  br i1 %41, label %42, label %49, !dbg !1924

42:                                               ; preds = %33
  %43 = load ptr, ptr %9, align 8, !dbg !1925
  %44 = getelementptr inbounds nuw i16, ptr %43, i32 1, !dbg !1925
  store ptr %44, ptr %9, align 8, !dbg !1925
  %45 = load i16, ptr %43, align 2, !dbg !1927
  %46 = zext i16 %45 to i32, !dbg !1927
  store i32 %46, ptr %11, align 4, !dbg !1928
  %47 = load ptr, ptr %9, align 8, !dbg !1929
  %48 = getelementptr inbounds nuw i16, ptr %47, i32 1, !dbg !1929
  store ptr %48, ptr %9, align 8, !dbg !1929
  br label %50, !dbg !1930

49:                                               ; preds = %33
  store i32 0, ptr %11, align 4, !dbg !1931
  br label %50

50:                                               ; preds = %49, %42
  %51 = load ptr, ptr %9, align 8, !dbg !1932
  store ptr %51, ptr %8, align 8, !dbg !1933
  br label %52, !dbg !1934

52:                                               ; preds = %107, %50
  %53 = load i16, ptr %7, align 2, !dbg !1935
  %54 = add i16 %53, -1, !dbg !1935
  store i16 %54, ptr %7, align 2, !dbg !1935
  %55 = icmp ne i16 %53, 0, !dbg !1936
  br i1 %55, label %56, label %112, !dbg !1934

56:                                               ; preds = %52
  %57 = load ptr, ptr %6, align 8, !dbg !1937
  %58 = getelementptr inbounds nuw %struct.morph_data, ptr %57, i32 0, i32 3, !dbg !1940
  %59 = load i32, ptr %11, align 4, !dbg !1941
  %60 = sext i32 %59 to i64, !dbg !1937
  %61 = getelementptr inbounds [1000 x i32], ptr %58, i64 0, i64 %60, !dbg !1937
  %62 = load i32, ptr %61, align 4, !dbg !1937
  %63 = icmp ne i32 %62, 0, !dbg !1937
  br i1 %63, label %64, label %107, !dbg !1937

64:                                               ; preds = %56
  %65 = load i32, ptr @FrameTime, align 4, !dbg !1942
  %66 = load ptr, ptr %6, align 8, !dbg !1944
  %67 = getelementptr inbounds nuw %struct.morph_data, ptr %66, i32 0, i32 3, !dbg !1945
  %68 = load i32, ptr %11, align 4, !dbg !1946
  %69 = sext i32 %68 to i64, !dbg !1944
  %70 = getelementptr inbounds [1000 x i32], ptr %67, i64 0, i64 %69, !dbg !1944
  %71 = load i32, ptr %70, align 4, !dbg !1947
  %72 = sub nsw i32 %71, %65, !dbg !1947
  store i32 %72, ptr %70, align 4, !dbg !1947
  %73 = icmp sle i32 %72, 0, !dbg !1948
  br i1 %73, label %74, label %93, !dbg !1948

74:                                               ; preds = %64
  %75 = load ptr, ptr %8, align 8, !dbg !1949
  %76 = load ptr, ptr %6, align 8, !dbg !1951
  %77 = getelementptr inbounds nuw %struct.morph_data, ptr %76, i32 0, i32 1, !dbg !1952
  %78 = load i32, ptr %11, align 4, !dbg !1953
  %79 = sext i32 %78 to i64, !dbg !1951
  %80 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %77, i64 0, i64 %79, !dbg !1951
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %80, ptr align 4 %75, i64 12, i1 false), !dbg !1954
  %81 = load ptr, ptr %6, align 8, !dbg !1955
  %82 = getelementptr inbounds nuw %struct.morph_data, ptr %81, i32 0, i32 3, !dbg !1956
  %83 = load i32, ptr %11, align 4, !dbg !1957
  %84 = sext i32 %83 to i64, !dbg !1955
  %85 = getelementptr inbounds [1000 x i32], ptr %82, i64 0, i64 %84, !dbg !1955
  store i32 0, ptr %85, align 4, !dbg !1958
  %86 = load ptr, ptr %6, align 8, !dbg !1959
  %87 = getelementptr inbounds nuw %struct.morph_data, ptr %86, i32 0, i32 5, !dbg !1960
  %88 = load i32, ptr %5, align 4, !dbg !1961
  %89 = sext i32 %88 to i64, !dbg !1959
  %90 = getelementptr inbounds [10 x i32], ptr %87, i64 0, i64 %89, !dbg !1959
  %91 = load i32, ptr %90, align 4, !dbg !1962
  %92 = add nsw i32 %91, -1, !dbg !1962
  store i32 %92, ptr %90, align 4, !dbg !1962
  br label %106, !dbg !1963

93:                                               ; preds = %64
  %94 = load ptr, ptr %6, align 8, !dbg !1964
  %95 = getelementptr inbounds nuw %struct.morph_data, ptr %94, i32 0, i32 1, !dbg !1965
  %96 = load i32, ptr %11, align 4, !dbg !1966
  %97 = sext i32 %96 to i64, !dbg !1964
  %98 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %95, i64 0, i64 %97, !dbg !1964
  %99 = load ptr, ptr %6, align 8, !dbg !1967
  %100 = getelementptr inbounds nuw %struct.morph_data, ptr %99, i32 0, i32 2, !dbg !1968
  %101 = load i32, ptr %11, align 4, !dbg !1969
  %102 = sext i32 %101 to i64, !dbg !1967
  %103 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %100, i64 0, i64 %102, !dbg !1967
  %104 = load i32, ptr @FrameTime, align 4, !dbg !1970
  %105 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %98, ptr noundef %103, i32 noundef %104), !dbg !1971
  br label %106

106:                                              ; preds = %93, %74
  br label %107, !dbg !1972

107:                                              ; preds = %106, %56
  %108 = load ptr, ptr %8, align 8, !dbg !1973
  %109 = getelementptr inbounds nuw %struct.vms_vector, ptr %108, i32 1, !dbg !1973
  store ptr %109, ptr %8, align 8, !dbg !1973
  %110 = load i32, ptr %11, align 4, !dbg !1974
  %111 = add nsw i32 %110, 1, !dbg !1974
  store i32 %111, ptr %11, align 4, !dbg !1974
  br label %52, !dbg !1934, !llvm.loop !1975

112:                                              ; preds = %52
  ret void, !dbg !1977
}

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14do_morph_frameP6object(ptr noundef %0) #1 !dbg !1978 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1981, !DIExpression(), !1982)
    #dbg_declare(ptr %3, !1983, !DIExpression(), !1984)
    #dbg_declare(ptr %4, !1985, !DIExpression(), !1986)
    #dbg_declare(ptr %5, !1987, !DIExpression(), !1988)
  %7 = load ptr, ptr %2, align 8, !dbg !1989
  %8 = call noundef ptr @_Z15find_morph_dataP6object(ptr noundef %7), !dbg !1990
  store ptr %8, ptr %5, align 8, !dbg !1991
  %9 = load ptr, ptr %5, align 8, !dbg !1992
  %10 = icmp eq ptr %9, null, !dbg !1994
  br i1 %10, label %11, label %18, !dbg !1994

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8, !dbg !1995
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 8, !dbg !1997
  %14 = load i8, ptr %13, align 1, !dbg !1998
  %15 = zext i8 %14 to i32, !dbg !1998
  %16 = or i32 %15, 2, !dbg !1998
  %17 = trunc i32 %16 to i8, !dbg !1998
  store i8 %17, ptr %13, align 1, !dbg !1998
  br label %133, !dbg !1999

18:                                               ; preds = %1
  %19 = load ptr, ptr %5, align 8, !dbg !2000
  %20 = getelementptr inbounds nuw %struct.morph_data, ptr %19, i32 0, i32 0, !dbg !2001
  %21 = load ptr, ptr %20, align 8, !dbg !2001
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 23, !dbg !2002
  %23 = getelementptr inbounds nuw %struct.polyobj_info, ptr %22, i32 0, i32 0, !dbg !2003
  %24 = load i32, ptr %23, align 4, !dbg !2003
  %25 = sext i32 %24 to i64, !dbg !2004
  %26 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %25, !dbg !2004
  store ptr %26, ptr %4, align 8, !dbg !2005
  store i32 0, ptr %3, align 4, !dbg !2006
  br label %27, !dbg !2008

27:                                               ; preds = %98, %18
  %28 = load i32, ptr %3, align 4, !dbg !2009
  %29 = load ptr, ptr %4, align 8, !dbg !2011
  %30 = getelementptr inbounds nuw %struct.polymodel, ptr %29, i32 0, i32 0, !dbg !2012
  %31 = load i32, ptr %30, align 8, !dbg !2012
  %32 = icmp slt i32 %28, %31, !dbg !2013
  br i1 %32, label %33, label %101, !dbg !2014

33:                                               ; preds = %27
  %34 = load ptr, ptr %5, align 8, !dbg !2015
  %35 = getelementptr inbounds nuw %struct.morph_data, ptr %34, i32 0, i32 4, !dbg !2017
  %36 = load i32, ptr %3, align 4, !dbg !2018
  %37 = sext i32 %36 to i64, !dbg !2015
  %38 = getelementptr inbounds [10 x i32], ptr %35, i64 0, i64 %37, !dbg !2015
  %39 = load i32, ptr %38, align 4, !dbg !2015
  %40 = icmp eq i32 %39, 1, !dbg !2019
  br i1 %40, label %41, label %97, !dbg !2019

41:                                               ; preds = %33
  %42 = load ptr, ptr %4, align 8, !dbg !2020
  %43 = load i32, ptr %3, align 4, !dbg !2022
  %44 = load ptr, ptr %5, align 8, !dbg !2023
  call void @_Z13update_pointsP9polymodeliP10morph_data(ptr noundef %42, i32 noundef %43, ptr noundef %44), !dbg !2024
  %45 = load ptr, ptr %5, align 8, !dbg !2025
  %46 = getelementptr inbounds nuw %struct.morph_data, ptr %45, i32 0, i32 5, !dbg !2027
  %47 = load i32, ptr %3, align 4, !dbg !2028
  %48 = sext i32 %47 to i64, !dbg !2025
  %49 = getelementptr inbounds [10 x i32], ptr %46, i64 0, i64 %48, !dbg !2025
  %50 = load i32, ptr %49, align 4, !dbg !2025
  %51 = icmp eq i32 %50, 0, !dbg !2029
  br i1 %51, label %52, label %96, !dbg !2029

52:                                               ; preds = %41
    #dbg_declare(ptr %6, !2030, !DIExpression(), !2032)
  %53 = load ptr, ptr %5, align 8, !dbg !2033
  %54 = getelementptr inbounds nuw %struct.morph_data, ptr %53, i32 0, i32 4, !dbg !2034
  %55 = load i32, ptr %3, align 4, !dbg !2035
  %56 = sext i32 %55 to i64, !dbg !2033
  %57 = getelementptr inbounds [10 x i32], ptr %54, i64 0, i64 %56, !dbg !2033
  store i32 2, ptr %57, align 4, !dbg !2036
  %58 = load ptr, ptr %5, align 8, !dbg !2037
  %59 = getelementptr inbounds nuw %struct.morph_data, ptr %58, i32 0, i32 7, !dbg !2038
  %60 = load i32, ptr %59, align 8, !dbg !2039
  %61 = add nsw i32 %60, -1, !dbg !2039
  store i32 %61, ptr %59, align 8, !dbg !2039
  store i32 0, ptr %6, align 4, !dbg !2040
  br label %62, !dbg !2042

62:                                               ; preds = %92, %52
  %63 = load i32, ptr %6, align 4, !dbg !2043
  %64 = load ptr, ptr %4, align 8, !dbg !2045
  %65 = getelementptr inbounds nuw %struct.polymodel, ptr %64, i32 0, i32 0, !dbg !2046
  %66 = load i32, ptr %65, align 8, !dbg !2046
  %67 = icmp slt i32 %63, %66, !dbg !2047
  br i1 %67, label %68, label %95, !dbg !2048

68:                                               ; preds = %62
  %69 = load ptr, ptr %4, align 8, !dbg !2049
  %70 = getelementptr inbounds nuw %struct.polymodel, ptr %69, i32 0, i32 8, !dbg !2051
  %71 = load i32, ptr %6, align 4, !dbg !2052
  %72 = sext i32 %71 to i64, !dbg !2049
  %73 = getelementptr inbounds [10 x i8], ptr %70, i64 0, i64 %72, !dbg !2049
  %74 = load i8, ptr %73, align 1, !dbg !2049
  %75 = zext i8 %74 to i32, !dbg !2049
  %76 = load i32, ptr %3, align 4, !dbg !2053
  %77 = icmp eq i32 %75, %76, !dbg !2054
  br i1 %77, label %78, label %91, !dbg !2054

78:                                               ; preds = %68
  %79 = load ptr, ptr %4, align 8, !dbg !2055
  %80 = load i32, ptr %6, align 4, !dbg !2057
  %81 = load ptr, ptr %5, align 8, !dbg !2058
  call void @_Z11init_pointsP9polymodelP10vms_vectoriP10morph_data(ptr noundef %79, ptr noundef null, i32 noundef %80, ptr noundef %81), !dbg !2059
  %82 = load ptr, ptr %5, align 8, !dbg !2060
  %83 = getelementptr inbounds nuw %struct.morph_data, ptr %82, i32 0, i32 7, !dbg !2061
  %84 = load i32, ptr %83, align 8, !dbg !2062
  %85 = add nsw i32 %84, 1, !dbg !2062
  store i32 %85, ptr %83, align 8, !dbg !2062
  %86 = load ptr, ptr %5, align 8, !dbg !2063
  %87 = getelementptr inbounds nuw %struct.morph_data, ptr %86, i32 0, i32 4, !dbg !2064
  %88 = load i32, ptr %6, align 4, !dbg !2065
  %89 = sext i32 %88 to i64, !dbg !2063
  %90 = getelementptr inbounds [10 x i32], ptr %87, i64 0, i64 %89, !dbg !2063
  store i32 1, ptr %90, align 4, !dbg !2066
  br label %91, !dbg !2067

91:                                               ; preds = %78, %68
  br label %92, !dbg !2053

92:                                               ; preds = %91
  %93 = load i32, ptr %6, align 4, !dbg !2068
  %94 = add nsw i32 %93, 1, !dbg !2068
  store i32 %94, ptr %6, align 4, !dbg !2068
  br label %62, !dbg !2069, !llvm.loop !2070

95:                                               ; preds = %62
  br label %96, !dbg !2072

96:                                               ; preds = %95, %41
  br label %97, !dbg !2073

97:                                               ; preds = %96, %33
  br label %98, !dbg !2074

98:                                               ; preds = %97
  %99 = load i32, ptr %3, align 4, !dbg !2075
  %100 = add nsw i32 %99, 1, !dbg !2075
  store i32 %100, ptr %3, align 4, !dbg !2075
  br label %27, !dbg !2076, !llvm.loop !2077

101:                                              ; preds = %27
  %102 = load ptr, ptr %5, align 8, !dbg !2079
  %103 = getelementptr inbounds nuw %struct.morph_data, ptr %102, i32 0, i32 7, !dbg !2081
  %104 = load i32, ptr %103, align 8, !dbg !2081
  %105 = icmp ne i32 %104, 0, !dbg !2079
  br i1 %105, label %133, label %106, !dbg !2082

106:                                              ; preds = %101
  %107 = load ptr, ptr %5, align 8, !dbg !2083
  %108 = getelementptr inbounds nuw %struct.morph_data, ptr %107, i32 0, i32 8, !dbg !2085
  %109 = load i8, ptr %108, align 4, !dbg !2085
  %110 = load ptr, ptr %5, align 8, !dbg !2086
  %111 = getelementptr inbounds nuw %struct.morph_data, ptr %110, i32 0, i32 0, !dbg !2087
  %112 = load ptr, ptr %111, align 8, !dbg !2087
  %113 = getelementptr inbounds nuw %struct.object, ptr %112, i32 0, i32 5, !dbg !2088
  store i8 %109, ptr %113, align 2, !dbg !2089
  %114 = load ptr, ptr %5, align 8, !dbg !2090
  %115 = getelementptr inbounds nuw %struct.morph_data, ptr %114, i32 0, i32 9, !dbg !2091
  %116 = load i8, ptr %115, align 1, !dbg !2091
  %117 = load ptr, ptr %5, align 8, !dbg !2092
  %118 = getelementptr inbounds nuw %struct.morph_data, ptr %117, i32 0, i32 0, !dbg !2093
  %119 = load ptr, ptr %118, align 8, !dbg !2093
  %120 = getelementptr inbounds nuw %struct.object, ptr %119, i32 0, i32 6, !dbg !2094
  store i8 %116, ptr %120, align 1, !dbg !2095
  %121 = load ptr, ptr %5, align 8, !dbg !2096
  %122 = getelementptr inbounds nuw %struct.morph_data, ptr %121, i32 0, i32 0, !dbg !2097
  %123 = load ptr, ptr %122, align 8, !dbg !2097
  %124 = getelementptr inbounds nuw %struct.object, ptr %123, i32 0, i32 7, !dbg !2098
  store i8 1, ptr %124, align 4, !dbg !2099
  %125 = load ptr, ptr %5, align 8, !dbg !2100
  %126 = getelementptr inbounds nuw %struct.morph_data, ptr %125, i32 0, i32 10, !dbg !2101
  %127 = load ptr, ptr %5, align 8, !dbg !2102
  %128 = getelementptr inbounds nuw %struct.morph_data, ptr %127, i32 0, i32 0, !dbg !2103
  %129 = load ptr, ptr %128, align 8, !dbg !2103
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 21, !dbg !2104
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %130, ptr align 8 %126, i64 64, i1 false), !dbg !2105
  %131 = load ptr, ptr %5, align 8, !dbg !2106
  %132 = getelementptr inbounds nuw %struct.morph_data, ptr %131, i32 0, i32 0, !dbg !2107
  store ptr null, ptr %132, align 8, !dbg !2108
  br label %133, !dbg !2109

133:                                              ; preds = %11, %106, %101
  ret void, !dbg !2110
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z11init_morphsv() #0 !dbg !2111 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !2112, !DIExpression(), !2113)
  store i32 0, ptr %1, align 4, !dbg !2114
  br label %2, !dbg !2116

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !2117
  %4 = icmp slt i32 %3, 5, !dbg !2119
  br i1 %4, label %5, label %13, !dbg !2120

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !2121
  %7 = sext i32 %6 to i64, !dbg !2122
  %8 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %7, !dbg !2122
  %9 = getelementptr inbounds nuw %struct.morph_data, ptr %8, i32 0, i32 0, !dbg !2123
  store ptr null, ptr %9, align 8, !dbg !2124
  br label %10, !dbg !2122

10:                                               ; preds = %5
  %11 = load i32, ptr %1, align 4, !dbg !2125
  %12 = add nsw i32 %11, 1, !dbg !2125
  store i32 %12, ptr %1, align 4, !dbg !2125
  br label %2, !dbg !2126, !llvm.loop !2127

13:                                               ; preds = %2
  ret void, !dbg !2129
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11morph_startP6object(ptr noundef %0) #1 !dbg !2130 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca %struct.vms_vector, align 4
  %6 = alloca %struct.vms_vector, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2131, !DIExpression(), !2132)
    #dbg_declare(ptr %3, !2133, !DIExpression(), !2134)
    #dbg_declare(ptr %4, !2135, !DIExpression(), !2136)
    #dbg_declare(ptr %5, !2137, !DIExpression(), !2138)
    #dbg_declare(ptr %6, !2139, !DIExpression(), !2140)
    #dbg_declare(ptr %7, !2141, !DIExpression(), !2142)
    #dbg_declare(ptr %8, !2143, !DIExpression(), !2144)
  store i32 0, ptr %7, align 4, !dbg !2145
  br label %12, !dbg !2147

12:                                               ; preds = %48, %1
  %13 = load i32, ptr %7, align 4, !dbg !2148
  %14 = icmp slt i32 %13, 5, !dbg !2150
  br i1 %14, label %15, label %51, !dbg !2151

15:                                               ; preds = %12
  %16 = load i32, ptr %7, align 4, !dbg !2152
  %17 = sext i32 %16 to i64, !dbg !2154
  %18 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %17, !dbg !2154
  %19 = getelementptr inbounds nuw %struct.morph_data, ptr %18, i32 0, i32 0, !dbg !2155
  %20 = load ptr, ptr %19, align 8, !dbg !2155
  %21 = icmp eq ptr %20, null, !dbg !2156
  br i1 %21, label %46, label %22, !dbg !2157

22:                                               ; preds = %15
  %23 = load i32, ptr %7, align 4, !dbg !2158
  %24 = sext i32 %23 to i64, !dbg !2159
  %25 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %24, !dbg !2159
  %26 = getelementptr inbounds nuw %struct.morph_data, ptr %25, i32 0, i32 0, !dbg !2160
  %27 = load ptr, ptr %26, align 8, !dbg !2160
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 1, !dbg !2161
  %29 = load i8, ptr %28, align 4, !dbg !2161
  %30 = zext i8 %29 to i32, !dbg !2159
  %31 = icmp eq i32 %30, 255, !dbg !2162
  br i1 %31, label %46, label %32, !dbg !2163

32:                                               ; preds = %22
  %33 = load i32, ptr %7, align 4, !dbg !2164
  %34 = sext i32 %33 to i64, !dbg !2165
  %35 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %34, !dbg !2165
  %36 = getelementptr inbounds nuw %struct.morph_data, ptr %35, i32 0, i32 0, !dbg !2166
  %37 = load ptr, ptr %36, align 8, !dbg !2166
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 0, !dbg !2167
  %39 = load i32, ptr %38, align 4, !dbg !2167
  %40 = load i32, ptr %7, align 4, !dbg !2168
  %41 = sext i32 %40 to i64, !dbg !2169
  %42 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %41, !dbg !2169
  %43 = getelementptr inbounds nuw %struct.morph_data, ptr %42, i32 0, i32 11, !dbg !2170
  %44 = load i32, ptr %43, align 8, !dbg !2170
  %45 = icmp ne i32 %39, %44, !dbg !2171
  br i1 %45, label %46, label %47, !dbg !2163

46:                                               ; preds = %32, %22, %15
  br label %52, !dbg !2172

47:                                               ; preds = %32
  br label %48, !dbg !2170

48:                                               ; preds = %47
  %49 = load i32, ptr %7, align 4, !dbg !2173
  %50 = add nsw i32 %49, 1, !dbg !2173
  store i32 %50, ptr %7, align 4, !dbg !2173
  br label %12, !dbg !2174, !llvm.loop !2175

51:                                               ; preds = %12
  br label %52, !dbg !2177

52:                                               ; preds = %51, %46
  %53 = load i32, ptr %7, align 4, !dbg !2177
  %54 = icmp eq i32 %53, 5, !dbg !2179
  br i1 %54, label %55, label %56, !dbg !2179

55:                                               ; preds = %52
  br label %167, !dbg !2180

56:                                               ; preds = %52
  %57 = load i32, ptr %7, align 4, !dbg !2181
  %58 = sext i32 %57 to i64, !dbg !2182
  %59 = getelementptr inbounds [5 x %struct.morph_data], ptr @morph_objects, i64 0, i64 %58, !dbg !2182
  store ptr %59, ptr %8, align 8, !dbg !2183
  %60 = load ptr, ptr %2, align 8, !dbg !2184
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 7, !dbg !2184
  %62 = load i8, ptr %61, align 4, !dbg !2184
  %63 = zext i8 %62 to i32, !dbg !2184
  %64 = icmp eq i32 %63, 1, !dbg !2184
  %65 = zext i1 %64 to i32, !dbg !2184
  call void @_Z7_AssertiPKcS0_i(i32 noundef %65, ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 446), !dbg !2184
  %66 = load ptr, ptr %2, align 8, !dbg !2185
  %67 = load ptr, ptr %8, align 8, !dbg !2186
  %68 = getelementptr inbounds nuw %struct.morph_data, ptr %67, i32 0, i32 0, !dbg !2187
  store ptr %66, ptr %68, align 8, !dbg !2188
  %69 = load ptr, ptr %2, align 8, !dbg !2189
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 0, !dbg !2190
  %71 = load i32, ptr %70, align 4, !dbg !2190
  %72 = load ptr, ptr %8, align 8, !dbg !2191
  %73 = getelementptr inbounds nuw %struct.morph_data, ptr %72, i32 0, i32 11, !dbg !2192
  store i32 %71, ptr %73, align 8, !dbg !2193
  %74 = load ptr, ptr %2, align 8, !dbg !2194
  %75 = getelementptr inbounds nuw %struct.object, ptr %74, i32 0, i32 5, !dbg !2195
  %76 = load i8, ptr %75, align 2, !dbg !2195
  %77 = load ptr, ptr %8, align 8, !dbg !2196
  %78 = getelementptr inbounds nuw %struct.morph_data, ptr %77, i32 0, i32 8, !dbg !2197
  store i8 %76, ptr %78, align 4, !dbg !2198
  %79 = load ptr, ptr %2, align 8, !dbg !2199
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 6, !dbg !2200
  %81 = load i8, ptr %80, align 1, !dbg !2200
  %82 = load ptr, ptr %8, align 8, !dbg !2201
  %83 = getelementptr inbounds nuw %struct.morph_data, ptr %82, i32 0, i32 9, !dbg !2202
  store i8 %81, ptr %83, align 1, !dbg !2203
  %84 = load ptr, ptr %2, align 8, !dbg !2204
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 21, !dbg !2205
  %86 = load ptr, ptr %8, align 8, !dbg !2206
  %87 = getelementptr inbounds nuw %struct.morph_data, ptr %86, i32 0, i32 10, !dbg !2207
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %87, ptr align 4 %85, i64 64, i1 false), !dbg !2208
  %88 = load ptr, ptr %2, align 8, !dbg !2209
  %89 = getelementptr inbounds nuw %struct.object, ptr %88, i32 0, i32 5, !dbg !2209
  %90 = load i8, ptr %89, align 2, !dbg !2209
  %91 = zext i8 %90 to i32, !dbg !2209
  %92 = icmp eq i32 %91, 1, !dbg !2209
  %93 = zext i1 %92 to i32, !dbg !2209
  call void @_Z7_AssertiPKcS0_i(i32 noundef %93, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 455), !dbg !2209
  %94 = load ptr, ptr %2, align 8, !dbg !2210
  %95 = getelementptr inbounds nuw %struct.object, ptr %94, i32 0, i32 5, !dbg !2211
  store i8 11, ptr %95, align 2, !dbg !2212
  %96 = load ptr, ptr %2, align 8, !dbg !2213
  %97 = getelementptr inbounds nuw %struct.object, ptr %96, i32 0, i32 7, !dbg !2214
  store i8 6, ptr %97, align 4, !dbg !2215
  %98 = load ptr, ptr %2, align 8, !dbg !2216
  %99 = getelementptr inbounds nuw %struct.object, ptr %98, i32 0, i32 6, !dbg !2217
  store i8 1, ptr %99, align 1, !dbg !2218
  %100 = load ptr, ptr %2, align 8, !dbg !2219
  %101 = getelementptr inbounds nuw %struct.object, ptr %100, i32 0, i32 21, !dbg !2220
  %102 = getelementptr inbounds nuw %struct.physics_info, ptr %101, i32 0, i32 5, !dbg !2221
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %102, ptr align 4 @morph_rotvel, i64 12, i1 false), !dbg !2222
  %103 = load ptr, ptr %2, align 8, !dbg !2223
  %104 = getelementptr inbounds nuw %struct.object, ptr %103, i32 0, i32 23, !dbg !2224
  %105 = getelementptr inbounds nuw %struct.polyobj_info, ptr %104, i32 0, i32 0, !dbg !2225
  %106 = load i32, ptr %105, align 4, !dbg !2225
  %107 = sext i32 %106 to i64, !dbg !2226
  %108 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %107, !dbg !2226
  store ptr %108, ptr %3, align 8, !dbg !2227
  %109 = load ptr, ptr %3, align 8, !dbg !2228
  call void @_Z12find_min_maxP9polymodeliP10vms_vectorS2_(ptr noundef %109, i32 noundef 0, ptr noundef %4, ptr noundef %5), !dbg !2229
  %110 = getelementptr inbounds nuw %struct.vms_vector, ptr %4, i32 0, i32 0, !dbg !2230
  %111 = load i32, ptr %110, align 4, !dbg !2230
  %112 = sub nsw i32 0, %111, !dbg !2231
  store i32 %112, ptr %9, align 4, !dbg !2231
  %113 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !2232
  %114 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %9, ptr noundef nonnull align 4 dereferenceable(4) %113), !dbg !2233
  %115 = load i32, ptr %114, align 4, !dbg !2233
  %116 = sdiv i32 %115, 2, !dbg !2234
  %117 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 0, !dbg !2235
  store i32 %116, ptr %117, align 4, !dbg !2236
  %118 = getelementptr inbounds nuw %struct.vms_vector, ptr %4, i32 0, i32 1, !dbg !2237
  %119 = load i32, ptr %118, align 4, !dbg !2237
  %120 = sub nsw i32 0, %119, !dbg !2238
  store i32 %120, ptr %10, align 4, !dbg !2238
  %121 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !2239
  %122 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %10, ptr noundef nonnull align 4 dereferenceable(4) %121), !dbg !2240
  %123 = load i32, ptr %122, align 4, !dbg !2240
  %124 = sdiv i32 %123, 2, !dbg !2241
  %125 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 1, !dbg !2242
  store i32 %124, ptr %125, align 4, !dbg !2243
  %126 = getelementptr inbounds nuw %struct.vms_vector, ptr %4, i32 0, i32 2, !dbg !2244
  %127 = load i32, ptr %126, align 4, !dbg !2244
  %128 = sub nsw i32 0, %127, !dbg !2245
  store i32 %128, ptr %11, align 4, !dbg !2245
  %129 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !2246
  %130 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %11, ptr noundef nonnull align 4 dereferenceable(4) %129), !dbg !2247
  %131 = load i32, ptr %130, align 4, !dbg !2247
  %132 = sdiv i32 %131, 2, !dbg !2248
  %133 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 2, !dbg !2249
  store i32 %132, ptr %133, align 4, !dbg !2250
  store i32 0, ptr %7, align 4, !dbg !2251
  br label %134, !dbg !2253

134:                                              ; preds = %143, %56
  %135 = load i32, ptr %7, align 4, !dbg !2254
  %136 = icmp slt i32 %135, 1000, !dbg !2256
  br i1 %136, label %137, label %146, !dbg !2257

137:                                              ; preds = %134
  %138 = load ptr, ptr %8, align 8, !dbg !2258
  %139 = getelementptr inbounds nuw %struct.morph_data, ptr %138, i32 0, i32 3, !dbg !2259
  %140 = load i32, ptr %7, align 4, !dbg !2260
  %141 = sext i32 %140 to i64, !dbg !2258
  %142 = getelementptr inbounds [1000 x i32], ptr %139, i64 0, i64 %141, !dbg !2258
  store i32 0, ptr %142, align 4, !dbg !2261
  br label %143, !dbg !2258

143:                                              ; preds = %137
  %144 = load i32, ptr %7, align 4, !dbg !2262
  %145 = add nsw i32 %144, 1, !dbg !2262
  store i32 %145, ptr %7, align 4, !dbg !2262
  br label %134, !dbg !2263, !llvm.loop !2264

146:                                              ; preds = %134
  store i32 1, ptr %7, align 4, !dbg !2266
  br label %147, !dbg !2268

147:                                              ; preds = %156, %146
  %148 = load i32, ptr %7, align 4, !dbg !2269
  %149 = icmp slt i32 %148, 10, !dbg !2271
  br i1 %149, label %150, label %159, !dbg !2272

150:                                              ; preds = %147
  %151 = load ptr, ptr %8, align 8, !dbg !2273
  %152 = getelementptr inbounds nuw %struct.morph_data, ptr %151, i32 0, i32 4, !dbg !2274
  %153 = load i32, ptr %7, align 4, !dbg !2275
  %154 = sext i32 %153 to i64, !dbg !2273
  %155 = getelementptr inbounds [10 x i32], ptr %152, i64 0, i64 %154, !dbg !2273
  store i32 0, ptr %155, align 4, !dbg !2276
  br label %156, !dbg !2273

156:                                              ; preds = %150
  %157 = load i32, ptr %7, align 4, !dbg !2277
  %158 = add nsw i32 %157, 1, !dbg !2277
  store i32 %158, ptr %7, align 4, !dbg !2277
  br label %147, !dbg !2278, !llvm.loop !2279

159:                                              ; preds = %147
  %160 = load ptr, ptr %8, align 8, !dbg !2281
  %161 = getelementptr inbounds nuw %struct.morph_data, ptr %160, i32 0, i32 4, !dbg !2282
  %162 = getelementptr inbounds [10 x i32], ptr %161, i64 0, i64 0, !dbg !2281
  store i32 1, ptr %162, align 8, !dbg !2283
  %163 = load ptr, ptr %8, align 8, !dbg !2284
  %164 = getelementptr inbounds nuw %struct.morph_data, ptr %163, i32 0, i32 7, !dbg !2285
  store i32 1, ptr %164, align 8, !dbg !2286
  %165 = load ptr, ptr %3, align 8, !dbg !2287
  %166 = load ptr, ptr %8, align 8, !dbg !2288
  call void @_Z11init_pointsP9polymodelP10vms_vectoriP10morph_data(ptr noundef %165, ptr noundef %6, i32 noundef 0, ptr noundef %166), !dbg !2289
  br label %167, !dbg !2290

167:                                              ; preds = %159, %55
  ret void, !dbg !2290
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #1 !dbg !2291 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2298, !DIExpression(), !2299)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2300, !DIExpression(), !2301)
  %6 = load ptr, ptr %3, align 8, !dbg !2302
  %7 = load ptr, ptr %4, align 8, !dbg !2303
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2304
  ret ptr %8, !dbg !2305
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z10draw_modelP9polymodeliP10vms_angveciP10morph_data(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) #1 !dbg !2306 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [10 x i32], align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.bitmap_index, align 2
  %19 = alloca %struct.bitmap_index, align 2
  %20 = alloca %struct.vms_matrix, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !2310, !DIExpression(), !2311)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !2312, !DIExpression(), !2313)
  store ptr %2, ptr %8, align 8
    #dbg_declare(ptr %8, !2314, !DIExpression(), !2315)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !2316, !DIExpression(), !2317)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !2318, !DIExpression(), !2319)
    #dbg_declare(ptr %11, !2320, !DIExpression(), !2321)
    #dbg_declare(ptr %12, !2322, !DIExpression(), !2323)
    #dbg_declare(ptr %13, !2324, !DIExpression(), !2325)
    #dbg_declare(ptr %14, !2326, !DIExpression(), !2327)
    #dbg_declare(ptr %15, !2328, !DIExpression(), !2329)
  %21 = load i32, ptr %7, align 4, !dbg !2330
  %22 = getelementptr inbounds [10 x i32], ptr %14, i64 0, i64 0, !dbg !2331
  store i32 %21, ptr %22, align 4, !dbg !2332
  store i32 1, ptr %15, align 4, !dbg !2333
  store i32 0, ptr %11, align 4, !dbg !2334
  br label %23, !dbg !2336

23:                                               ; preds = %92, %5
  %24 = load i32, ptr %11, align 4, !dbg !2337
  %25 = load ptr, ptr %6, align 8, !dbg !2339
  %26 = getelementptr inbounds nuw %struct.polymodel, ptr %25, i32 0, i32 0, !dbg !2340
  %27 = load i32, ptr %26, align 8, !dbg !2340
  %28 = icmp slt i32 %24, %27, !dbg !2341
  br i1 %28, label %29, label %95, !dbg !2342

29:                                               ; preds = %23
  %30 = load ptr, ptr %10, align 8, !dbg !2343
  %31 = getelementptr inbounds nuw %struct.morph_data, ptr %30, i32 0, i32 4, !dbg !2345
  %32 = load i32, ptr %11, align 4, !dbg !2346
  %33 = sext i32 %32 to i64, !dbg !2343
  %34 = getelementptr inbounds [10 x i32], ptr %31, i64 0, i64 %33, !dbg !2343
  %35 = load i32, ptr %34, align 4, !dbg !2343
  %36 = icmp ne i32 %35, 0, !dbg !2343
  br i1 %36, label %37, label %91, !dbg !2347

37:                                               ; preds = %29
  %38 = load ptr, ptr %6, align 8, !dbg !2348
  %39 = getelementptr inbounds nuw %struct.polymodel, ptr %38, i32 0, i32 8, !dbg !2349
  %40 = load i32, ptr %11, align 4, !dbg !2350
  %41 = sext i32 %40 to i64, !dbg !2348
  %42 = getelementptr inbounds [10 x i8], ptr %39, i64 0, i64 %41, !dbg !2348
  %43 = load i8, ptr %42, align 1, !dbg !2348
  %44 = zext i8 %43 to i32, !dbg !2348
  %45 = load i32, ptr %7, align 4, !dbg !2351
  %46 = icmp eq i32 %44, %45, !dbg !2352
  br i1 %46, label %47, label %91, !dbg !2347

47:                                               ; preds = %37
  %48 = load ptr, ptr %6, align 8, !dbg !2353
  %49 = getelementptr inbounds nuw %struct.polymodel, ptr %48, i32 0, i32 6, !dbg !2355
  %50 = load i32, ptr %11, align 4, !dbg !2356
  %51 = sext i32 %50 to i64, !dbg !2353
  %52 = getelementptr inbounds [10 x %struct.vms_vector], ptr %49, i64 0, i64 %51, !dbg !2353
  %53 = load ptr, ptr %6, align 8, !dbg !2357
  %54 = getelementptr inbounds nuw %struct.polymodel, ptr %53, i32 0, i32 5, !dbg !2358
  %55 = load i32, ptr %11, align 4, !dbg !2359
  %56 = sext i32 %55 to i64, !dbg !2357
  %57 = getelementptr inbounds [10 x %struct.vms_vector], ptr %54, i64 0, i64 %56, !dbg !2357
  %58 = call noundef zeroext i8 @_Z22g3_check_normal_facingP10vms_vectorS0_(ptr noundef %52, ptr noundef %57), !dbg !2360
  %59 = zext i8 %58 to i32, !dbg !2360
  store i32 %59, ptr %13, align 4, !dbg !2361
  %60 = load i32, ptr %13, align 4, !dbg !2362
  %61 = icmp ne i32 %60, 0, !dbg !2362
  br i1 %61, label %68, label %62, !dbg !2364

62:                                               ; preds = %47
  %63 = load i32, ptr %11, align 4, !dbg !2365
  %64 = load i32, ptr %15, align 4, !dbg !2366
  %65 = add nsw i32 %64, 1, !dbg !2366
  store i32 %65, ptr %15, align 4, !dbg !2366
  %66 = sext i32 %64 to i64, !dbg !2367
  %67 = getelementptr inbounds [10 x i32], ptr %14, i64 0, i64 %66, !dbg !2367
  store i32 %63, ptr %67, align 4, !dbg !2368
  br label %90, !dbg !2367

68:                                               ; preds = %47
    #dbg_declare(ptr %16, !2369, !DIExpression(), !2371)
  %69 = load i32, ptr %15, align 4, !dbg !2372
  store i32 %69, ptr %16, align 4, !dbg !2374
  br label %70, !dbg !2375

70:                                               ; preds = %82, %68
  %71 = load i32, ptr %16, align 4, !dbg !2376
  %72 = icmp sgt i32 %71, 0, !dbg !2378
  br i1 %72, label %73, label %85, !dbg !2379

73:                                               ; preds = %70
  %74 = load i32, ptr %16, align 4, !dbg !2380
  %75 = sub nsw i32 %74, 1, !dbg !2381
  %76 = sext i32 %75 to i64, !dbg !2382
  %77 = getelementptr inbounds [10 x i32], ptr %14, i64 0, i64 %76, !dbg !2382
  %78 = load i32, ptr %77, align 4, !dbg !2382
  %79 = load i32, ptr %16, align 4, !dbg !2383
  %80 = sext i32 %79 to i64, !dbg !2384
  %81 = getelementptr inbounds [10 x i32], ptr %14, i64 0, i64 %80, !dbg !2384
  store i32 %78, ptr %81, align 4, !dbg !2385
  br label %82, !dbg !2384

82:                                               ; preds = %73
  %83 = load i32, ptr %16, align 4, !dbg !2386
  %84 = add nsw i32 %83, -1, !dbg !2386
  store i32 %84, ptr %16, align 4, !dbg !2386
  br label %70, !dbg !2387, !llvm.loop !2388

85:                                               ; preds = %70
  %86 = load i32, ptr %11, align 4, !dbg !2390
  %87 = getelementptr inbounds [10 x i32], ptr %14, i64 0, i64 0, !dbg !2391
  store i32 %86, ptr %87, align 4, !dbg !2392
  %88 = load i32, ptr %15, align 4, !dbg !2393
  %89 = add nsw i32 %88, 1, !dbg !2393
  store i32 %89, ptr %15, align 4, !dbg !2393
  br label %90

90:                                               ; preds = %85, %62
  br label %91, !dbg !2394

91:                                               ; preds = %90, %37, %29
  br label %92, !dbg !2351

92:                                               ; preds = %91
  %93 = load i32, ptr %11, align 4, !dbg !2395
  %94 = add nsw i32 %93, 1, !dbg !2395
  store i32 %94, ptr %11, align 4, !dbg !2395
  br label %23, !dbg !2396, !llvm.loop !2397

95:                                               ; preds = %23
  store i32 0, ptr %11, align 4, !dbg !2399
  br label %96, !dbg !2401

96:                                               ; preds = %269, %95
  %97 = load i32, ptr %11, align 4, !dbg !2402
  %98 = load i32, ptr %15, align 4, !dbg !2404
  %99 = icmp slt i32 %97, %98, !dbg !2405
  br i1 %99, label %100, label %272, !dbg !2406

100:                                              ; preds = %96
  %101 = load i32, ptr %11, align 4, !dbg !2407
  %102 = sext i32 %101 to i64, !dbg !2409
  %103 = getelementptr inbounds [10 x i32], ptr %14, i64 0, i64 %102, !dbg !2409
  %104 = load i32, ptr %103, align 4, !dbg !2409
  store i32 %104, ptr %12, align 4, !dbg !2410
  %105 = load i32, ptr %12, align 4, !dbg !2411
  %106 = load i32, ptr %7, align 4, !dbg !2413
  %107 = icmp eq i32 %105, %106, !dbg !2414
  br i1 %107, label %108, label %252, !dbg !2414

108:                                              ; preds = %100
    #dbg_declare(ptr %17, !2415, !DIExpression(), !2417)
  store i32 0, ptr %17, align 4, !dbg !2418
  br label %109, !dbg !2420

109:                                              ; preds = %149, %108
  %110 = load i32, ptr %17, align 4, !dbg !2421
  %111 = load ptr, ptr %6, align 8, !dbg !2423
  %112 = getelementptr inbounds nuw %struct.polymodel, ptr %111, i32 0, i32 14, !dbg !2424
  %113 = load i8, ptr %112, align 8, !dbg !2424
  %114 = zext i8 %113 to i32, !dbg !2423
  %115 = icmp slt i32 %110, %114, !dbg !2425
  br i1 %115, label %116, label %152, !dbg !2426

116:                                              ; preds = %109
  %117 = load ptr, ptr %6, align 8, !dbg !2427
  %118 = getelementptr inbounds nuw %struct.polymodel, ptr %117, i32 0, i32 15, !dbg !2429
  %119 = load i16, ptr %118, align 2, !dbg !2429
  %120 = zext i16 %119 to i32, !dbg !2427
  %121 = load i32, ptr %17, align 4, !dbg !2430
  %122 = add nsw i32 %120, %121, !dbg !2431
  %123 = sext i32 %122 to i64, !dbg !2432
  %124 = getelementptr inbounds [600 x i16], ptr @ObjBitmapPtrs, i64 0, i64 %123, !dbg !2432
  %125 = load i16, ptr %124, align 2, !dbg !2432
  %126 = zext i16 %125 to i64, !dbg !2433
  %127 = getelementptr inbounds nuw [600 x %struct.bitmap_index], ptr @ObjBitmaps, i64 0, i64 %126, !dbg !2433
  %128 = load i32, ptr %17, align 4, !dbg !2434
  %129 = sext i32 %128 to i64, !dbg !2435
  %130 = getelementptr inbounds [100 x %struct.bitmap_index], ptr @texture_list_index, i64 0, i64 %129, !dbg !2435
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %130, ptr align 2 %127, i64 2, i1 false), !dbg !2436
  %131 = load ptr, ptr %6, align 8, !dbg !2437
  %132 = getelementptr inbounds nuw %struct.polymodel, ptr %131, i32 0, i32 15, !dbg !2438
  %133 = load i16, ptr %132, align 2, !dbg !2438
  %134 = zext i16 %133 to i32, !dbg !2437
  %135 = load i32, ptr %17, align 4, !dbg !2439
  %136 = add nsw i32 %134, %135, !dbg !2440
  %137 = sext i32 %136 to i64, !dbg !2441
  %138 = getelementptr inbounds [600 x i16], ptr @ObjBitmapPtrs, i64 0, i64 %137, !dbg !2441
  %139 = load i16, ptr %138, align 2, !dbg !2441
  %140 = zext i16 %139 to i64, !dbg !2442
  %141 = getelementptr inbounds nuw [600 x %struct.bitmap_index], ptr @ObjBitmaps, i64 0, i64 %140, !dbg !2442
  %142 = getelementptr inbounds nuw %struct.bitmap_index, ptr %141, i32 0, i32 0, !dbg !2443
  %143 = load i16, ptr %142, align 2, !dbg !2443
  %144 = zext i16 %143 to i64, !dbg !2444
  %145 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %144, !dbg !2444
  %146 = load i32, ptr %17, align 4, !dbg !2445
  %147 = sext i32 %146 to i64, !dbg !2446
  %148 = getelementptr inbounds [100 x ptr], ptr @texture_list, i64 0, i64 %147, !dbg !2446
  store ptr %145, ptr %148, align 8, !dbg !2447
  br label %149, !dbg !2448

149:                                              ; preds = %116
  %150 = load i32, ptr %17, align 4, !dbg !2449
  %151 = add nsw i32 %150, 1, !dbg !2449
  store i32 %151, ptr %17, align 4, !dbg !2449
  br label %109, !dbg !2450, !llvm.loop !2451

152:                                              ; preds = %109
  store i32 0, ptr @piggy_page_flushed, align 4, !dbg !2453
  store i32 0, ptr %17, align 4, !dbg !2454
  br label %153, !dbg !2456

153:                                              ; preds = %183, %152
  %154 = load i32, ptr %17, align 4, !dbg !2457
  %155 = load ptr, ptr %6, align 8, !dbg !2459
  %156 = getelementptr inbounds nuw %struct.polymodel, ptr %155, i32 0, i32 14, !dbg !2460
  %157 = load i8, ptr %156, align 8, !dbg !2460
  %158 = zext i8 %157 to i32, !dbg !2459
  %159 = icmp slt i32 %154, %158, !dbg !2461
  br i1 %159, label %160, label %186, !dbg !2462

160:                                              ; preds = %153
  br label %161, !dbg !2463

161:                                              ; preds = %160
  %162 = load i32, ptr %17, align 4, !dbg !2464
  %163 = sext i32 %162 to i64, !dbg !2464
  %164 = getelementptr inbounds [100 x %struct.bitmap_index], ptr @texture_list_index, i64 0, i64 %163, !dbg !2464
  %165 = getelementptr inbounds nuw %struct.bitmap_index, ptr %164, i32 0, i32 0, !dbg !2464
  %166 = load i16, ptr %165, align 2, !dbg !2464
  %167 = zext i16 %166 to i64, !dbg !2464
  %168 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %167, !dbg !2464
  %169 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %168, i32 0, i32 5, !dbg !2464
  %170 = load i8, ptr %169, align 1, !dbg !2464
  %171 = sext i8 %170 to i32, !dbg !2464
  %172 = and i32 %171, 16, !dbg !2464
  %173 = icmp ne i32 %172, 0, !dbg !2464
  br i1 %173, label %174, label %181, !dbg !2464

174:                                              ; preds = %161
  %175 = load i32, ptr %17, align 4, !dbg !2467
  %176 = sext i32 %175 to i64, !dbg !2467
  %177 = getelementptr inbounds [100 x %struct.bitmap_index], ptr @texture_list_index, i64 0, i64 %176, !dbg !2467
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %18, ptr align 2 %177, i64 2, i1 false), !dbg !2467
  %178 = getelementptr inbounds nuw %struct.bitmap_index, ptr %18, i32 0, i32 0, !dbg !2467
  %179 = load i16, ptr %178, align 2, !dbg !2467
  %180 = zext i16 %179 to i64, !dbg !2467
  call void @_Z20piggy_bitmap_page_in12bitmap_index(i64 %180), !dbg !2467
  br label %181, !dbg !2467

181:                                              ; preds = %174, %161
  br label %182, !dbg !2469

182:                                              ; preds = %181
  br label %183, !dbg !2469

183:                                              ; preds = %182
  %184 = load i32, ptr %17, align 4, !dbg !2470
  %185 = add nsw i32 %184, 1, !dbg !2470
  store i32 %185, ptr %17, align 4, !dbg !2470
  br label %153, !dbg !2471, !llvm.loop !2472

186:                                              ; preds = %153
  %187 = load i32, ptr @piggy_page_flushed, align 4, !dbg !2474
  %188 = icmp ne i32 %187, 0, !dbg !2474
  br i1 %188, label %189, label %224, !dbg !2474

189:                                              ; preds = %186
  store i32 0, ptr @piggy_page_flushed, align 4, !dbg !2476
  store i32 0, ptr %17, align 4, !dbg !2478
  br label %190, !dbg !2480

190:                                              ; preds = %220, %189
  %191 = load i32, ptr %17, align 4, !dbg !2481
  %192 = load ptr, ptr %6, align 8, !dbg !2483
  %193 = getelementptr inbounds nuw %struct.polymodel, ptr %192, i32 0, i32 14, !dbg !2484
  %194 = load i8, ptr %193, align 8, !dbg !2484
  %195 = zext i8 %194 to i32, !dbg !2483
  %196 = icmp slt i32 %191, %195, !dbg !2485
  br i1 %196, label %197, label %223, !dbg !2486

197:                                              ; preds = %190
  br label %198, !dbg !2487

198:                                              ; preds = %197
  %199 = load i32, ptr %17, align 4, !dbg !2488
  %200 = sext i32 %199 to i64, !dbg !2488
  %201 = getelementptr inbounds [100 x %struct.bitmap_index], ptr @texture_list_index, i64 0, i64 %200, !dbg !2488
  %202 = getelementptr inbounds nuw %struct.bitmap_index, ptr %201, i32 0, i32 0, !dbg !2488
  %203 = load i16, ptr %202, align 2, !dbg !2488
  %204 = zext i16 %203 to i64, !dbg !2488
  %205 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %204, !dbg !2488
  %206 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %205, i32 0, i32 5, !dbg !2488
  %207 = load i8, ptr %206, align 1, !dbg !2488
  %208 = sext i8 %207 to i32, !dbg !2488
  %209 = and i32 %208, 16, !dbg !2488
  %210 = icmp ne i32 %209, 0, !dbg !2488
  br i1 %210, label %211, label %218, !dbg !2488

211:                                              ; preds = %198
  %212 = load i32, ptr %17, align 4, !dbg !2491
  %213 = sext i32 %212 to i64, !dbg !2491
  %214 = getelementptr inbounds [100 x %struct.bitmap_index], ptr @texture_list_index, i64 0, i64 %213, !dbg !2491
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %19, ptr align 2 %214, i64 2, i1 false), !dbg !2491
  %215 = getelementptr inbounds nuw %struct.bitmap_index, ptr %19, i32 0, i32 0, !dbg !2491
  %216 = load i16, ptr %215, align 2, !dbg !2491
  %217 = zext i16 %216 to i64, !dbg !2491
  call void @_Z20piggy_bitmap_page_in12bitmap_index(i64 %217), !dbg !2491
  br label %218, !dbg !2491

218:                                              ; preds = %211, %198
  br label %219, !dbg !2493

219:                                              ; preds = %218
  br label %220, !dbg !2493

220:                                              ; preds = %219
  %221 = load i32, ptr %17, align 4, !dbg !2494
  %222 = add nsw i32 %221, 1, !dbg !2494
  store i32 %222, ptr %17, align 4, !dbg !2494
  br label %190, !dbg !2495, !llvm.loop !2496

223:                                              ; preds = %190
  br label %224, !dbg !2498

224:                                              ; preds = %223, %186
  %225 = load i32, ptr @piggy_page_flushed, align 4, !dbg !2499
  %226 = icmp eq i32 %225, 0, !dbg !2499
  %227 = zext i1 %226 to i32, !dbg !2499
  call void @_Z7_AssertiPKcS0_i(i32 noundef %227, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 546), !dbg !2499
  %228 = load ptr, ptr %6, align 8, !dbg !2500
  %229 = getelementptr inbounds nuw %struct.polymodel, ptr %228, i32 0, i32 2, !dbg !2501
  %230 = load ptr, ptr %229, align 8, !dbg !2501
  %231 = load ptr, ptr %6, align 8, !dbg !2502
  %232 = getelementptr inbounds nuw %struct.polymodel, ptr %231, i32 0, i32 3, !dbg !2503
  %233 = load i32, ptr %7, align 4, !dbg !2504
  %234 = sext i32 %233 to i64, !dbg !2502
  %235 = getelementptr inbounds [10 x i32], ptr %232, i64 0, i64 %234, !dbg !2502
  %236 = load i32, ptr %235, align 4, !dbg !2502
  %237 = sext i32 %236 to i64, !dbg !2500
  %238 = getelementptr inbounds i8, ptr %230, i64 %237, !dbg !2500
  %239 = load ptr, ptr %8, align 8, !dbg !2505
  %240 = load i32, ptr %9, align 4, !dbg !2506
  %241 = load ptr, ptr %10, align 8, !dbg !2507
  %242 = getelementptr inbounds nuw %struct.morph_data, ptr %241, i32 0, i32 1, !dbg !2508
  %243 = load ptr, ptr %10, align 8, !dbg !2509
  %244 = getelementptr inbounds nuw %struct.morph_data, ptr %243, i32 0, i32 6, !dbg !2510
  %245 = load i32, ptr %7, align 4, !dbg !2511
  %246 = sext i32 %245 to i64, !dbg !2509
  %247 = getelementptr inbounds [10 x i32], ptr %244, i64 0, i64 %246, !dbg !2509
  %248 = load i32, ptr %247, align 4, !dbg !2509
  %249 = sext i32 %248 to i64, !dbg !2507
  %250 = getelementptr inbounds [1000 x %struct.vms_vector], ptr %242, i64 0, i64 %249, !dbg !2507
  %251 = call noundef zeroext i8 @_Z22g3_draw_morphing_modelPvPP11_grs_bitmapP10vms_angveciP10vms_vector(ptr noundef %238, ptr noundef @texture_list, ptr noundef %239, i32 noundef %240, ptr noundef %250), !dbg !2512
  br label %268, !dbg !2513

252:                                              ; preds = %100
    #dbg_declare(ptr %20, !2514, !DIExpression(), !2516)
  %253 = load ptr, ptr %8, align 8, !dbg !2517
  %254 = load i32, ptr %12, align 4, !dbg !2518
  %255 = sext i32 %254 to i64, !dbg !2517
  %256 = getelementptr inbounds %struct.vms_angvec, ptr %253, i64 %255, !dbg !2517
  %257 = call noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef %20, ptr noundef %256), !dbg !2519
  %258 = load ptr, ptr %6, align 8, !dbg !2520
  %259 = getelementptr inbounds nuw %struct.polymodel, ptr %258, i32 0, i32 4, !dbg !2521
  %260 = load i32, ptr %12, align 4, !dbg !2522
  %261 = sext i32 %260 to i64, !dbg !2520
  %262 = getelementptr inbounds [10 x %struct.vms_vector], ptr %259, i64 0, i64 %261, !dbg !2520
  call void @_Z24g3_start_instance_matrixP10vms_vectorP10vms_matrix(ptr noundef %262, ptr noundef %20), !dbg !2523
  %263 = load ptr, ptr %6, align 8, !dbg !2524
  %264 = load i32, ptr %12, align 4, !dbg !2525
  %265 = load ptr, ptr %8, align 8, !dbg !2526
  %266 = load i32, ptr %9, align 4, !dbg !2527
  %267 = load ptr, ptr %10, align 8, !dbg !2528
  call void @_Z10draw_modelP9polymodeliP10vms_angveciP10morph_data(ptr noundef %263, i32 noundef %264, ptr noundef %265, i32 noundef %266, ptr noundef %267), !dbg !2529
  call void @_Z16g3_done_instancev(), !dbg !2530
  br label %268

268:                                              ; preds = %252, %224
  br label %269, !dbg !2531

269:                                              ; preds = %268
  %270 = load i32, ptr %11, align 4, !dbg !2532
  %271 = add nsw i32 %270, 1, !dbg !2532
  store i32 %271, ptr %11, align 4, !dbg !2532
  br label %96, !dbg !2533, !llvm.loop !2534

272:                                              ; preds = %96
  ret void, !dbg !2536
}

declare noundef zeroext i8 @_Z22g3_check_normal_facingP10vms_vectorS0_(ptr noundef, ptr noundef) #2

declare void @_Z20piggy_bitmap_page_in12bitmap_index(i64) #2

declare noundef zeroext i8 @_Z22g3_draw_morphing_modelPvPP11_grs_bitmapP10vms_angveciP10vms_vector(ptr noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

declare noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef, ptr noundef) #2

declare void @_Z24g3_start_instance_matrixP10vms_vectorP10vms_matrix(ptr noundef, ptr noundef) #2

declare void @_Z16g3_done_instancev() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17draw_morph_objectP6object(ptr noundef %0) #1 !dbg !2537 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2538, !DIExpression(), !2539)
    #dbg_declare(ptr %3, !2540, !DIExpression(), !2541)
    #dbg_declare(ptr %4, !2542, !DIExpression(), !2543)
    #dbg_declare(ptr %5, !2544, !DIExpression(), !2545)
  %6 = load ptr, ptr %2, align 8, !dbg !2546
  %7 = call noundef ptr @_Z15find_morph_dataP6object(ptr noundef %6), !dbg !2547
  store ptr %7, ptr %5, align 8, !dbg !2548
  %8 = load ptr, ptr %5, align 8, !dbg !2549
  %9 = icmp ne ptr %8, null, !dbg !2549
  %10 = zext i1 %9 to i32, !dbg !2549
  call void @_Z7_AssertiPKcS0_i(i32 noundef %10, ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 571), !dbg !2549
  %11 = load ptr, ptr %2, align 8, !dbg !2550
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 23, !dbg !2550
  %13 = getelementptr inbounds nuw %struct.polyobj_info, ptr %12, i32 0, i32 0, !dbg !2550
  %14 = load i32, ptr %13, align 4, !dbg !2550
  %15 = load i32, ptr @N_polygon_models, align 4, !dbg !2550
  %16 = icmp slt i32 %14, %15, !dbg !2550
  %17 = zext i1 %16 to i32, !dbg !2550
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str.7, ptr noundef @.str.1, i32 noundef 573), !dbg !2550
  %18 = load ptr, ptr %2, align 8, !dbg !2551
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 23, !dbg !2552
  %20 = getelementptr inbounds nuw %struct.polyobj_info, ptr %19, i32 0, i32 0, !dbg !2553
  %21 = load i32, ptr %20, align 4, !dbg !2553
  %22 = sext i32 %21 to i64, !dbg !2554
  %23 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %22, !dbg !2554
  store ptr %23, ptr %3, align 8, !dbg !2555
  %24 = load ptr, ptr %2, align 8, !dbg !2556
  %25 = call noundef i32 @_Z20compute_object_lightP6objectP10vms_vector(ptr noundef %24, ptr noundef null), !dbg !2557
  store i32 %25, ptr %4, align 4, !dbg !2558
  %26 = load ptr, ptr %2, align 8, !dbg !2559
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 11, !dbg !2560
  %28 = load ptr, ptr %2, align 8, !dbg !2561
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 12, !dbg !2562
  call void @_Z24g3_start_instance_matrixP10vms_vectorP10vms_matrix(ptr noundef %27, ptr noundef %29), !dbg !2563
  call void @_Z20g3_set_interp_pointsP9g3s_point(ptr noundef @robot_points), !dbg !2564
  %30 = load ptr, ptr %3, align 8, !dbg !2565
  %31 = load ptr, ptr %2, align 8, !dbg !2566
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 23, !dbg !2567
  %33 = getelementptr inbounds nuw %struct.polyobj_info, ptr %32, i32 0, i32 1, !dbg !2568
  %34 = getelementptr inbounds [10 x %struct.vms_angvec], ptr %33, i64 0, i64 0, !dbg !2566
  %35 = load i32, ptr %4, align 4, !dbg !2569
  %36 = load ptr, ptr %5, align 8, !dbg !2570
  call void @_Z10draw_modelP9polymodeliP10vms_angveciP10morph_data(ptr noundef %30, i32 noundef 0, ptr noundef %34, i32 noundef %35, ptr noundef %36), !dbg !2571
  call void @_Z16g3_done_instancev(), !dbg !2572
  %37 = load i32, ptr @Newdemo_state, align 4, !dbg !2573
  %38 = icmp eq i32 %37, 1, !dbg !2575
  br i1 %38, label %39, label %41, !dbg !2575

39:                                               ; preds = %1
  %40 = load ptr, ptr %5, align 8, !dbg !2576
  call void @_Z26newdemo_record_morph_frameP10morph_data(ptr noundef %40), !dbg !2577
  br label %41, !dbg !2577

41:                                               ; preds = %39, %1
  ret void, !dbg !2578
}

declare noundef i32 @_Z20compute_object_lightP6objectP10vms_vector(ptr noundef, ptr noundef) #2

declare void @_Z20g3_set_interp_pointsP9g3s_point(ptr noundef) #2

declare void @_Z26newdemo_record_morph_frameP10morph_data(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #1 !dbg !2579 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2589, !DIExpression(), !2590)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2591, !DIExpression(), !2592)
    #dbg_declare(ptr %3, !2593, !DIExpression(), !2594)
  %6 = load ptr, ptr %4, align 8, !dbg !2595
  %7 = load ptr, ptr %5, align 8, !dbg !2596
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2597
  br i1 %8, label %9, label %11, !dbg !2597

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !2598
  br label %13, !dbg !2597

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !2599
  br label %13, !dbg !2597

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !2597
  ret ptr %14, !dbg !2600
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #0 !dbg !2601 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2609, !DIExpression(), !2611)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2612, !DIExpression(), !2613)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2614, !DIExpression(), !2615)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !2616
  %9 = load i32, ptr %8, align 4, !dbg !2616
  %10 = load ptr, ptr %6, align 8, !dbg !2617
  %11 = load i32, ptr %10, align 4, !dbg !2617
  %12 = icmp slt i32 %9, %11, !dbg !2618
  ret i1 %12, !dbg !2619
}

attributes #0 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!1479, !1480, !1481, !1482, !1483, !1484, !1485}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1486}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "morph_objects", scope: !2, file: !28, line: 37, type: !1325, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !25, imports: !76, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/morph.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "e951d34ac00abf56b1d73cb446f2befb")
!4 = !{!5, !9, !15, !22}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !7, line: 31, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!8 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !11, line: 22, baseType: !12)
!11 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !11, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !13, identifier: "_ZTS10vms_vector")
!13 = !{!14, !20, !21}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !12, file: !11, line: 21, baseType: !15, size: 32)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !16, line: 20, baseType: !17)
!16 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !18, line: 30, baseType: !19)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !12, file: !11, line: 21, baseType: !15, size: 32, offset: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !12, file: !11, line: 21, baseType: !15, size: 32, offset: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !23, line: 30, baseType: !24)
!23 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!24 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!25 = !{!0, !26, !34, !39, !41, !46, !48, !53, !58, !63, !68, !73}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !28, line: 71, type: !29, isLocal: true, isDefinition: true)
!28 = !DIFile(filename: "main_d2/morph.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "e951d34ac00abf56b1d73cb446f2befb")
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 184, elements: !32)
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !{!33}
!33 = !DISubrange(count: 23)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(scope: null, file: !28, line: 71, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 440, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 55)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "morph_rate", scope: !2, file: !28, line: 98, type: !15, isLocal: false, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(scope: null, file: !28, line: 126, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 160, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 20)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "morph_rotvel", scope: !2, file: !28, line: 300, type: !10, isLocal: false, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(scope: null, file: !28, line: 446, type: !50, isLocal: true, isDefinition: true)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 248, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 31)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(scope: null, file: !28, line: 455, type: !55, isLocal: true, isDefinition: true)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 216, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 27)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(scope: null, file: !28, line: 546, type: !60, isLocal: true, isDefinition: true)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 192, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 24)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(scope: null, file: !28, line: 571, type: !65, isLocal: true, isDefinition: true)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 88, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 11)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(scope: null, file: !28, line: 573, type: !70, isLocal: true, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 400, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 50)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!74 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !16, line: 18, type: !75, isLocal: true, isDefinition: true)
!75 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!76 = !{!77, !84, !88, !89, !90, !94, !95, !99, !103, !106, !108, !110, !112, !114, !116, !118, !120, !122, !124, !126, !128, !130, !132, !134, !136, !142, !146, !149, !152, !157, !163, !165, !167, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !189, !194, !199, !204, !209, !211, !214, !216, !218, !220, !222, !224, !226, !228, !230, !232, !236, !241, !245, !247, !251, !255, !268, !284, !285, !340, !349, !351, !359, !365, !369, !373, !375, !379, !383, !387, !391, !395, !399, !401, !403, !407, !413, !418, !422, !426, !430, !434, !438, !442, !446, !448, !450, !454, !456, !460, !464, !469, !471, !473, !475, !479, !483, !487, !489, !493, !495, !497, !499, !501, !507, !511, !513, !519, !524, !528, !532, !537, !542, !546, !550, !554, !558, !560, !562, !570, !572, !576, !580, !582, !584, !588, !592, !596, !598, !602, !607, !611, !615, !617, !619, !621, !623, !625, !627, !631, !635, !643, !645, !647, !649, !655, !657, !658, !659, !660, !663, !665, !670, !674, !676, !678, !682, !684, !686, !688, !690, !692, !694, !696, !701, !705, !707, !709, !710, !715, !717, !719, !721, !723, !725, !727, !729, !731, !733, !735, !737, !739, !741, !743, !745, !747, !751, !753, !755, !757, !761, !763, !767, !769, !771, !773, !775, !779, !781, !785, !789, !791, !793, !797, !799, !803, !805, !807, !811, !813, !815, !817, !819, !821, !823, !827, !829, !831, !833, !835, !837, !839, !841, !845, !849, !851, !853, !855, !857, !859, !861, !863, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !891, !893, !895, !897, !901, !903, !907, !909, !911, !913, !915, !919, !921, !925, !927, !929, !931, !933, !937, !939, !941, !945, !947, !949, !951, !956, !961, !965, !966, !970, !974, !979, !984, !988, !994, !998, !1000, !1004, !1012, !1018, !1024, !1026, !1030, !1034, !1038, !1043, !1047, !1051, !1055, !1059, !1063, !1067, !1071, !1075, !1080, !1084, !1088, !1092, !1097, !1102, !1106, !1108, !1112, !1114, !1121, !1125, !1126, !1130, !1134, !1138, !1142, !1144, !1148, !1152, !1156, !1160, !1164, !1166, !1168, !1170, !1172, !1173, !1177, !1179, !1183, !1187, !1191, !1193, !1197, !1201, !1205, !1211, !1213, !1217, !1221, !1225, !1227, !1231, !1235, !1239, !1241, !1243, !1245, !1249, !1253, !1258, !1262, !1268, !1272, !1276, !1278, !1280, !1282, !1286, !1290, !1294, !1296, !1298, !1302, !1306, !1308, !1312, !1316, !1319, !1321, !1323}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !80, file: !83, line: 158)
!78 = !DINamespace(name: "__1", scope: !79, exportSymbols: true)
!79 = !DINamespace(name: "std", scope: null)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !81, line: 30, baseType: !82)
!81 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!82 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !85, file: !83, line: 159)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !86, line: 30, baseType: !87)
!86 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!87 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !17, file: !83, line: 160)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !22, file: !83, line: 161)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !91, file: !83, line: 163)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !92, line: 31, baseType: !93)
!92 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!93 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !6, file: !83, line: 164)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !96, file: !83, line: 165)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !97, line: 31, baseType: !98)
!97 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!98 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !100, file: !83, line: 166)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !101, line: 31, baseType: !102)
!101 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!102 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !104, file: !83, line: 168)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !105, line: 29, baseType: !80)
!105 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !107, file: !83, line: 169)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !105, line: 30, baseType: !85)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !109, file: !83, line: 170)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !105, line: 31, baseType: !17)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !111, file: !83, line: 171)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !105, line: 32, baseType: !22)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !113, file: !83, line: 173)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !105, line: 33, baseType: !91)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !115, file: !83, line: 174)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !105, line: 34, baseType: !6)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !117, file: !83, line: 175)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !105, line: 35, baseType: !96)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !119, file: !83, line: 176)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !105, line: 36, baseType: !100)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !121, file: !83, line: 178)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !105, line: 40, baseType: !80)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !123, file: !83, line: 179)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !105, line: 41, baseType: !85)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !125, file: !83, line: 180)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !105, line: 42, baseType: !17)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !127, file: !83, line: 181)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !105, line: 43, baseType: !22)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !129, file: !83, line: 183)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !105, line: 44, baseType: !91)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !131, file: !83, line: 184)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !105, line: 45, baseType: !6)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !133, file: !83, line: 185)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !105, line: 46, baseType: !96)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !135, file: !83, line: 186)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !105, line: 47, baseType: !100)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !137, file: !83, line: 188)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !138, line: 32, baseType: !139)
!138 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !140, line: 40, baseType: !141)
!140 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!141 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !143, file: !83, line: 189)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !144, line: 34, baseType: !145)
!144 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!145 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !147, file: !83, line: 191)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !148, line: 32, baseType: !141)
!148 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !150, file: !83, line: 192)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !151, line: 32, baseType: !145)
!151 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !153, file: !156, line: 22)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !154, line: 16, baseType: !155)
!154 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!155 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!156 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !158, file: !162, line: 113)
!158 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !159, file: !159, line: 217, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!160 = !DISubroutineType(types: !161)
!161 = !{!19, !19}
!162 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !164, file: !162, line: 114)
!164 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !159, file: !159, line: 223, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !166, file: !162, line: 115)
!166 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !159, file: !159, line: 229, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !168, file: !162, line: 116)
!168 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !159, file: !159, line: 235, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !170, file: !162, line: 117)
!170 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !159, file: !159, line: 242, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !172, file: !162, line: 118)
!172 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !159, file: !159, line: 248, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !174, file: !162, line: 119)
!174 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !159, file: !159, line: 254, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !176, file: !162, line: 120)
!176 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !159, file: !159, line: 260, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !178, file: !162, line: 121)
!178 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !159, file: !159, line: 266, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !180, file: !162, line: 122)
!180 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !159, file: !159, line: 272, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !182, file: !162, line: 123)
!182 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !159, file: !159, line: 278, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !184, file: !162, line: 124)
!184 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !159, file: !159, line: 285, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !186, file: !162, line: 125)
!186 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !159, file: !159, line: 297, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !188, file: !162, line: 126)
!188 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !159, file: !159, line: 303, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !190, file: !193, line: 75)
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !191, line: 32, baseType: !192)
!191 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !140, line: 111, baseType: !19)
!193 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !195, file: !193, line: 76)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !196, line: 32, baseType: !197)
!196 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !198, line: 44, baseType: !19)
!198 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !200, file: !193, line: 77)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !201, line: 32, baseType: !202)
!201 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !198, line: 46, baseType: !203)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !140, line: 36, baseType: !98)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !205, file: !193, line: 78)
!205 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !206, file: !206, line: 84, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!207 = !DISubroutineType(types: !208)
!208 = !{!19, !190}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !210, file: !193, line: 79)
!210 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !206, file: !206, line: 90, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !212, file: !193, line: 80)
!212 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !213, file: !213, line: 53, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!213 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !215, file: !193, line: 81)
!215 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !206, file: !206, line: 96, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !217, file: !193, line: 82)
!217 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !206, file: !206, line: 108, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !219, file: !193, line: 83)
!219 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !206, file: !206, line: 114, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !221, file: !193, line: 84)
!221 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !206, file: !206, line: 120, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !223, file: !193, line: 85)
!223 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !206, file: !206, line: 126, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !225, file: !193, line: 86)
!225 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !206, file: !206, line: 132, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !227, file: !193, line: 87)
!227 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !206, file: !206, line: 138, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !229, file: !193, line: 88)
!229 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !206, file: !206, line: 144, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !231, file: !193, line: 89)
!231 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !206, file: !206, line: 150, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !233, file: !193, line: 90)
!233 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !206, file: !206, line: 102, type: !234, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DISubroutineType(types: !235)
!235 = !{!19, !190, !200}
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !237, file: !193, line: 91)
!237 = !DISubprogram(name: "wctype", scope: !206, file: !206, line: 190, type: !238, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DISubroutineType(types: !239)
!239 = !{!200, !240}
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !242, file: !193, line: 92)
!242 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !206, file: !206, line: 156, type: !243, flags: DIFlagPrototyped, spFlags: 0)
!243 = !DISubroutineType(types: !244)
!244 = !{!190, !190}
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !246, file: !193, line: 93)
!246 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !206, file: !206, line: 162, type: !243, flags: DIFlagPrototyped, spFlags: 0)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !248, file: !193, line: 94)
!248 = !DISubprogram(name: "towctrans", scope: !213, file: !213, line: 124, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!249 = !DISubroutineType(types: !250)
!250 = !{!190, !190, !195}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !252, file: !193, line: 95)
!252 = !DISubprogram(name: "wctrans", scope: !213, file: !213, line: 126, type: !253, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DISubroutineType(types: !254)
!254 = !{!195, !240}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !256, file: !267, line: 133)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !257, line: 32, baseType: !258)
!257 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!258 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !140, line: 72, baseType: !259)
!259 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !140, line: 70, baseType: !260)
!260 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !140, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !261, identifier: "_ZTS11__mbstate_t")
!261 = !{!262, !266}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !260, file: !140, line: 68, baseType: !263, size: 1024)
!263 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 1024, elements: !264)
!264 = !{!265}
!265 = !DISubrange(count: 128)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !260, file: !140, line: 69, baseType: !24, size: 64)
!267 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !269, file: !267, line: 134)
!269 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !270, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !271, identifier: "_ZTS2tm")
!270 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!271 = !{!272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282}
!272 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !269, file: !270, line: 79, baseType: !19, size: 32)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !269, file: !270, line: 80, baseType: !19, size: 32, offset: 32)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !269, file: !270, line: 81, baseType: !19, size: 32, offset: 64)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !269, file: !270, line: 82, baseType: !19, size: 32, offset: 96)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !269, file: !270, line: 83, baseType: !19, size: 32, offset: 128)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !269, file: !270, line: 84, baseType: !19, size: 32, offset: 160)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !269, file: !270, line: 85, baseType: !19, size: 32, offset: 192)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !269, file: !270, line: 86, baseType: !19, size: 32, offset: 224)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !269, file: !270, line: 87, baseType: !19, size: 32, offset: 256)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !269, file: !270, line: 88, baseType: !141, size: 64, offset: 320)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !269, file: !270, line: 89, baseType: !283, size: 64, offset: 384)
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !190, file: !267, line: 135)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !286, file: !267, line: 136)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !287, line: 162, baseType: !288)
!287 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!288 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !287, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !289, identifier: "_ZTS7__sFILE")
!289 = !{!290, !292, !293, !294, !295, !296, !301, !302, !304, !308, !312, !320, !324, !325, !328, !329, !333, !337, !338, !339}
!290 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !288, file: !287, line: 132, baseType: !291, size: 64)
!291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !288, file: !287, line: 133, baseType: !19, size: 32, offset: 64)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !288, file: !287, line: 134, baseType: !19, size: 32, offset: 96)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !288, file: !287, line: 135, baseType: !87, size: 16, offset: 128)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !288, file: !287, line: 136, baseType: !87, size: 16, offset: 144)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !288, file: !287, line: 137, baseType: !297, size: 128, offset: 192)
!297 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !287, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !298, identifier: "_ZTS6__sbuf")
!298 = !{!299, !300}
!299 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !297, file: !287, line: 98, baseType: !291, size: 64)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !297, file: !287, line: 99, baseType: !19, size: 32, offset: 64)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !288, file: !287, line: 138, baseType: !19, size: 32, offset: 320)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !288, file: !287, line: 141, baseType: !303, size: 64, offset: 384)
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !288, file: !287, line: 142, baseType: !305, size: 64, offset: 448)
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64)
!306 = !DISubroutineType(types: !307)
!307 = !{!19, !303}
!308 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !288, file: !287, line: 143, baseType: !309, size: 64, offset: 512)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = !DISubroutineType(types: !311)
!311 = !{!19, !303, !283, !19}
!312 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !288, file: !287, line: 144, baseType: !313, size: 64, offset: 576)
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!314 = !DISubroutineType(types: !315)
!315 = !{!316, !303, !316, !19}
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !287, line: 86, baseType: !317)
!317 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !318, line: 83, baseType: !319)
!318 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!319 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !140, line: 37, baseType: !24)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !288, file: !287, line: 145, baseType: !321, size: 64, offset: 640)
!321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 64)
!322 = !DISubroutineType(types: !323)
!323 = !{!19, !303, !240, !19}
!324 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !288, file: !287, line: 148, baseType: !297, size: 128, offset: 704)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !288, file: !287, line: 149, baseType: !326, size: 64, offset: 832)
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 64)
!327 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !287, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!328 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !288, file: !287, line: 150, baseType: !19, size: 32, offset: 896)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !288, file: !287, line: 153, baseType: !330, size: 24, offset: 928)
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 24, elements: !331)
!331 = !{!332}
!332 = !DISubrange(count: 3)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !288, file: !287, line: 154, baseType: !334, size: 8, offset: 952)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 8, elements: !335)
!335 = !{!336}
!336 = !DISubrange(count: 1)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !288, file: !287, line: 157, baseType: !297, size: 128, offset: 960)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !288, file: !287, line: 160, baseType: !19, size: 32, offset: 1088)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !288, file: !287, line: 161, baseType: !316, size: 64, offset: 1152)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !341, file: !267, line: 137)
!341 = !DISubprogram(name: "fwprintf", scope: !342, file: !342, line: 107, type: !343, flags: DIFlagPrototyped, spFlags: 0)
!342 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!343 = !DISubroutineType(types: !344)
!344 = !{!19, !345, !346, null}
!345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 64)
!347 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !348)
!348 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !350, file: !267, line: 138)
!350 = !DISubprogram(name: "fwscanf", scope: !342, file: !342, line: 108, type: !343, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !352, file: !267, line: 139)
!352 = !DISubprogram(name: "swprintf", scope: !342, file: !342, line: 120, type: !353, flags: DIFlagPrototyped, spFlags: 0)
!353 = !DISubroutineType(types: !354)
!354 = !{!19, !355, !356, !346, null}
!355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !348, size: 64)
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !357, line: 50, baseType: !358)
!357 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !140, line: 87, baseType: !145)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !360, file: !267, line: 140)
!360 = !DISubprogram(name: "vfwprintf", scope: !342, file: !342, line: 124, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!361 = !DISubroutineType(types: !362)
!362 = !{!19, !345, !346, !363}
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !140, line: 95, baseType: !364)
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !28, baseType: !283)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !366, file: !267, line: 141)
!366 = !DISubprogram(name: "vswprintf", scope: !342, file: !342, line: 126, type: !367, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DISubroutineType(types: !368)
!368 = !{!19, !355, !356, !346, !363}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !370, file: !267, line: 142)
!370 = !DISubprogram(name: "swscanf", scope: !342, file: !342, line: 122, type: !371, flags: DIFlagPrototyped, spFlags: 0)
!371 = !DISubroutineType(types: !372)
!372 = !{!19, !346, !346, null}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !374, file: !267, line: 143)
!374 = !DISubprogram(name: "vfwscanf", scope: !342, file: !342, line: 195, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !376, file: !267, line: 144)
!376 = !DISubprogram(name: "vswscanf", scope: !342, file: !342, line: 197, type: !377, flags: DIFlagPrototyped, spFlags: 0)
!377 = !DISubroutineType(types: !378)
!378 = !{!19, !346, !346, !363}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !380, file: !267, line: 145)
!380 = !DISubprogram(name: "fgetwc", scope: !342, file: !342, line: 100, type: !381, flags: DIFlagPrototyped, spFlags: 0)
!381 = !DISubroutineType(types: !382)
!382 = !{!190, !345}
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !384, file: !267, line: 146)
!384 = !DISubprogram(name: "fgetws", scope: !342, file: !342, line: 102, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!385 = !DISubroutineType(types: !386)
!386 = !{!355, !355, !19, !345}
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !388, file: !267, line: 147)
!388 = !DISubprogram(name: "fputwc", scope: !342, file: !342, line: 104, type: !389, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DISubroutineType(types: !390)
!390 = !{!190, !348, !345}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !392, file: !267, line: 148)
!392 = !DISubprogram(name: "fputws", scope: !342, file: !342, line: 105, type: !393, flags: DIFlagPrototyped, spFlags: 0)
!393 = !DISubroutineType(types: !394)
!394 = !{!19, !346, !345}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !396, file: !267, line: 149)
!396 = !DISubprogram(name: "fwide", scope: !342, file: !342, line: 106, type: !397, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DISubroutineType(types: !398)
!398 = !{!19, !345, !19}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !400, file: !267, line: 150)
!400 = !DISubprogram(name: "getwc", scope: !342, file: !342, line: 109, type: !381, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !402, file: !267, line: 151)
!402 = !DISubprogram(name: "putwc", scope: !342, file: !342, line: 118, type: !389, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !404, file: !267, line: 152)
!404 = !DISubprogram(name: "ungetwc", scope: !342, file: !342, line: 123, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!405 = !DISubroutineType(types: !406)
!406 = !{!190, !190, !345}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !408, file: !267, line: 153)
!408 = !DISubprogram(name: "wcstod", scope: !342, file: !342, line: 160, type: !409, flags: DIFlagPrototyped, spFlags: 0)
!409 = !DISubroutineType(types: !410)
!410 = !{!411, !346, !412}
!411 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !355, size: 64)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !414, file: !267, line: 154)
!414 = !DISubprogram(name: "wcstof", scope: !342, file: !342, line: 200, type: !415, flags: DIFlagPrototyped, spFlags: 0)
!415 = !DISubroutineType(types: !416)
!416 = !{!417, !346, !412}
!417 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !419, file: !267, line: 155)
!419 = !DISubprogram(name: "wcstold", scope: !342, file: !342, line: 202, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!155, !346, !412}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !423, file: !267, line: 156)
!423 = !DISubprogram(name: "wcstol", scope: !342, file: !342, line: 164, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DISubroutineType(types: !425)
!425 = !{!141, !346, !412, !19}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !427, file: !267, line: 157)
!427 = !DISubprogram(name: "wcstoll", scope: !342, file: !342, line: 205, type: !428, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DISubroutineType(types: !429)
!429 = !{!24, !346, !412, !19}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !431, file: !267, line: 158)
!431 = !DISubprogram(name: "wcstoul", scope: !342, file: !342, line: 167, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!432 = !DISubroutineType(types: !433)
!433 = !{!145, !346, !412, !19}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !435, file: !267, line: 159)
!435 = !DISubprogram(name: "wcstoull", scope: !342, file: !342, line: 207, type: !436, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DISubroutineType(types: !437)
!437 = !{!102, !346, !412, !19}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !439, file: !267, line: 160)
!439 = !DISubprogram(name: "wcscpy", scope: !342, file: !342, line: 134, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{!355, !355, !346}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !443, file: !267, line: 161)
!443 = !DISubprogram(name: "wcsncpy", scope: !342, file: !342, line: 148, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{!355, !355, !346, !356}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !447, file: !267, line: 162)
!447 = !DISubprogram(name: "wcscat", scope: !342, file: !342, line: 130, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !449, file: !267, line: 163)
!449 = !DISubprogram(name: "wcsncat", scope: !342, file: !342, line: 142, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !451, file: !267, line: 164)
!451 = !DISubprogram(name: "wcscmp", scope: !342, file: !342, line: 132, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{!19, !346, !346}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !455, file: !267, line: 165)
!455 = !DISubprogram(name: "wcscoll", scope: !342, file: !342, line: 133, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !457, file: !267, line: 166)
!457 = !DISubprogram(name: "wcsncmp", scope: !342, file: !342, line: 145, type: !458, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{!19, !346, !346, !356}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !461, file: !267, line: 167)
!461 = !DISubprogram(name: "wcsxfrm", scope: !342, file: !342, line: 157, type: !462, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DISubroutineType(types: !463)
!463 = !{!356, !355, !346, !356}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !465, file: !267, line: 168)
!465 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !466, file: !466, line: 147, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!467 = !DISubroutineType(types: !468)
!468 = !{!355, !355, !348}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !470, file: !267, line: 169)
!470 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !466, file: !466, line: 158, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !472, file: !267, line: 170)
!472 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !466, file: !466, line: 168, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !474, file: !267, line: 171)
!474 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !466, file: !466, line: 179, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !476, file: !267, line: 172)
!476 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !466, file: !466, line: 190, type: !477, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DISubroutineType(types: !478)
!478 = !{!355, !355, !348, !356}
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !480, file: !267, line: 173)
!480 = !DISubprogram(name: "wcscspn", scope: !342, file: !342, line: 136, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DISubroutineType(types: !482)
!482 = !{!356, !346, !346}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !484, file: !267, line: 174)
!484 = !DISubprogram(name: "wcslen", scope: !342, file: !342, line: 140, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DISubroutineType(types: !486)
!486 = !{!356, !346}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !488, file: !267, line: 175)
!488 = !DISubprogram(name: "wcsspn", scope: !342, file: !342, line: 155, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !490, file: !267, line: 176)
!490 = !DISubprogram(name: "wcstok", scope: !342, file: !342, line: 162, type: !491, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DISubroutineType(types: !492)
!492 = !{!355, !355, !346, !412}
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !494, file: !267, line: 177)
!494 = !DISubprogram(name: "wmemcmp", scope: !342, file: !342, line: 170, type: !458, flags: DIFlagPrototyped, spFlags: 0)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !496, file: !267, line: 178)
!496 = !DISubprogram(name: "wmemcpy", scope: !342, file: !342, line: 173, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !498, file: !267, line: 179)
!498 = !DISubprogram(name: "wmemmove", scope: !342, file: !342, line: 176, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !500, file: !267, line: 180)
!500 = !DISubprogram(name: "wmemset", scope: !342, file: !342, line: 179, type: !477, flags: DIFlagPrototyped, spFlags: 0)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !502, file: !267, line: 181)
!502 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !342, file: !342, line: 137, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!356, !355, !356, !346, !505}
!505 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !506, size: 64)
!506 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !269)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !508, file: !267, line: 182)
!508 = !DISubprogram(name: "btowc", scope: !342, file: !342, line: 99, type: !509, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DISubroutineType(types: !510)
!510 = !{!190, !19}
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !512, file: !267, line: 183)
!512 = !DISubprogram(name: "wctob", scope: !342, file: !342, line: 159, type: !207, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !514, file: !267, line: 184)
!514 = !DISubprogram(name: "mbsinit", scope: !342, file: !342, line: 115, type: !515, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DISubroutineType(types: !516)
!516 = !{!19, !517}
!517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !518, size: 64)
!518 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !256)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !520, file: !267, line: 185)
!520 = !DISubprogram(name: "mbrlen", scope: !342, file: !342, line: 111, type: !521, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DISubroutineType(types: !522)
!522 = !{!356, !240, !356, !523}
!523 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !525, file: !267, line: 186)
!525 = !DISubprogram(name: "mbrtowc", scope: !342, file: !342, line: 113, type: !526, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DISubroutineType(types: !527)
!527 = !{!356, !355, !240, !356, !523}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !529, file: !267, line: 187)
!529 = !DISubprogram(name: "wcrtomb", scope: !342, file: !342, line: 129, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DISubroutineType(types: !531)
!531 = !{!356, !283, !348, !523}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !533, file: !267, line: 188)
!533 = !DISubprogram(name: "mbsrtowcs", scope: !342, file: !342, line: 116, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{!356, !355, !536, !356, !523}
!536 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !538, file: !267, line: 189)
!538 = !DISubprogram(name: "wcsrtombs", scope: !342, file: !342, line: 153, type: !539, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DISubroutineType(types: !540)
!540 = !{!356, !283, !541, !356, !523}
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 64)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !543, file: !267, line: 191)
!543 = !DISubprogram(name: "getwchar", scope: !342, file: !342, line: 110, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!190}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !547, file: !267, line: 192)
!547 = !DISubprogram(name: "vwscanf", scope: !342, file: !342, line: 199, type: !548, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DISubroutineType(types: !549)
!549 = !{!19, !346, !363}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !551, file: !267, line: 193)
!551 = !DISubprogram(name: "wscanf", scope: !342, file: !342, line: 181, type: !552, flags: DIFlagPrototyped, spFlags: 0)
!552 = !DISubroutineType(types: !553)
!553 = !{!19, !346, null}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !555, file: !267, line: 195)
!555 = !DISubprogram(name: "putwchar", scope: !342, file: !342, line: 119, type: !556, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DISubroutineType(types: !557)
!557 = !{!190, !348}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !559, file: !267, line: 196)
!559 = !DISubprogram(name: "vwprintf", scope: !342, file: !342, line: 128, type: !548, flags: DIFlagPrototyped, spFlags: 0)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !561, file: !267, line: 197)
!561 = !DISubprogram(name: "wprintf", scope: !342, file: !342, line: 180, type: !552, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !563, file: !569, line: 82)
!563 = !DISubprogram(name: "memcpy", scope: !564, file: !564, line: 78, type: !565, flags: DIFlagPrototyped, spFlags: 0)
!564 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!565 = !DISubroutineType(types: !566)
!566 = !{!303, !303, !567, !356}
!567 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64)
!568 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!569 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !571, file: !569, line: 83)
!571 = !DISubprogram(name: "memmove", scope: !564, file: !564, line: 81, type: !565, flags: DIFlagPrototyped, spFlags: 0)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !573, file: !569, line: 84)
!573 = !DISubprogram(name: "strcpy", scope: !564, file: !564, line: 92, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!283, !283, !240}
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !577, file: !569, line: 85)
!577 = !DISubprogram(name: "strncpy", scope: !564, file: !564, line: 104, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DISubroutineType(types: !579)
!579 = !{!283, !283, !240, !356}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !581, file: !569, line: 86)
!581 = !DISubprogram(name: "strcat", scope: !564, file: !564, line: 86, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !583, file: !569, line: 87)
!583 = !DISubprogram(name: "strncat", scope: !564, file: !564, line: 98, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !585, file: !569, line: 88)
!585 = !DISubprogram(name: "memcmp", scope: !564, file: !564, line: 75, type: !586, flags: DIFlagPrototyped, spFlags: 0)
!586 = !DISubroutineType(types: !587)
!587 = !{!19, !567, !567, !356}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !589, file: !569, line: 89)
!589 = !DISubprogram(name: "strcmp", scope: !564, file: !564, line: 89, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DISubroutineType(types: !591)
!591 = !{!19, !240, !240}
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !593, file: !569, line: 90)
!593 = !DISubprogram(name: "strncmp", scope: !564, file: !564, line: 101, type: !594, flags: DIFlagPrototyped, spFlags: 0)
!594 = !DISubroutineType(types: !595)
!595 = !{!19, !240, !240, !356}
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !597, file: !569, line: 91)
!597 = !DISubprogram(name: "strcoll", scope: !564, file: !564, line: 90, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !599, file: !569, line: 92)
!599 = !DISubprogram(name: "strxfrm", scope: !564, file: !564, line: 112, type: !600, flags: DIFlagPrototyped, spFlags: 0)
!600 = !DISubroutineType(types: !601)
!601 = !{!356, !283, !240, !356}
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !603, file: !569, line: 93)
!603 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !604, file: !604, line: 101, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!605 = !DISubroutineType(types: !606)
!606 = !{!303, !303, !19, !356}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !608, file: !569, line: 94)
!608 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !604, file: !604, line: 80, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!283, !283, !19}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !612, file: !569, line: 95)
!612 = !DISubprogram(name: "strcspn", scope: !564, file: !564, line: 94, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!356, !240, !240}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !616, file: !569, line: 96)
!616 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !604, file: !604, line: 87, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !618, file: !569, line: 97)
!618 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !604, file: !604, line: 94, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !620, file: !569, line: 98)
!620 = !DISubprogram(name: "strspn", scope: !564, file: !564, line: 109, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !622, file: !569, line: 99)
!622 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !604, file: !604, line: 108, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !624, file: !569, line: 100)
!624 = !DISubprogram(name: "strtok", scope: !564, file: !564, line: 111, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !626, file: !569, line: 101)
!626 = !DISubprogram(name: "memset", scope: !564, file: !564, line: 84, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !628, file: !569, line: 102)
!628 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !564, file: !564, line: 95, type: !629, flags: DIFlagPrototyped, spFlags: 0)
!629 = !DISubroutineType(types: !630)
!630 = !{!283, !19}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !632, file: !569, line: 103)
!632 = !DISubprogram(name: "strlen", scope: !564, file: !564, line: 96, type: !633, flags: DIFlagPrototyped, spFlags: 0)
!633 = !DISubroutineType(types: !634)
!634 = !{!356, !240}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !636, file: !642, line: 422)
!636 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !638, file: !637, line: 79, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!638 = !DINamespace(name: "__math", scope: !78)
!639 = !DISubroutineType(types: !640)
!640 = !{!641, !155}
!641 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!642 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !644, file: !642, line: 425)
!644 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !638, file: !637, line: 103, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !646, file: !642, line: 429)
!646 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !638, file: !637, line: 127, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !648, file: !642, line: 430)
!648 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !638, file: !637, line: 146, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !642, line: 485)
!650 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !638, file: !651, line: 55, type: !652, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!652 = !DISubroutineType(types: !653)
!653 = !{!155, !155, !654}
!654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !636, file: !656, line: 352)
!656 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !644, file: !656, line: 353)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !646, file: !656, line: 354)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !648, file: !656, line: 355)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !661, file: !656, line: 364)
!661 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !662, line: 50, baseType: !417)
!662 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !664, file: !656, line: 365)
!664 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !662, line: 51, baseType: !411)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !666, file: !656, line: 367)
!666 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !667, file: !667, line: 123, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!668 = !DISubroutineType(types: !669)
!669 = !{!155, !155}
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !671, file: !656, line: 370)
!671 = !DISubprogram(name: "acosf", scope: !662, file: !662, line: 314, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DISubroutineType(types: !673)
!673 = !{!417, !417}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !675, file: !656, line: 372)
!675 = !DISubprogram(name: "asinf", scope: !662, file: !662, line: 318, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !677, file: !656, line: 374)
!677 = !DISubprogram(name: "atanf", scope: !662, file: !662, line: 322, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !679, file: !656, line: 376)
!679 = !DISubprogram(name: "atan2f", scope: !662, file: !662, line: 326, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DISubroutineType(types: !681)
!681 = !{!417, !417, !417}
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !683, file: !656, line: 378)
!683 = !DISubprogram(name: "ceilf", scope: !662, file: !662, line: 461, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !685, file: !656, line: 380)
!685 = !DISubprogram(name: "cosf", scope: !662, file: !662, line: 330, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !687, file: !656, line: 382)
!687 = !DISubprogram(name: "coshf", scope: !662, file: !662, line: 354, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !689, file: !656, line: 385)
!689 = !DISubprogram(name: "expf", scope: !662, file: !662, line: 366, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !691, file: !656, line: 388)
!691 = !DISubprogram(name: "fabsf", scope: !662, file: !662, line: 422, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !693, file: !656, line: 390)
!693 = !DISubprogram(name: "floorf", scope: !662, file: !662, line: 465, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !695, file: !656, line: 393)
!695 = !DISubprogram(name: "fmodf", scope: !662, file: !662, line: 505, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !697, file: !656, line: 396)
!697 = !DISubprogram(name: "frexpf", scope: !662, file: !662, line: 406, type: !698, flags: DIFlagPrototyped, spFlags: 0)
!698 = !DISubroutineType(types: !699)
!699 = !{!417, !417, !700}
!700 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !702, file: !656, line: 398)
!702 = !DISubprogram(name: "ldexpf", scope: !662, file: !662, line: 402, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{!417, !417, !19}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !706, file: !656, line: 401)
!706 = !DISubprogram(name: "logf", scope: !662, file: !662, line: 378, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !708, file: !656, line: 404)
!708 = !DISubprogram(name: "log10f", scope: !662, file: !662, line: 382, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !650, file: !656, line: 405)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !711, file: !656, line: 406)
!711 = !DISubprogram(name: "modff", scope: !662, file: !662, line: 398, type: !712, flags: DIFlagPrototyped, spFlags: 0)
!712 = !DISubroutineType(types: !713)
!713 = !{!417, !417, !714}
!714 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !417, size: 64)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !716, file: !656, line: 409)
!716 = !DISubprogram(name: "powf", scope: !662, file: !662, line: 434, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !718, file: !656, line: 412)
!718 = !DISubprogram(name: "sinf", scope: !662, file: !662, line: 334, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !720, file: !656, line: 414)
!720 = !DISubprogram(name: "sinhf", scope: !662, file: !662, line: 358, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !722, file: !656, line: 417)
!722 = !DISubprogram(name: "sqrtf", scope: !662, file: !662, line: 438, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !724, file: !656, line: 419)
!724 = !DISubprogram(name: "tanf", scope: !662, file: !662, line: 338, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !726, file: !656, line: 422)
!726 = !DISubprogram(name: "tanhf", scope: !662, file: !662, line: 362, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !728, file: !656, line: 425)
!728 = !DISubprogram(name: "acoshf", scope: !662, file: !662, line: 342, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !730, file: !656, line: 427)
!730 = !DISubprogram(name: "asinhf", scope: !662, file: !662, line: 346, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !732, file: !656, line: 429)
!732 = !DISubprogram(name: "atanhf", scope: !662, file: !662, line: 350, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !734, file: !656, line: 431)
!734 = !DISubprogram(name: "cbrtf", scope: !662, file: !662, line: 426, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !736, file: !656, line: 434)
!736 = !DISubprogram(name: "copysignf", scope: !662, file: !662, line: 517, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !738, file: !656, line: 437)
!738 = !DISubprogram(name: "erff", scope: !662, file: !662, line: 442, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !740, file: !656, line: 439)
!740 = !DISubprogram(name: "erfcf", scope: !662, file: !662, line: 446, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !742, file: !656, line: 441)
!742 = !DISubprogram(name: "exp2f", scope: !662, file: !662, line: 370, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !744, file: !656, line: 443)
!744 = !DISubprogram(name: "expm1f", scope: !662, file: !662, line: 374, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !746, file: !656, line: 445)
!746 = !DISubprogram(name: "fdimf", scope: !662, file: !662, line: 533, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !748, file: !656, line: 446)
!748 = !DISubprogram(name: "fmaf", scope: !662, file: !662, line: 545, type: !749, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DISubroutineType(types: !750)
!750 = !{!417, !417, !417, !417}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !752, file: !656, line: 449)
!752 = !DISubprogram(name: "fmaxf", scope: !662, file: !662, line: 537, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !754, file: !656, line: 451)
!754 = !DISubprogram(name: "fminf", scope: !662, file: !662, line: 541, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !756, file: !656, line: 453)
!756 = !DISubprogram(name: "hypotf", scope: !662, file: !662, line: 430, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !758, file: !656, line: 455)
!758 = !DISubprogram(name: "ilogbf", scope: !662, file: !662, line: 410, type: !759, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DISubroutineType(types: !760)
!760 = !{!19, !417}
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !762, file: !656, line: 457)
!762 = !DISubprogram(name: "lgammaf", scope: !662, file: !662, line: 453, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !764, file: !656, line: 459)
!764 = !DISubprogram(name: "llrintf", scope: !662, file: !662, line: 492, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!24, !417}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !768, file: !656, line: 461)
!768 = !DISubprogram(name: "llroundf", scope: !662, file: !662, line: 496, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !770, file: !656, line: 463)
!770 = !DISubprogram(name: "log1pf", scope: !662, file: !662, line: 390, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !772, file: !656, line: 465)
!772 = !DISubprogram(name: "log2f", scope: !662, file: !662, line: 386, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !774, file: !656, line: 467)
!774 = !DISubprogram(name: "logbf", scope: !662, file: !662, line: 394, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !776, file: !656, line: 469)
!776 = !DISubprogram(name: "lrintf", scope: !662, file: !662, line: 477, type: !777, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DISubroutineType(types: !778)
!778 = !{!141, !417}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !780, file: !656, line: 471)
!780 = !DISubprogram(name: "lroundf", scope: !662, file: !662, line: 485, type: !777, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !782, file: !656, line: 473)
!782 = !DISubprogram(name: "nan", scope: !662, file: !662, line: 522, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!411, !240}
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !786, file: !656, line: 474)
!786 = !DISubprogram(name: "nanf", scope: !662, file: !662, line: 521, type: !787, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DISubroutineType(types: !788)
!788 = !{!417, !240}
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !790, file: !656, line: 477)
!790 = !DISubprogram(name: "nearbyintf", scope: !662, file: !662, line: 469, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !792, file: !656, line: 479)
!792 = !DISubprogram(name: "nextafterf", scope: !662, file: !662, line: 525, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !794, file: !656, line: 481)
!794 = !DISubprogram(name: "nexttowardf", scope: !662, file: !662, line: 530, type: !795, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DISubroutineType(types: !796)
!796 = !{!417, !417, !155}
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !798, file: !656, line: 483)
!798 = !DISubprogram(name: "remainderf", scope: !662, file: !662, line: 509, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !800, file: !656, line: 485)
!800 = !DISubprogram(name: "remquof", scope: !662, file: !662, line: 513, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DISubroutineType(types: !802)
!802 = !{!417, !417, !417, !700}
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !804, file: !656, line: 487)
!804 = !DISubprogram(name: "rintf", scope: !662, file: !662, line: 473, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !806, file: !656, line: 489)
!806 = !DISubprogram(name: "roundf", scope: !662, file: !662, line: 481, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !808, file: !656, line: 491)
!808 = !DISubprogram(name: "scalblnf", scope: !662, file: !662, line: 418, type: !809, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DISubroutineType(types: !810)
!810 = !{!417, !417, !141}
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !812, file: !656, line: 493)
!812 = !DISubprogram(name: "scalbnf", scope: !662, file: !662, line: 414, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !814, file: !656, line: 495)
!814 = !DISubprogram(name: "tgammaf", scope: !662, file: !662, line: 457, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !816, file: !656, line: 497)
!816 = !DISubprogram(name: "truncf", scope: !662, file: !662, line: 501, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !818, file: !656, line: 499)
!818 = !DISubprogram(name: "acosl", scope: !662, file: !662, line: 316, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !820, file: !656, line: 500)
!820 = !DISubprogram(name: "asinl", scope: !662, file: !662, line: 320, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !822, file: !656, line: 501)
!822 = !DISubprogram(name: "atanl", scope: !662, file: !662, line: 324, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !824, file: !656, line: 502)
!824 = !DISubprogram(name: "atan2l", scope: !662, file: !662, line: 328, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!825 = !DISubroutineType(types: !826)
!826 = !{!155, !155, !155}
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !828, file: !656, line: 503)
!828 = !DISubprogram(name: "ceill", scope: !662, file: !662, line: 463, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !830, file: !656, line: 504)
!830 = !DISubprogram(name: "cosl", scope: !662, file: !662, line: 332, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !832, file: !656, line: 505)
!832 = !DISubprogram(name: "coshl", scope: !662, file: !662, line: 356, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !834, file: !656, line: 506)
!834 = !DISubprogram(name: "expl", scope: !662, file: !662, line: 368, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !836, file: !656, line: 507)
!836 = !DISubprogram(name: "fabsl", scope: !662, file: !662, line: 424, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !838, file: !656, line: 508)
!838 = !DISubprogram(name: "floorl", scope: !662, file: !662, line: 467, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !840, file: !656, line: 509)
!840 = !DISubprogram(name: "fmodl", scope: !662, file: !662, line: 507, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !842, file: !656, line: 510)
!842 = !DISubprogram(name: "frexpl", scope: !662, file: !662, line: 408, type: !843, flags: DIFlagPrototyped, spFlags: 0)
!843 = !DISubroutineType(types: !844)
!844 = !{!155, !155, !700}
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !846, file: !656, line: 511)
!846 = !DISubprogram(name: "ldexpl", scope: !662, file: !662, line: 404, type: !847, flags: DIFlagPrototyped, spFlags: 0)
!847 = !DISubroutineType(types: !848)
!848 = !{!155, !155, !19}
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !850, file: !656, line: 512)
!850 = !DISubprogram(name: "logl", scope: !662, file: !662, line: 380, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !852, file: !656, line: 513)
!852 = !DISubprogram(name: "log10l", scope: !662, file: !662, line: 384, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !854, file: !656, line: 514)
!854 = !DISubprogram(name: "modfl", scope: !662, file: !662, line: 400, type: !652, flags: DIFlagPrototyped, spFlags: 0)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !856, file: !656, line: 515)
!856 = !DISubprogram(name: "powl", scope: !662, file: !662, line: 436, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !858, file: !656, line: 516)
!858 = !DISubprogram(name: "sinl", scope: !662, file: !662, line: 336, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !860, file: !656, line: 517)
!860 = !DISubprogram(name: "sinhl", scope: !662, file: !662, line: 360, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !862, file: !656, line: 518)
!862 = !DISubprogram(name: "sqrtl", scope: !662, file: !662, line: 440, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !864, file: !656, line: 519)
!864 = !DISubprogram(name: "tanl", scope: !662, file: !662, line: 340, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !866, file: !656, line: 521)
!866 = !DISubprogram(name: "tanhl", scope: !662, file: !662, line: 364, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !868, file: !656, line: 522)
!868 = !DISubprogram(name: "acoshl", scope: !662, file: !662, line: 344, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !870, file: !656, line: 523)
!870 = !DISubprogram(name: "asinhl", scope: !662, file: !662, line: 348, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !872, file: !656, line: 524)
!872 = !DISubprogram(name: "atanhl", scope: !662, file: !662, line: 352, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !874, file: !656, line: 525)
!874 = !DISubprogram(name: "cbrtl", scope: !662, file: !662, line: 428, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !876, file: !656, line: 527)
!876 = !DISubprogram(name: "copysignl", scope: !662, file: !662, line: 519, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !878, file: !656, line: 529)
!878 = !DISubprogram(name: "erfl", scope: !662, file: !662, line: 444, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !880, file: !656, line: 530)
!880 = !DISubprogram(name: "erfcl", scope: !662, file: !662, line: 448, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !882, file: !656, line: 531)
!882 = !DISubprogram(name: "exp2l", scope: !662, file: !662, line: 372, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !884, file: !656, line: 532)
!884 = !DISubprogram(name: "expm1l", scope: !662, file: !662, line: 376, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !886, file: !656, line: 533)
!886 = !DISubprogram(name: "fdiml", scope: !662, file: !662, line: 535, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !888, file: !656, line: 534)
!888 = !DISubprogram(name: "fmal", scope: !662, file: !662, line: 547, type: !889, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DISubroutineType(types: !890)
!890 = !{!155, !155, !155, !155}
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !892, file: !656, line: 535)
!892 = !DISubprogram(name: "fmaxl", scope: !662, file: !662, line: 539, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !894, file: !656, line: 536)
!894 = !DISubprogram(name: "fminl", scope: !662, file: !662, line: 543, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !896, file: !656, line: 537)
!896 = !DISubprogram(name: "hypotl", scope: !662, file: !662, line: 432, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !898, file: !656, line: 538)
!898 = !DISubprogram(name: "ilogbl", scope: !662, file: !662, line: 412, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DISubroutineType(types: !900)
!900 = !{!19, !155}
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !902, file: !656, line: 539)
!902 = !DISubprogram(name: "lgammal", scope: !662, file: !662, line: 455, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !904, file: !656, line: 540)
!904 = !DISubprogram(name: "llrintl", scope: !662, file: !662, line: 494, type: !905, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DISubroutineType(types: !906)
!906 = !{!24, !155}
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !908, file: !656, line: 541)
!908 = !DISubprogram(name: "llroundl", scope: !662, file: !662, line: 498, type: !905, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !910, file: !656, line: 542)
!910 = !DISubprogram(name: "log1pl", scope: !662, file: !662, line: 392, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !912, file: !656, line: 543)
!912 = !DISubprogram(name: "log2l", scope: !662, file: !662, line: 388, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !914, file: !656, line: 544)
!914 = !DISubprogram(name: "logbl", scope: !662, file: !662, line: 396, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !916, file: !656, line: 545)
!916 = !DISubprogram(name: "lrintl", scope: !662, file: !662, line: 479, type: !917, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DISubroutineType(types: !918)
!918 = !{!141, !155}
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !920, file: !656, line: 546)
!920 = !DISubprogram(name: "lroundl", scope: !662, file: !662, line: 487, type: !917, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !922, file: !656, line: 547)
!922 = !DISubprogram(name: "nanl", scope: !662, file: !662, line: 523, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DISubroutineType(types: !924)
!924 = !{!155, !240}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !926, file: !656, line: 548)
!926 = !DISubprogram(name: "nearbyintl", scope: !662, file: !662, line: 471, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !928, file: !656, line: 549)
!928 = !DISubprogram(name: "nextafterl", scope: !662, file: !662, line: 527, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !930, file: !656, line: 550)
!930 = !DISubprogram(name: "nexttowardl", scope: !662, file: !662, line: 531, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !932, file: !656, line: 551)
!932 = !DISubprogram(name: "remainderl", scope: !662, file: !662, line: 511, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !934, file: !656, line: 552)
!934 = !DISubprogram(name: "remquol", scope: !662, file: !662, line: 515, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DISubroutineType(types: !936)
!936 = !{!155, !155, !155, !700}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !938, file: !656, line: 553)
!938 = !DISubprogram(name: "rintl", scope: !662, file: !662, line: 475, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !940, file: !656, line: 554)
!940 = !DISubprogram(name: "roundl", scope: !662, file: !662, line: 483, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !942, file: !656, line: 555)
!942 = !DISubprogram(name: "scalblnl", scope: !662, file: !662, line: 420, type: !943, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DISubroutineType(types: !944)
!944 = !{!155, !155, !141}
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !946, file: !656, line: 556)
!946 = !DISubprogram(name: "scalbnl", scope: !662, file: !662, line: 416, type: !847, flags: DIFlagPrototyped, spFlags: 0)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !948, file: !656, line: 557)
!948 = !DISubprogram(name: "tgammal", scope: !662, file: !662, line: 459, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !950, file: !656, line: 558)
!950 = !DISubprogram(name: "truncl", scope: !662, file: !662, line: 503, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !952, entity: !953, file: !955, line: 536)
!952 = !DINamespace(name: "chrono", scope: !78)
!953 = !DINamespace(name: "chrono_literals", scope: !954, exportSymbols: true)
!954 = !DINamespace(name: "literals", scope: !78, exportSymbols: true)
!955 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !957, file: !960, line: 68)
!957 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !958, line: 31, baseType: !959)
!958 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!959 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !140, line: 116, baseType: !145)
!960 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !962, file: !960, line: 69)
!962 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !963, line: 31, baseType: !964)
!963 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!964 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !140, line: 119, baseType: !141)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !269, file: !960, line: 70)
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !967, file: !960, line: 74)
!967 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !270, file: !270, line: 112, type: !968, flags: DIFlagPrototyped, spFlags: 0)
!968 = !DISubroutineType(types: !969)
!969 = !{!957}
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !971, file: !960, line: 75)
!971 = !DISubprogram(name: "difftime", scope: !270, file: !270, line: 114, type: !972, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DISubroutineType(types: !973)
!973 = !{!411, !962, !962}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !975, file: !960, line: 76)
!975 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !270, file: !270, line: 118, type: !976, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DISubroutineType(types: !977)
!977 = !{!962, !978}
!978 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !980, file: !960, line: 77)
!980 = !DISubprogram(name: "time", scope: !270, file: !270, line: 121, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DISubroutineType(types: !982)
!982 = !{!962, !983}
!983 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !962, size: 64)
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !985, file: !960, line: 78)
!985 = !DISubprogram(name: "asctime", scope: !270, file: !270, line: 111, type: !986, flags: DIFlagPrototyped, spFlags: 0)
!986 = !DISubroutineType(types: !987)
!987 = !{!283, !505}
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !989, file: !960, line: 79)
!989 = !DISubprogram(name: "ctime", scope: !270, file: !270, line: 113, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!990 = !DISubroutineType(types: !991)
!991 = !{!283, !992}
!992 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !993, size: 64)
!993 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !962)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !995, file: !960, line: 80)
!995 = !DISubprogram(name: "gmtime", scope: !270, file: !270, line: 116, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DISubroutineType(types: !997)
!997 = !{!978, !992}
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !999, file: !960, line: 81)
!999 = !DISubprogram(name: "localtime", scope: !270, file: !270, line: 117, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1001, file: !960, line: 82)
!1001 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !270, file: !270, line: 119, type: !1002, flags: DIFlagPrototyped, spFlags: 0)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!356, !283, !356, !240, !505}
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1005, file: !1011, line: 106)
!1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1006, line: 105, baseType: !1007)
!1006 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!1007 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1006, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !1008, identifier: "_ZTS5div_t")
!1008 = !{!1009, !1010}
!1009 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1007, file: !1006, line: 103, baseType: !19, size: 32)
!1010 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1007, file: !1006, line: 104, baseType: !19, size: 32, offset: 32)
!1011 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1013, file: !1011, line: 107)
!1013 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1006, line: 110, baseType: !1014)
!1014 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1006, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !1015, identifier: "_ZTS6ldiv_t")
!1015 = !{!1016, !1017}
!1016 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1014, file: !1006, line: 108, baseType: !141, size: 64)
!1017 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1014, file: !1006, line: 109, baseType: !141, size: 64, offset: 64)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1019, file: !1011, line: 108)
!1019 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1006, line: 116, baseType: !1020)
!1020 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1006, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !1021, identifier: "_ZTS7lldiv_t")
!1021 = !{!1022, !1023}
!1022 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1020, file: !1006, line: 114, baseType: !24, size: 64)
!1023 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1020, file: !1006, line: 115, baseType: !24, size: 64, offset: 64)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1025, file: !1011, line: 109)
!1025 = !DISubprogram(name: "atof", scope: !1006, file: !1006, line: 149, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1027, file: !1011, line: 110)
!1027 = !DISubprogram(name: "atoi", scope: !1006, file: !1006, line: 150, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!19, !240}
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1031, file: !1011, line: 111)
!1031 = !DISubprogram(name: "atol", scope: !1006, file: !1006, line: 151, type: !1032, flags: DIFlagPrototyped, spFlags: 0)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!141, !240}
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1035, file: !1011, line: 112)
!1035 = !DISubprogram(name: "atoll", scope: !1006, file: !1006, line: 154, type: !1036, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!24, !240}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1039, file: !1011, line: 113)
!1039 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !1006, file: !1006, line: 184, type: !1040, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!411, !240, !1042}
!1042 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1044, file: !1011, line: 114)
!1044 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !1006, file: !1006, line: 185, type: !1045, flags: DIFlagPrototyped, spFlags: 0)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!417, !240, !1042}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1048, file: !1011, line: 115)
!1048 = !DISubprogram(name: "strtold", scope: !1006, file: !1006, line: 188, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!155, !240, !1042}
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1052, file: !1011, line: 116)
!1052 = !DISubprogram(name: "strtol", scope: !1006, file: !1006, line: 186, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!141, !240, !1042, !19}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1056, file: !1011, line: 117)
!1056 = !DISubprogram(name: "strtoll", scope: !1006, file: !1006, line: 191, type: !1057, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!24, !240, !1042, !19}
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1060, file: !1011, line: 118)
!1060 = !DISubprogram(name: "strtoul", scope: !1006, file: !1006, line: 194, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!145, !240, !1042, !19}
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1064, file: !1011, line: 119)
!1064 = !DISubprogram(name: "strtoull", scope: !1006, file: !1006, line: 197, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!102, !240, !1042, !19}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1068, file: !1011, line: 120)
!1068 = !DISubprogram(name: "rand", scope: !1006, file: !1006, line: 181, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!19}
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1072, file: !1011, line: 121)
!1072 = !DISubprogram(name: "srand", scope: !1006, file: !1006, line: 183, type: !1073, flags: DIFlagPrototyped, spFlags: 0)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{null, !98}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1076, file: !1011, line: 122)
!1076 = !DISubprogram(name: "calloc", scope: !1077, file: !1077, line: 55, type: !1078, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!303, !356, !356}
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1081, file: !1011, line: 123)
!1081 = !DISubprogram(name: "free", scope: !1077, file: !1077, line: 56, type: !1082, flags: DIFlagPrototyped, spFlags: 0)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{null, !303}
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1085, file: !1011, line: 124)
!1085 = !DISubprogram(name: "malloc", scope: !1077, file: !1077, line: 54, type: !1086, flags: DIFlagPrototyped, spFlags: 0)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!303, !356}
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1089, file: !1011, line: 125)
!1089 = !DISubprogram(name: "realloc", scope: !1077, file: !1077, line: 57, type: !1090, flags: DIFlagPrototyped, spFlags: 0)
!1090 = !DISubroutineType(types: !1091)
!1091 = !{!303, !303, !356}
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1093, file: !1011, line: 126)
!1093 = !DISubprogram(name: "abort", scope: !1094, file: !1094, line: 33, type: !1095, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1094 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!1095 = !DISubroutineType(types: !1096)
!1096 = !{null}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1098, file: !1011, line: 127)
!1098 = !DISubprogram(name: "atexit", scope: !1006, file: !1006, line: 144, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!19, !1101}
!1101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1095, size: 64)
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1103, file: !1011, line: 128)
!1103 = !DISubprogram(name: "exit", scope: !1006, file: !1006, line: 160, type: !1104, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{null, !19}
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1107, file: !1011, line: 129)
!1107 = !DISubprogram(name: "_Exit", scope: !1006, file: !1006, line: 210, type: !1104, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1109, file: !1011, line: 130)
!1109 = !DISubprogram(name: "getenv", scope: !1006, file: !1006, line: 162, type: !1110, flags: DIFlagPrototyped, spFlags: 0)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{!283, !240}
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1113, file: !1011, line: 131)
!1113 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !1006, file: !1006, line: 203, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1115, file: !1011, line: 132)
!1115 = !DISubprogram(name: "bsearch", scope: !1006, file: !1006, line: 156, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!303, !567, !567, !356, !356, !1118}
!1118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1119, size: 64)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!19, !567, !567}
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1122, file: !1011, line: 133)
!1122 = !DISubprogram(name: "qsort", scope: !1006, file: !1006, line: 175, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{null, !303, !356, !356, !1118}
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !666, file: !1011, line: 134)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1127, file: !1011, line: 135)
!1127 = !DISubprogram(name: "labs", scope: !1006, file: !1006, line: 163, type: !1128, flags: DIFlagPrototyped, spFlags: 0)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!141, !141}
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1131, file: !1011, line: 136)
!1131 = !DISubprogram(name: "llabs", scope: !1006, file: !1006, line: 167, type: !1132, flags: DIFlagPrototyped, spFlags: 0)
!1132 = !DISubroutineType(types: !1133)
!1133 = !{!24, !24}
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1135, file: !1011, line: 137)
!1135 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !667, file: !667, line: 143, type: !1136, flags: DIFlagPrototyped, spFlags: 0)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!1019, !24, !24}
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1139, file: !1011, line: 138)
!1139 = !DISubprogram(name: "ldiv", scope: !1006, file: !1006, line: 164, type: !1140, flags: DIFlagPrototyped, spFlags: 0)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!1013, !141, !141}
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1143, file: !1011, line: 139)
!1143 = !DISubprogram(name: "lldiv", scope: !1006, file: !1006, line: 168, type: !1136, flags: DIFlagPrototyped, spFlags: 0)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1145, file: !1011, line: 140)
!1145 = !DISubprogram(name: "mblen", scope: !1006, file: !1006, line: 171, type: !1146, flags: DIFlagPrototyped, spFlags: 0)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{!19, !240, !356}
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1149, file: !1011, line: 142)
!1149 = !DISubprogram(name: "mbtowc", scope: !1006, file: !1006, line: 173, type: !1150, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!19, !355, !240, !356}
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1153, file: !1011, line: 143)
!1153 = !DISubprogram(name: "wctomb", scope: !1006, file: !1006, line: 207, type: !1154, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!19, !283, !348}
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1157, file: !1011, line: 144)
!1157 = !DISubprogram(name: "mbstowcs", scope: !1006, file: !1006, line: 172, type: !1158, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!356, !355, !240, !356}
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1161, file: !1011, line: 145)
!1161 = !DISubprogram(name: "wcstombs", scope: !1006, file: !1006, line: 206, type: !1162, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!356, !283, !346, !356}
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1165, file: !1011, line: 148)
!1165 = !DISubprogram(name: "at_quick_exit", scope: !1006, file: !1006, line: 147, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1167, file: !1011, line: 149)
!1167 = !DISubprogram(name: "quick_exit", scope: !1006, file: !1006, line: 179, type: !1104, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !256, file: !1169, line: 25)
!1169 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !286, file: !1171, line: 120)
!1171 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !316, file: !1171, line: 121)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1174, file: !1171, line: 123)
!1174 = !DISubprogram(name: "fclose", scope: !287, file: !287, line: 233, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!19, !345}
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1178, file: !1171, line: 124)
!1178 = !DISubprogram(name: "fflush", scope: !287, file: !287, line: 236, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1180, file: !1171, line: 125)
!1180 = !DISubprogram(name: "setbuf", scope: !287, file: !287, line: 272, type: !1181, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{null, !345, !283}
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1184, file: !1171, line: 126)
!1184 = !DISubprogram(name: "setvbuf", scope: !287, file: !287, line: 273, type: !1185, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DISubroutineType(types: !1186)
!1186 = !{!19, !345, !283, !19, !356}
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1188, file: !1171, line: 127)
!1188 = !DISubprogram(name: "fprintf", scope: !287, file: !287, line: 245, type: !1189, flags: DIFlagPrototyped, spFlags: 0)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!19, !345, !240, null}
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1192, file: !1171, line: 128)
!1192 = !DISubprogram(name: "fscanf", scope: !287, file: !287, line: 251, type: !1189, flags: DIFlagPrototyped, spFlags: 0)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1194, file: !1171, line: 129)
!1194 = !DISubprogram(name: "snprintf", scope: !287, file: !287, line: 435, type: !1195, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!19, !283, !356, !240, null}
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1198, file: !1171, line: 130)
!1198 = !DISubprogram(name: "sprintf", scope: !287, file: !287, line: 280, type: !1199, flags: DIFlagPrototyped, spFlags: 0)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!19, !283, !240, null}
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1202, file: !1171, line: 131)
!1202 = !DISubprogram(name: "sscanf", scope: !287, file: !287, line: 282, type: !1203, flags: DIFlagPrototyped, spFlags: 0)
!1203 = !DISubroutineType(types: !1204)
!1204 = !{!19, !240, !240, null}
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1206, file: !1171, line: 132)
!1206 = !DISubprogram(name: "vfprintf", scope: !287, file: !287, line: 292, type: !1207, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DISubroutineType(types: !1208)
!1208 = !{!19, !345, !240, !1209}
!1209 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1210, line: 44, baseType: !363)
!1210 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1212, file: !1171, line: 133)
!1212 = !DISubprogram(name: "vfscanf", scope: !287, file: !287, line: 436, type: !1207, flags: DIFlagPrototyped, spFlags: 0)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1214, file: !1171, line: 134)
!1214 = !DISubprogram(name: "vsscanf", scope: !287, file: !287, line: 439, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{!19, !240, !240, !1209}
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1218, file: !1171, line: 135)
!1218 = !DISubprogram(name: "vsnprintf", scope: !287, file: !287, line: 438, type: !1219, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DISubroutineType(types: !1220)
!1220 = !{!19, !283, !356, !240, !1209}
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1222, file: !1171, line: 136)
!1222 = !DISubprogram(name: "vsprintf", scope: !287, file: !287, line: 300, type: !1223, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!19, !283, !240, !1209}
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1226, file: !1171, line: 137)
!1226 = !DISubprogram(name: "fgetc", scope: !287, file: !287, line: 237, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1228, file: !1171, line: 138)
!1228 = !DISubprogram(name: "fgets", scope: !287, file: !287, line: 239, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!283, !283, !19, !345}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1232, file: !1171, line: 139)
!1232 = !DISubprogram(name: "fputc", scope: !287, file: !287, line: 246, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!19, !19, !345}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1236, file: !1171, line: 140)
!1236 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !287, file: !287, line: 247, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!19, !240, !345}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1240, file: !1171, line: 141)
!1240 = !DISubprogram(name: "getc", scope: !287, file: !287, line: 256, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1242, file: !1171, line: 142)
!1242 = !DISubprogram(name: "putc", scope: !287, file: !287, line: 265, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1244, file: !1171, line: 143)
!1244 = !DISubprogram(name: "ungetc", scope: !287, file: !287, line: 291, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1246, file: !1171, line: 144)
!1246 = !DISubprogram(name: "fread", scope: !287, file: !287, line: 248, type: !1247, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!356, !303, !356, !356, !345}
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1250, file: !1171, line: 145)
!1250 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !287, file: !287, line: 255, type: !1251, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DISubroutineType(types: !1252)
!1252 = !{!356, !567, !356, !356, !345}
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1254, file: !1171, line: 146)
!1254 = !DISubprogram(name: "fgetpos", scope: !287, file: !287, line: 238, type: !1255, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!19, !345, !1257}
!1257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1259, file: !1171, line: 147)
!1259 = !DISubprogram(name: "fseek", scope: !287, file: !287, line: 252, type: !1260, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!19, !345, !141, !19}
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1263, file: !1171, line: 148)
!1263 = !DISubprogram(name: "fsetpos", scope: !287, file: !287, line: 253, type: !1264, flags: DIFlagPrototyped, spFlags: 0)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!19, !345, !1266}
!1266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1267, size: 64)
!1267 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !316)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1269, file: !1171, line: 149)
!1269 = !DISubprogram(name: "ftell", scope: !287, file: !287, line: 254, type: !1270, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!141, !345}
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1273, file: !1171, line: 150)
!1273 = !DISubprogram(name: "rewind", scope: !287, file: !287, line: 270, type: !1274, flags: DIFlagPrototyped, spFlags: 0)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{null, !345}
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1277, file: !1171, line: 151)
!1277 = !DISubprogram(name: "clearerr", scope: !287, file: !287, line: 232, type: !1274, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1279, file: !1171, line: 152)
!1279 = !DISubprogram(name: "feof", scope: !287, file: !287, line: 234, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1281, file: !1171, line: 153)
!1281 = !DISubprogram(name: "ferror", scope: !287, file: !287, line: 235, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1283, file: !1171, line: 154)
!1283 = !DISubprogram(name: "perror", scope: !287, file: !287, line: 264, type: !1284, flags: DIFlagPrototyped, spFlags: 0)
!1284 = !DISubroutineType(types: !1285)
!1285 = !{null, !240}
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1287, file: !1171, line: 156)
!1287 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !287, file: !287, line: 243, type: !1288, flags: DIFlagPrototyped, spFlags: 0)
!1288 = !DISubroutineType(types: !1289)
!1289 = !{!345, !240, !240}
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1291, file: !1171, line: 157)
!1291 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !287, file: !287, line: 249, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1292 = !DISubroutineType(types: !1293)
!1293 = !{!345, !240, !240, !345}
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1295, file: !1171, line: 158)
!1295 = !DISubprogram(name: "remove", scope: !287, file: !287, line: 268, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1297, file: !1171, line: 159)
!1297 = !DISubprogram(name: "rename", scope: !287, file: !287, line: 269, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1299, file: !1171, line: 160)
!1299 = !DISubprogram(name: "tmpfile", scope: !287, file: !287, line: 283, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!345}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1303, file: !1171, line: 161)
!1303 = !DISubprogram(name: "tmpnam", scope: !287, file: !287, line: 289, type: !1304, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{!283, !283}
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1307, file: !1171, line: 163)
!1307 = !DISubprogram(name: "getchar", scope: !287, file: !287, line: 257, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1309, file: !1171, line: 167)
!1309 = !DISubprogram(name: "scanf", scope: !287, file: !287, line: 271, type: !1310, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!19, !240, null}
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1313, file: !1171, line: 168)
!1313 = !DISubprogram(name: "vscanf", scope: !287, file: !287, line: 437, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{!19, !240, !1209}
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1317, file: !1171, line: 170)
!1317 = !DISubprogram(name: "printf", scope: !1318, file: !1318, line: 34, type: !1310, flags: DIFlagPrototyped, spFlags: 0)
!1318 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1320, file: !1171, line: 171)
!1320 = !DISubprogram(name: "putchar", scope: !287, file: !287, line: 266, type: !160, flags: DIFlagPrototyped, spFlags: 0)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1322, file: !1171, line: 172)
!1322 = !DISubprogram(name: "puts", scope: !287, file: !287, line: 267, type: !1028, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !78, entity: !1324, file: !1171, line: 173)
!1324 = !DISubprogram(name: "vprintf", scope: !287, file: !287, line: 293, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1326, size: 1128320, elements: !1477)
!1326 = !DIDerivedType(tag: DW_TAG_typedef, name: "morph_data", file: !1327, line: 35, baseType: !1328)
!1327 = !DIFile(filename: "main_d2/morph.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "01a7fae5e62f027cf924e492070aaff3")
!1328 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "morph_data", file: !1327, line: 21, size: 225664, flags: DIFlagTypePassByValue, elements: !1329, identifier: "_ZTS10morph_data")
!1329 = !{!1330, !1461, !1465, !1466, !1468, !1470, !1471, !1472, !1473, !1474, !1475, !1476}
!1330 = !DIDerivedType(tag: DW_TAG_member, name: "obj", scope: !1328, file: !1327, line: 23, baseType: !1331, size: 64)
!1331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1332, size: 64)
!1332 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !1333, line: 259, baseType: !1334)
!1333 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!1334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !1333, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !1335, identifier: "_ZTS6object")
!1335 = !{!1336, !1337, !1338, !1339, !1340, !1341, !1342, !1343, !1344, !1345, !1346, !1347, !1348, !1355, !1356, !1357, !1358, !1359, !1360, !1361, !1362, !1363, !1381, !1433}
!1336 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !1334, file: !1333, line: 212, baseType: !19, size: 32)
!1337 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1334, file: !1333, line: 213, baseType: !91, size: 8, offset: 32)
!1338 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !1334, file: !1333, line: 214, baseType: !91, size: 8, offset: 40)
!1339 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !1334, file: !1333, line: 215, baseType: !87, size: 16, offset: 48)
!1340 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !1334, file: !1333, line: 215, baseType: !87, size: 16, offset: 64)
!1341 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !1334, file: !1333, line: 216, baseType: !91, size: 8, offset: 80)
!1342 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !1334, file: !1333, line: 217, baseType: !91, size: 8, offset: 88)
!1343 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !1334, file: !1333, line: 218, baseType: !91, size: 8, offset: 96)
!1344 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1334, file: !1333, line: 219, baseType: !91, size: 8, offset: 104)
!1345 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1334, file: !1333, line: 220, baseType: !87, size: 16, offset: 112)
!1346 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !1334, file: !1333, line: 221, baseType: !87, size: 16, offset: 128)
!1347 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1334, file: !1333, line: 222, baseType: !10, size: 96, offset: 160)
!1348 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !1334, file: !1333, line: 223, baseType: !1349, size: 288, offset: 256)
!1349 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !11, line: 47, baseType: !1350)
!1350 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !11, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !1351, identifier: "_ZTS10vms_matrix")
!1351 = !{!1352, !1353, !1354}
!1352 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !1350, file: !11, line: 46, baseType: !10, size: 96)
!1353 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !1350, file: !11, line: 46, baseType: !10, size: 96, offset: 96)
!1354 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !1350, file: !11, line: 46, baseType: !10, size: 96, offset: 192)
!1355 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1334, file: !1333, line: 224, baseType: !15, size: 32, offset: 544)
!1356 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !1334, file: !1333, line: 225, baseType: !15, size: 32, offset: 576)
!1357 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !1334, file: !1333, line: 226, baseType: !10, size: 96, offset: 608)
!1358 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !1334, file: !1333, line: 227, baseType: !80, size: 8, offset: 704)
!1359 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !1334, file: !1333, line: 228, baseType: !80, size: 8, offset: 712)
!1360 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !1334, file: !1333, line: 229, baseType: !80, size: 8, offset: 720)
!1361 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !1334, file: !1333, line: 230, baseType: !80, size: 8, offset: 728)
!1362 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !1334, file: !1333, line: 231, baseType: !15, size: 32, offset: 736)
!1363 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !1334, file: !1333, line: 240, baseType: !1364, size: 512, offset: 768)
!1364 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1334, file: !1333, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !1365, identifier: "_ZTSN6objectUt_E")
!1365 = !{!1366, !1380}
!1366 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !1364, file: !1333, line: 238, baseType: !1367, size: 512)
!1367 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !1333, line: 153, baseType: !1368)
!1368 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !1333, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !1369, identifier: "_ZTS12physics_info")
!1369 = !{!1370, !1371, !1372, !1373, !1374, !1375, !1376, !1377, !1379}
!1370 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !1368, file: !1333, line: 144, baseType: !10, size: 96)
!1371 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !1368, file: !1333, line: 145, baseType: !10, size: 96, offset: 96)
!1372 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !1368, file: !1333, line: 146, baseType: !15, size: 32, offset: 192)
!1373 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !1368, file: !1333, line: 147, baseType: !15, size: 32, offset: 224)
!1374 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !1368, file: !1333, line: 148, baseType: !15, size: 32, offset: 256)
!1375 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !1368, file: !1333, line: 149, baseType: !10, size: 96, offset: 288)
!1376 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !1368, file: !1333, line: 150, baseType: !10, size: 96, offset: 384)
!1377 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !1368, file: !1333, line: 151, baseType: !1378, size: 16, offset: 480)
!1378 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !16, line: 21, baseType: !87)
!1379 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1368, file: !1333, line: 152, baseType: !6, size: 16, offset: 496)
!1380 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !1364, file: !1333, line: 239, baseType: !10, size: 96)
!1381 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !1334, file: !1333, line: 250, baseType: !1382, size: 256, offset: 1280)
!1382 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1334, file: !1333, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !1383, identifier: "_ZTSN6objectUt0_E")
!1383 = !{!1384, !1395, !1405, !1421, !1426}
!1384 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !1382, file: !1333, line: 245, baseType: !1385, size: 160)
!1385 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !1333, line: 166, baseType: !1386)
!1386 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !1333, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !1387, identifier: "_ZTS12laser_info_s")
!1387 = !{!1388, !1389, !1390, !1391, !1392, !1393, !1394}
!1388 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !1386, file: !1333, line: 159, baseType: !87, size: 16)
!1389 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !1386, file: !1333, line: 160, baseType: !87, size: 16, offset: 16)
!1390 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !1386, file: !1333, line: 161, baseType: !19, size: 32, offset: 32)
!1391 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1386, file: !1333, line: 162, baseType: !15, size: 32, offset: 64)
!1392 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !1386, file: !1333, line: 163, baseType: !87, size: 16, offset: 96)
!1393 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !1386, file: !1333, line: 164, baseType: !87, size: 16, offset: 112)
!1394 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !1386, file: !1333, line: 165, baseType: !15, size: 32, offset: 128)
!1395 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !1382, file: !1333, line: 246, baseType: !1396, size: 128)
!1396 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !1333, line: 176, baseType: !1397)
!1397 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !1333, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !1398, identifier: "_ZTS14explosion_info")
!1398 = !{!1399, !1400, !1401, !1402, !1403, !1404}
!1399 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !1397, file: !1333, line: 170, baseType: !15, size: 32)
!1400 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !1397, file: !1333, line: 171, baseType: !15, size: 32, offset: 32)
!1401 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !1397, file: !1333, line: 172, baseType: !87, size: 16, offset: 64)
!1402 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !1397, file: !1333, line: 173, baseType: !87, size: 16, offset: 80)
!1403 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !1397, file: !1333, line: 174, baseType: !87, size: 16, offset: 96)
!1404 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !1397, file: !1333, line: 175, baseType: !87, size: 16, offset: 112)
!1405 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !1382, file: !1333, line: 247, baseType: !1406, size: 256)
!1406 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !1407, line: 144, baseType: !1408)
!1407 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!1408 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !1407, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !1409, identifier: "_ZTS9ai_static")
!1409 = !{!1410, !1411, !1413, !1414, !1415, !1416, !1417, !1418, !1419, !1420}
!1410 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !1408, file: !1407, line: 128, baseType: !91, size: 8)
!1411 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1408, file: !1407, line: 129, baseType: !1412, size: 88, offset: 8)
!1412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 88, elements: !66)
!1413 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !1408, file: !1407, line: 130, baseType: !87, size: 16, offset: 96)
!1414 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !1408, file: !1407, line: 131, baseType: !87, size: 16, offset: 112)
!1415 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !1408, file: !1407, line: 132, baseType: !87, size: 16, offset: 128)
!1416 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !1408, file: !1407, line: 133, baseType: !80, size: 8, offset: 144)
!1417 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !1408, file: !1407, line: 134, baseType: !80, size: 8, offset: 152)
!1418 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !1408, file: !1407, line: 139, baseType: !87, size: 16, offset: 160)
!1419 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !1408, file: !1407, line: 140, baseType: !19, size: 32, offset: 192)
!1420 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !1408, file: !1407, line: 141, baseType: !15, size: 32, offset: 224)
!1421 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !1382, file: !1333, line: 248, baseType: !1422, size: 32)
!1422 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !1333, line: 181, baseType: !1423)
!1423 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !1333, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !1424, identifier: "_ZTS12light_info_s")
!1424 = !{!1425}
!1425 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !1423, file: !1333, line: 180, baseType: !15, size: 32)
!1426 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !1382, file: !1333, line: 249, baseType: !1427, size: 96)
!1427 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !1333, line: 190, baseType: !1428)
!1428 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !1333, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !1429, identifier: "_ZTS14powerup_info_s")
!1429 = !{!1430, !1431, !1432}
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !1428, file: !1333, line: 187, baseType: !19, size: 32)
!1431 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1428, file: !1333, line: 188, baseType: !15, size: 32, offset: 32)
!1432 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1428, file: !1333, line: 189, baseType: !19, size: 32, offset: 64)
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !1334, file: !1333, line: 257, baseType: !1434, size: 608, offset: 1536)
!1434 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1334, file: !1333, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !1435, identifier: "_ZTSN6objectUt1_E")
!1435 = !{!1436, !1454}
!1436 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !1434, file: !1333, line: 255, baseType: !1437, size: 608)
!1437 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !1333, line: 208, baseType: !1438)
!1438 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !1333, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !1439, identifier: "_ZTS12polyobj_info")
!1439 = !{!1440, !1441, !1451, !1452, !1453}
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !1438, file: !1333, line: 203, baseType: !19, size: 32)
!1441 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !1438, file: !1333, line: 204, baseType: !1442, size: 480, offset: 32)
!1442 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1443, size: 480, elements: !1449)
!1443 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !11, line: 40, baseType: !1444)
!1444 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !11, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !1445, identifier: "_ZTS10vms_angvec")
!1445 = !{!1446, !1447, !1448}
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1444, file: !11, line: 39, baseType: !1378, size: 16)
!1447 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !1444, file: !11, line: 39, baseType: !1378, size: 16, offset: 16)
!1448 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !1444, file: !11, line: 39, baseType: !1378, size: 16, offset: 32)
!1449 = !{!1450}
!1450 = !DISubrange(count: 10)
!1451 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !1438, file: !1333, line: 205, baseType: !19, size: 32, offset: 512)
!1452 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !1438, file: !1333, line: 206, baseType: !19, size: 32, offset: 544)
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !1438, file: !1333, line: 207, baseType: !19, size: 32, offset: 576)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !1434, file: !1333, line: 256, baseType: !1455, size: 96)
!1455 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !1333, line: 197, baseType: !1456)
!1456 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !1333, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !1457, identifier: "_ZTS12vclip_info_s")
!1457 = !{!1458, !1459, !1460}
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !1456, file: !1333, line: 194, baseType: !19, size: 32)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !1456, file: !1333, line: 195, baseType: !15, size: 32, offset: 32)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !1456, file: !1333, line: 196, baseType: !80, size: 8, offset: 64)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "morph_vecs", scope: !1328, file: !1327, line: 24, baseType: !1462, size: 96000, offset: 64)
!1462 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96000, elements: !1463)
!1463 = !{!1464}
!1464 = !DISubrange(count: 1000)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "morph_deltas", scope: !1328, file: !1327, line: 25, baseType: !1462, size: 96000, offset: 96064)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "morph_times", scope: !1328, file: !1327, line: 26, baseType: !1467, size: 32000, offset: 192064)
!1467 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 32000, elements: !1463)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_active", scope: !1328, file: !1327, line: 27, baseType: !1469, size: 320, offset: 224064)
!1469 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 320, elements: !1449)
!1470 = !DIDerivedType(tag: DW_TAG_member, name: "n_morphing_points", scope: !1328, file: !1327, line: 28, baseType: !1469, size: 320, offset: 224384)
!1471 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_startpoints", scope: !1328, file: !1327, line: 29, baseType: !1469, size: 320, offset: 224704)
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "n_submodels_active", scope: !1328, file: !1327, line: 30, baseType: !19, size: 32, offset: 225024)
!1473 = !DIDerivedType(tag: DW_TAG_member, name: "morph_save_control_type", scope: !1328, file: !1327, line: 31, baseType: !91, size: 8, offset: 225056)
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "morph_save_movement_type", scope: !1328, file: !1327, line: 32, baseType: !91, size: 8, offset: 225064)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "morph_save_phys_info", scope: !1328, file: !1327, line: 33, baseType: !1367, size: 512, offset: 225088)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "Morph_sig", scope: !1328, file: !1327, line: 34, baseType: !19, size: 32, offset: 225600)
!1477 = !{!1478}
!1478 = !DISubrange(count: 5)
!1479 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1480 = !{i32 7, !"Dwarf Version", i32 5}
!1481 = !{i32 2, !"Debug Info Version", i32 3}
!1482 = !{i32 1, !"wchar_size", i32 4}
!1483 = !{i32 8, !"PIC Level", i32 2}
!1484 = !{i32 7, !"uwtable", i32 1}
!1485 = !{i32 7, !"frame-pointer", i32 1}
!1486 = !{!"Homebrew clang version 20.1.8"}
!1487 = distinct !DISubprogram(name: "find_morph_data", linkageName: "_Z15find_morph_dataP6object", scope: !28, file: !28, line: 40, type: !1488, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!1490, !1331}
!1490 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1326, size: 64)
!1491 = !{}
!1492 = !DILocalVariable(name: "obj", arg: 1, scope: !1487, file: !28, line: 40, type: !1331)
!1493 = !DILocation(line: 40, column: 37, scope: !1487)
!1494 = !DILocalVariable(name: "i", scope: !1487, file: !28, line: 42, type: !19)
!1495 = !DILocation(line: 42, column: 6, scope: !1487)
!1496 = !DILocation(line: 45, column: 6, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1487, file: !28, line: 45, column: 6)
!1498 = !DILocation(line: 45, column: 20, scope: !1497)
!1499 = !DILocation(line: 47, column: 26, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1497, file: !28, line: 46, column: 2)
!1501 = !DILocation(line: 47, column: 24, scope: !1500)
!1502 = !DILocation(line: 48, column: 3, scope: !1500)
!1503 = !DILocation(line: 52, column: 8, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1487, file: !28, line: 52, column: 2)
!1505 = !DILocation(line: 52, column: 7, scope: !1504)
!1506 = !DILocation(line: 52, column: 11, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1504, file: !28, line: 52, column: 2)
!1508 = !DILocation(line: 52, column: 12, scope: !1507)
!1509 = !DILocation(line: 52, column: 2, scope: !1504)
!1510 = !DILocation(line: 53, column: 21, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1507, file: !28, line: 53, column: 7)
!1512 = !DILocation(line: 53, column: 7, scope: !1511)
!1513 = !DILocation(line: 53, column: 24, scope: !1511)
!1514 = !DILocation(line: 53, column: 31, scope: !1511)
!1515 = !DILocation(line: 53, column: 28, scope: !1511)
!1516 = !DILocation(line: 54, column: 26, scope: !1511)
!1517 = !DILocation(line: 54, column: 12, scope: !1511)
!1518 = !DILocation(line: 54, column: 4, scope: !1511)
!1519 = !DILocation(line: 52, column: 32, scope: !1507)
!1520 = !DILocation(line: 52, column: 2, scope: !1507)
!1521 = distinct !{!1521, !1509, !1522, !1523}
!1522 = !DILocation(line: 54, column: 27, scope: !1504)
!1523 = !{!"llvm.loop.mustprogress"}
!1524 = !DILocation(line: 56, column: 2, scope: !1487)
!1525 = !DILocation(line: 57, column: 1, scope: !1487)
!1526 = distinct !DISubprogram(name: "find_min_max", linkageName: "_Z12find_min_maxP9polymodeliP10vms_vectorS2_", scope: !28, file: !28, line: 61, type: !1527, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1527 = !DISubroutineType(types: !1528)
!1528 = !{null, !1529, !19, !9, !9}
!1529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1530, size: 64)
!1530 = !DIDerivedType(tag: DW_TAG_typedef, name: "polymodel", file: !1531, line: 47, baseType: !1532)
!1531 = !DIFile(filename: "main_d2/polyobj.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "fc2424d85655305b90ac5cadd553f2e5")
!1532 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polymodel", file: !1531, line: 28, size: 5952, flags: DIFlagTypePassByValue, elements: !1533, identifier: "_ZTS9polymodel")
!1533 = !{!1534, !1535, !1536, !1538, !1539, !1541, !1542, !1543, !1545, !1547, !1548, !1549, !1550, !1551, !1552, !1553, !1554}
!1534 = !DIDerivedType(tag: DW_TAG_member, name: "n_models", scope: !1532, file: !1531, line: 30, baseType: !19, size: 32)
!1535 = !DIDerivedType(tag: DW_TAG_member, name: "model_data_size", scope: !1532, file: !1531, line: 31, baseType: !19, size: 32, offset: 32)
!1536 = !DIDerivedType(tag: DW_TAG_member, name: "model_data", scope: !1532, file: !1531, line: 32, baseType: !1537, size: 64, offset: 64)
!1537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!1538 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_ptrs", scope: !1532, file: !1531, line: 33, baseType: !1469, size: 320, offset: 128)
!1539 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_offsets", scope: !1532, file: !1531, line: 34, baseType: !1540, size: 960, offset: 448)
!1540 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 960, elements: !1449)
!1541 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_norms", scope: !1532, file: !1531, line: 35, baseType: !1540, size: 960, offset: 1408)
!1542 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_pnts", scope: !1532, file: !1531, line: 36, baseType: !1540, size: 960, offset: 2368)
!1543 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_rads", scope: !1532, file: !1531, line: 37, baseType: !1544, size: 320, offset: 3328)
!1544 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 320, elements: !1449)
!1545 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_parents", scope: !1532, file: !1531, line: 38, baseType: !1546, size: 80, offset: 3648)
!1546 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 80, elements: !1449)
!1547 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_mins", scope: !1532, file: !1531, line: 39, baseType: !1540, size: 960, offset: 3744)
!1548 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_maxs", scope: !1532, file: !1531, line: 40, baseType: !1540, size: 960, offset: 4704)
!1549 = !DIDerivedType(tag: DW_TAG_member, name: "mins", scope: !1532, file: !1531, line: 41, baseType: !10, size: 96, offset: 5664)
!1550 = !DIDerivedType(tag: DW_TAG_member, name: "maxs", scope: !1532, file: !1531, line: 41, baseType: !10, size: 96, offset: 5760)
!1551 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !1532, file: !1531, line: 42, baseType: !15, size: 32, offset: 5856)
!1552 = !DIDerivedType(tag: DW_TAG_member, name: "n_textures", scope: !1532, file: !1531, line: 43, baseType: !91, size: 8, offset: 5888)
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "first_texture", scope: !1532, file: !1531, line: 44, baseType: !6, size: 16, offset: 5904)
!1554 = !DIDerivedType(tag: DW_TAG_member, name: "simpler_model", scope: !1532, file: !1531, line: 45, baseType: !91, size: 8, offset: 5920)
!1555 = !DILocalVariable(name: "pm", arg: 1, scope: !1526, file: !28, line: 61, type: !1529)
!1556 = !DILocation(line: 61, column: 30, scope: !1526)
!1557 = !DILocalVariable(name: "submodel_num", arg: 2, scope: !1526, file: !28, line: 61, type: !19)
!1558 = !DILocation(line: 61, column: 37, scope: !1526)
!1559 = !DILocalVariable(name: "minv", arg: 3, scope: !1526, file: !28, line: 61, type: !9)
!1560 = !DILocation(line: 61, column: 62, scope: !1526)
!1561 = !DILocalVariable(name: "maxv", arg: 4, scope: !1526, file: !28, line: 61, type: !9)
!1562 = !DILocation(line: 61, column: 79, scope: !1526)
!1563 = !DILocalVariable(name: "nverts", scope: !1526, file: !28, line: 63, type: !6)
!1564 = !DILocation(line: 63, column: 11, scope: !1526)
!1565 = !DILocalVariable(name: "vp", scope: !1526, file: !28, line: 64, type: !9)
!1566 = !DILocation(line: 64, column: 14, scope: !1526)
!1567 = !DILocalVariable(name: "data", scope: !1526, file: !28, line: 65, type: !5)
!1568 = !DILocation(line: 65, column: 12, scope: !1526)
!1569 = !DILocalVariable(name: "type", scope: !1526, file: !28, line: 65, type: !6)
!1570 = !DILocation(line: 65, column: 17, scope: !1526)
!1571 = !DILocation(line: 67, column: 23, scope: !1526)
!1572 = !DILocation(line: 67, column: 27, scope: !1526)
!1573 = !DILocation(line: 67, column: 38, scope: !1526)
!1574 = !DILocation(line: 67, column: 42, scope: !1526)
!1575 = !DILocation(line: 67, column: 56, scope: !1526)
!1576 = !DILocation(line: 67, column: 7, scope: !1526)
!1577 = !DILocation(line: 69, column: 14, scope: !1526)
!1578 = !DILocation(line: 69, column: 9, scope: !1526)
!1579 = !DILocation(line: 69, column: 7, scope: !1526)
!1580 = !DILocation(line: 71, column: 2, scope: !1526)
!1581 = !DILocation(line: 73, column: 16, scope: !1526)
!1582 = !DILocation(line: 73, column: 11, scope: !1526)
!1583 = !DILocation(line: 73, column: 9, scope: !1526)
!1584 = !DILocation(line: 75, column: 6, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1526, file: !28, line: 75, column: 6)
!1586 = !DILocation(line: 75, column: 10, scope: !1585)
!1587 = !DILocation(line: 76, column: 7, scope: !1585)
!1588 = !DILocation(line: 76, column: 3, scope: !1585)
!1589 = !DILocation(line: 78, column: 22, scope: !1526)
!1590 = !DILocation(line: 78, column: 5, scope: !1526)
!1591 = !DILocation(line: 80, column: 21, scope: !1526)
!1592 = !DILocation(line: 80, column: 11, scope: !1526)
!1593 = !DILocation(line: 80, column: 16, scope: !1526)
!1594 = !DILocation(line: 80, column: 3, scope: !1526)
!1595 = !DILocation(line: 80, column: 8, scope: !1526)
!1596 = !DILocation(line: 80, column: 31, scope: !1526)
!1597 = !DILocation(line: 82, column: 2, scope: !1526)
!1598 = !DILocation(line: 82, column: 15, scope: !1526)
!1599 = !DILocation(line: 82, column: 9, scope: !1526)
!1600 = !DILocation(line: 83, column: 7, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1602, file: !28, line: 83, column: 7)
!1602 = distinct !DILexicalBlock(scope: !1526, file: !28, line: 82, column: 19)
!1603 = !DILocation(line: 83, column: 11, scope: !1601)
!1604 = !DILocation(line: 83, column: 15, scope: !1601)
!1605 = !DILocation(line: 83, column: 21, scope: !1601)
!1606 = !DILocation(line: 83, column: 13, scope: !1601)
!1607 = !DILocation(line: 83, column: 34, scope: !1601)
!1608 = !DILocation(line: 83, column: 38, scope: !1601)
!1609 = !DILocation(line: 83, column: 24, scope: !1601)
!1610 = !DILocation(line: 83, column: 30, scope: !1601)
!1611 = !DILocation(line: 83, column: 32, scope: !1601)
!1612 = !DILocation(line: 84, column: 7, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1602, file: !28, line: 84, column: 7)
!1614 = !DILocation(line: 84, column: 11, scope: !1613)
!1615 = !DILocation(line: 84, column: 15, scope: !1613)
!1616 = !DILocation(line: 84, column: 21, scope: !1613)
!1617 = !DILocation(line: 84, column: 13, scope: !1613)
!1618 = !DILocation(line: 84, column: 34, scope: !1613)
!1619 = !DILocation(line: 84, column: 38, scope: !1613)
!1620 = !DILocation(line: 84, column: 24, scope: !1613)
!1621 = !DILocation(line: 84, column: 30, scope: !1613)
!1622 = !DILocation(line: 84, column: 32, scope: !1613)
!1623 = !DILocation(line: 85, column: 7, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1602, file: !28, line: 85, column: 7)
!1625 = !DILocation(line: 85, column: 11, scope: !1624)
!1626 = !DILocation(line: 85, column: 15, scope: !1624)
!1627 = !DILocation(line: 85, column: 21, scope: !1624)
!1628 = !DILocation(line: 85, column: 13, scope: !1624)
!1629 = !DILocation(line: 85, column: 34, scope: !1624)
!1630 = !DILocation(line: 85, column: 38, scope: !1624)
!1631 = !DILocation(line: 85, column: 24, scope: !1624)
!1632 = !DILocation(line: 85, column: 30, scope: !1624)
!1633 = !DILocation(line: 85, column: 32, scope: !1624)
!1634 = !DILocation(line: 87, column: 7, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1602, file: !28, line: 87, column: 7)
!1636 = !DILocation(line: 87, column: 11, scope: !1635)
!1637 = !DILocation(line: 87, column: 15, scope: !1635)
!1638 = !DILocation(line: 87, column: 21, scope: !1635)
!1639 = !DILocation(line: 87, column: 13, scope: !1635)
!1640 = !DILocation(line: 87, column: 34, scope: !1635)
!1641 = !DILocation(line: 87, column: 38, scope: !1635)
!1642 = !DILocation(line: 87, column: 24, scope: !1635)
!1643 = !DILocation(line: 87, column: 30, scope: !1635)
!1644 = !DILocation(line: 87, column: 32, scope: !1635)
!1645 = !DILocation(line: 88, column: 7, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1602, file: !28, line: 88, column: 7)
!1647 = !DILocation(line: 88, column: 11, scope: !1646)
!1648 = !DILocation(line: 88, column: 15, scope: !1646)
!1649 = !DILocation(line: 88, column: 21, scope: !1646)
!1650 = !DILocation(line: 88, column: 13, scope: !1646)
!1651 = !DILocation(line: 88, column: 34, scope: !1646)
!1652 = !DILocation(line: 88, column: 38, scope: !1646)
!1653 = !DILocation(line: 88, column: 24, scope: !1646)
!1654 = !DILocation(line: 88, column: 30, scope: !1646)
!1655 = !DILocation(line: 88, column: 32, scope: !1646)
!1656 = !DILocation(line: 89, column: 7, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1602, file: !28, line: 89, column: 7)
!1658 = !DILocation(line: 89, column: 11, scope: !1657)
!1659 = !DILocation(line: 89, column: 15, scope: !1657)
!1660 = !DILocation(line: 89, column: 21, scope: !1657)
!1661 = !DILocation(line: 89, column: 13, scope: !1657)
!1662 = !DILocation(line: 89, column: 34, scope: !1657)
!1663 = !DILocation(line: 89, column: 38, scope: !1657)
!1664 = !DILocation(line: 89, column: 24, scope: !1657)
!1665 = !DILocation(line: 89, column: 30, scope: !1657)
!1666 = !DILocation(line: 89, column: 32, scope: !1657)
!1667 = !DILocation(line: 91, column: 5, scope: !1602)
!1668 = distinct !{!1668, !1597, !1669, !1523}
!1669 = !DILocation(line: 92, column: 2, scope: !1526)
!1670 = !DILocation(line: 94, column: 1, scope: !1526)
!1671 = distinct !DISubprogram(name: "init_points", linkageName: "_Z11init_pointsP9polymodelP10vms_vectoriP10morph_data", scope: !28, file: !28, line: 100, type: !1672, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{null, !1529, !9, !19, !1490}
!1674 = !DILocalVariable(name: "pm", arg: 1, scope: !1671, file: !28, line: 100, type: !1529)
!1675 = !DILocation(line: 100, column: 29, scope: !1671)
!1676 = !DILocalVariable(name: "box_size", arg: 2, scope: !1671, file: !28, line: 100, type: !9)
!1677 = !DILocation(line: 100, column: 44, scope: !1671)
!1678 = !DILocalVariable(name: "submodel_num", arg: 3, scope: !1671, file: !28, line: 100, type: !19)
!1679 = !DILocation(line: 100, column: 57, scope: !1671)
!1680 = !DILocalVariable(name: "md", arg: 4, scope: !1671, file: !28, line: 100, type: !1490)
!1681 = !DILocation(line: 100, column: 82, scope: !1671)
!1682 = !DILocalVariable(name: "nverts", scope: !1671, file: !28, line: 102, type: !6)
!1683 = !DILocation(line: 102, column: 11, scope: !1671)
!1684 = !DILocalVariable(name: "vp", scope: !1671, file: !28, line: 103, type: !9)
!1685 = !DILocation(line: 103, column: 14, scope: !1671)
!1686 = !DILocalVariable(name: "data", scope: !1671, file: !28, line: 104, type: !5)
!1687 = !DILocation(line: 104, column: 12, scope: !1671)
!1688 = !DILocalVariable(name: "type", scope: !1671, file: !28, line: 104, type: !6)
!1689 = !DILocation(line: 104, column: 17, scope: !1671)
!1690 = !DILocalVariable(name: "i", scope: !1671, file: !28, line: 105, type: !19)
!1691 = !DILocation(line: 105, column: 6, scope: !1671)
!1692 = !DILocation(line: 108, column: 23, scope: !1671)
!1693 = !DILocation(line: 108, column: 27, scope: !1671)
!1694 = !DILocation(line: 108, column: 38, scope: !1671)
!1695 = !DILocation(line: 108, column: 42, scope: !1671)
!1696 = !DILocation(line: 108, column: 56, scope: !1671)
!1697 = !DILocation(line: 108, column: 7, scope: !1671)
!1698 = !DILocation(line: 110, column: 14, scope: !1671)
!1699 = !DILocation(line: 110, column: 9, scope: !1671)
!1700 = !DILocation(line: 110, column: 7, scope: !1671)
!1701 = !DILocation(line: 112, column: 2, scope: !1671)
!1702 = !DILocation(line: 114, column: 16, scope: !1671)
!1703 = !DILocation(line: 114, column: 11, scope: !1671)
!1704 = !DILocation(line: 114, column: 9, scope: !1671)
!1705 = !DILocation(line: 116, column: 2, scope: !1671)
!1706 = !DILocation(line: 116, column: 6, scope: !1671)
!1707 = !DILocation(line: 116, column: 24, scope: !1671)
!1708 = !DILocation(line: 116, column: 38, scope: !1671)
!1709 = !DILocation(line: 118, column: 6, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1671, file: !28, line: 118, column: 6)
!1711 = !DILocation(line: 118, column: 10, scope: !1710)
!1712 = !DILocation(line: 120, column: 12, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1710, file: !28, line: 119, column: 2)
!1714 = !DILocation(line: 120, column: 7, scope: !1713)
!1715 = !DILocation(line: 120, column: 5, scope: !1713)
!1716 = !DILocation(line: 121, column: 7, scope: !1713)
!1717 = !DILocation(line: 122, column: 2, scope: !1713)
!1718 = !DILocation(line: 124, column: 5, scope: !1710)
!1719 = !DILocation(line: 126, column: 2, scope: !1671)
!1720 = !DILocation(line: 128, column: 43, scope: !1671)
!1721 = !DILocation(line: 128, column: 2, scope: !1671)
!1722 = !DILocation(line: 128, column: 6, scope: !1671)
!1723 = !DILocation(line: 128, column: 27, scope: !1671)
!1724 = !DILocation(line: 128, column: 41, scope: !1671)
!1725 = !DILocation(line: 130, column: 22, scope: !1671)
!1726 = !DILocation(line: 130, column: 5, scope: !1671)
!1727 = !DILocation(line: 150, column: 2, scope: !1671)
!1728 = !DILocation(line: 150, column: 15, scope: !1671)
!1729 = !DILocation(line: 150, column: 9, scope: !1671)
!1730 = !DILocalVariable(name: "k", scope: !1731, file: !28, line: 152, type: !15)
!1731 = distinct !DILexicalBlock(scope: !1671, file: !28, line: 151, column: 2)
!1732 = !DILocation(line: 152, column: 7, scope: !1731)
!1733 = !DILocalVariable(name: "dist", scope: !1731, file: !28, line: 152, type: !15)
!1734 = !DILocation(line: 152, column: 9, scope: !1731)
!1735 = !DILocation(line: 154, column: 7, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1731, file: !28, line: 154, column: 7)
!1737 = !DILocalVariable(name: "t", scope: !1738, file: !28, line: 156, type: !15)
!1738 = distinct !DILexicalBlock(scope: !1736, file: !28, line: 155, column: 3)
!1739 = !DILocation(line: 156, column: 8, scope: !1738)
!1740 = !DILocation(line: 158, column: 6, scope: !1738)
!1741 = !DILocation(line: 160, column: 8, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1738, file: !28, line: 160, column: 8)
!1743 = !DILocation(line: 160, column: 12, scope: !1742)
!1744 = !DILocation(line: 160, column: 14, scope: !1742)
!1745 = !DILocation(line: 160, column: 21, scope: !1742)
!1746 = !DILocation(line: 160, column: 31, scope: !1742)
!1747 = !DILocation(line: 160, column: 17, scope: !1742)
!1748 = !DILocation(line: 160, column: 38, scope: !1742)
!1749 = !DILocation(line: 160, column: 42, scope: !1742)
!1750 = !DILocation(line: 160, column: 34, scope: !1742)
!1751 = !DILocation(line: 160, column: 44, scope: !1742)
!1752 = !DILocation(line: 160, column: 33, scope: !1742)
!1753 = !DILocation(line: 160, column: 47, scope: !1742)
!1754 = !DILocation(line: 160, column: 62, scope: !1742)
!1755 = !DILocation(line: 160, column: 72, scope: !1742)
!1756 = !DILocation(line: 160, column: 78, scope: !1742)
!1757 = !DILocation(line: 160, column: 82, scope: !1742)
!1758 = !DILocation(line: 160, column: 74, scope: !1742)
!1759 = !DILocation(line: 160, column: 55, scope: !1742)
!1760 = !DILocation(line: 160, column: 53, scope: !1742)
!1761 = !DILocation(line: 160, column: 89, scope: !1742)
!1762 = !DILocation(line: 160, column: 87, scope: !1742)
!1763 = !DILocation(line: 160, column: 94, scope: !1742)
!1764 = !DILocation(line: 160, column: 93, scope: !1742)
!1765 = !DILocation(line: 160, column: 92, scope: !1742)
!1766 = !DILocation(line: 161, column: 8, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1738, file: !28, line: 161, column: 8)
!1768 = !DILocation(line: 161, column: 12, scope: !1767)
!1769 = !DILocation(line: 161, column: 14, scope: !1767)
!1770 = !DILocation(line: 161, column: 21, scope: !1767)
!1771 = !DILocation(line: 161, column: 31, scope: !1767)
!1772 = !DILocation(line: 161, column: 17, scope: !1767)
!1773 = !DILocation(line: 161, column: 38, scope: !1767)
!1774 = !DILocation(line: 161, column: 42, scope: !1767)
!1775 = !DILocation(line: 161, column: 34, scope: !1767)
!1776 = !DILocation(line: 161, column: 44, scope: !1767)
!1777 = !DILocation(line: 161, column: 33, scope: !1767)
!1778 = !DILocation(line: 161, column: 47, scope: !1767)
!1779 = !DILocation(line: 161, column: 62, scope: !1767)
!1780 = !DILocation(line: 161, column: 72, scope: !1767)
!1781 = !DILocation(line: 161, column: 78, scope: !1767)
!1782 = !DILocation(line: 161, column: 82, scope: !1767)
!1783 = !DILocation(line: 161, column: 74, scope: !1767)
!1784 = !DILocation(line: 161, column: 55, scope: !1767)
!1785 = !DILocation(line: 161, column: 53, scope: !1767)
!1786 = !DILocation(line: 161, column: 89, scope: !1767)
!1787 = !DILocation(line: 161, column: 87, scope: !1767)
!1788 = !DILocation(line: 161, column: 94, scope: !1767)
!1789 = !DILocation(line: 161, column: 93, scope: !1767)
!1790 = !DILocation(line: 161, column: 92, scope: !1767)
!1791 = !DILocation(line: 162, column: 8, scope: !1792)
!1792 = distinct !DILexicalBlock(scope: !1738, file: !28, line: 162, column: 8)
!1793 = !DILocation(line: 162, column: 12, scope: !1792)
!1794 = !DILocation(line: 162, column: 14, scope: !1792)
!1795 = !DILocation(line: 162, column: 21, scope: !1792)
!1796 = !DILocation(line: 162, column: 31, scope: !1792)
!1797 = !DILocation(line: 162, column: 17, scope: !1792)
!1798 = !DILocation(line: 162, column: 38, scope: !1792)
!1799 = !DILocation(line: 162, column: 42, scope: !1792)
!1800 = !DILocation(line: 162, column: 34, scope: !1792)
!1801 = !DILocation(line: 162, column: 44, scope: !1792)
!1802 = !DILocation(line: 162, column: 33, scope: !1792)
!1803 = !DILocation(line: 162, column: 47, scope: !1792)
!1804 = !DILocation(line: 162, column: 62, scope: !1792)
!1805 = !DILocation(line: 162, column: 72, scope: !1792)
!1806 = !DILocation(line: 162, column: 78, scope: !1792)
!1807 = !DILocation(line: 162, column: 82, scope: !1792)
!1808 = !DILocation(line: 162, column: 74, scope: !1792)
!1809 = !DILocation(line: 162, column: 55, scope: !1792)
!1810 = !DILocation(line: 162, column: 53, scope: !1792)
!1811 = !DILocation(line: 162, column: 89, scope: !1792)
!1812 = !DILocation(line: 162, column: 87, scope: !1792)
!1813 = !DILocation(line: 162, column: 94, scope: !1792)
!1814 = !DILocation(line: 162, column: 93, scope: !1792)
!1815 = !DILocation(line: 162, column: 92, scope: !1792)
!1816 = !DILocation(line: 164, column: 8, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1738, file: !28, line: 164, column: 8)
!1818 = !DILocation(line: 164, column: 9, scope: !1817)
!1819 = !DILocation(line: 164, column: 24, scope: !1817)
!1820 = !DILocation(line: 164, column: 23, scope: !1817)
!1821 = !DILocation(line: 166, column: 3, scope: !1738)
!1822 = !DILocation(line: 168, column: 5, scope: !1736)
!1823 = !DILocation(line: 170, column: 22, scope: !1731)
!1824 = !DILocation(line: 170, column: 26, scope: !1731)
!1825 = !DILocation(line: 170, column: 37, scope: !1731)
!1826 = !DILocation(line: 170, column: 40, scope: !1731)
!1827 = !DILocation(line: 170, column: 43, scope: !1731)
!1828 = !DILocation(line: 170, column: 3, scope: !1731)
!1829 = !DILocation(line: 172, column: 39, scope: !1731)
!1830 = !DILocation(line: 172, column: 43, scope: !1731)
!1831 = !DILocation(line: 172, column: 56, scope: !1731)
!1832 = !DILocation(line: 172, column: 59, scope: !1731)
!1833 = !DILocation(line: 172, column: 63, scope: !1731)
!1834 = !DILocation(line: 172, column: 67, scope: !1731)
!1835 = !DILocation(line: 172, column: 78, scope: !1731)
!1836 = !DILocation(line: 172, column: 10, scope: !1731)
!1837 = !DILocation(line: 172, column: 8, scope: !1731)
!1838 = !DILocation(line: 174, column: 31, scope: !1731)
!1839 = !DILocation(line: 174, column: 36, scope: !1731)
!1840 = !DILocation(line: 174, column: 24, scope: !1731)
!1841 = !DILocation(line: 174, column: 3, scope: !1731)
!1842 = !DILocation(line: 174, column: 7, scope: !1731)
!1843 = !DILocation(line: 174, column: 19, scope: !1731)
!1844 = !DILocation(line: 174, column: 22, scope: !1731)
!1845 = !DILocation(line: 176, column: 7, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1731, file: !28, line: 176, column: 7)
!1847 = !DILocation(line: 176, column: 11, scope: !1846)
!1848 = !DILocation(line: 176, column: 23, scope: !1846)
!1849 = !DILocation(line: 176, column: 26, scope: !1846)
!1850 = !DILocation(line: 177, column: 4, scope: !1846)
!1851 = !DILocation(line: 177, column: 8, scope: !1846)
!1852 = !DILocation(line: 177, column: 26, scope: !1846)
!1853 = !DILocation(line: 177, column: 39, scope: !1846)
!1854 = !DILocation(line: 179, column: 17, scope: !1731)
!1855 = !DILocation(line: 179, column: 21, scope: !1731)
!1856 = !DILocation(line: 179, column: 34, scope: !1731)
!1857 = !DILocation(line: 179, column: 37, scope: !1731)
!1858 = !DILocation(line: 179, column: 3, scope: !1731)
!1859 = !DILocation(line: 181, column: 5, scope: !1731)
!1860 = !DILocation(line: 181, column: 10, scope: !1731)
!1861 = distinct !{!1861, !1727, !1862, !1523}
!1862 = !DILocation(line: 183, column: 2, scope: !1671)
!1863 = !DILocation(line: 185, column: 1, scope: !1671)
!1864 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !16, file: !16, line: 55, type: !1865, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1865 = !DISubroutineType(types: !1866)
!1866 = !{!19, !15}
!1867 = !DILocalVariable(name: "f", arg: 1, scope: !1864, file: !16, line: 55, type: !15)
!1868 = !DILocation(line: 55, column: 23, scope: !1864)
!1869 = !DILocation(line: 57, column: 9, scope: !1864)
!1870 = !DILocation(line: 57, column: 11, scope: !1864)
!1871 = !DILocation(line: 57, column: 2, scope: !1864)
!1872 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !16, file: !16, line: 89, type: !1873, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1873 = !DISubroutineType(types: !1874)
!1874 = !{!15, !15, !15}
!1875 = !DILocalVariable(name: "a", arg: 1, scope: !1872, file: !16, line: 89, type: !15)
!1876 = !DILocation(line: 89, column: 26, scope: !1872)
!1877 = !DILocalVariable(name: "b", arg: 2, scope: !1872, file: !16, line: 89, type: !15)
!1878 = !DILocation(line: 89, column: 33, scope: !1872)
!1879 = !DILocation(line: 92, column: 6, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1872, file: !16, line: 92, column: 6)
!1881 = !DILocation(line: 92, column: 8, scope: !1880)
!1882 = !DILocation(line: 92, column: 14, scope: !1880)
!1883 = !DILocation(line: 94, column: 25, scope: !1872)
!1884 = !DILocation(line: 94, column: 27, scope: !1872)
!1885 = !DILocation(line: 94, column: 36, scope: !1872)
!1886 = !DILocation(line: 94, column: 34, scope: !1872)
!1887 = !DILocation(line: 94, column: 14, scope: !1872)
!1888 = !DILocation(line: 94, column: 2, scope: !1872)
!1889 = !DILocation(line: 95, column: 1, scope: !1872)
!1890 = distinct !DISubprogram(name: "update_points", linkageName: "_Z13update_pointsP9polymodeliP10morph_data", scope: !28, file: !28, line: 187, type: !1891, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1891 = !DISubroutineType(types: !1892)
!1892 = !{null, !1529, !19, !1490}
!1893 = !DILocalVariable(name: "pm", arg: 1, scope: !1890, file: !28, line: 187, type: !1529)
!1894 = !DILocation(line: 187, column: 31, scope: !1890)
!1895 = !DILocalVariable(name: "submodel_num", arg: 2, scope: !1890, file: !28, line: 187, type: !19)
!1896 = !DILocation(line: 187, column: 38, scope: !1890)
!1897 = !DILocalVariable(name: "md", arg: 3, scope: !1890, file: !28, line: 187, type: !1490)
!1898 = !DILocation(line: 187, column: 63, scope: !1890)
!1899 = !DILocalVariable(name: "nverts", scope: !1890, file: !28, line: 189, type: !6)
!1900 = !DILocation(line: 189, column: 11, scope: !1890)
!1901 = !DILocalVariable(name: "vp", scope: !1890, file: !28, line: 190, type: !9)
!1902 = !DILocation(line: 190, column: 14, scope: !1890)
!1903 = !DILocalVariable(name: "data", scope: !1890, file: !28, line: 191, type: !5)
!1904 = !DILocation(line: 191, column: 12, scope: !1890)
!1905 = !DILocalVariable(name: "type", scope: !1890, file: !28, line: 191, type: !6)
!1906 = !DILocation(line: 191, column: 17, scope: !1890)
!1907 = !DILocalVariable(name: "i", scope: !1890, file: !28, line: 192, type: !19)
!1908 = !DILocation(line: 192, column: 6, scope: !1890)
!1909 = !DILocation(line: 196, column: 23, scope: !1890)
!1910 = !DILocation(line: 196, column: 27, scope: !1890)
!1911 = !DILocation(line: 196, column: 38, scope: !1890)
!1912 = !DILocation(line: 196, column: 42, scope: !1890)
!1913 = !DILocation(line: 196, column: 56, scope: !1890)
!1914 = !DILocation(line: 196, column: 7, scope: !1890)
!1915 = !DILocation(line: 198, column: 14, scope: !1890)
!1916 = !DILocation(line: 198, column: 9, scope: !1890)
!1917 = !DILocation(line: 198, column: 7, scope: !1890)
!1918 = !DILocation(line: 200, column: 2, scope: !1890)
!1919 = !DILocation(line: 202, column: 16, scope: !1890)
!1920 = !DILocation(line: 202, column: 11, scope: !1890)
!1921 = !DILocation(line: 202, column: 9, scope: !1890)
!1922 = !DILocation(line: 204, column: 6, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1890, file: !28, line: 204, column: 6)
!1924 = !DILocation(line: 204, column: 10, scope: !1923)
!1925 = !DILocation(line: 206, column: 12, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1923, file: !28, line: 205, column: 2)
!1927 = !DILocation(line: 206, column: 7, scope: !1926)
!1928 = !DILocation(line: 206, column: 5, scope: !1926)
!1929 = !DILocation(line: 207, column: 7, scope: !1926)
!1930 = !DILocation(line: 208, column: 2, scope: !1926)
!1931 = !DILocation(line: 210, column: 5, scope: !1923)
!1932 = !DILocation(line: 212, column: 22, scope: !1890)
!1933 = !DILocation(line: 212, column: 5, scope: !1890)
!1934 = !DILocation(line: 229, column: 2, scope: !1890)
!1935 = !DILocation(line: 229, column: 15, scope: !1890)
!1936 = !DILocation(line: 229, column: 9, scope: !1890)
!1937 = !DILocation(line: 231, column: 7, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1939, file: !28, line: 231, column: 7)
!1939 = distinct !DILexicalBlock(scope: !1890, file: !28, line: 230, column: 2)
!1940 = !DILocation(line: 231, column: 11, scope: !1938)
!1941 = !DILocation(line: 231, column: 23, scope: !1938)
!1942 = !DILocation(line: 233, column: 31, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1938, file: !28, line: 233, column: 8)
!1944 = !DILocation(line: 233, column: 9, scope: !1943)
!1945 = !DILocation(line: 233, column: 13, scope: !1943)
!1946 = !DILocation(line: 233, column: 25, scope: !1943)
!1947 = !DILocation(line: 233, column: 28, scope: !1943)
!1948 = !DILocation(line: 233, column: 42, scope: !1943)
!1949 = !DILocation(line: 235, column: 26, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1943, file: !28, line: 234, column: 4)
!1951 = !DILocation(line: 235, column: 5, scope: !1950)
!1952 = !DILocation(line: 235, column: 9, scope: !1950)
!1953 = !DILocation(line: 235, column: 20, scope: !1950)
!1954 = !DILocation(line: 235, column: 23, scope: !1950)
!1955 = !DILocation(line: 236, column: 5, scope: !1950)
!1956 = !DILocation(line: 236, column: 9, scope: !1950)
!1957 = !DILocation(line: 236, column: 21, scope: !1950)
!1958 = !DILocation(line: 236, column: 24, scope: !1950)
!1959 = !DILocation(line: 237, column: 5, scope: !1950)
!1960 = !DILocation(line: 237, column: 9, scope: !1950)
!1961 = !DILocation(line: 237, column: 27, scope: !1950)
!1962 = !DILocation(line: 237, column: 40, scope: !1950)
!1963 = !DILocation(line: 238, column: 4, scope: !1950)
!1964 = !DILocation(line: 240, column: 24, scope: !1943)
!1965 = !DILocation(line: 240, column: 28, scope: !1943)
!1966 = !DILocation(line: 240, column: 39, scope: !1943)
!1967 = !DILocation(line: 240, column: 43, scope: !1943)
!1968 = !DILocation(line: 240, column: 47, scope: !1943)
!1969 = !DILocation(line: 240, column: 60, scope: !1943)
!1970 = !DILocation(line: 240, column: 63, scope: !1943)
!1971 = !DILocation(line: 240, column: 5, scope: !1943)
!1972 = !DILocation(line: 233, column: 45, scope: !1943)
!1973 = !DILocation(line: 242, column: 5, scope: !1939)
!1974 = !DILocation(line: 242, column: 10, scope: !1939)
!1975 = distinct !{!1975, !1934, !1976, !1523}
!1976 = !DILocation(line: 243, column: 2, scope: !1890)
!1977 = !DILocation(line: 245, column: 1, scope: !1890)
!1978 = distinct !DISubprogram(name: "do_morph_frame", linkageName: "_Z14do_morph_frameP6object", scope: !28, file: !28, line: 249, type: !1979, scopeLine: 250, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1979 = !DISubroutineType(types: !1980)
!1980 = !{null, !1331}
!1981 = !DILocalVariable(name: "obj", arg: 1, scope: !1978, file: !28, line: 249, type: !1331)
!1982 = !DILocation(line: 249, column: 29, scope: !1978)
!1983 = !DILocalVariable(name: "i", scope: !1978, file: !28, line: 251, type: !19)
!1984 = !DILocation(line: 251, column: 6, scope: !1978)
!1985 = !DILocalVariable(name: "pm", scope: !1978, file: !28, line: 252, type: !1529)
!1986 = !DILocation(line: 252, column: 13, scope: !1978)
!1987 = !DILocalVariable(name: "md", scope: !1978, file: !28, line: 253, type: !1490)
!1988 = !DILocation(line: 253, column: 14, scope: !1978)
!1989 = !DILocation(line: 255, column: 23, scope: !1978)
!1990 = !DILocation(line: 255, column: 7, scope: !1978)
!1991 = !DILocation(line: 255, column: 5, scope: !1978)
!1992 = !DILocation(line: 257, column: 6, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1978, file: !28, line: 257, column: 6)
!1994 = !DILocation(line: 257, column: 9, scope: !1993)
!1995 = !DILocation(line: 258, column: 3, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1993, file: !28, line: 257, column: 18)
!1997 = !DILocation(line: 258, column: 8, scope: !1996)
!1998 = !DILocation(line: 258, column: 14, scope: !1996)
!1999 = !DILocation(line: 259, column: 3, scope: !1996)
!2000 = !DILocation(line: 262, column: 23, scope: !1978)
!2001 = !DILocation(line: 262, column: 27, scope: !1978)
!2002 = !DILocation(line: 262, column: 32, scope: !1978)
!2003 = !DILocation(line: 262, column: 48, scope: !1978)
!2004 = !DILocation(line: 262, column: 8, scope: !1978)
!2005 = !DILocation(line: 262, column: 5, scope: !1978)
!2006 = !DILocation(line: 264, column: 8, scope: !2007)
!2007 = distinct !DILexicalBlock(scope: !1978, file: !28, line: 264, column: 2)
!2008 = !DILocation(line: 264, column: 7, scope: !2007)
!2009 = !DILocation(line: 264, column: 11, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !2007, file: !28, line: 264, column: 2)
!2011 = !DILocation(line: 264, column: 13, scope: !2010)
!2012 = !DILocation(line: 264, column: 17, scope: !2010)
!2013 = !DILocation(line: 264, column: 12, scope: !2010)
!2014 = !DILocation(line: 264, column: 2, scope: !2007)
!2015 = !DILocation(line: 265, column: 7, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !2010, file: !28, line: 265, column: 7)
!2017 = !DILocation(line: 265, column: 11, scope: !2016)
!2018 = !DILocation(line: 265, column: 27, scope: !2016)
!2019 = !DILocation(line: 265, column: 29, scope: !2016)
!2020 = !DILocation(line: 267, column: 18, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2016, file: !28, line: 266, column: 3)
!2022 = !DILocation(line: 267, column: 21, scope: !2021)
!2023 = !DILocation(line: 267, column: 23, scope: !2021)
!2024 = !DILocation(line: 267, column: 4, scope: !2021)
!2025 = !DILocation(line: 269, column: 8, scope: !2026)
!2026 = distinct !DILexicalBlock(scope: !2021, file: !28, line: 269, column: 8)
!2027 = !DILocation(line: 269, column: 12, scope: !2026)
!2028 = !DILocation(line: 269, column: 30, scope: !2026)
!2029 = !DILocation(line: 269, column: 33, scope: !2026)
!2030 = !DILocalVariable(name: "t", scope: !2031, file: !28, line: 271, type: !19)
!2031 = distinct !DILexicalBlock(scope: !2026, file: !28, line: 270, column: 4)
!2032 = !DILocation(line: 271, column: 9, scope: !2031)
!2033 = !DILocation(line: 273, column: 5, scope: !2031)
!2034 = !DILocation(line: 273, column: 9, scope: !2031)
!2035 = !DILocation(line: 273, column: 25, scope: !2031)
!2036 = !DILocation(line: 273, column: 28, scope: !2031)
!2037 = !DILocation(line: 275, column: 5, scope: !2031)
!2038 = !DILocation(line: 275, column: 9, scope: !2031)
!2039 = !DILocation(line: 275, column: 27, scope: !2031)
!2040 = !DILocation(line: 277, column: 11, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2031, file: !28, line: 277, column: 5)
!2042 = !DILocation(line: 277, column: 10, scope: !2041)
!2043 = !DILocation(line: 277, column: 14, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !2041, file: !28, line: 277, column: 5)
!2045 = !DILocation(line: 277, column: 16, scope: !2044)
!2046 = !DILocation(line: 277, column: 20, scope: !2044)
!2047 = !DILocation(line: 277, column: 15, scope: !2044)
!2048 = !DILocation(line: 277, column: 5, scope: !2041)
!2049 = !DILocation(line: 278, column: 10, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !2044, file: !28, line: 278, column: 10)
!2051 = !DILocation(line: 278, column: 14, scope: !2050)
!2052 = !DILocation(line: 278, column: 31, scope: !2050)
!2053 = !DILocation(line: 278, column: 37, scope: !2050)
!2054 = !DILocation(line: 278, column: 34, scope: !2050)
!2055 = !DILocation(line: 280, column: 19, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2050, file: !28, line: 279, column: 6)
!2057 = !DILocation(line: 280, column: 27, scope: !2056)
!2058 = !DILocation(line: 280, column: 29, scope: !2056)
!2059 = !DILocation(line: 280, column: 7, scope: !2056)
!2060 = !DILocation(line: 281, column: 7, scope: !2056)
!2061 = !DILocation(line: 281, column: 11, scope: !2056)
!2062 = !DILocation(line: 281, column: 29, scope: !2056)
!2063 = !DILocation(line: 282, column: 7, scope: !2056)
!2064 = !DILocation(line: 282, column: 11, scope: !2056)
!2065 = !DILocation(line: 282, column: 27, scope: !2056)
!2066 = !DILocation(line: 282, column: 30, scope: !2056)
!2067 = !DILocation(line: 283, column: 6, scope: !2056)
!2068 = !DILocation(line: 277, column: 30, scope: !2044)
!2069 = !DILocation(line: 277, column: 5, scope: !2044)
!2070 = distinct !{!2070, !2048, !2071, !1523}
!2071 = !DILocation(line: 283, column: 6, scope: !2041)
!2072 = !DILocation(line: 284, column: 4, scope: !2031)
!2073 = !DILocation(line: 285, column: 3, scope: !2021)
!2074 = !DILocation(line: 265, column: 31, scope: !2016)
!2075 = !DILocation(line: 264, column: 27, scope: !2010)
!2076 = !DILocation(line: 264, column: 2, scope: !2010)
!2077 = distinct !{!2077, !2014, !2078, !1523}
!2078 = !DILocation(line: 285, column: 3, scope: !2007)
!2079 = !DILocation(line: 287, column: 7, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !1978, file: !28, line: 287, column: 6)
!2081 = !DILocation(line: 287, column: 11, scope: !2080)
!2082 = !DILocation(line: 287, column: 6, scope: !2080)
!2083 = !DILocation(line: 289, column: 27, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2080, file: !28, line: 288, column: 2)
!2085 = !DILocation(line: 289, column: 31, scope: !2084)
!2086 = !DILocation(line: 289, column: 3, scope: !2084)
!2087 = !DILocation(line: 289, column: 7, scope: !2084)
!2088 = !DILocation(line: 289, column: 12, scope: !2084)
!2089 = !DILocation(line: 289, column: 25, scope: !2084)
!2090 = !DILocation(line: 290, column: 28, scope: !2084)
!2091 = !DILocation(line: 290, column: 32, scope: !2084)
!2092 = !DILocation(line: 290, column: 3, scope: !2084)
!2093 = !DILocation(line: 290, column: 7, scope: !2084)
!2094 = !DILocation(line: 290, column: 12, scope: !2084)
!2095 = !DILocation(line: 290, column: 26, scope: !2084)
!2096 = !DILocation(line: 292, column: 3, scope: !2084)
!2097 = !DILocation(line: 292, column: 7, scope: !2084)
!2098 = !DILocation(line: 292, column: 12, scope: !2084)
!2099 = !DILocation(line: 292, column: 24, scope: !2084)
!2100 = !DILocation(line: 294, column: 30, scope: !2084)
!2101 = !DILocation(line: 294, column: 34, scope: !2084)
!2102 = !DILocation(line: 294, column: 3, scope: !2084)
!2103 = !DILocation(line: 294, column: 7, scope: !2084)
!2104 = !DILocation(line: 294, column: 12, scope: !2084)
!2105 = !DILocation(line: 294, column: 28, scope: !2084)
!2106 = !DILocation(line: 296, column: 3, scope: !2084)
!2107 = !DILocation(line: 296, column: 7, scope: !2084)
!2108 = !DILocation(line: 296, column: 11, scope: !2084)
!2109 = !DILocation(line: 297, column: 2, scope: !2084)
!2110 = !DILocation(line: 298, column: 1, scope: !1978)
!2111 = distinct !DISubprogram(name: "init_morphs", linkageName: "_Z11init_morphsv", scope: !28, file: !28, line: 302, type: !1095, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2112 = !DILocalVariable(name: "i", scope: !2111, file: !28, line: 304, type: !19)
!2113 = !DILocation(line: 304, column: 6, scope: !2111)
!2114 = !DILocation(line: 306, column: 8, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2111, file: !28, line: 306, column: 2)
!2116 = !DILocation(line: 306, column: 7, scope: !2115)
!2117 = !DILocation(line: 306, column: 11, scope: !2118)
!2118 = distinct !DILexicalBlock(scope: !2115, file: !28, line: 306, column: 2)
!2119 = !DILocation(line: 306, column: 12, scope: !2118)
!2120 = !DILocation(line: 306, column: 2, scope: !2115)
!2121 = !DILocation(line: 307, column: 17, scope: !2118)
!2122 = !DILocation(line: 307, column: 3, scope: !2118)
!2123 = !DILocation(line: 307, column: 20, scope: !2118)
!2124 = !DILocation(line: 307, column: 24, scope: !2118)
!2125 = !DILocation(line: 306, column: 32, scope: !2118)
!2126 = !DILocation(line: 306, column: 2, scope: !2118)
!2127 = distinct !{!2127, !2120, !2128, !1523}
!2128 = !DILocation(line: 307, column: 26, scope: !2115)
!2129 = !DILocation(line: 308, column: 1, scope: !2111)
!2130 = distinct !DISubprogram(name: "morph_start", linkageName: "_Z11morph_startP6object", scope: !28, file: !28, line: 420, type: !1979, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2131 = !DILocalVariable(name: "obj", arg: 1, scope: !2130, file: !28, line: 420, type: !1331)
!2132 = !DILocation(line: 420, column: 26, scope: !2130)
!2133 = !DILocalVariable(name: "pm", scope: !2130, file: !28, line: 431, type: !1529)
!2134 = !DILocation(line: 431, column: 13, scope: !2130)
!2135 = !DILocalVariable(name: "pmmin", scope: !2130, file: !28, line: 432, type: !10)
!2136 = !DILocation(line: 432, column: 13, scope: !2130)
!2137 = !DILocalVariable(name: "pmmax", scope: !2130, file: !28, line: 432, type: !10)
!2138 = !DILocation(line: 432, column: 19, scope: !2130)
!2139 = !DILocalVariable(name: "box_size", scope: !2130, file: !28, line: 433, type: !10)
!2140 = !DILocation(line: 433, column: 13, scope: !2130)
!2141 = !DILocalVariable(name: "i", scope: !2130, file: !28, line: 434, type: !19)
!2142 = !DILocation(line: 434, column: 6, scope: !2130)
!2143 = !DILocalVariable(name: "md", scope: !2130, file: !28, line: 435, type: !1490)
!2144 = !DILocation(line: 435, column: 14, scope: !2130)
!2145 = !DILocation(line: 437, column: 8, scope: !2146)
!2146 = distinct !DILexicalBlock(scope: !2130, file: !28, line: 437, column: 2)
!2147 = !DILocation(line: 437, column: 7, scope: !2146)
!2148 = !DILocation(line: 437, column: 11, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2146, file: !28, line: 437, column: 2)
!2150 = !DILocation(line: 437, column: 12, scope: !2149)
!2151 = !DILocation(line: 437, column: 2, scope: !2146)
!2152 = !DILocation(line: 438, column: 21, scope: !2153)
!2153 = distinct !DILexicalBlock(scope: !2149, file: !28, line: 438, column: 7)
!2154 = !DILocation(line: 438, column: 7, scope: !2153)
!2155 = !DILocation(line: 438, column: 24, scope: !2153)
!2156 = !DILocation(line: 438, column: 28, scope: !2153)
!2157 = !DILocation(line: 438, column: 36, scope: !2153)
!2158 = !DILocation(line: 438, column: 53, scope: !2153)
!2159 = !DILocation(line: 438, column: 39, scope: !2153)
!2160 = !DILocation(line: 438, column: 56, scope: !2153)
!2161 = !DILocation(line: 438, column: 61, scope: !2153)
!2162 = !DILocation(line: 438, column: 65, scope: !2153)
!2163 = !DILocation(line: 438, column: 77, scope: !2153)
!2164 = !DILocation(line: 438, column: 94, scope: !2153)
!2165 = !DILocation(line: 438, column: 80, scope: !2153)
!2166 = !DILocation(line: 438, column: 97, scope: !2153)
!2167 = !DILocation(line: 438, column: 102, scope: !2153)
!2168 = !DILocation(line: 438, column: 127, scope: !2153)
!2169 = !DILocation(line: 438, column: 113, scope: !2153)
!2170 = !DILocation(line: 438, column: 130, scope: !2153)
!2171 = !DILocation(line: 438, column: 111, scope: !2153)
!2172 = !DILocation(line: 439, column: 4, scope: !2153)
!2173 = !DILocation(line: 437, column: 32, scope: !2149)
!2174 = !DILocation(line: 437, column: 2, scope: !2149)
!2175 = distinct !{!2175, !2151, !2176, !1523}
!2176 = !DILocation(line: 439, column: 4, scope: !2146)
!2177 = !DILocation(line: 441, column: 6, scope: !2178)
!2178 = distinct !DILexicalBlock(scope: !2130, file: !28, line: 441, column: 6)
!2179 = !DILocation(line: 441, column: 7, scope: !2178)
!2180 = !DILocation(line: 442, column: 3, scope: !2178)
!2181 = !DILocation(line: 444, column: 22, scope: !2130)
!2182 = !DILocation(line: 444, column: 8, scope: !2130)
!2183 = !DILocation(line: 444, column: 5, scope: !2130)
!2184 = !DILocation(line: 446, column: 2, scope: !2130)
!2185 = !DILocation(line: 448, column: 12, scope: !2130)
!2186 = !DILocation(line: 448, column: 2, scope: !2130)
!2187 = !DILocation(line: 448, column: 6, scope: !2130)
!2188 = !DILocation(line: 448, column: 10, scope: !2130)
!2189 = !DILocation(line: 449, column: 18, scope: !2130)
!2190 = !DILocation(line: 449, column: 23, scope: !2130)
!2191 = !DILocation(line: 449, column: 2, scope: !2130)
!2192 = !DILocation(line: 449, column: 6, scope: !2130)
!2193 = !DILocation(line: 449, column: 16, scope: !2130)
!2194 = !DILocation(line: 451, column: 32, scope: !2130)
!2195 = !DILocation(line: 451, column: 37, scope: !2130)
!2196 = !DILocation(line: 451, column: 2, scope: !2130)
!2197 = !DILocation(line: 451, column: 6, scope: !2130)
!2198 = !DILocation(line: 451, column: 30, scope: !2130)
!2199 = !DILocation(line: 452, column: 33, scope: !2130)
!2200 = !DILocation(line: 452, column: 38, scope: !2130)
!2201 = !DILocation(line: 452, column: 2, scope: !2130)
!2202 = !DILocation(line: 452, column: 6, scope: !2130)
!2203 = !DILocation(line: 452, column: 31, scope: !2130)
!2204 = !DILocation(line: 453, column: 29, scope: !2130)
!2205 = !DILocation(line: 453, column: 34, scope: !2130)
!2206 = !DILocation(line: 453, column: 2, scope: !2130)
!2207 = !DILocation(line: 453, column: 6, scope: !2130)
!2208 = !DILocation(line: 453, column: 27, scope: !2130)
!2209 = !DILocation(line: 455, column: 2, scope: !2130)
!2210 = !DILocation(line: 457, column: 2, scope: !2130)
!2211 = !DILocation(line: 457, column: 7, scope: !2130)
!2212 = !DILocation(line: 457, column: 20, scope: !2130)
!2213 = !DILocation(line: 458, column: 2, scope: !2130)
!2214 = !DILocation(line: 458, column: 7, scope: !2130)
!2215 = !DILocation(line: 458, column: 19, scope: !2130)
!2216 = !DILocation(line: 459, column: 2, scope: !2130)
!2217 = !DILocation(line: 459, column: 7, scope: !2130)
!2218 = !DILocation(line: 459, column: 21, scope: !2130)
!2219 = !DILocation(line: 461, column: 2, scope: !2130)
!2220 = !DILocation(line: 461, column: 7, scope: !2130)
!2221 = !DILocation(line: 461, column: 23, scope: !2130)
!2222 = !DILocation(line: 461, column: 30, scope: !2130)
!2223 = !DILocation(line: 463, column: 23, scope: !2130)
!2224 = !DILocation(line: 463, column: 28, scope: !2130)
!2225 = !DILocation(line: 463, column: 44, scope: !2130)
!2226 = !DILocation(line: 463, column: 8, scope: !2130)
!2227 = !DILocation(line: 463, column: 5, scope: !2130)
!2228 = !DILocation(line: 465, column: 15, scope: !2130)
!2229 = !DILocation(line: 465, column: 2, scope: !2130)
!2230 = !DILocation(line: 467, column: 31, scope: !2130)
!2231 = !DILocation(line: 467, column: 24, scope: !2130)
!2232 = !DILocation(line: 467, column: 39, scope: !2130)
!2233 = !DILocation(line: 467, column: 15, scope: !2130)
!2234 = !DILocation(line: 467, column: 42, scope: !2130)
!2235 = !DILocation(line: 467, column: 11, scope: !2130)
!2236 = !DILocation(line: 467, column: 13, scope: !2130)
!2237 = !DILocation(line: 468, column: 31, scope: !2130)
!2238 = !DILocation(line: 468, column: 24, scope: !2130)
!2239 = !DILocation(line: 468, column: 39, scope: !2130)
!2240 = !DILocation(line: 468, column: 15, scope: !2130)
!2241 = !DILocation(line: 468, column: 42, scope: !2130)
!2242 = !DILocation(line: 468, column: 11, scope: !2130)
!2243 = !DILocation(line: 468, column: 13, scope: !2130)
!2244 = !DILocation(line: 469, column: 31, scope: !2130)
!2245 = !DILocation(line: 469, column: 24, scope: !2130)
!2246 = !DILocation(line: 469, column: 39, scope: !2130)
!2247 = !DILocation(line: 469, column: 15, scope: !2130)
!2248 = !DILocation(line: 469, column: 42, scope: !2130)
!2249 = !DILocation(line: 469, column: 11, scope: !2130)
!2250 = !DILocation(line: 469, column: 13, scope: !2130)
!2251 = !DILocation(line: 471, column: 8, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2130, file: !28, line: 471, column: 2)
!2253 = !DILocation(line: 471, column: 7, scope: !2252)
!2254 = !DILocation(line: 471, column: 11, scope: !2255)
!2255 = distinct !DILexicalBlock(scope: !2252, file: !28, line: 471, column: 2)
!2256 = !DILocation(line: 471, column: 12, scope: !2255)
!2257 = !DILocation(line: 471, column: 2, scope: !2252)
!2258 = !DILocation(line: 472, column: 3, scope: !2255)
!2259 = !DILocation(line: 472, column: 7, scope: !2255)
!2260 = !DILocation(line: 472, column: 19, scope: !2255)
!2261 = !DILocation(line: 472, column: 22, scope: !2255)
!2262 = !DILocation(line: 471, column: 23, scope: !2255)
!2263 = !DILocation(line: 471, column: 2, scope: !2255)
!2264 = distinct !{!2264, !2257, !2265, !1523}
!2265 = !DILocation(line: 472, column: 24, scope: !2252)
!2266 = !DILocation(line: 474, column: 8, scope: !2267)
!2267 = distinct !DILexicalBlock(scope: !2130, file: !28, line: 474, column: 2)
!2268 = !DILocation(line: 474, column: 7, scope: !2267)
!2269 = !DILocation(line: 474, column: 11, scope: !2270)
!2270 = distinct !DILexicalBlock(scope: !2267, file: !28, line: 474, column: 2)
!2271 = !DILocation(line: 474, column: 12, scope: !2270)
!2272 = !DILocation(line: 474, column: 2, scope: !2267)
!2273 = !DILocation(line: 475, column: 3, scope: !2270)
!2274 = !DILocation(line: 475, column: 7, scope: !2270)
!2275 = !DILocation(line: 475, column: 23, scope: !2270)
!2276 = !DILocation(line: 475, column: 26, scope: !2270)
!2277 = !DILocation(line: 474, column: 28, scope: !2270)
!2278 = !DILocation(line: 474, column: 2, scope: !2270)
!2279 = distinct !{!2279, !2272, !2280, !1523}
!2280 = !DILocation(line: 475, column: 28, scope: !2267)
!2281 = !DILocation(line: 477, column: 2, scope: !2130)
!2282 = !DILocation(line: 477, column: 6, scope: !2130)
!2283 = !DILocation(line: 477, column: 25, scope: !2130)
!2284 = !DILocation(line: 479, column: 2, scope: !2130)
!2285 = !DILocation(line: 479, column: 6, scope: !2130)
!2286 = !DILocation(line: 479, column: 25, scope: !2130)
!2287 = !DILocation(line: 483, column: 14, scope: !2130)
!2288 = !DILocation(line: 483, column: 29, scope: !2130)
!2289 = !DILocation(line: 483, column: 2, scope: !2130)
!2290 = !DILocation(line: 484, column: 1, scope: !2130)
!2291 = distinct !DISubprogram(name: "max<int>", linkageName: "_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_", scope: !78, file: !2292, line: 35, type: !2293, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2296, retainedNodes: !1491)
!2292 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/max.h", directory: "")
!2293 = !DISubroutineType(types: !2294)
!2294 = !{!2295, !2295, !2295}
!2295 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !75, size: 64)
!2296 = !{!2297}
!2297 = !DITemplateTypeParameter(name: "_Tp", type: !19)
!2298 = !DILocalVariable(name: "__a", arg: 1, scope: !2291, file: !2292, line: 35, type: !2295)
!2299 = !DILocation(line: 35, column: 38, scope: !2291)
!2300 = !DILocalVariable(name: "__b", arg: 2, scope: !2291, file: !2292, line: 35, type: !2295)
!2301 = !DILocation(line: 35, column: 76, scope: !2291)
!2302 = !DILocation(line: 36, column: 19, scope: !2291)
!2303 = !DILocation(line: 36, column: 24, scope: !2291)
!2304 = !DILocation(line: 36, column: 10, scope: !2291)
!2305 = !DILocation(line: 36, column: 3, scope: !2291)
!2306 = distinct !DISubprogram(name: "draw_model", linkageName: "_Z10draw_modelP9polymodeliP10vms_angveciP10morph_data", scope: !28, file: !28, line: 486, type: !2307, scopeLine: 487, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2307 = !DISubroutineType(types: !2308)
!2308 = !{null, !1529, !19, !2309, !15, !1490}
!2309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1443, size: 64)
!2310 = !DILocalVariable(name: "pm", arg: 1, scope: !2306, file: !28, line: 486, type: !1529)
!2311 = !DILocation(line: 486, column: 28, scope: !2306)
!2312 = !DILocalVariable(name: "submodel_num", arg: 2, scope: !2306, file: !28, line: 486, type: !19)
!2313 = !DILocation(line: 486, column: 35, scope: !2306)
!2314 = !DILocalVariable(name: "anim_angles", arg: 3, scope: !2306, file: !28, line: 486, type: !2309)
!2315 = !DILocation(line: 486, column: 60, scope: !2306)
!2316 = !DILocalVariable(name: "light", arg: 4, scope: !2306, file: !28, line: 486, type: !15)
!2317 = !DILocation(line: 486, column: 76, scope: !2306)
!2318 = !DILocalVariable(name: "md", arg: 5, scope: !2306, file: !28, line: 486, type: !1490)
!2319 = !DILocation(line: 486, column: 94, scope: !2306)
!2320 = !DILocalVariable(name: "i", scope: !2306, file: !28, line: 488, type: !19)
!2321 = !DILocation(line: 488, column: 6, scope: !2306)
!2322 = !DILocalVariable(name: "mn", scope: !2306, file: !28, line: 488, type: !19)
!2323 = !DILocation(line: 488, column: 8, scope: !2306)
!2324 = !DILocalVariable(name: "facing", scope: !2306, file: !28, line: 489, type: !19)
!2325 = !DILocation(line: 489, column: 6, scope: !2306)
!2326 = !DILocalVariable(name: "sort_list", scope: !2306, file: !28, line: 490, type: !1469)
!2327 = !DILocation(line: 490, column: 6, scope: !2306)
!2328 = !DILocalVariable(name: "sort_n", scope: !2306, file: !28, line: 490, type: !19)
!2329 = !DILocation(line: 490, column: 31, scope: !2306)
!2330 = !DILocation(line: 494, column: 17, scope: !2306)
!2331 = !DILocation(line: 494, column: 2, scope: !2306)
!2332 = !DILocation(line: 494, column: 15, scope: !2306)
!2333 = !DILocation(line: 495, column: 9, scope: !2306)
!2334 = !DILocation(line: 497, column: 8, scope: !2335)
!2335 = distinct !DILexicalBlock(scope: !2306, file: !28, line: 497, column: 2)
!2336 = !DILocation(line: 497, column: 7, scope: !2335)
!2337 = !DILocation(line: 497, column: 11, scope: !2338)
!2338 = distinct !DILexicalBlock(scope: !2335, file: !28, line: 497, column: 2)
!2339 = !DILocation(line: 497, column: 13, scope: !2338)
!2340 = !DILocation(line: 497, column: 17, scope: !2338)
!2341 = !DILocation(line: 497, column: 12, scope: !2338)
!2342 = !DILocation(line: 497, column: 2, scope: !2335)
!2343 = !DILocation(line: 499, column: 7, scope: !2344)
!2344 = distinct !DILexicalBlock(scope: !2338, file: !28, line: 499, column: 7)
!2345 = !DILocation(line: 499, column: 11, scope: !2344)
!2346 = !DILocation(line: 499, column: 27, scope: !2344)
!2347 = !DILocation(line: 499, column: 30, scope: !2344)
!2348 = !DILocation(line: 499, column: 33, scope: !2344)
!2349 = !DILocation(line: 499, column: 37, scope: !2344)
!2350 = !DILocation(line: 499, column: 54, scope: !2344)
!2351 = !DILocation(line: 499, column: 58, scope: !2344)
!2352 = !DILocation(line: 499, column: 56, scope: !2344)
!2353 = !DILocation(line: 501, column: 37, scope: !2354)
!2354 = distinct !DILexicalBlock(scope: !2344, file: !28, line: 500, column: 3)
!2355 = !DILocation(line: 501, column: 41, scope: !2354)
!2356 = !DILocation(line: 501, column: 55, scope: !2354)
!2357 = !DILocation(line: 501, column: 59, scope: !2354)
!2358 = !DILocation(line: 501, column: 63, scope: !2354)
!2359 = !DILocation(line: 501, column: 78, scope: !2354)
!2360 = !DILocation(line: 501, column: 13, scope: !2354)
!2361 = !DILocation(line: 501, column: 11, scope: !2354)
!2362 = !DILocation(line: 502, column: 9, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2354, file: !28, line: 502, column: 8)
!2364 = !DILocation(line: 502, column: 8, scope: !2363)
!2365 = !DILocation(line: 503, column: 27, scope: !2363)
!2366 = !DILocation(line: 503, column: 21, scope: !2363)
!2367 = !DILocation(line: 503, column: 5, scope: !2363)
!2368 = !DILocation(line: 503, column: 25, scope: !2363)
!2369 = !DILocalVariable(name: "t", scope: !2370, file: !28, line: 506, type: !19)
!2370 = distinct !DILexicalBlock(scope: !2363, file: !28, line: 505, column: 4)
!2371 = !DILocation(line: 506, column: 9, scope: !2370)
!2372 = !DILocation(line: 508, column: 12, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2370, file: !28, line: 508, column: 5)
!2374 = !DILocation(line: 508, column: 11, scope: !2373)
!2375 = !DILocation(line: 508, column: 10, scope: !2373)
!2376 = !DILocation(line: 508, column: 19, scope: !2377)
!2377 = distinct !DILexicalBlock(scope: !2373, file: !28, line: 508, column: 5)
!2378 = !DILocation(line: 508, column: 20, scope: !2377)
!2379 = !DILocation(line: 508, column: 5, scope: !2373)
!2380 = !DILocation(line: 509, column: 31, scope: !2377)
!2381 = !DILocation(line: 509, column: 32, scope: !2377)
!2382 = !DILocation(line: 509, column: 21, scope: !2377)
!2383 = !DILocation(line: 509, column: 16, scope: !2377)
!2384 = !DILocation(line: 509, column: 6, scope: !2377)
!2385 = !DILocation(line: 509, column: 19, scope: !2377)
!2386 = !DILocation(line: 508, column: 24, scope: !2377)
!2387 = !DILocation(line: 508, column: 5, scope: !2377)
!2388 = distinct !{!2388, !2379, !2389, !1523}
!2389 = !DILocation(line: 509, column: 34, scope: !2373)
!2390 = !DILocation(line: 511, column: 20, scope: !2370)
!2391 = !DILocation(line: 511, column: 5, scope: !2370)
!2392 = !DILocation(line: 511, column: 18, scope: !2370)
!2393 = !DILocation(line: 513, column: 11, scope: !2370)
!2394 = !DILocation(line: 515, column: 3, scope: !2354)
!2395 = !DILocation(line: 497, column: 27, scope: !2338)
!2396 = !DILocation(line: 497, column: 2, scope: !2338)
!2397 = distinct !{!2397, !2342, !2398, !1523}
!2398 = !DILocation(line: 515, column: 3, scope: !2335)
!2399 = !DILocation(line: 519, column: 8, scope: !2400)
!2400 = distinct !DILexicalBlock(scope: !2306, file: !28, line: 519, column: 2)
!2401 = !DILocation(line: 519, column: 7, scope: !2400)
!2402 = !DILocation(line: 519, column: 11, scope: !2403)
!2403 = distinct !DILexicalBlock(scope: !2400, file: !28, line: 519, column: 2)
!2404 = !DILocation(line: 519, column: 13, scope: !2403)
!2405 = !DILocation(line: 519, column: 12, scope: !2403)
!2406 = !DILocation(line: 519, column: 2, scope: !2400)
!2407 = !DILocation(line: 521, column: 18, scope: !2408)
!2408 = distinct !DILexicalBlock(scope: !2403, file: !28, line: 520, column: 2)
!2409 = !DILocation(line: 521, column: 8, scope: !2408)
!2410 = !DILocation(line: 521, column: 6, scope: !2408)
!2411 = !DILocation(line: 523, column: 7, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2408, file: !28, line: 523, column: 7)
!2413 = !DILocation(line: 523, column: 13, scope: !2412)
!2414 = !DILocation(line: 523, column: 10, scope: !2412)
!2415 = !DILocalVariable(name: "i", scope: !2416, file: !28, line: 525, type: !19)
!2416 = distinct !DILexicalBlock(scope: !2412, file: !28, line: 524, column: 3)
!2417 = !DILocation(line: 525, column: 9, scope: !2416)
!2418 = !DILocation(line: 527, column: 10, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !2416, file: !28, line: 527, column: 4)
!2420 = !DILocation(line: 527, column: 9, scope: !2419)
!2421 = !DILocation(line: 527, column: 13, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2419, file: !28, line: 527, column: 4)
!2423 = !DILocation(line: 527, column: 15, scope: !2422)
!2424 = !DILocation(line: 527, column: 19, scope: !2422)
!2425 = !DILocation(line: 527, column: 14, scope: !2422)
!2426 = !DILocation(line: 527, column: 4, scope: !2419)
!2427 = !DILocation(line: 529, column: 54, scope: !2428)
!2428 = distinct !DILexicalBlock(scope: !2422, file: !28, line: 528, column: 4)
!2429 = !DILocation(line: 529, column: 58, scope: !2428)
!2430 = !DILocation(line: 529, column: 72, scope: !2428)
!2431 = !DILocation(line: 529, column: 71, scope: !2428)
!2432 = !DILocation(line: 529, column: 40, scope: !2428)
!2433 = !DILocation(line: 529, column: 29, scope: !2428)
!2434 = !DILocation(line: 529, column: 24, scope: !2428)
!2435 = !DILocation(line: 529, column: 5, scope: !2428)
!2436 = !DILocation(line: 529, column: 27, scope: !2428)
!2437 = !DILocation(line: 530, column: 61, scope: !2428)
!2438 = !DILocation(line: 530, column: 65, scope: !2428)
!2439 = !DILocation(line: 530, column: 79, scope: !2428)
!2440 = !DILocation(line: 530, column: 78, scope: !2428)
!2441 = !DILocation(line: 530, column: 47, scope: !2428)
!2442 = !DILocation(line: 530, column: 36, scope: !2428)
!2443 = !DILocation(line: 530, column: 83, scope: !2428)
!2444 = !DILocation(line: 530, column: 24, scope: !2428)
!2445 = !DILocation(line: 530, column: 18, scope: !2428)
!2446 = !DILocation(line: 530, column: 5, scope: !2428)
!2447 = !DILocation(line: 530, column: 21, scope: !2428)
!2448 = !DILocation(line: 531, column: 4, scope: !2428)
!2449 = !DILocation(line: 527, column: 31, scope: !2422)
!2450 = !DILocation(line: 527, column: 4, scope: !2422)
!2451 = distinct !{!2451, !2426, !2452, !1523}
!2452 = !DILocation(line: 531, column: 4, scope: !2419)
!2453 = !DILocation(line: 535, column: 23, scope: !2416)
!2454 = !DILocation(line: 536, column: 10, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2416, file: !28, line: 536, column: 4)
!2456 = !DILocation(line: 536, column: 9, scope: !2455)
!2457 = !DILocation(line: 536, column: 13, scope: !2458)
!2458 = distinct !DILexicalBlock(scope: !2455, file: !28, line: 536, column: 4)
!2459 = !DILocation(line: 536, column: 15, scope: !2458)
!2460 = !DILocation(line: 536, column: 19, scope: !2458)
!2461 = !DILocation(line: 536, column: 14, scope: !2458)
!2462 = !DILocation(line: 536, column: 4, scope: !2455)
!2463 = !DILocation(line: 537, column: 5, scope: !2458)
!2464 = !DILocation(line: 537, column: 5, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2466, file: !28, line: 537, column: 5)
!2466 = distinct !DILexicalBlock(scope: !2458, file: !28, line: 537, column: 5)
!2467 = !DILocation(line: 537, column: 5, scope: !2468)
!2468 = distinct !DILexicalBlock(scope: !2465, file: !28, line: 537, column: 5)
!2469 = !DILocation(line: 537, column: 5, scope: !2466)
!2470 = !DILocation(line: 536, column: 31, scope: !2458)
!2471 = !DILocation(line: 536, column: 4, scope: !2458)
!2472 = distinct !{!2472, !2462, !2473, !1523}
!2473 = !DILocation(line: 537, column: 5, scope: !2455)
!2474 = !DILocation(line: 540, column: 8, scope: !2475)
!2475 = distinct !DILexicalBlock(scope: !2416, file: !28, line: 540, column: 8)
!2476 = !DILocation(line: 541, column: 24, scope: !2477)
!2477 = distinct !DILexicalBlock(scope: !2475, file: !28, line: 540, column: 28)
!2478 = !DILocation(line: 542, column: 11, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2477, file: !28, line: 542, column: 5)
!2480 = !DILocation(line: 542, column: 10, scope: !2479)
!2481 = !DILocation(line: 542, column: 14, scope: !2482)
!2482 = distinct !DILexicalBlock(scope: !2479, file: !28, line: 542, column: 5)
!2483 = !DILocation(line: 542, column: 16, scope: !2482)
!2484 = !DILocation(line: 542, column: 20, scope: !2482)
!2485 = !DILocation(line: 542, column: 15, scope: !2482)
!2486 = !DILocation(line: 542, column: 5, scope: !2479)
!2487 = !DILocation(line: 543, column: 6, scope: !2482)
!2488 = !DILocation(line: 543, column: 6, scope: !2489)
!2489 = distinct !DILexicalBlock(scope: !2490, file: !28, line: 543, column: 6)
!2490 = distinct !DILexicalBlock(scope: !2482, file: !28, line: 543, column: 6)
!2491 = !DILocation(line: 543, column: 6, scope: !2492)
!2492 = distinct !DILexicalBlock(scope: !2489, file: !28, line: 543, column: 6)
!2493 = !DILocation(line: 543, column: 6, scope: !2490)
!2494 = !DILocation(line: 542, column: 32, scope: !2482)
!2495 = !DILocation(line: 542, column: 5, scope: !2482)
!2496 = distinct !{!2496, !2486, !2497, !1523}
!2497 = !DILocation(line: 543, column: 6, scope: !2479)
!2498 = !DILocation(line: 544, column: 4, scope: !2477)
!2499 = !DILocation(line: 546, column: 4, scope: !2416)
!2500 = !DILocation(line: 549, column: 28, scope: !2416)
!2501 = !DILocation(line: 549, column: 32, scope: !2416)
!2502 = !DILocation(line: 549, column: 43, scope: !2416)
!2503 = !DILocation(line: 549, column: 47, scope: !2416)
!2504 = !DILocation(line: 549, column: 61, scope: !2416)
!2505 = !DILocation(line: 549, column: 89, scope: !2416)
!2506 = !DILocation(line: 549, column: 101, scope: !2416)
!2507 = !DILocation(line: 549, column: 108, scope: !2416)
!2508 = !DILocation(line: 549, column: 112, scope: !2416)
!2509 = !DILocation(line: 549, column: 123, scope: !2416)
!2510 = !DILocation(line: 549, column: 127, scope: !2416)
!2511 = !DILocation(line: 549, column: 148, scope: !2416)
!2512 = !DILocation(line: 549, column: 4, scope: !2416)
!2513 = !DILocation(line: 551, column: 3, scope: !2416)
!2514 = !DILocalVariable(name: "orient", scope: !2515, file: !28, line: 554, type: !1349)
!2515 = distinct !DILexicalBlock(scope: !2412, file: !28, line: 553, column: 3)
!2516 = !DILocation(line: 554, column: 15, scope: !2515)
!2517 = !DILocation(line: 555, column: 32, scope: !2515)
!2518 = !DILocation(line: 555, column: 44, scope: !2515)
!2519 = !DILocation(line: 555, column: 4, scope: !2515)
!2520 = !DILocation(line: 556, column: 30, scope: !2515)
!2521 = !DILocation(line: 556, column: 34, scope: !2515)
!2522 = !DILocation(line: 556, column: 51, scope: !2515)
!2523 = !DILocation(line: 556, column: 4, scope: !2515)
!2524 = !DILocation(line: 557, column: 15, scope: !2515)
!2525 = !DILocation(line: 557, column: 18, scope: !2515)
!2526 = !DILocation(line: 557, column: 21, scope: !2515)
!2527 = !DILocation(line: 557, column: 33, scope: !2515)
!2528 = !DILocation(line: 557, column: 39, scope: !2515)
!2529 = !DILocation(line: 557, column: 4, scope: !2515)
!2530 = !DILocation(line: 558, column: 4, scope: !2515)
!2531 = !DILocation(line: 560, column: 2, scope: !2408)
!2532 = !DILocation(line: 519, column: 21, scope: !2403)
!2533 = !DILocation(line: 519, column: 2, scope: !2403)
!2534 = distinct !{!2534, !2406, !2535, !1523}
!2535 = !DILocation(line: 560, column: 2, scope: !2400)
!2536 = !DILocation(line: 561, column: 1, scope: !2306)
!2537 = distinct !DISubprogram(name: "draw_morph_object", linkageName: "_Z17draw_morph_objectP6object", scope: !28, file: !28, line: 563, type: !1979, scopeLine: 564, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2538 = !DILocalVariable(name: "obj", arg: 1, scope: !2537, file: !28, line: 563, type: !1331)
!2539 = !DILocation(line: 563, column: 32, scope: !2537)
!2540 = !DILocalVariable(name: "po", scope: !2537, file: !28, line: 566, type: !1529)
!2541 = !DILocation(line: 566, column: 13, scope: !2537)
!2542 = !DILocalVariable(name: "light", scope: !2537, file: !28, line: 567, type: !15)
!2543 = !DILocation(line: 567, column: 6, scope: !2537)
!2544 = !DILocalVariable(name: "md", scope: !2537, file: !28, line: 568, type: !1490)
!2545 = !DILocation(line: 568, column: 14, scope: !2537)
!2546 = !DILocation(line: 570, column: 23, scope: !2537)
!2547 = !DILocation(line: 570, column: 7, scope: !2537)
!2548 = !DILocation(line: 570, column: 5, scope: !2537)
!2549 = !DILocation(line: 571, column: 2, scope: !2537)
!2550 = !DILocation(line: 573, column: 2, scope: !2537)
!2551 = !DILocation(line: 575, column: 21, scope: !2537)
!2552 = !DILocation(line: 575, column: 26, scope: !2537)
!2553 = !DILocation(line: 575, column: 42, scope: !2537)
!2554 = !DILocation(line: 575, column: 6, scope: !2537)
!2555 = !DILocation(line: 575, column: 4, scope: !2537)
!2556 = !DILocation(line: 577, column: 31, scope: !2537)
!2557 = !DILocation(line: 577, column: 10, scope: !2537)
!2558 = !DILocation(line: 577, column: 8, scope: !2537)
!2559 = !DILocation(line: 579, column: 28, scope: !2537)
!2560 = !DILocation(line: 579, column: 33, scope: !2537)
!2561 = !DILocation(line: 579, column: 38, scope: !2537)
!2562 = !DILocation(line: 579, column: 43, scope: !2537)
!2563 = !DILocation(line: 579, column: 2, scope: !2537)
!2564 = !DILocation(line: 580, column: 2, scope: !2537)
!2565 = !DILocation(line: 582, column: 13, scope: !2537)
!2566 = !DILocation(line: 582, column: 18, scope: !2537)
!2567 = !DILocation(line: 582, column: 23, scope: !2537)
!2568 = !DILocation(line: 582, column: 39, scope: !2537)
!2569 = !DILocation(line: 582, column: 51, scope: !2537)
!2570 = !DILocation(line: 582, column: 57, scope: !2537)
!2571 = !DILocation(line: 582, column: 2, scope: !2537)
!2572 = !DILocation(line: 584, column: 2, scope: !2537)
!2573 = !DILocation(line: 587, column: 6, scope: !2574)
!2574 = distinct !DILexicalBlock(scope: !2537, file: !28, line: 587, column: 6)
!2575 = !DILocation(line: 587, column: 20, scope: !2574)
!2576 = !DILocation(line: 588, column: 30, scope: !2574)
!2577 = !DILocation(line: 588, column: 3, scope: !2574)
!2578 = !DILocation(line: 591, column: 1, scope: !2537)
!2579 = distinct !DISubprogram(name: "max<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13maxB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !78, file: !2292, line: 29, type: !2580, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2587, retainedNodes: !1491)
!2580 = !DISubroutineType(types: !2581)
!2581 = !{!2295, !2295, !2295, !2582}
!2582 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__less<void, void>", scope: !78, file: !2583, line: 38, size: 8, flags: DIFlagTypePassByValue, elements: !1491, templateParams: !2584, identifier: "_ZTSNSt3__16__lessIvvEE")
!2583 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/comp.h", directory: "")
!2584 = !{!2585, !2586}
!2585 = !DITemplateTypeParameter(name: "_T1", type: null, defaulted: true)
!2586 = !DITemplateTypeParameter(name: "_T2", type: null, defaulted: true)
!2587 = !{!2297, !2588}
!2588 = !DITemplateTypeParameter(name: "_Compare", type: !2582)
!2589 = !DILocalVariable(name: "__a", arg: 1, scope: !2579, file: !2292, line: 29, type: !2295)
!2590 = !DILocation(line: 29, column: 38, scope: !2579)
!2591 = !DILocalVariable(name: "__b", arg: 2, scope: !2579, file: !2292, line: 29, type: !2295)
!2592 = !DILocation(line: 29, column: 76, scope: !2579)
!2593 = !DILocalVariable(name: "__comp", arg: 3, scope: !2579, file: !2292, line: 29, type: !2582)
!2594 = !DILocation(line: 29, column: 90, scope: !2579)
!2595 = !DILocation(line: 30, column: 17, scope: !2579)
!2596 = !DILocation(line: 30, column: 22, scope: !2579)
!2597 = !DILocation(line: 30, column: 10, scope: !2579)
!2598 = !DILocation(line: 30, column: 29, scope: !2579)
!2599 = !DILocation(line: 30, column: 35, scope: !2579)
!2600 = !DILocation(line: 30, column: 3, scope: !2579)
!2601 = distinct !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !2582, file: !2583, line: 40, type: !2602, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2607, declaration: !2606, retainedNodes: !1491)
!2602 = !DISubroutineType(types: !2603)
!2603 = !{!641, !2604, !2295, !2295}
!2604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2605, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2605 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2582)
!2606 = !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !2582, file: !2583, line: 40, type: !2602, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !2607)
!2607 = !{!2297, !2608}
!2608 = !DITemplateTypeParameter(name: "_Up", type: !19)
!2609 = !DILocalVariable(name: "this", arg: 1, scope: !2601, type: !2610, flags: DIFlagArtificial | DIFlagObjectPointer)
!2610 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2605, size: 64)
!2611 = !DILocation(line: 0, scope: !2601)
!2612 = !DILocalVariable(name: "__lhs", arg: 2, scope: !2601, file: !2583, line: 40, type: !2295)
!2613 = !DILocation(line: 40, column: 82, scope: !2601)
!2614 = !DILocalVariable(name: "__rhs", arg: 3, scope: !2601, file: !2583, line: 40, type: !2295)
!2615 = !DILocation(line: 40, column: 100, scope: !2601)
!2616 = !DILocation(line: 41, column: 12, scope: !2601)
!2617 = !DILocation(line: 41, column: 20, scope: !2601)
!2618 = !DILocation(line: 41, column: 18, scope: !2601)
!2619 = !DILocation(line: 41, column: 5, scope: !2601)
