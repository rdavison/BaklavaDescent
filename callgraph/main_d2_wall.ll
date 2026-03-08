; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/wall.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/wall.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.wall = type { i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.wclip = type { i32, i16, [50 x i16], i16, i16, i16, [13 x i8], i8 }
%struct.active_door = type { i32, [2 x i16], [2 x i16], i32 }
%struct.cloaking_wall = type { i16, i16, [4 x i32], [4 x i32], i32 }
%struct._grs_bitmap = type { i16, i16, i16, i16, i8, i8, i16, ptr, i16, i8, i8 }
%struct.bitmap_index = type { i16 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.vms_vector = type { i32, i32, i32 }
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
%"class.std::__1::vector" = type { ptr, ptr, ptr }
%struct.stuckobj = type { i16, i16, i32 }
%struct.tmap_info = type { i8, [3 x i8], i32, i32, i16, i16, i16, i16 }
%struct.eclip = type { %struct.vclip, i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.segmasks = type { i16, i8, i8 }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }

@Walls = global [254 x %struct.wall] zeroinitializer, align 4, !dbg !0
@Num_walls = global i32 0, align 4, !dbg !22
@WallAnims = global [60 x %struct.wclip] zeroinitializer, align 4, !dbg !25
@Num_wall_anims = global i32 0, align 4, !dbg !50
@ActiveDoors = global [90 x %struct.active_door] zeroinitializer, align 4, !dbg !52
@Num_open_doors = global i32 0, align 4, !dbg !67
@CloakingWalls = global [10 x %struct.cloaking_wall] zeroinitializer, align 4, !dbg !69
@Num_cloaking_walls = global i32 0, align 4, !dbg !85
@GameBitmaps = external global [2620 x %struct._grs_bitmap], align 8
@Textures = external global [1200 x %struct.bitmap_index], align 2
@Segments = external global [0 x %struct.segment], align 4
@Highest_segment_index = external global i32, align 4
@.str = private unnamed_addr constant [63 x i8] c"seg - Segments >= 0 && seg - Segments <= Highest_segment_index\00", align 1, !dbg !87
@.str.1 = private unnamed_addr constant [54 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/wall.cpp\00", align 1, !dbg !93
@.str.2 = private unnamed_addr constant [22 x i8] c"side >= 0 && side < 6\00", align 1, !dbg !98
@Newdemo_state = external global i32, align 4
@.str.3 = private unnamed_addr constant [45 x i8] c"tmap != 0 && seg->sides[side].tmap_num2 != 0\00", align 1, !dbg !103
@.str.4 = private unnamed_addr constant [32 x i8] c"seg->sides[side].wall_num != -1\00", align 1, !dbg !108
@.str.5 = private unnamed_addr constant [18 x i8] c"Connectside != -1\00", align 1, !dbg !113
@.str.6 = private unnamed_addr constant [20 x i8] c"seg - Segments != 0\00", align 1, !dbg !118
@.str.7 = private unnamed_addr constant [59 x i8] c"Hey bub, you are trying to destroy an indestructable wall.\00", align 1, !dbg !123
@.str.8 = private unnamed_addr constant [23 x i8] c"Damaging illegal wall\0A\00", align 1, !dbg !128
@Game_mode = external global i32, align 4
@.str.9 = private unnamed_addr constant [19 x i8] c"i < Num_open_doors\00", align 1, !dbg !133
@.str.10 = private unnamed_addr constant [10 x i8] c"d != NULL\00", align 1, !dbg !138
@.str.11 = private unnamed_addr constant [29 x i8] c"w->state == WALL_DOOR_CLOSED\00", align 1, !dbg !141
@.str.12 = private unnamed_addr constant [27 x i8] c"Num_open_doors < MAX_DOORS\00", align 1, !dbg !146
@.str.13 = private unnamed_addr constant [21 x i8] c"seg - Segments != -1\00", align 1, !dbg !151
@.str.14 = private unnamed_addr constant [45 x i8] c"w2->linked_wall == seg->sides[side].wall_num\00", align 1, !dbg !156
@.str.15 = private unnamed_addr constant [23 x i8] c"i < Num_cloaking_walls\00", align 1, !dbg !158
@.str.16 = private unnamed_addr constant [21 x i8] c"w->linked_wall == -1\00", align 1, !dbg !160
@Objects = external global [0 x %struct.object], align 4
@.str.17 = private unnamed_addr constant [27 x i8] c"w->state == WALL_DOOR_OPEN\00", align 1, !dbg !162
@.str.18 = private unnamed_addr constant [15 x i8] c"door_num != -1\00", align 1, !dbg !164
@FrameTime = external global i32, align 4
@.str.19 = private unnamed_addr constant [41 x i8] c"Trying to do_door_close on Illegal wall\0A\00", align 1, !dbg !169
@.str.20 = private unnamed_addr constant [12 x i8] c"cside != -1\00", align 1, !dbg !174
@.str.21 = private unnamed_addr constant [42 x i8] c"Trying to shut off illusion illegal wall\0A\00", align 1, !dbg !179
@.str.22 = private unnamed_addr constant [41 x i8] c"Trying to turn on illusion illegal wall\0A\00", align 1, !dbg !184
@Current_level_num = external global i32, align 4
@CurrentLogicVersion = external global i32, align 4
@Player_num = external global i32, align 4
@.str.23 = private unnamed_addr constant [15 x i8] c"playernum > -1\00", align 1, !dbg !186
@Players = external global [12 x %struct.player], align 4
@.str.24 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1, !dbg !188
@Text_string = external global %"class.std::__1::vector", align 8
@.str.25 = private unnamed_addr constant [40 x i8] c"seg - Segments <= Highest_segment_index\00", align 1, !dbg !193
@.str.26 = private unnamed_addr constant [29 x i8] c"side < MAX_SIDES_PER_SEGMENT\00", align 1, !dbg !198
@.str.27 = private unnamed_addr constant [21 x i8] c"Illegal wall_toggle\0A\00", align 1, !dbg !200
@.str.28 = private unnamed_addr constant [19 x i8] c"Illegal Num_walls\0A\00", align 1, !dbg !202
@.str.29 = private unnamed_addr constant [16 x i8] c"d->n_parts == 1\00", align 1, !dbg !204
@Num_stuck_objects = global i32 0, align 4, !dbg !209
@Stuck_objects = global [32 x %struct.stuckobj] zeroinitializer, align 4, !dbg !211
@.str.30 = private unnamed_addr constant [78 x i8] c"Warning: Unable to add object %i which got stuck in wall %i to Stuck_objects\0A\00", align 1, !dbg !220
@FrameCount = external global i32, align 4
@.str.31 = private unnamed_addr constant [73 x i8] c"Warning: Stuck object of type %i, expected to be of type %i, see wall.c\0A\00", align 1, !dbg !225
@.str.32 = private unnamed_addr constant [23 x i8] c"Num_stuck_objects == 0\00", align 1, !dbg !230
@TmapInfo = external global [1200 x %struct.tmap_info], align 4
@Effects = external global [110 x %struct.eclip], align 4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z18check_transparencyP7segmenti(ptr noundef %0, i32 noundef %1) #0 !dbg !1555 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1598, !DIExpression(), !1599)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1600, !DIExpression(), !1601)
  %6 = load ptr, ptr %4, align 8, !dbg !1602
  %7 = getelementptr inbounds nuw %struct.segment, ptr %6, i32 0, i32 0, !dbg !1604
  %8 = load i32, ptr %5, align 4, !dbg !1605
  %9 = sext i32 %8 to i64, !dbg !1602
  %10 = getelementptr inbounds [6 x %struct.side], ptr %7, i64 0, i64 %9, !dbg !1602
  %11 = getelementptr inbounds nuw %struct.side, ptr %10, i32 0, i32 4, !dbg !1606
  %12 = load i16, ptr %11, align 2, !dbg !1606
  %13 = sext i16 %12 to i32, !dbg !1602
  %14 = and i32 %13, 16383, !dbg !1607
  %15 = icmp eq i32 %14, 0, !dbg !1608
  br i1 %15, label %16, label %37, !dbg !1608

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8, !dbg !1609
  %18 = getelementptr inbounds nuw %struct.segment, ptr %17, i32 0, i32 0, !dbg !1612
  %19 = load i32, ptr %5, align 4, !dbg !1613
  %20 = sext i32 %19 to i64, !dbg !1609
  %21 = getelementptr inbounds [6 x %struct.side], ptr %18, i64 0, i64 %20, !dbg !1609
  %22 = getelementptr inbounds nuw %struct.side, ptr %21, i32 0, i32 3, !dbg !1614
  %23 = load i16, ptr %22, align 4, !dbg !1614
  %24 = sext i16 %23 to i64, !dbg !1615
  %25 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %24, !dbg !1615
  %26 = getelementptr inbounds nuw %struct.bitmap_index, ptr %25, i32 0, i32 0, !dbg !1616
  %27 = load i16, ptr %26, align 2, !dbg !1616
  %28 = zext i16 %27 to i64, !dbg !1617
  %29 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %28, !dbg !1617
  %30 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %29, i32 0, i32 5, !dbg !1618
  %31 = load i8, ptr %30, align 1, !dbg !1618
  %32 = sext i8 %31 to i32, !dbg !1617
  %33 = and i32 %32, 1, !dbg !1619
  %34 = icmp ne i32 %33, 0, !dbg !1617
  br i1 %34, label %35, label %36, !dbg !1617

35:                                               ; preds = %16
  store i32 1, ptr %3, align 4, !dbg !1620
  br label %60, !dbg !1620

36:                                               ; preds = %16
  store i32 0, ptr %3, align 4, !dbg !1621
  br label %60, !dbg !1621

37:                                               ; preds = %2
  %38 = load ptr, ptr %4, align 8, !dbg !1622
  %39 = getelementptr inbounds nuw %struct.segment, ptr %38, i32 0, i32 0, !dbg !1624
  %40 = load i32, ptr %5, align 4, !dbg !1625
  %41 = sext i32 %40 to i64, !dbg !1622
  %42 = getelementptr inbounds [6 x %struct.side], ptr %39, i64 0, i64 %41, !dbg !1622
  %43 = getelementptr inbounds nuw %struct.side, ptr %42, i32 0, i32 4, !dbg !1626
  %44 = load i16, ptr %43, align 2, !dbg !1626
  %45 = sext i16 %44 to i32, !dbg !1622
  %46 = and i32 %45, 16383, !dbg !1627
  %47 = sext i32 %46 to i64, !dbg !1628
  %48 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %47, !dbg !1628
  %49 = getelementptr inbounds nuw %struct.bitmap_index, ptr %48, i32 0, i32 0, !dbg !1629
  %50 = load i16, ptr %49, align 2, !dbg !1629
  %51 = zext i16 %50 to i64, !dbg !1630
  %52 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %51, !dbg !1630
  %53 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %52, i32 0, i32 5, !dbg !1631
  %54 = load i8, ptr %53, align 1, !dbg !1631
  %55 = sext i8 %54 to i32, !dbg !1630
  %56 = and i32 %55, 2, !dbg !1632
  %57 = icmp ne i32 %56, 0, !dbg !1630
  br i1 %57, label %58, label %59, !dbg !1630

58:                                               ; preds = %37
  store i32 1, ptr %3, align 4, !dbg !1633
  br label %60, !dbg !1633

59:                                               ; preds = %37
  store i32 0, ptr %3, align 4, !dbg !1634
  br label %60, !dbg !1634

60:                                               ; preds = %59, %58, %36, %35
  %61 = load i32, ptr %3, align 4, !dbg !1635
  ret i32 %61, !dbg !1635
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !1636 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1637, !DIExpression(), !1638)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1639, !DIExpression(), !1640)
    #dbg_declare(ptr %6, !1641, !DIExpression(), !1642)
    #dbg_declare(ptr %7, !1643, !DIExpression(), !1644)
    #dbg_declare(ptr %8, !1645, !DIExpression(), !1646)
  %9 = load ptr, ptr %4, align 8, !dbg !1647
  %10 = ptrtoint ptr %9 to i64, !dbg !1647
  %11 = sub i64 %10, ptrtoint (ptr @Segments to i64), !dbg !1647
  %12 = sdiv exact i64 %11, 512, !dbg !1647
  %13 = icmp sge i64 %12, 0, !dbg !1647
  br i1 %13, label %14, label %22, !dbg !1647

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8, !dbg !1647
  %16 = ptrtoint ptr %15 to i64, !dbg !1647
  %17 = sub i64 %16, ptrtoint (ptr @Segments to i64), !dbg !1647
  %18 = sdiv exact i64 %17, 512, !dbg !1647
  %19 = load i32, ptr @Highest_segment_index, align 4, !dbg !1647
  %20 = sext i32 %19 to i64, !dbg !1647
  %21 = icmp sle i64 %18, %20, !dbg !1647
  br label %22

22:                                               ; preds = %14, %2
  %23 = phi i1 [ false, %2 ], [ %21, %14 ], !dbg !1648
  %24 = zext i1 %23 to i32, !dbg !1647
  call void @_Z7_AssertiPKcS0_i(i32 noundef %24, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 150), !dbg !1647
  %25 = load i32, ptr %5, align 4, !dbg !1649
  %26 = icmp sge i32 %25, 0, !dbg !1649
  br i1 %26, label %27, label %30, !dbg !1649

27:                                               ; preds = %22
  %28 = load i32, ptr %5, align 4, !dbg !1649
  %29 = icmp slt i32 %28, 6, !dbg !1649
  br label %30

30:                                               ; preds = %27, %22
  %31 = phi i1 [ false, %22 ], [ %29, %27 ], !dbg !1648
  %32 = zext i1 %31 to i32, !dbg !1649
  call void @_Z7_AssertiPKcS0_i(i32 noundef %32, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 151), !dbg !1649
  %33 = load ptr, ptr %4, align 8, !dbg !1650
  %34 = getelementptr inbounds nuw %struct.segment, ptr %33, i32 0, i32 0, !dbg !1651
  %35 = load i32, ptr %5, align 4, !dbg !1652
  %36 = sext i32 %35 to i64, !dbg !1650
  %37 = getelementptr inbounds [6 x %struct.side], ptr %34, i64 0, i64 %36, !dbg !1650
  %38 = getelementptr inbounds nuw %struct.side, ptr %37, i32 0, i32 2, !dbg !1653
  %39 = load i16, ptr %38, align 2, !dbg !1653
  %40 = sext i16 %39 to i64, !dbg !1654
  %41 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %40, !dbg !1654
  %42 = getelementptr inbounds nuw %struct.wall, ptr %41, i32 0, i32 4, !dbg !1655
  %43 = load i8, ptr %42, align 4, !dbg !1655
  %44 = zext i8 %43 to i32, !dbg !1654
  store i32 %44, ptr %7, align 4, !dbg !1656
  %45 = load ptr, ptr %4, align 8, !dbg !1657
  %46 = getelementptr inbounds nuw %struct.segment, ptr %45, i32 0, i32 0, !dbg !1658
  %47 = load i32, ptr %5, align 4, !dbg !1659
  %48 = sext i32 %47 to i64, !dbg !1657
  %49 = getelementptr inbounds [6 x %struct.side], ptr %46, i64 0, i64 %48, !dbg !1657
  %50 = getelementptr inbounds nuw %struct.side, ptr %49, i32 0, i32 2, !dbg !1660
  %51 = load i16, ptr %50, align 2, !dbg !1660
  %52 = sext i16 %51 to i64, !dbg !1661
  %53 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %52, !dbg !1661
  %54 = getelementptr inbounds nuw %struct.wall, ptr %53, i32 0, i32 5, !dbg !1662
  %55 = load i8, ptr %54, align 1, !dbg !1662
  %56 = zext i8 %55 to i32, !dbg !1661
  store i32 %56, ptr %6, align 4, !dbg !1663
  %57 = load i32, ptr %7, align 4, !dbg !1664
  %58 = icmp eq i32 %57, 4, !dbg !1666
  br i1 %58, label %59, label %60, !dbg !1666

59:                                               ; preds = %30
  store i32 5, ptr %3, align 4, !dbg !1667
  br label %136, !dbg !1667

60:                                               ; preds = %30
  %61 = load i32, ptr %7, align 4, !dbg !1668
  %62 = icmp eq i32 %61, 3, !dbg !1670
  br i1 %62, label %63, label %86, !dbg !1670

63:                                               ; preds = %60
  %64 = load ptr, ptr %4, align 8, !dbg !1671
  %65 = getelementptr inbounds nuw %struct.segment, ptr %64, i32 0, i32 0, !dbg !1674
  %66 = load i32, ptr %5, align 4, !dbg !1675
  %67 = sext i32 %66 to i64, !dbg !1671
  %68 = getelementptr inbounds [6 x %struct.side], ptr %65, i64 0, i64 %67, !dbg !1671
  %69 = getelementptr inbounds nuw %struct.side, ptr %68, i32 0, i32 2, !dbg !1676
  %70 = load i16, ptr %69, align 2, !dbg !1676
  %71 = sext i16 %70 to i64, !dbg !1677
  %72 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %71, !dbg !1677
  %73 = getelementptr inbounds nuw %struct.wall, ptr %72, i32 0, i32 5, !dbg !1678
  %74 = load i8, ptr %73, align 1, !dbg !1678
  %75 = zext i8 %74 to i32, !dbg !1677
  %76 = and i32 %75, 32, !dbg !1679
  %77 = icmp ne i32 %76, 0, !dbg !1677
  br i1 %77, label %78, label %79, !dbg !1677

78:                                               ; preds = %63
  store i32 5, ptr %3, align 4, !dbg !1680
  br label %136, !dbg !1680

79:                                               ; preds = %63
  %80 = load ptr, ptr %4, align 8, !dbg !1681
  %81 = load i32, ptr %5, align 4, !dbg !1684
  %82 = call noundef i32 @_Z18check_transparencyP7segmenti(ptr noundef %80, i32 noundef %81), !dbg !1685
  %83 = icmp ne i32 %82, 0, !dbg !1685
  br i1 %83, label %84, label %85, !dbg !1685

84:                                               ; preds = %79
  store i32 7, ptr %3, align 4, !dbg !1686
  br label %136, !dbg !1686

85:                                               ; preds = %79
  store i32 3, ptr %3, align 4, !dbg !1687
  br label %136, !dbg !1687

86:                                               ; preds = %60
  %87 = load i32, ptr %7, align 4, !dbg !1688
  %88 = icmp eq i32 %87, 1, !dbg !1690
  br i1 %88, label %89, label %101, !dbg !1690

89:                                               ; preds = %86
  %90 = load i32, ptr %6, align 4, !dbg !1691
  %91 = and i32 %90, 1, !dbg !1694
  %92 = icmp ne i32 %91, 0, !dbg !1691
  br i1 %92, label %93, label %94, !dbg !1691

93:                                               ; preds = %89
  store i32 7, ptr %3, align 4, !dbg !1695
  br label %136, !dbg !1695

94:                                               ; preds = %89
  %95 = load ptr, ptr %4, align 8, !dbg !1696
  %96 = load i32, ptr %5, align 4, !dbg !1698
  %97 = call noundef i32 @_Z18check_transparencyP7segmenti(ptr noundef %95, i32 noundef %96), !dbg !1699
  %98 = icmp ne i32 %97, 0, !dbg !1699
  br i1 %98, label %99, label %100, !dbg !1699

99:                                               ; preds = %94
  store i32 6, ptr %3, align 4, !dbg !1700
  br label %136, !dbg !1700

100:                                              ; preds = %94
  store i32 2, ptr %3, align 4, !dbg !1701
  br label %136, !dbg !1701

101:                                              ; preds = %86
  %102 = load i32, ptr %6, align 4, !dbg !1702
  %103 = and i32 %102, 2, !dbg !1704
  %104 = icmp ne i32 %103, 0, !dbg !1702
  br i1 %104, label %105, label %106, !dbg !1702

105:                                              ; preds = %101
  store i32 7, ptr %3, align 4, !dbg !1705
  br label %136, !dbg !1705

106:                                              ; preds = %101
  %107 = load i32, ptr %7, align 4, !dbg !1706
  %108 = icmp eq i32 %107, 7, !dbg !1708
  br i1 %108, label %109, label %110, !dbg !1708

109:                                              ; preds = %106
  store i32 22, ptr %3, align 4, !dbg !1709
  br label %136, !dbg !1709

110:                                              ; preds = %106
  %111 = load ptr, ptr %4, align 8, !dbg !1710
  %112 = getelementptr inbounds nuw %struct.segment, ptr %111, i32 0, i32 0, !dbg !1711
  %113 = load i32, ptr %5, align 4, !dbg !1712
  %114 = sext i32 %113 to i64, !dbg !1710
  %115 = getelementptr inbounds [6 x %struct.side], ptr %112, i64 0, i64 %114, !dbg !1710
  %116 = getelementptr inbounds nuw %struct.side, ptr %115, i32 0, i32 2, !dbg !1713
  %117 = load i16, ptr %116, align 2, !dbg !1713
  %118 = sext i16 %117 to i64, !dbg !1714
  %119 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %118, !dbg !1714
  %120 = getelementptr inbounds nuw %struct.wall, ptr %119, i32 0, i32 6, !dbg !1715
  %121 = load i8, ptr %120, align 2, !dbg !1715
  %122 = zext i8 %121 to i32, !dbg !1714
  store i32 %122, ptr %8, align 4, !dbg !1716
  %123 = load i32, ptr %7, align 4, !dbg !1717
  %124 = icmp eq i32 %123, 2, !dbg !1719
  br i1 %124, label %125, label %129, !dbg !1720

125:                                              ; preds = %110
  %126 = load i32, ptr %8, align 4, !dbg !1721
  %127 = icmp eq i32 %126, 1, !dbg !1722
  br i1 %127, label %128, label %129, !dbg !1720

128:                                              ; preds = %125
  store i32 6, ptr %3, align 4, !dbg !1723
  br label %136, !dbg !1723

129:                                              ; preds = %125, %110
  %130 = load ptr, ptr %4, align 8, !dbg !1724
  %131 = load i32, ptr %5, align 4, !dbg !1726
  %132 = call noundef i32 @_Z18check_transparencyP7segmenti(ptr noundef %130, i32 noundef %131), !dbg !1727
  %133 = icmp ne i32 %132, 0, !dbg !1727
  br i1 %133, label %134, label %135, !dbg !1727

134:                                              ; preds = %129
  store i32 6, ptr %3, align 4, !dbg !1728
  br label %136, !dbg !1728

135:                                              ; preds = %129
  store i32 2, ptr %3, align 4, !dbg !1729
  br label %136, !dbg !1729

136:                                              ; preds = %135, %134, %128, %109, %105, %100, %99, %93, %85, %84, %78, %59
  %137 = load i32, ptr %3, align 4, !dbg !1730
  ret i32 %137, !dbg !1730
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #1 !dbg !1731 {
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !1734, !DIExpression(), !1735)
  store i32 %1, ptr %8, align 4
    #dbg_declare(ptr %8, !1736, !DIExpression(), !1737)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !1738, !DIExpression(), !1739)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !1740, !DIExpression(), !1741)
  store i32 %4, ptr %11, align 4
    #dbg_declare(ptr %11, !1742, !DIExpression(), !1743)
  store i32 %5, ptr %12, align 4
    #dbg_declare(ptr %12, !1744, !DIExpression(), !1745)
    #dbg_declare(ptr %13, !1746, !DIExpression(), !1748)
  %15 = load i32, ptr %11, align 4, !dbg !1749
  %16 = sext i32 %15 to i64, !dbg !1750
  %17 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %16, !dbg !1750
  store ptr %17, ptr %13, align 8, !dbg !1748
    #dbg_declare(ptr %14, !1751, !DIExpression(), !1752)
  %18 = load ptr, ptr %13, align 8, !dbg !1753
  %19 = getelementptr inbounds nuw %struct.wclip, ptr %18, i32 0, i32 2, !dbg !1754
  %20 = load i32, ptr %12, align 4, !dbg !1755
  %21 = sext i32 %20 to i64, !dbg !1753
  %22 = getelementptr inbounds [50 x i16], ptr %19, i64 0, i64 %21, !dbg !1753
  %23 = load i16, ptr %22, align 2, !dbg !1753
  %24 = sext i16 %23 to i32, !dbg !1753
  store i32 %24, ptr %14, align 4, !dbg !1752
  %25 = load i32, ptr @Newdemo_state, align 4, !dbg !1756
  %26 = icmp eq i32 %25, 2, !dbg !1758
  br i1 %26, label %27, label %28, !dbg !1758

27:                                               ; preds = %6
  br label %120, !dbg !1759

28:                                               ; preds = %6
  %29 = load ptr, ptr %13, align 8, !dbg !1760
  %30 = getelementptr inbounds nuw %struct.wclip, ptr %29, i32 0, i32 5, !dbg !1762
  %31 = load i16, ptr %30, align 2, !dbg !1762
  %32 = sext i16 %31 to i32, !dbg !1760
  %33 = and i32 %32, 4, !dbg !1763
  %34 = icmp ne i32 %33, 0, !dbg !1760
  br i1 %34, label %35, label %70, !dbg !1760

35:                                               ; preds = %28
  %36 = load i32, ptr %14, align 4, !dbg !1764
  %37 = trunc i32 %36 to i16, !dbg !1764
  %38 = load ptr, ptr %9, align 8, !dbg !1766
  %39 = getelementptr inbounds nuw %struct.segment, ptr %38, i32 0, i32 0, !dbg !1767
  %40 = load i32, ptr %10, align 4, !dbg !1768
  %41 = sext i32 %40 to i64, !dbg !1766
  %42 = getelementptr inbounds [6 x %struct.side], ptr %39, i64 0, i64 %41, !dbg !1766
  %43 = getelementptr inbounds nuw %struct.side, ptr %42, i32 0, i32 3, !dbg !1769
  store i16 %37, ptr %43, align 4, !dbg !1770
  %44 = load ptr, ptr %7, align 8, !dbg !1771
  %45 = getelementptr inbounds nuw %struct.segment, ptr %44, i32 0, i32 0, !dbg !1772
  %46 = load i32, ptr %8, align 4, !dbg !1773
  %47 = sext i32 %46 to i64, !dbg !1771
  %48 = getelementptr inbounds [6 x %struct.side], ptr %45, i64 0, i64 %47, !dbg !1771
  %49 = getelementptr inbounds nuw %struct.side, ptr %48, i32 0, i32 3, !dbg !1774
  store i16 %37, ptr %49, align 4, !dbg !1775
  %50 = load i32, ptr @Newdemo_state, align 4, !dbg !1776
  %51 = icmp eq i32 %50, 1, !dbg !1778
  br i1 %51, label %52, label %69, !dbg !1778

52:                                               ; preds = %35
  %53 = load ptr, ptr %7, align 8, !dbg !1779
  %54 = ptrtoint ptr %53 to i64, !dbg !1780
  %55 = sub i64 %54, ptrtoint (ptr @Segments to i64), !dbg !1780
  %56 = sdiv exact i64 %55, 512, !dbg !1780
  %57 = trunc i64 %56 to i16, !dbg !1779
  %58 = load i32, ptr %8, align 4, !dbg !1781
  %59 = trunc i32 %58 to i8, !dbg !1781
  %60 = load ptr, ptr %9, align 8, !dbg !1782
  %61 = ptrtoint ptr %60 to i64, !dbg !1783
  %62 = sub i64 %61, ptrtoint (ptr @Segments to i64), !dbg !1783
  %63 = sdiv exact i64 %62, 512, !dbg !1783
  %64 = trunc i64 %63 to i16, !dbg !1782
  %65 = load i32, ptr %10, align 4, !dbg !1784
  %66 = trunc i32 %65 to i8, !dbg !1784
  %67 = load i32, ptr %14, align 4, !dbg !1785
  %68 = trunc i32 %67 to i16, !dbg !1785
  call void @_Z33newdemo_record_wall_set_tmap_num1shshs(i16 noundef signext %57, i8 noundef zeroext %59, i16 noundef signext %64, i8 noundef zeroext %66, i16 noundef signext %68), !dbg !1786
  br label %69, !dbg !1786

69:                                               ; preds = %52, %35
  br label %120, !dbg !1787

70:                                               ; preds = %28
  %71 = load i32, ptr %14, align 4, !dbg !1788
  %72 = icmp ne i32 %71, 0, !dbg !1788
  br i1 %72, label %73, label %83, !dbg !1788

73:                                               ; preds = %70
  %74 = load ptr, ptr %7, align 8, !dbg !1788
  %75 = getelementptr inbounds nuw %struct.segment, ptr %74, i32 0, i32 0, !dbg !1788
  %76 = load i32, ptr %8, align 4, !dbg !1788
  %77 = sext i32 %76 to i64, !dbg !1788
  %78 = getelementptr inbounds [6 x %struct.side], ptr %75, i64 0, i64 %77, !dbg !1788
  %79 = getelementptr inbounds nuw %struct.side, ptr %78, i32 0, i32 4, !dbg !1788
  %80 = load i16, ptr %79, align 2, !dbg !1788
  %81 = sext i16 %80 to i32, !dbg !1788
  %82 = icmp ne i32 %81, 0, !dbg !1788
  br label %83

83:                                               ; preds = %73, %70
  %84 = phi i1 [ false, %70 ], [ %82, %73 ], !dbg !1790
  %85 = zext i1 %84 to i32, !dbg !1788
  call void @_Z7_AssertiPKcS0_i(i32 noundef %85, ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 257), !dbg !1788
  %86 = load i32, ptr %14, align 4, !dbg !1791
  %87 = trunc i32 %86 to i16, !dbg !1791
  %88 = load ptr, ptr %9, align 8, !dbg !1792
  %89 = getelementptr inbounds nuw %struct.segment, ptr %88, i32 0, i32 0, !dbg !1793
  %90 = load i32, ptr %10, align 4, !dbg !1794
  %91 = sext i32 %90 to i64, !dbg !1792
  %92 = getelementptr inbounds [6 x %struct.side], ptr %89, i64 0, i64 %91, !dbg !1792
  %93 = getelementptr inbounds nuw %struct.side, ptr %92, i32 0, i32 4, !dbg !1795
  store i16 %87, ptr %93, align 2, !dbg !1796
  %94 = load ptr, ptr %7, align 8, !dbg !1797
  %95 = getelementptr inbounds nuw %struct.segment, ptr %94, i32 0, i32 0, !dbg !1798
  %96 = load i32, ptr %8, align 4, !dbg !1799
  %97 = sext i32 %96 to i64, !dbg !1797
  %98 = getelementptr inbounds [6 x %struct.side], ptr %95, i64 0, i64 %97, !dbg !1797
  %99 = getelementptr inbounds nuw %struct.side, ptr %98, i32 0, i32 4, !dbg !1800
  store i16 %87, ptr %99, align 2, !dbg !1801
  %100 = load i32, ptr @Newdemo_state, align 4, !dbg !1802
  %101 = icmp eq i32 %100, 1, !dbg !1804
  br i1 %101, label %102, label %119, !dbg !1804

102:                                              ; preds = %83
  %103 = load ptr, ptr %7, align 8, !dbg !1805
  %104 = ptrtoint ptr %103 to i64, !dbg !1806
  %105 = sub i64 %104, ptrtoint (ptr @Segments to i64), !dbg !1806
  %106 = sdiv exact i64 %105, 512, !dbg !1806
  %107 = trunc i64 %106 to i16, !dbg !1805
  %108 = load i32, ptr %8, align 4, !dbg !1807
  %109 = trunc i32 %108 to i8, !dbg !1807
  %110 = load ptr, ptr %9, align 8, !dbg !1808
  %111 = ptrtoint ptr %110 to i64, !dbg !1809
  %112 = sub i64 %111, ptrtoint (ptr @Segments to i64), !dbg !1809
  %113 = sdiv exact i64 %112, 512, !dbg !1809
  %114 = trunc i64 %113 to i16, !dbg !1808
  %115 = load i32, ptr %10, align 4, !dbg !1810
  %116 = trunc i32 %115 to i8, !dbg !1810
  %117 = load i32, ptr %14, align 4, !dbg !1811
  %118 = trunc i32 %117 to i16, !dbg !1811
  call void @_Z33newdemo_record_wall_set_tmap_num2shshs(i16 noundef signext %107, i8 noundef zeroext %109, i16 noundef signext %114, i8 noundef zeroext %116, i16 noundef signext %118), !dbg !1812
  br label %119, !dbg !1812

119:                                              ; preds = %102, %83
  br label %120

120:                                              ; preds = %27, %119, %69
  ret void, !dbg !1813
}

declare void @_Z33newdemo_record_wall_set_tmap_num1shshs(i16 noundef signext, i8 noundef zeroext, i16 noundef signext, i8 noundef zeroext, i16 noundef signext) #2

declare void @_Z33newdemo_record_wall_set_tmap_num2shshs(i16 noundef signext, i8 noundef zeroext, i16 noundef signext, i8 noundef zeroext, i16 noundef signext) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20blast_blastable_wallP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !1814 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1817, !DIExpression(), !1818)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1819, !DIExpression(), !1820)
    #dbg_declare(ptr %5, !1821, !DIExpression(), !1822)
    #dbg_declare(ptr %6, !1823, !DIExpression(), !1824)
    #dbg_declare(ptr %7, !1825, !DIExpression(), !1826)
    #dbg_declare(ptr %8, !1827, !DIExpression(), !1828)
  %9 = load ptr, ptr %3, align 8, !dbg !1829
  %10 = getelementptr inbounds nuw %struct.segment, ptr %9, i32 0, i32 0, !dbg !1829
  %11 = load i32, ptr %4, align 4, !dbg !1829
  %12 = sext i32 %11 to i64, !dbg !1829
  %13 = getelementptr inbounds [6 x %struct.side], ptr %10, i64 0, i64 %12, !dbg !1829
  %14 = getelementptr inbounds nuw %struct.side, ptr %13, i32 0, i32 2, !dbg !1829
  %15 = load i16, ptr %14, align 2, !dbg !1829
  %16 = sext i16 %15 to i32, !dbg !1829
  %17 = icmp ne i32 %16, -1, !dbg !1829
  %18 = zext i1 %17 to i32, !dbg !1829
  call void @_Z7_AssertiPKcS0_i(i32 noundef %18, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 273), !dbg !1829
  %19 = load ptr, ptr %3, align 8, !dbg !1830
  %20 = getelementptr inbounds nuw %struct.segment, ptr %19, i32 0, i32 0, !dbg !1831
  %21 = load i32, ptr %4, align 4, !dbg !1832
  %22 = sext i32 %21 to i64, !dbg !1830
  %23 = getelementptr inbounds [6 x %struct.side], ptr %20, i64 0, i64 %22, !dbg !1830
  %24 = getelementptr inbounds nuw %struct.side, ptr %23, i32 0, i32 2, !dbg !1833
  %25 = load i16, ptr %24, align 2, !dbg !1833
  %26 = sext i16 %25 to i64, !dbg !1834
  %27 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %26, !dbg !1834
  %28 = getelementptr inbounds nuw %struct.wall, ptr %27, i32 0, i32 2, !dbg !1835
  store i32 -1, ptr %28, align 4, !dbg !1836
  %29 = load ptr, ptr %3, align 8, !dbg !1837
  %30 = getelementptr inbounds nuw %struct.segment, ptr %29, i32 0, i32 1, !dbg !1838
  %31 = load i32, ptr %4, align 4, !dbg !1839
  %32 = sext i32 %31 to i64, !dbg !1837
  %33 = getelementptr inbounds [6 x i16], ptr %30, i64 0, i64 %32, !dbg !1837
  %34 = load i16, ptr %33, align 2, !dbg !1837
  %35 = sext i16 %34 to i64, !dbg !1840
  %36 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %35, !dbg !1840
  store ptr %36, ptr %6, align 8, !dbg !1841
  %37 = load ptr, ptr %3, align 8, !dbg !1842
  %38 = load ptr, ptr %6, align 8, !dbg !1843
  %39 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %37, ptr noundef %38), !dbg !1844
  store i32 %39, ptr %5, align 4, !dbg !1845
  %40 = load i32, ptr %5, align 4, !dbg !1846
  %41 = icmp ne i32 %40, -1, !dbg !1846
  %42 = zext i1 %41 to i32, !dbg !1846
  call void @_Z7_AssertiPKcS0_i(i32 noundef %42, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 279), !dbg !1846
  %43 = load ptr, ptr %3, align 8, !dbg !1847
  %44 = getelementptr inbounds nuw %struct.segment, ptr %43, i32 0, i32 0, !dbg !1848
  %45 = load i32, ptr %4, align 4, !dbg !1849
  %46 = sext i32 %45 to i64, !dbg !1847
  %47 = getelementptr inbounds [6 x %struct.side], ptr %44, i64 0, i64 %46, !dbg !1847
  %48 = getelementptr inbounds nuw %struct.side, ptr %47, i32 0, i32 2, !dbg !1850
  %49 = load i16, ptr %48, align 2, !dbg !1850
  %50 = sext i16 %49 to i32, !dbg !1847
  call void @_Z18kill_stuck_objectsi(i32 noundef %50), !dbg !1851
  %51 = load ptr, ptr %6, align 8, !dbg !1852
  %52 = getelementptr inbounds nuw %struct.segment, ptr %51, i32 0, i32 0, !dbg !1853
  %53 = load i32, ptr %5, align 4, !dbg !1854
  %54 = sext i32 %53 to i64, !dbg !1852
  %55 = getelementptr inbounds [6 x %struct.side], ptr %52, i64 0, i64 %54, !dbg !1852
  %56 = getelementptr inbounds nuw %struct.side, ptr %55, i32 0, i32 2, !dbg !1855
  %57 = load i16, ptr %56, align 2, !dbg !1855
  %58 = sext i16 %57 to i32, !dbg !1852
  call void @_Z18kill_stuck_objectsi(i32 noundef %58), !dbg !1856
  %59 = load ptr, ptr %3, align 8, !dbg !1857
  %60 = getelementptr inbounds nuw %struct.segment, ptr %59, i32 0, i32 0, !dbg !1859
  %61 = load i32, ptr %4, align 4, !dbg !1860
  %62 = sext i32 %61 to i64, !dbg !1857
  %63 = getelementptr inbounds [6 x %struct.side], ptr %60, i64 0, i64 %62, !dbg !1857
  %64 = getelementptr inbounds nuw %struct.side, ptr %63, i32 0, i32 2, !dbg !1861
  %65 = load i16, ptr %64, align 2, !dbg !1861
  %66 = sext i16 %65 to i64, !dbg !1862
  %67 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %66, !dbg !1862
  %68 = getelementptr inbounds nuw %struct.wall, ptr %67, i32 0, i32 8, !dbg !1863
  %69 = load i8, ptr %68, align 4, !dbg !1863
  %70 = sext i8 %69 to i64, !dbg !1864
  %71 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %70, !dbg !1864
  %72 = getelementptr inbounds nuw %struct.wclip, ptr %71, i32 0, i32 5, !dbg !1865
  %73 = load i16, ptr %72, align 2, !dbg !1865
  %74 = sext i16 %73 to i32, !dbg !1864
  %75 = and i32 %74, 1, !dbg !1866
  %76 = icmp ne i32 %75, 0, !dbg !1864
  br i1 %76, label %77, label %84, !dbg !1864

77:                                               ; preds = %2
  %78 = load ptr, ptr %3, align 8, !dbg !1867
  %79 = ptrtoint ptr %78 to i64, !dbg !1868
  %80 = sub i64 %79, ptrtoint (ptr @Segments to i64), !dbg !1868
  %81 = sdiv exact i64 %80, 512, !dbg !1868
  %82 = trunc i64 %81 to i32, !dbg !1867
  %83 = load i32, ptr %4, align 4, !dbg !1869
  call void @_Z12explode_wallii(i32 noundef %82, i32 noundef %83), !dbg !1870
  br label %138, !dbg !1870

84:                                               ; preds = %2
  %85 = load ptr, ptr %3, align 8, !dbg !1871
  %86 = getelementptr inbounds nuw %struct.segment, ptr %85, i32 0, i32 0, !dbg !1873
  %87 = load i32, ptr %4, align 4, !dbg !1874
  %88 = sext i32 %87 to i64, !dbg !1871
  %89 = getelementptr inbounds [6 x %struct.side], ptr %86, i64 0, i64 %88, !dbg !1871
  %90 = getelementptr inbounds nuw %struct.side, ptr %89, i32 0, i32 2, !dbg !1875
  %91 = load i16, ptr %90, align 2, !dbg !1875
  %92 = sext i16 %91 to i64, !dbg !1876
  %93 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %92, !dbg !1876
  %94 = getelementptr inbounds nuw %struct.wall, ptr %93, i32 0, i32 8, !dbg !1877
  %95 = load i8, ptr %94, align 4, !dbg !1877
  %96 = sext i8 %95 to i32, !dbg !1876
  store i32 %96, ptr %7, align 4, !dbg !1878
  %97 = load i32, ptr %7, align 4, !dbg !1879
  %98 = sext i32 %97 to i64, !dbg !1880
  %99 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %98, !dbg !1880
  %100 = getelementptr inbounds nuw %struct.wclip, ptr %99, i32 0, i32 1, !dbg !1881
  %101 = load i16, ptr %100, align 4, !dbg !1881
  %102 = sext i16 %101 to i32, !dbg !1880
  store i32 %102, ptr %8, align 4, !dbg !1882
  %103 = load ptr, ptr %3, align 8, !dbg !1883
  %104 = load i32, ptr %4, align 4, !dbg !1884
  %105 = load ptr, ptr %6, align 8, !dbg !1885
  %106 = load i32, ptr %5, align 4, !dbg !1886
  %107 = load i32, ptr %7, align 4, !dbg !1887
  %108 = load i32, ptr %8, align 4, !dbg !1888
  %109 = sub nsw i32 %108, 1, !dbg !1889
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %103, i32 noundef %104, ptr noundef %105, i32 noundef %106, i32 noundef %107, i32 noundef %109), !dbg !1890
  %110 = load ptr, ptr %3, align 8, !dbg !1891
  %111 = getelementptr inbounds nuw %struct.segment, ptr %110, i32 0, i32 0, !dbg !1892
  %112 = load i32, ptr %4, align 4, !dbg !1893
  %113 = sext i32 %112 to i64, !dbg !1891
  %114 = getelementptr inbounds [6 x %struct.side], ptr %111, i64 0, i64 %113, !dbg !1891
  %115 = getelementptr inbounds nuw %struct.side, ptr %114, i32 0, i32 2, !dbg !1894
  %116 = load i16, ptr %115, align 2, !dbg !1894
  %117 = sext i16 %116 to i64, !dbg !1895
  %118 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %117, !dbg !1895
  %119 = getelementptr inbounds nuw %struct.wall, ptr %118, i32 0, i32 5, !dbg !1896
  %120 = load i8, ptr %119, align 1, !dbg !1897
  %121 = zext i8 %120 to i32, !dbg !1897
  %122 = or i32 %121, 1, !dbg !1897
  %123 = trunc i32 %122 to i8, !dbg !1897
  store i8 %123, ptr %119, align 1, !dbg !1897
  %124 = load ptr, ptr %6, align 8, !dbg !1898
  %125 = getelementptr inbounds nuw %struct.segment, ptr %124, i32 0, i32 0, !dbg !1899
  %126 = load i32, ptr %5, align 4, !dbg !1900
  %127 = sext i32 %126 to i64, !dbg !1898
  %128 = getelementptr inbounds [6 x %struct.side], ptr %125, i64 0, i64 %127, !dbg !1898
  %129 = getelementptr inbounds nuw %struct.side, ptr %128, i32 0, i32 2, !dbg !1901
  %130 = load i16, ptr %129, align 2, !dbg !1901
  %131 = sext i16 %130 to i64, !dbg !1902
  %132 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %131, !dbg !1902
  %133 = getelementptr inbounds nuw %struct.wall, ptr %132, i32 0, i32 5, !dbg !1903
  %134 = load i8, ptr %133, align 1, !dbg !1904
  %135 = zext i8 %134 to i32, !dbg !1904
  %136 = or i32 %135, 1, !dbg !1904
  %137 = trunc i32 %136 to i8, !dbg !1904
  store i8 %137, ptr %133, align 1, !dbg !1904
  br label %138

138:                                              ; preds = %84, %77
  ret void, !dbg !1905
}

declare noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18kill_stuck_objectsi(i32 noundef %0) #1 !dbg !1906 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !1907, !DIExpression(), !1908)
    #dbg_declare(ptr %3, !1909, !DIExpression(), !1910)
  %4 = load i32, ptr @Num_stuck_objects, align 4, !dbg !1911
  %5 = icmp eq i32 %4, 0, !dbg !1913
  br i1 %5, label %6, label %7, !dbg !1913

6:                                                ; preds = %1
  br label %74, !dbg !1914

7:                                                ; preds = %1
  store i32 0, ptr @Num_stuck_objects, align 4, !dbg !1916
  store i32 0, ptr %3, align 4, !dbg !1917
  br label %8, !dbg !1919

8:                                                ; preds = %70, %7
  %9 = load i32, ptr %3, align 4, !dbg !1920
  %10 = icmp slt i32 %9, 32, !dbg !1922
  br i1 %10, label %11, label %73, !dbg !1923

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4, !dbg !1924
  %13 = sext i32 %12 to i64, !dbg !1926
  %14 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %13, !dbg !1926
  %15 = getelementptr inbounds nuw %struct.stuckobj, ptr %14, i32 0, i32 1, !dbg !1927
  %16 = load i16, ptr %15, align 2, !dbg !1927
  %17 = sext i16 %16 to i32, !dbg !1926
  %18 = load i32, ptr %2, align 4, !dbg !1928
  %19 = icmp eq i32 %17, %18, !dbg !1929
  br i1 %19, label %20, label %57, !dbg !1929

20:                                               ; preds = %11
  %21 = load i32, ptr %3, align 4, !dbg !1930
  %22 = sext i32 %21 to i64, !dbg !1933
  %23 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %22, !dbg !1933
  %24 = getelementptr inbounds nuw %struct.stuckobj, ptr %23, i32 0, i32 0, !dbg !1934
  %25 = load i16, ptr %24, align 4, !dbg !1934
  %26 = sext i16 %25 to i64, !dbg !1935
  %27 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %26, !dbg !1935
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 1, !dbg !1936
  %29 = load i8, ptr %28, align 4, !dbg !1936
  %30 = zext i8 %29 to i32, !dbg !1935
  %31 = icmp eq i32 %30, 5, !dbg !1937
  br i1 %31, label %32, label %41, !dbg !1937

32:                                               ; preds = %20
  %33 = load i32, ptr %3, align 4, !dbg !1938
  %34 = sext i32 %33 to i64, !dbg !1940
  %35 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %34, !dbg !1940
  %36 = getelementptr inbounds nuw %struct.stuckobj, ptr %35, i32 0, i32 0, !dbg !1941
  %37 = load i16, ptr %36, align 4, !dbg !1941
  %38 = sext i16 %37 to i64, !dbg !1942
  %39 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %38, !dbg !1942
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 20, !dbg !1943
  store i32 8192, ptr %40, align 4, !dbg !1944
  br label %52, !dbg !1945

41:                                               ; preds = %20
  %42 = load i32, ptr %3, align 4, !dbg !1946
  %43 = sext i32 %42 to i64, !dbg !1946
  %44 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %43, !dbg !1946
  %45 = getelementptr inbounds nuw %struct.stuckobj, ptr %44, i32 0, i32 0, !dbg !1946
  %46 = load i16, ptr %45, align 4, !dbg !1946
  %47 = sext i16 %46 to i64, !dbg !1946
  %48 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %47, !dbg !1946
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 1, !dbg !1946
  %50 = load i8, ptr %49, align 4, !dbg !1946
  %51 = zext i8 %50 to i32, !dbg !1946
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.31, i32 noundef %51, i32 noundef 5), !dbg !1946
  br label %52

52:                                               ; preds = %41, %32
  %53 = load i32, ptr %3, align 4, !dbg !1947
  %54 = sext i32 %53 to i64, !dbg !1948
  %55 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %54, !dbg !1948
  %56 = getelementptr inbounds nuw %struct.stuckobj, ptr %55, i32 0, i32 1, !dbg !1949
  store i16 -1, ptr %56, align 2, !dbg !1950
  br label %69, !dbg !1951

57:                                               ; preds = %11
  %58 = load i32, ptr %3, align 4, !dbg !1952
  %59 = sext i32 %58 to i64, !dbg !1954
  %60 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %59, !dbg !1954
  %61 = getelementptr inbounds nuw %struct.stuckobj, ptr %60, i32 0, i32 1, !dbg !1955
  %62 = load i16, ptr %61, align 2, !dbg !1955
  %63 = sext i16 %62 to i32, !dbg !1954
  %64 = icmp ne i32 %63, -1, !dbg !1956
  br i1 %64, label %65, label %68, !dbg !1956

65:                                               ; preds = %57
  %66 = load i32, ptr @Num_stuck_objects, align 4, !dbg !1957
  %67 = add nsw i32 %66, 1, !dbg !1957
  store i32 %67, ptr @Num_stuck_objects, align 4, !dbg !1957
  br label %68, !dbg !1959

68:                                               ; preds = %65, %57
  br label %69

69:                                               ; preds = %68, %52
  br label %70, !dbg !1928

70:                                               ; preds = %69
  %71 = load i32, ptr %3, align 4, !dbg !1960
  %72 = add nsw i32 %71, 1, !dbg !1960
  store i32 %72, ptr %3, align 4, !dbg !1960
  br label %8, !dbg !1961, !llvm.loop !1962

73:                                               ; preds = %8
  call void @_Z15flush_fcd_cachev(), !dbg !1965
  br label %74, !dbg !1966

74:                                               ; preds = %73, %6
  ret void, !dbg !1966
}

declare void @_Z12explode_wallii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12wall_destroyP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !1967 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1968, !DIExpression(), !1969)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1970, !DIExpression(), !1971)
  %5 = load ptr, ptr %3, align 8, !dbg !1972
  %6 = getelementptr inbounds nuw %struct.segment, ptr %5, i32 0, i32 0, !dbg !1972
  %7 = load i32, ptr %4, align 4, !dbg !1972
  %8 = sext i32 %7 to i64, !dbg !1972
  %9 = getelementptr inbounds [6 x %struct.side], ptr %6, i64 0, i64 %8, !dbg !1972
  %10 = getelementptr inbounds nuw %struct.side, ptr %9, i32 0, i32 2, !dbg !1972
  %11 = load i16, ptr %10, align 2, !dbg !1972
  %12 = sext i16 %11 to i32, !dbg !1972
  %13 = icmp ne i32 %12, -1, !dbg !1972
  %14 = zext i1 %13 to i32, !dbg !1972
  call void @_Z7_AssertiPKcS0_i(i32 noundef %14, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 303), !dbg !1972
  %15 = load ptr, ptr %3, align 8, !dbg !1973
  %16 = ptrtoint ptr %15 to i64, !dbg !1973
  %17 = sub i64 %16, ptrtoint (ptr @Segments to i64), !dbg !1973
  %18 = sdiv exact i64 %17, 512, !dbg !1973
  %19 = icmp ne i64 %18, 0, !dbg !1973
  %20 = zext i1 %19 to i32, !dbg !1973
  call void @_Z7_AssertiPKcS0_i(i32 noundef %20, ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 304), !dbg !1973
  %21 = load ptr, ptr %3, align 8, !dbg !1974
  %22 = getelementptr inbounds nuw %struct.segment, ptr %21, i32 0, i32 0, !dbg !1976
  %23 = load i32, ptr %4, align 4, !dbg !1977
  %24 = sext i32 %23 to i64, !dbg !1974
  %25 = getelementptr inbounds [6 x %struct.side], ptr %22, i64 0, i64 %24, !dbg !1974
  %26 = getelementptr inbounds nuw %struct.side, ptr %25, i32 0, i32 2, !dbg !1978
  %27 = load i16, ptr %26, align 2, !dbg !1978
  %28 = sext i16 %27 to i64, !dbg !1979
  %29 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %28, !dbg !1979
  %30 = getelementptr inbounds nuw %struct.wall, ptr %29, i32 0, i32 4, !dbg !1980
  %31 = load i8, ptr %30, align 4, !dbg !1980
  %32 = zext i8 %31 to i32, !dbg !1979
  %33 = icmp eq i32 %32, 1, !dbg !1981
  br i1 %33, label %34, label %37, !dbg !1981

34:                                               ; preds = %2
  %35 = load ptr, ptr %3, align 8, !dbg !1982
  %36 = load i32, ptr %4, align 4, !dbg !1983
  call void @_Z20blast_blastable_wallP7segmenti(ptr noundef %35, i32 noundef %36), !dbg !1984
  br label %38, !dbg !1984

37:                                               ; preds = %2
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.7), !dbg !1985
  br label %38

38:                                               ; preds = %37, %34
  ret void, !dbg !1986
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11wall_damageP7segmentii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #1 !dbg !1987 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1990, !DIExpression(), !1991)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1992, !DIExpression(), !1993)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !1994, !DIExpression(), !1995)
    #dbg_declare(ptr %7, !1996, !DIExpression(), !1997)
    #dbg_declare(ptr %8, !1998, !DIExpression(), !1999)
    #dbg_declare(ptr %9, !2000, !DIExpression(), !2001)
  %12 = load ptr, ptr %4, align 8, !dbg !2002
  %13 = getelementptr inbounds nuw %struct.segment, ptr %12, i32 0, i32 0, !dbg !2004
  %14 = load i32, ptr %5, align 4, !dbg !2005
  %15 = sext i32 %14 to i64, !dbg !2002
  %16 = getelementptr inbounds [6 x %struct.side], ptr %13, i64 0, i64 %15, !dbg !2002
  %17 = getelementptr inbounds nuw %struct.side, ptr %16, i32 0, i32 2, !dbg !2006
  %18 = load i16, ptr %17, align 2, !dbg !2006
  %19 = sext i16 %18 to i32, !dbg !2002
  %20 = icmp eq i32 %19, -1, !dbg !2007
  br i1 %20, label %21, label %22, !dbg !2007

21:                                               ; preds = %3
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.8), !dbg !2008
  br label %178, !dbg !2010

22:                                               ; preds = %3
  %23 = load ptr, ptr %4, align 8, !dbg !2011
  %24 = getelementptr inbounds nuw %struct.segment, ptr %23, i32 0, i32 0, !dbg !2013
  %25 = load i32, ptr %5, align 4, !dbg !2014
  %26 = sext i32 %25 to i64, !dbg !2011
  %27 = getelementptr inbounds [6 x %struct.side], ptr %24, i64 0, i64 %26, !dbg !2011
  %28 = getelementptr inbounds nuw %struct.side, ptr %27, i32 0, i32 2, !dbg !2015
  %29 = load i16, ptr %28, align 2, !dbg !2015
  %30 = sext i16 %29 to i64, !dbg !2016
  %31 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %30, !dbg !2016
  %32 = getelementptr inbounds nuw %struct.wall, ptr %31, i32 0, i32 4, !dbg !2017
  %33 = load i8, ptr %32, align 4, !dbg !2017
  %34 = zext i8 %33 to i32, !dbg !2016
  %35 = icmp ne i32 %34, 1, !dbg !2018
  br i1 %35, label %36, label %37, !dbg !2018

36:                                               ; preds = %22
  br label %178, !dbg !2019

37:                                               ; preds = %22
  %38 = load ptr, ptr %4, align 8, !dbg !2020
  %39 = getelementptr inbounds nuw %struct.segment, ptr %38, i32 0, i32 0, !dbg !2022
  %40 = load i32, ptr %5, align 4, !dbg !2023
  %41 = sext i32 %40 to i64, !dbg !2020
  %42 = getelementptr inbounds [6 x %struct.side], ptr %39, i64 0, i64 %41, !dbg !2020
  %43 = getelementptr inbounds nuw %struct.side, ptr %42, i32 0, i32 2, !dbg !2024
  %44 = load i16, ptr %43, align 2, !dbg !2024
  %45 = sext i16 %44 to i64, !dbg !2025
  %46 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %45, !dbg !2025
  %47 = getelementptr inbounds nuw %struct.wall, ptr %46, i32 0, i32 5, !dbg !2026
  %48 = load i8, ptr %47, align 1, !dbg !2026
  %49 = zext i8 %48 to i32, !dbg !2025
  %50 = and i32 %49, 1, !dbg !2027
  %51 = icmp ne i32 %50, 0, !dbg !2028
  br i1 %51, label %178, label %52, !dbg !2029

52:                                               ; preds = %37
  %53 = load ptr, ptr %4, align 8, !dbg !2030
  %54 = getelementptr inbounds nuw %struct.segment, ptr %53, i32 0, i32 0, !dbg !2031
  %55 = load i32, ptr %5, align 4, !dbg !2032
  %56 = sext i32 %55 to i64, !dbg !2030
  %57 = getelementptr inbounds [6 x %struct.side], ptr %54, i64 0, i64 %56, !dbg !2030
  %58 = getelementptr inbounds nuw %struct.side, ptr %57, i32 0, i32 2, !dbg !2033
  %59 = load i16, ptr %58, align 2, !dbg !2033
  %60 = sext i16 %59 to i64, !dbg !2034
  %61 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %60, !dbg !2034
  %62 = getelementptr inbounds nuw %struct.wall, ptr %61, i32 0, i32 2, !dbg !2035
  %63 = load i32, ptr %62, align 4, !dbg !2035
  %64 = icmp sge i32 %63, 0, !dbg !2036
  br i1 %64, label %65, label %178, !dbg !2029

65:                                               ; preds = %52
    #dbg_declare(ptr %10, !2037, !DIExpression(), !2039)
    #dbg_declare(ptr %11, !2040, !DIExpression(), !2041)
  %66 = load ptr, ptr %4, align 8, !dbg !2042
  %67 = getelementptr inbounds nuw %struct.segment, ptr %66, i32 0, i32 1, !dbg !2043
  %68 = load i32, ptr %5, align 4, !dbg !2044
  %69 = sext i32 %68 to i64, !dbg !2042
  %70 = getelementptr inbounds [6 x i16], ptr %67, i64 0, i64 %69, !dbg !2042
  %71 = load i16, ptr %70, align 2, !dbg !2042
  %72 = sext i16 %71 to i64, !dbg !2045
  %73 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %72, !dbg !2045
  store ptr %73, ptr %11, align 8, !dbg !2046
  %74 = load ptr, ptr %4, align 8, !dbg !2047
  %75 = load ptr, ptr %11, align 8, !dbg !2048
  %76 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %74, ptr noundef %75), !dbg !2049
  store i32 %76, ptr %10, align 4, !dbg !2050
  %77 = load i32, ptr %10, align 4, !dbg !2051
  %78 = icmp ne i32 %77, -1, !dbg !2051
  %79 = zext i1 %78 to i32, !dbg !2051
  call void @_Z7_AssertiPKcS0_i(i32 noundef %79, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 333), !dbg !2051
  %80 = load i32, ptr %6, align 4, !dbg !2052
  %81 = load ptr, ptr %4, align 8, !dbg !2053
  %82 = getelementptr inbounds nuw %struct.segment, ptr %81, i32 0, i32 0, !dbg !2054
  %83 = load i32, ptr %5, align 4, !dbg !2055
  %84 = sext i32 %83 to i64, !dbg !2053
  %85 = getelementptr inbounds [6 x %struct.side], ptr %82, i64 0, i64 %84, !dbg !2053
  %86 = getelementptr inbounds nuw %struct.side, ptr %85, i32 0, i32 2, !dbg !2056
  %87 = load i16, ptr %86, align 2, !dbg !2056
  %88 = sext i16 %87 to i64, !dbg !2057
  %89 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %88, !dbg !2057
  %90 = getelementptr inbounds nuw %struct.wall, ptr %89, i32 0, i32 2, !dbg !2058
  %91 = load i32, ptr %90, align 4, !dbg !2059
  %92 = sub nsw i32 %91, %80, !dbg !2059
  store i32 %92, ptr %90, align 4, !dbg !2059
  %93 = load i32, ptr %6, align 4, !dbg !2060
  %94 = load ptr, ptr %11, align 8, !dbg !2061
  %95 = getelementptr inbounds nuw %struct.segment, ptr %94, i32 0, i32 0, !dbg !2062
  %96 = load i32, ptr %10, align 4, !dbg !2063
  %97 = sext i32 %96 to i64, !dbg !2061
  %98 = getelementptr inbounds [6 x %struct.side], ptr %95, i64 0, i64 %97, !dbg !2061
  %99 = getelementptr inbounds nuw %struct.side, ptr %98, i32 0, i32 2, !dbg !2064
  %100 = load i16, ptr %99, align 2, !dbg !2064
  %101 = sext i16 %100 to i64, !dbg !2065
  %102 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %101, !dbg !2065
  %103 = getelementptr inbounds nuw %struct.wall, ptr %102, i32 0, i32 2, !dbg !2066
  %104 = load i32, ptr %103, align 4, !dbg !2067
  %105 = sub nsw i32 %104, %93, !dbg !2067
  store i32 %105, ptr %103, align 4, !dbg !2067
  %106 = load ptr, ptr %4, align 8, !dbg !2068
  %107 = getelementptr inbounds nuw %struct.segment, ptr %106, i32 0, i32 0, !dbg !2069
  %108 = load i32, ptr %5, align 4, !dbg !2070
  %109 = sext i32 %108 to i64, !dbg !2068
  %110 = getelementptr inbounds [6 x %struct.side], ptr %107, i64 0, i64 %109, !dbg !2068
  %111 = getelementptr inbounds nuw %struct.side, ptr %110, i32 0, i32 2, !dbg !2071
  %112 = load i16, ptr %111, align 2, !dbg !2071
  %113 = sext i16 %112 to i64, !dbg !2072
  %114 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %113, !dbg !2072
  %115 = getelementptr inbounds nuw %struct.wall, ptr %114, i32 0, i32 8, !dbg !2073
  %116 = load i8, ptr %115, align 4, !dbg !2073
  %117 = sext i8 %116 to i32, !dbg !2072
  store i32 %117, ptr %7, align 4, !dbg !2074
  %118 = load i32, ptr %7, align 4, !dbg !2075
  %119 = sext i32 %118 to i64, !dbg !2076
  %120 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %119, !dbg !2076
  %121 = getelementptr inbounds nuw %struct.wclip, ptr %120, i32 0, i32 1, !dbg !2077
  %122 = load i16, ptr %121, align 4, !dbg !2077
  %123 = sext i16 %122 to i32, !dbg !2076
  store i32 %123, ptr %9, align 4, !dbg !2078
  %124 = load ptr, ptr %4, align 8, !dbg !2079
  %125 = getelementptr inbounds nuw %struct.segment, ptr %124, i32 0, i32 0, !dbg !2081
  %126 = load i32, ptr %5, align 4, !dbg !2082
  %127 = sext i32 %126 to i64, !dbg !2079
  %128 = getelementptr inbounds [6 x %struct.side], ptr %125, i64 0, i64 %127, !dbg !2079
  %129 = getelementptr inbounds nuw %struct.side, ptr %128, i32 0, i32 2, !dbg !2083
  %130 = load i16, ptr %129, align 2, !dbg !2083
  %131 = sext i16 %130 to i64, !dbg !2084
  %132 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %131, !dbg !2084
  %133 = getelementptr inbounds nuw %struct.wall, ptr %132, i32 0, i32 2, !dbg !2085
  %134 = load i32, ptr %133, align 4, !dbg !2085
  %135 = load i32, ptr %9, align 4, !dbg !2086
  %136 = sdiv i32 6553600, %135, !dbg !2087
  %137 = icmp slt i32 %134, %136, !dbg !2088
  br i1 %137, label %138, label %141, !dbg !2088

138:                                              ; preds = %65
  %139 = load ptr, ptr %4, align 8, !dbg !2089
  %140 = load i32, ptr %5, align 4, !dbg !2091
  call void @_Z20blast_blastable_wallP7segmenti(ptr noundef %139, i32 noundef %140), !dbg !2092
  br label %177, !dbg !2093

141:                                              ; preds = %65
  store i32 0, ptr %8, align 4, !dbg !2094
  br label %142, !dbg !2096

142:                                              ; preds = %173, %141
  %143 = load i32, ptr %8, align 4, !dbg !2097
  %144 = load i32, ptr %9, align 4, !dbg !2099
  %145 = icmp slt i32 %143, %144, !dbg !2100
  br i1 %145, label %146, label %176, !dbg !2101

146:                                              ; preds = %142
  %147 = load ptr, ptr %4, align 8, !dbg !2102
  %148 = getelementptr inbounds nuw %struct.segment, ptr %147, i32 0, i32 0, !dbg !2104
  %149 = load i32, ptr %5, align 4, !dbg !2105
  %150 = sext i32 %149 to i64, !dbg !2102
  %151 = getelementptr inbounds [6 x %struct.side], ptr %148, i64 0, i64 %150, !dbg !2102
  %152 = getelementptr inbounds nuw %struct.side, ptr %151, i32 0, i32 2, !dbg !2106
  %153 = load i16, ptr %152, align 2, !dbg !2106
  %154 = sext i16 %153 to i64, !dbg !2107
  %155 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %154, !dbg !2107
  %156 = getelementptr inbounds nuw %struct.wall, ptr %155, i32 0, i32 2, !dbg !2108
  %157 = load i32, ptr %156, align 4, !dbg !2108
  %158 = load i32, ptr %9, align 4, !dbg !2109
  %159 = load i32, ptr %8, align 4, !dbg !2110
  %160 = sub nsw i32 %158, %159, !dbg !2111
  %161 = mul nsw i32 6553600, %160, !dbg !2112
  %162 = load i32, ptr %9, align 4, !dbg !2113
  %163 = sdiv i32 %161, %162, !dbg !2114
  %164 = icmp slt i32 %157, %163, !dbg !2115
  br i1 %164, label %165, label %172, !dbg !2115

165:                                              ; preds = %146
  %166 = load ptr, ptr %4, align 8, !dbg !2116
  %167 = load i32, ptr %5, align 4, !dbg !2118
  %168 = load ptr, ptr %11, align 8, !dbg !2119
  %169 = load i32, ptr %10, align 4, !dbg !2120
  %170 = load i32, ptr %7, align 4, !dbg !2121
  %171 = load i32, ptr %8, align 4, !dbg !2122
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %166, i32 noundef %167, ptr noundef %168, i32 noundef %169, i32 noundef %170, i32 noundef %171), !dbg !2123
  br label %172, !dbg !2124

172:                                              ; preds = %165, %146
  br label %173, !dbg !2113

173:                                              ; preds = %172
  %174 = load i32, ptr %8, align 4, !dbg !2125
  %175 = add nsw i32 %174, 1, !dbg !2125
  store i32 %175, ptr %8, align 4, !dbg !2125
  br label %142, !dbg !2126, !llvm.loop !2127

176:                                              ; preds = %142
  br label %177

177:                                              ; preds = %176, %138
  br label %178, !dbg !2129

178:                                              ; preds = %21, %36, %177, %52, %37
  ret void, !dbg !2130
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14wall_open_doorP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !2131 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2132, !DIExpression(), !2133)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2134, !DIExpression(), !2135)
    #dbg_declare(ptr %5, !2136, !DIExpression(), !2138)
    #dbg_declare(ptr %6, !2139, !DIExpression(), !2141)
    #dbg_declare(ptr %7, !2142, !DIExpression(), !2143)
    #dbg_declare(ptr %8, !2144, !DIExpression(), !2145)
  %13 = load ptr, ptr %3, align 8, !dbg !2146
  %14 = getelementptr inbounds nuw %struct.segment, ptr %13, i32 0, i32 0, !dbg !2146
  %15 = load i32, ptr %4, align 4, !dbg !2146
  %16 = sext i32 %15 to i64, !dbg !2146
  %17 = getelementptr inbounds [6 x %struct.side], ptr %14, i64 0, i64 %16, !dbg !2146
  %18 = getelementptr inbounds nuw %struct.side, ptr %17, i32 0, i32 2, !dbg !2146
  %19 = load i16, ptr %18, align 2, !dbg !2146
  %20 = sext i16 %19 to i32, !dbg !2146
  %21 = icmp ne i32 %20, -1, !dbg !2146
  %22 = zext i1 %21 to i32, !dbg !2146
  call void @_Z7_AssertiPKcS0_i(i32 noundef %22, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 366), !dbg !2146
  %23 = load ptr, ptr %3, align 8, !dbg !2147
  %24 = getelementptr inbounds nuw %struct.segment, ptr %23, i32 0, i32 0, !dbg !2148
  %25 = load i32, ptr %4, align 4, !dbg !2149
  %26 = sext i32 %25 to i64, !dbg !2147
  %27 = getelementptr inbounds [6 x %struct.side], ptr %24, i64 0, i64 %26, !dbg !2147
  %28 = getelementptr inbounds nuw %struct.side, ptr %27, i32 0, i32 2, !dbg !2150
  %29 = load i16, ptr %28, align 2, !dbg !2150
  %30 = sext i16 %29 to i64, !dbg !2151
  %31 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %30, !dbg !2151
  store ptr %31, ptr %5, align 8, !dbg !2152
  %32 = load ptr, ptr %5, align 8, !dbg !2153
  %33 = getelementptr inbounds nuw %struct.wall, ptr %32, i32 0, i32 6, !dbg !2155
  %34 = load i8, ptr %33, align 2, !dbg !2155
  %35 = zext i8 %34 to i32, !dbg !2153
  %36 = icmp eq i32 %35, 1, !dbg !2156
  br i1 %36, label %49, label %37, !dbg !2157

37:                                               ; preds = %2
  %38 = load ptr, ptr %5, align 8, !dbg !2158
  %39 = getelementptr inbounds nuw %struct.wall, ptr %38, i32 0, i32 6, !dbg !2159
  %40 = load i8, ptr %39, align 2, !dbg !2159
  %41 = zext i8 %40 to i32, !dbg !2158
  %42 = icmp eq i32 %41, 2, !dbg !2160
  br i1 %42, label %49, label %43, !dbg !2161

43:                                               ; preds = %37
  %44 = load ptr, ptr %5, align 8, !dbg !2162
  %45 = getelementptr inbounds nuw %struct.wall, ptr %44, i32 0, i32 6, !dbg !2163
  %46 = load i8, ptr %45, align 2, !dbg !2163
  %47 = zext i8 %46 to i32, !dbg !2162
  %48 = icmp eq i32 %47, 4, !dbg !2164
  br i1 %48, label %49, label %50, !dbg !2161

49:                                               ; preds = %43, %37, %2
  br label %349, !dbg !2165

50:                                               ; preds = %43
  %51 = load ptr, ptr %5, align 8, !dbg !2166
  %52 = getelementptr inbounds nuw %struct.wall, ptr %51, i32 0, i32 6, !dbg !2168
  %53 = load i8, ptr %52, align 2, !dbg !2168
  %54 = zext i8 %53 to i32, !dbg !2166
  %55 = icmp eq i32 %54, 3, !dbg !2169
  br i1 %55, label %56, label %157, !dbg !2169

56:                                               ; preds = %50
    #dbg_declare(ptr %9, !2170, !DIExpression(), !2172)
  store ptr null, ptr %6, align 8, !dbg !2173
  store i32 0, ptr %9, align 4, !dbg !2174
  br label %57, !dbg !2176

57:                                               ; preds = %115, %56
  %58 = load i32, ptr %9, align 4, !dbg !2177
  %59 = load i32, ptr @Num_open_doors, align 4, !dbg !2179
  %60 = icmp slt i32 %58, %59, !dbg !2180
  br i1 %60, label %61, label %118, !dbg !2181

61:                                               ; preds = %57
  %62 = load i32, ptr %9, align 4, !dbg !2182
  %63 = sext i32 %62 to i64, !dbg !2184
  %64 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %63, !dbg !2184
  store ptr %64, ptr %6, align 8, !dbg !2185
  %65 = load ptr, ptr %6, align 8, !dbg !2186
  %66 = getelementptr inbounds nuw %struct.active_door, ptr %65, i32 0, i32 1, !dbg !2188
  %67 = getelementptr inbounds [2 x i16], ptr %66, i64 0, i64 0, !dbg !2186
  %68 = load i16, ptr %67, align 4, !dbg !2186
  %69 = sext i16 %68 to i64, !dbg !2186
  %70 = load ptr, ptr %5, align 8, !dbg !2189
  %71 = ptrtoint ptr %70 to i64, !dbg !2190
  %72 = sub i64 %71, ptrtoint (ptr @Walls to i64), !dbg !2190
  %73 = sdiv exact i64 %72, 24, !dbg !2190
  %74 = icmp eq i64 %69, %73, !dbg !2191
  br i1 %74, label %113, label %75, !dbg !2192

75:                                               ; preds = %61
  %76 = load ptr, ptr %6, align 8, !dbg !2193
  %77 = getelementptr inbounds nuw %struct.active_door, ptr %76, i32 0, i32 2, !dbg !2194
  %78 = getelementptr inbounds [2 x i16], ptr %77, i64 0, i64 0, !dbg !2193
  %79 = load i16, ptr %78, align 4, !dbg !2193
  %80 = sext i16 %79 to i64, !dbg !2193
  %81 = load ptr, ptr %5, align 8, !dbg !2195
  %82 = ptrtoint ptr %81 to i64, !dbg !2196
  %83 = sub i64 %82, ptrtoint (ptr @Walls to i64), !dbg !2196
  %84 = sdiv exact i64 %83, 24, !dbg !2196
  %85 = icmp eq i64 %80, %84, !dbg !2197
  br i1 %85, label %113, label %86, !dbg !2198

86:                                               ; preds = %75
  %87 = load ptr, ptr %6, align 8, !dbg !2199
  %88 = getelementptr inbounds nuw %struct.active_door, ptr %87, i32 0, i32 0, !dbg !2200
  %89 = load i32, ptr %88, align 4, !dbg !2200
  %90 = icmp eq i32 %89, 2, !dbg !2201
  br i1 %90, label %91, label %114, !dbg !2202

91:                                               ; preds = %86
  %92 = load ptr, ptr %6, align 8, !dbg !2203
  %93 = getelementptr inbounds nuw %struct.active_door, ptr %92, i32 0, i32 1, !dbg !2204
  %94 = getelementptr inbounds [2 x i16], ptr %93, i64 0, i64 1, !dbg !2203
  %95 = load i16, ptr %94, align 2, !dbg !2203
  %96 = sext i16 %95 to i64, !dbg !2203
  %97 = load ptr, ptr %5, align 8, !dbg !2205
  %98 = ptrtoint ptr %97 to i64, !dbg !2206
  %99 = sub i64 %98, ptrtoint (ptr @Walls to i64), !dbg !2206
  %100 = sdiv exact i64 %99, 24, !dbg !2206
  %101 = icmp eq i64 %96, %100, !dbg !2207
  br i1 %101, label %113, label %102, !dbg !2208

102:                                              ; preds = %91
  %103 = load ptr, ptr %6, align 8, !dbg !2209
  %104 = getelementptr inbounds nuw %struct.active_door, ptr %103, i32 0, i32 2, !dbg !2210
  %105 = getelementptr inbounds [2 x i16], ptr %104, i64 0, i64 1, !dbg !2209
  %106 = load i16, ptr %105, align 2, !dbg !2209
  %107 = sext i16 %106 to i64, !dbg !2209
  %108 = load ptr, ptr %5, align 8, !dbg !2211
  %109 = ptrtoint ptr %108 to i64, !dbg !2212
  %110 = sub i64 %109, ptrtoint (ptr @Walls to i64), !dbg !2212
  %111 = sdiv exact i64 %110, 24, !dbg !2212
  %112 = icmp eq i64 %107, %111, !dbg !2213
  br i1 %112, label %113, label %114, !dbg !2198

113:                                              ; preds = %102, %91, %75, %61
  br label %119, !dbg !2214

114:                                              ; preds = %102, %86
  br label %115, !dbg !2215

115:                                              ; preds = %114
  %116 = load i32, ptr %9, align 4, !dbg !2216
  %117 = add nsw i32 %116, 1, !dbg !2216
  store i32 %117, ptr %9, align 4, !dbg !2216
  br label %57, !dbg !2217, !llvm.loop !2218

118:                                              ; preds = %57
  br label %119, !dbg !2220

119:                                              ; preds = %118, %113
  %120 = load i32, ptr %9, align 4, !dbg !2220
  %121 = load i32, ptr @Num_open_doors, align 4, !dbg !2222
  %122 = icmp sge i32 %120, %121, !dbg !2223
  br i1 %122, label %123, label %128, !dbg !2224

123:                                              ; preds = %119
  %124 = load i32, ptr @Game_mode, align 4, !dbg !2225
  %125 = and i32 %124, 38, !dbg !2226
  %126 = icmp ne i32 %125, 0, !dbg !2227
  br i1 %126, label %127, label %128, !dbg !2224

127:                                              ; preds = %123
  br label %164, !dbg !2228

128:                                              ; preds = %123, %119
  %129 = load i32, ptr %9, align 4, !dbg !2229
  %130 = load i32, ptr @Num_open_doors, align 4, !dbg !2229
  %131 = icmp slt i32 %129, %130, !dbg !2229
  %132 = zext i1 %131 to i32, !dbg !2229
  call void @_Z7_AssertiPKcS0_i(i32 noundef %132, ptr noundef @.str.9, ptr noundef @.str.1, i32 noundef 394), !dbg !2229
  %133 = load ptr, ptr %6, align 8, !dbg !2230
  %134 = icmp ne ptr %133, null, !dbg !2230
  %135 = zext i1 %134 to i32, !dbg !2230
  call void @_Z7_AssertiPKcS0_i(i32 noundef %135, ptr noundef @.str.10, ptr noundef @.str.1, i32 noundef 395), !dbg !2230
  %136 = load ptr, ptr %5, align 8, !dbg !2231
  %137 = getelementptr inbounds nuw %struct.wall, ptr %136, i32 0, i32 8, !dbg !2232
  %138 = load i8, ptr %137, align 4, !dbg !2232
  %139 = sext i8 %138 to i64, !dbg !2233
  %140 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %139, !dbg !2233
  %141 = getelementptr inbounds nuw %struct.wclip, ptr %140, i32 0, i32 0, !dbg !2234
  %142 = load i32, ptr %141, align 4, !dbg !2234
  %143 = load ptr, ptr %6, align 8, !dbg !2235
  %144 = getelementptr inbounds nuw %struct.active_door, ptr %143, i32 0, i32 3, !dbg !2236
  %145 = load i32, ptr %144, align 4, !dbg !2236
  %146 = sub nsw i32 %142, %145, !dbg !2237
  %147 = load ptr, ptr %6, align 8, !dbg !2238
  %148 = getelementptr inbounds nuw %struct.active_door, ptr %147, i32 0, i32 3, !dbg !2239
  store i32 %146, ptr %148, align 4, !dbg !2240
  %149 = load ptr, ptr %6, align 8, !dbg !2241
  %150 = getelementptr inbounds nuw %struct.active_door, ptr %149, i32 0, i32 3, !dbg !2243
  %151 = load i32, ptr %150, align 4, !dbg !2243
  %152 = icmp slt i32 %151, 0, !dbg !2244
  br i1 %152, label %153, label %156, !dbg !2244

153:                                              ; preds = %128
  %154 = load ptr, ptr %6, align 8, !dbg !2245
  %155 = getelementptr inbounds nuw %struct.active_door, ptr %154, i32 0, i32 3, !dbg !2246
  store i32 0, ptr %155, align 4, !dbg !2247
  br label %156, !dbg !2245

156:                                              ; preds = %153, %128
  br label %175, !dbg !2248

157:                                              ; preds = %50
  %158 = load ptr, ptr %5, align 8, !dbg !2249
  %159 = getelementptr inbounds nuw %struct.wall, ptr %158, i32 0, i32 6, !dbg !2249
  %160 = load i8, ptr %159, align 2, !dbg !2249
  %161 = zext i8 %160 to i32, !dbg !2249
  %162 = icmp eq i32 %161, 0, !dbg !2249
  %163 = zext i1 %162 to i32, !dbg !2249
  call void @_Z7_AssertiPKcS0_i(i32 noundef %163, ptr noundef @.str.11, ptr noundef @.str.1, i32 noundef 404), !dbg !2249
  br label %164, !dbg !2249

164:                                              ; preds = %157, %127
    #dbg_label(!2251, !2252)
  %165 = load i32, ptr @Num_open_doors, align 4, !dbg !2253
  %166 = sext i32 %165 to i64, !dbg !2254
  %167 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %166, !dbg !2254
  store ptr %167, ptr %6, align 8, !dbg !2255
  %168 = load ptr, ptr %6, align 8, !dbg !2256
  %169 = getelementptr inbounds nuw %struct.active_door, ptr %168, i32 0, i32 3, !dbg !2257
  store i32 0, ptr %169, align 4, !dbg !2258
  %170 = load i32, ptr @Num_open_doors, align 4, !dbg !2259
  %171 = add nsw i32 %170, 1, !dbg !2259
  store i32 %171, ptr @Num_open_doors, align 4, !dbg !2259
  %172 = load i32, ptr @Num_open_doors, align 4, !dbg !2260
  %173 = icmp slt i32 %172, 90, !dbg !2260
  %174 = zext i1 %173 to i32, !dbg !2260
  call void @_Z7_AssertiPKcS0_i(i32 noundef %174, ptr noundef @.str.12, ptr noundef @.str.1, i32 noundef 409), !dbg !2260
  br label %175

175:                                              ; preds = %164, %156
  %176 = load ptr, ptr %5, align 8, !dbg !2261
  %177 = getelementptr inbounds nuw %struct.wall, ptr %176, i32 0, i32 6, !dbg !2262
  store i8 1, ptr %177, align 2, !dbg !2263
  %178 = load ptr, ptr %3, align 8, !dbg !2264
  %179 = getelementptr inbounds nuw %struct.segment, ptr %178, i32 0, i32 1, !dbg !2265
  %180 = load i32, ptr %4, align 4, !dbg !2266
  %181 = sext i32 %180 to i64, !dbg !2264
  %182 = getelementptr inbounds [6 x i16], ptr %179, i64 0, i64 %181, !dbg !2264
  %183 = load i16, ptr %182, align 2, !dbg !2264
  %184 = sext i16 %183 to i64, !dbg !2267
  %185 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %184, !dbg !2267
  store ptr %185, ptr %8, align 8, !dbg !2268
  %186 = load ptr, ptr %3, align 8, !dbg !2269
  %187 = load ptr, ptr %8, align 8, !dbg !2270
  %188 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %186, ptr noundef %187), !dbg !2271
  store i32 %188, ptr %7, align 4, !dbg !2272
  %189 = load i32, ptr %7, align 4, !dbg !2273
  %190 = icmp ne i32 %189, -1, !dbg !2273
  %191 = zext i1 %190 to i32, !dbg !2273
  call void @_Z7_AssertiPKcS0_i(i32 noundef %191, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 418), !dbg !2273
  %192 = load ptr, ptr %8, align 8, !dbg !2274
  %193 = getelementptr inbounds nuw %struct.segment, ptr %192, i32 0, i32 0, !dbg !2275
  %194 = load i32, ptr %7, align 4, !dbg !2276
  %195 = sext i32 %194 to i64, !dbg !2274
  %196 = getelementptr inbounds [6 x %struct.side], ptr %193, i64 0, i64 %195, !dbg !2274
  %197 = getelementptr inbounds nuw %struct.side, ptr %196, i32 0, i32 2, !dbg !2277
  %198 = load i16, ptr %197, align 2, !dbg !2277
  %199 = sext i16 %198 to i64, !dbg !2278
  %200 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %199, !dbg !2278
  %201 = getelementptr inbounds nuw %struct.wall, ptr %200, i32 0, i32 6, !dbg !2279
  store i8 1, ptr %201, align 2, !dbg !2280
  %202 = load ptr, ptr %3, align 8, !dbg !2281
  %203 = getelementptr inbounds nuw %struct.segment, ptr %202, i32 0, i32 0, !dbg !2282
  %204 = load i32, ptr %4, align 4, !dbg !2283
  %205 = sext i32 %204 to i64, !dbg !2281
  %206 = getelementptr inbounds [6 x %struct.side], ptr %203, i64 0, i64 %205, !dbg !2281
  %207 = getelementptr inbounds nuw %struct.side, ptr %206, i32 0, i32 2, !dbg !2284
  %208 = load i16, ptr %207, align 2, !dbg !2284
  %209 = load ptr, ptr %6, align 8, !dbg !2285
  %210 = getelementptr inbounds nuw %struct.active_door, ptr %209, i32 0, i32 1, !dbg !2286
  %211 = getelementptr inbounds [2 x i16], ptr %210, i64 0, i64 0, !dbg !2285
  store i16 %208, ptr %211, align 4, !dbg !2287
  %212 = load ptr, ptr %8, align 8, !dbg !2288
  %213 = getelementptr inbounds nuw %struct.segment, ptr %212, i32 0, i32 0, !dbg !2289
  %214 = load i32, ptr %7, align 4, !dbg !2290
  %215 = sext i32 %214 to i64, !dbg !2288
  %216 = getelementptr inbounds [6 x %struct.side], ptr %213, i64 0, i64 %215, !dbg !2288
  %217 = getelementptr inbounds nuw %struct.side, ptr %216, i32 0, i32 2, !dbg !2291
  %218 = load i16, ptr %217, align 2, !dbg !2291
  %219 = load ptr, ptr %6, align 8, !dbg !2292
  %220 = getelementptr inbounds nuw %struct.active_door, ptr %219, i32 0, i32 2, !dbg !2293
  %221 = getelementptr inbounds [2 x i16], ptr %220, i64 0, i64 0, !dbg !2292
  store i16 %218, ptr %221, align 4, !dbg !2294
  %222 = load ptr, ptr %3, align 8, !dbg !2295
  %223 = ptrtoint ptr %222 to i64, !dbg !2295
  %224 = sub i64 %223, ptrtoint (ptr @Segments to i64), !dbg !2295
  %225 = sdiv exact i64 %224, 512, !dbg !2295
  %226 = icmp ne i64 %225, -1, !dbg !2295
  %227 = zext i1 %226 to i32, !dbg !2295
  call void @_Z7_AssertiPKcS0_i(i32 noundef %227, ptr noundef @.str.13, ptr noundef @.str.1, i32 noundef 427), !dbg !2295
  %228 = load i32, ptr @Newdemo_state, align 4, !dbg !2296
  %229 = icmp eq i32 %228, 1, !dbg !2298
  br i1 %229, label %230, label %237, !dbg !2298

230:                                              ; preds = %175
  %231 = load ptr, ptr %3, align 8, !dbg !2299
  %232 = ptrtoint ptr %231 to i64, !dbg !2301
  %233 = sub i64 %232, ptrtoint (ptr @Segments to i64), !dbg !2301
  %234 = sdiv exact i64 %233, 512, !dbg !2301
  %235 = trunc i64 %234 to i32, !dbg !2299
  %236 = load i32, ptr %4, align 4, !dbg !2302
  call void @_Z27newdemo_record_door_openingii(i32 noundef %235, i32 noundef %236), !dbg !2303
  br label %237, !dbg !2304

237:                                              ; preds = %230, %175
  %238 = load ptr, ptr %5, align 8, !dbg !2305
  %239 = getelementptr inbounds nuw %struct.wall, ptr %238, i32 0, i32 3, !dbg !2307
  %240 = load i32, ptr %239, align 4, !dbg !2307
  %241 = icmp ne i32 %240, -1, !dbg !2308
  br i1 %241, label %242, label %313, !dbg !2308

242:                                              ; preds = %237
    #dbg_declare(ptr %10, !2309, !DIExpression(), !2311)
    #dbg_declare(ptr %11, !2312, !DIExpression(), !2313)
  %243 = load ptr, ptr %5, align 8, !dbg !2314
  %244 = getelementptr inbounds nuw %struct.wall, ptr %243, i32 0, i32 3, !dbg !2315
  %245 = load i32, ptr %244, align 4, !dbg !2315
  %246 = sext i32 %245 to i64, !dbg !2316
  %247 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %246, !dbg !2316
  store ptr %247, ptr %10, align 8, !dbg !2317
  %248 = load ptr, ptr %10, align 8, !dbg !2318
  %249 = getelementptr inbounds nuw %struct.wall, ptr %248, i32 0, i32 0, !dbg !2319
  %250 = load i32, ptr %249, align 4, !dbg !2319
  %251 = sext i32 %250 to i64, !dbg !2320
  %252 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %251, !dbg !2320
  store ptr %252, ptr %11, align 8, !dbg !2321
  %253 = load ptr, ptr %10, align 8, !dbg !2322
  %254 = getelementptr inbounds nuw %struct.wall, ptr %253, i32 0, i32 3, !dbg !2322
  %255 = load i32, ptr %254, align 4, !dbg !2322
  %256 = load ptr, ptr %3, align 8, !dbg !2322
  %257 = getelementptr inbounds nuw %struct.segment, ptr %256, i32 0, i32 0, !dbg !2322
  %258 = load i32, ptr %4, align 4, !dbg !2322
  %259 = sext i32 %258 to i64, !dbg !2322
  %260 = getelementptr inbounds [6 x %struct.side], ptr %257, i64 0, i64 %259, !dbg !2322
  %261 = getelementptr inbounds nuw %struct.side, ptr %260, i32 0, i32 2, !dbg !2322
  %262 = load i16, ptr %261, align 2, !dbg !2322
  %263 = sext i16 %262 to i32, !dbg !2322
  %264 = icmp eq i32 %255, %263, !dbg !2322
  %265 = zext i1 %264 to i32, !dbg !2322
  call void @_Z7_AssertiPKcS0_i(i32 noundef %265, ptr noundef @.str.14, ptr noundef @.str.1, i32 noundef 440), !dbg !2322
  %266 = load ptr, ptr %10, align 8, !dbg !2323
  %267 = getelementptr inbounds nuw %struct.wall, ptr %266, i32 0, i32 6, !dbg !2324
  store i8 1, ptr %267, align 2, !dbg !2325
  %268 = load ptr, ptr %11, align 8, !dbg !2326
  %269 = getelementptr inbounds nuw %struct.segment, ptr %268, i32 0, i32 1, !dbg !2327
  %270 = load ptr, ptr %10, align 8, !dbg !2328
  %271 = getelementptr inbounds nuw %struct.wall, ptr %270, i32 0, i32 1, !dbg !2329
  %272 = load i32, ptr %271, align 4, !dbg !2329
  %273 = sext i32 %272 to i64, !dbg !2326
  %274 = getelementptr inbounds [6 x i16], ptr %269, i64 0, i64 %273, !dbg !2326
  %275 = load i16, ptr %274, align 2, !dbg !2326
  %276 = sext i16 %275 to i64, !dbg !2330
  %277 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %276, !dbg !2330
  store ptr %277, ptr %8, align 8, !dbg !2331
  %278 = load ptr, ptr %11, align 8, !dbg !2332
  %279 = load ptr, ptr %8, align 8, !dbg !2333
  %280 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %278, ptr noundef %279), !dbg !2334
  store i32 %280, ptr %7, align 4, !dbg !2335
  %281 = load i32, ptr %7, align 4, !dbg !2336
  %282 = icmp ne i32 %281, -1, !dbg !2336
  %283 = zext i1 %282 to i32, !dbg !2336
  call void @_Z7_AssertiPKcS0_i(i32 noundef %283, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 447), !dbg !2336
  %284 = load ptr, ptr %8, align 8, !dbg !2337
  %285 = getelementptr inbounds nuw %struct.segment, ptr %284, i32 0, i32 0, !dbg !2338
  %286 = load i32, ptr %7, align 4, !dbg !2339
  %287 = sext i32 %286 to i64, !dbg !2337
  %288 = getelementptr inbounds [6 x %struct.side], ptr %285, i64 0, i64 %287, !dbg !2337
  %289 = getelementptr inbounds nuw %struct.side, ptr %288, i32 0, i32 2, !dbg !2340
  %290 = load i16, ptr %289, align 2, !dbg !2340
  %291 = sext i16 %290 to i64, !dbg !2341
  %292 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %291, !dbg !2341
  %293 = getelementptr inbounds nuw %struct.wall, ptr %292, i32 0, i32 6, !dbg !2342
  store i8 1, ptr %293, align 2, !dbg !2343
  %294 = load ptr, ptr %6, align 8, !dbg !2344
  %295 = getelementptr inbounds nuw %struct.active_door, ptr %294, i32 0, i32 0, !dbg !2345
  store i32 2, ptr %295, align 4, !dbg !2346
  %296 = load ptr, ptr %5, align 8, !dbg !2347
  %297 = getelementptr inbounds nuw %struct.wall, ptr %296, i32 0, i32 3, !dbg !2348
  %298 = load i32, ptr %297, align 4, !dbg !2348
  %299 = trunc i32 %298 to i16, !dbg !2347
  %300 = load ptr, ptr %6, align 8, !dbg !2349
  %301 = getelementptr inbounds nuw %struct.active_door, ptr %300, i32 0, i32 1, !dbg !2350
  %302 = getelementptr inbounds [2 x i16], ptr %301, i64 0, i64 1, !dbg !2349
  store i16 %299, ptr %302, align 2, !dbg !2351
  %303 = load ptr, ptr %8, align 8, !dbg !2352
  %304 = getelementptr inbounds nuw %struct.segment, ptr %303, i32 0, i32 0, !dbg !2353
  %305 = load i32, ptr %7, align 4, !dbg !2354
  %306 = sext i32 %305 to i64, !dbg !2352
  %307 = getelementptr inbounds [6 x %struct.side], ptr %304, i64 0, i64 %306, !dbg !2352
  %308 = getelementptr inbounds nuw %struct.side, ptr %307, i32 0, i32 2, !dbg !2355
  %309 = load i16, ptr %308, align 2, !dbg !2355
  %310 = load ptr, ptr %6, align 8, !dbg !2356
  %311 = getelementptr inbounds nuw %struct.active_door, ptr %310, i32 0, i32 2, !dbg !2357
  %312 = getelementptr inbounds [2 x i16], ptr %311, i64 0, i64 1, !dbg !2356
  store i16 %309, ptr %312, align 2, !dbg !2358
  br label %316, !dbg !2359

313:                                              ; preds = %237
  %314 = load ptr, ptr %6, align 8, !dbg !2360
  %315 = getelementptr inbounds nuw %struct.active_door, ptr %314, i32 0, i32 0, !dbg !2361
  store i32 1, ptr %315, align 4, !dbg !2362
  br label %316

316:                                              ; preds = %313, %242
  %317 = load i32, ptr @Newdemo_state, align 4, !dbg !2363
  %318 = icmp ne i32 %317, 2, !dbg !2365
  br i1 %318, label %319, label %349, !dbg !2365

319:                                              ; preds = %316
    #dbg_declare(ptr %12, !2366, !DIExpression(), !2368)
  %320 = load ptr, ptr %3, align 8, !dbg !2369
  %321 = load i32, ptr %4, align 4, !dbg !2370
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %12, ptr noundef %320, i32 noundef %321), !dbg !2371
  %322 = load ptr, ptr %5, align 8, !dbg !2372
  %323 = getelementptr inbounds nuw %struct.wall, ptr %322, i32 0, i32 8, !dbg !2374
  %324 = load i8, ptr %323, align 4, !dbg !2374
  %325 = sext i8 %324 to i64, !dbg !2375
  %326 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %325, !dbg !2375
  %327 = getelementptr inbounds nuw %struct.wclip, ptr %326, i32 0, i32 3, !dbg !2376
  %328 = load i16, ptr %327, align 2, !dbg !2376
  %329 = sext i16 %328 to i32, !dbg !2375
  %330 = icmp sgt i32 %329, -1, !dbg !2377
  br i1 %330, label %331, label %348, !dbg !2377

331:                                              ; preds = %319
  %332 = load ptr, ptr %5, align 8, !dbg !2378
  %333 = getelementptr inbounds nuw %struct.wall, ptr %332, i32 0, i32 8, !dbg !2379
  %334 = load i8, ptr %333, align 4, !dbg !2379
  %335 = sext i8 %334 to i64, !dbg !2380
  %336 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %335, !dbg !2380
  %337 = getelementptr inbounds nuw %struct.wclip, ptr %336, i32 0, i32 3, !dbg !2381
  %338 = load i16, ptr %337, align 2, !dbg !2381
  %339 = sext i16 %338 to i32, !dbg !2380
  %340 = load ptr, ptr %3, align 8, !dbg !2382
  %341 = ptrtoint ptr %340 to i64, !dbg !2383
  %342 = sub i64 %341, ptrtoint (ptr @Segments to i64), !dbg !2383
  %343 = sdiv exact i64 %342, 512, !dbg !2383
  %344 = trunc i64 %343 to i16, !dbg !2382
  %345 = load i32, ptr %4, align 4, !dbg !2384
  %346 = trunc i32 %345 to i16, !dbg !2384
  %347 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %339, i16 noundef signext %344, i16 noundef signext %346, ptr noundef %12, i32 noundef 0, i32 noundef 65536), !dbg !2385
  br label %348, !dbg !2385

348:                                              ; preds = %331, %319
  br label %349, !dbg !2386

349:                                              ; preds = %49, %348, %316
  ret void, !dbg !2387
}

declare void @_Z27newdemo_record_door_openingii(i32 noundef, i32 noundef) #2

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #2

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16start_wall_cloakP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !2388 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2389, !DIExpression(), !2390)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2391, !DIExpression(), !2392)
    #dbg_declare(ptr %5, !2393, !DIExpression(), !2394)
    #dbg_declare(ptr %6, !2395, !DIExpression(), !2397)
    #dbg_declare(ptr %7, !2398, !DIExpression(), !2399)
    #dbg_declare(ptr %8, !2400, !DIExpression(), !2401)
    #dbg_declare(ptr %9, !2402, !DIExpression(), !2403)
  %12 = load i32, ptr @Newdemo_state, align 4, !dbg !2404
  %13 = icmp eq i32 %12, 2, !dbg !2406
  br i1 %13, label %14, label %15, !dbg !2406

14:                                               ; preds = %2
  br label %243, !dbg !2407

15:                                               ; preds = %2
  %16 = load ptr, ptr %3, align 8, !dbg !2408
  %17 = getelementptr inbounds nuw %struct.segment, ptr %16, i32 0, i32 0, !dbg !2408
  %18 = load i32, ptr %4, align 4, !dbg !2408
  %19 = sext i32 %18 to i64, !dbg !2408
  %20 = getelementptr inbounds [6 x %struct.side], ptr %17, i64 0, i64 %19, !dbg !2408
  %21 = getelementptr inbounds nuw %struct.side, ptr %20, i32 0, i32 2, !dbg !2408
  %22 = load i16, ptr %21, align 2, !dbg !2408
  %23 = sext i16 %22 to i32, !dbg !2408
  %24 = icmp ne i32 %23, -1, !dbg !2408
  %25 = zext i1 %24 to i32, !dbg !2408
  call void @_Z7_AssertiPKcS0_i(i32 noundef %25, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 481), !dbg !2408
  %26 = load ptr, ptr %3, align 8, !dbg !2409
  %27 = getelementptr inbounds nuw %struct.segment, ptr %26, i32 0, i32 0, !dbg !2410
  %28 = load i32, ptr %4, align 4, !dbg !2411
  %29 = sext i32 %28 to i64, !dbg !2409
  %30 = getelementptr inbounds [6 x %struct.side], ptr %27, i64 0, i64 %29, !dbg !2409
  %31 = getelementptr inbounds nuw %struct.side, ptr %30, i32 0, i32 2, !dbg !2412
  %32 = load i16, ptr %31, align 2, !dbg !2412
  %33 = sext i16 %32 to i64, !dbg !2413
  %34 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %33, !dbg !2413
  store ptr %34, ptr %5, align 8, !dbg !2414
  %35 = load ptr, ptr %5, align 8, !dbg !2415
  %36 = getelementptr inbounds nuw %struct.wall, ptr %35, i32 0, i32 4, !dbg !2417
  %37 = load i8, ptr %36, align 4, !dbg !2417
  %38 = zext i8 %37 to i32, !dbg !2415
  %39 = icmp eq i32 %38, 4, !dbg !2418
  br i1 %39, label %46, label %40, !dbg !2419

40:                                               ; preds = %15
  %41 = load ptr, ptr %5, align 8, !dbg !2420
  %42 = getelementptr inbounds nuw %struct.wall, ptr %41, i32 0, i32 6, !dbg !2421
  %43 = load i8, ptr %42, align 2, !dbg !2421
  %44 = zext i8 %43 to i32, !dbg !2420
  %45 = icmp eq i32 %44, 5, !dbg !2422
  br i1 %45, label %46, label %47, !dbg !2419

46:                                               ; preds = %40, %15
  br label %243, !dbg !2423

47:                                               ; preds = %40
  %48 = load ptr, ptr %3, align 8, !dbg !2424
  %49 = getelementptr inbounds nuw %struct.segment, ptr %48, i32 0, i32 1, !dbg !2425
  %50 = load i32, ptr %4, align 4, !dbg !2426
  %51 = sext i32 %50 to i64, !dbg !2424
  %52 = getelementptr inbounds [6 x i16], ptr %49, i64 0, i64 %51, !dbg !2424
  %53 = load i16, ptr %52, align 2, !dbg !2424
  %54 = sext i16 %53 to i64, !dbg !2427
  %55 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %54, !dbg !2427
  store ptr %55, ptr %8, align 8, !dbg !2428
  %56 = load ptr, ptr %3, align 8, !dbg !2429
  %57 = load ptr, ptr %8, align 8, !dbg !2430
  %58 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %56, ptr noundef %57), !dbg !2431
  store i32 %58, ptr %7, align 4, !dbg !2432
  %59 = load i32, ptr %7, align 4, !dbg !2433
  %60 = icmp ne i32 %59, -1, !dbg !2433
  %61 = zext i1 %60 to i32, !dbg !2433
  call void @_Z7_AssertiPKcS0_i(i32 noundef %61, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 490), !dbg !2433
  %62 = load ptr, ptr %5, align 8, !dbg !2434
  %63 = getelementptr inbounds nuw %struct.wall, ptr %62, i32 0, i32 6, !dbg !2436
  %64 = load i8, ptr %63, align 2, !dbg !2436
  %65 = zext i8 %64 to i32, !dbg !2434
  %66 = icmp eq i32 %65, 6, !dbg !2437
  br i1 %66, label %67, label %115, !dbg !2437

67:                                               ; preds = %47
    #dbg_declare(ptr %10, !2438, !DIExpression(), !2440)
  store ptr null, ptr %6, align 8, !dbg !2441
  store i32 0, ptr %10, align 4, !dbg !2442
  br label %68, !dbg !2444

68:                                               ; preds = %97, %67
  %69 = load i32, ptr %10, align 4, !dbg !2445
  %70 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2447
  %71 = icmp slt i32 %69, %70, !dbg !2448
  br i1 %71, label %72, label %100, !dbg !2449

72:                                               ; preds = %68
  %73 = load i32, ptr %10, align 4, !dbg !2450
  %74 = sext i32 %73 to i64, !dbg !2452
  %75 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %74, !dbg !2452
  store ptr %75, ptr %6, align 8, !dbg !2453
  %76 = load ptr, ptr %6, align 8, !dbg !2454
  %77 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %76, i32 0, i32 0, !dbg !2456
  %78 = load i16, ptr %77, align 4, !dbg !2456
  %79 = sext i16 %78 to i64, !dbg !2454
  %80 = load ptr, ptr %5, align 8, !dbg !2457
  %81 = ptrtoint ptr %80 to i64, !dbg !2458
  %82 = sub i64 %81, ptrtoint (ptr @Walls to i64), !dbg !2458
  %83 = sdiv exact i64 %82, 24, !dbg !2458
  %84 = icmp eq i64 %79, %83, !dbg !2459
  br i1 %84, label %95, label %85, !dbg !2460

85:                                               ; preds = %72
  %86 = load ptr, ptr %6, align 8, !dbg !2461
  %87 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %86, i32 0, i32 1, !dbg !2462
  %88 = load i16, ptr %87, align 2, !dbg !2462
  %89 = sext i16 %88 to i64, !dbg !2461
  %90 = load ptr, ptr %5, align 8, !dbg !2463
  %91 = ptrtoint ptr %90 to i64, !dbg !2464
  %92 = sub i64 %91, ptrtoint (ptr @Walls to i64), !dbg !2464
  %93 = sdiv exact i64 %92, 24, !dbg !2464
  %94 = icmp eq i64 %89, %93, !dbg !2465
  br i1 %94, label %95, label %96, !dbg !2460

95:                                               ; preds = %85, %72
  br label %101, !dbg !2466

96:                                               ; preds = %85
  br label %97, !dbg !2467

97:                                               ; preds = %96
  %98 = load i32, ptr %10, align 4, !dbg !2468
  %99 = add nsw i32 %98, 1, !dbg !2468
  store i32 %99, ptr %10, align 4, !dbg !2468
  br label %68, !dbg !2469, !llvm.loop !2470

100:                                              ; preds = %68
  br label %101, !dbg !2472

101:                                              ; preds = %100, %95
  %102 = load i32, ptr %10, align 4, !dbg !2472
  %103 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2472
  %104 = icmp slt i32 %102, %103, !dbg !2472
  %105 = zext i1 %104 to i32, !dbg !2472
  call void @_Z7_AssertiPKcS0_i(i32 noundef %105, ptr noundef @.str.15, ptr noundef @.str.1, i32 noundef 506), !dbg !2472
  %106 = load ptr, ptr %6, align 8, !dbg !2473
  %107 = icmp ne ptr %106, null, !dbg !2473
  %108 = zext i1 %107 to i32, !dbg !2473
  call void @_Z7_AssertiPKcS0_i(i32 noundef %108, ptr noundef @.str.10, ptr noundef @.str.1, i32 noundef 507), !dbg !2473
  %109 = load ptr, ptr %6, align 8, !dbg !2474
  %110 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %109, i32 0, i32 4, !dbg !2475
  %111 = load i32, ptr %110, align 4, !dbg !2475
  %112 = sub nsw i32 65536, %111, !dbg !2476
  %113 = load ptr, ptr %6, align 8, !dbg !2477
  %114 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %113, i32 0, i32 4, !dbg !2478
  store i32 %112, ptr %114, align 4, !dbg !2479
  br label %147, !dbg !2480

115:                                              ; preds = %47
  %116 = load ptr, ptr %5, align 8, !dbg !2481
  %117 = getelementptr inbounds nuw %struct.wall, ptr %116, i32 0, i32 6, !dbg !2483
  %118 = load i8, ptr %117, align 2, !dbg !2483
  %119 = zext i8 %118 to i32, !dbg !2481
  %120 = icmp eq i32 %119, 0, !dbg !2484
  br i1 %120, label %121, label %145, !dbg !2484

121:                                              ; preds = %115
  %122 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2485
  %123 = sext i32 %122 to i64, !dbg !2487
  %124 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %123, !dbg !2487
  store ptr %124, ptr %6, align 8, !dbg !2488
  %125 = load ptr, ptr %6, align 8, !dbg !2489
  %126 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %125, i32 0, i32 4, !dbg !2490
  store i32 0, ptr %126, align 4, !dbg !2491
  %127 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2492
  %128 = icmp sge i32 %127, 10, !dbg !2494
  br i1 %128, label %129, label %142, !dbg !2494

129:                                              ; preds = %121
  call void @_Z4Int3v(), !dbg !2495
  %130 = load ptr, ptr %5, align 8, !dbg !2497
  %131 = getelementptr inbounds nuw %struct.wall, ptr %130, i32 0, i32 4, !dbg !2498
  store i8 4, ptr %131, align 4, !dbg !2499
  %132 = load ptr, ptr %8, align 8, !dbg !2500
  %133 = getelementptr inbounds nuw %struct.segment, ptr %132, i32 0, i32 0, !dbg !2501
  %134 = load i32, ptr %7, align 4, !dbg !2502
  %135 = sext i32 %134 to i64, !dbg !2500
  %136 = getelementptr inbounds [6 x %struct.side], ptr %133, i64 0, i64 %135, !dbg !2500
  %137 = getelementptr inbounds nuw %struct.side, ptr %136, i32 0, i32 2, !dbg !2503
  %138 = load i16, ptr %137, align 2, !dbg !2503
  %139 = sext i16 %138 to i64, !dbg !2504
  %140 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %139, !dbg !2504
  %141 = getelementptr inbounds nuw %struct.wall, ptr %140, i32 0, i32 4, !dbg !2505
  store i8 4, ptr %141, align 4, !dbg !2506
  br label %243, !dbg !2507

142:                                              ; preds = %121
  %143 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2508
  %144 = add nsw i32 %143, 1, !dbg !2508
  store i32 %144, ptr @Num_cloaking_walls, align 4, !dbg !2508
  br label %146, !dbg !2509

145:                                              ; preds = %115
  call void @_Z4Int3v(), !dbg !2510
  br label %243, !dbg !2512

146:                                              ; preds = %142
  br label %147

147:                                              ; preds = %146, %101
  %148 = load ptr, ptr %5, align 8, !dbg !2513
  %149 = getelementptr inbounds nuw %struct.wall, ptr %148, i32 0, i32 6, !dbg !2514
  store i8 5, ptr %149, align 2, !dbg !2515
  %150 = load ptr, ptr %8, align 8, !dbg !2516
  %151 = getelementptr inbounds nuw %struct.segment, ptr %150, i32 0, i32 0, !dbg !2517
  %152 = load i32, ptr %7, align 4, !dbg !2518
  %153 = sext i32 %152 to i64, !dbg !2516
  %154 = getelementptr inbounds [6 x %struct.side], ptr %151, i64 0, i64 %153, !dbg !2516
  %155 = getelementptr inbounds nuw %struct.side, ptr %154, i32 0, i32 2, !dbg !2519
  %156 = load i16, ptr %155, align 2, !dbg !2519
  %157 = sext i16 %156 to i64, !dbg !2520
  %158 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %157, !dbg !2520
  %159 = getelementptr inbounds nuw %struct.wall, ptr %158, i32 0, i32 6, !dbg !2521
  store i8 5, ptr %159, align 2, !dbg !2522
  %160 = load ptr, ptr %3, align 8, !dbg !2523
  %161 = getelementptr inbounds nuw %struct.segment, ptr %160, i32 0, i32 0, !dbg !2524
  %162 = load i32, ptr %4, align 4, !dbg !2525
  %163 = sext i32 %162 to i64, !dbg !2523
  %164 = getelementptr inbounds [6 x %struct.side], ptr %161, i64 0, i64 %163, !dbg !2523
  %165 = getelementptr inbounds nuw %struct.side, ptr %164, i32 0, i32 2, !dbg !2526
  %166 = load i16, ptr %165, align 2, !dbg !2526
  %167 = load ptr, ptr %6, align 8, !dbg !2527
  %168 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %167, i32 0, i32 0, !dbg !2528
  store i16 %166, ptr %168, align 4, !dbg !2529
  %169 = load ptr, ptr %8, align 8, !dbg !2530
  %170 = getelementptr inbounds nuw %struct.segment, ptr %169, i32 0, i32 0, !dbg !2531
  %171 = load i32, ptr %7, align 4, !dbg !2532
  %172 = sext i32 %171 to i64, !dbg !2530
  %173 = getelementptr inbounds [6 x %struct.side], ptr %170, i64 0, i64 %172, !dbg !2530
  %174 = getelementptr inbounds nuw %struct.side, ptr %173, i32 0, i32 2, !dbg !2533
  %175 = load i16, ptr %174, align 2, !dbg !2533
  %176 = load ptr, ptr %6, align 8, !dbg !2534
  %177 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %176, i32 0, i32 1, !dbg !2535
  store i16 %175, ptr %177, align 2, !dbg !2536
  %178 = load ptr, ptr %3, align 8, !dbg !2537
  %179 = ptrtoint ptr %178 to i64, !dbg !2537
  %180 = sub i64 %179, ptrtoint (ptr @Segments to i64), !dbg !2537
  %181 = sdiv exact i64 %180, 512, !dbg !2537
  %182 = icmp ne i64 %181, -1, !dbg !2537
  %183 = zext i1 %182 to i32, !dbg !2537
  call void @_Z7_AssertiPKcS0_i(i32 noundef %183, ptr noundef @.str.13, ptr noundef @.str.1, i32 noundef 534), !dbg !2537
  %184 = load ptr, ptr %5, align 8, !dbg !2538
  %185 = getelementptr inbounds nuw %struct.wall, ptr %184, i32 0, i32 3, !dbg !2538
  %186 = load i32, ptr %185, align 4, !dbg !2538
  %187 = icmp eq i32 %186, -1, !dbg !2538
  %188 = zext i1 %187 to i32, !dbg !2538
  call void @_Z7_AssertiPKcS0_i(i32 noundef %188, ptr noundef @.str.16, ptr noundef @.str.1, i32 noundef 536), !dbg !2538
  %189 = load i32, ptr @Newdemo_state, align 4, !dbg !2539
  %190 = icmp ne i32 %189, 2, !dbg !2541
  br i1 %190, label %191, label %202, !dbg !2541

191:                                              ; preds = %147
    #dbg_declare(ptr %11, !2542, !DIExpression(), !2544)
  %192 = load ptr, ptr %3, align 8, !dbg !2545
  %193 = load i32, ptr %4, align 4, !dbg !2546
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %11, ptr noundef %192, i32 noundef %193), !dbg !2547
  %194 = load ptr, ptr %3, align 8, !dbg !2548
  %195 = ptrtoint ptr %194 to i64, !dbg !2549
  %196 = sub i64 %195, ptrtoint (ptr @Segments to i64), !dbg !2549
  %197 = sdiv exact i64 %196, 512, !dbg !2549
  %198 = trunc i64 %197 to i16, !dbg !2548
  %199 = load i32, ptr %4, align 4, !dbg !2550
  %200 = trunc i32 %199 to i16, !dbg !2550
  %201 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 160, i16 noundef signext %198, i16 noundef signext %200, ptr noundef %11, i32 noundef 0, i32 noundef 65536), !dbg !2551
  br label %202, !dbg !2552

202:                                              ; preds = %191, %147
  store i32 0, ptr %9, align 4, !dbg !2553
  br label %203, !dbg !2555

203:                                              ; preds = %239, %202
  %204 = load i32, ptr %9, align 4, !dbg !2556
  %205 = icmp slt i32 %204, 4, !dbg !2558
  br i1 %205, label %206, label %242, !dbg !2559

206:                                              ; preds = %203
  %207 = load ptr, ptr %3, align 8, !dbg !2560
  %208 = getelementptr inbounds nuw %struct.segment, ptr %207, i32 0, i32 0, !dbg !2562
  %209 = load i32, ptr %4, align 4, !dbg !2563
  %210 = sext i32 %209 to i64, !dbg !2560
  %211 = getelementptr inbounds [6 x %struct.side], ptr %208, i64 0, i64 %210, !dbg !2560
  %212 = getelementptr inbounds nuw %struct.side, ptr %211, i32 0, i32 5, !dbg !2564
  %213 = load i32, ptr %9, align 4, !dbg !2565
  %214 = sext i32 %213 to i64, !dbg !2560
  %215 = getelementptr inbounds [4 x %struct.uvl], ptr %212, i64 0, i64 %214, !dbg !2560
  %216 = getelementptr inbounds nuw %struct.uvl, ptr %215, i32 0, i32 2, !dbg !2566
  %217 = load i32, ptr %216, align 4, !dbg !2566
  %218 = load ptr, ptr %6, align 8, !dbg !2567
  %219 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %218, i32 0, i32 2, !dbg !2568
  %220 = load i32, ptr %9, align 4, !dbg !2569
  %221 = sext i32 %220 to i64, !dbg !2567
  %222 = getelementptr inbounds [4 x i32], ptr %219, i64 0, i64 %221, !dbg !2567
  store i32 %217, ptr %222, align 4, !dbg !2570
  %223 = load ptr, ptr %8, align 8, !dbg !2571
  %224 = getelementptr inbounds nuw %struct.segment, ptr %223, i32 0, i32 0, !dbg !2572
  %225 = load i32, ptr %7, align 4, !dbg !2573
  %226 = sext i32 %225 to i64, !dbg !2571
  %227 = getelementptr inbounds [6 x %struct.side], ptr %224, i64 0, i64 %226, !dbg !2571
  %228 = getelementptr inbounds nuw %struct.side, ptr %227, i32 0, i32 5, !dbg !2574
  %229 = load i32, ptr %9, align 4, !dbg !2575
  %230 = sext i32 %229 to i64, !dbg !2571
  %231 = getelementptr inbounds [4 x %struct.uvl], ptr %228, i64 0, i64 %230, !dbg !2571
  %232 = getelementptr inbounds nuw %struct.uvl, ptr %231, i32 0, i32 2, !dbg !2576
  %233 = load i32, ptr %232, align 4, !dbg !2576
  %234 = load ptr, ptr %6, align 8, !dbg !2577
  %235 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %234, i32 0, i32 3, !dbg !2578
  %236 = load i32, ptr %9, align 4, !dbg !2579
  %237 = sext i32 %236 to i64, !dbg !2577
  %238 = getelementptr inbounds [4 x i32], ptr %235, i64 0, i64 %237, !dbg !2577
  store i32 %233, ptr %238, align 4, !dbg !2580
  br label %239, !dbg !2581

239:                                              ; preds = %206
  %240 = load i32, ptr %9, align 4, !dbg !2582
  %241 = add nsw i32 %240, 1, !dbg !2582
  store i32 %241, ptr %9, align 4, !dbg !2582
  br label %203, !dbg !2583, !llvm.loop !2584

242:                                              ; preds = %203
  br label %243, !dbg !2586

243:                                              ; preds = %242, %14, %46, %129, %145
  ret void, !dbg !2586
}

declare void @_Z4Int3v() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18start_wall_decloakP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !2587 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2588, !DIExpression(), !2589)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2590, !DIExpression(), !2591)
    #dbg_declare(ptr %5, !2592, !DIExpression(), !2593)
    #dbg_declare(ptr %6, !2594, !DIExpression(), !2595)
    #dbg_declare(ptr %7, !2596, !DIExpression(), !2597)
    #dbg_declare(ptr %8, !2598, !DIExpression(), !2599)
    #dbg_declare(ptr %9, !2600, !DIExpression(), !2601)
  %12 = load i32, ptr @Newdemo_state, align 4, !dbg !2602
  %13 = icmp eq i32 %12, 2, !dbg !2604
  br i1 %13, label %14, label %15, !dbg !2604

14:                                               ; preds = %2
  br label %243, !dbg !2605

15:                                               ; preds = %2
  %16 = load ptr, ptr %3, align 8, !dbg !2606
  %17 = getelementptr inbounds nuw %struct.segment, ptr %16, i32 0, i32 0, !dbg !2606
  %18 = load i32, ptr %4, align 4, !dbg !2606
  %19 = sext i32 %18 to i64, !dbg !2606
  %20 = getelementptr inbounds [6 x %struct.side], ptr %17, i64 0, i64 %19, !dbg !2606
  %21 = getelementptr inbounds nuw %struct.side, ptr %20, i32 0, i32 2, !dbg !2606
  %22 = load i16, ptr %21, align 2, !dbg !2606
  %23 = sext i16 %22 to i32, !dbg !2606
  %24 = icmp ne i32 %23, -1, !dbg !2606
  %25 = zext i1 %24 to i32, !dbg !2606
  call void @_Z7_AssertiPKcS0_i(i32 noundef %25, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 562), !dbg !2606
  %26 = load ptr, ptr %3, align 8, !dbg !2607
  %27 = getelementptr inbounds nuw %struct.segment, ptr %26, i32 0, i32 0, !dbg !2608
  %28 = load i32, ptr %4, align 4, !dbg !2609
  %29 = sext i32 %28 to i64, !dbg !2607
  %30 = getelementptr inbounds [6 x %struct.side], ptr %27, i64 0, i64 %29, !dbg !2607
  %31 = getelementptr inbounds nuw %struct.side, ptr %30, i32 0, i32 2, !dbg !2610
  %32 = load i16, ptr %31, align 2, !dbg !2610
  %33 = sext i16 %32 to i64, !dbg !2611
  %34 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %33, !dbg !2611
  store ptr %34, ptr %5, align 8, !dbg !2612
  %35 = load ptr, ptr %5, align 8, !dbg !2613
  %36 = getelementptr inbounds nuw %struct.wall, ptr %35, i32 0, i32 4, !dbg !2615
  %37 = load i8, ptr %36, align 4, !dbg !2615
  %38 = zext i8 %37 to i32, !dbg !2613
  %39 = icmp eq i32 %38, 5, !dbg !2616
  br i1 %39, label %46, label %40, !dbg !2617

40:                                               ; preds = %15
  %41 = load ptr, ptr %5, align 8, !dbg !2618
  %42 = getelementptr inbounds nuw %struct.wall, ptr %41, i32 0, i32 6, !dbg !2619
  %43 = load i8, ptr %42, align 2, !dbg !2619
  %44 = zext i8 %43 to i32, !dbg !2618
  %45 = icmp eq i32 %44, 6, !dbg !2620
  br i1 %45, label %46, label %47, !dbg !2617

46:                                               ; preds = %40, %15
  br label %243, !dbg !2621

47:                                               ; preds = %40
  %48 = load ptr, ptr %5, align 8, !dbg !2622
  %49 = getelementptr inbounds nuw %struct.wall, ptr %48, i32 0, i32 6, !dbg !2624
  %50 = load i8, ptr %49, align 2, !dbg !2624
  %51 = zext i8 %50 to i32, !dbg !2622
  %52 = icmp eq i32 %51, 5, !dbg !2625
  br i1 %52, label %53, label %101, !dbg !2625

53:                                               ; preds = %47
    #dbg_declare(ptr %10, !2626, !DIExpression(), !2628)
  store ptr null, ptr %6, align 8, !dbg !2629
  store i32 0, ptr %10, align 4, !dbg !2630
  br label %54, !dbg !2632

54:                                               ; preds = %83, %53
  %55 = load i32, ptr %10, align 4, !dbg !2633
  %56 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2635
  %57 = icmp slt i32 %55, %56, !dbg !2636
  br i1 %57, label %58, label %86, !dbg !2637

58:                                               ; preds = %54
  %59 = load i32, ptr %10, align 4, !dbg !2638
  %60 = sext i32 %59 to i64, !dbg !2640
  %61 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %60, !dbg !2640
  store ptr %61, ptr %6, align 8, !dbg !2641
  %62 = load ptr, ptr %6, align 8, !dbg !2642
  %63 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %62, i32 0, i32 0, !dbg !2644
  %64 = load i16, ptr %63, align 4, !dbg !2644
  %65 = sext i16 %64 to i64, !dbg !2642
  %66 = load ptr, ptr %5, align 8, !dbg !2645
  %67 = ptrtoint ptr %66 to i64, !dbg !2646
  %68 = sub i64 %67, ptrtoint (ptr @Walls to i64), !dbg !2646
  %69 = sdiv exact i64 %68, 24, !dbg !2646
  %70 = icmp eq i64 %65, %69, !dbg !2647
  br i1 %70, label %81, label %71, !dbg !2648

71:                                               ; preds = %58
  %72 = load ptr, ptr %6, align 8, !dbg !2649
  %73 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %72, i32 0, i32 1, !dbg !2650
  %74 = load i16, ptr %73, align 2, !dbg !2650
  %75 = sext i16 %74 to i64, !dbg !2649
  %76 = load ptr, ptr %5, align 8, !dbg !2651
  %77 = ptrtoint ptr %76 to i64, !dbg !2652
  %78 = sub i64 %77, ptrtoint (ptr @Walls to i64), !dbg !2652
  %79 = sdiv exact i64 %78, 24, !dbg !2652
  %80 = icmp eq i64 %75, %79, !dbg !2653
  br i1 %80, label %81, label %82, !dbg !2648

81:                                               ; preds = %71, %58
  br label %87, !dbg !2654

82:                                               ; preds = %71
  br label %83, !dbg !2655

83:                                               ; preds = %82
  %84 = load i32, ptr %10, align 4, !dbg !2656
  %85 = add nsw i32 %84, 1, !dbg !2656
  store i32 %85, ptr %10, align 4, !dbg !2656
  br label %54, !dbg !2657, !llvm.loop !2658

86:                                               ; preds = %54
  br label %87, !dbg !2660

87:                                               ; preds = %86, %81
  %88 = load i32, ptr %10, align 4, !dbg !2660
  %89 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2660
  %90 = icmp slt i32 %88, %89, !dbg !2660
  %91 = zext i1 %90 to i32, !dbg !2660
  call void @_Z7_AssertiPKcS0_i(i32 noundef %91, ptr noundef @.str.15, ptr noundef @.str.1, i32 noundef 583), !dbg !2660
  %92 = load ptr, ptr %6, align 8, !dbg !2661
  %93 = icmp ne ptr %92, null, !dbg !2661
  %94 = zext i1 %93 to i32, !dbg !2661
  call void @_Z7_AssertiPKcS0_i(i32 noundef %94, ptr noundef @.str.10, ptr noundef @.str.1, i32 noundef 584), !dbg !2661
  %95 = load ptr, ptr %6, align 8, !dbg !2662
  %96 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %95, i32 0, i32 4, !dbg !2663
  %97 = load i32, ptr %96, align 4, !dbg !2663
  %98 = sub nsw i32 65536, %97, !dbg !2664
  %99 = load ptr, ptr %6, align 8, !dbg !2665
  %100 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %99, i32 0, i32 4, !dbg !2666
  store i32 %98, ptr %100, align 4, !dbg !2667
  br label %133, !dbg !2668

101:                                              ; preds = %47
  %102 = load ptr, ptr %5, align 8, !dbg !2669
  %103 = getelementptr inbounds nuw %struct.wall, ptr %102, i32 0, i32 6, !dbg !2671
  %104 = load i8, ptr %103, align 2, !dbg !2671
  %105 = zext i8 %104 to i32, !dbg !2669
  %106 = icmp eq i32 %105, 0, !dbg !2672
  br i1 %106, label %107, label %131, !dbg !2672

107:                                              ; preds = %101
  %108 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2673
  %109 = sext i32 %108 to i64, !dbg !2675
  %110 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %109, !dbg !2675
  store ptr %110, ptr %6, align 8, !dbg !2676
  %111 = load ptr, ptr %6, align 8, !dbg !2677
  %112 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %111, i32 0, i32 4, !dbg !2678
  store i32 0, ptr %112, align 4, !dbg !2679
  %113 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2680
  %114 = icmp sge i32 %113, 10, !dbg !2682
  br i1 %114, label %115, label %128, !dbg !2682

115:                                              ; preds = %107
  call void @_Z4Int3v(), !dbg !2683
  %116 = load ptr, ptr %5, align 8, !dbg !2685
  %117 = getelementptr inbounds nuw %struct.wall, ptr %116, i32 0, i32 4, !dbg !2686
  store i8 5, ptr %117, align 4, !dbg !2687
  %118 = load ptr, ptr %8, align 8, !dbg !2688
  %119 = getelementptr inbounds nuw %struct.segment, ptr %118, i32 0, i32 0, !dbg !2689
  %120 = load i32, ptr %7, align 4, !dbg !2690
  %121 = sext i32 %120 to i64, !dbg !2688
  %122 = getelementptr inbounds [6 x %struct.side], ptr %119, i64 0, i64 %121, !dbg !2688
  %123 = getelementptr inbounds nuw %struct.side, ptr %122, i32 0, i32 2, !dbg !2691
  %124 = load i16, ptr %123, align 2, !dbg !2691
  %125 = sext i16 %124 to i64, !dbg !2692
  %126 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %125, !dbg !2692
  %127 = getelementptr inbounds nuw %struct.wall, ptr %126, i32 0, i32 4, !dbg !2693
  store i8 5, ptr %127, align 4, !dbg !2694
  br label %243, !dbg !2695

128:                                              ; preds = %107
  %129 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !2696
  %130 = add nsw i32 %129, 1, !dbg !2696
  store i32 %130, ptr @Num_cloaking_walls, align 4, !dbg !2696
  br label %132, !dbg !2697

131:                                              ; preds = %101
  call void @_Z4Int3v(), !dbg !2698
  br label %243, !dbg !2700

132:                                              ; preds = %128
  br label %133

133:                                              ; preds = %132, %87
  %134 = load ptr, ptr %5, align 8, !dbg !2701
  %135 = getelementptr inbounds nuw %struct.wall, ptr %134, i32 0, i32 6, !dbg !2702
  store i8 6, ptr %135, align 2, !dbg !2703
  %136 = load ptr, ptr %3, align 8, !dbg !2704
  %137 = getelementptr inbounds nuw %struct.segment, ptr %136, i32 0, i32 1, !dbg !2705
  %138 = load i32, ptr %4, align 4, !dbg !2706
  %139 = sext i32 %138 to i64, !dbg !2704
  %140 = getelementptr inbounds [6 x i16], ptr %137, i64 0, i64 %139, !dbg !2704
  %141 = load i16, ptr %140, align 2, !dbg !2704
  %142 = sext i16 %141 to i64, !dbg !2707
  %143 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %142, !dbg !2707
  store ptr %143, ptr %8, align 8, !dbg !2708
  %144 = load ptr, ptr %3, align 8, !dbg !2709
  %145 = load ptr, ptr %8, align 8, !dbg !2710
  %146 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %144, ptr noundef %145), !dbg !2711
  store i32 %146, ptr %7, align 4, !dbg !2712
  %147 = load i32, ptr %7, align 4, !dbg !2713
  %148 = icmp ne i32 %147, -1, !dbg !2713
  %149 = zext i1 %148 to i32, !dbg !2713
  call void @_Z7_AssertiPKcS0_i(i32 noundef %149, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 610), !dbg !2713
  %150 = load ptr, ptr %8, align 8, !dbg !2714
  %151 = getelementptr inbounds nuw %struct.segment, ptr %150, i32 0, i32 0, !dbg !2715
  %152 = load i32, ptr %7, align 4, !dbg !2716
  %153 = sext i32 %152 to i64, !dbg !2714
  %154 = getelementptr inbounds [6 x %struct.side], ptr %151, i64 0, i64 %153, !dbg !2714
  %155 = getelementptr inbounds nuw %struct.side, ptr %154, i32 0, i32 2, !dbg !2717
  %156 = load i16, ptr %155, align 2, !dbg !2717
  %157 = sext i16 %156 to i64, !dbg !2718
  %158 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %157, !dbg !2718
  %159 = getelementptr inbounds nuw %struct.wall, ptr %158, i32 0, i32 6, !dbg !2719
  store i8 6, ptr %159, align 2, !dbg !2720
  %160 = load ptr, ptr %3, align 8, !dbg !2721
  %161 = getelementptr inbounds nuw %struct.segment, ptr %160, i32 0, i32 0, !dbg !2722
  %162 = load i32, ptr %4, align 4, !dbg !2723
  %163 = sext i32 %162 to i64, !dbg !2721
  %164 = getelementptr inbounds [6 x %struct.side], ptr %161, i64 0, i64 %163, !dbg !2721
  %165 = getelementptr inbounds nuw %struct.side, ptr %164, i32 0, i32 2, !dbg !2724
  %166 = load i16, ptr %165, align 2, !dbg !2724
  %167 = load ptr, ptr %6, align 8, !dbg !2725
  %168 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %167, i32 0, i32 0, !dbg !2726
  store i16 %166, ptr %168, align 4, !dbg !2727
  %169 = load ptr, ptr %8, align 8, !dbg !2728
  %170 = getelementptr inbounds nuw %struct.segment, ptr %169, i32 0, i32 0, !dbg !2729
  %171 = load i32, ptr %7, align 4, !dbg !2730
  %172 = sext i32 %171 to i64, !dbg !2728
  %173 = getelementptr inbounds [6 x %struct.side], ptr %170, i64 0, i64 %172, !dbg !2728
  %174 = getelementptr inbounds nuw %struct.side, ptr %173, i32 0, i32 2, !dbg !2731
  %175 = load i16, ptr %174, align 2, !dbg !2731
  %176 = load ptr, ptr %6, align 8, !dbg !2732
  %177 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %176, i32 0, i32 1, !dbg !2733
  store i16 %175, ptr %177, align 2, !dbg !2734
  %178 = load ptr, ptr %3, align 8, !dbg !2735
  %179 = ptrtoint ptr %178 to i64, !dbg !2735
  %180 = sub i64 %179, ptrtoint (ptr @Segments to i64), !dbg !2735
  %181 = sdiv exact i64 %180, 512, !dbg !2735
  %182 = icmp ne i64 %181, -1, !dbg !2735
  %183 = zext i1 %182 to i32, !dbg !2735
  call void @_Z7_AssertiPKcS0_i(i32 noundef %183, ptr noundef @.str.13, ptr noundef @.str.1, i32 noundef 617), !dbg !2735
  %184 = load ptr, ptr %5, align 8, !dbg !2736
  %185 = getelementptr inbounds nuw %struct.wall, ptr %184, i32 0, i32 3, !dbg !2736
  %186 = load i32, ptr %185, align 4, !dbg !2736
  %187 = icmp eq i32 %186, -1, !dbg !2736
  %188 = zext i1 %187 to i32, !dbg !2736
  call void @_Z7_AssertiPKcS0_i(i32 noundef %188, ptr noundef @.str.16, ptr noundef @.str.1, i32 noundef 619), !dbg !2736
  %189 = load i32, ptr @Newdemo_state, align 4, !dbg !2737
  %190 = icmp ne i32 %189, 2, !dbg !2739
  br i1 %190, label %191, label %202, !dbg !2739

191:                                              ; preds = %133
    #dbg_declare(ptr %11, !2740, !DIExpression(), !2742)
  %192 = load ptr, ptr %3, align 8, !dbg !2743
  %193 = load i32, ptr %4, align 4, !dbg !2744
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %11, ptr noundef %192, i32 noundef %193), !dbg !2745
  %194 = load ptr, ptr %3, align 8, !dbg !2746
  %195 = ptrtoint ptr %194 to i64, !dbg !2747
  %196 = sub i64 %195, ptrtoint (ptr @Segments to i64), !dbg !2747
  %197 = sdiv exact i64 %196, 512, !dbg !2747
  %198 = trunc i64 %197 to i16, !dbg !2746
  %199 = load i32, ptr %4, align 4, !dbg !2748
  %200 = trunc i32 %199 to i16, !dbg !2748
  %201 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 161, i16 noundef signext %198, i16 noundef signext %200, ptr noundef %11, i32 noundef 0, i32 noundef 65536), !dbg !2749
  br label %202, !dbg !2750

202:                                              ; preds = %191, %133
  store i32 0, ptr %9, align 4, !dbg !2751
  br label %203, !dbg !2753

203:                                              ; preds = %239, %202
  %204 = load i32, ptr %9, align 4, !dbg !2754
  %205 = icmp slt i32 %204, 4, !dbg !2756
  br i1 %205, label %206, label %242, !dbg !2757

206:                                              ; preds = %203
  %207 = load ptr, ptr %3, align 8, !dbg !2758
  %208 = getelementptr inbounds nuw %struct.segment, ptr %207, i32 0, i32 0, !dbg !2760
  %209 = load i32, ptr %4, align 4, !dbg !2761
  %210 = sext i32 %209 to i64, !dbg !2758
  %211 = getelementptr inbounds [6 x %struct.side], ptr %208, i64 0, i64 %210, !dbg !2758
  %212 = getelementptr inbounds nuw %struct.side, ptr %211, i32 0, i32 5, !dbg !2762
  %213 = load i32, ptr %9, align 4, !dbg !2763
  %214 = sext i32 %213 to i64, !dbg !2758
  %215 = getelementptr inbounds [4 x %struct.uvl], ptr %212, i64 0, i64 %214, !dbg !2758
  %216 = getelementptr inbounds nuw %struct.uvl, ptr %215, i32 0, i32 2, !dbg !2764
  %217 = load i32, ptr %216, align 4, !dbg !2764
  %218 = load ptr, ptr %6, align 8, !dbg !2765
  %219 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %218, i32 0, i32 2, !dbg !2766
  %220 = load i32, ptr %9, align 4, !dbg !2767
  %221 = sext i32 %220 to i64, !dbg !2765
  %222 = getelementptr inbounds [4 x i32], ptr %219, i64 0, i64 %221, !dbg !2765
  store i32 %217, ptr %222, align 4, !dbg !2768
  %223 = load ptr, ptr %8, align 8, !dbg !2769
  %224 = getelementptr inbounds nuw %struct.segment, ptr %223, i32 0, i32 0, !dbg !2770
  %225 = load i32, ptr %7, align 4, !dbg !2771
  %226 = sext i32 %225 to i64, !dbg !2769
  %227 = getelementptr inbounds [6 x %struct.side], ptr %224, i64 0, i64 %226, !dbg !2769
  %228 = getelementptr inbounds nuw %struct.side, ptr %227, i32 0, i32 5, !dbg !2772
  %229 = load i32, ptr %9, align 4, !dbg !2773
  %230 = sext i32 %229 to i64, !dbg !2769
  %231 = getelementptr inbounds [4 x %struct.uvl], ptr %228, i64 0, i64 %230, !dbg !2769
  %232 = getelementptr inbounds nuw %struct.uvl, ptr %231, i32 0, i32 2, !dbg !2774
  %233 = load i32, ptr %232, align 4, !dbg !2774
  %234 = load ptr, ptr %6, align 8, !dbg !2775
  %235 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %234, i32 0, i32 3, !dbg !2776
  %236 = load i32, ptr %9, align 4, !dbg !2777
  %237 = sext i32 %236 to i64, !dbg !2775
  %238 = getelementptr inbounds [4 x i32], ptr %235, i64 0, i64 %237, !dbg !2775
  store i32 %233, ptr %238, align 4, !dbg !2778
  br label %239, !dbg !2779

239:                                              ; preds = %206
  %240 = load i32, ptr %9, align 4, !dbg !2780
  %241 = add nsw i32 %240, 1, !dbg !2780
  store i32 %241, ptr %9, align 4, !dbg !2780
  br label %203, !dbg !2781, !llvm.loop !2782

242:                                              ; preds = %203
  br label %243, !dbg !2784

243:                                              ; preds = %242, %14, %46, %115, %131
  ret void, !dbg !2784
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19wall_close_door_numi(i32 noundef %0) #1 !dbg !2785 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2786, !DIExpression(), !2787)
    #dbg_declare(ptr %3, !2788, !DIExpression(), !2789)
    #dbg_declare(ptr %4, !2790, !DIExpression(), !2791)
    #dbg_declare(ptr %5, !2792, !DIExpression(), !2793)
  %11 = load i32, ptr %2, align 4, !dbg !2794
  %12 = sext i32 %11 to i64, !dbg !2795
  %13 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %12, !dbg !2795
  store ptr %13, ptr %4, align 8, !dbg !2796
  store i32 0, ptr %3, align 4, !dbg !2797
  br label %14, !dbg !2799

14:                                               ; preds = %89, %1
  %15 = load i32, ptr %3, align 4, !dbg !2800
  %16 = load ptr, ptr %4, align 8, !dbg !2802
  %17 = getelementptr inbounds nuw %struct.active_door, ptr %16, i32 0, i32 0, !dbg !2803
  %18 = load i32, ptr %17, align 4, !dbg !2803
  %19 = icmp slt i32 %15, %18, !dbg !2804
  br i1 %19, label %20, label %92, !dbg !2805

20:                                               ; preds = %14
    #dbg_declare(ptr %6, !2806, !DIExpression(), !2808)
    #dbg_declare(ptr %7, !2809, !DIExpression(), !2810)
    #dbg_declare(ptr %8, !2811, !DIExpression(), !2812)
    #dbg_declare(ptr %9, !2813, !DIExpression(), !2814)
    #dbg_declare(ptr %10, !2815, !DIExpression(), !2816)
  %21 = load ptr, ptr %4, align 8, !dbg !2817
  %22 = getelementptr inbounds nuw %struct.active_door, ptr %21, i32 0, i32 1, !dbg !2818
  %23 = load i32, ptr %3, align 4, !dbg !2819
  %24 = sext i32 %23 to i64, !dbg !2817
  %25 = getelementptr inbounds [2 x i16], ptr %22, i64 0, i64 %24, !dbg !2817
  %26 = load i16, ptr %25, align 2, !dbg !2817
  %27 = sext i16 %26 to i64, !dbg !2820
  %28 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %27, !dbg !2820
  store ptr %28, ptr %6, align 8, !dbg !2821
  %29 = load ptr, ptr %6, align 8, !dbg !2822
  %30 = getelementptr inbounds nuw %struct.wall, ptr %29, i32 0, i32 0, !dbg !2823
  %31 = load i32, ptr %30, align 4, !dbg !2823
  %32 = sext i32 %31 to i64, !dbg !2824
  %33 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %32, !dbg !2824
  store ptr %33, ptr %10, align 8, !dbg !2825
  %34 = load ptr, ptr %6, align 8, !dbg !2826
  %35 = getelementptr inbounds nuw %struct.wall, ptr %34, i32 0, i32 1, !dbg !2827
  %36 = load i32, ptr %35, align 4, !dbg !2827
  store i32 %36, ptr %8, align 4, !dbg !2828
  %37 = load ptr, ptr %10, align 8, !dbg !2829
  %38 = getelementptr inbounds nuw %struct.segment, ptr %37, i32 0, i32 0, !dbg !2829
  %39 = load i32, ptr %8, align 4, !dbg !2829
  %40 = sext i32 %39 to i64, !dbg !2829
  %41 = getelementptr inbounds [6 x %struct.side], ptr %38, i64 0, i64 %40, !dbg !2829
  %42 = getelementptr inbounds nuw %struct.side, ptr %41, i32 0, i32 2, !dbg !2829
  %43 = load i16, ptr %42, align 2, !dbg !2829
  %44 = sext i16 %43 to i32, !dbg !2829
  %45 = icmp ne i32 %44, -1, !dbg !2829
  %46 = zext i1 %45 to i32, !dbg !2829
  call void @_Z7_AssertiPKcS0_i(i32 noundef %46, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 654), !dbg !2829
  %47 = load ptr, ptr %10, align 8, !dbg !2830
  %48 = getelementptr inbounds nuw %struct.segment, ptr %47, i32 0, i32 1, !dbg !2831
  %49 = load i32, ptr %8, align 4, !dbg !2832
  %50 = sext i32 %49 to i64, !dbg !2830
  %51 = getelementptr inbounds [6 x i16], ptr %48, i64 0, i64 %50, !dbg !2830
  %52 = load i16, ptr %51, align 2, !dbg !2830
  %53 = sext i16 %52 to i64, !dbg !2833
  %54 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %53, !dbg !2833
  store ptr %54, ptr %9, align 8, !dbg !2834
  %55 = load ptr, ptr %10, align 8, !dbg !2835
  %56 = load ptr, ptr %9, align 8, !dbg !2836
  %57 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %55, ptr noundef %56), !dbg !2837
  store i32 %57, ptr %7, align 4, !dbg !2838
  %58 = load i32, ptr %7, align 4, !dbg !2839
  %59 = icmp ne i32 %58, -1, !dbg !2839
  %60 = zext i1 %59 to i32, !dbg !2839
  call void @_Z7_AssertiPKcS0_i(i32 noundef %60, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 658), !dbg !2839
  %61 = load ptr, ptr %10, align 8, !dbg !2840
  %62 = getelementptr inbounds nuw %struct.segment, ptr %61, i32 0, i32 0, !dbg !2841
  %63 = load i32, ptr %8, align 4, !dbg !2842
  %64 = sext i32 %63 to i64, !dbg !2840
  %65 = getelementptr inbounds [6 x %struct.side], ptr %62, i64 0, i64 %64, !dbg !2840
  %66 = getelementptr inbounds nuw %struct.side, ptr %65, i32 0, i32 2, !dbg !2843
  %67 = load i16, ptr %66, align 2, !dbg !2843
  %68 = sext i16 %67 to i64, !dbg !2844
  %69 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %68, !dbg !2844
  %70 = getelementptr inbounds nuw %struct.wall, ptr %69, i32 0, i32 6, !dbg !2845
  store i8 0, ptr %70, align 2, !dbg !2846
  %71 = load ptr, ptr %9, align 8, !dbg !2847
  %72 = getelementptr inbounds nuw %struct.segment, ptr %71, i32 0, i32 0, !dbg !2848
  %73 = load i32, ptr %7, align 4, !dbg !2849
  %74 = sext i32 %73 to i64, !dbg !2847
  %75 = getelementptr inbounds [6 x %struct.side], ptr %72, i64 0, i64 %74, !dbg !2847
  %76 = getelementptr inbounds nuw %struct.side, ptr %75, i32 0, i32 2, !dbg !2850
  %77 = load i16, ptr %76, align 2, !dbg !2850
  %78 = sext i16 %77 to i64, !dbg !2851
  %79 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %78, !dbg !2851
  %80 = getelementptr inbounds nuw %struct.wall, ptr %79, i32 0, i32 6, !dbg !2852
  store i8 0, ptr %80, align 2, !dbg !2853
  %81 = load ptr, ptr %10, align 8, !dbg !2854
  %82 = load i32, ptr %8, align 4, !dbg !2855
  %83 = load ptr, ptr %9, align 8, !dbg !2856
  %84 = load i32, ptr %7, align 4, !dbg !2857
  %85 = load ptr, ptr %6, align 8, !dbg !2858
  %86 = getelementptr inbounds nuw %struct.wall, ptr %85, i32 0, i32 8, !dbg !2859
  %87 = load i8, ptr %86, align 4, !dbg !2859
  %88 = sext i8 %87 to i32, !dbg !2858
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %81, i32 noundef %82, ptr noundef %83, i32 noundef %84, i32 noundef %88, i32 noundef 0), !dbg !2860
  br label %89, !dbg !2861

89:                                               ; preds = %20
  %90 = load i32, ptr %3, align 4, !dbg !2862
  %91 = add nsw i32 %90, 1, !dbg !2862
  store i32 %91, ptr %3, align 4, !dbg !2862
  br label %14, !dbg !2863, !llvm.loop !2864

92:                                               ; preds = %14
  %93 = load i32, ptr %2, align 4, !dbg !2866
  store i32 %93, ptr %5, align 4, !dbg !2868
  br label %94, !dbg !2869

94:                                               ; preds = %106, %92
  %95 = load i32, ptr %5, align 4, !dbg !2870
  %96 = load i32, ptr @Num_open_doors, align 4, !dbg !2872
  %97 = icmp slt i32 %95, %96, !dbg !2873
  br i1 %97, label %98, label %109, !dbg !2874

98:                                               ; preds = %94
  %99 = load i32, ptr %5, align 4, !dbg !2875
  %100 = add nsw i32 %99, 1, !dbg !2876
  %101 = sext i32 %100 to i64, !dbg !2877
  %102 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %101, !dbg !2877
  %103 = load i32, ptr %5, align 4, !dbg !2878
  %104 = sext i32 %103 to i64, !dbg !2879
  %105 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %104, !dbg !2879
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %105, ptr align 4 %102, i64 16, i1 false), !dbg !2880
  br label %106, !dbg !2879

106:                                              ; preds = %98
  %107 = load i32, ptr %5, align 4, !dbg !2881
  %108 = add nsw i32 %107, 1, !dbg !2881
  store i32 %108, ptr %5, align 4, !dbg !2881
  br label %94, !dbg !2882, !llvm.loop !2883

109:                                              ; preds = %94
  %110 = load i32, ptr @Num_open_doors, align 4, !dbg !2885
  %111 = add nsw i32 %110, -1, !dbg !2885
  store i32 %111, ptr @Num_open_doors, align 4, !dbg !2885
  ret void, !dbg !2886
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z10check_pokeiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #1 !dbg !2887 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca %struct.segmasks, align 2
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !2890, !DIExpression(), !2891)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2892, !DIExpression(), !2893)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2894, !DIExpression(), !2895)
    #dbg_declare(ptr %8, !2896, !DIExpression(), !3027)
  %10 = load i32, ptr %5, align 4, !dbg !3028
  %11 = sext i32 %10 to i64, !dbg !3029
  %12 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %11, !dbg !3029
  store ptr %12, ptr %8, align 8, !dbg !3027
  %13 = load ptr, ptr %8, align 8, !dbg !3030
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 13, !dbg !3032
  %15 = load i32, ptr %14, align 4, !dbg !3032
  %16 = icmp ne i32 %15, 0, !dbg !3030
  br i1 %16, label %17, label %32, !dbg !3033

17:                                               ; preds = %3
  %18 = load ptr, ptr %8, align 8, !dbg !3034
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 11, !dbg !3035
  %20 = load i32, ptr %6, align 4, !dbg !3036
  %21 = load ptr, ptr %8, align 8, !dbg !3037
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 13, !dbg !3038
  %23 = load i32, ptr %22, align 4, !dbg !3038
  %24 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %19, i32 noundef %20, i32 noundef %23), !dbg !3039
  store i32 %24, ptr %9, align 2, !dbg !3039
  %25 = getelementptr inbounds nuw %struct.segmasks, ptr %9, i32 0, i32 1, !dbg !3040
  %26 = load i8, ptr %25, align 2, !dbg !3040
  %27 = sext i8 %26 to i32, !dbg !3039
  %28 = load i32, ptr %7, align 4, !dbg !3041
  %29 = shl i32 1, %28, !dbg !3042
  %30 = and i32 %27, %29, !dbg !3043
  %31 = icmp ne i32 %30, 0, !dbg !3039
  br label %32

32:                                               ; preds = %17, %3
  %33 = phi i1 [ false, %3 ], [ %31, %17 ], !dbg !3044
  br i1 %33, label %34, label %35, !dbg !3030

34:                                               ; preds = %32
  store i32 1, ptr %4, align 4, !dbg !3045
  br label %36, !dbg !3045

35:                                               ; preds = %32
  store i32 0, ptr %4, align 4, !dbg !3046
  br label %36, !dbg !3046

36:                                               ; preds = %35, %34
  %37 = load i32, ptr %4, align 4, !dbg !3047
  ret i32 %37, !dbg !3047
}

declare i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z12is_door_freeP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !3048 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3049, !DIExpression(), !3050)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !3051, !DIExpression(), !3052)
    #dbg_declare(ptr %6, !3053, !DIExpression(), !3054)
    #dbg_declare(ptr %7, !3055, !DIExpression(), !3056)
    #dbg_declare(ptr %8, !3057, !DIExpression(), !3058)
  %9 = load ptr, ptr %4, align 8, !dbg !3059
  %10 = getelementptr inbounds nuw %struct.segment, ptr %9, i32 0, i32 1, !dbg !3060
  %11 = load i32, ptr %5, align 4, !dbg !3061
  %12 = sext i32 %11 to i64, !dbg !3059
  %13 = getelementptr inbounds [6 x i16], ptr %10, i64 0, i64 %12, !dbg !3059
  %14 = load i16, ptr %13, align 2, !dbg !3059
  %15 = sext i16 %14 to i64, !dbg !3062
  %16 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %15, !dbg !3062
  store ptr %16, ptr %7, align 8, !dbg !3063
  %17 = load ptr, ptr %4, align 8, !dbg !3064
  %18 = load ptr, ptr %7, align 8, !dbg !3065
  %19 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %17, ptr noundef %18), !dbg !3066
  store i32 %19, ptr %6, align 4, !dbg !3067
  %20 = load i32, ptr %6, align 4, !dbg !3068
  %21 = icmp ne i32 %20, -1, !dbg !3068
  %22 = zext i1 %21 to i32, !dbg !3068
  call void @_Z7_AssertiPKcS0_i(i32 noundef %22, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 702), !dbg !3068
  %23 = load ptr, ptr %4, align 8, !dbg !3069
  %24 = getelementptr inbounds nuw %struct.segment, ptr %23, i32 0, i32 3, !dbg !3071
  %25 = load i32, ptr %24, align 4, !dbg !3071
  store i32 %25, ptr %8, align 4, !dbg !3072
  br label %26, !dbg !3073

26:                                               ; preds = %57, %2
  %27 = load i32, ptr %8, align 4, !dbg !3074
  %28 = icmp ne i32 %27, -1, !dbg !3076
  br i1 %28, label %29, label %64, !dbg !3077

29:                                               ; preds = %26
  %30 = load i32, ptr %8, align 4, !dbg !3078
  %31 = sext i32 %30 to i64, !dbg !3080
  %32 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %31, !dbg !3080
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 1, !dbg !3081
  %34 = load i8, ptr %33, align 4, !dbg !3081
  %35 = zext i8 %34 to i32, !dbg !3080
  %36 = icmp ne i32 %35, 5, !dbg !3082
  br i1 %36, label %37, label %56, !dbg !3083

37:                                               ; preds = %29
  %38 = load i32, ptr %8, align 4, !dbg !3084
  %39 = sext i32 %38 to i64, !dbg !3085
  %40 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %39, !dbg !3085
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 1, !dbg !3086
  %42 = load i8, ptr %41, align 4, !dbg !3086
  %43 = zext i8 %42 to i32, !dbg !3085
  %44 = icmp ne i32 %43, 1, !dbg !3087
  br i1 %44, label %45, label %56, !dbg !3088

45:                                               ; preds = %37
  %46 = load i32, ptr %8, align 4, !dbg !3089
  %47 = load ptr, ptr %4, align 8, !dbg !3090
  %48 = ptrtoint ptr %47 to i64, !dbg !3091
  %49 = sub i64 %48, ptrtoint (ptr @Segments to i64), !dbg !3091
  %50 = sdiv exact i64 %49, 512, !dbg !3091
  %51 = trunc i64 %50 to i32, !dbg !3090
  %52 = load i32, ptr %5, align 4, !dbg !3092
  %53 = call noundef i32 @_Z10check_pokeiii(i32 noundef %46, i32 noundef %51, i32 noundef %52), !dbg !3093
  %54 = icmp ne i32 %53, 0, !dbg !3093
  br i1 %54, label %55, label %56, !dbg !3088

55:                                               ; preds = %45
  store i32 0, ptr %3, align 4, !dbg !3094
  br label %107, !dbg !3094

56:                                               ; preds = %45, %37, %29
  br label %57, !dbg !3095

57:                                               ; preds = %56
  %58 = load i32, ptr %8, align 4, !dbg !3096
  %59 = sext i32 %58 to i64, !dbg !3097
  %60 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %59, !dbg !3097
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 3, !dbg !3098
  %62 = load i16, ptr %61, align 2, !dbg !3098
  %63 = sext i16 %62 to i32, !dbg !3097
  store i32 %63, ptr %8, align 4, !dbg !3099
  br label %26, !dbg !3100, !llvm.loop !3101

64:                                               ; preds = %26
  %65 = load ptr, ptr %7, align 8, !dbg !3103
  %66 = getelementptr inbounds nuw %struct.segment, ptr %65, i32 0, i32 3, !dbg !3105
  %67 = load i32, ptr %66, align 4, !dbg !3105
  store i32 %67, ptr %8, align 4, !dbg !3106
  br label %68, !dbg !3107

68:                                               ; preds = %99, %64
  %69 = load i32, ptr %8, align 4, !dbg !3108
  %70 = icmp ne i32 %69, -1, !dbg !3110
  br i1 %70, label %71, label %106, !dbg !3111

71:                                               ; preds = %68
  %72 = load i32, ptr %8, align 4, !dbg !3112
  %73 = sext i32 %72 to i64, !dbg !3114
  %74 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %73, !dbg !3114
  %75 = getelementptr inbounds nuw %struct.object, ptr %74, i32 0, i32 1, !dbg !3115
  %76 = load i8, ptr %75, align 4, !dbg !3115
  %77 = zext i8 %76 to i32, !dbg !3114
  %78 = icmp ne i32 %77, 5, !dbg !3116
  br i1 %78, label %79, label %98, !dbg !3117

79:                                               ; preds = %71
  %80 = load i32, ptr %8, align 4, !dbg !3118
  %81 = sext i32 %80 to i64, !dbg !3119
  %82 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %81, !dbg !3119
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 1, !dbg !3120
  %84 = load i8, ptr %83, align 4, !dbg !3120
  %85 = zext i8 %84 to i32, !dbg !3119
  %86 = icmp ne i32 %85, 1, !dbg !3121
  br i1 %86, label %87, label %98, !dbg !3122

87:                                               ; preds = %79
  %88 = load i32, ptr %8, align 4, !dbg !3123
  %89 = load ptr, ptr %7, align 8, !dbg !3124
  %90 = ptrtoint ptr %89 to i64, !dbg !3125
  %91 = sub i64 %90, ptrtoint (ptr @Segments to i64), !dbg !3125
  %92 = sdiv exact i64 %91, 512, !dbg !3125
  %93 = trunc i64 %92 to i32, !dbg !3124
  %94 = load i32, ptr %6, align 4, !dbg !3126
  %95 = call noundef i32 @_Z10check_pokeiii(i32 noundef %88, i32 noundef %93, i32 noundef %94), !dbg !3127
  %96 = icmp ne i32 %95, 0, !dbg !3127
  br i1 %96, label %97, label %98, !dbg !3122

97:                                               ; preds = %87
  store i32 0, ptr %3, align 4, !dbg !3128
  br label %107, !dbg !3128

98:                                               ; preds = %87, %79, %71
  br label %99, !dbg !3129

99:                                               ; preds = %98
  %100 = load i32, ptr %8, align 4, !dbg !3130
  %101 = sext i32 %100 to i64, !dbg !3131
  %102 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %101, !dbg !3131
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 3, !dbg !3132
  %104 = load i16, ptr %103, align 2, !dbg !3132
  %105 = sext i16 %104 to i32, !dbg !3131
  store i32 %105, ptr %8, align 4, !dbg !3133
  br label %68, !dbg !3134, !llvm.loop !3135

106:                                              ; preds = %68
  store i32 1, ptr %3, align 4, !dbg !3137
  br label %107, !dbg !3137

107:                                              ; preds = %106, %97, %55
  %108 = load i32, ptr %3, align 4, !dbg !3138
  ret i32 %108, !dbg !3138
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15wall_close_doorP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !3139 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3140, !DIExpression(), !3141)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3142, !DIExpression(), !3143)
    #dbg_declare(ptr %5, !3144, !DIExpression(), !3145)
    #dbg_declare(ptr %6, !3146, !DIExpression(), !3147)
    #dbg_declare(ptr %7, !3148, !DIExpression(), !3149)
    #dbg_declare(ptr %8, !3150, !DIExpression(), !3151)
  %11 = load ptr, ptr %3, align 8, !dbg !3152
  %12 = getelementptr inbounds nuw %struct.segment, ptr %11, i32 0, i32 0, !dbg !3152
  %13 = load i32, ptr %4, align 4, !dbg !3152
  %14 = sext i32 %13 to i64, !dbg !3152
  %15 = getelementptr inbounds [6 x %struct.side], ptr %12, i64 0, i64 %14, !dbg !3152
  %16 = getelementptr inbounds nuw %struct.side, ptr %15, i32 0, i32 2, !dbg !3152
  %17 = load i16, ptr %16, align 2, !dbg !3152
  %18 = sext i16 %17 to i32, !dbg !3152
  %19 = icmp ne i32 %18, -1, !dbg !3152
  %20 = zext i1 %19 to i32, !dbg !3152
  call void @_Z7_AssertiPKcS0_i(i32 noundef %20, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 729), !dbg !3152
  %21 = load ptr, ptr %3, align 8, !dbg !3153
  %22 = getelementptr inbounds nuw %struct.segment, ptr %21, i32 0, i32 0, !dbg !3154
  %23 = load i32, ptr %4, align 4, !dbg !3155
  %24 = sext i32 %23 to i64, !dbg !3153
  %25 = getelementptr inbounds [6 x %struct.side], ptr %22, i64 0, i64 %24, !dbg !3153
  %26 = getelementptr inbounds nuw %struct.side, ptr %25, i32 0, i32 2, !dbg !3156
  %27 = load i16, ptr %26, align 2, !dbg !3156
  %28 = sext i16 %27 to i64, !dbg !3157
  %29 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %28, !dbg !3157
  store ptr %29, ptr %5, align 8, !dbg !3158
  %30 = load ptr, ptr %5, align 8, !dbg !3159
  %31 = getelementptr inbounds nuw %struct.wall, ptr %30, i32 0, i32 6, !dbg !3161
  %32 = load i8, ptr %31, align 2, !dbg !3161
  %33 = zext i8 %32 to i32, !dbg !3159
  %34 = icmp eq i32 %33, 3, !dbg !3162
  br i1 %34, label %47, label %35, !dbg !3163

35:                                               ; preds = %2
  %36 = load ptr, ptr %5, align 8, !dbg !3164
  %37 = getelementptr inbounds nuw %struct.wall, ptr %36, i32 0, i32 6, !dbg !3165
  %38 = load i8, ptr %37, align 2, !dbg !3165
  %39 = zext i8 %38 to i32, !dbg !3164
  %40 = icmp eq i32 %39, 2, !dbg !3166
  br i1 %40, label %47, label %41, !dbg !3167

41:                                               ; preds = %35
  %42 = load ptr, ptr %5, align 8, !dbg !3168
  %43 = getelementptr inbounds nuw %struct.wall, ptr %42, i32 0, i32 6, !dbg !3169
  %44 = load i8, ptr %43, align 2, !dbg !3169
  %45 = zext i8 %44 to i32, !dbg !3168
  %46 = icmp eq i32 %45, 0, !dbg !3170
  br i1 %46, label %47, label %48, !dbg !3167

47:                                               ; preds = %41, %35, %2
  br label %273, !dbg !3171

48:                                               ; preds = %41
  %49 = load ptr, ptr %3, align 8, !dbg !3172
  %50 = load i32, ptr %4, align 4, !dbg !3174
  %51 = call noundef i32 @_Z12is_door_freeP7segmenti(ptr noundef %49, i32 noundef %50), !dbg !3175
  %52 = icmp ne i32 %51, 0, !dbg !3175
  br i1 %52, label %54, label %53, !dbg !3176

53:                                               ; preds = %48
  br label %273, !dbg !3177

54:                                               ; preds = %48
  %55 = load ptr, ptr %5, align 8, !dbg !3178
  %56 = getelementptr inbounds nuw %struct.wall, ptr %55, i32 0, i32 6, !dbg !3180
  %57 = load i8, ptr %56, align 2, !dbg !3180
  %58 = zext i8 %57 to i32, !dbg !3178
  %59 = icmp eq i32 %58, 1, !dbg !3181
  br i1 %59, label %60, label %152, !dbg !3181

60:                                               ; preds = %54
    #dbg_declare(ptr %9, !3182, !DIExpression(), !3184)
  store ptr null, ptr %6, align 8, !dbg !3185
  store i32 0, ptr %9, align 4, !dbg !3186
  br label %61, !dbg !3188

61:                                               ; preds = %119, %60
  %62 = load i32, ptr %9, align 4, !dbg !3189
  %63 = load i32, ptr @Num_open_doors, align 4, !dbg !3191
  %64 = icmp slt i32 %62, %63, !dbg !3192
  br i1 %64, label %65, label %122, !dbg !3193

65:                                               ; preds = %61
  %66 = load i32, ptr %9, align 4, !dbg !3194
  %67 = sext i32 %66 to i64, !dbg !3196
  %68 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %67, !dbg !3196
  store ptr %68, ptr %6, align 8, !dbg !3197
  %69 = load ptr, ptr %6, align 8, !dbg !3198
  %70 = getelementptr inbounds nuw %struct.active_door, ptr %69, i32 0, i32 1, !dbg !3200
  %71 = getelementptr inbounds [2 x i16], ptr %70, i64 0, i64 0, !dbg !3198
  %72 = load i16, ptr %71, align 4, !dbg !3198
  %73 = sext i16 %72 to i64, !dbg !3198
  %74 = load ptr, ptr %5, align 8, !dbg !3201
  %75 = ptrtoint ptr %74 to i64, !dbg !3202
  %76 = sub i64 %75, ptrtoint (ptr @Walls to i64), !dbg !3202
  %77 = sdiv exact i64 %76, 24, !dbg !3202
  %78 = icmp eq i64 %73, %77, !dbg !3203
  br i1 %78, label %117, label %79, !dbg !3204

79:                                               ; preds = %65
  %80 = load ptr, ptr %6, align 8, !dbg !3205
  %81 = getelementptr inbounds nuw %struct.active_door, ptr %80, i32 0, i32 2, !dbg !3206
  %82 = getelementptr inbounds [2 x i16], ptr %81, i64 0, i64 0, !dbg !3205
  %83 = load i16, ptr %82, align 4, !dbg !3205
  %84 = sext i16 %83 to i64, !dbg !3205
  %85 = load ptr, ptr %5, align 8, !dbg !3207
  %86 = ptrtoint ptr %85 to i64, !dbg !3208
  %87 = sub i64 %86, ptrtoint (ptr @Walls to i64), !dbg !3208
  %88 = sdiv exact i64 %87, 24, !dbg !3208
  %89 = icmp eq i64 %84, %88, !dbg !3209
  br i1 %89, label %117, label %90, !dbg !3210

90:                                               ; preds = %79
  %91 = load ptr, ptr %6, align 8, !dbg !3211
  %92 = getelementptr inbounds nuw %struct.active_door, ptr %91, i32 0, i32 0, !dbg !3212
  %93 = load i32, ptr %92, align 4, !dbg !3212
  %94 = icmp eq i32 %93, 2, !dbg !3213
  br i1 %94, label %95, label %118, !dbg !3214

95:                                               ; preds = %90
  %96 = load ptr, ptr %6, align 8, !dbg !3215
  %97 = getelementptr inbounds nuw %struct.active_door, ptr %96, i32 0, i32 1, !dbg !3216
  %98 = getelementptr inbounds [2 x i16], ptr %97, i64 0, i64 1, !dbg !3215
  %99 = load i16, ptr %98, align 2, !dbg !3215
  %100 = sext i16 %99 to i64, !dbg !3215
  %101 = load ptr, ptr %5, align 8, !dbg !3217
  %102 = ptrtoint ptr %101 to i64, !dbg !3218
  %103 = sub i64 %102, ptrtoint (ptr @Walls to i64), !dbg !3218
  %104 = sdiv exact i64 %103, 24, !dbg !3218
  %105 = icmp eq i64 %100, %104, !dbg !3219
  br i1 %105, label %117, label %106, !dbg !3220

106:                                              ; preds = %95
  %107 = load ptr, ptr %6, align 8, !dbg !3221
  %108 = getelementptr inbounds nuw %struct.active_door, ptr %107, i32 0, i32 2, !dbg !3222
  %109 = getelementptr inbounds [2 x i16], ptr %108, i64 0, i64 1, !dbg !3221
  %110 = load i16, ptr %109, align 2, !dbg !3221
  %111 = sext i16 %110 to i64, !dbg !3221
  %112 = load ptr, ptr %5, align 8, !dbg !3223
  %113 = ptrtoint ptr %112 to i64, !dbg !3224
  %114 = sub i64 %113, ptrtoint (ptr @Walls to i64), !dbg !3224
  %115 = sdiv exact i64 %114, 24, !dbg !3224
  %116 = icmp eq i64 %111, %115, !dbg !3225
  br i1 %116, label %117, label %118, !dbg !3210

117:                                              ; preds = %106, %95, %79, %65
  br label %123, !dbg !3226

118:                                              ; preds = %106, %90
  br label %119, !dbg !3227

119:                                              ; preds = %118
  %120 = load i32, ptr %9, align 4, !dbg !3228
  %121 = add nsw i32 %120, 1, !dbg !3228
  store i32 %121, ptr %9, align 4, !dbg !3228
  br label %61, !dbg !3229, !llvm.loop !3230

122:                                              ; preds = %61
  br label %123, !dbg !3232

123:                                              ; preds = %122, %117
  %124 = load i32, ptr %9, align 4, !dbg !3232
  %125 = load i32, ptr @Num_open_doors, align 4, !dbg !3232
  %126 = icmp slt i32 %124, %125, !dbg !3232
  %127 = zext i1 %126 to i32, !dbg !3232
  call void @_Z7_AssertiPKcS0_i(i32 noundef %127, ptr noundef @.str.9, ptr noundef @.str.1, i32 noundef 755), !dbg !3232
  %128 = load ptr, ptr %6, align 8, !dbg !3233
  %129 = icmp ne ptr %128, null, !dbg !3233
  %130 = zext i1 %129 to i32, !dbg !3233
  call void @_Z7_AssertiPKcS0_i(i32 noundef %130, ptr noundef @.str.10, ptr noundef @.str.1, i32 noundef 756), !dbg !3233
  %131 = load ptr, ptr %5, align 8, !dbg !3234
  %132 = getelementptr inbounds nuw %struct.wall, ptr %131, i32 0, i32 8, !dbg !3235
  %133 = load i8, ptr %132, align 4, !dbg !3235
  %134 = sext i8 %133 to i64, !dbg !3236
  %135 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %134, !dbg !3236
  %136 = getelementptr inbounds nuw %struct.wclip, ptr %135, i32 0, i32 0, !dbg !3237
  %137 = load i32, ptr %136, align 4, !dbg !3237
  %138 = load ptr, ptr %6, align 8, !dbg !3238
  %139 = getelementptr inbounds nuw %struct.active_door, ptr %138, i32 0, i32 3, !dbg !3239
  %140 = load i32, ptr %139, align 4, !dbg !3239
  %141 = sub nsw i32 %137, %140, !dbg !3240
  %142 = load ptr, ptr %6, align 8, !dbg !3241
  %143 = getelementptr inbounds nuw %struct.active_door, ptr %142, i32 0, i32 3, !dbg !3242
  store i32 %141, ptr %143, align 4, !dbg !3243
  %144 = load ptr, ptr %6, align 8, !dbg !3244
  %145 = getelementptr inbounds nuw %struct.active_door, ptr %144, i32 0, i32 3, !dbg !3246
  %146 = load i32, ptr %145, align 4, !dbg !3246
  %147 = icmp slt i32 %146, 0, !dbg !3247
  br i1 %147, label %148, label %151, !dbg !3247

148:                                              ; preds = %123
  %149 = load ptr, ptr %6, align 8, !dbg !3248
  %150 = getelementptr inbounds nuw %struct.active_door, ptr %149, i32 0, i32 3, !dbg !3249
  store i32 0, ptr %150, align 4, !dbg !3250
  br label %151, !dbg !3248

151:                                              ; preds = %148, %123
  br label %169, !dbg !3251

152:                                              ; preds = %54
  %153 = load ptr, ptr %5, align 8, !dbg !3252
  %154 = getelementptr inbounds nuw %struct.wall, ptr %153, i32 0, i32 6, !dbg !3252
  %155 = load i8, ptr %154, align 2, !dbg !3252
  %156 = zext i8 %155 to i32, !dbg !3252
  %157 = icmp eq i32 %156, 4, !dbg !3252
  %158 = zext i1 %157 to i32, !dbg !3252
  call void @_Z7_AssertiPKcS0_i(i32 noundef %158, ptr noundef @.str.17, ptr noundef @.str.1, i32 noundef 765), !dbg !3252
  %159 = load i32, ptr @Num_open_doors, align 4, !dbg !3254
  %160 = sext i32 %159 to i64, !dbg !3255
  %161 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %160, !dbg !3255
  store ptr %161, ptr %6, align 8, !dbg !3256
  %162 = load ptr, ptr %6, align 8, !dbg !3257
  %163 = getelementptr inbounds nuw %struct.active_door, ptr %162, i32 0, i32 3, !dbg !3258
  store i32 0, ptr %163, align 4, !dbg !3259
  %164 = load i32, ptr @Num_open_doors, align 4, !dbg !3260
  %165 = add nsw i32 %164, 1, !dbg !3260
  store i32 %165, ptr @Num_open_doors, align 4, !dbg !3260
  %166 = load i32, ptr @Num_open_doors, align 4, !dbg !3261
  %167 = icmp slt i32 %166, 90, !dbg !3261
  %168 = zext i1 %167 to i32, !dbg !3261
  call void @_Z7_AssertiPKcS0_i(i32 noundef %168, ptr noundef @.str.12, ptr noundef @.str.1, i32 noundef 769), !dbg !3261
  br label %169

169:                                              ; preds = %152, %151
  %170 = load ptr, ptr %5, align 8, !dbg !3262
  %171 = getelementptr inbounds nuw %struct.wall, ptr %170, i32 0, i32 6, !dbg !3263
  store i8 3, ptr %171, align 2, !dbg !3264
  %172 = load ptr, ptr %3, align 8, !dbg !3265
  %173 = getelementptr inbounds nuw %struct.segment, ptr %172, i32 0, i32 1, !dbg !3266
  %174 = load i32, ptr %4, align 4, !dbg !3267
  %175 = sext i32 %174 to i64, !dbg !3265
  %176 = getelementptr inbounds [6 x i16], ptr %173, i64 0, i64 %175, !dbg !3265
  %177 = load i16, ptr %176, align 2, !dbg !3265
  %178 = sext i16 %177 to i64, !dbg !3268
  %179 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %178, !dbg !3268
  store ptr %179, ptr %8, align 8, !dbg !3269
  %180 = load ptr, ptr %3, align 8, !dbg !3270
  %181 = load ptr, ptr %8, align 8, !dbg !3271
  %182 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %180, ptr noundef %181), !dbg !3272
  store i32 %182, ptr %7, align 4, !dbg !3273
  %183 = load i32, ptr %7, align 4, !dbg !3274
  %184 = icmp ne i32 %183, -1, !dbg !3274
  %185 = zext i1 %184 to i32, !dbg !3274
  call void @_Z7_AssertiPKcS0_i(i32 noundef %185, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 777), !dbg !3274
  %186 = load ptr, ptr %8, align 8, !dbg !3275
  %187 = getelementptr inbounds nuw %struct.segment, ptr %186, i32 0, i32 0, !dbg !3276
  %188 = load i32, ptr %7, align 4, !dbg !3277
  %189 = sext i32 %188 to i64, !dbg !3275
  %190 = getelementptr inbounds [6 x %struct.side], ptr %187, i64 0, i64 %189, !dbg !3275
  %191 = getelementptr inbounds nuw %struct.side, ptr %190, i32 0, i32 2, !dbg !3278
  %192 = load i16, ptr %191, align 2, !dbg !3278
  %193 = sext i16 %192 to i64, !dbg !3279
  %194 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %193, !dbg !3279
  %195 = getelementptr inbounds nuw %struct.wall, ptr %194, i32 0, i32 6, !dbg !3280
  store i8 3, ptr %195, align 2, !dbg !3281
  %196 = load ptr, ptr %3, align 8, !dbg !3282
  %197 = getelementptr inbounds nuw %struct.segment, ptr %196, i32 0, i32 0, !dbg !3283
  %198 = load i32, ptr %4, align 4, !dbg !3284
  %199 = sext i32 %198 to i64, !dbg !3282
  %200 = getelementptr inbounds [6 x %struct.side], ptr %197, i64 0, i64 %199, !dbg !3282
  %201 = getelementptr inbounds nuw %struct.side, ptr %200, i32 0, i32 2, !dbg !3285
  %202 = load i16, ptr %201, align 2, !dbg !3285
  %203 = load ptr, ptr %6, align 8, !dbg !3286
  %204 = getelementptr inbounds nuw %struct.active_door, ptr %203, i32 0, i32 1, !dbg !3287
  %205 = getelementptr inbounds [2 x i16], ptr %204, i64 0, i64 0, !dbg !3286
  store i16 %202, ptr %205, align 4, !dbg !3288
  %206 = load ptr, ptr %8, align 8, !dbg !3289
  %207 = getelementptr inbounds nuw %struct.segment, ptr %206, i32 0, i32 0, !dbg !3290
  %208 = load i32, ptr %7, align 4, !dbg !3291
  %209 = sext i32 %208 to i64, !dbg !3289
  %210 = getelementptr inbounds [6 x %struct.side], ptr %207, i64 0, i64 %209, !dbg !3289
  %211 = getelementptr inbounds nuw %struct.side, ptr %210, i32 0, i32 2, !dbg !3292
  %212 = load i16, ptr %211, align 2, !dbg !3292
  %213 = load ptr, ptr %6, align 8, !dbg !3293
  %214 = getelementptr inbounds nuw %struct.active_door, ptr %213, i32 0, i32 2, !dbg !3294
  %215 = getelementptr inbounds [2 x i16], ptr %214, i64 0, i64 0, !dbg !3293
  store i16 %212, ptr %215, align 4, !dbg !3295
  %216 = load ptr, ptr %3, align 8, !dbg !3296
  %217 = ptrtoint ptr %216 to i64, !dbg !3296
  %218 = sub i64 %217, ptrtoint (ptr @Segments to i64), !dbg !3296
  %219 = sdiv exact i64 %218, 512, !dbg !3296
  %220 = icmp ne i64 %219, -1, !dbg !3296
  %221 = zext i1 %220 to i32, !dbg !3296
  call void @_Z7_AssertiPKcS0_i(i32 noundef %221, ptr noundef @.str.13, ptr noundef @.str.1, i32 noundef 784), !dbg !3296
  %222 = load i32, ptr @Newdemo_state, align 4, !dbg !3297
  %223 = icmp eq i32 %222, 1, !dbg !3299
  br i1 %223, label %224, label %231, !dbg !3299

224:                                              ; preds = %169
  %225 = load ptr, ptr %3, align 8, !dbg !3300
  %226 = ptrtoint ptr %225 to i64, !dbg !3302
  %227 = sub i64 %226, ptrtoint (ptr @Segments to i64), !dbg !3302
  %228 = sdiv exact i64 %227, 512, !dbg !3302
  %229 = trunc i64 %228 to i32, !dbg !3300
  %230 = load i32, ptr %4, align 4, !dbg !3303
  call void @_Z27newdemo_record_door_openingii(i32 noundef %229, i32 noundef %230), !dbg !3304
  br label %231, !dbg !3305

231:                                              ; preds = %224, %169
  %232 = load ptr, ptr %5, align 8, !dbg !3306
  %233 = getelementptr inbounds nuw %struct.wall, ptr %232, i32 0, i32 3, !dbg !3308
  %234 = load i32, ptr %233, align 4, !dbg !3308
  %235 = icmp ne i32 %234, -1, !dbg !3309
  br i1 %235, label %236, label %237, !dbg !3309

236:                                              ; preds = %231
  call void @_Z4Int3v(), !dbg !3310
  br label %240, !dbg !3312

237:                                              ; preds = %231
  %238 = load ptr, ptr %6, align 8, !dbg !3313
  %239 = getelementptr inbounds nuw %struct.active_door, ptr %238, i32 0, i32 0, !dbg !3314
  store i32 1, ptr %239, align 4, !dbg !3315
  br label %240

240:                                              ; preds = %237, %236
  %241 = load i32, ptr @Newdemo_state, align 4, !dbg !3316
  %242 = icmp ne i32 %241, 2, !dbg !3318
  br i1 %242, label %243, label %273, !dbg !3318

243:                                              ; preds = %240
    #dbg_declare(ptr %10, !3319, !DIExpression(), !3321)
  %244 = load ptr, ptr %3, align 8, !dbg !3322
  %245 = load i32, ptr %4, align 4, !dbg !3323
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %10, ptr noundef %244, i32 noundef %245), !dbg !3324
  %246 = load ptr, ptr %5, align 8, !dbg !3325
  %247 = getelementptr inbounds nuw %struct.wall, ptr %246, i32 0, i32 8, !dbg !3327
  %248 = load i8, ptr %247, align 4, !dbg !3327
  %249 = sext i8 %248 to i64, !dbg !3328
  %250 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %249, !dbg !3328
  %251 = getelementptr inbounds nuw %struct.wclip, ptr %250, i32 0, i32 3, !dbg !3329
  %252 = load i16, ptr %251, align 2, !dbg !3329
  %253 = sext i16 %252 to i32, !dbg !3328
  %254 = icmp sgt i32 %253, -1, !dbg !3330
  br i1 %254, label %255, label %272, !dbg !3330

255:                                              ; preds = %243
  %256 = load ptr, ptr %5, align 8, !dbg !3331
  %257 = getelementptr inbounds nuw %struct.wall, ptr %256, i32 0, i32 8, !dbg !3332
  %258 = load i8, ptr %257, align 4, !dbg !3332
  %259 = sext i8 %258 to i64, !dbg !3333
  %260 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %259, !dbg !3333
  %261 = getelementptr inbounds nuw %struct.wclip, ptr %260, i32 0, i32 3, !dbg !3334
  %262 = load i16, ptr %261, align 2, !dbg !3334
  %263 = sext i16 %262 to i32, !dbg !3333
  %264 = load ptr, ptr %3, align 8, !dbg !3335
  %265 = ptrtoint ptr %264 to i64, !dbg !3336
  %266 = sub i64 %265, ptrtoint (ptr @Segments to i64), !dbg !3336
  %267 = sdiv exact i64 %266, 512, !dbg !3336
  %268 = trunc i64 %267 to i16, !dbg !3335
  %269 = load i32, ptr %4, align 4, !dbg !3337
  %270 = trunc i32 %269 to i16, !dbg !3337
  %271 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %263, i16 noundef signext %268, i16 noundef signext %270, ptr noundef %10, i32 noundef 0, i32 noundef 65536), !dbg !3338
  br label %272, !dbg !3338

272:                                              ; preds = %255, %243
  br label %273, !dbg !3339

273:                                              ; preds = %47, %53, %272, %240
  ret void, !dbg !3340
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12do_door_openi(i32 noundef %0) #1 !dbg !3341 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !3342, !DIExpression(), !3343)
    #dbg_declare(ptr %3, !3344, !DIExpression(), !3345)
    #dbg_declare(ptr %4, !3346, !DIExpression(), !3347)
  %15 = load i32, ptr %2, align 4, !dbg !3348
  %16 = icmp ne i32 %15, -1, !dbg !3348
  %17 = zext i1 %16 to i32, !dbg !3348
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str.18, ptr noundef @.str.1, i32 noundef 816), !dbg !3348
  %18 = load i32, ptr %2, align 4, !dbg !3349
  %19 = sext i32 %18 to i64, !dbg !3350
  %20 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %19, !dbg !3350
  store ptr %20, ptr %4, align 8, !dbg !3351
  store i32 0, ptr %3, align 4, !dbg !3352
  br label %21, !dbg !3354

21:                                               ; preds = %255, %1
  %22 = load i32, ptr %3, align 4, !dbg !3355
  %23 = load ptr, ptr %4, align 8, !dbg !3357
  %24 = getelementptr inbounds nuw %struct.active_door, ptr %23, i32 0, i32 0, !dbg !3358
  %25 = load i32, ptr %24, align 4, !dbg !3358
  %26 = icmp slt i32 %22, %25, !dbg !3359
  br i1 %26, label %27, label %258, !dbg !3360

27:                                               ; preds = %21
    #dbg_declare(ptr %5, !3361, !DIExpression(), !3363)
    #dbg_declare(ptr %6, !3364, !DIExpression(), !3365)
    #dbg_declare(ptr %7, !3366, !DIExpression(), !3367)
    #dbg_declare(ptr %8, !3368, !DIExpression(), !3369)
    #dbg_declare(ptr %9, !3370, !DIExpression(), !3371)
    #dbg_declare(ptr %10, !3372, !DIExpression(), !3373)
    #dbg_declare(ptr %11, !3374, !DIExpression(), !3375)
    #dbg_declare(ptr %12, !3376, !DIExpression(), !3377)
    #dbg_declare(ptr %13, !3378, !DIExpression(), !3379)
    #dbg_declare(ptr %14, !3380, !DIExpression(), !3381)
  %28 = load ptr, ptr %4, align 8, !dbg !3382
  %29 = getelementptr inbounds nuw %struct.active_door, ptr %28, i32 0, i32 1, !dbg !3383
  %30 = load i32, ptr %3, align 4, !dbg !3384
  %31 = sext i32 %30 to i64, !dbg !3382
  %32 = getelementptr inbounds [2 x i16], ptr %29, i64 0, i64 %31, !dbg !3382
  %33 = load i16, ptr %32, align 2, !dbg !3382
  %34 = sext i16 %33 to i64, !dbg !3385
  %35 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %34, !dbg !3385
  store ptr %35, ptr %5, align 8, !dbg !3386
  %36 = load ptr, ptr %4, align 8, !dbg !3387
  %37 = getelementptr inbounds nuw %struct.active_door, ptr %36, i32 0, i32 1, !dbg !3388
  %38 = load i32, ptr %3, align 4, !dbg !3389
  %39 = sext i32 %38 to i64, !dbg !3387
  %40 = getelementptr inbounds [2 x i16], ptr %37, i64 0, i64 %39, !dbg !3387
  %41 = load i16, ptr %40, align 2, !dbg !3387
  %42 = sext i16 %41 to i32, !dbg !3387
  call void @_Z18kill_stuck_objectsi(i32 noundef %42), !dbg !3390
  %43 = load ptr, ptr %4, align 8, !dbg !3391
  %44 = getelementptr inbounds nuw %struct.active_door, ptr %43, i32 0, i32 2, !dbg !3392
  %45 = load i32, ptr %3, align 4, !dbg !3393
  %46 = sext i32 %45 to i64, !dbg !3391
  %47 = getelementptr inbounds [2 x i16], ptr %44, i64 0, i64 %46, !dbg !3391
  %48 = load i16, ptr %47, align 2, !dbg !3391
  %49 = sext i16 %48 to i32, !dbg !3391
  call void @_Z18kill_stuck_objectsi(i32 noundef %49), !dbg !3394
  %50 = load ptr, ptr %5, align 8, !dbg !3395
  %51 = getelementptr inbounds nuw %struct.wall, ptr %50, i32 0, i32 0, !dbg !3396
  %52 = load i32, ptr %51, align 4, !dbg !3396
  %53 = sext i32 %52 to i64, !dbg !3397
  %54 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %53, !dbg !3397
  store ptr %54, ptr %9, align 8, !dbg !3398
  %55 = load ptr, ptr %5, align 8, !dbg !3399
  %56 = getelementptr inbounds nuw %struct.wall, ptr %55, i32 0, i32 1, !dbg !3400
  %57 = load i32, ptr %56, align 4, !dbg !3400
  store i32 %57, ptr %7, align 4, !dbg !3401
  %58 = load ptr, ptr %9, align 8, !dbg !3402
  %59 = getelementptr inbounds nuw %struct.segment, ptr %58, i32 0, i32 0, !dbg !3402
  %60 = load i32, ptr %7, align 4, !dbg !3402
  %61 = sext i32 %60 to i64, !dbg !3402
  %62 = getelementptr inbounds [6 x %struct.side], ptr %59, i64 0, i64 %61, !dbg !3402
  %63 = getelementptr inbounds nuw %struct.side, ptr %62, i32 0, i32 2, !dbg !3402
  %64 = load i16, ptr %63, align 2, !dbg !3402
  %65 = sext i16 %64 to i32, !dbg !3402
  %66 = icmp ne i32 %65, -1, !dbg !3402
  %67 = zext i1 %66 to i32, !dbg !3402
  call void @_Z7_AssertiPKcS0_i(i32 noundef %67, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 834), !dbg !3402
  %68 = load ptr, ptr %9, align 8, !dbg !3403
  %69 = getelementptr inbounds nuw %struct.segment, ptr %68, i32 0, i32 1, !dbg !3404
  %70 = load i32, ptr %7, align 4, !dbg !3405
  %71 = sext i32 %70 to i64, !dbg !3403
  %72 = getelementptr inbounds [6 x i16], ptr %69, i64 0, i64 %71, !dbg !3403
  %73 = load i16, ptr %72, align 2, !dbg !3403
  %74 = sext i16 %73 to i64, !dbg !3406
  %75 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %74, !dbg !3406
  store ptr %75, ptr %8, align 8, !dbg !3407
  %76 = load ptr, ptr %9, align 8, !dbg !3408
  %77 = load ptr, ptr %8, align 8, !dbg !3409
  %78 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %76, ptr noundef %77), !dbg !3410
  store i32 %78, ptr %6, align 4, !dbg !3411
  %79 = load i32, ptr %6, align 4, !dbg !3412
  %80 = icmp ne i32 %79, -1, !dbg !3412
  %81 = zext i1 %80 to i32, !dbg !3412
  call void @_Z7_AssertiPKcS0_i(i32 noundef %81, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 838), !dbg !3412
  %82 = load i32, ptr @FrameTime, align 4, !dbg !3413
  %83 = load ptr, ptr %4, align 8, !dbg !3414
  %84 = getelementptr inbounds nuw %struct.active_door, ptr %83, i32 0, i32 3, !dbg !3415
  %85 = load i32, ptr %84, align 4, !dbg !3416
  %86 = add nsw i32 %85, %82, !dbg !3416
  store i32 %86, ptr %84, align 4, !dbg !3416
  %87 = load ptr, ptr %4, align 8, !dbg !3417
  %88 = getelementptr inbounds nuw %struct.active_door, ptr %87, i32 0, i32 3, !dbg !3418
  %89 = load i32, ptr %88, align 4, !dbg !3418
  store i32 %89, ptr %10, align 4, !dbg !3419
  %90 = load ptr, ptr %5, align 8, !dbg !3420
  %91 = getelementptr inbounds nuw %struct.wall, ptr %90, i32 0, i32 8, !dbg !3421
  %92 = load i8, ptr %91, align 4, !dbg !3421
  %93 = sext i8 %92 to i64, !dbg !3422
  %94 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %93, !dbg !3422
  %95 = getelementptr inbounds nuw %struct.wclip, ptr %94, i32 0, i32 1, !dbg !3423
  %96 = load i16, ptr %95, align 4, !dbg !3423
  %97 = sext i16 %96 to i32, !dbg !3422
  store i32 %97, ptr %14, align 4, !dbg !3424
  %98 = load ptr, ptr %5, align 8, !dbg !3425
  %99 = getelementptr inbounds nuw %struct.wall, ptr %98, i32 0, i32 8, !dbg !3426
  %100 = load i8, ptr %99, align 4, !dbg !3426
  %101 = sext i8 %100 to i64, !dbg !3427
  %102 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %101, !dbg !3427
  %103 = getelementptr inbounds nuw %struct.wclip, ptr %102, i32 0, i32 0, !dbg !3428
  %104 = load i32, ptr %103, align 4, !dbg !3428
  store i32 %104, ptr %11, align 4, !dbg !3429
  %105 = load i32, ptr %11, align 4, !dbg !3430
  %106 = load i32, ptr %14, align 4, !dbg !3431
  %107 = sdiv i32 %105, %106, !dbg !3432
  store i32 %107, ptr %12, align 4, !dbg !3433
  %108 = load i32, ptr %10, align 4, !dbg !3434
  %109 = load i32, ptr %12, align 4, !dbg !3435
  %110 = sdiv i32 %108, %109, !dbg !3436
  store i32 %110, ptr %13, align 4, !dbg !3437
  %111 = load i32, ptr %13, align 4, !dbg !3438
  %112 = load i32, ptr %14, align 4, !dbg !3440
  %113 = icmp slt i32 %111, %112, !dbg !3441
  br i1 %113, label %114, label %124, !dbg !3441

114:                                              ; preds = %27
  %115 = load ptr, ptr %9, align 8, !dbg !3442
  %116 = load i32, ptr %7, align 4, !dbg !3443
  %117 = load ptr, ptr %8, align 8, !dbg !3444
  %118 = load i32, ptr %6, align 4, !dbg !3445
  %119 = load ptr, ptr %5, align 8, !dbg !3446
  %120 = getelementptr inbounds nuw %struct.wall, ptr %119, i32 0, i32 8, !dbg !3447
  %121 = load i8, ptr %120, align 4, !dbg !3447
  %122 = sext i8 %121 to i32, !dbg !3446
  %123 = load i32, ptr %13, align 4, !dbg !3448
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %115, i32 noundef %116, ptr noundef %117, i32 noundef %118, i32 noundef %122, i32 noundef %123), !dbg !3449
  br label %124, !dbg !3449

124:                                              ; preds = %114, %27
  %125 = load i32, ptr %13, align 4, !dbg !3450
  %126 = load i32, ptr %14, align 4, !dbg !3452
  %127 = sdiv i32 %126, 2, !dbg !3453
  %128 = icmp sgt i32 %125, %127, !dbg !3454
  br i1 %128, label %129, label %158, !dbg !3454

129:                                              ; preds = %124
  %130 = load ptr, ptr %9, align 8, !dbg !3455
  %131 = getelementptr inbounds nuw %struct.segment, ptr %130, i32 0, i32 0, !dbg !3457
  %132 = load i32, ptr %7, align 4, !dbg !3458
  %133 = sext i32 %132 to i64, !dbg !3455
  %134 = getelementptr inbounds [6 x %struct.side], ptr %131, i64 0, i64 %133, !dbg !3455
  %135 = getelementptr inbounds nuw %struct.side, ptr %134, i32 0, i32 2, !dbg !3459
  %136 = load i16, ptr %135, align 2, !dbg !3459
  %137 = sext i16 %136 to i64, !dbg !3460
  %138 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %137, !dbg !3460
  %139 = getelementptr inbounds nuw %struct.wall, ptr %138, i32 0, i32 5, !dbg !3461
  %140 = load i8, ptr %139, align 1, !dbg !3462
  %141 = zext i8 %140 to i32, !dbg !3462
  %142 = or i32 %141, 2, !dbg !3462
  %143 = trunc i32 %142 to i8, !dbg !3462
  store i8 %143, ptr %139, align 1, !dbg !3462
  %144 = load ptr, ptr %8, align 8, !dbg !3463
  %145 = getelementptr inbounds nuw %struct.segment, ptr %144, i32 0, i32 0, !dbg !3464
  %146 = load i32, ptr %6, align 4, !dbg !3465
  %147 = sext i32 %146 to i64, !dbg !3463
  %148 = getelementptr inbounds [6 x %struct.side], ptr %145, i64 0, i64 %147, !dbg !3463
  %149 = getelementptr inbounds nuw %struct.side, ptr %148, i32 0, i32 2, !dbg !3466
  %150 = load i16, ptr %149, align 2, !dbg !3466
  %151 = sext i16 %150 to i64, !dbg !3467
  %152 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %151, !dbg !3467
  %153 = getelementptr inbounds nuw %struct.wall, ptr %152, i32 0, i32 5, !dbg !3468
  %154 = load i8, ptr %153, align 1, !dbg !3469
  %155 = zext i8 %154 to i32, !dbg !3469
  %156 = or i32 %155, 2, !dbg !3469
  %157 = trunc i32 %156 to i8, !dbg !3469
  store i8 %157, ptr %153, align 1, !dbg !3469
  br label %158, !dbg !3470

158:                                              ; preds = %129, %124
  %159 = load i32, ptr %13, align 4, !dbg !3471
  %160 = load i32, ptr %14, align 4, !dbg !3473
  %161 = sub nsw i32 %160, 1, !dbg !3474
  %162 = icmp sge i32 %159, %161, !dbg !3475
  br i1 %162, label %163, label %254, !dbg !3475

163:                                              ; preds = %158
  %164 = load ptr, ptr %9, align 8, !dbg !3476
  %165 = load i32, ptr %7, align 4, !dbg !3478
  %166 = load ptr, ptr %8, align 8, !dbg !3479
  %167 = load i32, ptr %6, align 4, !dbg !3480
  %168 = load ptr, ptr %5, align 8, !dbg !3481
  %169 = getelementptr inbounds nuw %struct.wall, ptr %168, i32 0, i32 8, !dbg !3482
  %170 = load i8, ptr %169, align 4, !dbg !3482
  %171 = sext i8 %170 to i32, !dbg !3481
  %172 = load i32, ptr %14, align 4, !dbg !3483
  %173 = sub nsw i32 %172, 1, !dbg !3484
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %164, i32 noundef %165, ptr noundef %166, i32 noundef %167, i32 noundef %171, i32 noundef %173), !dbg !3485
  %174 = load ptr, ptr %9, align 8, !dbg !3486
  %175 = getelementptr inbounds nuw %struct.segment, ptr %174, i32 0, i32 0, !dbg !3488
  %176 = load i32, ptr %7, align 4, !dbg !3489
  %177 = sext i32 %176 to i64, !dbg !3486
  %178 = getelementptr inbounds [6 x %struct.side], ptr %175, i64 0, i64 %177, !dbg !3486
  %179 = getelementptr inbounds nuw %struct.side, ptr %178, i32 0, i32 2, !dbg !3490
  %180 = load i16, ptr %179, align 2, !dbg !3490
  %181 = sext i16 %180 to i64, !dbg !3491
  %182 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %181, !dbg !3491
  %183 = getelementptr inbounds nuw %struct.wall, ptr %182, i32 0, i32 5, !dbg !3492
  %184 = load i8, ptr %183, align 1, !dbg !3492
  %185 = zext i8 %184 to i32, !dbg !3491
  %186 = and i32 %185, 16, !dbg !3493
  %187 = icmp ne i32 %186, 0, !dbg !3494
  br i1 %187, label %228, label %188, !dbg !3495

188:                                              ; preds = %163
  %189 = load i32, ptr %2, align 4, !dbg !3496
  store i32 %189, ptr %13, align 4, !dbg !3499
  br label %190, !dbg !3500

190:                                              ; preds = %202, %188
  %191 = load i32, ptr %13, align 4, !dbg !3501
  %192 = load i32, ptr @Num_open_doors, align 4, !dbg !3503
  %193 = icmp slt i32 %191, %192, !dbg !3504
  br i1 %193, label %194, label %205, !dbg !3505

194:                                              ; preds = %190
  %195 = load i32, ptr %13, align 4, !dbg !3506
  %196 = add nsw i32 %195, 1, !dbg !3507
  %197 = sext i32 %196 to i64, !dbg !3508
  %198 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %197, !dbg !3508
  %199 = load i32, ptr %13, align 4, !dbg !3509
  %200 = sext i32 %199 to i64, !dbg !3510
  %201 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %200, !dbg !3510
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %201, ptr align 4 %198, i64 16, i1 false), !dbg !3511
  br label %202, !dbg !3510

202:                                              ; preds = %194
  %203 = load i32, ptr %13, align 4, !dbg !3512
  %204 = add nsw i32 %203, 1, !dbg !3512
  store i32 %204, ptr %13, align 4, !dbg !3512
  br label %190, !dbg !3513, !llvm.loop !3514

205:                                              ; preds = %190
  %206 = load i32, ptr @Num_open_doors, align 4, !dbg !3516
  %207 = add nsw i32 %206, -1, !dbg !3516
  store i32 %207, ptr @Num_open_doors, align 4, !dbg !3516
  %208 = load ptr, ptr %9, align 8, !dbg !3517
  %209 = getelementptr inbounds nuw %struct.segment, ptr %208, i32 0, i32 0, !dbg !3518
  %210 = load i32, ptr %7, align 4, !dbg !3519
  %211 = sext i32 %210 to i64, !dbg !3517
  %212 = getelementptr inbounds [6 x %struct.side], ptr %209, i64 0, i64 %211, !dbg !3517
  %213 = getelementptr inbounds nuw %struct.side, ptr %212, i32 0, i32 2, !dbg !3520
  %214 = load i16, ptr %213, align 2, !dbg !3520
  %215 = sext i16 %214 to i64, !dbg !3521
  %216 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %215, !dbg !3521
  %217 = getelementptr inbounds nuw %struct.wall, ptr %216, i32 0, i32 6, !dbg !3522
  store i8 4, ptr %217, align 2, !dbg !3523
  %218 = load ptr, ptr %8, align 8, !dbg !3524
  %219 = getelementptr inbounds nuw %struct.segment, ptr %218, i32 0, i32 0, !dbg !3525
  %220 = load i32, ptr %6, align 4, !dbg !3526
  %221 = sext i32 %220 to i64, !dbg !3524
  %222 = getelementptr inbounds [6 x %struct.side], ptr %219, i64 0, i64 %221, !dbg !3524
  %223 = getelementptr inbounds nuw %struct.side, ptr %222, i32 0, i32 2, !dbg !3527
  %224 = load i16, ptr %223, align 2, !dbg !3527
  %225 = sext i16 %224 to i64, !dbg !3528
  %226 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %225, !dbg !3528
  %227 = getelementptr inbounds nuw %struct.wall, ptr %226, i32 0, i32 6, !dbg !3529
  store i8 4, ptr %227, align 2, !dbg !3530
  br label %253, !dbg !3531

228:                                              ; preds = %163
  %229 = load ptr, ptr %9, align 8, !dbg !3532
  %230 = getelementptr inbounds nuw %struct.segment, ptr %229, i32 0, i32 0, !dbg !3534
  %231 = load i32, ptr %7, align 4, !dbg !3535
  %232 = sext i32 %231 to i64, !dbg !3532
  %233 = getelementptr inbounds [6 x %struct.side], ptr %230, i64 0, i64 %232, !dbg !3532
  %234 = getelementptr inbounds nuw %struct.side, ptr %233, i32 0, i32 2, !dbg !3536
  %235 = load i16, ptr %234, align 2, !dbg !3536
  %236 = sext i16 %235 to i64, !dbg !3537
  %237 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %236, !dbg !3537
  %238 = getelementptr inbounds nuw %struct.wall, ptr %237, i32 0, i32 6, !dbg !3538
  store i8 2, ptr %238, align 2, !dbg !3539
  %239 = load ptr, ptr %8, align 8, !dbg !3540
  %240 = getelementptr inbounds nuw %struct.segment, ptr %239, i32 0, i32 0, !dbg !3541
  %241 = load i32, ptr %6, align 4, !dbg !3542
  %242 = sext i32 %241 to i64, !dbg !3540
  %243 = getelementptr inbounds [6 x %struct.side], ptr %240, i64 0, i64 %242, !dbg !3540
  %244 = getelementptr inbounds nuw %struct.side, ptr %243, i32 0, i32 2, !dbg !3543
  %245 = load i16, ptr %244, align 2, !dbg !3543
  %246 = sext i16 %245 to i64, !dbg !3544
  %247 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %246, !dbg !3544
  %248 = getelementptr inbounds nuw %struct.wall, ptr %247, i32 0, i32 6, !dbg !3545
  store i8 2, ptr %248, align 2, !dbg !3546
  %249 = load i32, ptr @Num_open_doors, align 4, !dbg !3547
  %250 = sext i32 %249 to i64, !dbg !3548
  %251 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %250, !dbg !3548
  %252 = getelementptr inbounds nuw %struct.active_door, ptr %251, i32 0, i32 3, !dbg !3549
  store i32 0, ptr %252, align 4, !dbg !3550
  br label %253

253:                                              ; preds = %228, %205
  br label %254, !dbg !3551

254:                                              ; preds = %253, %158
  br label %255, !dbg !3552

255:                                              ; preds = %254
  %256 = load i32, ptr %3, align 4, !dbg !3553
  %257 = add nsw i32 %256, 1, !dbg !3553
  store i32 %257, ptr %3, align 4, !dbg !3553
  br label %21, !dbg !3554, !llvm.loop !3555

258:                                              ; preds = %21
  ret void, !dbg !3557
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13do_door_closei(i32 noundef %0) #1 !dbg !3558 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
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
  %15 = alloca i32, align 4
  %16 = alloca %struct.vms_vector, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !3559, !DIExpression(), !3560)
    #dbg_declare(ptr %3, !3561, !DIExpression(), !3562)
    #dbg_declare(ptr %4, !3563, !DIExpression(), !3564)
    #dbg_declare(ptr %5, !3565, !DIExpression(), !3566)
  %17 = load i32, ptr %2, align 4, !dbg !3567
  %18 = icmp ne i32 %17, -1, !dbg !3567
  %19 = zext i1 %18 to i32, !dbg !3567
  call void @_Z7_AssertiPKcS0_i(i32 noundef %19, ptr noundef @.str.18, ptr noundef @.str.1, i32 noundef 891), !dbg !3567
  %20 = load i32, ptr %2, align 4, !dbg !3568
  %21 = sext i32 %20 to i64, !dbg !3569
  %22 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %21, !dbg !3569
  store ptr %22, ptr %4, align 8, !dbg !3570
  %23 = load ptr, ptr %4, align 8, !dbg !3571
  %24 = getelementptr inbounds nuw %struct.active_door, ptr %23, i32 0, i32 1, !dbg !3572
  %25 = getelementptr inbounds [2 x i16], ptr %24, i64 0, i64 0, !dbg !3571
  %26 = load i16, ptr %25, align 4, !dbg !3571
  %27 = sext i16 %26 to i64, !dbg !3573
  %28 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %27, !dbg !3573
  store ptr %28, ptr %5, align 8, !dbg !3574
  %29 = load ptr, ptr %5, align 8, !dbg !3575
  %30 = getelementptr inbounds nuw %struct.wall, ptr %29, i32 0, i32 5, !dbg !3577
  %31 = load i8, ptr %30, align 1, !dbg !3577
  %32 = zext i8 %31 to i32, !dbg !3575
  %33 = and i32 %32, 16, !dbg !3578
  %34 = icmp ne i32 %33, 0, !dbg !3575
  br i1 %34, label %35, label %62, !dbg !3575

35:                                               ; preds = %1
  %36 = load ptr, ptr %5, align 8, !dbg !3579
  %37 = getelementptr inbounds nuw %struct.wall, ptr %36, i32 0, i32 0, !dbg !3581
  %38 = load i32, ptr %37, align 4, !dbg !3581
  %39 = sext i32 %38 to i64, !dbg !3582
  %40 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %39, !dbg !3582
  %41 = load ptr, ptr %5, align 8, !dbg !3583
  %42 = getelementptr inbounds nuw %struct.wall, ptr %41, i32 0, i32 1, !dbg !3584
  %43 = load i32, ptr %42, align 4, !dbg !3584
  %44 = call noundef i32 @_Z12is_door_freeP7segmenti(ptr noundef %40, i32 noundef %43), !dbg !3585
  %45 = icmp ne i32 %44, 0, !dbg !3585
  br i1 %45, label %61, label %46, !dbg !3586

46:                                               ; preds = %35
  %47 = load ptr, ptr %5, align 8, !dbg !3587
  %48 = getelementptr inbounds nuw %struct.wall, ptr %47, i32 0, i32 0, !dbg !3589
  %49 = load i32, ptr %48, align 4, !dbg !3589
  %50 = load ptr, ptr %5, align 8, !dbg !3590
  %51 = getelementptr inbounds nuw %struct.wall, ptr %50, i32 0, i32 1, !dbg !3591
  %52 = load i32, ptr %51, align 4, !dbg !3591
  call void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef %49, i32 noundef %52, i32 noundef -1), !dbg !3592
  %53 = load ptr, ptr %5, align 8, !dbg !3593
  %54 = getelementptr inbounds nuw %struct.wall, ptr %53, i32 0, i32 0, !dbg !3594
  %55 = load i32, ptr %54, align 4, !dbg !3594
  %56 = sext i32 %55 to i64, !dbg !3595
  %57 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %56, !dbg !3595
  %58 = load ptr, ptr %5, align 8, !dbg !3596
  %59 = getelementptr inbounds nuw %struct.wall, ptr %58, i32 0, i32 1, !dbg !3597
  %60 = load i32, ptr %59, align 4, !dbg !3597
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %57, i32 noundef %60), !dbg !3598
  br label %271, !dbg !3599

61:                                               ; preds = %35
  br label %62, !dbg !3600

62:                                               ; preds = %61, %1
  store i32 0, ptr %3, align 4, !dbg !3601
  br label %63, !dbg !3603

63:                                               ; preds = %267, %62
  %64 = load i32, ptr %3, align 4, !dbg !3604
  %65 = load ptr, ptr %4, align 8, !dbg !3606
  %66 = getelementptr inbounds nuw %struct.active_door, ptr %65, i32 0, i32 0, !dbg !3607
  %67 = load i32, ptr %66, align 4, !dbg !3607
  %68 = icmp slt i32 %64, %67, !dbg !3608
  br i1 %68, label %69, label %270, !dbg !3609

69:                                               ; preds = %63
    #dbg_declare(ptr %6, !3610, !DIExpression(), !3612)
    #dbg_declare(ptr %7, !3613, !DIExpression(), !3614)
    #dbg_declare(ptr %8, !3615, !DIExpression(), !3616)
    #dbg_declare(ptr %9, !3617, !DIExpression(), !3618)
    #dbg_declare(ptr %10, !3619, !DIExpression(), !3620)
    #dbg_declare(ptr %11, !3621, !DIExpression(), !3622)
    #dbg_declare(ptr %12, !3623, !DIExpression(), !3624)
    #dbg_declare(ptr %13, !3625, !DIExpression(), !3626)
    #dbg_declare(ptr %14, !3627, !DIExpression(), !3628)
    #dbg_declare(ptr %15, !3629, !DIExpression(), !3630)
  %70 = load ptr, ptr %4, align 8, !dbg !3631
  %71 = getelementptr inbounds nuw %struct.active_door, ptr %70, i32 0, i32 1, !dbg !3632
  %72 = load i32, ptr %3, align 4, !dbg !3633
  %73 = sext i32 %72 to i64, !dbg !3631
  %74 = getelementptr inbounds [2 x i16], ptr %71, i64 0, i64 %73, !dbg !3631
  %75 = load i16, ptr %74, align 2, !dbg !3631
  %76 = sext i16 %75 to i64, !dbg !3634
  %77 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %76, !dbg !3634
  store ptr %77, ptr %6, align 8, !dbg !3635
  %78 = load ptr, ptr %6, align 8, !dbg !3636
  %79 = getelementptr inbounds nuw %struct.wall, ptr %78, i32 0, i32 0, !dbg !3637
  %80 = load i32, ptr %79, align 4, !dbg !3637
  %81 = sext i32 %80 to i64, !dbg !3638
  %82 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %81, !dbg !3638
  store ptr %82, ptr %10, align 8, !dbg !3639
  %83 = load ptr, ptr %6, align 8, !dbg !3640
  %84 = getelementptr inbounds nuw %struct.wall, ptr %83, i32 0, i32 1, !dbg !3641
  %85 = load i32, ptr %84, align 4, !dbg !3641
  store i32 %85, ptr %8, align 4, !dbg !3642
  %86 = load ptr, ptr %10, align 8, !dbg !3643
  %87 = getelementptr inbounds nuw %struct.segment, ptr %86, i32 0, i32 0, !dbg !3645
  %88 = load i32, ptr %8, align 4, !dbg !3646
  %89 = sext i32 %88 to i64, !dbg !3643
  %90 = getelementptr inbounds [6 x %struct.side], ptr %87, i64 0, i64 %89, !dbg !3643
  %91 = getelementptr inbounds nuw %struct.side, ptr %90, i32 0, i32 2, !dbg !3647
  %92 = load i16, ptr %91, align 2, !dbg !3647
  %93 = sext i16 %92 to i32, !dbg !3643
  %94 = icmp eq i32 %93, -1, !dbg !3648
  br i1 %94, label %95, label %96, !dbg !3648

95:                                               ; preds = %69
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.19), !dbg !3649
  br label %271, !dbg !3651

96:                                               ; preds = %69
  %97 = load ptr, ptr %10, align 8, !dbg !3652
  %98 = getelementptr inbounds nuw %struct.segment, ptr %97, i32 0, i32 1, !dbg !3653
  %99 = load i32, ptr %8, align 4, !dbg !3654
  %100 = sext i32 %99 to i64, !dbg !3652
  %101 = getelementptr inbounds [6 x i16], ptr %98, i64 0, i64 %100, !dbg !3652
  %102 = load i16, ptr %101, align 2, !dbg !3652
  %103 = sext i16 %102 to i64, !dbg !3655
  %104 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %103, !dbg !3655
  store ptr %104, ptr %9, align 8, !dbg !3656
  %105 = load ptr, ptr %10, align 8, !dbg !3657
  %106 = load ptr, ptr %9, align 8, !dbg !3658
  %107 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %105, ptr noundef %106), !dbg !3659
  store i32 %107, ptr %7, align 4, !dbg !3660
  %108 = load i32, ptr %7, align 4, !dbg !3661
  %109 = icmp ne i32 %108, -1, !dbg !3661
  %110 = zext i1 %109 to i32, !dbg !3661
  call void @_Z7_AssertiPKcS0_i(i32 noundef %110, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 929), !dbg !3661
  %111 = load i32, ptr @Newdemo_state, align 4, !dbg !3662
  %112 = icmp ne i32 %111, 2, !dbg !3664
  br i1 %112, label %113, label %161, !dbg !3664

113:                                              ; preds = %96
  %114 = load i32, ptr %3, align 4, !dbg !3665
  %115 = icmp eq i32 %114, 0, !dbg !3667
  br i1 %115, label %116, label %160, !dbg !3667

116:                                              ; preds = %113
  %117 = load ptr, ptr %4, align 8, !dbg !3668
  %118 = getelementptr inbounds nuw %struct.active_door, ptr %117, i32 0, i32 3, !dbg !3670
  %119 = load i32, ptr %118, align 4, !dbg !3670
  %120 = icmp eq i32 %119, 0, !dbg !3671
  br i1 %120, label %121, label %159, !dbg !3671

121:                                              ; preds = %116
    #dbg_declare(ptr %16, !3672, !DIExpression(), !3674)
  %122 = load ptr, ptr %10, align 8, !dbg !3675
  %123 = load i32, ptr %8, align 4, !dbg !3676
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %16, ptr noundef %122, i32 noundef %123), !dbg !3677
  %124 = load ptr, ptr %6, align 8, !dbg !3678
  %125 = getelementptr inbounds nuw %struct.wall, ptr %124, i32 0, i32 8, !dbg !3680
  %126 = load i8, ptr %125, align 4, !dbg !3680
  %127 = sext i8 %126 to i64, !dbg !3681
  %128 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %127, !dbg !3681
  %129 = getelementptr inbounds nuw %struct.wclip, ptr %128, i32 0, i32 4, !dbg !3682
  %130 = load i16, ptr %129, align 4, !dbg !3682
  %131 = sext i16 %130 to i32, !dbg !3681
  %132 = icmp sgt i32 %131, -1, !dbg !3683
  br i1 %132, label %133, label %158, !dbg !3683

133:                                              ; preds = %121
  %134 = load ptr, ptr %10, align 8, !dbg !3684
  %135 = getelementptr inbounds nuw %struct.segment, ptr %134, i32 0, i32 0, !dbg !3685
  %136 = load i32, ptr %8, align 4, !dbg !3686
  %137 = sext i32 %136 to i64, !dbg !3684
  %138 = getelementptr inbounds [6 x %struct.side], ptr %135, i64 0, i64 %137, !dbg !3684
  %139 = getelementptr inbounds nuw %struct.side, ptr %138, i32 0, i32 2, !dbg !3687
  %140 = load i16, ptr %139, align 2, !dbg !3687
  %141 = sext i16 %140 to i64, !dbg !3688
  %142 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %141, !dbg !3688
  %143 = getelementptr inbounds nuw %struct.wall, ptr %142, i32 0, i32 8, !dbg !3689
  %144 = load i8, ptr %143, align 4, !dbg !3689
  %145 = sext i8 %144 to i64, !dbg !3690
  %146 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %145, !dbg !3690
  %147 = getelementptr inbounds nuw %struct.wclip, ptr %146, i32 0, i32 4, !dbg !3691
  %148 = load i16, ptr %147, align 4, !dbg !3691
  %149 = sext i16 %148 to i32, !dbg !3690
  %150 = load ptr, ptr %10, align 8, !dbg !3692
  %151 = ptrtoint ptr %150 to i64, !dbg !3693
  %152 = sub i64 %151, ptrtoint (ptr @Segments to i64), !dbg !3693
  %153 = sdiv exact i64 %152, 512, !dbg !3693
  %154 = trunc i64 %153 to i16, !dbg !3692
  %155 = load i32, ptr %8, align 4, !dbg !3694
  %156 = trunc i32 %155 to i16, !dbg !3694
  %157 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %149, i16 noundef signext %154, i16 noundef signext %156, ptr noundef %16, i32 noundef 0, i32 noundef 65536), !dbg !3695
  br label %158, !dbg !3695

158:                                              ; preds = %133, %121
  br label %159, !dbg !3696

159:                                              ; preds = %158, %116
  br label %160, !dbg !3697

160:                                              ; preds = %159, %113
  br label %161, !dbg !3698

161:                                              ; preds = %160, %96
  %162 = load i32, ptr @FrameTime, align 4, !dbg !3699
  %163 = load ptr, ptr %4, align 8, !dbg !3700
  %164 = getelementptr inbounds nuw %struct.active_door, ptr %163, i32 0, i32 3, !dbg !3701
  %165 = load i32, ptr %164, align 4, !dbg !3702
  %166 = add nsw i32 %165, %162, !dbg !3702
  store i32 %166, ptr %164, align 4, !dbg !3702
  %167 = load ptr, ptr %4, align 8, !dbg !3703
  %168 = getelementptr inbounds nuw %struct.active_door, ptr %167, i32 0, i32 3, !dbg !3704
  %169 = load i32, ptr %168, align 4, !dbg !3704
  store i32 %169, ptr %11, align 4, !dbg !3705
  %170 = load ptr, ptr %6, align 8, !dbg !3706
  %171 = getelementptr inbounds nuw %struct.wall, ptr %170, i32 0, i32 8, !dbg !3707
  %172 = load i8, ptr %171, align 4, !dbg !3707
  %173 = sext i8 %172 to i64, !dbg !3708
  %174 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %173, !dbg !3708
  %175 = getelementptr inbounds nuw %struct.wclip, ptr %174, i32 0, i32 1, !dbg !3709
  %176 = load i16, ptr %175, align 4, !dbg !3709
  %177 = sext i16 %176 to i32, !dbg !3708
  store i32 %177, ptr %15, align 4, !dbg !3710
  %178 = load ptr, ptr %6, align 8, !dbg !3711
  %179 = getelementptr inbounds nuw %struct.wall, ptr %178, i32 0, i32 8, !dbg !3712
  %180 = load i8, ptr %179, align 4, !dbg !3712
  %181 = sext i8 %180 to i64, !dbg !3713
  %182 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %181, !dbg !3713
  %183 = getelementptr inbounds nuw %struct.wclip, ptr %182, i32 0, i32 0, !dbg !3714
  %184 = load i32, ptr %183, align 4, !dbg !3714
  store i32 %184, ptr %12, align 4, !dbg !3715
  %185 = load i32, ptr %12, align 4, !dbg !3716
  %186 = load i32, ptr %15, align 4, !dbg !3717
  %187 = sdiv i32 %185, %186, !dbg !3718
  store i32 %187, ptr %13, align 4, !dbg !3719
  %188 = load i32, ptr %15, align 4, !dbg !3720
  %189 = load i32, ptr %11, align 4, !dbg !3721
  %190 = load i32, ptr %13, align 4, !dbg !3722
  %191 = sdiv i32 %189, %190, !dbg !3723
  %192 = sub nsw i32 %188, %191, !dbg !3724
  %193 = sub nsw i32 %192, 1, !dbg !3725
  store i32 %193, ptr %14, align 4, !dbg !3726
  %194 = load i32, ptr %14, align 4, !dbg !3727
  %195 = load i32, ptr %15, align 4, !dbg !3729
  %196 = sdiv i32 %195, 2, !dbg !3730
  %197 = icmp slt i32 %194, %196, !dbg !3731
  br i1 %197, label %198, label %227, !dbg !3731

198:                                              ; preds = %161
  %199 = load ptr, ptr %10, align 8, !dbg !3732
  %200 = getelementptr inbounds nuw %struct.segment, ptr %199, i32 0, i32 0, !dbg !3734
  %201 = load i32, ptr %8, align 4, !dbg !3735
  %202 = sext i32 %201 to i64, !dbg !3732
  %203 = getelementptr inbounds [6 x %struct.side], ptr %200, i64 0, i64 %202, !dbg !3732
  %204 = getelementptr inbounds nuw %struct.side, ptr %203, i32 0, i32 2, !dbg !3736
  %205 = load i16, ptr %204, align 2, !dbg !3736
  %206 = sext i16 %205 to i64, !dbg !3737
  %207 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %206, !dbg !3737
  %208 = getelementptr inbounds nuw %struct.wall, ptr %207, i32 0, i32 5, !dbg !3738
  %209 = load i8, ptr %208, align 1, !dbg !3739
  %210 = zext i8 %209 to i32, !dbg !3739
  %211 = and i32 %210, -3, !dbg !3739
  %212 = trunc i32 %211 to i8, !dbg !3739
  store i8 %212, ptr %208, align 1, !dbg !3739
  %213 = load ptr, ptr %9, align 8, !dbg !3740
  %214 = getelementptr inbounds nuw %struct.segment, ptr %213, i32 0, i32 0, !dbg !3741
  %215 = load i32, ptr %7, align 4, !dbg !3742
  %216 = sext i32 %215 to i64, !dbg !3740
  %217 = getelementptr inbounds [6 x %struct.side], ptr %214, i64 0, i64 %216, !dbg !3740
  %218 = getelementptr inbounds nuw %struct.side, ptr %217, i32 0, i32 2, !dbg !3743
  %219 = load i16, ptr %218, align 2, !dbg !3743
  %220 = sext i16 %219 to i64, !dbg !3744
  %221 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %220, !dbg !3744
  %222 = getelementptr inbounds nuw %struct.wall, ptr %221, i32 0, i32 5, !dbg !3745
  %223 = load i8, ptr %222, align 1, !dbg !3746
  %224 = zext i8 %223 to i32, !dbg !3746
  %225 = and i32 %224, -3, !dbg !3746
  %226 = trunc i32 %225 to i8, !dbg !3746
  store i8 %226, ptr %222, align 1, !dbg !3746
  br label %227, !dbg !3747

227:                                              ; preds = %198, %161
  %228 = load i32, ptr %14, align 4, !dbg !3748
  %229 = icmp sgt i32 %228, 0, !dbg !3750
  br i1 %229, label %230, label %264, !dbg !3750

230:                                              ; preds = %227
  %231 = load ptr, ptr %10, align 8, !dbg !3751
  %232 = load i32, ptr %8, align 4, !dbg !3753
  %233 = load ptr, ptr %9, align 8, !dbg !3754
  %234 = load i32, ptr %7, align 4, !dbg !3755
  %235 = load ptr, ptr %6, align 8, !dbg !3756
  %236 = getelementptr inbounds nuw %struct.wall, ptr %235, i32 0, i32 8, !dbg !3757
  %237 = load i8, ptr %236, align 4, !dbg !3757
  %238 = sext i8 %237 to i32, !dbg !3756
  %239 = load i32, ptr %14, align 4, !dbg !3758
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %231, i32 noundef %232, ptr noundef %233, i32 noundef %234, i32 noundef %238, i32 noundef %239), !dbg !3759
  %240 = load ptr, ptr %10, align 8, !dbg !3760
  %241 = getelementptr inbounds nuw %struct.segment, ptr %240, i32 0, i32 0, !dbg !3761
  %242 = load i32, ptr %8, align 4, !dbg !3762
  %243 = sext i32 %242 to i64, !dbg !3760
  %244 = getelementptr inbounds [6 x %struct.side], ptr %241, i64 0, i64 %243, !dbg !3760
  %245 = getelementptr inbounds nuw %struct.side, ptr %244, i32 0, i32 2, !dbg !3763
  %246 = load i16, ptr %245, align 2, !dbg !3763
  %247 = sext i16 %246 to i64, !dbg !3764
  %248 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %247, !dbg !3764
  %249 = getelementptr inbounds nuw %struct.wall, ptr %248, i32 0, i32 6, !dbg !3765
  store i8 3, ptr %249, align 2, !dbg !3766
  %250 = load ptr, ptr %9, align 8, !dbg !3767
  %251 = getelementptr inbounds nuw %struct.segment, ptr %250, i32 0, i32 0, !dbg !3768
  %252 = load i32, ptr %7, align 4, !dbg !3769
  %253 = sext i32 %252 to i64, !dbg !3767
  %254 = getelementptr inbounds [6 x %struct.side], ptr %251, i64 0, i64 %253, !dbg !3767
  %255 = getelementptr inbounds nuw %struct.side, ptr %254, i32 0, i32 2, !dbg !3770
  %256 = load i16, ptr %255, align 2, !dbg !3770
  %257 = sext i16 %256 to i64, !dbg !3771
  %258 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %257, !dbg !3771
  %259 = getelementptr inbounds nuw %struct.wall, ptr %258, i32 0, i32 6, !dbg !3772
  store i8 3, ptr %259, align 2, !dbg !3773
  %260 = load i32, ptr @Num_open_doors, align 4, !dbg !3774
  %261 = sext i32 %260 to i64, !dbg !3775
  %262 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %261, !dbg !3775
  %263 = getelementptr inbounds nuw %struct.active_door, ptr %262, i32 0, i32 3, !dbg !3776
  store i32 0, ptr %263, align 4, !dbg !3777
  br label %266, !dbg !3778

264:                                              ; preds = %227
  %265 = load i32, ptr %2, align 4, !dbg !3779
  call void @_Z19wall_close_door_numi(i32 noundef %265), !dbg !3780
  br label %266

266:                                              ; preds = %264, %230
  br label %267, !dbg !3781

267:                                              ; preds = %266
  %268 = load i32, ptr %3, align 4, !dbg !3782
  %269 = add nsw i32 %268, 1, !dbg !3782
  store i32 %269, ptr %3, align 4, !dbg !3782
  br label %63, !dbg !3783, !llvm.loop !3784

270:                                              ; preds = %63
  br label %271, !dbg !3786

271:                                              ; preds = %270, %46, %95
  ret void, !dbg !3786
}

declare void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17wall_illusion_offP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !3787 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3788, !DIExpression(), !3789)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3790, !DIExpression(), !3791)
    #dbg_declare(ptr %5, !3792, !DIExpression(), !3793)
    #dbg_declare(ptr %6, !3794, !DIExpression(), !3795)
  %7 = load ptr, ptr %3, align 8, !dbg !3796
  %8 = getelementptr inbounds nuw %struct.segment, ptr %7, i32 0, i32 1, !dbg !3797
  %9 = load i32, ptr %4, align 4, !dbg !3798
  %10 = sext i32 %9 to i64, !dbg !3796
  %11 = getelementptr inbounds [6 x i16], ptr %8, i64 0, i64 %10, !dbg !3796
  %12 = load i16, ptr %11, align 2, !dbg !3796
  %13 = sext i16 %12 to i64, !dbg !3799
  %14 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %13, !dbg !3799
  store ptr %14, ptr %5, align 8, !dbg !3800
  %15 = load ptr, ptr %3, align 8, !dbg !3801
  %16 = load ptr, ptr %5, align 8, !dbg !3802
  %17 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %15, ptr noundef %16), !dbg !3803
  store i32 %17, ptr %6, align 4, !dbg !3804
  %18 = load i32, ptr %6, align 4, !dbg !3805
  %19 = icmp ne i32 %18, -1, !dbg !3805
  %20 = zext i1 %19 to i32, !dbg !3805
  call void @_Z7_AssertiPKcS0_i(i32 noundef %20, ptr noundef @.str.20, ptr noundef @.str.1, i32 noundef 983), !dbg !3805
  %21 = load ptr, ptr %3, align 8, !dbg !3806
  %22 = getelementptr inbounds nuw %struct.segment, ptr %21, i32 0, i32 0, !dbg !3808
  %23 = load i32, ptr %4, align 4, !dbg !3809
  %24 = sext i32 %23 to i64, !dbg !3806
  %25 = getelementptr inbounds [6 x %struct.side], ptr %22, i64 0, i64 %24, !dbg !3806
  %26 = getelementptr inbounds nuw %struct.side, ptr %25, i32 0, i32 2, !dbg !3810
  %27 = load i16, ptr %26, align 2, !dbg !3810
  %28 = sext i16 %27 to i32, !dbg !3806
  %29 = icmp eq i32 %28, -1, !dbg !3811
  br i1 %29, label %30, label %31, !dbg !3811

30:                                               ; preds = %2
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.21), !dbg !3812
  br label %76, !dbg !3814

31:                                               ; preds = %2
  %32 = load ptr, ptr %3, align 8, !dbg !3815
  %33 = getelementptr inbounds nuw %struct.segment, ptr %32, i32 0, i32 0, !dbg !3816
  %34 = load i32, ptr %4, align 4, !dbg !3817
  %35 = sext i32 %34 to i64, !dbg !3815
  %36 = getelementptr inbounds [6 x %struct.side], ptr %33, i64 0, i64 %35, !dbg !3815
  %37 = getelementptr inbounds nuw %struct.side, ptr %36, i32 0, i32 2, !dbg !3818
  %38 = load i16, ptr %37, align 2, !dbg !3818
  %39 = sext i16 %38 to i64, !dbg !3819
  %40 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %39, !dbg !3819
  %41 = getelementptr inbounds nuw %struct.wall, ptr %40, i32 0, i32 5, !dbg !3820
  %42 = load i8, ptr %41, align 1, !dbg !3821
  %43 = zext i8 %42 to i32, !dbg !3821
  %44 = or i32 %43, 32, !dbg !3821
  %45 = trunc i32 %44 to i8, !dbg !3821
  store i8 %45, ptr %41, align 1, !dbg !3821
  %46 = load ptr, ptr %5, align 8, !dbg !3822
  %47 = getelementptr inbounds nuw %struct.segment, ptr %46, i32 0, i32 0, !dbg !3823
  %48 = load i32, ptr %6, align 4, !dbg !3824
  %49 = sext i32 %48 to i64, !dbg !3822
  %50 = getelementptr inbounds [6 x %struct.side], ptr %47, i64 0, i64 %49, !dbg !3822
  %51 = getelementptr inbounds nuw %struct.side, ptr %50, i32 0, i32 2, !dbg !3825
  %52 = load i16, ptr %51, align 2, !dbg !3825
  %53 = sext i16 %52 to i64, !dbg !3826
  %54 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %53, !dbg !3826
  %55 = getelementptr inbounds nuw %struct.wall, ptr %54, i32 0, i32 5, !dbg !3827
  %56 = load i8, ptr %55, align 1, !dbg !3828
  %57 = zext i8 %56 to i32, !dbg !3828
  %58 = or i32 %57, 32, !dbg !3828
  %59 = trunc i32 %58 to i8, !dbg !3828
  store i8 %59, ptr %55, align 1, !dbg !3828
  %60 = load ptr, ptr %3, align 8, !dbg !3829
  %61 = getelementptr inbounds nuw %struct.segment, ptr %60, i32 0, i32 0, !dbg !3830
  %62 = load i32, ptr %4, align 4, !dbg !3831
  %63 = sext i32 %62 to i64, !dbg !3829
  %64 = getelementptr inbounds [6 x %struct.side], ptr %61, i64 0, i64 %63, !dbg !3829
  %65 = getelementptr inbounds nuw %struct.side, ptr %64, i32 0, i32 2, !dbg !3832
  %66 = load i16, ptr %65, align 2, !dbg !3832
  %67 = sext i16 %66 to i32, !dbg !3829
  call void @_Z18kill_stuck_objectsi(i32 noundef %67), !dbg !3833
  %68 = load ptr, ptr %5, align 8, !dbg !3834
  %69 = getelementptr inbounds nuw %struct.segment, ptr %68, i32 0, i32 0, !dbg !3835
  %70 = load i32, ptr %6, align 4, !dbg !3836
  %71 = sext i32 %70 to i64, !dbg !3834
  %72 = getelementptr inbounds [6 x %struct.side], ptr %69, i64 0, i64 %71, !dbg !3834
  %73 = getelementptr inbounds nuw %struct.side, ptr %72, i32 0, i32 2, !dbg !3837
  %74 = load i16, ptr %73, align 2, !dbg !3837
  %75 = sext i16 %74 to i32, !dbg !3834
  call void @_Z18kill_stuck_objectsi(i32 noundef %75), !dbg !3838
  br label %76, !dbg !3839

76:                                               ; preds = %31, %30
  ret void, !dbg !3839
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16wall_illusion_onP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !3840 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3841, !DIExpression(), !3842)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3843, !DIExpression(), !3844)
    #dbg_declare(ptr %5, !3845, !DIExpression(), !3846)
    #dbg_declare(ptr %6, !3847, !DIExpression(), !3848)
  %7 = load ptr, ptr %3, align 8, !dbg !3849
  %8 = getelementptr inbounds nuw %struct.segment, ptr %7, i32 0, i32 1, !dbg !3850
  %9 = load i32, ptr %4, align 4, !dbg !3851
  %10 = sext i32 %9 to i64, !dbg !3849
  %11 = getelementptr inbounds [6 x i16], ptr %8, i64 0, i64 %10, !dbg !3849
  %12 = load i16, ptr %11, align 2, !dbg !3849
  %13 = sext i16 %12 to i64, !dbg !3852
  %14 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %13, !dbg !3852
  store ptr %14, ptr %5, align 8, !dbg !3853
  %15 = load ptr, ptr %3, align 8, !dbg !3854
  %16 = load ptr, ptr %5, align 8, !dbg !3855
  %17 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %15, ptr noundef %16), !dbg !3856
  store i32 %17, ptr %6, align 4, !dbg !3857
  %18 = load i32, ptr %6, align 4, !dbg !3858
  %19 = icmp ne i32 %18, -1, !dbg !3858
  %20 = zext i1 %19 to i32, !dbg !3858
  call void @_Z7_AssertiPKcS0_i(i32 noundef %20, ptr noundef @.str.20, ptr noundef @.str.1, i32 noundef 1034), !dbg !3858
  %21 = load ptr, ptr %3, align 8, !dbg !3859
  %22 = getelementptr inbounds nuw %struct.segment, ptr %21, i32 0, i32 0, !dbg !3861
  %23 = load i32, ptr %4, align 4, !dbg !3862
  %24 = sext i32 %23 to i64, !dbg !3859
  %25 = getelementptr inbounds [6 x %struct.side], ptr %22, i64 0, i64 %24, !dbg !3859
  %26 = getelementptr inbounds nuw %struct.side, ptr %25, i32 0, i32 2, !dbg !3863
  %27 = load i16, ptr %26, align 2, !dbg !3863
  %28 = sext i16 %27 to i32, !dbg !3859
  %29 = icmp eq i32 %28, -1, !dbg !3864
  br i1 %29, label %30, label %31, !dbg !3864

30:                                               ; preds = %2
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.22), !dbg !3865
  br label %60, !dbg !3867

31:                                               ; preds = %2
  %32 = load ptr, ptr %3, align 8, !dbg !3868
  %33 = getelementptr inbounds nuw %struct.segment, ptr %32, i32 0, i32 0, !dbg !3869
  %34 = load i32, ptr %4, align 4, !dbg !3870
  %35 = sext i32 %34 to i64, !dbg !3868
  %36 = getelementptr inbounds [6 x %struct.side], ptr %33, i64 0, i64 %35, !dbg !3868
  %37 = getelementptr inbounds nuw %struct.side, ptr %36, i32 0, i32 2, !dbg !3871
  %38 = load i16, ptr %37, align 2, !dbg !3871
  %39 = sext i16 %38 to i64, !dbg !3872
  %40 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %39, !dbg !3872
  %41 = getelementptr inbounds nuw %struct.wall, ptr %40, i32 0, i32 5, !dbg !3873
  %42 = load i8, ptr %41, align 1, !dbg !3874
  %43 = zext i8 %42 to i32, !dbg !3874
  %44 = and i32 %43, -33, !dbg !3874
  %45 = trunc i32 %44 to i8, !dbg !3874
  store i8 %45, ptr %41, align 1, !dbg !3874
  %46 = load ptr, ptr %5, align 8, !dbg !3875
  %47 = getelementptr inbounds nuw %struct.segment, ptr %46, i32 0, i32 0, !dbg !3876
  %48 = load i32, ptr %6, align 4, !dbg !3877
  %49 = sext i32 %48 to i64, !dbg !3875
  %50 = getelementptr inbounds [6 x %struct.side], ptr %47, i64 0, i64 %49, !dbg !3875
  %51 = getelementptr inbounds nuw %struct.side, ptr %50, i32 0, i32 2, !dbg !3878
  %52 = load i16, ptr %51, align 2, !dbg !3878
  %53 = sext i16 %52 to i64, !dbg !3879
  %54 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %53, !dbg !3879
  %55 = getelementptr inbounds nuw %struct.wall, ptr %54, i32 0, i32 5, !dbg !3880
  %56 = load i8, ptr %55, align 1, !dbg !3881
  %57 = zext i8 %56 to i32, !dbg !3881
  %58 = and i32 %57, -33, !dbg !3881
  %59 = trunc i32 %58 to i8, !dbg !3881
  store i8 %59, ptr %55, align 1, !dbg !3881
  br label %60, !dbg !3882

60:                                               ; preds = %31, %30
  ret void, !dbg !3882
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z28special_boss_opening_allowedii(i32 noundef %0, i32 noundef %1) #0 !dbg !3883 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !3886, !DIExpression(), !3887)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !3888, !DIExpression(), !3889)
  %6 = load i32, ptr @Game_mode, align 4, !dbg !3890
  %7 = and i32 %6, 38, !dbg !3892
  %8 = icmp ne i32 %7, 0, !dbg !3890
  br i1 %8, label %9, label %21, !dbg !3890

9:                                                ; preds = %2
  %10 = load i32, ptr @Current_level_num, align 4, !dbg !3893
  %11 = icmp eq i32 %10, 7, !dbg !3894
  br i1 %11, label %12, label %18, !dbg !3895

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4, !dbg !3896
  %14 = icmp eq i32 %13, 595, !dbg !3897
  br i1 %14, label %15, label %18, !dbg !3898

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4, !dbg !3899
  %17 = icmp eq i32 %16, 5, !dbg !3900
  br label %18

18:                                               ; preds = %15, %12, %9
  %19 = phi i1 [ false, %12 ], [ false, %9 ], [ %17, %15 ], !dbg !3901
  %20 = zext i1 %19 to i32, !dbg !3902
  store i32 %20, ptr %3, align 4, !dbg !3903
  br label %22, !dbg !3903

21:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !3904
  br label %22, !dbg !3904

22:                                               ; preds = %21, %18
  %23 = load i32, ptr %3, align 4, !dbg !3905
  ret i32 %23, !dbg !3905
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z16wall_hit_processP7segmentiiiP6object(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #1 !dbg !3906 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !3909, !DIExpression(), !3910)
  store i32 %1, ptr %8, align 4
    #dbg_declare(ptr %8, !3911, !DIExpression(), !3912)
  store i32 %2, ptr %9, align 4
    #dbg_declare(ptr %9, !3913, !DIExpression(), !3914)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !3915, !DIExpression(), !3916)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !3917, !DIExpression(), !3918)
    #dbg_declare(ptr %12, !3919, !DIExpression(), !3920)
    #dbg_declare(ptr %13, !3921, !DIExpression(), !3922)
  %14 = load ptr, ptr %7, align 8, !dbg !3923
  %15 = ptrtoint ptr %14 to i64, !dbg !3923
  %16 = sub i64 %15, ptrtoint (ptr @Segments to i64), !dbg !3923
  %17 = sdiv exact i64 %16, 512, !dbg !3923
  %18 = icmp ne i64 %17, -1, !dbg !3923
  %19 = zext i1 %18 to i32, !dbg !3923
  call void @_Z7_AssertiPKcS0_i(i32 noundef %19, ptr noundef @.str.13, ptr noundef @.str.1, i32 noundef 1066), !dbg !3923
  %20 = load ptr, ptr %7, align 8, !dbg !3924
  %21 = getelementptr inbounds nuw %struct.segment, ptr %20, i32 0, i32 0, !dbg !3926
  %22 = load i32, ptr %8, align 4, !dbg !3927
  %23 = sext i32 %22 to i64, !dbg !3924
  %24 = getelementptr inbounds [6 x %struct.side], ptr %21, i64 0, i64 %23, !dbg !3924
  %25 = getelementptr inbounds nuw %struct.side, ptr %24, i32 0, i32 2, !dbg !3928
  %26 = load i16, ptr %25, align 2, !dbg !3928
  %27 = sext i16 %26 to i32, !dbg !3924
  %28 = icmp slt i32 %27, 0, !dbg !3929
  br i1 %28, label %29, label %30, !dbg !3929

29:                                               ; preds = %5
  store i32 0, ptr %6, align 4, !dbg !3930
  br label %256, !dbg !3930

30:                                               ; preds = %5
  %31 = load ptr, ptr %7, align 8, !dbg !3931
  %32 = getelementptr inbounds nuw %struct.segment, ptr %31, i32 0, i32 0, !dbg !3932
  %33 = load i32, ptr %8, align 4, !dbg !3933
  %34 = sext i32 %33 to i64, !dbg !3931
  %35 = getelementptr inbounds [6 x %struct.side], ptr %32, i64 0, i64 %34, !dbg !3931
  %36 = getelementptr inbounds nuw %struct.side, ptr %35, i32 0, i32 2, !dbg !3934
  %37 = load i16, ptr %36, align 2, !dbg !3934
  %38 = sext i16 %37 to i64, !dbg !3935
  %39 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %38, !dbg !3935
  store ptr %39, ptr %12, align 8, !dbg !3936
  %40 = load i32, ptr @Newdemo_state, align 4, !dbg !3937
  %41 = icmp eq i32 %40, 1, !dbg !3939
  br i1 %41, label %42, label %51, !dbg !3939

42:                                               ; preds = %30
  %43 = load ptr, ptr %7, align 8, !dbg !3940
  %44 = ptrtoint ptr %43 to i64, !dbg !3941
  %45 = sub i64 %44, ptrtoint (ptr @Segments to i64), !dbg !3941
  %46 = sdiv exact i64 %45, 512, !dbg !3941
  %47 = trunc i64 %46 to i32, !dbg !3940
  %48 = load i32, ptr %8, align 4, !dbg !3942
  %49 = load i32, ptr %9, align 4, !dbg !3943
  %50 = load i32, ptr %10, align 4, !dbg !3944
  call void @_Z31newdemo_record_wall_hit_processiiii(i32 noundef %47, i32 noundef %48, i32 noundef %49, i32 noundef %50), !dbg !3945
  br label %51, !dbg !3945

51:                                               ; preds = %42, %30
  %52 = load ptr, ptr %12, align 8, !dbg !3946
  %53 = getelementptr inbounds nuw %struct.wall, ptr %52, i32 0, i32 4, !dbg !3948
  %54 = load i8, ptr %53, align 4, !dbg !3948
  %55 = zext i8 %54 to i32, !dbg !3946
  %56 = icmp eq i32 %55, 1, !dbg !3949
  br i1 %56, label %57, label %72, !dbg !3949

57:                                               ; preds = %51
  %58 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3950
  %59 = icmp eq i32 %58, 0, !dbg !3953
  br i1 %59, label %67, label %60, !dbg !3954

60:                                               ; preds = %57
  %61 = load ptr, ptr %11, align 8, !dbg !3955
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 22, !dbg !3956
  %63 = getelementptr inbounds nuw %struct.laser_info_s, ptr %62, i32 0, i32 0, !dbg !3957
  %64 = load i16, ptr %63, align 4, !dbg !3957
  %65 = sext i16 %64 to i32, !dbg !3955
  %66 = icmp eq i32 %65, 4, !dbg !3958
  br i1 %66, label %67, label %71, !dbg !3954

67:                                               ; preds = %60, %57
  %68 = load ptr, ptr %7, align 8, !dbg !3959
  %69 = load i32, ptr %8, align 4, !dbg !3960
  %70 = load i32, ptr %9, align 4, !dbg !3961
  call void @_Z11wall_damageP7segmentii(ptr noundef %68, i32 noundef %69, i32 noundef %70), !dbg !3962
  br label %71, !dbg !3962

71:                                               ; preds = %67, %60
  store i32 2, ptr %6, align 4, !dbg !3963
  br label %256, !dbg !3963

72:                                               ; preds = %51
  %73 = load i32, ptr %10, align 4, !dbg !3964
  %74 = load i32, ptr @Player_num, align 4, !dbg !3966
  %75 = icmp ne i32 %73, %74, !dbg !3967
  br i1 %75, label %76, label %77, !dbg !3967

76:                                               ; preds = %72
  store i32 0, ptr %6, align 4, !dbg !3968
  br label %256, !dbg !3968

77:                                               ; preds = %72
  %78 = load i32, ptr %10, align 4, !dbg !3969
  %79 = icmp sgt i32 %78, -1, !dbg !3969
  %80 = zext i1 %79 to i32, !dbg !3969
  call void @_Z7_AssertiPKcS0_i(i32 noundef %80, ptr noundef @.str.23, ptr noundef @.str.1, i32 noundef 1087), !dbg !3969
  %81 = load ptr, ptr %11, align 8, !dbg !3970
  %82 = getelementptr inbounds nuw %struct.object, ptr %81, i32 0, i32 1, !dbg !3972
  %83 = load i8, ptr %82, align 4, !dbg !3972
  %84 = zext i8 %83 to i32, !dbg !3970
  %85 = icmp eq i32 %84, 4, !dbg !3973
  br i1 %85, label %86, label %96, !dbg !3973

86:                                               ; preds = %77
  %87 = load ptr, ptr %11, align 8, !dbg !3974
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 12, !dbg !3974
  %89 = getelementptr inbounds nuw %struct.vms_matrix, ptr %88, i32 0, i32 2, !dbg !3974
  %90 = load ptr, ptr %11, align 8, !dbg !3974
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 21, !dbg !3974
  %92 = getelementptr inbounds nuw %struct.physics_info, ptr %91, i32 0, i32 0, !dbg !3974
  %93 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %89, ptr noundef %92), !dbg !3974
  %94 = icmp sgt i32 %93, 0, !dbg !3975
  %95 = zext i1 %94 to i32, !dbg !3976
  store i32 %95, ptr %13, align 4, !dbg !3977
  br label %120, !dbg !3978

96:                                               ; preds = %77
  %97 = load ptr, ptr %11, align 8, !dbg !3979
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 1, !dbg !3981
  %99 = load i8, ptr %98, align 4, !dbg !3981
  %100 = zext i8 %99 to i32, !dbg !3979
  %101 = icmp eq i32 %100, 2, !dbg !3982
  br i1 %101, label %102, label %103, !dbg !3982

102:                                              ; preds = %96
  store i32 0, ptr %13, align 4, !dbg !3983
  br label %119, !dbg !3984

103:                                              ; preds = %96
  %104 = load ptr, ptr %11, align 8, !dbg !3985
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 1, !dbg !3987
  %106 = load i8, ptr %105, align 4, !dbg !3987
  %107 = zext i8 %106 to i32, !dbg !3985
  %108 = icmp eq i32 %107, 5, !dbg !3988
  br i1 %108, label %109, label %117, !dbg !3989

109:                                              ; preds = %103
  %110 = load ptr, ptr %11, align 8, !dbg !3990
  %111 = getelementptr inbounds nuw %struct.object, ptr %110, i32 0, i32 22, !dbg !3991
  %112 = getelementptr inbounds nuw %struct.laser_info_s, ptr %111, i32 0, i32 0, !dbg !3992
  %113 = load i16, ptr %112, align 4, !dbg !3992
  %114 = sext i16 %113 to i32, !dbg !3990
  %115 = icmp eq i32 %114, 2, !dbg !3993
  br i1 %115, label %116, label %117, !dbg !3989

116:                                              ; preds = %109
  store i32 0, ptr %13, align 4, !dbg !3994
  br label %118, !dbg !3995

117:                                              ; preds = %109, %103
  store i32 1, ptr %13, align 4, !dbg !3996
  br label %118

118:                                              ; preds = %117, %116
  br label %119

119:                                              ; preds = %118, %102
  br label %120

120:                                              ; preds = %119, %86
  %121 = load ptr, ptr %12, align 8, !dbg !3997
  %122 = getelementptr inbounds nuw %struct.wall, ptr %121, i32 0, i32 9, !dbg !3999
  %123 = load i8, ptr %122, align 1, !dbg !3999
  %124 = zext i8 %123 to i32, !dbg !3997
  %125 = icmp eq i32 %124, 2, !dbg !4000
  br i1 %125, label %126, label %150, !dbg !4000

126:                                              ; preds = %120
  %127 = load i32, ptr %10, align 4, !dbg !4001
  %128 = sext i32 %127 to i64, !dbg !4003
  %129 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %128, !dbg !4003
  %130 = getelementptr inbounds nuw %struct.player, ptr %129, i32 0, i32 7, !dbg !4004
  %131 = load i32, ptr %130, align 4, !dbg !4004
  %132 = and i32 %131, 2, !dbg !4005
  %133 = icmp ne i32 %132, 0, !dbg !4006
  br i1 %133, label %149, label %134, !dbg !4007

134:                                              ; preds = %126
  %135 = load i32, ptr %10, align 4, !dbg !4008
  %136 = load i32, ptr @Player_num, align 4, !dbg !4011
  %137 = icmp eq i32 %135, %136, !dbg !4012
  br i1 %137, label %138, label %148, !dbg !4012

138:                                              ; preds = %134
  %139 = load i32, ptr %13, align 4, !dbg !4013
  %140 = icmp ne i32 %139, 0, !dbg !4013
  br i1 %140, label %141, label %147, !dbg !4013

141:                                              ; preds = %138
  %142 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 12) #4, !dbg !4015
  %143 = load ptr, ptr %142, align 8, !dbg !4015
  %144 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 15) #4, !dbg !4016
  %145 = load ptr, ptr %144, align 8, !dbg !4016
  %146 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.24, ptr noundef %143, ptr noundef %145), !dbg !4017
  br label %147, !dbg !4017

147:                                              ; preds = %141, %138
  br label %148, !dbg !4013

148:                                              ; preds = %147, %134
  store i32 1, ptr %6, align 4, !dbg !4018
  br label %256, !dbg !4018

149:                                              ; preds = %126
  br label %150, !dbg !4019

150:                                              ; preds = %149, %120
  %151 = load ptr, ptr %12, align 8, !dbg !4020
  %152 = getelementptr inbounds nuw %struct.wall, ptr %151, i32 0, i32 9, !dbg !4022
  %153 = load i8, ptr %152, align 1, !dbg !4022
  %154 = zext i8 %153 to i32, !dbg !4020
  %155 = icmp eq i32 %154, 4, !dbg !4023
  br i1 %155, label %156, label %180, !dbg !4023

156:                                              ; preds = %150
  %157 = load i32, ptr %10, align 4, !dbg !4024
  %158 = sext i32 %157 to i64, !dbg !4026
  %159 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %158, !dbg !4026
  %160 = getelementptr inbounds nuw %struct.player, ptr %159, i32 0, i32 7, !dbg !4027
  %161 = load i32, ptr %160, align 4, !dbg !4027
  %162 = and i32 %161, 4, !dbg !4028
  %163 = icmp ne i32 %162, 0, !dbg !4029
  br i1 %163, label %179, label %164, !dbg !4030

164:                                              ; preds = %156
  %165 = load i32, ptr %10, align 4, !dbg !4031
  %166 = load i32, ptr @Player_num, align 4, !dbg !4034
  %167 = icmp eq i32 %165, %166, !dbg !4035
  br i1 %167, label %168, label %178, !dbg !4035

168:                                              ; preds = %164
  %169 = load i32, ptr %13, align 4, !dbg !4036
  %170 = icmp ne i32 %169, 0, !dbg !4036
  br i1 %170, label %171, label %177, !dbg !4036

171:                                              ; preds = %168
  %172 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 13) #4, !dbg !4038
  %173 = load ptr, ptr %172, align 8, !dbg !4038
  %174 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 15) #4, !dbg !4039
  %175 = load ptr, ptr %174, align 8, !dbg !4039
  %176 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.24, ptr noundef %173, ptr noundef %175), !dbg !4040
  br label %177, !dbg !4040

177:                                              ; preds = %171, %168
  br label %178, !dbg !4036

178:                                              ; preds = %177, %164
  store i32 1, ptr %6, align 4, !dbg !4041
  br label %256, !dbg !4041

179:                                              ; preds = %156
  br label %180, !dbg !4042

180:                                              ; preds = %179, %150
  %181 = load ptr, ptr %12, align 8, !dbg !4043
  %182 = getelementptr inbounds nuw %struct.wall, ptr %181, i32 0, i32 9, !dbg !4045
  %183 = load i8, ptr %182, align 1, !dbg !4045
  %184 = zext i8 %183 to i32, !dbg !4043
  %185 = icmp eq i32 %184, 8, !dbg !4046
  br i1 %185, label %186, label %210, !dbg !4046

186:                                              ; preds = %180
  %187 = load i32, ptr %10, align 4, !dbg !4047
  %188 = sext i32 %187 to i64, !dbg !4049
  %189 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %188, !dbg !4049
  %190 = getelementptr inbounds nuw %struct.player, ptr %189, i32 0, i32 7, !dbg !4050
  %191 = load i32, ptr %190, align 4, !dbg !4050
  %192 = and i32 %191, 8, !dbg !4051
  %193 = icmp ne i32 %192, 0, !dbg !4052
  br i1 %193, label %209, label %194, !dbg !4053

194:                                              ; preds = %186
  %195 = load i32, ptr %10, align 4, !dbg !4054
  %196 = load i32, ptr @Player_num, align 4, !dbg !4057
  %197 = icmp eq i32 %195, %196, !dbg !4058
  br i1 %197, label %198, label %208, !dbg !4058

198:                                              ; preds = %194
  %199 = load i32, ptr %13, align 4, !dbg !4059
  %200 = icmp ne i32 %199, 0, !dbg !4059
  br i1 %200, label %201, label %207, !dbg !4059

201:                                              ; preds = %198
  %202 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 14) #4, !dbg !4061
  %203 = load ptr, ptr %202, align 8, !dbg !4061
  %204 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 15) #4, !dbg !4062
  %205 = load ptr, ptr %204, align 8, !dbg !4062
  %206 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.24, ptr noundef %203, ptr noundef %205), !dbg !4063
  br label %207, !dbg !4063

207:                                              ; preds = %201, %198
  br label %208, !dbg !4059

208:                                              ; preds = %207, %194
  store i32 1, ptr %6, align 4, !dbg !4064
  br label %256, !dbg !4064

209:                                              ; preds = %186
  br label %210, !dbg !4065

210:                                              ; preds = %209, %180
  %211 = load ptr, ptr %12, align 8, !dbg !4066
  %212 = getelementptr inbounds nuw %struct.wall, ptr %211, i32 0, i32 4, !dbg !4068
  %213 = load i8, ptr %212, align 4, !dbg !4068
  %214 = zext i8 %213 to i32, !dbg !4066
  %215 = icmp eq i32 %214, 2, !dbg !4069
  br i1 %215, label %216, label %255, !dbg !4069

216:                                              ; preds = %210
  %217 = load ptr, ptr %12, align 8, !dbg !4070
  %218 = getelementptr inbounds nuw %struct.wall, ptr %217, i32 0, i32 5, !dbg !4072
  %219 = load i8, ptr %218, align 1, !dbg !4072
  %220 = zext i8 %219 to i32, !dbg !4070
  %221 = and i32 %220, 8, !dbg !4073
  %222 = icmp ne i32 %221, 0, !dbg !4074
  br i1 %222, label %223, label %245, !dbg !4075

223:                                              ; preds = %216
  %224 = load ptr, ptr %7, align 8, !dbg !4076
  %225 = ptrtoint ptr %224 to i64, !dbg !4077
  %226 = sub i64 %225, ptrtoint (ptr @Segments to i64), !dbg !4077
  %227 = sdiv exact i64 %226, 512, !dbg !4077
  %228 = trunc i64 %227 to i32, !dbg !4076
  %229 = load i32, ptr %8, align 4, !dbg !4078
  %230 = call noundef i32 @_Z28special_boss_opening_allowedii(i32 noundef %228, i32 noundef %229), !dbg !4079
  %231 = icmp ne i32 %230, 0, !dbg !4080
  br i1 %231, label %245, label %232, !dbg !4075

232:                                              ; preds = %223
  %233 = load i32, ptr %10, align 4, !dbg !4081
  %234 = load i32, ptr @Player_num, align 4, !dbg !4084
  %235 = icmp eq i32 %233, %234, !dbg !4085
  br i1 %235, label %236, label %244, !dbg !4085

236:                                              ; preds = %232
  %237 = load i32, ptr %13, align 4, !dbg !4086
  %238 = icmp ne i32 %237, 0, !dbg !4086
  br i1 %238, label %239, label %243, !dbg !4086

239:                                              ; preds = %236
  %240 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 152) #4, !dbg !4088
  %241 = load ptr, ptr %240, align 8, !dbg !4088
  %242 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %241), !dbg !4089
  br label %243, !dbg !4089

243:                                              ; preds = %239, %236
  br label %244, !dbg !4086

244:                                              ; preds = %243, %232
  store i32 1, ptr %6, align 4, !dbg !4090
  br label %256, !dbg !4090

245:                                              ; preds = %223, %216
  %246 = load ptr, ptr %12, align 8, !dbg !4091
  %247 = getelementptr inbounds nuw %struct.wall, ptr %246, i32 0, i32 6, !dbg !4094
  %248 = load i8, ptr %247, align 2, !dbg !4094
  %249 = zext i8 %248 to i32, !dbg !4091
  %250 = icmp ne i32 %249, 1, !dbg !4095
  br i1 %250, label %251, label %254, !dbg !4095

251:                                              ; preds = %245
  %252 = load ptr, ptr %7, align 8, !dbg !4096
  %253 = load i32, ptr %8, align 4, !dbg !4098
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %252, i32 noundef %253), !dbg !4099
  br label %254, !dbg !4100

254:                                              ; preds = %251, %245
  store i32 3, ptr %6, align 4, !dbg !4101
  br label %256, !dbg !4101

255:                                              ; preds = %210
  store i32 0, ptr %6, align 4, !dbg !4102
  br label %256, !dbg !4102

256:                                              ; preds = %255, %254, %244, %208, %178, %148, %76, %71, %29
  %257 = load i32, ptr %6, align 4, !dbg !4103
  ret i32 %257, !dbg !4103
}

declare void @_Z31newdemo_record_wall_hit_processiiii(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #2

declare noundef i32 @_Z16HUD_init_messagePKcz(ptr noundef, ...) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 !dbg !4104 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4457, !DIExpression(), !4459)
  store i64 %1, ptr %4, align 8
    #dbg_declare(ptr %4, !4460, !DIExpression(), !4461)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector", ptr %5, i32 0, i32 0, !dbg !4462
  %7 = load ptr, ptr %6, align 8, !dbg !4462
  %8 = load i64, ptr %4, align 8, !dbg !4463
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8, !dbg !4464
  ret ptr %9, !dbg !4465
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11wall_toggleP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !4466 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4467, !DIExpression(), !4468)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4469, !DIExpression(), !4470)
    #dbg_declare(ptr %5, !4471, !DIExpression(), !4472)
  %6 = load ptr, ptr %3, align 8, !dbg !4473
  %7 = ptrtoint ptr %6 to i64, !dbg !4473
  %8 = sub i64 %7, ptrtoint (ptr @Segments to i64), !dbg !4473
  %9 = sdiv exact i64 %8, 512, !dbg !4473
  %10 = load i32, ptr @Highest_segment_index, align 4, !dbg !4473
  %11 = sext i32 %10 to i64, !dbg !4473
  %12 = icmp sle i64 %9, %11, !dbg !4473
  %13 = zext i1 %12 to i32, !dbg !4473
  call void @_Z7_AssertiPKcS0_i(i32 noundef %13, ptr noundef @.str.25, ptr noundef @.str.1, i32 noundef 1153), !dbg !4473
  %14 = load i32, ptr %4, align 4, !dbg !4474
  %15 = icmp slt i32 %14, 6, !dbg !4474
  %16 = zext i1 %15 to i32, !dbg !4474
  call void @_Z7_AssertiPKcS0_i(i32 noundef %16, ptr noundef @.str.26, ptr noundef @.str.1, i32 noundef 1154), !dbg !4474
  %17 = load ptr, ptr %3, align 8, !dbg !4475
  %18 = getelementptr inbounds nuw %struct.segment, ptr %17, i32 0, i32 0, !dbg !4476
  %19 = load i32, ptr %4, align 4, !dbg !4477
  %20 = sext i32 %19 to i64, !dbg !4475
  %21 = getelementptr inbounds [6 x %struct.side], ptr %18, i64 0, i64 %20, !dbg !4475
  %22 = getelementptr inbounds nuw %struct.side, ptr %21, i32 0, i32 2, !dbg !4478
  %23 = load i16, ptr %22, align 2, !dbg !4478
  %24 = sext i16 %23 to i32, !dbg !4475
  store i32 %24, ptr %5, align 4, !dbg !4479
  %25 = load i32, ptr %5, align 4, !dbg !4480
  %26 = icmp eq i32 %25, -1, !dbg !4482
  br i1 %26, label %27, label %28, !dbg !4482

27:                                               ; preds = %2
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.27), !dbg !4483
  br label %68, !dbg !4485

28:                                               ; preds = %2
  %29 = load i32, ptr @Newdemo_state, align 4, !dbg !4486
  %30 = icmp eq i32 %29, 1, !dbg !4488
  br i1 %30, label %31, label %38, !dbg !4488

31:                                               ; preds = %28
  %32 = load ptr, ptr %3, align 8, !dbg !4489
  %33 = ptrtoint ptr %32 to i64, !dbg !4490
  %34 = sub i64 %33, ptrtoint (ptr @Segments to i64), !dbg !4490
  %35 = sdiv exact i64 %34, 512, !dbg !4490
  %36 = trunc i64 %35 to i32, !dbg !4489
  %37 = load i32, ptr %4, align 4, !dbg !4491
  call void @_Z26newdemo_record_wall_toggleii(i32 noundef %36, i32 noundef %37), !dbg !4492
  br label %38, !dbg !4492

38:                                               ; preds = %31, %28
  %39 = load i32, ptr %5, align 4, !dbg !4493
  %40 = sext i32 %39 to i64, !dbg !4495
  %41 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %40, !dbg !4495
  %42 = getelementptr inbounds nuw %struct.wall, ptr %41, i32 0, i32 4, !dbg !4496
  %43 = load i8, ptr %42, align 4, !dbg !4496
  %44 = zext i8 %43 to i32, !dbg !4495
  %45 = icmp eq i32 %44, 1, !dbg !4497
  br i1 %45, label %46, label %49, !dbg !4497

46:                                               ; preds = %38
  %47 = load ptr, ptr %3, align 8, !dbg !4498
  %48 = load i32, ptr %4, align 4, !dbg !4499
  call void @_Z12wall_destroyP7segmenti(ptr noundef %47, i32 noundef %48), !dbg !4500
  br label %49, !dbg !4500

49:                                               ; preds = %46, %38
  %50 = load i32, ptr %5, align 4, !dbg !4501
  %51 = sext i32 %50 to i64, !dbg !4503
  %52 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %51, !dbg !4503
  %53 = getelementptr inbounds nuw %struct.wall, ptr %52, i32 0, i32 4, !dbg !4504
  %54 = load i8, ptr %53, align 4, !dbg !4504
  %55 = zext i8 %54 to i32, !dbg !4503
  %56 = icmp eq i32 %55, 2, !dbg !4505
  br i1 %56, label %57, label %68, !dbg !4506

57:                                               ; preds = %49
  %58 = load i32, ptr %5, align 4, !dbg !4507
  %59 = sext i32 %58 to i64, !dbg !4508
  %60 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %59, !dbg !4508
  %61 = getelementptr inbounds nuw %struct.wall, ptr %60, i32 0, i32 6, !dbg !4509
  %62 = load i8, ptr %61, align 2, !dbg !4509
  %63 = zext i8 %62 to i32, !dbg !4508
  %64 = icmp eq i32 %63, 0, !dbg !4510
  br i1 %64, label %65, label %68, !dbg !4506

65:                                               ; preds = %57
  %66 = load ptr, ptr %3, align 8, !dbg !4511
  %67 = load i32, ptr %4, align 4, !dbg !4512
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %66, i32 noundef %67), !dbg !4513
  br label %68, !dbg !4513

68:                                               ; preds = %27, %65, %57, %49
  ret void, !dbg !4514
}

declare void @_Z26newdemo_record_wall_toggleii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11reset_wallsv() #1 !dbg !4515 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4516, !DIExpression(), !4517)
  %2 = load i32, ptr @Num_walls, align 4, !dbg !4518
  %3 = icmp slt i32 %2, 0, !dbg !4520
  br i1 %3, label %4, label %5, !dbg !4520

4:                                                ; preds = %0
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.28), !dbg !4521
  br label %35, !dbg !4523

5:                                                ; preds = %0
  %6 = load i32, ptr @Num_walls, align 4, !dbg !4524
  store i32 %6, ptr %1, align 4, !dbg !4526
  br label %7, !dbg !4527

7:                                                ; preds = %31, %5
  %8 = load i32, ptr %1, align 4, !dbg !4528
  %9 = icmp slt i32 %8, 254, !dbg !4530
  br i1 %9, label %10, label %34, !dbg !4531

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4, !dbg !4532
  %12 = sext i32 %11 to i64, !dbg !4534
  %13 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %12, !dbg !4534
  %14 = getelementptr inbounds nuw %struct.wall, ptr %13, i32 0, i32 4, !dbg !4535
  store i8 0, ptr %14, align 4, !dbg !4536
  %15 = load i32, ptr %1, align 4, !dbg !4537
  %16 = sext i32 %15 to i64, !dbg !4538
  %17 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %16, !dbg !4538
  %18 = getelementptr inbounds nuw %struct.wall, ptr %17, i32 0, i32 5, !dbg !4539
  store i8 0, ptr %18, align 1, !dbg !4540
  %19 = load i32, ptr %1, align 4, !dbg !4541
  %20 = sext i32 %19 to i64, !dbg !4542
  %21 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %20, !dbg !4542
  %22 = getelementptr inbounds nuw %struct.wall, ptr %21, i32 0, i32 2, !dbg !4543
  store i32 0, ptr %22, align 4, !dbg !4544
  %23 = load i32, ptr %1, align 4, !dbg !4545
  %24 = sext i32 %23 to i64, !dbg !4546
  %25 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %24, !dbg !4546
  %26 = getelementptr inbounds nuw %struct.wall, ptr %25, i32 0, i32 7, !dbg !4547
  store i8 -1, ptr %26, align 1, !dbg !4548
  %27 = load i32, ptr %1, align 4, !dbg !4549
  %28 = sext i32 %27 to i64, !dbg !4550
  %29 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %28, !dbg !4550
  %30 = getelementptr inbounds nuw %struct.wall, ptr %29, i32 0, i32 8, !dbg !4551
  store i8 -1, ptr %30, align 4, !dbg !4552
  br label %31, !dbg !4553

31:                                               ; preds = %10
  %32 = load i32, ptr %1, align 4, !dbg !4554
  %33 = add nsw i32 %32, 1, !dbg !4554
  store i32 %33, ptr %1, align 4, !dbg !4554
  br label %7, !dbg !4555, !llvm.loop !4556

34:                                               ; preds = %7
  br label %35, !dbg !4558

35:                                               ; preds = %34, %4
  ret void, !dbg !4558
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22do_cloaking_wall_framei(i32 noundef %0) #1 !dbg !4559 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4560, !DIExpression(), !4561)
    #dbg_declare(ptr %3, !4562, !DIExpression(), !4563)
    #dbg_declare(ptr %4, !4564, !DIExpression(), !4565)
    #dbg_declare(ptr %5, !4566, !DIExpression(), !4567)
  %11 = load i32, ptr @Newdemo_state, align 4, !dbg !4568
  %12 = icmp eq i32 %11, 2, !dbg !4570
  br i1 %12, label %13, label %14, !dbg !4570

13:                                               ; preds = %1
  br label %291, !dbg !4571

14:                                               ; preds = %1
  %15 = load i32, ptr %2, align 4, !dbg !4572
  %16 = sext i32 %15 to i64, !dbg !4573
  %17 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %16, !dbg !4573
  store ptr %17, ptr %3, align 8, !dbg !4574
  %18 = load ptr, ptr %3, align 8, !dbg !4575
  %19 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %18, i32 0, i32 0, !dbg !4576
  %20 = load i16, ptr %19, align 4, !dbg !4576
  %21 = sext i16 %20 to i64, !dbg !4577
  %22 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %21, !dbg !4577
  store ptr %22, ptr %4, align 8, !dbg !4578
  %23 = load ptr, ptr %3, align 8, !dbg !4579
  %24 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %23, i32 0, i32 1, !dbg !4580
  %25 = load i16, ptr %24, align 2, !dbg !4580
  %26 = sext i16 %25 to i64, !dbg !4581
  %27 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %26, !dbg !4581
  store ptr %27, ptr %5, align 8, !dbg !4582
  %28 = load i32, ptr @FrameTime, align 4, !dbg !4583
  %29 = load ptr, ptr %3, align 8, !dbg !4584
  %30 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %29, i32 0, i32 4, !dbg !4585
  %31 = load i32, ptr %30, align 4, !dbg !4586
  %32 = add nsw i32 %31, %28, !dbg !4586
  store i32 %32, ptr %30, align 4, !dbg !4586
  %33 = load ptr, ptr %3, align 8, !dbg !4587
  %34 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %33, i32 0, i32 4, !dbg !4589
  %35 = load i32, ptr %34, align 4, !dbg !4589
  %36 = icmp sgt i32 %35, 65536, !dbg !4590
  br i1 %36, label %37, label %65, !dbg !4590

37:                                               ; preds = %14
    #dbg_declare(ptr %6, !4591, !DIExpression(), !4593)
  %38 = load ptr, ptr %5, align 8, !dbg !4594
  %39 = getelementptr inbounds nuw %struct.wall, ptr %38, i32 0, i32 4, !dbg !4595
  store i8 4, ptr %39, align 4, !dbg !4596
  %40 = load ptr, ptr %4, align 8, !dbg !4597
  %41 = getelementptr inbounds nuw %struct.wall, ptr %40, i32 0, i32 4, !dbg !4598
  store i8 4, ptr %41, align 4, !dbg !4599
  %42 = load ptr, ptr %5, align 8, !dbg !4600
  %43 = getelementptr inbounds nuw %struct.wall, ptr %42, i32 0, i32 6, !dbg !4601
  store i8 0, ptr %43, align 2, !dbg !4602
  %44 = load ptr, ptr %4, align 8, !dbg !4603
  %45 = getelementptr inbounds nuw %struct.wall, ptr %44, i32 0, i32 6, !dbg !4604
  store i8 0, ptr %45, align 2, !dbg !4605
  %46 = load i32, ptr %2, align 4, !dbg !4606
  store i32 %46, ptr %6, align 4, !dbg !4608
  br label %47, !dbg !4609

47:                                               ; preds = %59, %37
  %48 = load i32, ptr %6, align 4, !dbg !4610
  %49 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !4612
  %50 = icmp slt i32 %48, %49, !dbg !4613
  br i1 %50, label %51, label %62, !dbg !4614

51:                                               ; preds = %47
  %52 = load i32, ptr %6, align 4, !dbg !4615
  %53 = add nsw i32 %52, 1, !dbg !4616
  %54 = sext i32 %53 to i64, !dbg !4617
  %55 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %54, !dbg !4617
  %56 = load i32, ptr %6, align 4, !dbg !4618
  %57 = sext i32 %56 to i64, !dbg !4619
  %58 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %57, !dbg !4619
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %58, ptr align 4 %55, i64 40, i1 false), !dbg !4620
  br label %59, !dbg !4619

59:                                               ; preds = %51
  %60 = load i32, ptr %6, align 4, !dbg !4621
  %61 = add nsw i32 %60, 1, !dbg !4621
  store i32 %61, ptr %6, align 4, !dbg !4621
  br label %47, !dbg !4622, !llvm.loop !4623

62:                                               ; preds = %47
  %63 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !4625
  %64 = add nsw i32 %63, -1, !dbg !4625
  store i32 %64, ptr @Num_cloaking_walls, align 4, !dbg !4625
  br label %209, !dbg !4626

65:                                               ; preds = %14
  %66 = load ptr, ptr %3, align 8, !dbg !4627
  %67 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %66, i32 0, i32 4, !dbg !4629
  %68 = load i32, ptr %67, align 4, !dbg !4629
  %69 = icmp sgt i32 %68, 32768, !dbg !4630
  br i1 %69, label %70, label %146, !dbg !4630

70:                                               ; preds = %65
    #dbg_declare(ptr %7, !4631, !DIExpression(), !4633)
  %71 = load ptr, ptr %4, align 8, !dbg !4634
  %72 = getelementptr inbounds nuw %struct.wall, ptr %71, i32 0, i32 4, !dbg !4635
  %73 = load i8, ptr %72, align 4, !dbg !4635
  %74 = zext i8 %73 to i32, !dbg !4634
  store i32 %74, ptr %7, align 4, !dbg !4633
  %75 = load ptr, ptr %3, align 8, !dbg !4636
  %76 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %75, i32 0, i32 4, !dbg !4637
  %77 = load i32, ptr %76, align 4, !dbg !4637
  %78 = sub nsw i32 %77, 32768, !dbg !4638
  %79 = mul nsw i32 %78, 32, !dbg !4639
  %80 = sdiv i32 %79, 32768, !dbg !4640
  %81 = trunc i32 %80 to i8, !dbg !4641
  %82 = load ptr, ptr %5, align 8, !dbg !4642
  %83 = getelementptr inbounds nuw %struct.wall, ptr %82, i32 0, i32 11, !dbg !4643
  store i8 %81, ptr %83, align 1, !dbg !4644
  %84 = load ptr, ptr %4, align 8, !dbg !4645
  %85 = getelementptr inbounds nuw %struct.wall, ptr %84, i32 0, i32 11, !dbg !4646
  store i8 %81, ptr %85, align 1, !dbg !4647
  %86 = load i32, ptr %7, align 4, !dbg !4648
  %87 = icmp ne i32 %86, 7, !dbg !4650
  br i1 %87, label %88, label %145, !dbg !4650

88:                                               ; preds = %70
    #dbg_declare(ptr %8, !4651, !DIExpression(), !4653)
  %89 = load ptr, ptr %5, align 8, !dbg !4654
  %90 = getelementptr inbounds nuw %struct.wall, ptr %89, i32 0, i32 4, !dbg !4655
  store i8 7, ptr %90, align 4, !dbg !4656
  %91 = load ptr, ptr %4, align 8, !dbg !4657
  %92 = getelementptr inbounds nuw %struct.wall, ptr %91, i32 0, i32 4, !dbg !4658
  store i8 7, ptr %92, align 4, !dbg !4659
  store i32 0, ptr %8, align 4, !dbg !4660
  br label %93, !dbg !4662

93:                                               ; preds = %141, %88
  %94 = load i32, ptr %8, align 4, !dbg !4663
  %95 = icmp slt i32 %94, 4, !dbg !4665
  br i1 %95, label %96, label %144, !dbg !4666

96:                                               ; preds = %93
  %97 = load ptr, ptr %3, align 8, !dbg !4667
  %98 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %97, i32 0, i32 2, !dbg !4669
  %99 = load i32, ptr %8, align 4, !dbg !4670
  %100 = sext i32 %99 to i64, !dbg !4667
  %101 = getelementptr inbounds [4 x i32], ptr %98, i64 0, i64 %100, !dbg !4667
  %102 = load i32, ptr %101, align 4, !dbg !4667
  %103 = load ptr, ptr %4, align 8, !dbg !4671
  %104 = getelementptr inbounds nuw %struct.wall, ptr %103, i32 0, i32 0, !dbg !4672
  %105 = load i32, ptr %104, align 4, !dbg !4672
  %106 = sext i32 %105 to i64, !dbg !4673
  %107 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %106, !dbg !4673
  %108 = getelementptr inbounds nuw %struct.segment, ptr %107, i32 0, i32 0, !dbg !4674
  %109 = load ptr, ptr %4, align 8, !dbg !4675
  %110 = getelementptr inbounds nuw %struct.wall, ptr %109, i32 0, i32 1, !dbg !4676
  %111 = load i32, ptr %110, align 4, !dbg !4676
  %112 = sext i32 %111 to i64, !dbg !4673
  %113 = getelementptr inbounds [6 x %struct.side], ptr %108, i64 0, i64 %112, !dbg !4673
  %114 = getelementptr inbounds nuw %struct.side, ptr %113, i32 0, i32 5, !dbg !4677
  %115 = load i32, ptr %8, align 4, !dbg !4678
  %116 = sext i32 %115 to i64, !dbg !4673
  %117 = getelementptr inbounds [4 x %struct.uvl], ptr %114, i64 0, i64 %116, !dbg !4673
  %118 = getelementptr inbounds nuw %struct.uvl, ptr %117, i32 0, i32 2, !dbg !4679
  store i32 %102, ptr %118, align 4, !dbg !4680
  %119 = load ptr, ptr %3, align 8, !dbg !4681
  %120 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %119, i32 0, i32 3, !dbg !4682
  %121 = load i32, ptr %8, align 4, !dbg !4683
  %122 = sext i32 %121 to i64, !dbg !4681
  %123 = getelementptr inbounds [4 x i32], ptr %120, i64 0, i64 %122, !dbg !4681
  %124 = load i32, ptr %123, align 4, !dbg !4681
  %125 = load ptr, ptr %5, align 8, !dbg !4684
  %126 = getelementptr inbounds nuw %struct.wall, ptr %125, i32 0, i32 0, !dbg !4685
  %127 = load i32, ptr %126, align 4, !dbg !4685
  %128 = sext i32 %127 to i64, !dbg !4686
  %129 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %128, !dbg !4686
  %130 = getelementptr inbounds nuw %struct.segment, ptr %129, i32 0, i32 0, !dbg !4687
  %131 = load ptr, ptr %5, align 8, !dbg !4688
  %132 = getelementptr inbounds nuw %struct.wall, ptr %131, i32 0, i32 1, !dbg !4689
  %133 = load i32, ptr %132, align 4, !dbg !4689
  %134 = sext i32 %133 to i64, !dbg !4686
  %135 = getelementptr inbounds [6 x %struct.side], ptr %130, i64 0, i64 %134, !dbg !4686
  %136 = getelementptr inbounds nuw %struct.side, ptr %135, i32 0, i32 5, !dbg !4690
  %137 = load i32, ptr %8, align 4, !dbg !4691
  %138 = sext i32 %137 to i64, !dbg !4686
  %139 = getelementptr inbounds [4 x %struct.uvl], ptr %136, i64 0, i64 %138, !dbg !4686
  %140 = getelementptr inbounds nuw %struct.uvl, ptr %139, i32 0, i32 2, !dbg !4692
  store i32 %124, ptr %140, align 4, !dbg !4693
  br label %141, !dbg !4694

141:                                              ; preds = %96
  %142 = load i32, ptr %8, align 4, !dbg !4695
  %143 = add nsw i32 %142, 1, !dbg !4695
  store i32 %143, ptr %8, align 4, !dbg !4695
  br label %93, !dbg !4696, !llvm.loop !4697

144:                                              ; preds = %93
  br label %145, !dbg !4699

145:                                              ; preds = %144, %70
  br label %208, !dbg !4700

146:                                              ; preds = %65
    #dbg_declare(ptr %9, !4701, !DIExpression(), !4703)
    #dbg_declare(ptr %10, !4704, !DIExpression(), !4705)
  %147 = load ptr, ptr %3, align 8, !dbg !4706
  %148 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %147, i32 0, i32 4, !dbg !4707
  %149 = load i32, ptr %148, align 4, !dbg !4707
  %150 = sub nsw i32 32768, %149, !dbg !4708
  %151 = call noundef i32 @_Z6fixdivii(i32 noundef %150, i32 noundef 32768), !dbg !4709
  store i32 %151, ptr %9, align 4, !dbg !4710
  store i32 0, ptr %10, align 4, !dbg !4711
  br label %152, !dbg !4713

152:                                              ; preds = %204, %146
  %153 = load i32, ptr %10, align 4, !dbg !4714
  %154 = icmp slt i32 %153, 4, !dbg !4716
  br i1 %154, label %155, label %207, !dbg !4717

155:                                              ; preds = %152
  %156 = load ptr, ptr %3, align 8, !dbg !4718
  %157 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %156, i32 0, i32 2, !dbg !4720
  %158 = load i32, ptr %10, align 4, !dbg !4721
  %159 = sext i32 %158 to i64, !dbg !4718
  %160 = getelementptr inbounds [4 x i32], ptr %157, i64 0, i64 %159, !dbg !4718
  %161 = load i32, ptr %160, align 4, !dbg !4718
  %162 = load i32, ptr %9, align 4, !dbg !4722
  %163 = call noundef i32 @_Z6fixmulii(i32 noundef %161, i32 noundef %162), !dbg !4723
  %164 = load ptr, ptr %4, align 8, !dbg !4724
  %165 = getelementptr inbounds nuw %struct.wall, ptr %164, i32 0, i32 0, !dbg !4725
  %166 = load i32, ptr %165, align 4, !dbg !4725
  %167 = sext i32 %166 to i64, !dbg !4726
  %168 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %167, !dbg !4726
  %169 = getelementptr inbounds nuw %struct.segment, ptr %168, i32 0, i32 0, !dbg !4727
  %170 = load ptr, ptr %4, align 8, !dbg !4728
  %171 = getelementptr inbounds nuw %struct.wall, ptr %170, i32 0, i32 1, !dbg !4729
  %172 = load i32, ptr %171, align 4, !dbg !4729
  %173 = sext i32 %172 to i64, !dbg !4726
  %174 = getelementptr inbounds [6 x %struct.side], ptr %169, i64 0, i64 %173, !dbg !4726
  %175 = getelementptr inbounds nuw %struct.side, ptr %174, i32 0, i32 5, !dbg !4730
  %176 = load i32, ptr %10, align 4, !dbg !4731
  %177 = sext i32 %176 to i64, !dbg !4726
  %178 = getelementptr inbounds [4 x %struct.uvl], ptr %175, i64 0, i64 %177, !dbg !4726
  %179 = getelementptr inbounds nuw %struct.uvl, ptr %178, i32 0, i32 2, !dbg !4732
  store i32 %163, ptr %179, align 4, !dbg !4733
  %180 = load ptr, ptr %3, align 8, !dbg !4734
  %181 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %180, i32 0, i32 3, !dbg !4735
  %182 = load i32, ptr %10, align 4, !dbg !4736
  %183 = sext i32 %182 to i64, !dbg !4734
  %184 = getelementptr inbounds [4 x i32], ptr %181, i64 0, i64 %183, !dbg !4734
  %185 = load i32, ptr %184, align 4, !dbg !4734
  %186 = load i32, ptr %9, align 4, !dbg !4737
  %187 = call noundef i32 @_Z6fixmulii(i32 noundef %185, i32 noundef %186), !dbg !4738
  %188 = load ptr, ptr %5, align 8, !dbg !4739
  %189 = getelementptr inbounds nuw %struct.wall, ptr %188, i32 0, i32 0, !dbg !4740
  %190 = load i32, ptr %189, align 4, !dbg !4740
  %191 = sext i32 %190 to i64, !dbg !4741
  %192 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %191, !dbg !4741
  %193 = getelementptr inbounds nuw %struct.segment, ptr %192, i32 0, i32 0, !dbg !4742
  %194 = load ptr, ptr %5, align 8, !dbg !4743
  %195 = getelementptr inbounds nuw %struct.wall, ptr %194, i32 0, i32 1, !dbg !4744
  %196 = load i32, ptr %195, align 4, !dbg !4744
  %197 = sext i32 %196 to i64, !dbg !4741
  %198 = getelementptr inbounds [6 x %struct.side], ptr %193, i64 0, i64 %197, !dbg !4741
  %199 = getelementptr inbounds nuw %struct.side, ptr %198, i32 0, i32 5, !dbg !4745
  %200 = load i32, ptr %10, align 4, !dbg !4746
  %201 = sext i32 %200 to i64, !dbg !4741
  %202 = getelementptr inbounds [4 x %struct.uvl], ptr %199, i64 0, i64 %201, !dbg !4741
  %203 = getelementptr inbounds nuw %struct.uvl, ptr %202, i32 0, i32 2, !dbg !4747
  store i32 %187, ptr %203, align 4, !dbg !4748
  br label %204, !dbg !4749

204:                                              ; preds = %155
  %205 = load i32, ptr %10, align 4, !dbg !4750
  %206 = add nsw i32 %205, 1, !dbg !4750
  store i32 %206, ptr %10, align 4, !dbg !4750
  br label %152, !dbg !4751, !llvm.loop !4752

207:                                              ; preds = %152
  br label %208

208:                                              ; preds = %207, %145
  br label %209

209:                                              ; preds = %208, %62
  %210 = load i32, ptr @Newdemo_state, align 4, !dbg !4754
  %211 = icmp eq i32 %210, 1, !dbg !4756
  br i1 %211, label %212, label %291, !dbg !4756

212:                                              ; preds = %209
  %213 = load ptr, ptr %3, align 8, !dbg !4757
  %214 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %213, i32 0, i32 0, !dbg !4758
  %215 = load i16, ptr %214, align 4, !dbg !4758
  %216 = sext i16 %215 to i32, !dbg !4757
  %217 = load ptr, ptr %3, align 8, !dbg !4759
  %218 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %217, i32 0, i32 1, !dbg !4760
  %219 = load i16, ptr %218, align 2, !dbg !4760
  %220 = sext i16 %219 to i32, !dbg !4759
  %221 = load ptr, ptr %4, align 8, !dbg !4761
  %222 = getelementptr inbounds nuw %struct.wall, ptr %221, i32 0, i32 4, !dbg !4762
  %223 = load i8, ptr %222, align 4, !dbg !4762
  %224 = load ptr, ptr %4, align 8, !dbg !4763
  %225 = getelementptr inbounds nuw %struct.wall, ptr %224, i32 0, i32 6, !dbg !4764
  %226 = load i8, ptr %225, align 2, !dbg !4764
  %227 = load ptr, ptr %4, align 8, !dbg !4765
  %228 = getelementptr inbounds nuw %struct.wall, ptr %227, i32 0, i32 11, !dbg !4766
  %229 = load i8, ptr %228, align 1, !dbg !4766
  %230 = sext i8 %229 to i32, !dbg !4765
  %231 = load ptr, ptr %4, align 8, !dbg !4767
  %232 = getelementptr inbounds nuw %struct.wall, ptr %231, i32 0, i32 0, !dbg !4768
  %233 = load i32, ptr %232, align 4, !dbg !4768
  %234 = sext i32 %233 to i64, !dbg !4769
  %235 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %234, !dbg !4769
  %236 = getelementptr inbounds nuw %struct.segment, ptr %235, i32 0, i32 0, !dbg !4770
  %237 = load ptr, ptr %4, align 8, !dbg !4771
  %238 = getelementptr inbounds nuw %struct.wall, ptr %237, i32 0, i32 1, !dbg !4772
  %239 = load i32, ptr %238, align 4, !dbg !4772
  %240 = sext i32 %239 to i64, !dbg !4769
  %241 = getelementptr inbounds [6 x %struct.side], ptr %236, i64 0, i64 %240, !dbg !4769
  %242 = getelementptr inbounds nuw %struct.side, ptr %241, i32 0, i32 5, !dbg !4773
  %243 = getelementptr inbounds [4 x %struct.uvl], ptr %242, i64 0, i64 0, !dbg !4769
  %244 = getelementptr inbounds nuw %struct.uvl, ptr %243, i32 0, i32 2, !dbg !4774
  %245 = load i32, ptr %244, align 4, !dbg !4774
  %246 = load ptr, ptr %4, align 8, !dbg !4775
  %247 = getelementptr inbounds nuw %struct.wall, ptr %246, i32 0, i32 0, !dbg !4776
  %248 = load i32, ptr %247, align 4, !dbg !4776
  %249 = sext i32 %248 to i64, !dbg !4777
  %250 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %249, !dbg !4777
  %251 = getelementptr inbounds nuw %struct.segment, ptr %250, i32 0, i32 0, !dbg !4778
  %252 = load ptr, ptr %4, align 8, !dbg !4779
  %253 = getelementptr inbounds nuw %struct.wall, ptr %252, i32 0, i32 1, !dbg !4780
  %254 = load i32, ptr %253, align 4, !dbg !4780
  %255 = sext i32 %254 to i64, !dbg !4777
  %256 = getelementptr inbounds [6 x %struct.side], ptr %251, i64 0, i64 %255, !dbg !4777
  %257 = getelementptr inbounds nuw %struct.side, ptr %256, i32 0, i32 5, !dbg !4781
  %258 = getelementptr inbounds [4 x %struct.uvl], ptr %257, i64 0, i64 1, !dbg !4777
  %259 = getelementptr inbounds nuw %struct.uvl, ptr %258, i32 0, i32 2, !dbg !4782
  %260 = load i32, ptr %259, align 4, !dbg !4782
  %261 = load ptr, ptr %4, align 8, !dbg !4783
  %262 = getelementptr inbounds nuw %struct.wall, ptr %261, i32 0, i32 0, !dbg !4784
  %263 = load i32, ptr %262, align 4, !dbg !4784
  %264 = sext i32 %263 to i64, !dbg !4785
  %265 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %264, !dbg !4785
  %266 = getelementptr inbounds nuw %struct.segment, ptr %265, i32 0, i32 0, !dbg !4786
  %267 = load ptr, ptr %4, align 8, !dbg !4787
  %268 = getelementptr inbounds nuw %struct.wall, ptr %267, i32 0, i32 1, !dbg !4788
  %269 = load i32, ptr %268, align 4, !dbg !4788
  %270 = sext i32 %269 to i64, !dbg !4785
  %271 = getelementptr inbounds [6 x %struct.side], ptr %266, i64 0, i64 %270, !dbg !4785
  %272 = getelementptr inbounds nuw %struct.side, ptr %271, i32 0, i32 5, !dbg !4789
  %273 = getelementptr inbounds [4 x %struct.uvl], ptr %272, i64 0, i64 2, !dbg !4785
  %274 = getelementptr inbounds nuw %struct.uvl, ptr %273, i32 0, i32 2, !dbg !4790
  %275 = load i32, ptr %274, align 4, !dbg !4790
  %276 = load ptr, ptr %4, align 8, !dbg !4791
  %277 = getelementptr inbounds nuw %struct.wall, ptr %276, i32 0, i32 0, !dbg !4792
  %278 = load i32, ptr %277, align 4, !dbg !4792
  %279 = sext i32 %278 to i64, !dbg !4793
  %280 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %279, !dbg !4793
  %281 = getelementptr inbounds nuw %struct.segment, ptr %280, i32 0, i32 0, !dbg !4794
  %282 = load ptr, ptr %4, align 8, !dbg !4795
  %283 = getelementptr inbounds nuw %struct.wall, ptr %282, i32 0, i32 1, !dbg !4796
  %284 = load i32, ptr %283, align 4, !dbg !4796
  %285 = sext i32 %284 to i64, !dbg !4793
  %286 = getelementptr inbounds [6 x %struct.side], ptr %281, i64 0, i64 %285, !dbg !4793
  %287 = getelementptr inbounds nuw %struct.side, ptr %286, i32 0, i32 5, !dbg !4797
  %288 = getelementptr inbounds [4 x %struct.uvl], ptr %287, i64 0, i64 3, !dbg !4793
  %289 = getelementptr inbounds nuw %struct.uvl, ptr %288, i32 0, i32 2, !dbg !4798
  %290 = load i32, ptr %289, align 4, !dbg !4798
  call void @_Z28newdemo_record_cloaking_walliihhiiiii(i32 noundef %216, i32 noundef %220, i8 noundef zeroext %223, i8 noundef zeroext %226, i32 noundef %230, i32 noundef %245, i32 noundef %260, i32 noundef %275, i32 noundef %290), !dbg !4799
  br label %291, !dbg !4799

291:                                              ; preds = %13, %212, %209
  ret void, !dbg !4800
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #0 !dbg !4801 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4804, !DIExpression(), !4805)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4806, !DIExpression(), !4807)
  %6 = load i32, ptr %5, align 4, !dbg !4808
  %7 = icmp eq i32 %6, 0, !dbg !4810
  br i1 %7, label %8, label %9, !dbg !4810

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !4811
  br label %17, !dbg !4811

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !4812
  %11 = sext i32 %10 to i64, !dbg !4812
  %12 = shl i64 %11, 16, !dbg !4813
  %13 = load i32, ptr %5, align 4, !dbg !4814
  %14 = sext i32 %13 to i64, !dbg !4814
  %15 = sdiv i64 %12, %14, !dbg !4815
  %16 = trunc i64 %15 to i32, !dbg !4816
  store i32 %16, ptr %3, align 4, !dbg !4817
  br label %17, !dbg !4817

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !4818
  ret i32 %18, !dbg !4818
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #0 !dbg !4819 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !4820, !DIExpression(), !4821)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4822, !DIExpression(), !4823)
  %5 = load i32, ptr %3, align 4, !dbg !4824
  %6 = sext i32 %5 to i64, !dbg !4824
  %7 = load i32, ptr %4, align 4, !dbg !4825
  %8 = sext i32 %7 to i64, !dbg !4825
  %9 = mul nsw i64 %6, %8, !dbg !4826
  %10 = ashr i64 %9, 16, !dbg !4827
  %11 = trunc i64 %10 to i32, !dbg !4828
  ret i32 %11, !dbg !4829
}

declare void @_Z28newdemo_record_cloaking_walliihhiiiii(i32 noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24do_decloaking_wall_framei(i32 noundef %0) #1 !dbg !4830 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4831, !DIExpression(), !4832)
    #dbg_declare(ptr %3, !4833, !DIExpression(), !4834)
    #dbg_declare(ptr %4, !4835, !DIExpression(), !4836)
    #dbg_declare(ptr %5, !4837, !DIExpression(), !4838)
  %9 = load i32, ptr @Newdemo_state, align 4, !dbg !4839
  %10 = icmp eq i32 %9, 2, !dbg !4841
  br i1 %10, label %11, label %12, !dbg !4841

11:                                               ; preds = %1
  br label %281, !dbg !4842

12:                                               ; preds = %1
  %13 = load i32, ptr %2, align 4, !dbg !4843
  %14 = sext i32 %13 to i64, !dbg !4844
  %15 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %14, !dbg !4844
  store ptr %15, ptr %3, align 8, !dbg !4845
  %16 = load ptr, ptr %3, align 8, !dbg !4846
  %17 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %16, i32 0, i32 0, !dbg !4847
  %18 = load i16, ptr %17, align 4, !dbg !4847
  %19 = sext i16 %18 to i64, !dbg !4848
  %20 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %19, !dbg !4848
  store ptr %20, ptr %4, align 8, !dbg !4849
  %21 = load ptr, ptr %3, align 8, !dbg !4850
  %22 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %21, i32 0, i32 1, !dbg !4851
  %23 = load i16, ptr %22, align 2, !dbg !4851
  %24 = sext i16 %23 to i64, !dbg !4852
  %25 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %24, !dbg !4852
  store ptr %25, ptr %5, align 8, !dbg !4853
  %26 = load i32, ptr @FrameTime, align 4, !dbg !4854
  %27 = load ptr, ptr %3, align 8, !dbg !4855
  %28 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %27, i32 0, i32 4, !dbg !4856
  %29 = load i32, ptr %28, align 4, !dbg !4857
  %30 = add nsw i32 %29, %26, !dbg !4857
  store i32 %30, ptr %28, align 4, !dbg !4857
  %31 = load ptr, ptr %3, align 8, !dbg !4858
  %32 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %31, i32 0, i32 4, !dbg !4860
  %33 = load i32, ptr %32, align 4, !dbg !4860
  %34 = icmp sgt i32 %33, 65536, !dbg !4861
  br i1 %34, label %35, label %111, !dbg !4861

35:                                               ; preds = %12
    #dbg_declare(ptr %6, !4862, !DIExpression(), !4864)
  %36 = load ptr, ptr %5, align 8, !dbg !4865
  %37 = getelementptr inbounds nuw %struct.wall, ptr %36, i32 0, i32 6, !dbg !4866
  store i8 0, ptr %37, align 2, !dbg !4867
  %38 = load ptr, ptr %4, align 8, !dbg !4868
  %39 = getelementptr inbounds nuw %struct.wall, ptr %38, i32 0, i32 6, !dbg !4869
  store i8 0, ptr %39, align 2, !dbg !4870
  store i32 0, ptr %6, align 4, !dbg !4871
  br label %40, !dbg !4873

40:                                               ; preds = %88, %35
  %41 = load i32, ptr %6, align 4, !dbg !4874
  %42 = icmp slt i32 %41, 4, !dbg !4876
  br i1 %42, label %43, label %91, !dbg !4877

43:                                               ; preds = %40
  %44 = load ptr, ptr %3, align 8, !dbg !4878
  %45 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %44, i32 0, i32 2, !dbg !4880
  %46 = load i32, ptr %6, align 4, !dbg !4881
  %47 = sext i32 %46 to i64, !dbg !4878
  %48 = getelementptr inbounds [4 x i32], ptr %45, i64 0, i64 %47, !dbg !4878
  %49 = load i32, ptr %48, align 4, !dbg !4878
  %50 = load ptr, ptr %4, align 8, !dbg !4882
  %51 = getelementptr inbounds nuw %struct.wall, ptr %50, i32 0, i32 0, !dbg !4883
  %52 = load i32, ptr %51, align 4, !dbg !4883
  %53 = sext i32 %52 to i64, !dbg !4884
  %54 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %53, !dbg !4884
  %55 = getelementptr inbounds nuw %struct.segment, ptr %54, i32 0, i32 0, !dbg !4885
  %56 = load ptr, ptr %4, align 8, !dbg !4886
  %57 = getelementptr inbounds nuw %struct.wall, ptr %56, i32 0, i32 1, !dbg !4887
  %58 = load i32, ptr %57, align 4, !dbg !4887
  %59 = sext i32 %58 to i64, !dbg !4884
  %60 = getelementptr inbounds [6 x %struct.side], ptr %55, i64 0, i64 %59, !dbg !4884
  %61 = getelementptr inbounds nuw %struct.side, ptr %60, i32 0, i32 5, !dbg !4888
  %62 = load i32, ptr %6, align 4, !dbg !4889
  %63 = sext i32 %62 to i64, !dbg !4884
  %64 = getelementptr inbounds [4 x %struct.uvl], ptr %61, i64 0, i64 %63, !dbg !4884
  %65 = getelementptr inbounds nuw %struct.uvl, ptr %64, i32 0, i32 2, !dbg !4890
  store i32 %49, ptr %65, align 4, !dbg !4891
  %66 = load ptr, ptr %3, align 8, !dbg !4892
  %67 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %66, i32 0, i32 3, !dbg !4893
  %68 = load i32, ptr %6, align 4, !dbg !4894
  %69 = sext i32 %68 to i64, !dbg !4892
  %70 = getelementptr inbounds [4 x i32], ptr %67, i64 0, i64 %69, !dbg !4892
  %71 = load i32, ptr %70, align 4, !dbg !4892
  %72 = load ptr, ptr %5, align 8, !dbg !4895
  %73 = getelementptr inbounds nuw %struct.wall, ptr %72, i32 0, i32 0, !dbg !4896
  %74 = load i32, ptr %73, align 4, !dbg !4896
  %75 = sext i32 %74 to i64, !dbg !4897
  %76 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %75, !dbg !4897
  %77 = getelementptr inbounds nuw %struct.segment, ptr %76, i32 0, i32 0, !dbg !4898
  %78 = load ptr, ptr %5, align 8, !dbg !4899
  %79 = getelementptr inbounds nuw %struct.wall, ptr %78, i32 0, i32 1, !dbg !4900
  %80 = load i32, ptr %79, align 4, !dbg !4900
  %81 = sext i32 %80 to i64, !dbg !4897
  %82 = getelementptr inbounds [6 x %struct.side], ptr %77, i64 0, i64 %81, !dbg !4897
  %83 = getelementptr inbounds nuw %struct.side, ptr %82, i32 0, i32 5, !dbg !4901
  %84 = load i32, ptr %6, align 4, !dbg !4902
  %85 = sext i32 %84 to i64, !dbg !4897
  %86 = getelementptr inbounds [4 x %struct.uvl], ptr %83, i64 0, i64 %85, !dbg !4897
  %87 = getelementptr inbounds nuw %struct.uvl, ptr %86, i32 0, i32 2, !dbg !4903
  store i32 %71, ptr %87, align 4, !dbg !4904
  br label %88, !dbg !4905

88:                                               ; preds = %43
  %89 = load i32, ptr %6, align 4, !dbg !4906
  %90 = add nsw i32 %89, 1, !dbg !4906
  store i32 %90, ptr %6, align 4, !dbg !4906
  br label %40, !dbg !4907, !llvm.loop !4908

91:                                               ; preds = %40
  %92 = load i32, ptr %2, align 4, !dbg !4910
  store i32 %92, ptr %6, align 4, !dbg !4912
  br label %93, !dbg !4913

93:                                               ; preds = %105, %91
  %94 = load i32, ptr %6, align 4, !dbg !4914
  %95 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !4916
  %96 = icmp slt i32 %94, %95, !dbg !4917
  br i1 %96, label %97, label %108, !dbg !4918

97:                                               ; preds = %93
  %98 = load i32, ptr %6, align 4, !dbg !4919
  %99 = add nsw i32 %98, 1, !dbg !4920
  %100 = sext i32 %99 to i64, !dbg !4921
  %101 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %100, !dbg !4921
  %102 = load i32, ptr %6, align 4, !dbg !4922
  %103 = sext i32 %102 to i64, !dbg !4923
  %104 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %103, !dbg !4923
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %104, ptr align 4 %101, i64 40, i1 false), !dbg !4924
  br label %105, !dbg !4923

105:                                              ; preds = %97
  %106 = load i32, ptr %6, align 4, !dbg !4925
  %107 = add nsw i32 %106, 1, !dbg !4925
  store i32 %107, ptr %6, align 4, !dbg !4925
  br label %93, !dbg !4926, !llvm.loop !4927

108:                                              ; preds = %93
  %109 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !4929
  %110 = add nsw i32 %109, -1, !dbg !4929
  store i32 %110, ptr @Num_cloaking_walls, align 4, !dbg !4929
  br label %199, !dbg !4930

111:                                              ; preds = %12
  %112 = load ptr, ptr %3, align 8, !dbg !4931
  %113 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %112, i32 0, i32 4, !dbg !4933
  %114 = load i32, ptr %113, align 4, !dbg !4933
  %115 = icmp sgt i32 %114, 32768, !dbg !4934
  br i1 %115, label %116, label %182, !dbg !4934

116:                                              ; preds = %111
    #dbg_declare(ptr %7, !4935, !DIExpression(), !4937)
    #dbg_declare(ptr %8, !4938, !DIExpression(), !4939)
  %117 = load ptr, ptr %5, align 8, !dbg !4940
  %118 = getelementptr inbounds nuw %struct.wall, ptr %117, i32 0, i32 4, !dbg !4941
  store i8 5, ptr %118, align 4, !dbg !4942
  %119 = load ptr, ptr %4, align 8, !dbg !4943
  %120 = getelementptr inbounds nuw %struct.wall, ptr %119, i32 0, i32 4, !dbg !4944
  store i8 5, ptr %120, align 4, !dbg !4945
  %121 = load ptr, ptr %3, align 8, !dbg !4946
  %122 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %121, i32 0, i32 4, !dbg !4947
  %123 = load i32, ptr %122, align 4, !dbg !4947
  %124 = sub nsw i32 %123, 32768, !dbg !4948
  %125 = call noundef i32 @_Z6fixdivii(i32 noundef %124, i32 noundef 32768), !dbg !4949
  store i32 %125, ptr %7, align 4, !dbg !4950
  store i32 0, ptr %8, align 4, !dbg !4951
  br label %126, !dbg !4953

126:                                              ; preds = %178, %116
  %127 = load i32, ptr %8, align 4, !dbg !4954
  %128 = icmp slt i32 %127, 4, !dbg !4956
  br i1 %128, label %129, label %181, !dbg !4957

129:                                              ; preds = %126
  %130 = load ptr, ptr %3, align 8, !dbg !4958
  %131 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %130, i32 0, i32 2, !dbg !4960
  %132 = load i32, ptr %8, align 4, !dbg !4961
  %133 = sext i32 %132 to i64, !dbg !4958
  %134 = getelementptr inbounds [4 x i32], ptr %131, i64 0, i64 %133, !dbg !4958
  %135 = load i32, ptr %134, align 4, !dbg !4958
  %136 = load i32, ptr %7, align 4, !dbg !4962
  %137 = call noundef i32 @_Z6fixmulii(i32 noundef %135, i32 noundef %136), !dbg !4963
  %138 = load ptr, ptr %4, align 8, !dbg !4964
  %139 = getelementptr inbounds nuw %struct.wall, ptr %138, i32 0, i32 0, !dbg !4965
  %140 = load i32, ptr %139, align 4, !dbg !4965
  %141 = sext i32 %140 to i64, !dbg !4966
  %142 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %141, !dbg !4966
  %143 = getelementptr inbounds nuw %struct.segment, ptr %142, i32 0, i32 0, !dbg !4967
  %144 = load ptr, ptr %4, align 8, !dbg !4968
  %145 = getelementptr inbounds nuw %struct.wall, ptr %144, i32 0, i32 1, !dbg !4969
  %146 = load i32, ptr %145, align 4, !dbg !4969
  %147 = sext i32 %146 to i64, !dbg !4966
  %148 = getelementptr inbounds [6 x %struct.side], ptr %143, i64 0, i64 %147, !dbg !4966
  %149 = getelementptr inbounds nuw %struct.side, ptr %148, i32 0, i32 5, !dbg !4970
  %150 = load i32, ptr %8, align 4, !dbg !4971
  %151 = sext i32 %150 to i64, !dbg !4966
  %152 = getelementptr inbounds [4 x %struct.uvl], ptr %149, i64 0, i64 %151, !dbg !4966
  %153 = getelementptr inbounds nuw %struct.uvl, ptr %152, i32 0, i32 2, !dbg !4972
  store i32 %137, ptr %153, align 4, !dbg !4973
  %154 = load ptr, ptr %3, align 8, !dbg !4974
  %155 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %154, i32 0, i32 3, !dbg !4975
  %156 = load i32, ptr %8, align 4, !dbg !4976
  %157 = sext i32 %156 to i64, !dbg !4974
  %158 = getelementptr inbounds [4 x i32], ptr %155, i64 0, i64 %157, !dbg !4974
  %159 = load i32, ptr %158, align 4, !dbg !4974
  %160 = load i32, ptr %7, align 4, !dbg !4977
  %161 = call noundef i32 @_Z6fixmulii(i32 noundef %159, i32 noundef %160), !dbg !4978
  %162 = load ptr, ptr %5, align 8, !dbg !4979
  %163 = getelementptr inbounds nuw %struct.wall, ptr %162, i32 0, i32 0, !dbg !4980
  %164 = load i32, ptr %163, align 4, !dbg !4980
  %165 = sext i32 %164 to i64, !dbg !4981
  %166 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %165, !dbg !4981
  %167 = getelementptr inbounds nuw %struct.segment, ptr %166, i32 0, i32 0, !dbg !4982
  %168 = load ptr, ptr %5, align 8, !dbg !4983
  %169 = getelementptr inbounds nuw %struct.wall, ptr %168, i32 0, i32 1, !dbg !4984
  %170 = load i32, ptr %169, align 4, !dbg !4984
  %171 = sext i32 %170 to i64, !dbg !4981
  %172 = getelementptr inbounds [6 x %struct.side], ptr %167, i64 0, i64 %171, !dbg !4981
  %173 = getelementptr inbounds nuw %struct.side, ptr %172, i32 0, i32 5, !dbg !4985
  %174 = load i32, ptr %8, align 4, !dbg !4986
  %175 = sext i32 %174 to i64, !dbg !4981
  %176 = getelementptr inbounds [4 x %struct.uvl], ptr %173, i64 0, i64 %175, !dbg !4981
  %177 = getelementptr inbounds nuw %struct.uvl, ptr %176, i32 0, i32 2, !dbg !4987
  store i32 %161, ptr %177, align 4, !dbg !4988
  br label %178, !dbg !4989

178:                                              ; preds = %129
  %179 = load i32, ptr %8, align 4, !dbg !4990
  %180 = add nsw i32 %179, 1, !dbg !4990
  store i32 %180, ptr %8, align 4, !dbg !4990
  br label %126, !dbg !4991, !llvm.loop !4992

181:                                              ; preds = %126
  br label %198, !dbg !4994

182:                                              ; preds = %111
  %183 = load ptr, ptr %3, align 8, !dbg !4995
  %184 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %183, i32 0, i32 4, !dbg !4997
  %185 = load i32, ptr %184, align 4, !dbg !4997
  %186 = sub nsw i32 32768, %185, !dbg !4998
  %187 = mul nsw i32 %186, 32, !dbg !4999
  %188 = sdiv i32 %187, 32768, !dbg !5000
  %189 = trunc i32 %188 to i8, !dbg !5001
  %190 = load ptr, ptr %5, align 8, !dbg !5002
  %191 = getelementptr inbounds nuw %struct.wall, ptr %190, i32 0, i32 11, !dbg !5003
  store i8 %189, ptr %191, align 1, !dbg !5004
  %192 = load ptr, ptr %4, align 8, !dbg !5005
  %193 = getelementptr inbounds nuw %struct.wall, ptr %192, i32 0, i32 11, !dbg !5006
  store i8 %189, ptr %193, align 1, !dbg !5007
  %194 = load ptr, ptr %5, align 8, !dbg !5008
  %195 = getelementptr inbounds nuw %struct.wall, ptr %194, i32 0, i32 4, !dbg !5009
  store i8 7, ptr %195, align 4, !dbg !5010
  %196 = load ptr, ptr %4, align 8, !dbg !5011
  %197 = getelementptr inbounds nuw %struct.wall, ptr %196, i32 0, i32 4, !dbg !5012
  store i8 7, ptr %197, align 4, !dbg !5013
  br label %198

198:                                              ; preds = %182, %181
  br label %199

199:                                              ; preds = %198, %108
  %200 = load i32, ptr @Newdemo_state, align 4, !dbg !5014
  %201 = icmp eq i32 %200, 1, !dbg !5016
  br i1 %201, label %202, label %281, !dbg !5016

202:                                              ; preds = %199
  %203 = load ptr, ptr %3, align 8, !dbg !5017
  %204 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %203, i32 0, i32 0, !dbg !5018
  %205 = load i16, ptr %204, align 4, !dbg !5018
  %206 = sext i16 %205 to i32, !dbg !5017
  %207 = load ptr, ptr %3, align 8, !dbg !5019
  %208 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %207, i32 0, i32 1, !dbg !5020
  %209 = load i16, ptr %208, align 2, !dbg !5020
  %210 = sext i16 %209 to i32, !dbg !5019
  %211 = load ptr, ptr %4, align 8, !dbg !5021
  %212 = getelementptr inbounds nuw %struct.wall, ptr %211, i32 0, i32 4, !dbg !5022
  %213 = load i8, ptr %212, align 4, !dbg !5022
  %214 = load ptr, ptr %4, align 8, !dbg !5023
  %215 = getelementptr inbounds nuw %struct.wall, ptr %214, i32 0, i32 6, !dbg !5024
  %216 = load i8, ptr %215, align 2, !dbg !5024
  %217 = load ptr, ptr %4, align 8, !dbg !5025
  %218 = getelementptr inbounds nuw %struct.wall, ptr %217, i32 0, i32 11, !dbg !5026
  %219 = load i8, ptr %218, align 1, !dbg !5026
  %220 = sext i8 %219 to i32, !dbg !5025
  %221 = load ptr, ptr %4, align 8, !dbg !5027
  %222 = getelementptr inbounds nuw %struct.wall, ptr %221, i32 0, i32 0, !dbg !5028
  %223 = load i32, ptr %222, align 4, !dbg !5028
  %224 = sext i32 %223 to i64, !dbg !5029
  %225 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %224, !dbg !5029
  %226 = getelementptr inbounds nuw %struct.segment, ptr %225, i32 0, i32 0, !dbg !5030
  %227 = load ptr, ptr %4, align 8, !dbg !5031
  %228 = getelementptr inbounds nuw %struct.wall, ptr %227, i32 0, i32 1, !dbg !5032
  %229 = load i32, ptr %228, align 4, !dbg !5032
  %230 = sext i32 %229 to i64, !dbg !5029
  %231 = getelementptr inbounds [6 x %struct.side], ptr %226, i64 0, i64 %230, !dbg !5029
  %232 = getelementptr inbounds nuw %struct.side, ptr %231, i32 0, i32 5, !dbg !5033
  %233 = getelementptr inbounds [4 x %struct.uvl], ptr %232, i64 0, i64 0, !dbg !5029
  %234 = getelementptr inbounds nuw %struct.uvl, ptr %233, i32 0, i32 2, !dbg !5034
  %235 = load i32, ptr %234, align 4, !dbg !5034
  %236 = load ptr, ptr %4, align 8, !dbg !5035
  %237 = getelementptr inbounds nuw %struct.wall, ptr %236, i32 0, i32 0, !dbg !5036
  %238 = load i32, ptr %237, align 4, !dbg !5036
  %239 = sext i32 %238 to i64, !dbg !5037
  %240 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %239, !dbg !5037
  %241 = getelementptr inbounds nuw %struct.segment, ptr %240, i32 0, i32 0, !dbg !5038
  %242 = load ptr, ptr %4, align 8, !dbg !5039
  %243 = getelementptr inbounds nuw %struct.wall, ptr %242, i32 0, i32 1, !dbg !5040
  %244 = load i32, ptr %243, align 4, !dbg !5040
  %245 = sext i32 %244 to i64, !dbg !5037
  %246 = getelementptr inbounds [6 x %struct.side], ptr %241, i64 0, i64 %245, !dbg !5037
  %247 = getelementptr inbounds nuw %struct.side, ptr %246, i32 0, i32 5, !dbg !5041
  %248 = getelementptr inbounds [4 x %struct.uvl], ptr %247, i64 0, i64 1, !dbg !5037
  %249 = getelementptr inbounds nuw %struct.uvl, ptr %248, i32 0, i32 2, !dbg !5042
  %250 = load i32, ptr %249, align 4, !dbg !5042
  %251 = load ptr, ptr %4, align 8, !dbg !5043
  %252 = getelementptr inbounds nuw %struct.wall, ptr %251, i32 0, i32 0, !dbg !5044
  %253 = load i32, ptr %252, align 4, !dbg !5044
  %254 = sext i32 %253 to i64, !dbg !5045
  %255 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %254, !dbg !5045
  %256 = getelementptr inbounds nuw %struct.segment, ptr %255, i32 0, i32 0, !dbg !5046
  %257 = load ptr, ptr %4, align 8, !dbg !5047
  %258 = getelementptr inbounds nuw %struct.wall, ptr %257, i32 0, i32 1, !dbg !5048
  %259 = load i32, ptr %258, align 4, !dbg !5048
  %260 = sext i32 %259 to i64, !dbg !5045
  %261 = getelementptr inbounds [6 x %struct.side], ptr %256, i64 0, i64 %260, !dbg !5045
  %262 = getelementptr inbounds nuw %struct.side, ptr %261, i32 0, i32 5, !dbg !5049
  %263 = getelementptr inbounds [4 x %struct.uvl], ptr %262, i64 0, i64 2, !dbg !5045
  %264 = getelementptr inbounds nuw %struct.uvl, ptr %263, i32 0, i32 2, !dbg !5050
  %265 = load i32, ptr %264, align 4, !dbg !5050
  %266 = load ptr, ptr %4, align 8, !dbg !5051
  %267 = getelementptr inbounds nuw %struct.wall, ptr %266, i32 0, i32 0, !dbg !5052
  %268 = load i32, ptr %267, align 4, !dbg !5052
  %269 = sext i32 %268 to i64, !dbg !5053
  %270 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %269, !dbg !5053
  %271 = getelementptr inbounds nuw %struct.segment, ptr %270, i32 0, i32 0, !dbg !5054
  %272 = load ptr, ptr %4, align 8, !dbg !5055
  %273 = getelementptr inbounds nuw %struct.wall, ptr %272, i32 0, i32 1, !dbg !5056
  %274 = load i32, ptr %273, align 4, !dbg !5056
  %275 = sext i32 %274 to i64, !dbg !5053
  %276 = getelementptr inbounds [6 x %struct.side], ptr %271, i64 0, i64 %275, !dbg !5053
  %277 = getelementptr inbounds nuw %struct.side, ptr %276, i32 0, i32 5, !dbg !5057
  %278 = getelementptr inbounds [4 x %struct.uvl], ptr %277, i64 0, i64 3, !dbg !5053
  %279 = getelementptr inbounds nuw %struct.uvl, ptr %278, i32 0, i32 2, !dbg !5058
  %280 = load i32, ptr %279, align 4, !dbg !5058
  call void @_Z28newdemo_record_cloaking_walliihhiiiii(i32 noundef %206, i32 noundef %210, i8 noundef zeroext %213, i8 noundef zeroext %216, i32 noundef %220, i32 noundef %235, i32 noundef %250, i32 noundef %265, i32 noundef %280), !dbg !5059
  br label %281, !dbg !5059

281:                                              ; preds = %11, %202, %199
  ret void, !dbg !5060
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18wall_frame_processv() #1 !dbg !5061 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
    #dbg_declare(ptr %1, !5062, !DIExpression(), !5063)
  store i32 0, ptr %1, align 4, !dbg !5064
  br label %7, !dbg !5066

7:                                                ; preds = %128, %0
  %8 = load i32, ptr %1, align 4, !dbg !5067
  %9 = load i32, ptr @Num_open_doors, align 4, !dbg !5069
  %10 = icmp slt i32 %8, %9, !dbg !5070
  br i1 %10, label %11, label %131, !dbg !5071

11:                                               ; preds = %7
    #dbg_declare(ptr %2, !5072, !DIExpression(), !5074)
    #dbg_declare(ptr %3, !5075, !DIExpression(), !5076)
  %12 = load i32, ptr %1, align 4, !dbg !5077
  %13 = sext i32 %12 to i64, !dbg !5078
  %14 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %13, !dbg !5078
  store ptr %14, ptr %2, align 8, !dbg !5079
  %15 = load ptr, ptr %2, align 8, !dbg !5080
  %16 = getelementptr inbounds nuw %struct.active_door, ptr %15, i32 0, i32 1, !dbg !5081
  %17 = getelementptr inbounds [2 x i16], ptr %16, i64 0, i64 0, !dbg !5080
  %18 = load i16, ptr %17, align 4, !dbg !5080
  %19 = sext i16 %18 to i64, !dbg !5082
  %20 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %19, !dbg !5082
  store ptr %20, ptr %3, align 8, !dbg !5083
  %21 = load ptr, ptr %3, align 8, !dbg !5084
  %22 = getelementptr inbounds nuw %struct.wall, ptr %21, i32 0, i32 6, !dbg !5086
  %23 = load i8, ptr %22, align 2, !dbg !5086
  %24 = zext i8 %23 to i32, !dbg !5084
  %25 = icmp eq i32 %24, 1, !dbg !5087
  br i1 %25, label %26, label %28, !dbg !5087

26:                                               ; preds = %11
  %27 = load i32, ptr %1, align 4, !dbg !5088
  call void @_Z12do_door_openi(i32 noundef %27), !dbg !5089
  br label %127, !dbg !5089

28:                                               ; preds = %11
  %29 = load ptr, ptr %3, align 8, !dbg !5090
  %30 = getelementptr inbounds nuw %struct.wall, ptr %29, i32 0, i32 6, !dbg !5092
  %31 = load i8, ptr %30, align 2, !dbg !5092
  %32 = zext i8 %31 to i32, !dbg !5090
  %33 = icmp eq i32 %32, 3, !dbg !5093
  br i1 %33, label %34, label %36, !dbg !5093

34:                                               ; preds = %28
  %35 = load i32, ptr %1, align 4, !dbg !5094
  call void @_Z13do_door_closei(i32 noundef %35), !dbg !5095
  br label %126, !dbg !5095

36:                                               ; preds = %28
  %37 = load ptr, ptr %3, align 8, !dbg !5096
  %38 = getelementptr inbounds nuw %struct.wall, ptr %37, i32 0, i32 6, !dbg !5098
  %39 = load i8, ptr %38, align 2, !dbg !5098
  %40 = zext i8 %39 to i32, !dbg !5096
  %41 = icmp eq i32 %40, 2, !dbg !5099
  br i1 %41, label %42, label %92, !dbg !5099

42:                                               ; preds = %36
  %43 = load i32, ptr @FrameTime, align 4, !dbg !5100
  %44 = load ptr, ptr %2, align 8, !dbg !5102
  %45 = getelementptr inbounds nuw %struct.active_door, ptr %44, i32 0, i32 3, !dbg !5103
  %46 = load i32, ptr %45, align 4, !dbg !5104
  %47 = add nsw i32 %46, %43, !dbg !5104
  store i32 %47, ptr %45, align 4, !dbg !5104
  %48 = load ptr, ptr %2, align 8, !dbg !5105
  %49 = getelementptr inbounds nuw %struct.active_door, ptr %48, i32 0, i32 0, !dbg !5105
  %50 = load i32, ptr %49, align 4, !dbg !5105
  %51 = icmp eq i32 %50, 1, !dbg !5105
  %52 = zext i1 %51 to i32, !dbg !5105
  call void @_Z7_AssertiPKcS0_i(i32 noundef %52, ptr noundef @.str.29, ptr noundef @.str.1, i32 noundef 1352), !dbg !5105
  %53 = load ptr, ptr %3, align 8, !dbg !5106
  %54 = getelementptr inbounds nuw %struct.wall, ptr %53, i32 0, i32 5, !dbg !5107
  %55 = load i8, ptr %54, align 1, !dbg !5108
  %56 = zext i8 %55 to i32, !dbg !5108
  %57 = or i32 %56, 2, !dbg !5108
  %58 = trunc i32 %57 to i8, !dbg !5108
  store i8 %58, ptr %54, align 1, !dbg !5108
  %59 = load ptr, ptr %2, align 8, !dbg !5109
  %60 = getelementptr inbounds nuw %struct.active_door, ptr %59, i32 0, i32 2, !dbg !5110
  %61 = getelementptr inbounds [2 x i16], ptr %60, i64 0, i64 0, !dbg !5109
  %62 = load i16, ptr %61, align 4, !dbg !5109
  %63 = sext i16 %62 to i64, !dbg !5111
  %64 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %63, !dbg !5111
  %65 = getelementptr inbounds nuw %struct.wall, ptr %64, i32 0, i32 5, !dbg !5112
  %66 = load i8, ptr %65, align 1, !dbg !5113
  %67 = zext i8 %66 to i32, !dbg !5113
  %68 = or i32 %67, 2, !dbg !5113
  %69 = trunc i32 %68 to i8, !dbg !5113
  store i8 %69, ptr %65, align 1, !dbg !5113
  %70 = load ptr, ptr %2, align 8, !dbg !5114
  %71 = getelementptr inbounds nuw %struct.active_door, ptr %70, i32 0, i32 3, !dbg !5116
  %72 = load i32, ptr %71, align 4, !dbg !5116
  %73 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !5117
  %74 = icmp sgt i32 %72, %73, !dbg !5118
  br i1 %74, label %75, label %91, !dbg !5119

75:                                               ; preds = %42
  %76 = load ptr, ptr %3, align 8, !dbg !5120
  %77 = getelementptr inbounds nuw %struct.wall, ptr %76, i32 0, i32 0, !dbg !5121
  %78 = load i32, ptr %77, align 4, !dbg !5121
  %79 = sext i32 %78 to i64, !dbg !5122
  %80 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %79, !dbg !5122
  %81 = load ptr, ptr %3, align 8, !dbg !5123
  %82 = getelementptr inbounds nuw %struct.wall, ptr %81, i32 0, i32 1, !dbg !5124
  %83 = load i32, ptr %82, align 4, !dbg !5124
  %84 = call noundef i32 @_Z12is_door_freeP7segmenti(ptr noundef %80, i32 noundef %83), !dbg !5125
  %85 = icmp ne i32 %84, 0, !dbg !5125
  br i1 %85, label %86, label %91, !dbg !5119

86:                                               ; preds = %75
  %87 = load ptr, ptr %3, align 8, !dbg !5126
  %88 = getelementptr inbounds nuw %struct.wall, ptr %87, i32 0, i32 6, !dbg !5128
  store i8 3, ptr %88, align 2, !dbg !5129
  %89 = load ptr, ptr %2, align 8, !dbg !5130
  %90 = getelementptr inbounds nuw %struct.active_door, ptr %89, i32 0, i32 3, !dbg !5131
  store i32 0, ptr %90, align 4, !dbg !5132
  br label %91, !dbg !5133

91:                                               ; preds = %86, %75, %42
  br label %125, !dbg !5134

92:                                               ; preds = %36
  %93 = load ptr, ptr %3, align 8, !dbg !5135
  %94 = getelementptr inbounds nuw %struct.wall, ptr %93, i32 0, i32 6, !dbg !5137
  %95 = load i8, ptr %94, align 2, !dbg !5137
  %96 = zext i8 %95 to i32, !dbg !5135
  %97 = icmp eq i32 %96, 0, !dbg !5138
  br i1 %97, label %104, label %98, !dbg !5139

98:                                               ; preds = %92
  %99 = load ptr, ptr %3, align 8, !dbg !5140
  %100 = getelementptr inbounds nuw %struct.wall, ptr %99, i32 0, i32 6, !dbg !5141
  %101 = load i8, ptr %100, align 2, !dbg !5141
  %102 = zext i8 %101 to i32, !dbg !5140
  %103 = icmp eq i32 %102, 4, !dbg !5142
  br i1 %103, label %104, label %124, !dbg !5139

104:                                              ; preds = %98, %92
    #dbg_declare(ptr %4, !5143, !DIExpression(), !5145)
  call void @_Z4Int3v(), !dbg !5146
  %105 = load i32, ptr %1, align 4, !dbg !5147
  store i32 %105, ptr %4, align 4, !dbg !5149
  br label %106, !dbg !5150

106:                                              ; preds = %118, %104
  %107 = load i32, ptr %4, align 4, !dbg !5151
  %108 = load i32, ptr @Num_open_doors, align 4, !dbg !5153
  %109 = icmp slt i32 %107, %108, !dbg !5154
  br i1 %109, label %110, label %121, !dbg !5155

110:                                              ; preds = %106
  %111 = load i32, ptr %4, align 4, !dbg !5156
  %112 = add nsw i32 %111, 1, !dbg !5157
  %113 = sext i32 %112 to i64, !dbg !5158
  %114 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %113, !dbg !5158
  %115 = load i32, ptr %4, align 4, !dbg !5159
  %116 = sext i32 %115 to i64, !dbg !5160
  %117 = getelementptr inbounds [90 x %struct.active_door], ptr @ActiveDoors, i64 0, i64 %116, !dbg !5160
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %117, ptr align 4 %114, i64 16, i1 false), !dbg !5161
  br label %118, !dbg !5160

118:                                              ; preds = %110
  %119 = load i32, ptr %4, align 4, !dbg !5162
  %120 = add nsw i32 %119, 1, !dbg !5162
  store i32 %120, ptr %4, align 4, !dbg !5162
  br label %106, !dbg !5163, !llvm.loop !5164

121:                                              ; preds = %106
  %122 = load i32, ptr @Num_open_doors, align 4, !dbg !5166
  %123 = add nsw i32 %122, -1, !dbg !5166
  store i32 %123, ptr @Num_open_doors, align 4, !dbg !5166
  br label %124, !dbg !5167

124:                                              ; preds = %121, %98
  br label %125

125:                                              ; preds = %124, %91
  br label %126

126:                                              ; preds = %125, %34
  br label %127

127:                                              ; preds = %126, %26
  br label %128, !dbg !5168

128:                                              ; preds = %127
  %129 = load i32, ptr %1, align 4, !dbg !5169
  %130 = add nsw i32 %129, 1, !dbg !5169
  store i32 %130, ptr %1, align 4, !dbg !5169
  br label %7, !dbg !5170, !llvm.loop !5171

131:                                              ; preds = %7
  store i32 0, ptr %1, align 4, !dbg !5173
  br label %132, !dbg !5175

132:                                              ; preds = %163, %131
  %133 = load i32, ptr %1, align 4, !dbg !5176
  %134 = load i32, ptr @Num_cloaking_walls, align 4, !dbg !5178
  %135 = icmp slt i32 %133, %134, !dbg !5179
  br i1 %135, label %136, label %166, !dbg !5180

136:                                              ; preds = %132
    #dbg_declare(ptr %5, !5181, !DIExpression(), !5183)
    #dbg_declare(ptr %6, !5184, !DIExpression(), !5185)
  %137 = load i32, ptr %1, align 4, !dbg !5186
  %138 = sext i32 %137 to i64, !dbg !5187
  %139 = getelementptr inbounds [10 x %struct.cloaking_wall], ptr @CloakingWalls, i64 0, i64 %138, !dbg !5187
  store ptr %139, ptr %5, align 8, !dbg !5188
  %140 = load ptr, ptr %5, align 8, !dbg !5189
  %141 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %140, i32 0, i32 0, !dbg !5190
  %142 = load i16, ptr %141, align 4, !dbg !5190
  %143 = sext i16 %142 to i64, !dbg !5191
  %144 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %143, !dbg !5191
  store ptr %144, ptr %6, align 8, !dbg !5192
  %145 = load ptr, ptr %6, align 8, !dbg !5193
  %146 = getelementptr inbounds nuw %struct.wall, ptr %145, i32 0, i32 6, !dbg !5195
  %147 = load i8, ptr %146, align 2, !dbg !5195
  %148 = zext i8 %147 to i32, !dbg !5193
  %149 = icmp eq i32 %148, 5, !dbg !5196
  br i1 %149, label %150, label %152, !dbg !5196

150:                                              ; preds = %136
  %151 = load i32, ptr %1, align 4, !dbg !5197
  call void @_Z22do_cloaking_wall_framei(i32 noundef %151), !dbg !5198
  br label %162, !dbg !5198

152:                                              ; preds = %136
  %153 = load ptr, ptr %6, align 8, !dbg !5199
  %154 = getelementptr inbounds nuw %struct.wall, ptr %153, i32 0, i32 6, !dbg !5201
  %155 = load i8, ptr %154, align 2, !dbg !5201
  %156 = zext i8 %155 to i32, !dbg !5199
  %157 = icmp eq i32 %156, 6, !dbg !5202
  br i1 %157, label %158, label %160, !dbg !5202

158:                                              ; preds = %152
  %159 = load i32, ptr %1, align 4, !dbg !5203
  call void @_Z24do_decloaking_wall_framei(i32 noundef %159), !dbg !5204
  br label %161, !dbg !5204

160:                                              ; preds = %152
  call void @_Z4Int3v(), !dbg !5205
  br label %161

161:                                              ; preds = %160, %158
  br label %162

162:                                              ; preds = %161, %150
  br label %163, !dbg !5206

163:                                              ; preds = %162
  %164 = load i32, ptr %1, align 4, !dbg !5207
  %165 = add nsw i32 %164, 1, !dbg !5207
  store i32 %165, ptr %1, align 4, !dbg !5207
  br label %132, !dbg !5208, !llvm.loop !5209

166:                                              ; preds = %132
  ret void, !dbg !5211
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #0 !dbg !5212 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !5215, !DIExpression(), !5216)
  %3 = load i32, ptr %2, align 4, !dbg !5217
  %4 = shl i32 %3, 16, !dbg !5218
  ret i32 %4, !dbg !5219
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16add_stuck_objectP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #1 !dbg !5220 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5223, !DIExpression(), !5224)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5225, !DIExpression(), !5226)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !5227, !DIExpression(), !5228)
    #dbg_declare(ptr %7, !5229, !DIExpression(), !5230)
    #dbg_declare(ptr %8, !5231, !DIExpression(), !5232)
  %9 = load i32, ptr %5, align 4, !dbg !5233
  %10 = sext i32 %9 to i64, !dbg !5234
  %11 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %10, !dbg !5234
  %12 = getelementptr inbounds nuw %struct.segment, ptr %11, i32 0, i32 0, !dbg !5235
  %13 = load i32, ptr %6, align 4, !dbg !5236
  %14 = sext i32 %13 to i64, !dbg !5234
  %15 = getelementptr inbounds [6 x %struct.side], ptr %12, i64 0, i64 %14, !dbg !5234
  %16 = getelementptr inbounds nuw %struct.side, ptr %15, i32 0, i32 2, !dbg !5237
  %17 = load i16, ptr %16, align 2, !dbg !5237
  %18 = sext i16 %17 to i32, !dbg !5234
  store i32 %18, ptr %8, align 4, !dbg !5238
  %19 = load i32, ptr %8, align 4, !dbg !5239
  %20 = icmp ne i32 %19, -1, !dbg !5241
  br i1 %20, label %21, label %89, !dbg !5241

21:                                               ; preds = %3
  %22 = load i32, ptr %8, align 4, !dbg !5242
  %23 = sext i32 %22 to i64, !dbg !5245
  %24 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %23, !dbg !5245
  %25 = getelementptr inbounds nuw %struct.wall, ptr %24, i32 0, i32 5, !dbg !5246
  %26 = load i8, ptr %25, align 1, !dbg !5246
  %27 = zext i8 %26 to i32, !dbg !5245
  %28 = and i32 %27, 1, !dbg !5247
  %29 = icmp ne i32 %28, 0, !dbg !5245
  br i1 %29, label %30, label %37, !dbg !5245

30:                                               ; preds = %21
  %31 = load ptr, ptr %4, align 8, !dbg !5248
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 8, !dbg !5249
  %33 = load i8, ptr %32, align 1, !dbg !5250
  %34 = zext i8 %33 to i32, !dbg !5250
  %35 = or i32 %34, 2, !dbg !5250
  %36 = trunc i32 %35 to i8, !dbg !5250
  store i8 %36, ptr %32, align 1, !dbg !5250
  br label %37, !dbg !5248

37:                                               ; preds = %30, %21
  store i32 0, ptr %7, align 4, !dbg !5251
  br label %38, !dbg !5253

38:                                               ; preds = %75, %37
  %39 = load i32, ptr %7, align 4, !dbg !5254
  %40 = icmp slt i32 %39, 32, !dbg !5256
  br i1 %40, label %41, label %78, !dbg !5257

41:                                               ; preds = %38
  %42 = load i32, ptr %7, align 4, !dbg !5258
  %43 = sext i32 %42 to i64, !dbg !5261
  %44 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %43, !dbg !5261
  %45 = getelementptr inbounds nuw %struct.stuckobj, ptr %44, i32 0, i32 1, !dbg !5262
  %46 = load i16, ptr %45, align 2, !dbg !5262
  %47 = sext i16 %46 to i32, !dbg !5261
  %48 = icmp eq i32 %47, -1, !dbg !5263
  br i1 %48, label %49, label %74, !dbg !5263

49:                                               ; preds = %41
  %50 = load i32, ptr %8, align 4, !dbg !5264
  %51 = trunc i32 %50 to i16, !dbg !5264
  %52 = load i32, ptr %7, align 4, !dbg !5266
  %53 = sext i32 %52 to i64, !dbg !5267
  %54 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %53, !dbg !5267
  %55 = getelementptr inbounds nuw %struct.stuckobj, ptr %54, i32 0, i32 1, !dbg !5268
  store i16 %51, ptr %55, align 2, !dbg !5269
  %56 = load ptr, ptr %4, align 8, !dbg !5270
  %57 = ptrtoint ptr %56 to i64, !dbg !5271
  %58 = sub i64 %57, ptrtoint (ptr @Objects to i64), !dbg !5271
  %59 = sdiv exact i64 %58, 268, !dbg !5271
  %60 = trunc i64 %59 to i16, !dbg !5270
  %61 = load i32, ptr %7, align 4, !dbg !5272
  %62 = sext i32 %61 to i64, !dbg !5273
  %63 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %62, !dbg !5273
  %64 = getelementptr inbounds nuw %struct.stuckobj, ptr %63, i32 0, i32 0, !dbg !5274
  store i16 %60, ptr %64, align 4, !dbg !5275
  %65 = load ptr, ptr %4, align 8, !dbg !5276
  %66 = getelementptr inbounds nuw %struct.object, ptr %65, i32 0, i32 0, !dbg !5277
  %67 = load i32, ptr %66, align 4, !dbg !5277
  %68 = load i32, ptr %7, align 4, !dbg !5278
  %69 = sext i32 %68 to i64, !dbg !5279
  %70 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %69, !dbg !5279
  %71 = getelementptr inbounds nuw %struct.stuckobj, ptr %70, i32 0, i32 2, !dbg !5280
  store i32 %67, ptr %71, align 4, !dbg !5281
  %72 = load i32, ptr @Num_stuck_objects, align 4, !dbg !5282
  %73 = add nsw i32 %72, 1, !dbg !5282
  store i32 %73, ptr @Num_stuck_objects, align 4, !dbg !5282
  br label %79, !dbg !5283

74:                                               ; preds = %41
  br label %75, !dbg !5284

75:                                               ; preds = %74
  %76 = load i32, ptr %7, align 4, !dbg !5285
  %77 = add nsw i32 %76, 1, !dbg !5285
  store i32 %77, ptr %7, align 4, !dbg !5285
  br label %38, !dbg !5286, !llvm.loop !5287

78:                                               ; preds = %38
  br label %79, !dbg !5289

79:                                               ; preds = %78, %49
  %80 = load i32, ptr %7, align 4, !dbg !5289
  %81 = icmp eq i32 %80, 32, !dbg !5291
  br i1 %81, label %82, label %88, !dbg !5291

82:                                               ; preds = %79
  %83 = load ptr, ptr %4, align 8, !dbg !5292
  %84 = ptrtoint ptr %83 to i64, !dbg !5292
  %85 = sub i64 %84, ptrtoint (ptr @Objects to i64), !dbg !5292
  %86 = sdiv exact i64 %85, 268, !dbg !5292
  %87 = load i32, ptr %8, align 4, !dbg !5292
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.30, i64 noundef %86, i32 noundef %87), !dbg !5292
  br label %88, !dbg !5292

88:                                               ; preds = %82, %79
  br label %89, !dbg !5293

89:                                               ; preds = %88, %3
  ret void, !dbg !5294
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z29remove_obsolete_stuck_objectsv() #0 !dbg !5295 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !5296, !DIExpression(), !5297)
  %2 = load i32, ptr @Num_stuck_objects, align 4, !dbg !5298
  %3 = icmp ne i32 %2, 0, !dbg !5298
  br i1 %3, label %5, label %4, !dbg !5300

4:                                                ; preds = %0
  br label %59, !dbg !5301

5:                                                ; preds = %0
  %6 = load i32, ptr @FrameCount, align 4, !dbg !5302
  %7 = srem i32 %6, 32, !dbg !5303
  store i32 %7, ptr %1, align 4, !dbg !5304
  %8 = load i32, ptr %1, align 4, !dbg !5305
  %9 = sext i32 %8 to i64, !dbg !5307
  %10 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %9, !dbg !5307
  %11 = getelementptr inbounds nuw %struct.stuckobj, ptr %10, i32 0, i32 1, !dbg !5308
  %12 = load i16, ptr %11, align 2, !dbg !5308
  %13 = sext i16 %12 to i32, !dbg !5307
  %14 = icmp ne i32 %13, -1, !dbg !5309
  br i1 %14, label %15, label %59, !dbg !5309

15:                                               ; preds = %5
  %16 = load i32, ptr %1, align 4, !dbg !5310
  %17 = sext i32 %16 to i64, !dbg !5312
  %18 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %17, !dbg !5312
  %19 = getelementptr inbounds nuw %struct.stuckobj, ptr %18, i32 0, i32 1, !dbg !5313
  %20 = load i16, ptr %19, align 2, !dbg !5313
  %21 = sext i16 %20 to i64, !dbg !5314
  %22 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %21, !dbg !5314
  %23 = getelementptr inbounds nuw %struct.wall, ptr %22, i32 0, i32 6, !dbg !5315
  %24 = load i8, ptr %23, align 2, !dbg !5315
  %25 = zext i8 %24 to i32, !dbg !5314
  %26 = icmp ne i32 %25, 0, !dbg !5316
  br i1 %26, label %43, label %27, !dbg !5317

27:                                               ; preds = %15
  %28 = load i32, ptr %1, align 4, !dbg !5318
  %29 = sext i32 %28 to i64, !dbg !5319
  %30 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %29, !dbg !5319
  %31 = getelementptr inbounds nuw %struct.stuckobj, ptr %30, i32 0, i32 0, !dbg !5320
  %32 = load i16, ptr %31, align 4, !dbg !5320
  %33 = sext i16 %32 to i64, !dbg !5321
  %34 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %33, !dbg !5321
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 0, !dbg !5322
  %36 = load i32, ptr %35, align 4, !dbg !5322
  %37 = load i32, ptr %1, align 4, !dbg !5323
  %38 = sext i32 %37 to i64, !dbg !5324
  %39 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %38, !dbg !5324
  %40 = getelementptr inbounds nuw %struct.stuckobj, ptr %39, i32 0, i32 2, !dbg !5325
  %41 = load i32, ptr %40, align 4, !dbg !5325
  %42 = icmp ne i32 %36, %41, !dbg !5326
  br i1 %42, label %43, label %58, !dbg !5317

43:                                               ; preds = %27, %15
  %44 = load i32, ptr @Num_stuck_objects, align 4, !dbg !5327
  %45 = add nsw i32 %44, -1, !dbg !5327
  store i32 %45, ptr @Num_stuck_objects, align 4, !dbg !5327
  %46 = load i32, ptr %1, align 4, !dbg !5329
  %47 = sext i32 %46 to i64, !dbg !5330
  %48 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %47, !dbg !5330
  %49 = getelementptr inbounds nuw %struct.stuckobj, ptr %48, i32 0, i32 0, !dbg !5331
  %50 = load i16, ptr %49, align 4, !dbg !5331
  %51 = sext i16 %50 to i64, !dbg !5332
  %52 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %51, !dbg !5332
  %53 = getelementptr inbounds nuw %struct.object, ptr %52, i32 0, i32 20, !dbg !5333
  store i32 8192, ptr %53, align 4, !dbg !5334
  %54 = load i32, ptr %1, align 4, !dbg !5335
  %55 = sext i32 %54 to i64, !dbg !5336
  %56 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %55, !dbg !5336
  %57 = getelementptr inbounds nuw %struct.stuckobj, ptr %56, i32 0, i32 1, !dbg !5337
  store i16 -1, ptr %57, align 2, !dbg !5338
  br label %58, !dbg !5339

58:                                               ; preds = %43, %27
  br label %59, !dbg !5340

59:                                               ; preds = %4, %58, %5
  ret void, !dbg !5341
}

declare void @_Z15flush_fcd_cachev() #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z18init_stuck_objectsv() #0 !dbg !5342 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !5343, !DIExpression(), !5344)
  store i32 0, ptr %1, align 4, !dbg !5345
  br label %2, !dbg !5347

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !5348
  %4 = icmp slt i32 %3, 32, !dbg !5350
  br i1 %4, label %5, label %13, !dbg !5351

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !5352
  %7 = sext i32 %6 to i64, !dbg !5353
  %8 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %7, !dbg !5353
  %9 = getelementptr inbounds nuw %struct.stuckobj, ptr %8, i32 0, i32 1, !dbg !5354
  store i16 -1, ptr %9, align 2, !dbg !5355
  br label %10, !dbg !5353

10:                                               ; preds = %5
  %11 = load i32, ptr %1, align 4, !dbg !5356
  %12 = add nsw i32 %11, 1, !dbg !5356
  store i32 %12, ptr %1, align 4, !dbg !5356
  br label %2, !dbg !5357, !llvm.loop !5358

13:                                               ; preds = %2
  store i32 0, ptr @Num_stuck_objects, align 4, !dbg !5360
  ret void, !dbg !5361
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19clear_stuck_objectsv() #1 !dbg !5362 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !5363, !DIExpression(), !5364)
  store i32 0, ptr %1, align 4, !dbg !5365
  br label %3, !dbg !5367

3:                                                ; preds = %49, %0
  %4 = load i32, ptr %1, align 4, !dbg !5368
  %5 = icmp slt i32 %4, 32, !dbg !5370
  br i1 %5, label %6, label %52, !dbg !5371

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !dbg !5372
  %8 = sext i32 %7 to i64, !dbg !5375
  %9 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %8, !dbg !5375
  %10 = getelementptr inbounds nuw %struct.stuckobj, ptr %9, i32 0, i32 1, !dbg !5376
  %11 = load i16, ptr %10, align 2, !dbg !5376
  %12 = sext i16 %11 to i32, !dbg !5375
  %13 = icmp ne i32 %12, -1, !dbg !5377
  br i1 %13, label %14, label %48, !dbg !5377

14:                                               ; preds = %6
    #dbg_declare(ptr %2, !5378, !DIExpression(), !5380)
  %15 = load i32, ptr %1, align 4, !dbg !5381
  %16 = sext i32 %15 to i64, !dbg !5382
  %17 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %16, !dbg !5382
  %18 = getelementptr inbounds nuw %struct.stuckobj, ptr %17, i32 0, i32 0, !dbg !5383
  %19 = load i16, ptr %18, align 4, !dbg !5383
  %20 = sext i16 %19 to i32, !dbg !5382
  store i32 %20, ptr %2, align 4, !dbg !5384
  %21 = load i32, ptr %2, align 4, !dbg !5385
  %22 = sext i32 %21 to i64, !dbg !5387
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !5387
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 1, !dbg !5388
  %25 = load i8, ptr %24, align 4, !dbg !5388
  %26 = zext i8 %25 to i32, !dbg !5387
  %27 = icmp eq i32 %26, 5, !dbg !5389
  br i1 %27, label %28, label %41, !dbg !5390

28:                                               ; preds = %14
  %29 = load i32, ptr %2, align 4, !dbg !5391
  %30 = sext i32 %29 to i64, !dbg !5392
  %31 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %30, !dbg !5392
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 2, !dbg !5393
  %33 = load i8, ptr %32, align 1, !dbg !5393
  %34 = zext i8 %33 to i32, !dbg !5392
  %35 = icmp eq i32 %34, 9, !dbg !5394
  br i1 %35, label %36, label %41, !dbg !5390

36:                                               ; preds = %28
  %37 = load i32, ptr %2, align 4, !dbg !5395
  %38 = sext i32 %37 to i64, !dbg !5396
  %39 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %38, !dbg !5396
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 20, !dbg !5397
  store i32 8192, ptr %40, align 4, !dbg !5398
  br label %41, !dbg !5396

41:                                               ; preds = %36, %28, %14
  %42 = load i32, ptr %1, align 4, !dbg !5399
  %43 = sext i32 %42 to i64, !dbg !5400
  %44 = getelementptr inbounds [32 x %struct.stuckobj], ptr @Stuck_objects, i64 0, i64 %43, !dbg !5400
  %45 = getelementptr inbounds nuw %struct.stuckobj, ptr %44, i32 0, i32 1, !dbg !5401
  store i16 -1, ptr %45, align 2, !dbg !5402
  %46 = load i32, ptr @Num_stuck_objects, align 4, !dbg !5403
  %47 = add nsw i32 %46, -1, !dbg !5403
  store i32 %47, ptr @Num_stuck_objects, align 4, !dbg !5403
  br label %48, !dbg !5404

48:                                               ; preds = %41, %6
  br label %49, !dbg !5405

49:                                               ; preds = %48
  %50 = load i32, ptr %1, align 4, !dbg !5406
  %51 = add nsw i32 %50, 1, !dbg !5406
  store i32 %51, ptr %1, align 4, !dbg !5406
  br label %3, !dbg !5407, !llvm.loop !5408

52:                                               ; preds = %3
  %53 = load i32, ptr @Num_stuck_objects, align 4, !dbg !5410
  %54 = icmp eq i32 %53, 0, !dbg !5410
  %55 = zext i1 %54 to i32, !dbg !5410
  call void @_Z7_AssertiPKcS0_i(i32 noundef %55, ptr noundef @.str.32, ptr noundef @.str.1, i32 noundef 1609), !dbg !5410
  ret void, !dbg !5411
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19bng_process_segmentP6objectiP7segmentiPa(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) #1 !dbg !5412 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.vms_vector, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !5416, !DIExpression(), !5417)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !5418, !DIExpression(), !5419)
  store ptr %2, ptr %8, align 8
    #dbg_declare(ptr %8, !5420, !DIExpression(), !5421)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !5422, !DIExpression(), !5423)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !5424, !DIExpression(), !5425)
    #dbg_declare(ptr %11, !5426, !DIExpression(), !5427)
    #dbg_declare(ptr %12, !5428, !DIExpression(), !5429)
  %19 = load i32, ptr %9, align 4, !dbg !5430
  %20 = icmp sgt i32 %19, 5, !dbg !5432
  br i1 %20, label %21, label %22, !dbg !5432

21:                                               ; preds = %5
  br label %204, !dbg !5433

22:                                               ; preds = %5
  %23 = load i32, ptr %9, align 4, !dbg !5434
  %24 = add nsw i32 %23, 1, !dbg !5434
  store i32 %24, ptr %9, align 4, !dbg !5434
  store i32 0, ptr %12, align 4, !dbg !5435
  br label %25, !dbg !5437

25:                                               ; preds = %118, %22
  %26 = load i32, ptr %12, align 4, !dbg !5438
  %27 = icmp slt i32 %26, 6, !dbg !5440
  br i1 %27, label %28, label %121, !dbg !5441

28:                                               ; preds = %25
    #dbg_declare(ptr %13, !5442, !DIExpression(), !5444)
    #dbg_declare(ptr %14, !5445, !DIExpression(), !5446)
    #dbg_declare(ptr %15, !5447, !DIExpression(), !5448)
  %29 = load ptr, ptr %8, align 8, !dbg !5449
  %30 = getelementptr inbounds nuw %struct.segment, ptr %29, i32 0, i32 0, !dbg !5451
  %31 = load i32, ptr %12, align 4, !dbg !5452
  %32 = sext i32 %31 to i64, !dbg !5449
  %33 = getelementptr inbounds [6 x %struct.side], ptr %30, i64 0, i64 %32, !dbg !5449
  %34 = getelementptr inbounds nuw %struct.side, ptr %33, i32 0, i32 4, !dbg !5453
  %35 = load i16, ptr %34, align 2, !dbg !5453
  %36 = sext i16 %35 to i32, !dbg !5449
  store i32 %36, ptr %13, align 4, !dbg !5454
  %37 = icmp ne i32 %36, 0, !dbg !5455
  br i1 %37, label %38, label %117, !dbg !5455

38:                                               ; preds = %28
    #dbg_declare(ptr %16, !5456, !DIExpression(), !5458)
    #dbg_declare(ptr %17, !5459, !DIExpression(), !5460)
  %39 = load i32, ptr %13, align 4, !dbg !5461
  %40 = and i32 %39, 16383, !dbg !5461
  store i32 %40, ptr %13, align 4, !dbg !5461
  %41 = load i32, ptr %13, align 4, !dbg !5462
  %42 = sext i32 %41 to i64, !dbg !5464
  %43 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %42, !dbg !5464
  %44 = getelementptr inbounds nuw %struct.tmap_info, ptr %43, i32 0, i32 4, !dbg !5465
  %45 = load i16, ptr %44, align 4, !dbg !5465
  %46 = sext i16 %45 to i32, !dbg !5464
  store i32 %46, ptr %16, align 4, !dbg !5466
  %47 = icmp ne i32 %46, -1, !dbg !5467
  br i1 %47, label %48, label %63, !dbg !5468

48:                                               ; preds = %38
  %49 = load i32, ptr %16, align 4, !dbg !5469
  %50 = sext i32 %49 to i64, !dbg !5470
  %51 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %50, !dbg !5470
  %52 = getelementptr inbounds nuw %struct.eclip, ptr %51, i32 0, i32 7, !dbg !5471
  %53 = load i32, ptr %52, align 4, !dbg !5471
  store i32 %53, ptr %17, align 4, !dbg !5472
  %54 = icmp ne i32 %53, -1, !dbg !5473
  br i1 %54, label %55, label %63, !dbg !5474

55:                                               ; preds = %48
  %56 = load i32, ptr %16, align 4, !dbg !5475
  %57 = sext i32 %56 to i64, !dbg !5476
  %58 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %57, !dbg !5476
  %59 = getelementptr inbounds nuw %struct.eclip, ptr %58, i32 0, i32 5, !dbg !5477
  %60 = load i32, ptr %59, align 4, !dbg !5477
  %61 = and i32 %60, 2, !dbg !5478
  %62 = icmp ne i32 %61, 0, !dbg !5479
  br i1 %62, label %63, label %74, !dbg !5480

63:                                               ; preds = %55, %48, %38
  %64 = load i32, ptr %16, align 4, !dbg !5481
  %65 = icmp eq i32 %64, -1, !dbg !5482
  br i1 %65, label %66, label %116, !dbg !5483

66:                                               ; preds = %63
  %67 = load i32, ptr %13, align 4, !dbg !5484
  %68 = sext i32 %67 to i64, !dbg !5485
  %69 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %68, !dbg !5485
  %70 = getelementptr inbounds nuw %struct.tmap_info, ptr %69, i32 0, i32 5, !dbg !5486
  %71 = load i16, ptr %70, align 2, !dbg !5486
  %72 = sext i16 %71 to i32, !dbg !5485
  %73 = icmp ne i32 %72, -1, !dbg !5487
  br i1 %73, label %74, label %116, !dbg !5480

74:                                               ; preds = %66, %55
  %75 = load ptr, ptr %8, align 8, !dbg !5488
  %76 = load i32, ptr %12, align 4, !dbg !5490
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %15, ptr noundef %75, i32 noundef %76), !dbg !5491
  %77 = load ptr, ptr %6, align 8, !dbg !5492
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 11, !dbg !5493
  %79 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %15, ptr noundef %78), !dbg !5494
  store i32 %79, ptr %14, align 4, !dbg !5495
  %80 = load i32, ptr %14, align 4, !dbg !5496
  %81 = load i32, ptr %7, align 4, !dbg !5498
  %82 = sdiv i32 %81, 2, !dbg !5499
  %83 = icmp slt i32 %80, %82, !dbg !5500
  br i1 %83, label %84, label %115, !dbg !5500

84:                                               ; preds = %74
  %85 = load ptr, ptr %8, align 8, !dbg !5501
  %86 = ptrtoint ptr %85 to i64, !dbg !5503
  %87 = sub i64 %86, ptrtoint (ptr @Segments to i64), !dbg !5503
  %88 = sdiv exact i64 %87, 512, !dbg !5503
  %89 = trunc i64 %88 to i32, !dbg !5501
  %90 = load ptr, ptr %6, align 8, !dbg !5504
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 11, !dbg !5505
  %92 = load ptr, ptr %6, align 8, !dbg !5506
  %93 = getelementptr inbounds nuw %struct.object, ptr %92, i32 0, i32 9, !dbg !5507
  %94 = load i16, ptr %93, align 2, !dbg !5507
  %95 = sext i16 %94 to i32, !dbg !5506
  %96 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %15, i32 noundef %89, ptr noundef %91, i32 noundef %95, i32 noundef 5, i32 noundef 4), !dbg !5508
  store i32 %96, ptr %14, align 4, !dbg !5509
  %97 = load i32, ptr %14, align 4, !dbg !5510
  %98 = icmp sgt i32 %97, 0, !dbg !5512
  br i1 %98, label %99, label %114, !dbg !5513

99:                                               ; preds = %84
  %100 = load i32, ptr %14, align 4, !dbg !5514
  %101 = load i32, ptr %7, align 4, !dbg !5515
  %102 = sdiv i32 %101, 2, !dbg !5516
  %103 = icmp slt i32 %100, %102, !dbg !5517
  br i1 %103, label %104, label %114, !dbg !5513

104:                                              ; preds = %99
  %105 = load ptr, ptr %8, align 8, !dbg !5518
  %106 = load i32, ptr %12, align 4, !dbg !5519
  %107 = load ptr, ptr %6, align 8, !dbg !5520
  %108 = getelementptr inbounds nuw %struct.object, ptr %107, i32 0, i32 22, !dbg !5521
  %109 = getelementptr inbounds nuw %struct.laser_info_s, ptr %108, i32 0, i32 1, !dbg !5522
  %110 = load i16, ptr %109, align 2, !dbg !5522
  %111 = sext i16 %110 to i64, !dbg !5523
  %112 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %111, !dbg !5523
  %113 = call noundef i32 @_Z19check_effect_blowupP7segmentiP10vms_vectorP6objecti(ptr noundef %105, i32 noundef %106, ptr noundef %15, ptr noundef %112, i32 noundef 1), !dbg !5524
  br label %114, !dbg !5524

114:                                              ; preds = %104, %99, %84
  br label %115, !dbg !5525

115:                                              ; preds = %114, %74
  br label %116, !dbg !5526

116:                                              ; preds = %115, %66, %63
  br label %117, !dbg !5527

117:                                              ; preds = %116, %28
  br label %118, !dbg !5528

118:                                              ; preds = %117
  %119 = load i32, ptr %12, align 4, !dbg !5529
  %120 = add nsw i32 %119, 1, !dbg !5529
  store i32 %120, ptr %12, align 4, !dbg !5529
  br label %25, !dbg !5530, !llvm.loop !5531

121:                                              ; preds = %25
  store i32 0, ptr %11, align 4, !dbg !5533
  br label %122, !dbg !5535

122:                                              ; preds = %200, %121
  %123 = load i32, ptr %11, align 4, !dbg !5536
  %124 = icmp slt i32 %123, 6, !dbg !5538
  br i1 %124, label %125, label %203, !dbg !5539

125:                                              ; preds = %122
    #dbg_declare(ptr %18, !5540, !DIExpression(), !5542)
  %126 = load ptr, ptr %8, align 8, !dbg !5543
  %127 = getelementptr inbounds nuw %struct.segment, ptr %126, i32 0, i32 1, !dbg !5544
  %128 = load i32, ptr %11, align 4, !dbg !5545
  %129 = sext i32 %128 to i64, !dbg !5543
  %130 = getelementptr inbounds [6 x i16], ptr %127, i64 0, i64 %129, !dbg !5543
  %131 = load i16, ptr %130, align 2, !dbg !5543
  %132 = sext i16 %131 to i32, !dbg !5543
  store i32 %132, ptr %18, align 4, !dbg !5542
  %133 = load i32, ptr %18, align 4, !dbg !5546
  %134 = icmp ne i32 %133, -1, !dbg !5548
  br i1 %134, label %135, label %199, !dbg !5548

135:                                              ; preds = %125
  %136 = load ptr, ptr %10, align 8, !dbg !5549
  %137 = load i32, ptr %18, align 4, !dbg !5552
  %138 = sext i32 %137 to i64, !dbg !5549
  %139 = getelementptr inbounds i8, ptr %136, i64 %138, !dbg !5549
  %140 = load i8, ptr %139, align 1, !dbg !5549
  %141 = icmp ne i8 %140, 0, !dbg !5549
  br i1 %141, label %198, label %142, !dbg !5553

142:                                              ; preds = %135
  %143 = load ptr, ptr %8, align 8, !dbg !5554
  %144 = getelementptr inbounds nuw %struct.segment, ptr %143, i32 0, i32 1, !dbg !5554
  %145 = load i32, ptr %11, align 4, !dbg !5554
  %146 = sext i32 %145 to i64, !dbg !5554
  %147 = getelementptr inbounds [6 x i16], ptr %144, i64 0, i64 %146, !dbg !5554
  %148 = load i16, ptr %147, align 2, !dbg !5554
  %149 = sext i16 %148 to i32, !dbg !5554
  %150 = icmp eq i32 %149, -1, !dbg !5554
  br i1 %150, label %151, label %152, !dbg !5554

151:                                              ; preds = %142
  br label %181, !dbg !5554

152:                                              ; preds = %142
  %153 = load ptr, ptr %8, align 8, !dbg !5554
  %154 = getelementptr inbounds nuw %struct.segment, ptr %153, i32 0, i32 1, !dbg !5554
  %155 = load i32, ptr %11, align 4, !dbg !5554
  %156 = sext i32 %155 to i64, !dbg !5554
  %157 = getelementptr inbounds [6 x i16], ptr %154, i64 0, i64 %156, !dbg !5554
  %158 = load i16, ptr %157, align 2, !dbg !5554
  %159 = sext i16 %158 to i32, !dbg !5554
  %160 = icmp eq i32 %159, -2, !dbg !5554
  br i1 %160, label %161, label %162, !dbg !5554

161:                                              ; preds = %152
  br label %179, !dbg !5554

162:                                              ; preds = %152
  %163 = load ptr, ptr %8, align 8, !dbg !5554
  %164 = getelementptr inbounds nuw %struct.segment, ptr %163, i32 0, i32 0, !dbg !5554
  %165 = load i32, ptr %11, align 4, !dbg !5554
  %166 = sext i32 %165 to i64, !dbg !5554
  %167 = getelementptr inbounds [6 x %struct.side], ptr %164, i64 0, i64 %166, !dbg !5554
  %168 = getelementptr inbounds nuw %struct.side, ptr %167, i32 0, i32 2, !dbg !5554
  %169 = load i16, ptr %168, align 2, !dbg !5554
  %170 = sext i16 %169 to i32, !dbg !5554
  %171 = icmp eq i32 %170, -1, !dbg !5554
  br i1 %171, label %172, label %173, !dbg !5554

172:                                              ; preds = %162
  br label %177, !dbg !5554

173:                                              ; preds = %162
  %174 = load ptr, ptr %8, align 8, !dbg !5554
  %175 = load i32, ptr %11, align 4, !dbg !5554
  %176 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %174, i32 noundef %175), !dbg !5554
  br label %177, !dbg !5554

177:                                              ; preds = %173, %172
  %178 = phi i32 [ 5, %172 ], [ %176, %173 ], !dbg !5554
  br label %179, !dbg !5554

179:                                              ; preds = %177, %161
  %180 = phi i32 [ 8, %161 ], [ %178, %177 ], !dbg !5554
  br label %181, !dbg !5554

181:                                              ; preds = %179, %151
  %182 = phi i32 [ 2, %151 ], [ %180, %179 ], !dbg !5554
  %183 = and i32 %182, 1, !dbg !5557
  %184 = icmp ne i32 %183, 0, !dbg !5554
  br i1 %184, label %185, label %197, !dbg !5554

185:                                              ; preds = %181
  %186 = load ptr, ptr %10, align 8, !dbg !5558
  %187 = load i32, ptr %18, align 4, !dbg !5560
  %188 = sext i32 %187 to i64, !dbg !5558
  %189 = getelementptr inbounds i8, ptr %186, i64 %188, !dbg !5558
  store i8 1, ptr %189, align 1, !dbg !5561
  %190 = load ptr, ptr %6, align 8, !dbg !5562
  %191 = load i32, ptr %7, align 4, !dbg !5563
  %192 = load i32, ptr %18, align 4, !dbg !5564
  %193 = sext i32 %192 to i64, !dbg !5565
  %194 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %193, !dbg !5565
  %195 = load i32, ptr %9, align 4, !dbg !5566
  %196 = load ptr, ptr %10, align 8, !dbg !5567
  call void @_Z19bng_process_segmentP6objectiP7segmentiPa(ptr noundef %190, i32 noundef %191, ptr noundef %194, i32 noundef %195, ptr noundef %196), !dbg !5568
  br label %197, !dbg !5569

197:                                              ; preds = %185, %181
  br label %198, !dbg !5570

198:                                              ; preds = %197, %135
  br label %199, !dbg !5571

199:                                              ; preds = %198, %125
  br label %200, !dbg !5572

200:                                              ; preds = %199
  %201 = load i32, ptr %11, align 4, !dbg !5573
  %202 = add nsw i32 %201, 1, !dbg !5573
  store i32 %202, ptr %11, align 4, !dbg !5573
  br label %122, !dbg !5574, !llvm.loop !5575

203:                                              ; preds = %122
  br label %204, !dbg !5577

204:                                              ; preds = %203, %21
  ret void, !dbg !5577
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #2

declare noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z19check_effect_blowupP7segmentiP10vms_vectorP6objecti(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18blast_nearby_glassP6objecti(ptr noundef %0, i32 noundef %1) #1 !dbg !5578 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [900 x i8], align 1
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5581, !DIExpression(), !5582)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !5583, !DIExpression(), !5584)
    #dbg_declare(ptr %5, !5585, !DIExpression(), !5586)
    #dbg_declare(ptr %6, !5587, !DIExpression(), !5591)
    #dbg_declare(ptr %7, !5592, !DIExpression(), !5593)
  %8 = load ptr, ptr %3, align 8, !dbg !5594
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 9, !dbg !5595
  %10 = load i16, ptr %9, align 2, !dbg !5595
  %11 = sext i16 %10 to i64, !dbg !5596
  %12 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %11, !dbg !5596
  store ptr %12, ptr %7, align 8, !dbg !5597
  store i32 0, ptr %5, align 4, !dbg !5598
  br label %13, !dbg !5600

13:                                               ; preds = %21, %2
  %14 = load i32, ptr %5, align 4, !dbg !5601
  %15 = load i32, ptr @Highest_segment_index, align 4, !dbg !5603
  %16 = icmp sle i32 %14, %15, !dbg !5604
  br i1 %16, label %17, label %24, !dbg !5605

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4, !dbg !5606
  %19 = sext i32 %18 to i64, !dbg !5607
  %20 = getelementptr inbounds [900 x i8], ptr %6, i64 0, i64 %19, !dbg !5607
  store i8 0, ptr %20, align 1, !dbg !5608
  br label %21, !dbg !5607

21:                                               ; preds = %17
  %22 = load i32, ptr %5, align 4, !dbg !5609
  %23 = add nsw i32 %22, 1, !dbg !5609
  store i32 %23, ptr %5, align 4, !dbg !5609
  br label %13, !dbg !5610, !llvm.loop !5611

24:                                               ; preds = %13
  %25 = load ptr, ptr %3, align 8, !dbg !5613
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 9, !dbg !5614
  %27 = load i16, ptr %26, align 2, !dbg !5614
  %28 = sext i16 %27 to i64, !dbg !5615
  %29 = getelementptr inbounds [900 x i8], ptr %6, i64 0, i64 %28, !dbg !5615
  store i8 1, ptr %29, align 1, !dbg !5616
  %30 = load ptr, ptr %3, align 8, !dbg !5617
  %31 = load i32, ptr %4, align 4, !dbg !5618
  %32 = load ptr, ptr %7, align 8, !dbg !5619
  %33 = getelementptr inbounds [900 x i8], ptr %6, i64 0, i64 0, !dbg !5620
  call void @_Z19bng_process_segmentP6objectiP7segmentiPa(ptr noundef %30, i32 noundef %31, ptr noundef %32, i32 noundef 0, ptr noundef %33), !dbg !5621
  ret void, !dbg !5622
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z9read_wallP4wallP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !5623 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5626, !DIExpression(), !5627)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5628, !DIExpression(), !5629)
  %5 = load ptr, ptr %4, align 8, !dbg !5630
  %6 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %5), !dbg !5631
  %7 = load ptr, ptr %3, align 8, !dbg !5632
  %8 = getelementptr inbounds nuw %struct.wall, ptr %7, i32 0, i32 0, !dbg !5633
  store i32 %6, ptr %8, align 4, !dbg !5634
  %9 = load ptr, ptr %4, align 8, !dbg !5635
  %10 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %9), !dbg !5636
  %11 = load ptr, ptr %3, align 8, !dbg !5637
  %12 = getelementptr inbounds nuw %struct.wall, ptr %11, i32 0, i32 1, !dbg !5638
  store i32 %10, ptr %12, align 4, !dbg !5639
  %13 = load ptr, ptr %4, align 8, !dbg !5640
  %14 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %13), !dbg !5641
  %15 = load ptr, ptr %3, align 8, !dbg !5642
  %16 = getelementptr inbounds nuw %struct.wall, ptr %15, i32 0, i32 2, !dbg !5643
  store i32 %14, ptr %16, align 4, !dbg !5644
  %17 = load ptr, ptr %4, align 8, !dbg !5645
  %18 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %17), !dbg !5646
  %19 = load ptr, ptr %3, align 8, !dbg !5647
  %20 = getelementptr inbounds nuw %struct.wall, ptr %19, i32 0, i32 3, !dbg !5648
  store i32 %18, ptr %20, align 4, !dbg !5649
  %21 = load ptr, ptr %4, align 8, !dbg !5650
  %22 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %21), !dbg !5651
  %23 = load ptr, ptr %3, align 8, !dbg !5652
  %24 = getelementptr inbounds nuw %struct.wall, ptr %23, i32 0, i32 4, !dbg !5653
  store i8 %22, ptr %24, align 4, !dbg !5654
  %25 = load ptr, ptr %4, align 8, !dbg !5655
  %26 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %25), !dbg !5656
  %27 = load ptr, ptr %3, align 8, !dbg !5657
  %28 = getelementptr inbounds nuw %struct.wall, ptr %27, i32 0, i32 5, !dbg !5658
  store i8 %26, ptr %28, align 1, !dbg !5659
  %29 = load ptr, ptr %4, align 8, !dbg !5660
  %30 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %29), !dbg !5661
  %31 = load ptr, ptr %3, align 8, !dbg !5662
  %32 = getelementptr inbounds nuw %struct.wall, ptr %31, i32 0, i32 6, !dbg !5663
  store i8 %30, ptr %32, align 2, !dbg !5664
  %33 = load ptr, ptr %4, align 8, !dbg !5665
  %34 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %33), !dbg !5666
  %35 = load ptr, ptr %3, align 8, !dbg !5667
  %36 = getelementptr inbounds nuw %struct.wall, ptr %35, i32 0, i32 7, !dbg !5668
  store i8 %34, ptr %36, align 1, !dbg !5669
  %37 = load ptr, ptr %4, align 8, !dbg !5670
  %38 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %37), !dbg !5671
  %39 = load ptr, ptr %3, align 8, !dbg !5672
  %40 = getelementptr inbounds nuw %struct.wall, ptr %39, i32 0, i32 8, !dbg !5673
  store i8 %38, ptr %40, align 4, !dbg !5674
  %41 = load ptr, ptr %4, align 8, !dbg !5675
  %42 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %41), !dbg !5676
  %43 = load ptr, ptr %3, align 8, !dbg !5677
  %44 = getelementptr inbounds nuw %struct.wall, ptr %43, i32 0, i32 9, !dbg !5678
  store i8 %42, ptr %44, align 1, !dbg !5679
  %45 = load ptr, ptr %4, align 8, !dbg !5680
  %46 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %45), !dbg !5681
  %47 = load ptr, ptr %3, align 8, !dbg !5682
  %48 = getelementptr inbounds nuw %struct.wall, ptr %47, i32 0, i32 10, !dbg !5683
  store i8 %46, ptr %48, align 2, !dbg !5684
  %49 = load ptr, ptr %4, align 8, !dbg !5685
  %50 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %49), !dbg !5686
  %51 = load ptr, ptr %3, align 8, !dbg !5687
  %52 = getelementptr inbounds nuw %struct.wall, ptr %51, i32 0, i32 11, !dbg !5688
  store i8 %50, ptr %52, align 1, !dbg !5689
  ret void, !dbg !5690
}

declare noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef) #2

declare noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16read_active_doorP11active_doorP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !5691 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5694, !DIExpression(), !5695)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5696, !DIExpression(), !5697)
  %5 = load ptr, ptr %4, align 8, !dbg !5698
  %6 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %5), !dbg !5699
  %7 = load ptr, ptr %3, align 8, !dbg !5700
  %8 = getelementptr inbounds nuw %struct.active_door, ptr %7, i32 0, i32 0, !dbg !5701
  store i32 %6, ptr %8, align 4, !dbg !5702
  %9 = load ptr, ptr %4, align 8, !dbg !5703
  %10 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %9), !dbg !5704
  %11 = load ptr, ptr %3, align 8, !dbg !5705
  %12 = getelementptr inbounds nuw %struct.active_door, ptr %11, i32 0, i32 1, !dbg !5706
  %13 = getelementptr inbounds [2 x i16], ptr %12, i64 0, i64 0, !dbg !5705
  store i16 %10, ptr %13, align 4, !dbg !5707
  %14 = load ptr, ptr %4, align 8, !dbg !5708
  %15 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %14), !dbg !5709
  %16 = load ptr, ptr %3, align 8, !dbg !5710
  %17 = getelementptr inbounds nuw %struct.active_door, ptr %16, i32 0, i32 1, !dbg !5711
  %18 = getelementptr inbounds [2 x i16], ptr %17, i64 0, i64 1, !dbg !5710
  store i16 %15, ptr %18, align 2, !dbg !5712
  %19 = load ptr, ptr %4, align 8, !dbg !5713
  %20 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %19), !dbg !5714
  %21 = load ptr, ptr %3, align 8, !dbg !5715
  %22 = getelementptr inbounds nuw %struct.active_door, ptr %21, i32 0, i32 2, !dbg !5716
  %23 = getelementptr inbounds [2 x i16], ptr %22, i64 0, i64 0, !dbg !5715
  store i16 %20, ptr %23, align 4, !dbg !5717
  %24 = load ptr, ptr %4, align 8, !dbg !5718
  %25 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %24), !dbg !5719
  %26 = load ptr, ptr %3, align 8, !dbg !5720
  %27 = getelementptr inbounds nuw %struct.active_door, ptr %26, i32 0, i32 2, !dbg !5721
  %28 = getelementptr inbounds [2 x i16], ptr %27, i64 0, i64 1, !dbg !5720
  store i16 %25, ptr %28, align 2, !dbg !5722
  %29 = load ptr, ptr %4, align 8, !dbg !5723
  %30 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %29), !dbg !5724
  %31 = load ptr, ptr %3, align 8, !dbg !5725
  %32 = getelementptr inbounds nuw %struct.active_door, ptr %31, i32 0, i32 3, !dbg !5726
  store i32 %30, ptr %32, align 4, !dbg !5727
  ret void, !dbg !5728
}

declare noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18P_ReadCloakingWallP13cloaking_wallP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !5729 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5732, !DIExpression(), !5733)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5734, !DIExpression(), !5735)
    #dbg_declare(ptr %5, !5736, !DIExpression(), !5737)
  %6 = load ptr, ptr %4, align 8, !dbg !5738
  %7 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %6), !dbg !5739
  %8 = load ptr, ptr %3, align 8, !dbg !5740
  %9 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %8, i32 0, i32 0, !dbg !5741
  store i16 %7, ptr %9, align 4, !dbg !5742
  %10 = load ptr, ptr %4, align 8, !dbg !5743
  %11 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %10), !dbg !5744
  %12 = load ptr, ptr %3, align 8, !dbg !5745
  %13 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %12, i32 0, i32 1, !dbg !5746
  store i16 %11, ptr %13, align 2, !dbg !5747
  store i32 0, ptr %5, align 4, !dbg !5748
  br label %14, !dbg !5750

14:                                               ; preds = %25, %2
  %15 = load i32, ptr %5, align 4, !dbg !5751
  %16 = icmp slt i32 %15, 4, !dbg !5753
  br i1 %16, label %17, label %28, !dbg !5754

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8, !dbg !5755
  %19 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %18), !dbg !5756
  %20 = load ptr, ptr %3, align 8, !dbg !5757
  %21 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %20, i32 0, i32 2, !dbg !5758
  %22 = load i32, ptr %5, align 4, !dbg !5759
  %23 = sext i32 %22 to i64, !dbg !5757
  %24 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %23, !dbg !5757
  store i32 %19, ptr %24, align 4, !dbg !5760
  br label %25, !dbg !5757

25:                                               ; preds = %17
  %26 = load i32, ptr %5, align 4, !dbg !5761
  %27 = add nsw i32 %26, 1, !dbg !5761
  store i32 %27, ptr %5, align 4, !dbg !5761
  br label %14, !dbg !5762, !llvm.loop !5763

28:                                               ; preds = %14
  store i32 0, ptr %5, align 4, !dbg !5765
  br label %29, !dbg !5767

29:                                               ; preds = %40, %28
  %30 = load i32, ptr %5, align 4, !dbg !5768
  %31 = icmp slt i32 %30, 4, !dbg !5770
  br i1 %31, label %32, label %43, !dbg !5771

32:                                               ; preds = %29
  %33 = load ptr, ptr %4, align 8, !dbg !5772
  %34 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %33), !dbg !5773
  %35 = load ptr, ptr %3, align 8, !dbg !5774
  %36 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %35, i32 0, i32 3, !dbg !5775
  %37 = load i32, ptr %5, align 4, !dbg !5776
  %38 = sext i32 %37 to i64, !dbg !5774
  %39 = getelementptr inbounds [4 x i32], ptr %36, i64 0, i64 %38, !dbg !5774
  store i32 %34, ptr %39, align 4, !dbg !5777
  br label %40, !dbg !5774

40:                                               ; preds = %32
  %41 = load i32, ptr %5, align 4, !dbg !5778
  %42 = add nsw i32 %41, 1, !dbg !5778
  store i32 %42, ptr %5, align 4, !dbg !5778
  br label %29, !dbg !5779, !llvm.loop !5780

43:                                               ; preds = %29
  %44 = load ptr, ptr %4, align 8, !dbg !5782
  %45 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %44), !dbg !5783
  %46 = load ptr, ptr %3, align 8, !dbg !5784
  %47 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %46, i32 0, i32 4, !dbg !5785
  store i32 %45, ptr %47, align 4, !dbg !5786
  ret void, !dbg !5787
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z10write_wallP4wallP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !5788 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5789, !DIExpression(), !5790)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5791, !DIExpression(), !5792)
  %5 = load ptr, ptr %4, align 8, !dbg !5793
  %6 = load ptr, ptr %3, align 8, !dbg !5794
  %7 = getelementptr inbounds nuw %struct.wall, ptr %6, i32 0, i32 0, !dbg !5795
  %8 = load i32, ptr %7, align 4, !dbg !5795
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %5, i32 noundef %8), !dbg !5796
  %9 = load ptr, ptr %4, align 8, !dbg !5797
  %10 = load ptr, ptr %3, align 8, !dbg !5798
  %11 = getelementptr inbounds nuw %struct.wall, ptr %10, i32 0, i32 1, !dbg !5799
  %12 = load i32, ptr %11, align 4, !dbg !5799
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %9, i32 noundef %12), !dbg !5800
  %13 = load ptr, ptr %4, align 8, !dbg !5801
  %14 = load ptr, ptr %3, align 8, !dbg !5802
  %15 = getelementptr inbounds nuw %struct.wall, ptr %14, i32 0, i32 2, !dbg !5803
  %16 = load i32, ptr %15, align 4, !dbg !5803
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %13, i32 noundef %16), !dbg !5804
  %17 = load ptr, ptr %4, align 8, !dbg !5805
  %18 = load ptr, ptr %3, align 8, !dbg !5806
  %19 = getelementptr inbounds nuw %struct.wall, ptr %18, i32 0, i32 3, !dbg !5807
  %20 = load i32, ptr %19, align 4, !dbg !5807
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %17, i32 noundef %20), !dbg !5808
  %21 = load ptr, ptr %4, align 8, !dbg !5809
  %22 = load ptr, ptr %3, align 8, !dbg !5810
  %23 = getelementptr inbounds nuw %struct.wall, ptr %22, i32 0, i32 4, !dbg !5811
  %24 = load i8, ptr %23, align 4, !dbg !5811
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %21, i8 noundef zeroext %24), !dbg !5812
  %25 = load ptr, ptr %4, align 8, !dbg !5813
  %26 = load ptr, ptr %3, align 8, !dbg !5814
  %27 = getelementptr inbounds nuw %struct.wall, ptr %26, i32 0, i32 5, !dbg !5815
  %28 = load i8, ptr %27, align 1, !dbg !5815
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %25, i8 noundef zeroext %28), !dbg !5816
  %29 = load ptr, ptr %4, align 8, !dbg !5817
  %30 = load ptr, ptr %3, align 8, !dbg !5818
  %31 = getelementptr inbounds nuw %struct.wall, ptr %30, i32 0, i32 6, !dbg !5819
  %32 = load i8, ptr %31, align 2, !dbg !5819
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %29, i8 noundef zeroext %32), !dbg !5820
  %33 = load ptr, ptr %4, align 8, !dbg !5821
  %34 = load ptr, ptr %3, align 8, !dbg !5822
  %35 = getelementptr inbounds nuw %struct.wall, ptr %34, i32 0, i32 7, !dbg !5823
  %36 = load i8, ptr %35, align 1, !dbg !5823
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %33, i8 noundef zeroext %36), !dbg !5824
  %37 = load ptr, ptr %4, align 8, !dbg !5825
  %38 = load ptr, ptr %3, align 8, !dbg !5826
  %39 = getelementptr inbounds nuw %struct.wall, ptr %38, i32 0, i32 8, !dbg !5827
  %40 = load i8, ptr %39, align 4, !dbg !5827
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %37, i8 noundef zeroext %40), !dbg !5828
  %41 = load ptr, ptr %4, align 8, !dbg !5829
  %42 = load ptr, ptr %3, align 8, !dbg !5830
  %43 = getelementptr inbounds nuw %struct.wall, ptr %42, i32 0, i32 9, !dbg !5831
  %44 = load i8, ptr %43, align 1, !dbg !5831
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %41, i8 noundef zeroext %44), !dbg !5832
  %45 = load ptr, ptr %4, align 8, !dbg !5833
  %46 = load ptr, ptr %3, align 8, !dbg !5834
  %47 = getelementptr inbounds nuw %struct.wall, ptr %46, i32 0, i32 10, !dbg !5835
  %48 = load i8, ptr %47, align 2, !dbg !5835
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %45, i8 noundef zeroext %48), !dbg !5836
  %49 = load ptr, ptr %4, align 8, !dbg !5837
  %50 = load ptr, ptr %3, align 8, !dbg !5838
  %51 = getelementptr inbounds nuw %struct.wall, ptr %50, i32 0, i32 11, !dbg !5839
  %52 = load i8, ptr %51, align 1, !dbg !5839
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %49, i8 noundef zeroext %52), !dbg !5840
  ret void, !dbg !5841
}

declare void @_Z14file_write_intP7__sFILEi(ptr noundef, i32 noundef) #2

declare void @_Z15file_write_byteP7__sFILEh(ptr noundef, i8 noundef zeroext) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17write_active_doorP11active_doorP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !5842 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5843, !DIExpression(), !5844)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5845, !DIExpression(), !5846)
  %5 = load ptr, ptr %4, align 8, !dbg !5847
  %6 = load ptr, ptr %3, align 8, !dbg !5848
  %7 = getelementptr inbounds nuw %struct.active_door, ptr %6, i32 0, i32 0, !dbg !5849
  %8 = load i32, ptr %7, align 4, !dbg !5849
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %5, i32 noundef %8), !dbg !5850
  %9 = load ptr, ptr %4, align 8, !dbg !5851
  %10 = load ptr, ptr %3, align 8, !dbg !5852
  %11 = getelementptr inbounds nuw %struct.active_door, ptr %10, i32 0, i32 1, !dbg !5853
  %12 = getelementptr inbounds [2 x i16], ptr %11, i64 0, i64 0, !dbg !5852
  %13 = load i16, ptr %12, align 4, !dbg !5852
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %9, i16 noundef signext %13), !dbg !5854
  %14 = load ptr, ptr %4, align 8, !dbg !5855
  %15 = load ptr, ptr %3, align 8, !dbg !5856
  %16 = getelementptr inbounds nuw %struct.active_door, ptr %15, i32 0, i32 1, !dbg !5857
  %17 = getelementptr inbounds [2 x i16], ptr %16, i64 0, i64 1, !dbg !5856
  %18 = load i16, ptr %17, align 2, !dbg !5856
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %14, i16 noundef signext %18), !dbg !5858
  %19 = load ptr, ptr %4, align 8, !dbg !5859
  %20 = load ptr, ptr %3, align 8, !dbg !5860
  %21 = getelementptr inbounds nuw %struct.active_door, ptr %20, i32 0, i32 2, !dbg !5861
  %22 = getelementptr inbounds [2 x i16], ptr %21, i64 0, i64 0, !dbg !5860
  %23 = load i16, ptr %22, align 4, !dbg !5860
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %19, i16 noundef signext %23), !dbg !5862
  %24 = load ptr, ptr %4, align 8, !dbg !5863
  %25 = load ptr, ptr %3, align 8, !dbg !5864
  %26 = getelementptr inbounds nuw %struct.active_door, ptr %25, i32 0, i32 2, !dbg !5865
  %27 = getelementptr inbounds [2 x i16], ptr %26, i64 0, i64 1, !dbg !5864
  %28 = load i16, ptr %27, align 2, !dbg !5864
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %24, i16 noundef signext %28), !dbg !5866
  %29 = load ptr, ptr %4, align 8, !dbg !5867
  %30 = load ptr, ptr %3, align 8, !dbg !5868
  %31 = getelementptr inbounds nuw %struct.active_door, ptr %30, i32 0, i32 3, !dbg !5869
  %32 = load i32, ptr %31, align 4, !dbg !5869
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %29, i32 noundef %32), !dbg !5870
  ret void, !dbg !5871
}

declare void @_Z16file_write_shortP7__sFILEs(ptr noundef, i16 noundef signext) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19P_WriteCloakingWallP13cloaking_wallP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !5872 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5873, !DIExpression(), !5874)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5875, !DIExpression(), !5876)
    #dbg_declare(ptr %5, !5877, !DIExpression(), !5878)
  %6 = load ptr, ptr %4, align 8, !dbg !5879
  %7 = load ptr, ptr %3, align 8, !dbg !5880
  %8 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %7, i32 0, i32 0, !dbg !5881
  %9 = load i16, ptr %8, align 4, !dbg !5881
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %6, i16 noundef signext %9), !dbg !5882
  %10 = load ptr, ptr %4, align 8, !dbg !5883
  %11 = load ptr, ptr %3, align 8, !dbg !5884
  %12 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %11, i32 0, i32 1, !dbg !5885
  %13 = load i16, ptr %12, align 2, !dbg !5885
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %10, i16 noundef signext %13), !dbg !5886
  store i32 0, ptr %5, align 4, !dbg !5887
  br label %14, !dbg !5889

14:                                               ; preds = %25, %2
  %15 = load i32, ptr %5, align 4, !dbg !5890
  %16 = icmp slt i32 %15, 4, !dbg !5892
  br i1 %16, label %17, label %28, !dbg !5893

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8, !dbg !5894
  %19 = load ptr, ptr %3, align 8, !dbg !5895
  %20 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %19, i32 0, i32 2, !dbg !5896
  %21 = load i32, ptr %5, align 4, !dbg !5897
  %22 = sext i32 %21 to i64, !dbg !5895
  %23 = getelementptr inbounds [4 x i32], ptr %20, i64 0, i64 %22, !dbg !5895
  %24 = load i32, ptr %23, align 4, !dbg !5895
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %18, i32 noundef %24), !dbg !5898
  br label %25, !dbg !5898

25:                                               ; preds = %17
  %26 = load i32, ptr %5, align 4, !dbg !5899
  %27 = add nsw i32 %26, 1, !dbg !5899
  store i32 %27, ptr %5, align 4, !dbg !5899
  br label %14, !dbg !5900, !llvm.loop !5901

28:                                               ; preds = %14
  store i32 0, ptr %5, align 4, !dbg !5903
  br label %29, !dbg !5905

29:                                               ; preds = %40, %28
  %30 = load i32, ptr %5, align 4, !dbg !5906
  %31 = icmp slt i32 %30, 4, !dbg !5908
  br i1 %31, label %32, label %43, !dbg !5909

32:                                               ; preds = %29
  %33 = load ptr, ptr %4, align 8, !dbg !5910
  %34 = load ptr, ptr %3, align 8, !dbg !5911
  %35 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %34, i32 0, i32 3, !dbg !5912
  %36 = load i32, ptr %5, align 4, !dbg !5913
  %37 = sext i32 %36 to i64, !dbg !5911
  %38 = getelementptr inbounds [4 x i32], ptr %35, i64 0, i64 %37, !dbg !5911
  %39 = load i32, ptr %38, align 4, !dbg !5911
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %33, i32 noundef %39), !dbg !5914
  br label %40, !dbg !5914

40:                                               ; preds = %32
  %41 = load i32, ptr %5, align 4, !dbg !5915
  %42 = add nsw i32 %41, 1, !dbg !5915
  store i32 %42, ptr %5, align 4, !dbg !5915
  br label %29, !dbg !5916, !llvm.loop !5917

43:                                               ; preds = %29
  %44 = load ptr, ptr %4, align 8, !dbg !5919
  %45 = load ptr, ptr %3, align 8, !dbg !5920
  %46 = getelementptr inbounds nuw %struct.cloaking_wall, ptr %45, i32 0, i32 4, !dbg !5921
  %47 = load i32, ptr %46, align 4, !dbg !5921
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %44, i32 noundef %47), !dbg !5922
  ret void, !dbg !5923
}

attributes #0 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!1547, !1548, !1549, !1550, !1551, !1552, !1553}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1554}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Walls", scope: !2, file: !24, line: 55, type: !1529, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !21, imports: !235, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/wall.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "d6e38467b938cf54987dc8cb56856f58")
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
!21 = !{!0, !22, !25, !50, !52, !67, !69, !85, !87, !93, !98, !103, !108, !113, !118, !123, !128, !133, !138, !141, !146, !151, !156, !158, !160, !162, !164, !169, !174, !179, !184, !186, !188, !193, !198, !200, !202, !204, !209, !211, !220, !225, !230, !232}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "Num_walls", scope: !2, file: !24, line: 56, type: !7, isLocal: false, isDefinition: true)
!24 = !DIFile(filename: "main_d2/wall.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d6e38467b938cf54987dc8cb56856f58")
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "WallAnims", scope: !2, file: !24, line: 58, type: !27, isLocal: false, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 61440, elements: !48)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "wclip", file: !29, line: 144, baseType: !30)
!29 = !DIFile(filename: "main_d2/wall.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "8c069539b7f5d9b8df27d96e316df410")
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !29, line: 135, size: 1024, flags: DIFlagTypePassByValue, elements: !31, identifier: "_ZTS5wclip")
!31 = !{!32, !33, !35, !39, !40, !41, !42, !47}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "play_time", scope: !30, file: !29, line: 136, baseType: !14, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "num_frames", scope: !30, file: !29, line: 137, baseType: !34, size: 16, offset: 32)
!34 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "frames", scope: !30, file: !29, line: 138, baseType: !36, size: 800, offset: 48)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "open_sound", scope: !30, file: !29, line: 139, baseType: !34, size: 16, offset: 848)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "close_sound", scope: !30, file: !29, line: 140, baseType: !34, size: 16, offset: 864)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !30, file: !29, line: 141, baseType: !34, size: 16, offset: 880)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "filename", scope: !30, file: !29, line: 142, baseType: !43, size: 104, offset: 896)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 104, elements: !45)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !{!46}
!46 = !DISubrange(count: 13)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !30, file: !29, line: 143, baseType: !44, size: 8, offset: 1000)
!48 = !{!49}
!49 = !DISubrange(count: 60)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "Num_wall_anims", scope: !2, file: !24, line: 59, type: !7, isLocal: false, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "ActiveDoors", scope: !2, file: !24, line: 64, type: !54, isLocal: false, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 11520, elements: !65)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "active_door", file: !29, line: 118, baseType: !56)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "active_door", file: !29, line: 112, size: 128, flags: DIFlagTypePassByValue, elements: !57, identifier: "_ZTS11active_door")
!57 = !{!58, !59, !63, !64}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "n_parts", scope: !56, file: !29, line: 114, baseType: !7, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "front_wallnum", scope: !56, file: !29, line: 115, baseType: !60, size: 32, offset: 32)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 32, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 2)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "back_wallnum", scope: !56, file: !29, line: 116, baseType: !60, size: 32, offset: 64)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !56, file: !29, line: 117, baseType: !14, size: 32, offset: 96)
!65 = !{!66}
!66 = !DISubrange(count: 90)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "Num_open_doors", scope: !2, file: !24, line: 65, type: !7, isLocal: false, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "CloakingWalls", scope: !2, file: !24, line: 70, type: !71, isLocal: false, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 3200, elements: !83)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "cloaking_wall", file: !29, line: 127, baseType: !73)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cloaking_wall", file: !29, line: 120, size: 320, flags: DIFlagTypePassByValue, elements: !74, identifier: "_ZTS13cloaking_wall")
!74 = !{!75, !76, !77, !81, !82}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "front_wallnum", scope: !73, file: !29, line: 122, baseType: !34, size: 16)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "back_wallnum", scope: !73, file: !29, line: 123, baseType: !34, size: 16, offset: 16)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "front_ls", scope: !73, file: !29, line: 124, baseType: !78, size: 128, offset: 32)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 4)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "back_ls", scope: !73, file: !29, line: 125, baseType: !78, size: 128, offset: 160)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !73, file: !29, line: 126, baseType: !14, size: 32, offset: 288)
!83 = !{!84}
!84 = !DISubrange(count: 10)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "Num_cloaking_walls", scope: !2, file: !24, line: 71, type: !7, isLocal: false, isDefinition: true)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(scope: null, file: !24, line: 150, type: !89, isLocal: true, isDefinition: true)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 504, elements: !91)
!90 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!91 = !{!92}
!92 = !DISubrange(count: 63)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(scope: null, file: !24, line: 150, type: !95, isLocal: true, isDefinition: true)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 432, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 54)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(scope: null, file: !24, line: 151, type: !100, isLocal: true, isDefinition: true)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 176, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 22)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression())
!104 = distinct !DIGlobalVariable(scope: null, file: !24, line: 257, type: !105, isLocal: true, isDefinition: true)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 360, elements: !106)
!106 = !{!107}
!107 = !DISubrange(count: 45)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(scope: null, file: !24, line: 273, type: !110, isLocal: true, isDefinition: true)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 256, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 32)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(scope: null, file: !24, line: 279, type: !115, isLocal: true, isDefinition: true)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 144, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 18)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(scope: null, file: !24, line: 304, type: !120, isLocal: true, isDefinition: true)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 160, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 20)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(scope: null, file: !24, line: 309, type: !125, isLocal: true, isDefinition: true)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 472, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 59)
!128 = !DIGlobalVariableExpression(var: !129, expr: !DIExpression())
!129 = distinct !DIGlobalVariable(scope: null, file: !24, line: 319, type: !130, isLocal: true, isDefinition: true)
!130 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 184, elements: !131)
!131 = !{!132}
!132 = !DISubrange(count: 23)
!133 = !DIGlobalVariableExpression(var: !134, expr: !DIExpression())
!134 = distinct !DIGlobalVariable(scope: null, file: !24, line: 394, type: !135, isLocal: true, isDefinition: true)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 152, elements: !136)
!136 = !{!137}
!137 = !DISubrange(count: 19)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(scope: null, file: !24, line: 395, type: !140, isLocal: true, isDefinition: true)
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 80, elements: !83)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(scope: null, file: !24, line: 404, type: !143, isLocal: true, isDefinition: true)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 232, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 29)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(scope: null, file: !24, line: 409, type: !148, isLocal: true, isDefinition: true)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 216, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 27)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(scope: null, file: !24, line: 427, type: !153, isLocal: true, isDefinition: true)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 168, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 21)
!156 = !DIGlobalVariableExpression(var: !157, expr: !DIExpression())
!157 = distinct !DIGlobalVariable(scope: null, file: !24, line: 440, type: !105, isLocal: true, isDefinition: true)
!158 = !DIGlobalVariableExpression(var: !159, expr: !DIExpression())
!159 = distinct !DIGlobalVariable(scope: null, file: !24, line: 506, type: !130, isLocal: true, isDefinition: true)
!160 = !DIGlobalVariableExpression(var: !161, expr: !DIExpression())
!161 = distinct !DIGlobalVariable(scope: null, file: !24, line: 536, type: !153, isLocal: true, isDefinition: true)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(scope: null, file: !24, line: 765, type: !148, isLocal: true, isDefinition: true)
!164 = !DIGlobalVariableExpression(var: !165, expr: !DIExpression())
!165 = distinct !DIGlobalVariable(scope: null, file: !24, line: 816, type: !166, isLocal: true, isDefinition: true)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 120, elements: !167)
!167 = !{!168}
!168 = !DISubrange(count: 15)
!169 = !DIGlobalVariableExpression(var: !170, expr: !DIExpression())
!170 = distinct !DIGlobalVariable(scope: null, file: !24, line: 918, type: !171, isLocal: true, isDefinition: true)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 328, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 41)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(scope: null, file: !24, line: 983, type: !176, isLocal: true, isDefinition: true)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 96, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 12)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(scope: null, file: !24, line: 986, type: !181, isLocal: true, isDefinition: true)
!181 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 336, elements: !182)
!182 = !{!183}
!183 = !DISubrange(count: 42)
!184 = !DIGlobalVariableExpression(var: !185, expr: !DIExpression())
!185 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1037, type: !171, isLocal: true, isDefinition: true)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1087, type: !166, isLocal: true, isDefinition: true)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1104, type: !190, isLocal: true, isDefinition: true)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 48, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 6)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1153, type: !195, isLocal: true, isDefinition: true)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 320, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 40)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1154, type: !143, isLocal: true, isDefinition: true)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1159, type: !153, isLocal: true, isDefinition: true)
!202 = !DIGlobalVariableExpression(var: !203, expr: !DIExpression())
!203 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1211, type: !135, isLocal: true, isDefinition: true)
!204 = !DIGlobalVariableExpression(var: !205, expr: !DIExpression())
!205 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1352, type: !206, isLocal: true, isDefinition: true)
!206 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 128, elements: !207)
!207 = !{!208}
!208 = !DISubrange(count: 16)
!209 = !DIGlobalVariableExpression(var: !210, expr: !DIExpression())
!210 = distinct !DIGlobalVariable(name: "Num_stuck_objects", scope: !2, file: !24, line: 1389, type: !7, isLocal: false, isDefinition: true)
!211 = !DIGlobalVariableExpression(var: !212, expr: !DIExpression())
!212 = distinct !DIGlobalVariable(name: "Stuck_objects", scope: !2, file: !24, line: 1391, type: !213, isLocal: false, isDefinition: true)
!213 = !DICompositeType(tag: DW_TAG_array_type, baseType: !214, size: 2048, elements: !111)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "stuckobj", file: !29, line: 92, baseType: !215)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stuckobj", file: !29, line: 88, size: 64, flags: DIFlagTypePassByValue, elements: !216, identifier: "_ZTS8stuckobj")
!216 = !{!217, !218, !219}
!217 = !DIDerivedType(tag: DW_TAG_member, name: "objnum", scope: !215, file: !29, line: 90, baseType: !34, size: 16)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "wallnum", scope: !215, file: !29, line: 90, baseType: !34, size: 16, offset: 16)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !215, file: !29, line: 91, baseType: !7, size: 32, offset: 32)
!220 = !DIGlobalVariableExpression(var: !221, expr: !DIExpression())
!221 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1417, type: !222, isLocal: true, isDefinition: true)
!222 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 624, elements: !223)
!223 = !{!224}
!224 = !DISubrange(count: 78)
!225 = !DIGlobalVariableExpression(var: !226, expr: !DIExpression())
!226 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1506, type: !227, isLocal: true, isDefinition: true)
!227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 584, elements: !228)
!228 = !{!229}
!229 = !DISubrange(count: 73)
!230 = !DIGlobalVariableExpression(var: !231, expr: !DIExpression())
!231 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1609, type: !130, isLocal: true, isDefinition: true)
!232 = !DIGlobalVariableExpression(var: !233, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!233 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !15, line: 18, type: !234, isLocal: true, isDefinition: true)
!234 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!235 = !{!236, !243, !246, !247, !248, !252, !256, !260, !264, !267, !269, !271, !273, !275, !277, !279, !281, !283, !285, !287, !289, !291, !293, !295, !297, !303, !307, !310, !313, !322, !324, !326, !328, !334, !338, !344, !346, !348, !350, !352, !354, !356, !358, !360, !362, !364, !366, !368, !370, !375, !380, !385, !390, !392, !395, !397, !399, !401, !403, !405, !407, !409, !411, !413, !417, !422, !426, !428, !432, !436, !449, !465, !466, !521, !530, !532, !540, !546, !550, !554, !556, !560, !564, !568, !572, !576, !580, !582, !584, !588, !594, !599, !603, !607, !611, !615, !619, !623, !627, !629, !631, !635, !637, !641, !645, !650, !652, !654, !656, !660, !664, !668, !670, !674, !676, !678, !680, !682, !688, !692, !694, !700, !705, !709, !713, !718, !723, !727, !731, !735, !739, !741, !743, !751, !757, !763, !767, !771, !775, !779, !784, !788, !792, !796, !800, !804, !808, !812, !816, !821, !825, !829, !833, !838, !843, !847, !849, !853, !855, !864, !868, !873, !877, !881, !885, !889, !891, !895, !899, !903, !907, !911, !913, !915, !917, !919, !920, !921, !922, !925, !927, !928, !932, !934, !936, !940, !942, !944, !946, !948, !950, !952, !954, !959, !963, !965, !967, !968, !973, !975, !977, !979, !981, !983, !985, !987, !989, !991, !993, !995, !997, !999, !1001, !1003, !1005, !1009, !1011, !1013, !1015, !1019, !1021, !1025, !1027, !1029, !1031, !1033, !1037, !1039, !1041, !1045, !1047, !1049, !1053, !1055, !1059, !1061, !1063, !1067, !1069, !1071, !1073, !1075, !1077, !1079, !1083, !1085, !1087, !1089, !1091, !1093, !1095, !1097, !1101, !1105, !1107, !1109, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1125, !1127, !1129, !1131, !1133, !1135, !1137, !1139, !1141, !1143, !1147, !1149, !1151, !1153, !1157, !1159, !1163, !1165, !1167, !1169, !1171, !1175, !1177, !1181, !1183, !1185, !1187, !1189, !1193, !1195, !1197, !1201, !1203, !1205, !1207, !1213, !1215, !1219, !1223, !1225, !1227, !1231, !1235, !1239, !1241, !1245, !1250, !1254, !1258, !1260, !1262, !1264, !1266, !1268, !1270, !1274, !1278, !1283, !1288, !1292, !1293, !1297, !1301, !1306, !1311, !1315, !1321, !1325, !1327, !1331, !1333, !1334, !1338, !1340, !1344, !1348, !1352, !1354, !1358, !1362, !1366, !1372, !1374, !1378, !1382, !1386, !1388, !1392, !1396, !1400, !1402, !1404, !1406, !1410, !1414, !1419, !1423, !1429, !1433, !1437, !1439, !1441, !1443, !1447, !1451, !1455, !1457, !1459, !1463, !1467, !1469, !1473, !1477, !1480, !1482, !1484, !1486, !1515, !1520, !1525}
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !239, file: !242, line: 158)
!237 = !DINamespace(name: "__1", scope: !238, exportSymbols: true)
!238 = !DINamespace(name: "std", scope: null)
!239 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !240, line: 30, baseType: !241)
!240 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!241 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!242 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !244, file: !242, line: 159)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !245, line: 30, baseType: !34)
!245 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !16, file: !242, line: 160)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !18, file: !242, line: 161)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !249, file: !242, line: 163)
!249 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !250, line: 31, baseType: !251)
!250 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!251 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !253, file: !242, line: 164)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !254, line: 31, baseType: !255)
!254 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!255 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !257, file: !242, line: 165)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !258, line: 31, baseType: !259)
!258 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!259 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !261, file: !242, line: 166)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !262, line: 31, baseType: !263)
!262 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!263 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !265, file: !242, line: 168)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !266, line: 29, baseType: !239)
!266 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !268, file: !242, line: 169)
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !266, line: 30, baseType: !244)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !270, file: !242, line: 170)
!270 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !266, line: 31, baseType: !16)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !272, file: !242, line: 171)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !266, line: 32, baseType: !18)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !274, file: !242, line: 173)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !266, line: 33, baseType: !249)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !276, file: !242, line: 174)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !266, line: 34, baseType: !253)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !278, file: !242, line: 175)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !266, line: 35, baseType: !257)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !280, file: !242, line: 176)
!280 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !266, line: 36, baseType: !261)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !282, file: !242, line: 178)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !266, line: 40, baseType: !239)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !284, file: !242, line: 179)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !266, line: 41, baseType: !244)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !286, file: !242, line: 180)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !266, line: 42, baseType: !16)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !288, file: !242, line: 181)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !266, line: 43, baseType: !18)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !290, file: !242, line: 183)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !266, line: 44, baseType: !249)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !292, file: !242, line: 184)
!292 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !266, line: 45, baseType: !253)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !294, file: !242, line: 185)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !266, line: 46, baseType: !257)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !296, file: !242, line: 186)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !266, line: 47, baseType: !261)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !298, file: !242, line: 188)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !299, line: 32, baseType: !300)
!299 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !301, line: 40, baseType: !302)
!301 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!302 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !304, file: !242, line: 189)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !305, line: 34, baseType: !306)
!305 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!306 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !308, file: !242, line: 191)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !309, line: 32, baseType: !302)
!309 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !311, file: !242, line: 192)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !312, line: 32, baseType: !306)
!312 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !314, file: !321, line: 422)
!314 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !316, file: !315, line: 79, type: !317, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!316 = !DINamespace(name: "__math", scope: !237)
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
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !335, file: !337, line: 22)
!335 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !336, line: 16, baseType: !320)
!336 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!337 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !339, file: !343, line: 113)
!339 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !340, file: !340, line: 217, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!341 = !DISubroutineType(types: !342)
!342 = !{!7, !7}
!343 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !345, file: !343, line: 114)
!345 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !340, file: !340, line: 223, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !347, file: !343, line: 115)
!347 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !340, file: !340, line: 229, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !349, file: !343, line: 116)
!349 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !340, file: !340, line: 235, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !351, file: !343, line: 117)
!351 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !340, file: !340, line: 242, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !353, file: !343, line: 118)
!353 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !340, file: !340, line: 248, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !355, file: !343, line: 119)
!355 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !340, file: !340, line: 254, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !357, file: !343, line: 120)
!357 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !340, file: !340, line: 260, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !359, file: !343, line: 121)
!359 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !340, file: !340, line: 266, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !361, file: !343, line: 122)
!361 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !340, file: !340, line: 272, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !363, file: !343, line: 123)
!363 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !340, file: !340, line: 278, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !365, file: !343, line: 124)
!365 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !340, file: !340, line: 285, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !367, file: !343, line: 125)
!367 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !340, file: !340, line: 297, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !369, file: !343, line: 126)
!369 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !340, file: !340, line: 303, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !371, file: !374, line: 75)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !372, line: 32, baseType: !373)
!372 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !301, line: 111, baseType: !7)
!374 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !376, file: !374, line: 76)
!376 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !377, line: 32, baseType: !378)
!377 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !379, line: 44, baseType: !7)
!379 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !381, file: !374, line: 77)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !382, line: 32, baseType: !383)
!382 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !379, line: 46, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !301, line: 36, baseType: !259)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !386, file: !374, line: 78)
!386 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !387, file: !387, line: 84, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!387 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!388 = !DISubroutineType(types: !389)
!389 = !{!7, !371}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !391, file: !374, line: 79)
!391 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !387, file: !387, line: 90, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !393, file: !374, line: 80)
!393 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !394, file: !394, line: 53, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !396, file: !374, line: 81)
!396 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !387, file: !387, line: 96, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !398, file: !374, line: 82)
!398 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !387, file: !387, line: 108, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !400, file: !374, line: 83)
!400 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !387, file: !387, line: 114, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !402, file: !374, line: 84)
!402 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !387, file: !387, line: 120, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !404, file: !374, line: 85)
!404 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !387, file: !387, line: 126, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !406, file: !374, line: 86)
!406 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !387, file: !387, line: 132, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !408, file: !374, line: 87)
!408 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !387, file: !387, line: 138, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !410, file: !374, line: 88)
!410 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !387, file: !387, line: 144, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !412, file: !374, line: 89)
!412 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !387, file: !387, line: 150, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !414, file: !374, line: 90)
!414 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !387, file: !387, line: 102, type: !415, flags: DIFlagPrototyped, spFlags: 0)
!415 = !DISubroutineType(types: !416)
!416 = !{!7, !371, !381}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !418, file: !374, line: 91)
!418 = !DISubprogram(name: "wctype", scope: !387, file: !387, line: 190, type: !419, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DISubroutineType(types: !420)
!420 = !{!381, !421}
!421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !423, file: !374, line: 92)
!423 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !387, file: !387, line: 156, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DISubroutineType(types: !425)
!425 = !{!371, !371}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !427, file: !374, line: 93)
!427 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !387, file: !387, line: 162, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !429, file: !374, line: 94)
!429 = !DISubprogram(name: "towctrans", scope: !394, file: !394, line: 124, type: !430, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DISubroutineType(types: !431)
!431 = !{!371, !371, !376}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !433, file: !374, line: 95)
!433 = !DISubprogram(name: "wctrans", scope: !394, file: !394, line: 126, type: !434, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DISubroutineType(types: !435)
!435 = !{!376, !421}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !437, file: !448, line: 133)
!437 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !438, line: 32, baseType: !439)
!438 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!439 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !301, line: 72, baseType: !440)
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !301, line: 70, baseType: !441)
!441 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !301, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !442, identifier: "_ZTS11__mbstate_t")
!442 = !{!443, !447}
!443 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !441, file: !301, line: 68, baseType: !444, size: 1024)
!444 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 1024, elements: !445)
!445 = !{!446}
!446 = !DISubrange(count: 128)
!447 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !441, file: !301, line: 69, baseType: !20, size: 64)
!448 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !450, file: !448, line: 134)
!450 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !451, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !452, identifier: "_ZTS2tm")
!451 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!452 = !{!453, !454, !455, !456, !457, !458, !459, !460, !461, !462, !463}
!453 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !450, file: !451, line: 79, baseType: !7, size: 32)
!454 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !450, file: !451, line: 80, baseType: !7, size: 32, offset: 32)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !450, file: !451, line: 81, baseType: !7, size: 32, offset: 64)
!456 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !450, file: !451, line: 82, baseType: !7, size: 32, offset: 96)
!457 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !450, file: !451, line: 83, baseType: !7, size: 32, offset: 128)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !450, file: !451, line: 84, baseType: !7, size: 32, offset: 160)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !450, file: !451, line: 85, baseType: !7, size: 32, offset: 192)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !450, file: !451, line: 86, baseType: !7, size: 32, offset: 224)
!461 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !450, file: !451, line: 87, baseType: !7, size: 32, offset: 256)
!462 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !450, file: !451, line: 88, baseType: !302, size: 64, offset: 320)
!463 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !450, file: !451, line: 89, baseType: !464, size: 64, offset: 384)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !371, file: !448, line: 135)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !467, file: !448, line: 136)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !468, line: 162, baseType: !469)
!468 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!469 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !468, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !470, identifier: "_ZTS7__sFILE")
!470 = !{!471, !473, !474, !475, !476, !477, !482, !483, !485, !489, !493, !501, !505, !506, !509, !510, !514, !518, !519, !520}
!471 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !469, file: !468, line: 132, baseType: !472, size: 64)
!472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !469, file: !468, line: 133, baseType: !7, size: 32, offset: 64)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !469, file: !468, line: 134, baseType: !7, size: 32, offset: 96)
!475 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !469, file: !468, line: 135, baseType: !34, size: 16, offset: 128)
!476 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !469, file: !468, line: 136, baseType: !34, size: 16, offset: 144)
!477 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !469, file: !468, line: 137, baseType: !478, size: 128, offset: 192)
!478 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !468, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !479, identifier: "_ZTS6__sbuf")
!479 = !{!480, !481}
!480 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !478, file: !468, line: 98, baseType: !472, size: 64)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !478, file: !468, line: 99, baseType: !7, size: 32, offset: 64)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !469, file: !468, line: 138, baseType: !7, size: 32, offset: 320)
!483 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !469, file: !468, line: 141, baseType: !484, size: 64, offset: 384)
!484 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!485 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !469, file: !468, line: 142, baseType: !486, size: 64, offset: 448)
!486 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !487, size: 64)
!487 = !DISubroutineType(types: !488)
!488 = !{!7, !484}
!489 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !469, file: !468, line: 143, baseType: !490, size: 64, offset: 512)
!490 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !491, size: 64)
!491 = !DISubroutineType(types: !492)
!492 = !{!7, !484, !464, !7}
!493 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !469, file: !468, line: 144, baseType: !494, size: 64, offset: 576)
!494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !495, size: 64)
!495 = !DISubroutineType(types: !496)
!496 = !{!497, !484, !497, !7}
!497 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !468, line: 86, baseType: !498)
!498 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !499, line: 83, baseType: !500)
!499 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!500 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !301, line: 37, baseType: !20)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !469, file: !468, line: 145, baseType: !502, size: 64, offset: 640)
!502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !503, size: 64)
!503 = !DISubroutineType(types: !504)
!504 = !{!7, !484, !421, !7}
!505 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !469, file: !468, line: 148, baseType: !478, size: 128, offset: 704)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !469, file: !468, line: 149, baseType: !507, size: 64, offset: 832)
!507 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !508, size: 64)
!508 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !468, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!509 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !469, file: !468, line: 150, baseType: !7, size: 32, offset: 896)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !469, file: !468, line: 153, baseType: !511, size: 24, offset: 928)
!511 = !DICompositeType(tag: DW_TAG_array_type, baseType: !251, size: 24, elements: !512)
!512 = !{!513}
!513 = !DISubrange(count: 3)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !469, file: !468, line: 154, baseType: !515, size: 8, offset: 952)
!515 = !DICompositeType(tag: DW_TAG_array_type, baseType: !251, size: 8, elements: !516)
!516 = !{!517}
!517 = !DISubrange(count: 1)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !469, file: !468, line: 157, baseType: !478, size: 128, offset: 960)
!519 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !469, file: !468, line: 160, baseType: !7, size: 32, offset: 1088)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !469, file: !468, line: 161, baseType: !497, size: 64, offset: 1152)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !522, file: !448, line: 137)
!522 = !DISubprogram(name: "fwprintf", scope: !523, file: !523, line: 107, type: !524, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!524 = !DISubroutineType(types: !525)
!525 = !{!7, !526, !527, null}
!526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !467, size: 64)
!527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !528, size: 64)
!528 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !529)
!529 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !531, file: !448, line: 138)
!531 = !DISubprogram(name: "fwscanf", scope: !523, file: !523, line: 108, type: !524, flags: DIFlagPrototyped, spFlags: 0)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !533, file: !448, line: 139)
!533 = !DISubprogram(name: "swprintf", scope: !523, file: !523, line: 120, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{!7, !536, !537, !527, null}
!536 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !529, size: 64)
!537 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !538, line: 50, baseType: !539)
!538 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!539 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !301, line: 87, baseType: !306)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !541, file: !448, line: 140)
!541 = !DISubprogram(name: "vfwprintf", scope: !523, file: !523, line: 124, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DISubroutineType(types: !543)
!543 = !{!7, !526, !527, !544}
!544 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !301, line: 95, baseType: !545)
!545 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !24, baseType: !464)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !547, file: !448, line: 141)
!547 = !DISubprogram(name: "vswprintf", scope: !523, file: !523, line: 126, type: !548, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DISubroutineType(types: !549)
!549 = !{!7, !536, !537, !527, !544}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !551, file: !448, line: 142)
!551 = !DISubprogram(name: "swscanf", scope: !523, file: !523, line: 122, type: !552, flags: DIFlagPrototyped, spFlags: 0)
!552 = !DISubroutineType(types: !553)
!553 = !{!7, !527, !527, null}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !555, file: !448, line: 143)
!555 = !DISubprogram(name: "vfwscanf", scope: !523, file: !523, line: 195, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !557, file: !448, line: 144)
!557 = !DISubprogram(name: "vswscanf", scope: !523, file: !523, line: 197, type: !558, flags: DIFlagPrototyped, spFlags: 0)
!558 = !DISubroutineType(types: !559)
!559 = !{!7, !527, !527, !544}
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !561, file: !448, line: 145)
!561 = !DISubprogram(name: "fgetwc", scope: !523, file: !523, line: 100, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!371, !526}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !565, file: !448, line: 146)
!565 = !DISubprogram(name: "fgetws", scope: !523, file: !523, line: 102, type: !566, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DISubroutineType(types: !567)
!567 = !{!536, !536, !7, !526}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !569, file: !448, line: 147)
!569 = !DISubprogram(name: "fputwc", scope: !523, file: !523, line: 104, type: !570, flags: DIFlagPrototyped, spFlags: 0)
!570 = !DISubroutineType(types: !571)
!571 = !{!371, !529, !526}
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !573, file: !448, line: 148)
!573 = !DISubprogram(name: "fputws", scope: !523, file: !523, line: 105, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!7, !527, !526}
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !577, file: !448, line: 149)
!577 = !DISubprogram(name: "fwide", scope: !523, file: !523, line: 106, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DISubroutineType(types: !579)
!579 = !{!7, !526, !7}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !581, file: !448, line: 150)
!581 = !DISubprogram(name: "getwc", scope: !523, file: !523, line: 109, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !583, file: !448, line: 151)
!583 = !DISubprogram(name: "putwc", scope: !523, file: !523, line: 118, type: !570, flags: DIFlagPrototyped, spFlags: 0)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !585, file: !448, line: 152)
!585 = !DISubprogram(name: "ungetwc", scope: !523, file: !523, line: 123, type: !586, flags: DIFlagPrototyped, spFlags: 0)
!586 = !DISubroutineType(types: !587)
!587 = !{!371, !371, !526}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !589, file: !448, line: 153)
!589 = !DISubprogram(name: "wcstod", scope: !523, file: !523, line: 160, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DISubroutineType(types: !591)
!591 = !{!592, !527, !593}
!592 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!593 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !536, size: 64)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !595, file: !448, line: 154)
!595 = !DISubprogram(name: "wcstof", scope: !523, file: !523, line: 200, type: !596, flags: DIFlagPrototyped, spFlags: 0)
!596 = !DISubroutineType(types: !597)
!597 = !{!598, !527, !593}
!598 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !600, file: !448, line: 155)
!600 = !DISubprogram(name: "wcstold", scope: !523, file: !523, line: 202, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!320, !527, !593}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !604, file: !448, line: 156)
!604 = !DISubprogram(name: "wcstol", scope: !523, file: !523, line: 164, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DISubroutineType(types: !606)
!606 = !{!302, !527, !593, !7}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !608, file: !448, line: 157)
!608 = !DISubprogram(name: "wcstoll", scope: !523, file: !523, line: 205, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!20, !527, !593, !7}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !612, file: !448, line: 158)
!612 = !DISubprogram(name: "wcstoul", scope: !523, file: !523, line: 167, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!306, !527, !593, !7}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !616, file: !448, line: 159)
!616 = !DISubprogram(name: "wcstoull", scope: !523, file: !523, line: 207, type: !617, flags: DIFlagPrototyped, spFlags: 0)
!617 = !DISubroutineType(types: !618)
!618 = !{!263, !527, !593, !7}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !620, file: !448, line: 160)
!620 = !DISubprogram(name: "wcscpy", scope: !523, file: !523, line: 134, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!621 = !DISubroutineType(types: !622)
!622 = !{!536, !536, !527}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !624, file: !448, line: 161)
!624 = !DISubprogram(name: "wcsncpy", scope: !523, file: !523, line: 148, type: !625, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DISubroutineType(types: !626)
!626 = !{!536, !536, !527, !537}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !628, file: !448, line: 162)
!628 = !DISubprogram(name: "wcscat", scope: !523, file: !523, line: 130, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !630, file: !448, line: 163)
!630 = !DISubprogram(name: "wcsncat", scope: !523, file: !523, line: 142, type: !625, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !632, file: !448, line: 164)
!632 = !DISubprogram(name: "wcscmp", scope: !523, file: !523, line: 132, type: !633, flags: DIFlagPrototyped, spFlags: 0)
!633 = !DISubroutineType(types: !634)
!634 = !{!7, !527, !527}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !636, file: !448, line: 165)
!636 = !DISubprogram(name: "wcscoll", scope: !523, file: !523, line: 133, type: !633, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !638, file: !448, line: 166)
!638 = !DISubprogram(name: "wcsncmp", scope: !523, file: !523, line: 145, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!639 = !DISubroutineType(types: !640)
!640 = !{!7, !527, !527, !537}
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !642, file: !448, line: 167)
!642 = !DISubprogram(name: "wcsxfrm", scope: !523, file: !523, line: 157, type: !643, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DISubroutineType(types: !644)
!644 = !{!537, !536, !527, !537}
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !646, file: !448, line: 168)
!646 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !647, file: !647, line: 147, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!647 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!648 = !DISubroutineType(types: !649)
!649 = !{!536, !536, !529}
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !651, file: !448, line: 169)
!651 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !647, file: !647, line: 158, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !653, file: !448, line: 170)
!653 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !647, file: !647, line: 168, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !655, file: !448, line: 171)
!655 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !647, file: !647, line: 179, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !657, file: !448, line: 172)
!657 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !647, file: !647, line: 190, type: !658, flags: DIFlagPrototyped, spFlags: 0)
!658 = !DISubroutineType(types: !659)
!659 = !{!536, !536, !529, !537}
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !661, file: !448, line: 173)
!661 = !DISubprogram(name: "wcscspn", scope: !523, file: !523, line: 136, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DISubroutineType(types: !663)
!663 = !{!537, !527, !527}
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !665, file: !448, line: 174)
!665 = !DISubprogram(name: "wcslen", scope: !523, file: !523, line: 140, type: !666, flags: DIFlagPrototyped, spFlags: 0)
!666 = !DISubroutineType(types: !667)
!667 = !{!537, !527}
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !669, file: !448, line: 175)
!669 = !DISubprogram(name: "wcsspn", scope: !523, file: !523, line: 155, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !671, file: !448, line: 176)
!671 = !DISubprogram(name: "wcstok", scope: !523, file: !523, line: 162, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DISubroutineType(types: !673)
!673 = !{!536, !536, !527, !593}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !675, file: !448, line: 177)
!675 = !DISubprogram(name: "wmemcmp", scope: !523, file: !523, line: 170, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !677, file: !448, line: 178)
!677 = !DISubprogram(name: "wmemcpy", scope: !523, file: !523, line: 173, type: !625, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !679, file: !448, line: 179)
!679 = !DISubprogram(name: "wmemmove", scope: !523, file: !523, line: 176, type: !625, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !681, file: !448, line: 180)
!681 = !DISubprogram(name: "wmemset", scope: !523, file: !523, line: 179, type: !658, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !683, file: !448, line: 181)
!683 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !523, file: !523, line: 137, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!537, !536, !537, !527, !686}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !687, size: 64)
!687 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !450)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !689, file: !448, line: 182)
!689 = !DISubprogram(name: "btowc", scope: !523, file: !523, line: 99, type: !690, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DISubroutineType(types: !691)
!691 = !{!371, !7}
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !693, file: !448, line: 183)
!693 = !DISubprogram(name: "wctob", scope: !523, file: !523, line: 159, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !695, file: !448, line: 184)
!695 = !DISubprogram(name: "mbsinit", scope: !523, file: !523, line: 115, type: !696, flags: DIFlagPrototyped, spFlags: 0)
!696 = !DISubroutineType(types: !697)
!697 = !{!7, !698}
!698 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !699, size: 64)
!699 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !437)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !701, file: !448, line: 185)
!701 = !DISubprogram(name: "mbrlen", scope: !523, file: !523, line: 111, type: !702, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DISubroutineType(types: !703)
!703 = !{!537, !421, !537, !704}
!704 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !706, file: !448, line: 186)
!706 = !DISubprogram(name: "mbrtowc", scope: !523, file: !523, line: 113, type: !707, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DISubroutineType(types: !708)
!708 = !{!537, !536, !421, !537, !704}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !710, file: !448, line: 187)
!710 = !DISubprogram(name: "wcrtomb", scope: !523, file: !523, line: 129, type: !711, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DISubroutineType(types: !712)
!712 = !{!537, !464, !529, !704}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !714, file: !448, line: 188)
!714 = !DISubprogram(name: "mbsrtowcs", scope: !523, file: !523, line: 116, type: !715, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DISubroutineType(types: !716)
!716 = !{!537, !536, !717, !537, !704}
!717 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !421, size: 64)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !719, file: !448, line: 189)
!719 = !DISubprogram(name: "wcsrtombs", scope: !523, file: !523, line: 153, type: !720, flags: DIFlagPrototyped, spFlags: 0)
!720 = !DISubroutineType(types: !721)
!721 = !{!537, !464, !722, !537, !704}
!722 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !527, size: 64)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !724, file: !448, line: 191)
!724 = !DISubprogram(name: "getwchar", scope: !523, file: !523, line: 110, type: !725, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DISubroutineType(types: !726)
!726 = !{!371}
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !728, file: !448, line: 192)
!728 = !DISubprogram(name: "vwscanf", scope: !523, file: !523, line: 199, type: !729, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DISubroutineType(types: !730)
!730 = !{!7, !527, !544}
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !732, file: !448, line: 193)
!732 = !DISubprogram(name: "wscanf", scope: !523, file: !523, line: 181, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{!7, !527, null}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !736, file: !448, line: 195)
!736 = !DISubprogram(name: "putwchar", scope: !523, file: !523, line: 119, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DISubroutineType(types: !738)
!738 = !{!371, !529}
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !740, file: !448, line: 196)
!740 = !DISubprogram(name: "vwprintf", scope: !523, file: !523, line: 128, type: !729, flags: DIFlagPrototyped, spFlags: 0)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !742, file: !448, line: 197)
!742 = !DISubprogram(name: "wprintf", scope: !523, file: !523, line: 180, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !744, file: !750, line: 106)
!744 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !745, line: 105, baseType: !746)
!745 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!746 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !745, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !747, identifier: "_ZTS5div_t")
!747 = !{!748, !749}
!748 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !746, file: !745, line: 103, baseType: !7, size: 32)
!749 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !746, file: !745, line: 104, baseType: !7, size: 32, offset: 32)
!750 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !752, file: !750, line: 107)
!752 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !745, line: 110, baseType: !753)
!753 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !745, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !754, identifier: "_ZTS6ldiv_t")
!754 = !{!755, !756}
!755 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !753, file: !745, line: 108, baseType: !302, size: 64)
!756 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !753, file: !745, line: 109, baseType: !302, size: 64, offset: 64)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !758, file: !750, line: 108)
!758 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !745, line: 116, baseType: !759)
!759 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !745, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !760, identifier: "_ZTS7lldiv_t")
!760 = !{!761, !762}
!761 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !759, file: !745, line: 114, baseType: !20, size: 64)
!762 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !759, file: !745, line: 115, baseType: !20, size: 64, offset: 64)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !764, file: !750, line: 109)
!764 = !DISubprogram(name: "atof", scope: !745, file: !745, line: 149, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!592, !421}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !768, file: !750, line: 110)
!768 = !DISubprogram(name: "atoi", scope: !745, file: !745, line: 150, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DISubroutineType(types: !770)
!770 = !{!7, !421}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !772, file: !750, line: 111)
!772 = !DISubprogram(name: "atol", scope: !745, file: !745, line: 151, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DISubroutineType(types: !774)
!774 = !{!302, !421}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !776, file: !750, line: 112)
!776 = !DISubprogram(name: "atoll", scope: !745, file: !745, line: 154, type: !777, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DISubroutineType(types: !778)
!778 = !{!20, !421}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !780, file: !750, line: 113)
!780 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !745, file: !745, line: 184, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DISubroutineType(types: !782)
!782 = !{!592, !421, !783}
!783 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !785, file: !750, line: 114)
!785 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !745, file: !745, line: 185, type: !786, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DISubroutineType(types: !787)
!787 = !{!598, !421, !783}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !789, file: !750, line: 115)
!789 = !DISubprogram(name: "strtold", scope: !745, file: !745, line: 188, type: !790, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DISubroutineType(types: !791)
!791 = !{!320, !421, !783}
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !793, file: !750, line: 116)
!793 = !DISubprogram(name: "strtol", scope: !745, file: !745, line: 186, type: !794, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DISubroutineType(types: !795)
!795 = !{!302, !421, !783, !7}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !797, file: !750, line: 117)
!797 = !DISubprogram(name: "strtoll", scope: !745, file: !745, line: 191, type: !798, flags: DIFlagPrototyped, spFlags: 0)
!798 = !DISubroutineType(types: !799)
!799 = !{!20, !421, !783, !7}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !801, file: !750, line: 118)
!801 = !DISubprogram(name: "strtoul", scope: !745, file: !745, line: 194, type: !802, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{!306, !421, !783, !7}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !805, file: !750, line: 119)
!805 = !DISubprogram(name: "strtoull", scope: !745, file: !745, line: 197, type: !806, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DISubroutineType(types: !807)
!807 = !{!263, !421, !783, !7}
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !809, file: !750, line: 120)
!809 = !DISubprogram(name: "rand", scope: !745, file: !745, line: 181, type: !810, flags: DIFlagPrototyped, spFlags: 0)
!810 = !DISubroutineType(types: !811)
!811 = !{!7}
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !813, file: !750, line: 121)
!813 = !DISubprogram(name: "srand", scope: !745, file: !745, line: 183, type: !814, flags: DIFlagPrototyped, spFlags: 0)
!814 = !DISubroutineType(types: !815)
!815 = !{null, !259}
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !817, file: !750, line: 122)
!817 = !DISubprogram(name: "calloc", scope: !818, file: !818, line: 55, type: !819, flags: DIFlagPrototyped, spFlags: 0)
!818 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!819 = !DISubroutineType(types: !820)
!820 = !{!484, !537, !537}
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !822, file: !750, line: 123)
!822 = !DISubprogram(name: "free", scope: !818, file: !818, line: 56, type: !823, flags: DIFlagPrototyped, spFlags: 0)
!823 = !DISubroutineType(types: !824)
!824 = !{null, !484}
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !826, file: !750, line: 124)
!826 = !DISubprogram(name: "malloc", scope: !818, file: !818, line: 54, type: !827, flags: DIFlagPrototyped, spFlags: 0)
!827 = !DISubroutineType(types: !828)
!828 = !{!484, !537}
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !830, file: !750, line: 125)
!830 = !DISubprogram(name: "realloc", scope: !818, file: !818, line: 57, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!831 = !DISubroutineType(types: !832)
!832 = !{!484, !484, !537}
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !834, file: !750, line: 126)
!834 = !DISubprogram(name: "abort", scope: !835, file: !835, line: 33, type: !836, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!835 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!836 = !DISubroutineType(types: !837)
!837 = !{null}
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !839, file: !750, line: 127)
!839 = !DISubprogram(name: "atexit", scope: !745, file: !745, line: 144, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DISubroutineType(types: !841)
!841 = !{!7, !842}
!842 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !836, size: 64)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !844, file: !750, line: 128)
!844 = !DISubprogram(name: "exit", scope: !745, file: !745, line: 160, type: !845, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!845 = !DISubroutineType(types: !846)
!846 = !{null, !7}
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !848, file: !750, line: 129)
!848 = !DISubprogram(name: "_Exit", scope: !745, file: !745, line: 210, type: !845, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !850, file: !750, line: 130)
!850 = !DISubprogram(name: "getenv", scope: !745, file: !745, line: 162, type: !851, flags: DIFlagPrototyped, spFlags: 0)
!851 = !DISubroutineType(types: !852)
!852 = !{!464, !421}
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !854, file: !750, line: 131)
!854 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !745, file: !745, line: 203, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !856, file: !750, line: 132)
!856 = !DISubprogram(name: "bsearch", scope: !745, file: !745, line: 156, type: !857, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DISubroutineType(types: !858)
!858 = !{!484, !859, !859, !537, !537, !861}
!859 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !860, size: 64)
!860 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!861 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !862, size: 64)
!862 = !DISubroutineType(types: !863)
!863 = !{!7, !859, !859}
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !865, file: !750, line: 133)
!865 = !DISubprogram(name: "qsort", scope: !745, file: !745, line: 175, type: !866, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DISubroutineType(types: !867)
!867 = !{null, !484, !537, !537, !861}
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !869, file: !750, line: 134)
!869 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !870, file: !870, line: 123, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!870 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!871 = !DISubroutineType(types: !872)
!872 = !{!320, !320}
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !874, file: !750, line: 135)
!874 = !DISubprogram(name: "labs", scope: !745, file: !745, line: 163, type: !875, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DISubroutineType(types: !876)
!876 = !{!302, !302}
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !878, file: !750, line: 136)
!878 = !DISubprogram(name: "llabs", scope: !745, file: !745, line: 167, type: !879, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DISubroutineType(types: !880)
!880 = !{!20, !20}
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !882, file: !750, line: 137)
!882 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !870, file: !870, line: 143, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DISubroutineType(types: !884)
!884 = !{!758, !20, !20}
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !886, file: !750, line: 138)
!886 = !DISubprogram(name: "ldiv", scope: !745, file: !745, line: 164, type: !887, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DISubroutineType(types: !888)
!888 = !{!752, !302, !302}
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !890, file: !750, line: 139)
!890 = !DISubprogram(name: "lldiv", scope: !745, file: !745, line: 168, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !892, file: !750, line: 140)
!892 = !DISubprogram(name: "mblen", scope: !745, file: !745, line: 171, type: !893, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DISubroutineType(types: !894)
!894 = !{!7, !421, !537}
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !896, file: !750, line: 142)
!896 = !DISubprogram(name: "mbtowc", scope: !745, file: !745, line: 173, type: !897, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DISubroutineType(types: !898)
!898 = !{!7, !536, !421, !537}
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !900, file: !750, line: 143)
!900 = !DISubprogram(name: "wctomb", scope: !745, file: !745, line: 207, type: !901, flags: DIFlagPrototyped, spFlags: 0)
!901 = !DISubroutineType(types: !902)
!902 = !{!7, !464, !529}
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !904, file: !750, line: 144)
!904 = !DISubprogram(name: "mbstowcs", scope: !745, file: !745, line: 172, type: !905, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DISubroutineType(types: !906)
!906 = !{!537, !536, !421, !537}
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !908, file: !750, line: 145)
!908 = !DISubprogram(name: "wcstombs", scope: !745, file: !745, line: 206, type: !909, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DISubroutineType(types: !910)
!910 = !{!537, !464, !527, !537}
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !912, file: !750, line: 148)
!912 = !DISubprogram(name: "at_quick_exit", scope: !745, file: !745, line: 147, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !914, file: !750, line: 149)
!914 = !DISubprogram(name: "quick_exit", scope: !745, file: !745, line: 179, type: !845, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !437, file: !916, line: 25)
!916 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !314, file: !918, line: 352)
!918 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !323, file: !918, line: 353)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !325, file: !918, line: 354)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !327, file: !918, line: 355)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !923, file: !918, line: 364)
!923 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !924, line: 50, baseType: !598)
!924 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !926, file: !918, line: 365)
!926 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !924, line: 51, baseType: !592)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !869, file: !918, line: 367)
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !929, file: !918, line: 370)
!929 = !DISubprogram(name: "acosf", scope: !924, file: !924, line: 314, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!930 = !DISubroutineType(types: !931)
!931 = !{!598, !598}
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !933, file: !918, line: 372)
!933 = !DISubprogram(name: "asinf", scope: !924, file: !924, line: 318, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !935, file: !918, line: 374)
!935 = !DISubprogram(name: "atanf", scope: !924, file: !924, line: 322, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !937, file: !918, line: 376)
!937 = !DISubprogram(name: "atan2f", scope: !924, file: !924, line: 326, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!938 = !DISubroutineType(types: !939)
!939 = !{!598, !598, !598}
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !941, file: !918, line: 378)
!941 = !DISubprogram(name: "ceilf", scope: !924, file: !924, line: 461, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !943, file: !918, line: 380)
!943 = !DISubprogram(name: "cosf", scope: !924, file: !924, line: 330, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !945, file: !918, line: 382)
!945 = !DISubprogram(name: "coshf", scope: !924, file: !924, line: 354, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !947, file: !918, line: 385)
!947 = !DISubprogram(name: "expf", scope: !924, file: !924, line: 366, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !949, file: !918, line: 388)
!949 = !DISubprogram(name: "fabsf", scope: !924, file: !924, line: 422, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !951, file: !918, line: 390)
!951 = !DISubprogram(name: "floorf", scope: !924, file: !924, line: 465, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !953, file: !918, line: 393)
!953 = !DISubprogram(name: "fmodf", scope: !924, file: !924, line: 505, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !955, file: !918, line: 396)
!955 = !DISubprogram(name: "frexpf", scope: !924, file: !924, line: 406, type: !956, flags: DIFlagPrototyped, spFlags: 0)
!956 = !DISubroutineType(types: !957)
!957 = !{!598, !598, !958}
!958 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !960, file: !918, line: 398)
!960 = !DISubprogram(name: "ldexpf", scope: !924, file: !924, line: 402, type: !961, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DISubroutineType(types: !962)
!962 = !{!598, !598, !7}
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !964, file: !918, line: 401)
!964 = !DISubprogram(name: "logf", scope: !924, file: !924, line: 378, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !966, file: !918, line: 404)
!966 = !DISubprogram(name: "log10f", scope: !924, file: !924, line: 382, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !329, file: !918, line: 405)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !969, file: !918, line: 406)
!969 = !DISubprogram(name: "modff", scope: !924, file: !924, line: 398, type: !970, flags: DIFlagPrototyped, spFlags: 0)
!970 = !DISubroutineType(types: !971)
!971 = !{!598, !598, !972}
!972 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !598, size: 64)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !974, file: !918, line: 409)
!974 = !DISubprogram(name: "powf", scope: !924, file: !924, line: 434, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !976, file: !918, line: 412)
!976 = !DISubprogram(name: "sinf", scope: !924, file: !924, line: 334, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !978, file: !918, line: 414)
!978 = !DISubprogram(name: "sinhf", scope: !924, file: !924, line: 358, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !980, file: !918, line: 417)
!980 = !DISubprogram(name: "sqrtf", scope: !924, file: !924, line: 438, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !982, file: !918, line: 419)
!982 = !DISubprogram(name: "tanf", scope: !924, file: !924, line: 338, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !984, file: !918, line: 422)
!984 = !DISubprogram(name: "tanhf", scope: !924, file: !924, line: 362, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !986, file: !918, line: 425)
!986 = !DISubprogram(name: "acoshf", scope: !924, file: !924, line: 342, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !988, file: !918, line: 427)
!988 = !DISubprogram(name: "asinhf", scope: !924, file: !924, line: 346, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !990, file: !918, line: 429)
!990 = !DISubprogram(name: "atanhf", scope: !924, file: !924, line: 350, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !992, file: !918, line: 431)
!992 = !DISubprogram(name: "cbrtf", scope: !924, file: !924, line: 426, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !994, file: !918, line: 434)
!994 = !DISubprogram(name: "copysignf", scope: !924, file: !924, line: 517, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !996, file: !918, line: 437)
!996 = !DISubprogram(name: "erff", scope: !924, file: !924, line: 442, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !998, file: !918, line: 439)
!998 = !DISubprogram(name: "erfcf", scope: !924, file: !924, line: 446, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1000, file: !918, line: 441)
!1000 = !DISubprogram(name: "exp2f", scope: !924, file: !924, line: 370, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1002, file: !918, line: 443)
!1002 = !DISubprogram(name: "expm1f", scope: !924, file: !924, line: 374, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1004, file: !918, line: 445)
!1004 = !DISubprogram(name: "fdimf", scope: !924, file: !924, line: 533, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1006, file: !918, line: 446)
!1006 = !DISubprogram(name: "fmaf", scope: !924, file: !924, line: 545, type: !1007, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!598, !598, !598, !598}
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1010, file: !918, line: 449)
!1010 = !DISubprogram(name: "fmaxf", scope: !924, file: !924, line: 537, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1012, file: !918, line: 451)
!1012 = !DISubprogram(name: "fminf", scope: !924, file: !924, line: 541, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1014, file: !918, line: 453)
!1014 = !DISubprogram(name: "hypotf", scope: !924, file: !924, line: 430, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1016, file: !918, line: 455)
!1016 = !DISubprogram(name: "ilogbf", scope: !924, file: !924, line: 410, type: !1017, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!7, !598}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1020, file: !918, line: 457)
!1020 = !DISubprogram(name: "lgammaf", scope: !924, file: !924, line: 453, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1022, file: !918, line: 459)
!1022 = !DISubprogram(name: "llrintf", scope: !924, file: !924, line: 492, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!20, !598}
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1026, file: !918, line: 461)
!1026 = !DISubprogram(name: "llroundf", scope: !924, file: !924, line: 496, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1028, file: !918, line: 463)
!1028 = !DISubprogram(name: "log1pf", scope: !924, file: !924, line: 390, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1030, file: !918, line: 465)
!1030 = !DISubprogram(name: "log2f", scope: !924, file: !924, line: 386, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1032, file: !918, line: 467)
!1032 = !DISubprogram(name: "logbf", scope: !924, file: !924, line: 394, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1034, file: !918, line: 469)
!1034 = !DISubprogram(name: "lrintf", scope: !924, file: !924, line: 477, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!302, !598}
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1038, file: !918, line: 471)
!1038 = !DISubprogram(name: "lroundf", scope: !924, file: !924, line: 485, type: !1035, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1040, file: !918, line: 473)
!1040 = !DISubprogram(name: "nan", scope: !924, file: !924, line: 522, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1042, file: !918, line: 474)
!1042 = !DISubprogram(name: "nanf", scope: !924, file: !924, line: 521, type: !1043, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!598, !421}
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1046, file: !918, line: 477)
!1046 = !DISubprogram(name: "nearbyintf", scope: !924, file: !924, line: 469, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1048, file: !918, line: 479)
!1048 = !DISubprogram(name: "nextafterf", scope: !924, file: !924, line: 525, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1050, file: !918, line: 481)
!1050 = !DISubprogram(name: "nexttowardf", scope: !924, file: !924, line: 530, type: !1051, flags: DIFlagPrototyped, spFlags: 0)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!598, !598, !320}
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1054, file: !918, line: 483)
!1054 = !DISubprogram(name: "remainderf", scope: !924, file: !924, line: 509, type: !938, flags: DIFlagPrototyped, spFlags: 0)
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1056, file: !918, line: 485)
!1056 = !DISubprogram(name: "remquof", scope: !924, file: !924, line: 513, type: !1057, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!598, !598, !598, !958}
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1060, file: !918, line: 487)
!1060 = !DISubprogram(name: "rintf", scope: !924, file: !924, line: 473, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1062, file: !918, line: 489)
!1062 = !DISubprogram(name: "roundf", scope: !924, file: !924, line: 481, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1064, file: !918, line: 491)
!1064 = !DISubprogram(name: "scalblnf", scope: !924, file: !924, line: 418, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!598, !598, !302}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1068, file: !918, line: 493)
!1068 = !DISubprogram(name: "scalbnf", scope: !924, file: !924, line: 414, type: !961, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1070, file: !918, line: 495)
!1070 = !DISubprogram(name: "tgammaf", scope: !924, file: !924, line: 457, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1072, file: !918, line: 497)
!1072 = !DISubprogram(name: "truncf", scope: !924, file: !924, line: 501, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1074, file: !918, line: 499)
!1074 = !DISubprogram(name: "acosl", scope: !924, file: !924, line: 316, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1076, file: !918, line: 500)
!1076 = !DISubprogram(name: "asinl", scope: !924, file: !924, line: 320, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1078, file: !918, line: 501)
!1078 = !DISubprogram(name: "atanl", scope: !924, file: !924, line: 324, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1080, file: !918, line: 502)
!1080 = !DISubprogram(name: "atan2l", scope: !924, file: !924, line: 328, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!320, !320, !320}
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1084, file: !918, line: 503)
!1084 = !DISubprogram(name: "ceill", scope: !924, file: !924, line: 463, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1086, file: !918, line: 504)
!1086 = !DISubprogram(name: "cosl", scope: !924, file: !924, line: 332, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1088, file: !918, line: 505)
!1088 = !DISubprogram(name: "coshl", scope: !924, file: !924, line: 356, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1090, file: !918, line: 506)
!1090 = !DISubprogram(name: "expl", scope: !924, file: !924, line: 368, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1092, file: !918, line: 507)
!1092 = !DISubprogram(name: "fabsl", scope: !924, file: !924, line: 424, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1094, file: !918, line: 508)
!1094 = !DISubprogram(name: "floorl", scope: !924, file: !924, line: 467, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1096, file: !918, line: 509)
!1096 = !DISubprogram(name: "fmodl", scope: !924, file: !924, line: 507, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1098, file: !918, line: 510)
!1098 = !DISubprogram(name: "frexpl", scope: !924, file: !924, line: 408, type: !1099, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!320, !320, !958}
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1102, file: !918, line: 511)
!1102 = !DISubprogram(name: "ldexpl", scope: !924, file: !924, line: 404, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!320, !320, !7}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1106, file: !918, line: 512)
!1106 = !DISubprogram(name: "logl", scope: !924, file: !924, line: 380, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1108, file: !918, line: 513)
!1108 = !DISubprogram(name: "log10l", scope: !924, file: !924, line: 384, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1110, file: !918, line: 514)
!1110 = !DISubprogram(name: "modfl", scope: !924, file: !924, line: 400, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1112, file: !918, line: 515)
!1112 = !DISubprogram(name: "powl", scope: !924, file: !924, line: 436, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1114, file: !918, line: 516)
!1114 = !DISubprogram(name: "sinl", scope: !924, file: !924, line: 336, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1116, file: !918, line: 517)
!1116 = !DISubprogram(name: "sinhl", scope: !924, file: !924, line: 360, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1118, file: !918, line: 518)
!1118 = !DISubprogram(name: "sqrtl", scope: !924, file: !924, line: 440, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1120, file: !918, line: 519)
!1120 = !DISubprogram(name: "tanl", scope: !924, file: !924, line: 340, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1122, file: !918, line: 521)
!1122 = !DISubprogram(name: "tanhl", scope: !924, file: !924, line: 364, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1124, file: !918, line: 522)
!1124 = !DISubprogram(name: "acoshl", scope: !924, file: !924, line: 344, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1126, file: !918, line: 523)
!1126 = !DISubprogram(name: "asinhl", scope: !924, file: !924, line: 348, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1128, file: !918, line: 524)
!1128 = !DISubprogram(name: "atanhl", scope: !924, file: !924, line: 352, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1130, file: !918, line: 525)
!1130 = !DISubprogram(name: "cbrtl", scope: !924, file: !924, line: 428, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1132, file: !918, line: 527)
!1132 = !DISubprogram(name: "copysignl", scope: !924, file: !924, line: 519, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1134, file: !918, line: 529)
!1134 = !DISubprogram(name: "erfl", scope: !924, file: !924, line: 444, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1136, file: !918, line: 530)
!1136 = !DISubprogram(name: "erfcl", scope: !924, file: !924, line: 448, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1138, file: !918, line: 531)
!1138 = !DISubprogram(name: "exp2l", scope: !924, file: !924, line: 372, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1140, file: !918, line: 532)
!1140 = !DISubprogram(name: "expm1l", scope: !924, file: !924, line: 376, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1142, file: !918, line: 533)
!1142 = !DISubprogram(name: "fdiml", scope: !924, file: !924, line: 535, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1144, file: !918, line: 534)
!1144 = !DISubprogram(name: "fmal", scope: !924, file: !924, line: 547, type: !1145, flags: DIFlagPrototyped, spFlags: 0)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!320, !320, !320, !320}
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1148, file: !918, line: 535)
!1148 = !DISubprogram(name: "fmaxl", scope: !924, file: !924, line: 539, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1150, file: !918, line: 536)
!1150 = !DISubprogram(name: "fminl", scope: !924, file: !924, line: 543, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1152, file: !918, line: 537)
!1152 = !DISubprogram(name: "hypotl", scope: !924, file: !924, line: 432, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1154, file: !918, line: 538)
!1154 = !DISubprogram(name: "ilogbl", scope: !924, file: !924, line: 412, type: !1155, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!7, !320}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1158, file: !918, line: 539)
!1158 = !DISubprogram(name: "lgammal", scope: !924, file: !924, line: 455, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1160, file: !918, line: 540)
!1160 = !DISubprogram(name: "llrintl", scope: !924, file: !924, line: 494, type: !1161, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{!20, !320}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1164, file: !918, line: 541)
!1164 = !DISubprogram(name: "llroundl", scope: !924, file: !924, line: 498, type: !1161, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1166, file: !918, line: 542)
!1166 = !DISubprogram(name: "log1pl", scope: !924, file: !924, line: 392, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1168, file: !918, line: 543)
!1168 = !DISubprogram(name: "log2l", scope: !924, file: !924, line: 388, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1170, file: !918, line: 544)
!1170 = !DISubprogram(name: "logbl", scope: !924, file: !924, line: 396, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1172, file: !918, line: 545)
!1172 = !DISubprogram(name: "lrintl", scope: !924, file: !924, line: 479, type: !1173, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DISubroutineType(types: !1174)
!1174 = !{!302, !320}
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1176, file: !918, line: 546)
!1176 = !DISubprogram(name: "lroundl", scope: !924, file: !924, line: 487, type: !1173, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1178, file: !918, line: 547)
!1178 = !DISubprogram(name: "nanl", scope: !924, file: !924, line: 523, type: !1179, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DISubroutineType(types: !1180)
!1180 = !{!320, !421}
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1182, file: !918, line: 548)
!1182 = !DISubprogram(name: "nearbyintl", scope: !924, file: !924, line: 471, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1184, file: !918, line: 549)
!1184 = !DISubprogram(name: "nextafterl", scope: !924, file: !924, line: 527, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1186, file: !918, line: 550)
!1186 = !DISubprogram(name: "nexttowardl", scope: !924, file: !924, line: 531, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1188, file: !918, line: 551)
!1188 = !DISubprogram(name: "remainderl", scope: !924, file: !924, line: 511, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1190, file: !918, line: 552)
!1190 = !DISubprogram(name: "remquol", scope: !924, file: !924, line: 515, type: !1191, flags: DIFlagPrototyped, spFlags: 0)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!320, !320, !320, !958}
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1194, file: !918, line: 553)
!1194 = !DISubprogram(name: "rintl", scope: !924, file: !924, line: 475, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1196, file: !918, line: 554)
!1196 = !DISubprogram(name: "roundl", scope: !924, file: !924, line: 483, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1198, file: !918, line: 555)
!1198 = !DISubprogram(name: "scalblnl", scope: !924, file: !924, line: 420, type: !1199, flags: DIFlagPrototyped, spFlags: 0)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!320, !320, !302}
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1202, file: !918, line: 556)
!1202 = !DISubprogram(name: "scalbnl", scope: !924, file: !924, line: 416, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1204, file: !918, line: 557)
!1204 = !DISubprogram(name: "tgammal", scope: !924, file: !924, line: 459, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1206, file: !918, line: 558)
!1206 = !DISubprogram(name: "truncl", scope: !924, file: !924, line: 503, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1208, file: !1212, line: 82)
!1208 = !DISubprogram(name: "memcpy", scope: !1209, file: !1209, line: 78, type: !1210, flags: DIFlagPrototyped, spFlags: 0)
!1209 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!1210 = !DISubroutineType(types: !1211)
!1211 = !{!484, !484, !859, !537}
!1212 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1214, file: !1212, line: 83)
!1214 = !DISubprogram(name: "memmove", scope: !1209, file: !1209, line: 81, type: !1210, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1216, file: !1212, line: 84)
!1216 = !DISubprogram(name: "strcpy", scope: !1209, file: !1209, line: 92, type: !1217, flags: DIFlagPrototyped, spFlags: 0)
!1217 = !DISubroutineType(types: !1218)
!1218 = !{!464, !464, !421}
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1220, file: !1212, line: 85)
!1220 = !DISubprogram(name: "strncpy", scope: !1209, file: !1209, line: 104, type: !1221, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DISubroutineType(types: !1222)
!1222 = !{!464, !464, !421, !537}
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1224, file: !1212, line: 86)
!1224 = !DISubprogram(name: "strcat", scope: !1209, file: !1209, line: 86, type: !1217, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1226, file: !1212, line: 87)
!1226 = !DISubprogram(name: "strncat", scope: !1209, file: !1209, line: 98, type: !1221, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1228, file: !1212, line: 88)
!1228 = !DISubprogram(name: "memcmp", scope: !1209, file: !1209, line: 75, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!7, !859, !859, !537}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1232, file: !1212, line: 89)
!1232 = !DISubprogram(name: "strcmp", scope: !1209, file: !1209, line: 89, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!7, !421, !421}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1236, file: !1212, line: 90)
!1236 = !DISubprogram(name: "strncmp", scope: !1209, file: !1209, line: 101, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!7, !421, !421, !537}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1240, file: !1212, line: 91)
!1240 = !DISubprogram(name: "strcoll", scope: !1209, file: !1209, line: 90, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1242, file: !1212, line: 92)
!1242 = !DISubprogram(name: "strxfrm", scope: !1209, file: !1209, line: 112, type: !1243, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!537, !464, !421, !537}
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1246, file: !1212, line: 93)
!1246 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !1247, file: !1247, line: 101, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!1248 = !DISubroutineType(types: !1249)
!1249 = !{!484, !484, !7, !537}
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1251, file: !1212, line: 94)
!1251 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1247, file: !1247, line: 80, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!464, !464, !7}
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1255, file: !1212, line: 95)
!1255 = !DISubprogram(name: "strcspn", scope: !1209, file: !1209, line: 94, type: !1256, flags: DIFlagPrototyped, spFlags: 0)
!1256 = !DISubroutineType(types: !1257)
!1257 = !{!537, !421, !421}
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1259, file: !1212, line: 96)
!1259 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1247, file: !1247, line: 87, type: !1217, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1261, file: !1212, line: 97)
!1261 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1247, file: !1247, line: 94, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1263, file: !1212, line: 98)
!1263 = !DISubprogram(name: "strspn", scope: !1209, file: !1209, line: 109, type: !1256, flags: DIFlagPrototyped, spFlags: 0)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1265, file: !1212, line: 99)
!1265 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1247, file: !1247, line: 108, type: !1217, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1267, file: !1212, line: 100)
!1267 = !DISubprogram(name: "strtok", scope: !1209, file: !1209, line: 111, type: !1217, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1269, file: !1212, line: 101)
!1269 = !DISubprogram(name: "memset", scope: !1209, file: !1209, line: 84, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1271, file: !1212, line: 102)
!1271 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !1209, file: !1209, line: 95, type: !1272, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DISubroutineType(types: !1273)
!1273 = !{!464, !7}
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1275, file: !1212, line: 103)
!1275 = !DISubprogram(name: "strlen", scope: !1209, file: !1209, line: 96, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!537, !421}
!1278 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1279, entity: !1280, file: !1282, line: 536)
!1279 = !DINamespace(name: "chrono", scope: !237)
!1280 = !DINamespace(name: "chrono_literals", scope: !1281, exportSymbols: true)
!1281 = !DINamespace(name: "literals", scope: !237, exportSymbols: true)
!1282 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1284, file: !1287, line: 68)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1285, line: 31, baseType: !1286)
!1285 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1286 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !301, line: 116, baseType: !306)
!1287 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1289, file: !1287, line: 69)
!1289 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1290, line: 31, baseType: !1291)
!1290 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1291 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !301, line: 119, baseType: !302)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !450, file: !1287, line: 70)
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1294, file: !1287, line: 74)
!1294 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !451, file: !451, line: 112, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!1284}
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1298, file: !1287, line: 75)
!1298 = !DISubprogram(name: "difftime", scope: !451, file: !451, line: 114, type: !1299, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{!592, !1289, !1289}
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1302, file: !1287, line: 76)
!1302 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !451, file: !451, line: 118, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!1289, !1305}
!1305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !450, size: 64)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1307, file: !1287, line: 77)
!1307 = !DISubprogram(name: "time", scope: !451, file: !451, line: 121, type: !1308, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DISubroutineType(types: !1309)
!1309 = !{!1289, !1310}
!1310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1289, size: 64)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1312, file: !1287, line: 78)
!1312 = !DISubprogram(name: "asctime", scope: !451, file: !451, line: 111, type: !1313, flags: DIFlagPrototyped, spFlags: 0)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!464, !686}
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1316, file: !1287, line: 79)
!1316 = !DISubprogram(name: "ctime", scope: !451, file: !451, line: 113, type: !1317, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DISubroutineType(types: !1318)
!1318 = !{!464, !1319}
!1319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1320, size: 64)
!1320 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1289)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1322, file: !1287, line: 80)
!1322 = !DISubprogram(name: "gmtime", scope: !451, file: !451, line: 116, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!1305, !1319}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1326, file: !1287, line: 81)
!1326 = !DISubprogram(name: "localtime", scope: !451, file: !451, line: 117, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1328, file: !1287, line: 82)
!1328 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !451, file: !451, line: 119, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!537, !464, !537, !421, !686}
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !467, file: !1332, line: 120)
!1332 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !497, file: !1332, line: 121)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1335, file: !1332, line: 123)
!1335 = !DISubprogram(name: "fclose", scope: !468, file: !468, line: 233, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!7, !526}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1339, file: !1332, line: 124)
!1339 = !DISubprogram(name: "fflush", scope: !468, file: !468, line: 236, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1341, file: !1332, line: 125)
!1341 = !DISubprogram(name: "setbuf", scope: !468, file: !468, line: 272, type: !1342, flags: DIFlagPrototyped, spFlags: 0)
!1342 = !DISubroutineType(types: !1343)
!1343 = !{null, !526, !464}
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1345, file: !1332, line: 126)
!1345 = !DISubprogram(name: "setvbuf", scope: !468, file: !468, line: 273, type: !1346, flags: DIFlagPrototyped, spFlags: 0)
!1346 = !DISubroutineType(types: !1347)
!1347 = !{!7, !526, !464, !7, !537}
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1349, file: !1332, line: 127)
!1349 = !DISubprogram(name: "fprintf", scope: !468, file: !468, line: 245, type: !1350, flags: DIFlagPrototyped, spFlags: 0)
!1350 = !DISubroutineType(types: !1351)
!1351 = !{!7, !526, !421, null}
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1353, file: !1332, line: 128)
!1353 = !DISubprogram(name: "fscanf", scope: !468, file: !468, line: 251, type: !1350, flags: DIFlagPrototyped, spFlags: 0)
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1355, file: !1332, line: 129)
!1355 = !DISubprogram(name: "snprintf", scope: !468, file: !468, line: 435, type: !1356, flags: DIFlagPrototyped, spFlags: 0)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!7, !464, !537, !421, null}
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1359, file: !1332, line: 130)
!1359 = !DISubprogram(name: "sprintf", scope: !468, file: !468, line: 280, type: !1360, flags: DIFlagPrototyped, spFlags: 0)
!1360 = !DISubroutineType(types: !1361)
!1361 = !{!7, !464, !421, null}
!1362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1363, file: !1332, line: 131)
!1363 = !DISubprogram(name: "sscanf", scope: !468, file: !468, line: 282, type: !1364, flags: DIFlagPrototyped, spFlags: 0)
!1364 = !DISubroutineType(types: !1365)
!1365 = !{!7, !421, !421, null}
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1367, file: !1332, line: 132)
!1367 = !DISubprogram(name: "vfprintf", scope: !468, file: !468, line: 292, type: !1368, flags: DIFlagPrototyped, spFlags: 0)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!7, !526, !421, !1370}
!1370 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1371, line: 44, baseType: !544)
!1371 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1373, file: !1332, line: 133)
!1373 = !DISubprogram(name: "vfscanf", scope: !468, file: !468, line: 436, type: !1368, flags: DIFlagPrototyped, spFlags: 0)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1375, file: !1332, line: 134)
!1375 = !DISubprogram(name: "vsscanf", scope: !468, file: !468, line: 439, type: !1376, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!7, !421, !421, !1370}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1379, file: !1332, line: 135)
!1379 = !DISubprogram(name: "vsnprintf", scope: !468, file: !468, line: 438, type: !1380, flags: DIFlagPrototyped, spFlags: 0)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!7, !464, !537, !421, !1370}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1383, file: !1332, line: 136)
!1383 = !DISubprogram(name: "vsprintf", scope: !468, file: !468, line: 300, type: !1384, flags: DIFlagPrototyped, spFlags: 0)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!7, !464, !421, !1370}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1387, file: !1332, line: 137)
!1387 = !DISubprogram(name: "fgetc", scope: !468, file: !468, line: 237, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1389, file: !1332, line: 138)
!1389 = !DISubprogram(name: "fgets", scope: !468, file: !468, line: 239, type: !1390, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!464, !464, !7, !526}
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1393, file: !1332, line: 139)
!1393 = !DISubprogram(name: "fputc", scope: !468, file: !468, line: 246, type: !1394, flags: DIFlagPrototyped, spFlags: 0)
!1394 = !DISubroutineType(types: !1395)
!1395 = !{!7, !7, !526}
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1397, file: !1332, line: 140)
!1397 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !468, file: !468, line: 247, type: !1398, flags: DIFlagPrototyped, spFlags: 0)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!7, !421, !526}
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1401, file: !1332, line: 141)
!1401 = !DISubprogram(name: "getc", scope: !468, file: !468, line: 256, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1403, file: !1332, line: 142)
!1403 = !DISubprogram(name: "putc", scope: !468, file: !468, line: 265, type: !1394, flags: DIFlagPrototyped, spFlags: 0)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1405, file: !1332, line: 143)
!1405 = !DISubprogram(name: "ungetc", scope: !468, file: !468, line: 291, type: !1394, flags: DIFlagPrototyped, spFlags: 0)
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1407, file: !1332, line: 144)
!1407 = !DISubprogram(name: "fread", scope: !468, file: !468, line: 248, type: !1408, flags: DIFlagPrototyped, spFlags: 0)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!537, !484, !537, !537, !526}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1411, file: !1332, line: 145)
!1411 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !468, file: !468, line: 255, type: !1412, flags: DIFlagPrototyped, spFlags: 0)
!1412 = !DISubroutineType(types: !1413)
!1413 = !{!537, !859, !537, !537, !526}
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1415, file: !1332, line: 146)
!1415 = !DISubprogram(name: "fgetpos", scope: !468, file: !468, line: 238, type: !1416, flags: DIFlagPrototyped, spFlags: 0)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!7, !526, !1418}
!1418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !497, size: 64)
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1420, file: !1332, line: 147)
!1420 = !DISubprogram(name: "fseek", scope: !468, file: !468, line: 252, type: !1421, flags: DIFlagPrototyped, spFlags: 0)
!1421 = !DISubroutineType(types: !1422)
!1422 = !{!7, !526, !302, !7}
!1423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1424, file: !1332, line: 148)
!1424 = !DISubprogram(name: "fsetpos", scope: !468, file: !468, line: 253, type: !1425, flags: DIFlagPrototyped, spFlags: 0)
!1425 = !DISubroutineType(types: !1426)
!1426 = !{!7, !526, !1427}
!1427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1428, size: 64)
!1428 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !497)
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1430, file: !1332, line: 149)
!1430 = !DISubprogram(name: "ftell", scope: !468, file: !468, line: 254, type: !1431, flags: DIFlagPrototyped, spFlags: 0)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!302, !526}
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1434, file: !1332, line: 150)
!1434 = !DISubprogram(name: "rewind", scope: !468, file: !468, line: 270, type: !1435, flags: DIFlagPrototyped, spFlags: 0)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{null, !526}
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1438, file: !1332, line: 151)
!1438 = !DISubprogram(name: "clearerr", scope: !468, file: !468, line: 232, type: !1435, flags: DIFlagPrototyped, spFlags: 0)
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1440, file: !1332, line: 152)
!1440 = !DISubprogram(name: "feof", scope: !468, file: !468, line: 234, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1442, file: !1332, line: 153)
!1442 = !DISubprogram(name: "ferror", scope: !468, file: !468, line: 235, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1444, file: !1332, line: 154)
!1444 = !DISubprogram(name: "perror", scope: !468, file: !468, line: 264, type: !1445, flags: DIFlagPrototyped, spFlags: 0)
!1445 = !DISubroutineType(types: !1446)
!1446 = !{null, !421}
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1448, file: !1332, line: 156)
!1448 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !468, file: !468, line: 243, type: !1449, flags: DIFlagPrototyped, spFlags: 0)
!1449 = !DISubroutineType(types: !1450)
!1450 = !{!526, !421, !421}
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1452, file: !1332, line: 157)
!1452 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !468, file: !468, line: 249, type: !1453, flags: DIFlagPrototyped, spFlags: 0)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!526, !421, !421, !526}
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1456, file: !1332, line: 158)
!1456 = !DISubprogram(name: "remove", scope: !468, file: !468, line: 268, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1458, file: !1332, line: 159)
!1458 = !DISubprogram(name: "rename", scope: !468, file: !468, line: 269, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1460, file: !1332, line: 160)
!1460 = !DISubprogram(name: "tmpfile", scope: !468, file: !468, line: 283, type: !1461, flags: DIFlagPrototyped, spFlags: 0)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{!526}
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1464, file: !1332, line: 161)
!1464 = !DISubprogram(name: "tmpnam", scope: !468, file: !468, line: 289, type: !1465, flags: DIFlagPrototyped, spFlags: 0)
!1465 = !DISubroutineType(types: !1466)
!1466 = !{!464, !464}
!1467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1468, file: !1332, line: 163)
!1468 = !DISubprogram(name: "getchar", scope: !468, file: !468, line: 257, type: !810, flags: DIFlagPrototyped, spFlags: 0)
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1470, file: !1332, line: 167)
!1470 = !DISubprogram(name: "scanf", scope: !468, file: !468, line: 271, type: !1471, flags: DIFlagPrototyped, spFlags: 0)
!1471 = !DISubroutineType(types: !1472)
!1472 = !{!7, !421, null}
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1474, file: !1332, line: 168)
!1474 = !DISubprogram(name: "vscanf", scope: !468, file: !468, line: 437, type: !1475, flags: DIFlagPrototyped, spFlags: 0)
!1475 = !DISubroutineType(types: !1476)
!1476 = !{!7, !421, !1370}
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1478, file: !1332, line: 170)
!1478 = !DISubprogram(name: "printf", scope: !1479, file: !1479, line: 34, type: !1471, flags: DIFlagPrototyped, spFlags: 0)
!1479 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1481, file: !1332, line: 171)
!1481 = !DISubprogram(name: "putchar", scope: !468, file: !468, line: 266, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1483, file: !1332, line: 172)
!1483 = !DISubprogram(name: "puts", scope: !468, file: !468, line: 267, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1485, file: !1332, line: 173)
!1485 = !DISubprogram(name: "vprintf", scope: !468, file: !468, line: 293, type: !1475, flags: DIFlagPrototyped, spFlags: 0)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1487, file: !1514, line: 52)
!1487 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1488, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1489, identifier: "_ZTS5lconv")
!1488 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1489 = !{!1490, !1491, !1492, !1493, !1494, !1495, !1496, !1497, !1498, !1499, !1500, !1501, !1502, !1503, !1504, !1505, !1506, !1507, !1508, !1509, !1510, !1511, !1512, !1513}
!1490 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1487, file: !1488, line: 47, baseType: !464, size: 64)
!1491 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1487, file: !1488, line: 48, baseType: !464, size: 64, offset: 64)
!1492 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1487, file: !1488, line: 49, baseType: !464, size: 64, offset: 128)
!1493 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1487, file: !1488, line: 50, baseType: !464, size: 64, offset: 192)
!1494 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1487, file: !1488, line: 51, baseType: !464, size: 64, offset: 256)
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1487, file: !1488, line: 52, baseType: !464, size: 64, offset: 320)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1487, file: !1488, line: 53, baseType: !464, size: 64, offset: 384)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1487, file: !1488, line: 54, baseType: !464, size: 64, offset: 448)
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1487, file: !1488, line: 55, baseType: !464, size: 64, offset: 512)
!1499 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1487, file: !1488, line: 56, baseType: !464, size: 64, offset: 576)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1487, file: !1488, line: 57, baseType: !44, size: 8, offset: 640)
!1501 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1487, file: !1488, line: 58, baseType: !44, size: 8, offset: 648)
!1502 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1487, file: !1488, line: 59, baseType: !44, size: 8, offset: 656)
!1503 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1487, file: !1488, line: 60, baseType: !44, size: 8, offset: 664)
!1504 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1487, file: !1488, line: 61, baseType: !44, size: 8, offset: 672)
!1505 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1487, file: !1488, line: 62, baseType: !44, size: 8, offset: 680)
!1506 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1487, file: !1488, line: 63, baseType: !44, size: 8, offset: 688)
!1507 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1487, file: !1488, line: 64, baseType: !44, size: 8, offset: 696)
!1508 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1487, file: !1488, line: 65, baseType: !44, size: 8, offset: 704)
!1509 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1487, file: !1488, line: 66, baseType: !44, size: 8, offset: 712)
!1510 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1487, file: !1488, line: 67, baseType: !44, size: 8, offset: 720)
!1511 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1487, file: !1488, line: 68, baseType: !44, size: 8, offset: 728)
!1512 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1487, file: !1488, line: 69, baseType: !44, size: 8, offset: 736)
!1513 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1487, file: !1488, line: 70, baseType: !44, size: 8, offset: 744)
!1514 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1516, file: !1514, line: 53)
!1516 = !DISubprogram(name: "setlocale", scope: !1517, file: !1517, line: 56, type: !1518, flags: DIFlagPrototyped, spFlags: 0)
!1517 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1518 = !DISubroutineType(types: !1519)
!1519 = !{!464, !7, !421}
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1521, file: !1514, line: 54)
!1521 = !DISubprogram(name: "localeconv", scope: !1488, file: !1488, line: 99, type: !1522, flags: DIFlagPrototyped, spFlags: 0)
!1522 = !DISubroutineType(types: !1523)
!1523 = !{!1524}
!1524 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1487, size: 64)
!1525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !237, entity: !1526, file: !1528, line: 53)
!1526 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1527, line: 12, baseType: !545)
!1527 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stdarg_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "7bd78a282b99fcfe41a9e3c566d14f7d")
!1528 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1529 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1530, size: 48768, elements: !1545)
!1530 = !DIDerivedType(tag: DW_TAG_typedef, name: "wall", file: !29, line: 110, baseType: !1531)
!1531 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "wall", file: !29, line: 96, size: 192, flags: DIFlagTypePassByValue, elements: !1532, identifier: "_ZTS4wall")
!1532 = !{!1533, !1534, !1535, !1536, !1537, !1538, !1539, !1540, !1541, !1542, !1543, !1544}
!1533 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1531, file: !29, line: 98, baseType: !7, size: 32)
!1534 = !DIDerivedType(tag: DW_TAG_member, name: "sidenum", scope: !1531, file: !29, line: 98, baseType: !7, size: 32, offset: 32)
!1535 = !DIDerivedType(tag: DW_TAG_member, name: "hps", scope: !1531, file: !29, line: 99, baseType: !14, size: 32, offset: 64)
!1536 = !DIDerivedType(tag: DW_TAG_member, name: "linked_wall", scope: !1531, file: !29, line: 100, baseType: !7, size: 32, offset: 96)
!1537 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1531, file: !29, line: 101, baseType: !249, size: 8, offset: 128)
!1538 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1531, file: !29, line: 102, baseType: !249, size: 8, offset: 136)
!1539 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !1531, file: !29, line: 103, baseType: !249, size: 8, offset: 144)
!1540 = !DIDerivedType(tag: DW_TAG_member, name: "trigger", scope: !1531, file: !29, line: 104, baseType: !239, size: 8, offset: 152)
!1541 = !DIDerivedType(tag: DW_TAG_member, name: "clip_num", scope: !1531, file: !29, line: 105, baseType: !239, size: 8, offset: 160)
!1542 = !DIDerivedType(tag: DW_TAG_member, name: "keys", scope: !1531, file: !29, line: 106, baseType: !249, size: 8, offset: 168)
!1543 = !DIDerivedType(tag: DW_TAG_member, name: "controlling_trigger", scope: !1531, file: !29, line: 107, baseType: !239, size: 8, offset: 176)
!1544 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_value", scope: !1531, file: !29, line: 109, baseType: !239, size: 8, offset: 184)
!1545 = !{!1546}
!1546 = !DISubrange(count: 254)
!1547 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1548 = !{i32 7, !"Dwarf Version", i32 5}
!1549 = !{i32 2, !"Debug Info Version", i32 3}
!1550 = !{i32 1, !"wchar_size", i32 4}
!1551 = !{i32 8, !"PIC Level", i32 2}
!1552 = !{i32 7, !"uwtable", i32 1}
!1553 = !{i32 7, !"frame-pointer", i32 1}
!1554 = !{!"Homebrew clang version 20.1.8"}
!1555 = distinct !DISubprogram(name: "check_transparency", linkageName: "_Z18check_transparencyP7segmenti", scope: !24, file: !24, line: 98, type: !1556, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1556 = !DISubroutineType(types: !1557)
!1557 = !{!7, !1558, !7}
!1558 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1559, size: 64)
!1559 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !1560, line: 123, baseType: !1561)
!1560 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!1561 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !1560, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !1562, identifier: "_ZTS7segment")
!1562 = !{!1563, !1590, !1592, !1596}
!1563 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !1561, file: !1560, line: 105, baseType: !1564, size: 3840)
!1564 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1565, size: 3840, elements: !191)
!1565 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !1560, line: 91, baseType: !1566)
!1566 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !1560, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !1567, identifier: "_ZTS4side")
!1567 = !{!1568, !1569, !1570, !1571, !1572, !1573, !1581}
!1568 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1566, file: !1560, line: 84, baseType: !239, size: 8)
!1569 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !1566, file: !1560, line: 85, baseType: !249, size: 8, offset: 8)
!1570 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !1566, file: !1560, line: 86, baseType: !34, size: 16, offset: 16)
!1571 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !1566, file: !1560, line: 87, baseType: !34, size: 16, offset: 32)
!1572 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !1566, file: !1560, line: 88, baseType: !34, size: 16, offset: 48)
!1573 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !1566, file: !1560, line: 89, baseType: !1574, size: 384, offset: 64)
!1574 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1575, size: 384, elements: !79)
!1575 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !1560, line: 67, baseType: !1576)
!1576 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !1560, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !1577, identifier: "_ZTS3uvl")
!1577 = !{!1578, !1579, !1580}
!1578 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !1576, file: !1560, line: 66, baseType: !14, size: 32)
!1579 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !1576, file: !1560, line: 66, baseType: !14, size: 32, offset: 32)
!1580 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !1576, file: !1560, line: 66, baseType: !14, size: 32, offset: 64)
!1581 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !1566, file: !1560, line: 90, baseType: !1582, size: 192, offset: 448)
!1582 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1583, size: 192, elements: !61)
!1583 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !1584, line: 22, baseType: !1585)
!1584 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!1585 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !1584, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !1586, identifier: "_ZTS10vms_vector")
!1586 = !{!1587, !1588, !1589}
!1587 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1585, file: !1584, line: 21, baseType: !14, size: 32)
!1588 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1585, file: !1584, line: 21, baseType: !14, size: 32, offset: 32)
!1589 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1585, file: !1584, line: 21, baseType: !14, size: 32, offset: 64)
!1590 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !1561, file: !1560, line: 106, baseType: !1591, size: 96, offset: 3840)
!1591 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 96, elements: !191)
!1592 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !1561, file: !1560, line: 107, baseType: !1593, size: 128, offset: 3936)
!1593 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 128, elements: !1594)
!1594 = !{!1595}
!1595 = !DISubrange(count: 8)
!1596 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !1561, file: !1560, line: 112, baseType: !7, size: 32, offset: 4064)
!1597 = !{}
!1598 = !DILocalVariable(name: "seg", arg: 1, scope: !1555, file: !24, line: 98, type: !1558)
!1599 = !DILocation(line: 98, column: 33, scope: !1555)
!1600 = !DILocalVariable(name: "side", arg: 2, scope: !1555, file: !24, line: 98, type: !7)
!1601 = !DILocation(line: 98, column: 42, scope: !1555)
!1602 = !DILocation(line: 100, column: 7, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1555, file: !24, line: 100, column: 6)
!1604 = !DILocation(line: 100, column: 12, scope: !1603)
!1605 = !DILocation(line: 100, column: 18, scope: !1603)
!1606 = !DILocation(line: 100, column: 24, scope: !1603)
!1607 = !DILocation(line: 100, column: 34, scope: !1603)
!1608 = !DILocation(line: 100, column: 44, scope: !1603)
!1609 = !DILocation(line: 101, column: 28, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1611, file: !24, line: 101, column: 7)
!1611 = distinct !DILexicalBlock(scope: !1603, file: !24, line: 100, column: 50)
!1612 = !DILocation(line: 101, column: 33, scope: !1610)
!1613 = !DILocation(line: 101, column: 39, scope: !1610)
!1614 = !DILocation(line: 101, column: 45, scope: !1610)
!1615 = !DILocation(line: 101, column: 19, scope: !1610)
!1616 = !DILocation(line: 101, column: 55, scope: !1610)
!1617 = !DILocation(line: 101, column: 7, scope: !1610)
!1618 = !DILocation(line: 101, column: 62, scope: !1610)
!1619 = !DILocation(line: 101, column: 71, scope: !1610)
!1620 = !DILocation(line: 102, column: 4, scope: !1610)
!1621 = !DILocation(line: 104, column: 4, scope: !1610)
!1622 = !DILocation(line: 107, column: 27, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1555, file: !24, line: 107, column: 6)
!1624 = !DILocation(line: 107, column: 32, scope: !1623)
!1625 = !DILocation(line: 107, column: 38, scope: !1623)
!1626 = !DILocation(line: 107, column: 44, scope: !1623)
!1627 = !DILocation(line: 107, column: 54, scope: !1623)
!1628 = !DILocation(line: 107, column: 18, scope: !1623)
!1629 = !DILocation(line: 107, column: 64, scope: !1623)
!1630 = !DILocation(line: 107, column: 6, scope: !1623)
!1631 = !DILocation(line: 107, column: 71, scope: !1623)
!1632 = !DILocation(line: 107, column: 80, scope: !1623)
!1633 = !DILocation(line: 108, column: 3, scope: !1623)
!1634 = !DILocation(line: 110, column: 3, scope: !1623)
!1635 = !DILocation(line: 111, column: 1, scope: !1555)
!1636 = distinct !DISubprogram(name: "wall_is_doorway", linkageName: "_Z15wall_is_doorwayP7segmenti", scope: !24, file: !24, line: 135, type: !1556, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1637 = !DILocalVariable(name: "seg", arg: 1, scope: !1636, file: !24, line: 135, type: !1558)
!1638 = !DILocation(line: 135, column: 31, scope: !1636)
!1639 = !DILocalVariable(name: "side", arg: 2, scope: !1636, file: !24, line: 135, type: !7)
!1640 = !DILocation(line: 135, column: 40, scope: !1636)
!1641 = !DILocalVariable(name: "flags", scope: !1636, file: !24, line: 137, type: !7)
!1642 = !DILocation(line: 137, column: 6, scope: !1636)
!1643 = !DILocalVariable(name: "type", scope: !1636, file: !24, line: 137, type: !7)
!1644 = !DILocation(line: 137, column: 13, scope: !1636)
!1645 = !DILocalVariable(name: "state", scope: !1636, file: !24, line: 138, type: !7)
!1646 = !DILocation(line: 138, column: 6, scope: !1636)
!1647 = !DILocation(line: 150, column: 2, scope: !1636)
!1648 = !DILocation(line: 0, scope: !1636)
!1649 = !DILocation(line: 151, column: 2, scope: !1636)
!1650 = !DILocation(line: 153, column: 15, scope: !1636)
!1651 = !DILocation(line: 153, column: 20, scope: !1636)
!1652 = !DILocation(line: 153, column: 26, scope: !1636)
!1653 = !DILocation(line: 153, column: 32, scope: !1636)
!1654 = !DILocation(line: 153, column: 9, scope: !1636)
!1655 = !DILocation(line: 153, column: 42, scope: !1636)
!1656 = !DILocation(line: 153, column: 7, scope: !1636)
!1657 = !DILocation(line: 154, column: 16, scope: !1636)
!1658 = !DILocation(line: 154, column: 21, scope: !1636)
!1659 = !DILocation(line: 154, column: 27, scope: !1636)
!1660 = !DILocation(line: 154, column: 33, scope: !1636)
!1661 = !DILocation(line: 154, column: 10, scope: !1636)
!1662 = !DILocation(line: 154, column: 43, scope: !1636)
!1663 = !DILocation(line: 154, column: 8, scope: !1636)
!1664 = !DILocation(line: 156, column: 6, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 156, column: 6)
!1666 = !DILocation(line: 156, column: 11, scope: !1665)
!1667 = !DILocation(line: 157, column: 3, scope: !1665)
!1668 = !DILocation(line: 159, column: 6, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 159, column: 6)
!1670 = !DILocation(line: 159, column: 11, scope: !1669)
!1671 = !DILocation(line: 160, column: 13, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1673, file: !24, line: 160, column: 7)
!1673 = distinct !DILexicalBlock(scope: !1669, file: !24, line: 159, column: 29)
!1674 = !DILocation(line: 160, column: 18, scope: !1672)
!1675 = !DILocation(line: 160, column: 24, scope: !1672)
!1676 = !DILocation(line: 160, column: 30, scope: !1672)
!1677 = !DILocation(line: 160, column: 7, scope: !1672)
!1678 = !DILocation(line: 160, column: 40, scope: !1672)
!1679 = !DILocation(line: 160, column: 46, scope: !1672)
!1680 = !DILocation(line: 161, column: 4, scope: !1672)
!1681 = !DILocation(line: 163, column: 27, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1683, file: !24, line: 163, column: 8)
!1683 = distinct !DILexicalBlock(scope: !1672, file: !24, line: 162, column: 8)
!1684 = !DILocation(line: 163, column: 32, scope: !1682)
!1685 = !DILocation(line: 163, column: 8, scope: !1682)
!1686 = !DILocation(line: 164, column: 5, scope: !1682)
!1687 = !DILocation(line: 166, column: 5, scope: !1682)
!1688 = !DILocation(line: 170, column: 6, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 170, column: 6)
!1690 = !DILocation(line: 170, column: 11, scope: !1689)
!1691 = !DILocation(line: 171, column: 7, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1693, file: !24, line: 171, column: 7)
!1693 = distinct !DILexicalBlock(scope: !1689, file: !24, line: 170, column: 30)
!1694 = !DILocation(line: 171, column: 13, scope: !1692)
!1695 = !DILocation(line: 172, column: 4, scope: !1692)
!1696 = !DILocation(line: 174, column: 26, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1693, file: !24, line: 174, column: 7)
!1698 = !DILocation(line: 174, column: 31, scope: !1697)
!1699 = !DILocation(line: 174, column: 7, scope: !1697)
!1700 = !DILocation(line: 175, column: 4, scope: !1697)
!1701 = !DILocation(line: 177, column: 4, scope: !1697)
!1702 = !DILocation(line: 180, column: 6, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 180, column: 6)
!1704 = !DILocation(line: 180, column: 12, scope: !1703)
!1705 = !DILocation(line: 181, column: 3, scope: !1703)
!1706 = !DILocation(line: 183, column: 6, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 183, column: 6)
!1708 = !DILocation(line: 183, column: 11, scope: !1707)
!1709 = !DILocation(line: 184, column: 3, scope: !1707)
!1710 = !DILocation(line: 186, column: 16, scope: !1636)
!1711 = !DILocation(line: 186, column: 21, scope: !1636)
!1712 = !DILocation(line: 186, column: 27, scope: !1636)
!1713 = !DILocation(line: 186, column: 33, scope: !1636)
!1714 = !DILocation(line: 186, column: 10, scope: !1636)
!1715 = !DILocation(line: 186, column: 43, scope: !1636)
!1716 = !DILocation(line: 186, column: 8, scope: !1636)
!1717 = !DILocation(line: 187, column: 7, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 187, column: 6)
!1719 = !DILocation(line: 187, column: 12, scope: !1718)
!1720 = !DILocation(line: 187, column: 26, scope: !1718)
!1721 = !DILocation(line: 187, column: 30, scope: !1718)
!1722 = !DILocation(line: 187, column: 36, scope: !1718)
!1723 = !DILocation(line: 188, column: 3, scope: !1718)
!1724 = !DILocation(line: 191, column: 25, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1636, file: !24, line: 191, column: 6)
!1726 = !DILocation(line: 191, column: 30, scope: !1725)
!1727 = !DILocation(line: 191, column: 6, scope: !1725)
!1728 = !DILocation(line: 192, column: 3, scope: !1725)
!1729 = !DILocation(line: 194, column: 3, scope: !1725)
!1730 = !DILocation(line: 195, column: 1, scope: !1636)
!1731 = distinct !DISubprogram(name: "wall_set_tmap_num", linkageName: "_Z17wall_set_tmap_numP7segmentiS0_iii", scope: !24, file: !24, line: 244, type: !1732, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1732 = !DISubroutineType(types: !1733)
!1733 = !{null, !1558, !7, !1558, !7, !7, !7}
!1734 = !DILocalVariable(name: "seg", arg: 1, scope: !1731, file: !24, line: 244, type: !1558)
!1735 = !DILocation(line: 244, column: 33, scope: !1731)
!1736 = !DILocalVariable(name: "side", arg: 2, scope: !1731, file: !24, line: 244, type: !7)
!1737 = !DILocation(line: 244, column: 42, scope: !1731)
!1738 = !DILocalVariable(name: "csegp", arg: 3, scope: !1731, file: !24, line: 244, type: !1558)
!1739 = !DILocation(line: 244, column: 57, scope: !1731)
!1740 = !DILocalVariable(name: "cside", arg: 4, scope: !1731, file: !24, line: 244, type: !7)
!1741 = !DILocation(line: 244, column: 68, scope: !1731)
!1742 = !DILocalVariable(name: "anim_num", arg: 5, scope: !1731, file: !24, line: 244, type: !7)
!1743 = !DILocation(line: 244, column: 79, scope: !1731)
!1744 = !DILocalVariable(name: "frame_num", arg: 6, scope: !1731, file: !24, line: 244, type: !7)
!1745 = !DILocation(line: 244, column: 93, scope: !1731)
!1746 = !DILocalVariable(name: "anim", scope: !1731, file: !24, line: 246, type: !1747)
!1747 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!1748 = !DILocation(line: 246, column: 9, scope: !1731)
!1749 = !DILocation(line: 246, column: 27, scope: !1731)
!1750 = !DILocation(line: 246, column: 17, scope: !1731)
!1751 = !DILocalVariable(name: "tmap", scope: !1731, file: !24, line: 247, type: !7)
!1752 = !DILocation(line: 247, column: 6, scope: !1731)
!1753 = !DILocation(line: 247, column: 13, scope: !1731)
!1754 = !DILocation(line: 247, column: 19, scope: !1731)
!1755 = !DILocation(line: 247, column: 26, scope: !1731)
!1756 = !DILocation(line: 249, column: 6, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1731, file: !24, line: 249, column: 6)
!1758 = !DILocation(line: 249, column: 20, scope: !1757)
!1759 = !DILocation(line: 249, column: 42, scope: !1757)
!1760 = !DILocation(line: 251, column: 6, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1731, file: !24, line: 251, column: 6)
!1762 = !DILocation(line: 251, column: 12, scope: !1761)
!1763 = !DILocation(line: 251, column: 18, scope: !1761)
!1764 = !DILocation(line: 252, column: 62, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1761, file: !24, line: 251, column: 31)
!1766 = !DILocation(line: 252, column: 31, scope: !1765)
!1767 = !DILocation(line: 252, column: 38, scope: !1765)
!1768 = !DILocation(line: 252, column: 44, scope: !1765)
!1769 = !DILocation(line: 252, column: 51, scope: !1765)
!1770 = !DILocation(line: 252, column: 60, scope: !1765)
!1771 = !DILocation(line: 252, column: 3, scope: !1765)
!1772 = !DILocation(line: 252, column: 8, scope: !1765)
!1773 = !DILocation(line: 252, column: 14, scope: !1765)
!1774 = !DILocation(line: 252, column: 20, scope: !1765)
!1775 = !DILocation(line: 252, column: 29, scope: !1765)
!1776 = !DILocation(line: 253, column: 7, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1765, file: !24, line: 253, column: 7)
!1778 = !DILocation(line: 253, column: 21, scope: !1777)
!1779 = !DILocation(line: 254, column: 38, scope: !1777)
!1780 = !DILocation(line: 254, column: 42, scope: !1777)
!1781 = !DILocation(line: 254, column: 54, scope: !1777)
!1782 = !DILocation(line: 254, column: 60, scope: !1777)
!1783 = !DILocation(line: 254, column: 66, scope: !1777)
!1784 = !DILocation(line: 254, column: 78, scope: !1777)
!1785 = !DILocation(line: 254, column: 85, scope: !1777)
!1786 = !DILocation(line: 254, column: 4, scope: !1777)
!1787 = !DILocation(line: 255, column: 2, scope: !1765)
!1788 = !DILocation(line: 257, column: 3, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1761, file: !24, line: 256, column: 7)
!1790 = !DILocation(line: 0, scope: !1789)
!1791 = !DILocation(line: 258, column: 64, scope: !1789)
!1792 = !DILocation(line: 258, column: 32, scope: !1789)
!1793 = !DILocation(line: 258, column: 39, scope: !1789)
!1794 = !DILocation(line: 258, column: 45, scope: !1789)
!1795 = !DILocation(line: 258, column: 52, scope: !1789)
!1796 = !DILocation(line: 258, column: 62, scope: !1789)
!1797 = !DILocation(line: 258, column: 3, scope: !1789)
!1798 = !DILocation(line: 258, column: 8, scope: !1789)
!1799 = !DILocation(line: 258, column: 14, scope: !1789)
!1800 = !DILocation(line: 258, column: 20, scope: !1789)
!1801 = !DILocation(line: 258, column: 30, scope: !1789)
!1802 = !DILocation(line: 259, column: 7, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1789, file: !24, line: 259, column: 7)
!1804 = !DILocation(line: 259, column: 21, scope: !1803)
!1805 = !DILocation(line: 260, column: 38, scope: !1803)
!1806 = !DILocation(line: 260, column: 42, scope: !1803)
!1807 = !DILocation(line: 260, column: 54, scope: !1803)
!1808 = !DILocation(line: 260, column: 60, scope: !1803)
!1809 = !DILocation(line: 260, column: 66, scope: !1803)
!1810 = !DILocation(line: 260, column: 78, scope: !1803)
!1811 = !DILocation(line: 260, column: 85, scope: !1803)
!1812 = !DILocation(line: 260, column: 4, scope: !1803)
!1813 = !DILocation(line: 262, column: 1, scope: !1731)
!1814 = distinct !DISubprogram(name: "blast_blastable_wall", linkageName: "_Z20blast_blastable_wallP7segmenti", scope: !24, file: !24, line: 267, type: !1815, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1815 = !DISubroutineType(types: !1816)
!1816 = !{null, !1558, !7}
!1817 = !DILocalVariable(name: "seg", arg: 1, scope: !1814, file: !24, line: 267, type: !1558)
!1818 = !DILocation(line: 267, column: 36, scope: !1814)
!1819 = !DILocalVariable(name: "side", arg: 2, scope: !1814, file: !24, line: 267, type: !7)
!1820 = !DILocation(line: 267, column: 45, scope: !1814)
!1821 = !DILocalVariable(name: "Connectside", scope: !1814, file: !24, line: 269, type: !7)
!1822 = !DILocation(line: 269, column: 6, scope: !1814)
!1823 = !DILocalVariable(name: "csegp", scope: !1814, file: !24, line: 270, type: !1558)
!1824 = !DILocation(line: 270, column: 11, scope: !1814)
!1825 = !DILocalVariable(name: "a", scope: !1814, file: !24, line: 271, type: !7)
!1826 = !DILocation(line: 271, column: 6, scope: !1814)
!1827 = !DILocalVariable(name: "n", scope: !1814, file: !24, line: 271, type: !7)
!1828 = !DILocation(line: 271, column: 9, scope: !1814)
!1829 = !DILocation(line: 273, column: 2, scope: !1814)
!1830 = !DILocation(line: 275, column: 8, scope: !1814)
!1831 = !DILocation(line: 275, column: 13, scope: !1814)
!1832 = !DILocation(line: 275, column: 19, scope: !1814)
!1833 = !DILocation(line: 275, column: 25, scope: !1814)
!1834 = !DILocation(line: 275, column: 2, scope: !1814)
!1835 = !DILocation(line: 275, column: 35, scope: !1814)
!1836 = !DILocation(line: 275, column: 39, scope: !1814)
!1837 = !DILocation(line: 277, column: 20, scope: !1814)
!1838 = !DILocation(line: 277, column: 25, scope: !1814)
!1839 = !DILocation(line: 277, column: 34, scope: !1814)
!1840 = !DILocation(line: 277, column: 11, scope: !1814)
!1841 = !DILocation(line: 277, column: 8, scope: !1814)
!1842 = !DILocation(line: 278, column: 34, scope: !1814)
!1843 = !DILocation(line: 278, column: 39, scope: !1814)
!1844 = !DILocation(line: 278, column: 16, scope: !1814)
!1845 = !DILocation(line: 278, column: 14, scope: !1814)
!1846 = !DILocation(line: 279, column: 2, scope: !1814)
!1847 = !DILocation(line: 281, column: 21, scope: !1814)
!1848 = !DILocation(line: 281, column: 26, scope: !1814)
!1849 = !DILocation(line: 281, column: 32, scope: !1814)
!1850 = !DILocation(line: 281, column: 38, scope: !1814)
!1851 = !DILocation(line: 281, column: 2, scope: !1814)
!1852 = !DILocation(line: 282, column: 21, scope: !1814)
!1853 = !DILocation(line: 282, column: 28, scope: !1814)
!1854 = !DILocation(line: 282, column: 34, scope: !1814)
!1855 = !DILocation(line: 282, column: 47, scope: !1814)
!1856 = !DILocation(line: 282, column: 2, scope: !1814)
!1857 = !DILocation(line: 285, column: 22, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1814, file: !24, line: 285, column: 6)
!1859 = !DILocation(line: 285, column: 27, scope: !1858)
!1860 = !DILocation(line: 285, column: 33, scope: !1858)
!1861 = !DILocation(line: 285, column: 39, scope: !1858)
!1862 = !DILocation(line: 285, column: 16, scope: !1858)
!1863 = !DILocation(line: 285, column: 49, scope: !1858)
!1864 = !DILocation(line: 285, column: 6, scope: !1858)
!1865 = !DILocation(line: 285, column: 59, scope: !1858)
!1866 = !DILocation(line: 285, column: 65, scope: !1858)
!1867 = !DILocation(line: 286, column: 16, scope: !1858)
!1868 = !DILocation(line: 286, column: 20, scope: !1858)
!1869 = !DILocation(line: 286, column: 32, scope: !1858)
!1870 = !DILocation(line: 286, column: 3, scope: !1858)
!1871 = !DILocation(line: 289, column: 13, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1858, file: !24, line: 287, column: 7)
!1873 = !DILocation(line: 289, column: 18, scope: !1872)
!1874 = !DILocation(line: 289, column: 24, scope: !1872)
!1875 = !DILocation(line: 289, column: 30, scope: !1872)
!1876 = !DILocation(line: 289, column: 7, scope: !1872)
!1877 = !DILocation(line: 289, column: 40, scope: !1872)
!1878 = !DILocation(line: 289, column: 5, scope: !1872)
!1879 = !DILocation(line: 290, column: 17, scope: !1872)
!1880 = !DILocation(line: 290, column: 7, scope: !1872)
!1881 = !DILocation(line: 290, column: 20, scope: !1872)
!1882 = !DILocation(line: 290, column: 5, scope: !1872)
!1883 = !DILocation(line: 291, column: 21, scope: !1872)
!1884 = !DILocation(line: 291, column: 26, scope: !1872)
!1885 = !DILocation(line: 291, column: 32, scope: !1872)
!1886 = !DILocation(line: 291, column: 39, scope: !1872)
!1887 = !DILocation(line: 291, column: 52, scope: !1872)
!1888 = !DILocation(line: 291, column: 55, scope: !1872)
!1889 = !DILocation(line: 291, column: 57, scope: !1872)
!1890 = !DILocation(line: 291, column: 3, scope: !1872)
!1891 = !DILocation(line: 292, column: 9, scope: !1872)
!1892 = !DILocation(line: 292, column: 14, scope: !1872)
!1893 = !DILocation(line: 292, column: 20, scope: !1872)
!1894 = !DILocation(line: 292, column: 26, scope: !1872)
!1895 = !DILocation(line: 292, column: 3, scope: !1872)
!1896 = !DILocation(line: 292, column: 36, scope: !1872)
!1897 = !DILocation(line: 292, column: 42, scope: !1872)
!1898 = !DILocation(line: 293, column: 9, scope: !1872)
!1899 = !DILocation(line: 293, column: 16, scope: !1872)
!1900 = !DILocation(line: 293, column: 22, scope: !1872)
!1901 = !DILocation(line: 293, column: 35, scope: !1872)
!1902 = !DILocation(line: 293, column: 3, scope: !1872)
!1903 = !DILocation(line: 293, column: 45, scope: !1872)
!1904 = !DILocation(line: 293, column: 51, scope: !1872)
!1905 = !DILocation(line: 296, column: 1, scope: !1814)
!1906 = distinct !DISubprogram(name: "kill_stuck_objects", linkageName: "_Z18kill_stuck_objectsi", scope: !24, file: !24, line: 1450, type: !845, scopeLine: 1451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1907 = !DILocalVariable(name: "wallnum", arg: 1, scope: !1906, file: !24, line: 1450, type: !7)
!1908 = !DILocation(line: 1450, column: 29, scope: !1906)
!1909 = !DILocalVariable(name: "i", scope: !1906, file: !24, line: 1492, type: !7)
!1910 = !DILocation(line: 1492, column: 6, scope: !1906)
!1911 = !DILocation(line: 1494, column: 6, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1906, file: !24, line: 1494, column: 6)
!1913 = !DILocation(line: 1494, column: 24, scope: !1912)
!1914 = !DILocation(line: 1495, column: 3, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1912, file: !24, line: 1494, column: 30)
!1916 = !DILocation(line: 1498, column: 20, scope: !1906)
!1917 = !DILocation(line: 1500, column: 9, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1906, file: !24, line: 1500, column: 2)
!1919 = !DILocation(line: 1500, column: 7, scope: !1918)
!1920 = !DILocation(line: 1500, column: 14, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1918, file: !24, line: 1500, column: 2)
!1922 = !DILocation(line: 1500, column: 16, scope: !1921)
!1923 = !DILocation(line: 1500, column: 2, scope: !1918)
!1924 = !DILocation(line: 1501, column: 21, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1921, file: !24, line: 1501, column: 7)
!1926 = !DILocation(line: 1501, column: 7, scope: !1925)
!1927 = !DILocation(line: 1501, column: 24, scope: !1925)
!1928 = !DILocation(line: 1501, column: 35, scope: !1925)
!1929 = !DILocation(line: 1501, column: 32, scope: !1925)
!1930 = !DILocation(line: 1502, column: 30, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1932, file: !24, line: 1502, column: 8)
!1932 = distinct !DILexicalBlock(scope: !1925, file: !24, line: 1501, column: 44)
!1933 = !DILocation(line: 1502, column: 16, scope: !1931)
!1934 = !DILocation(line: 1502, column: 33, scope: !1931)
!1935 = !DILocation(line: 1502, column: 8, scope: !1931)
!1936 = !DILocation(line: 1502, column: 41, scope: !1931)
!1937 = !DILocation(line: 1502, column: 46, scope: !1931)
!1938 = !DILocation(line: 1503, column: 27, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1931, file: !24, line: 1502, column: 61)
!1940 = !DILocation(line: 1503, column: 13, scope: !1939)
!1941 = !DILocation(line: 1503, column: 30, scope: !1939)
!1942 = !DILocation(line: 1503, column: 5, scope: !1939)
!1943 = !DILocation(line: 1503, column: 38, scope: !1939)
!1944 = !DILocation(line: 1503, column: 47, scope: !1939)
!1945 = !DILocation(line: 1504, column: 4, scope: !1939)
!1946 = !DILocation(line: 1506, column: 5, scope: !1931)
!1947 = !DILocation(line: 1508, column: 18, scope: !1932)
!1948 = !DILocation(line: 1508, column: 4, scope: !1932)
!1949 = !DILocation(line: 1508, column: 21, scope: !1932)
!1950 = !DILocation(line: 1508, column: 29, scope: !1932)
!1951 = !DILocation(line: 1509, column: 3, scope: !1932)
!1952 = !DILocation(line: 1510, column: 26, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1925, file: !24, line: 1510, column: 12)
!1954 = !DILocation(line: 1510, column: 12, scope: !1953)
!1955 = !DILocation(line: 1510, column: 29, scope: !1953)
!1956 = !DILocation(line: 1510, column: 37, scope: !1953)
!1957 = !DILocation(line: 1511, column: 21, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1953, file: !24, line: 1510, column: 44)
!1959 = !DILocation(line: 1512, column: 3, scope: !1958)
!1960 = !DILocation(line: 1500, column: 38, scope: !1921)
!1961 = !DILocation(line: 1500, column: 2, scope: !1921)
!1962 = distinct !{!1962, !1923, !1963, !1964}
!1963 = !DILocation(line: 1512, column: 3, scope: !1918)
!1964 = !{!"llvm.loop.mustprogress"}
!1965 = !DILocation(line: 1514, column: 2, scope: !1906)
!1966 = !DILocation(line: 1516, column: 1, scope: !1906)
!1967 = distinct !DISubprogram(name: "wall_destroy", linkageName: "_Z12wall_destroyP7segmenti", scope: !24, file: !24, line: 301, type: !1815, scopeLine: 302, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1968 = !DILocalVariable(name: "seg", arg: 1, scope: !1967, file: !24, line: 301, type: !1558)
!1969 = !DILocation(line: 301, column: 28, scope: !1967)
!1970 = !DILocalVariable(name: "side", arg: 2, scope: !1967, file: !24, line: 301, type: !7)
!1971 = !DILocation(line: 301, column: 37, scope: !1967)
!1972 = !DILocation(line: 303, column: 2, scope: !1967)
!1973 = !DILocation(line: 304, column: 2, scope: !1967)
!1974 = !DILocation(line: 306, column: 12, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1967, file: !24, line: 306, column: 6)
!1976 = !DILocation(line: 306, column: 17, scope: !1975)
!1977 = !DILocation(line: 306, column: 23, scope: !1975)
!1978 = !DILocation(line: 306, column: 29, scope: !1975)
!1979 = !DILocation(line: 306, column: 6, scope: !1975)
!1980 = !DILocation(line: 306, column: 39, scope: !1975)
!1981 = !DILocation(line: 306, column: 44, scope: !1975)
!1982 = !DILocation(line: 307, column: 24, scope: !1975)
!1983 = !DILocation(line: 307, column: 29, scope: !1975)
!1984 = !DILocation(line: 307, column: 3, scope: !1975)
!1985 = !DILocation(line: 309, column: 3, scope: !1975)
!1986 = !DILocation(line: 310, column: 1, scope: !1967)
!1987 = distinct !DISubprogram(name: "wall_damage", linkageName: "_Z11wall_damageP7segmentii", scope: !24, file: !24, line: 314, type: !1988, scopeLine: 315, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!1988 = !DISubroutineType(types: !1989)
!1989 = !{null, !1558, !7, !14}
!1990 = !DILocalVariable(name: "seg", arg: 1, scope: !1987, file: !24, line: 314, type: !1558)
!1991 = !DILocation(line: 314, column: 27, scope: !1987)
!1992 = !DILocalVariable(name: "side", arg: 2, scope: !1987, file: !24, line: 314, type: !7)
!1993 = !DILocation(line: 314, column: 36, scope: !1987)
!1994 = !DILocalVariable(name: "damage", arg: 3, scope: !1987, file: !24, line: 314, type: !14)
!1995 = !DILocation(line: 314, column: 46, scope: !1987)
!1996 = !DILocalVariable(name: "a", scope: !1987, file: !24, line: 316, type: !7)
!1997 = !DILocation(line: 316, column: 6, scope: !1987)
!1998 = !DILocalVariable(name: "i", scope: !1987, file: !24, line: 316, type: !7)
!1999 = !DILocation(line: 316, column: 9, scope: !1987)
!2000 = !DILocalVariable(name: "n", scope: !1987, file: !24, line: 316, type: !7)
!2001 = !DILocation(line: 316, column: 12, scope: !1987)
!2002 = !DILocation(line: 318, column: 6, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !1987, file: !24, line: 318, column: 6)
!2004 = !DILocation(line: 318, column: 11, scope: !2003)
!2005 = !DILocation(line: 318, column: 17, scope: !2003)
!2006 = !DILocation(line: 318, column: 23, scope: !2003)
!2007 = !DILocation(line: 318, column: 32, scope: !2003)
!2008 = !DILocation(line: 319, column: 3, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !2003, file: !24, line: 318, column: 39)
!2010 = !DILocation(line: 320, column: 3, scope: !2009)
!2011 = !DILocation(line: 323, column: 12, scope: !2012)
!2012 = distinct !DILexicalBlock(scope: !1987, file: !24, line: 323, column: 6)
!2013 = !DILocation(line: 323, column: 17, scope: !2012)
!2014 = !DILocation(line: 323, column: 23, scope: !2012)
!2015 = !DILocation(line: 323, column: 29, scope: !2012)
!2016 = !DILocation(line: 323, column: 6, scope: !2012)
!2017 = !DILocation(line: 323, column: 39, scope: !2012)
!2018 = !DILocation(line: 323, column: 44, scope: !2012)
!2019 = !DILocation(line: 324, column: 3, scope: !2012)
!2020 = !DILocation(line: 326, column: 14, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !1987, file: !24, line: 326, column: 6)
!2022 = !DILocation(line: 326, column: 19, scope: !2021)
!2023 = !DILocation(line: 326, column: 25, scope: !2021)
!2024 = !DILocation(line: 326, column: 31, scope: !2021)
!2025 = !DILocation(line: 326, column: 8, scope: !2021)
!2026 = !DILocation(line: 326, column: 41, scope: !2021)
!2027 = !DILocation(line: 326, column: 47, scope: !2021)
!2028 = !DILocation(line: 326, column: 7, scope: !2021)
!2029 = !DILocation(line: 326, column: 63, scope: !2021)
!2030 = !DILocation(line: 326, column: 72, scope: !2021)
!2031 = !DILocation(line: 326, column: 77, scope: !2021)
!2032 = !DILocation(line: 326, column: 83, scope: !2021)
!2033 = !DILocation(line: 326, column: 89, scope: !2021)
!2034 = !DILocation(line: 326, column: 66, scope: !2021)
!2035 = !DILocation(line: 326, column: 99, scope: !2021)
!2036 = !DILocation(line: 326, column: 103, scope: !2021)
!2037 = !DILocalVariable(name: "Connectside", scope: !2038, file: !24, line: 328, type: !7)
!2038 = distinct !DILexicalBlock(scope: !2021, file: !24, line: 327, column: 2)
!2039 = !DILocation(line: 328, column: 7, scope: !2038)
!2040 = !DILocalVariable(name: "csegp", scope: !2038, file: !24, line: 329, type: !1558)
!2041 = !DILocation(line: 329, column: 12, scope: !2038)
!2042 = !DILocation(line: 331, column: 21, scope: !2038)
!2043 = !DILocation(line: 331, column: 26, scope: !2038)
!2044 = !DILocation(line: 331, column: 35, scope: !2038)
!2045 = !DILocation(line: 331, column: 12, scope: !2038)
!2046 = !DILocation(line: 331, column: 9, scope: !2038)
!2047 = !DILocation(line: 332, column: 35, scope: !2038)
!2048 = !DILocation(line: 332, column: 40, scope: !2038)
!2049 = !DILocation(line: 332, column: 17, scope: !2038)
!2050 = !DILocation(line: 332, column: 15, scope: !2038)
!2051 = !DILocation(line: 333, column: 3, scope: !2038)
!2052 = !DILocation(line: 335, column: 43, scope: !2038)
!2053 = !DILocation(line: 335, column: 9, scope: !2038)
!2054 = !DILocation(line: 335, column: 14, scope: !2038)
!2055 = !DILocation(line: 335, column: 20, scope: !2038)
!2056 = !DILocation(line: 335, column: 26, scope: !2038)
!2057 = !DILocation(line: 335, column: 3, scope: !2038)
!2058 = !DILocation(line: 335, column: 36, scope: !2038)
!2059 = !DILocation(line: 335, column: 40, scope: !2038)
!2060 = !DILocation(line: 336, column: 52, scope: !2038)
!2061 = !DILocation(line: 336, column: 9, scope: !2038)
!2062 = !DILocation(line: 336, column: 16, scope: !2038)
!2063 = !DILocation(line: 336, column: 22, scope: !2038)
!2064 = !DILocation(line: 336, column: 35, scope: !2038)
!2065 = !DILocation(line: 336, column: 3, scope: !2038)
!2066 = !DILocation(line: 336, column: 45, scope: !2038)
!2067 = !DILocation(line: 336, column: 49, scope: !2038)
!2068 = !DILocation(line: 338, column: 13, scope: !2038)
!2069 = !DILocation(line: 338, column: 18, scope: !2038)
!2070 = !DILocation(line: 338, column: 24, scope: !2038)
!2071 = !DILocation(line: 338, column: 30, scope: !2038)
!2072 = !DILocation(line: 338, column: 7, scope: !2038)
!2073 = !DILocation(line: 338, column: 40, scope: !2038)
!2074 = !DILocation(line: 338, column: 5, scope: !2038)
!2075 = !DILocation(line: 339, column: 17, scope: !2038)
!2076 = !DILocation(line: 339, column: 7, scope: !2038)
!2077 = !DILocation(line: 339, column: 20, scope: !2038)
!2078 = !DILocation(line: 339, column: 5, scope: !2038)
!2079 = !DILocation(line: 341, column: 13, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2038, file: !24, line: 341, column: 7)
!2081 = !DILocation(line: 341, column: 18, scope: !2080)
!2082 = !DILocation(line: 341, column: 24, scope: !2080)
!2083 = !DILocation(line: 341, column: 30, scope: !2080)
!2084 = !DILocation(line: 341, column: 7, scope: !2080)
!2085 = !DILocation(line: 341, column: 40, scope: !2080)
!2086 = !DILocation(line: 341, column: 61, scope: !2080)
!2087 = !DILocation(line: 341, column: 59, scope: !2080)
!2088 = !DILocation(line: 341, column: 44, scope: !2080)
!2089 = !DILocation(line: 342, column: 25, scope: !2090)
!2090 = distinct !DILexicalBlock(scope: !2080, file: !24, line: 341, column: 64)
!2091 = !DILocation(line: 342, column: 30, scope: !2090)
!2092 = !DILocation(line: 342, column: 4, scope: !2090)
!2093 = !DILocation(line: 347, column: 3, scope: !2090)
!2094 = !DILocation(line: 349, column: 11, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2080, file: !24, line: 349, column: 4)
!2096 = !DILocation(line: 349, column: 9, scope: !2095)
!2097 = !DILocation(line: 349, column: 16, scope: !2098)
!2098 = distinct !DILexicalBlock(scope: !2095, file: !24, line: 349, column: 4)
!2099 = !DILocation(line: 349, column: 20, scope: !2098)
!2100 = !DILocation(line: 349, column: 18, scope: !2098)
!2101 = !DILocation(line: 349, column: 4, scope: !2095)
!2102 = !DILocation(line: 350, column: 15, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2098, file: !24, line: 350, column: 9)
!2104 = !DILocation(line: 350, column: 20, scope: !2103)
!2105 = !DILocation(line: 350, column: 26, scope: !2103)
!2106 = !DILocation(line: 350, column: 32, scope: !2103)
!2107 = !DILocation(line: 350, column: 9, scope: !2103)
!2108 = !DILocation(line: 350, column: 42, scope: !2103)
!2109 = !DILocation(line: 350, column: 60, scope: !2103)
!2110 = !DILocation(line: 350, column: 64, scope: !2103)
!2111 = !DILocation(line: 350, column: 62, scope: !2103)
!2112 = !DILocation(line: 350, column: 57, scope: !2103)
!2113 = !DILocation(line: 350, column: 69, scope: !2103)
!2114 = !DILocation(line: 350, column: 67, scope: !2103)
!2115 = !DILocation(line: 350, column: 46, scope: !2103)
!2116 = !DILocation(line: 351, column: 24, scope: !2117)
!2117 = distinct !DILexicalBlock(scope: !2103, file: !24, line: 350, column: 72)
!2118 = !DILocation(line: 351, column: 29, scope: !2117)
!2119 = !DILocation(line: 351, column: 35, scope: !2117)
!2120 = !DILocation(line: 351, column: 42, scope: !2117)
!2121 = !DILocation(line: 351, column: 55, scope: !2117)
!2122 = !DILocation(line: 351, column: 58, scope: !2117)
!2123 = !DILocation(line: 351, column: 6, scope: !2117)
!2124 = !DILocation(line: 352, column: 5, scope: !2117)
!2125 = !DILocation(line: 349, column: 24, scope: !2098)
!2126 = !DILocation(line: 349, column: 4, scope: !2098)
!2127 = distinct !{!2127, !2101, !2128, !1964}
!2128 = !DILocation(line: 352, column: 5, scope: !2095)
!2129 = !DILocation(line: 353, column: 2, scope: !2038)
!2130 = !DILocation(line: 354, column: 1, scope: !1987)
!2131 = distinct !DISubprogram(name: "wall_open_door", linkageName: "_Z14wall_open_doorP7segmenti", scope: !24, file: !24, line: 359, type: !1815, scopeLine: 360, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!2132 = !DILocalVariable(name: "seg", arg: 1, scope: !2131, file: !24, line: 359, type: !1558)
!2133 = !DILocation(line: 359, column: 30, scope: !2131)
!2134 = !DILocalVariable(name: "side", arg: 2, scope: !2131, file: !24, line: 359, type: !7)
!2135 = !DILocation(line: 359, column: 39, scope: !2131)
!2136 = !DILocalVariable(name: "w", scope: !2131, file: !24, line: 361, type: !2137)
!2137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1530, size: 64)
!2138 = !DILocation(line: 361, column: 8, scope: !2131)
!2139 = !DILocalVariable(name: "d", scope: !2131, file: !24, line: 362, type: !2140)
!2140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!2141 = !DILocation(line: 362, column: 15, scope: !2131)
!2142 = !DILocalVariable(name: "Connectside", scope: !2131, file: !24, line: 363, type: !7)
!2143 = !DILocation(line: 363, column: 6, scope: !2131)
!2144 = !DILocalVariable(name: "csegp", scope: !2131, file: !24, line: 364, type: !1558)
!2145 = !DILocation(line: 364, column: 11, scope: !2131)
!2146 = !DILocation(line: 366, column: 2, scope: !2131)
!2147 = !DILocation(line: 368, column: 13, scope: !2131)
!2148 = !DILocation(line: 368, column: 18, scope: !2131)
!2149 = !DILocation(line: 368, column: 24, scope: !2131)
!2150 = !DILocation(line: 368, column: 30, scope: !2131)
!2151 = !DILocation(line: 368, column: 7, scope: !2131)
!2152 = !DILocation(line: 368, column: 4, scope: !2131)
!2153 = !DILocation(line: 372, column: 7, scope: !2154)
!2154 = distinct !DILexicalBlock(scope: !2131, file: !24, line: 372, column: 6)
!2155 = !DILocation(line: 372, column: 10, scope: !2154)
!2156 = !DILocation(line: 372, column: 16, scope: !2154)
!2157 = !DILocation(line: 372, column: 38, scope: !2154)
!2158 = !DILocation(line: 373, column: 4, scope: !2154)
!2159 = !DILocation(line: 373, column: 7, scope: !2154)
!2160 = !DILocation(line: 373, column: 13, scope: !2154)
!2161 = !DILocation(line: 373, column: 35, scope: !2154)
!2162 = !DILocation(line: 374, column: 4, scope: !2154)
!2163 = !DILocation(line: 374, column: 7, scope: !2154)
!2164 = !DILocation(line: 374, column: 13, scope: !2154)
!2165 = !DILocation(line: 375, column: 3, scope: !2154)
!2166 = !DILocation(line: 377, column: 6, scope: !2167)
!2167 = distinct !DILexicalBlock(scope: !2131, file: !24, line: 377, column: 6)
!2168 = !DILocation(line: 377, column: 9, scope: !2167)
!2169 = !DILocation(line: 377, column: 15, scope: !2167)
!2170 = !DILocalVariable(name: "i", scope: !2171, file: !24, line: 379, type: !7)
!2171 = distinct !DILexicalBlock(scope: !2167, file: !24, line: 377, column: 37)
!2172 = !DILocation(line: 379, column: 7, scope: !2171)
!2173 = !DILocation(line: 381, column: 5, scope: !2171)
!2174 = !DILocation(line: 383, column: 10, scope: !2175)
!2175 = distinct !DILexicalBlock(scope: !2171, file: !24, line: 383, column: 3)
!2176 = !DILocation(line: 383, column: 8, scope: !2175)
!2177 = !DILocation(line: 383, column: 15, scope: !2178)
!2178 = distinct !DILexicalBlock(scope: !2175, file: !24, line: 383, column: 3)
!2179 = !DILocation(line: 383, column: 19, scope: !2178)
!2180 = !DILocation(line: 383, column: 17, scope: !2178)
!2181 = !DILocation(line: 383, column: 3, scope: !2175)
!2182 = !DILocation(line: 385, column: 21, scope: !2183)
!2183 = distinct !DILexicalBlock(scope: !2178, file: !24, line: 383, column: 40)
!2184 = !DILocation(line: 385, column: 9, scope: !2183)
!2185 = !DILocation(line: 385, column: 6, scope: !2183)
!2186 = !DILocation(line: 387, column: 8, scope: !2187)
!2187 = distinct !DILexicalBlock(scope: !2183, file: !24, line: 387, column: 8)
!2188 = !DILocation(line: 387, column: 11, scope: !2187)
!2189 = !DILocation(line: 387, column: 31, scope: !2187)
!2190 = !DILocation(line: 387, column: 33, scope: !2187)
!2191 = !DILocation(line: 387, column: 28, scope: !2187)
!2192 = !DILocation(line: 387, column: 41, scope: !2187)
!2193 = !DILocation(line: 387, column: 44, scope: !2187)
!2194 = !DILocation(line: 387, column: 47, scope: !2187)
!2195 = !DILocation(line: 387, column: 66, scope: !2187)
!2196 = !DILocation(line: 387, column: 68, scope: !2187)
!2197 = !DILocation(line: 387, column: 63, scope: !2187)
!2198 = !DILocation(line: 387, column: 76, scope: !2187)
!2199 = !DILocation(line: 387, column: 80, scope: !2187)
!2200 = !DILocation(line: 387, column: 83, scope: !2187)
!2201 = !DILocation(line: 387, column: 91, scope: !2187)
!2202 = !DILocation(line: 387, column: 96, scope: !2187)
!2203 = !DILocation(line: 387, column: 100, scope: !2187)
!2204 = !DILocation(line: 387, column: 103, scope: !2187)
!2205 = !DILocation(line: 387, column: 123, scope: !2187)
!2206 = !DILocation(line: 387, column: 125, scope: !2187)
!2207 = !DILocation(line: 387, column: 120, scope: !2187)
!2208 = !DILocation(line: 387, column: 133, scope: !2187)
!2209 = !DILocation(line: 387, column: 136, scope: !2187)
!2210 = !DILocation(line: 387, column: 139, scope: !2187)
!2211 = !DILocation(line: 387, column: 158, scope: !2187)
!2212 = !DILocation(line: 387, column: 160, scope: !2187)
!2213 = !DILocation(line: 387, column: 155, scope: !2187)
!2214 = !DILocation(line: 388, column: 5, scope: !2187)
!2215 = !DILocation(line: 389, column: 3, scope: !2183)
!2216 = !DILocation(line: 383, column: 36, scope: !2178)
!2217 = !DILocation(line: 383, column: 3, scope: !2178)
!2218 = distinct !{!2218, !2181, !2219, !1964}
!2219 = !DILocation(line: 389, column: 3, scope: !2175)
!2220 = !DILocation(line: 391, column: 7, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2171, file: !24, line: 391, column: 7)
!2222 = !DILocation(line: 391, column: 12, scope: !2221)
!2223 = !DILocation(line: 391, column: 9, scope: !2221)
!2224 = !DILocation(line: 391, column: 27, scope: !2221)
!2225 = !DILocation(line: 391, column: 31, scope: !2221)
!2226 = !DILocation(line: 391, column: 41, scope: !2221)
!2227 = !DILocation(line: 391, column: 30, scope: !2221)
!2228 = !DILocation(line: 392, column: 4, scope: !2221)
!2229 = !DILocation(line: 394, column: 3, scope: !2171)
!2230 = !DILocation(line: 395, column: 3, scope: !2171)
!2231 = !DILocation(line: 397, column: 23, scope: !2171)
!2232 = !DILocation(line: 397, column: 26, scope: !2171)
!2233 = !DILocation(line: 397, column: 13, scope: !2171)
!2234 = !DILocation(line: 397, column: 36, scope: !2171)
!2235 = !DILocation(line: 397, column: 48, scope: !2171)
!2236 = !DILocation(line: 397, column: 51, scope: !2171)
!2237 = !DILocation(line: 397, column: 46, scope: !2171)
!2238 = !DILocation(line: 397, column: 3, scope: !2171)
!2239 = !DILocation(line: 397, column: 6, scope: !2171)
!2240 = !DILocation(line: 397, column: 11, scope: !2171)
!2241 = !DILocation(line: 399, column: 7, scope: !2242)
!2242 = distinct !DILexicalBlock(scope: !2171, file: !24, line: 399, column: 7)
!2243 = !DILocation(line: 399, column: 10, scope: !2242)
!2244 = !DILocation(line: 399, column: 15, scope: !2242)
!2245 = !DILocation(line: 400, column: 4, scope: !2242)
!2246 = !DILocation(line: 400, column: 7, scope: !2242)
!2247 = !DILocation(line: 400, column: 12, scope: !2242)
!2248 = !DILocation(line: 402, column: 2, scope: !2171)
!2249 = !DILocation(line: 404, column: 3, scope: !2250)
!2250 = distinct !DILexicalBlock(scope: !2167, file: !24, line: 403, column: 7)
!2251 = !DILabel(scope: !2250, name: "FastFix", file: !24, line: 405)
!2252 = !DILocation(line: 405, column: 2, scope: !2250)
!2253 = !DILocation(line: 406, column: 20, scope: !2250)
!2254 = !DILocation(line: 406, column: 8, scope: !2250)
!2255 = !DILocation(line: 406, column: 5, scope: !2250)
!2256 = !DILocation(line: 407, column: 3, scope: !2250)
!2257 = !DILocation(line: 407, column: 6, scope: !2250)
!2258 = !DILocation(line: 407, column: 11, scope: !2250)
!2259 = !DILocation(line: 408, column: 17, scope: !2250)
!2260 = !DILocation(line: 409, column: 3, scope: !2250)
!2261 = !DILocation(line: 413, column: 2, scope: !2131)
!2262 = !DILocation(line: 413, column: 5, scope: !2131)
!2263 = !DILocation(line: 413, column: 11, scope: !2131)
!2264 = !DILocation(line: 416, column: 20, scope: !2131)
!2265 = !DILocation(line: 416, column: 25, scope: !2131)
!2266 = !DILocation(line: 416, column: 34, scope: !2131)
!2267 = !DILocation(line: 416, column: 11, scope: !2131)
!2268 = !DILocation(line: 416, column: 8, scope: !2131)
!2269 = !DILocation(line: 417, column: 34, scope: !2131)
!2270 = !DILocation(line: 417, column: 39, scope: !2131)
!2271 = !DILocation(line: 417, column: 16, scope: !2131)
!2272 = !DILocation(line: 417, column: 14, scope: !2131)
!2273 = !DILocation(line: 418, column: 2, scope: !2131)
!2274 = !DILocation(line: 420, column: 8, scope: !2131)
!2275 = !DILocation(line: 420, column: 15, scope: !2131)
!2276 = !DILocation(line: 420, column: 21, scope: !2131)
!2277 = !DILocation(line: 420, column: 34, scope: !2131)
!2278 = !DILocation(line: 420, column: 2, scope: !2131)
!2279 = !DILocation(line: 420, column: 44, scope: !2131)
!2280 = !DILocation(line: 420, column: 50, scope: !2131)
!2281 = !DILocation(line: 424, column: 24, scope: !2131)
!2282 = !DILocation(line: 424, column: 29, scope: !2131)
!2283 = !DILocation(line: 424, column: 35, scope: !2131)
!2284 = !DILocation(line: 424, column: 41, scope: !2131)
!2285 = !DILocation(line: 424, column: 2, scope: !2131)
!2286 = !DILocation(line: 424, column: 5, scope: !2131)
!2287 = !DILocation(line: 424, column: 22, scope: !2131)
!2288 = !DILocation(line: 425, column: 23, scope: !2131)
!2289 = !DILocation(line: 425, column: 30, scope: !2131)
!2290 = !DILocation(line: 425, column: 36, scope: !2131)
!2291 = !DILocation(line: 425, column: 49, scope: !2131)
!2292 = !DILocation(line: 425, column: 2, scope: !2131)
!2293 = !DILocation(line: 425, column: 5, scope: !2131)
!2294 = !DILocation(line: 425, column: 21, scope: !2131)
!2295 = !DILocation(line: 427, column: 2, scope: !2131)
!2296 = !DILocation(line: 429, column: 6, scope: !2297)
!2297 = distinct !DILexicalBlock(scope: !2131, file: !24, line: 429, column: 6)
!2298 = !DILocation(line: 429, column: 20, scope: !2297)
!2299 = !DILocation(line: 430, column: 31, scope: !2300)
!2300 = distinct !DILexicalBlock(scope: !2297, file: !24, line: 429, column: 43)
!2301 = !DILocation(line: 430, column: 35, scope: !2300)
!2302 = !DILocation(line: 430, column: 47, scope: !2300)
!2303 = !DILocation(line: 430, column: 3, scope: !2300)
!2304 = !DILocation(line: 431, column: 2, scope: !2300)
!2305 = !DILocation(line: 433, column: 6, scope: !2306)
!2306 = distinct !DILexicalBlock(scope: !2131, file: !24, line: 433, column: 6)
!2307 = !DILocation(line: 433, column: 9, scope: !2306)
!2308 = !DILocation(line: 433, column: 21, scope: !2306)
!2309 = !DILocalVariable(name: "w2", scope: !2310, file: !24, line: 434, type: !2137)
!2310 = distinct !DILexicalBlock(scope: !2306, file: !24, line: 433, column: 28)
!2311 = !DILocation(line: 434, column: 9, scope: !2310)
!2312 = !DILocalVariable(name: "seg2", scope: !2310, file: !24, line: 435, type: !1558)
!2313 = !DILocation(line: 435, column: 12, scope: !2310)
!2314 = !DILocation(line: 437, column: 15, scope: !2310)
!2315 = !DILocation(line: 437, column: 18, scope: !2310)
!2316 = !DILocation(line: 437, column: 9, scope: !2310)
!2317 = !DILocation(line: 437, column: 6, scope: !2310)
!2318 = !DILocation(line: 438, column: 20, scope: !2310)
!2319 = !DILocation(line: 438, column: 24, scope: !2310)
!2320 = !DILocation(line: 438, column: 11, scope: !2310)
!2321 = !DILocation(line: 438, column: 8, scope: !2310)
!2322 = !DILocation(line: 440, column: 3, scope: !2310)
!2323 = !DILocation(line: 443, column: 3, scope: !2310)
!2324 = !DILocation(line: 443, column: 7, scope: !2310)
!2325 = !DILocation(line: 443, column: 13, scope: !2310)
!2326 = !DILocation(line: 445, column: 21, scope: !2310)
!2327 = !DILocation(line: 445, column: 27, scope: !2310)
!2328 = !DILocation(line: 445, column: 36, scope: !2310)
!2329 = !DILocation(line: 445, column: 40, scope: !2310)
!2330 = !DILocation(line: 445, column: 12, scope: !2310)
!2331 = !DILocation(line: 445, column: 9, scope: !2310)
!2332 = !DILocation(line: 446, column: 35, scope: !2310)
!2333 = !DILocation(line: 446, column: 41, scope: !2310)
!2334 = !DILocation(line: 446, column: 17, scope: !2310)
!2335 = !DILocation(line: 446, column: 15, scope: !2310)
!2336 = !DILocation(line: 447, column: 3, scope: !2310)
!2337 = !DILocation(line: 448, column: 9, scope: !2310)
!2338 = !DILocation(line: 448, column: 16, scope: !2310)
!2339 = !DILocation(line: 448, column: 22, scope: !2310)
!2340 = !DILocation(line: 448, column: 35, scope: !2310)
!2341 = !DILocation(line: 448, column: 3, scope: !2310)
!2342 = !DILocation(line: 448, column: 45, scope: !2310)
!2343 = !DILocation(line: 448, column: 51, scope: !2310)
!2344 = !DILocation(line: 450, column: 3, scope: !2310)
!2345 = !DILocation(line: 450, column: 6, scope: !2310)
!2346 = !DILocation(line: 450, column: 14, scope: !2310)
!2347 = !DILocation(line: 451, column: 25, scope: !2310)
!2348 = !DILocation(line: 451, column: 28, scope: !2310)
!2349 = !DILocation(line: 451, column: 3, scope: !2310)
!2350 = !DILocation(line: 451, column: 6, scope: !2310)
!2351 = !DILocation(line: 451, column: 23, scope: !2310)
!2352 = !DILocation(line: 452, column: 24, scope: !2310)
!2353 = !DILocation(line: 452, column: 31, scope: !2310)
!2354 = !DILocation(line: 452, column: 37, scope: !2310)
!2355 = !DILocation(line: 452, column: 50, scope: !2310)
!2356 = !DILocation(line: 452, column: 3, scope: !2310)
!2357 = !DILocation(line: 452, column: 6, scope: !2310)
!2358 = !DILocation(line: 452, column: 22, scope: !2310)
!2359 = !DILocation(line: 453, column: 2, scope: !2310)
!2360 = !DILocation(line: 455, column: 3, scope: !2306)
!2361 = !DILocation(line: 455, column: 6, scope: !2306)
!2362 = !DILocation(line: 455, column: 14, scope: !2306)
!2363 = !DILocation(line: 458, column: 6, scope: !2364)
!2364 = distinct !DILexicalBlock(scope: !2131, file: !24, line: 458, column: 6)
!2365 = !DILocation(line: 458, column: 20, scope: !2364)
!2366 = !DILocalVariable(name: "cp", scope: !2367, file: !24, line: 461, type: !1583)
!2367 = distinct !DILexicalBlock(scope: !2364, file: !24, line: 459, column: 2)
!2368 = !DILocation(line: 461, column: 14, scope: !2367)
!2369 = !DILocation(line: 462, column: 37, scope: !2367)
!2370 = !DILocation(line: 462, column: 42, scope: !2367)
!2371 = !DILocation(line: 462, column: 3, scope: !2367)
!2372 = !DILocation(line: 463, column: 17, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2367, file: !24, line: 463, column: 7)
!2374 = !DILocation(line: 463, column: 20, scope: !2373)
!2375 = !DILocation(line: 463, column: 7, scope: !2373)
!2376 = !DILocation(line: 463, column: 30, scope: !2373)
!2377 = !DILocation(line: 463, column: 41, scope: !2373)
!2378 = !DILocation(line: 464, column: 37, scope: !2373)
!2379 = !DILocation(line: 464, column: 40, scope: !2373)
!2380 = !DILocation(line: 464, column: 27, scope: !2373)
!2381 = !DILocation(line: 464, column: 50, scope: !2373)
!2382 = !DILocation(line: 464, column: 62, scope: !2373)
!2383 = !DILocation(line: 464, column: 66, scope: !2373)
!2384 = !DILocation(line: 464, column: 78, scope: !2373)
!2385 = !DILocation(line: 464, column: 4, scope: !2373)
!2386 = !DILocation(line: 466, column: 2, scope: !2367)
!2387 = !DILocation(line: 467, column: 1, scope: !2131)
!2388 = distinct !DISubprogram(name: "start_wall_cloak", linkageName: "_Z16start_wall_cloakP7segmenti", scope: !24, file: !24, line: 471, type: !1815, scopeLine: 472, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!2389 = !DILocalVariable(name: "seg", arg: 1, scope: !2388, file: !24, line: 471, type: !1558)
!2390 = !DILocation(line: 471, column: 32, scope: !2388)
!2391 = !DILocalVariable(name: "side", arg: 2, scope: !2388, file: !24, line: 471, type: !7)
!2392 = !DILocation(line: 471, column: 41, scope: !2388)
!2393 = !DILocalVariable(name: "w", scope: !2388, file: !24, line: 473, type: !2137)
!2394 = !DILocation(line: 473, column: 8, scope: !2388)
!2395 = !DILocalVariable(name: "d", scope: !2388, file: !24, line: 474, type: !2396)
!2396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!2397 = !DILocation(line: 474, column: 17, scope: !2388)
!2398 = !DILocalVariable(name: "Connectside", scope: !2388, file: !24, line: 475, type: !7)
!2399 = !DILocation(line: 475, column: 6, scope: !2388)
!2400 = !DILocalVariable(name: "csegp", scope: !2388, file: !24, line: 476, type: !1558)
!2401 = !DILocation(line: 476, column: 11, scope: !2388)
!2402 = !DILocalVariable(name: "i", scope: !2388, file: !24, line: 477, type: !7)
!2403 = !DILocation(line: 477, column: 6, scope: !2388)
!2404 = !DILocation(line: 479, column: 6, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2388, file: !24, line: 479, column: 6)
!2406 = !DILocation(line: 479, column: 20, scope: !2405)
!2407 = !DILocation(line: 479, column: 42, scope: !2405)
!2408 = !DILocation(line: 481, column: 2, scope: !2388)
!2409 = !DILocation(line: 483, column: 13, scope: !2388)
!2410 = !DILocation(line: 483, column: 18, scope: !2388)
!2411 = !DILocation(line: 483, column: 24, scope: !2388)
!2412 = !DILocation(line: 483, column: 30, scope: !2388)
!2413 = !DILocation(line: 483, column: 7, scope: !2388)
!2414 = !DILocation(line: 483, column: 4, scope: !2388)
!2415 = !DILocation(line: 485, column: 6, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2388, file: !24, line: 485, column: 6)
!2417 = !DILocation(line: 485, column: 9, scope: !2416)
!2418 = !DILocation(line: 485, column: 14, scope: !2416)
!2419 = !DILocation(line: 485, column: 27, scope: !2416)
!2420 = !DILocation(line: 485, column: 30, scope: !2416)
!2421 = !DILocation(line: 485, column: 33, scope: !2416)
!2422 = !DILocation(line: 485, column: 39, scope: !2416)
!2423 = !DILocation(line: 486, column: 3, scope: !2416)
!2424 = !DILocation(line: 488, column: 20, scope: !2388)
!2425 = !DILocation(line: 488, column: 25, scope: !2388)
!2426 = !DILocation(line: 488, column: 34, scope: !2388)
!2427 = !DILocation(line: 488, column: 11, scope: !2388)
!2428 = !DILocation(line: 488, column: 8, scope: !2388)
!2429 = !DILocation(line: 489, column: 34, scope: !2388)
!2430 = !DILocation(line: 489, column: 39, scope: !2388)
!2431 = !DILocation(line: 489, column: 16, scope: !2388)
!2432 = !DILocation(line: 489, column: 14, scope: !2388)
!2433 = !DILocation(line: 490, column: 2, scope: !2388)
!2434 = !DILocation(line: 492, column: 6, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2388, file: !24, line: 492, column: 6)
!2436 = !DILocation(line: 492, column: 9, scope: !2435)
!2437 = !DILocation(line: 492, column: 15, scope: !2435)
!2438 = !DILocalVariable(name: "i", scope: !2439, file: !24, line: 494, type: !7)
!2439 = distinct !DILexicalBlock(scope: !2435, file: !24, line: 492, column: 40)
!2440 = !DILocation(line: 494, column: 7, scope: !2439)
!2441 = !DILocation(line: 496, column: 5, scope: !2439)
!2442 = !DILocation(line: 498, column: 10, scope: !2443)
!2443 = distinct !DILexicalBlock(scope: !2439, file: !24, line: 498, column: 3)
!2444 = !DILocation(line: 498, column: 8, scope: !2443)
!2445 = !DILocation(line: 498, column: 15, scope: !2446)
!2446 = distinct !DILexicalBlock(scope: !2443, file: !24, line: 498, column: 3)
!2447 = !DILocation(line: 498, column: 19, scope: !2446)
!2448 = !DILocation(line: 498, column: 17, scope: !2446)
!2449 = !DILocation(line: 498, column: 3, scope: !2443)
!2450 = !DILocation(line: 500, column: 23, scope: !2451)
!2451 = distinct !DILexicalBlock(scope: !2446, file: !24, line: 498, column: 44)
!2452 = !DILocation(line: 500, column: 9, scope: !2451)
!2453 = !DILocation(line: 500, column: 6, scope: !2451)
!2454 = !DILocation(line: 502, column: 8, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2451, file: !24, line: 502, column: 8)
!2456 = !DILocation(line: 502, column: 11, scope: !2455)
!2457 = !DILocation(line: 502, column: 28, scope: !2455)
!2458 = !DILocation(line: 502, column: 30, scope: !2455)
!2459 = !DILocation(line: 502, column: 25, scope: !2455)
!2460 = !DILocation(line: 502, column: 38, scope: !2455)
!2461 = !DILocation(line: 502, column: 41, scope: !2455)
!2462 = !DILocation(line: 502, column: 44, scope: !2455)
!2463 = !DILocation(line: 502, column: 60, scope: !2455)
!2464 = !DILocation(line: 502, column: 62, scope: !2455)
!2465 = !DILocation(line: 502, column: 57, scope: !2455)
!2466 = !DILocation(line: 503, column: 5, scope: !2455)
!2467 = !DILocation(line: 504, column: 3, scope: !2451)
!2468 = !DILocation(line: 498, column: 40, scope: !2446)
!2469 = !DILocation(line: 498, column: 3, scope: !2446)
!2470 = distinct !{!2470, !2449, !2471, !1964}
!2471 = !DILocation(line: 504, column: 3, scope: !2443)
!2472 = !DILocation(line: 506, column: 3, scope: !2439)
!2473 = !DILocation(line: 507, column: 3, scope: !2439)
!2474 = !DILocation(line: 509, column: 34, scope: !2439)
!2475 = !DILocation(line: 509, column: 37, scope: !2439)
!2476 = !DILocation(line: 509, column: 32, scope: !2439)
!2477 = !DILocation(line: 509, column: 3, scope: !2439)
!2478 = !DILocation(line: 509, column: 6, scope: !2439)
!2479 = !DILocation(line: 509, column: 11, scope: !2439)
!2480 = !DILocation(line: 511, column: 2, scope: !2439)
!2481 = !DILocation(line: 512, column: 11, scope: !2482)
!2482 = distinct !DILexicalBlock(scope: !2435, file: !24, line: 512, column: 11)
!2483 = !DILocation(line: 512, column: 14, scope: !2482)
!2484 = !DILocation(line: 512, column: 20, scope: !2482)
!2485 = !DILocation(line: 513, column: 22, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2482, file: !24, line: 512, column: 41)
!2487 = !DILocation(line: 513, column: 8, scope: !2486)
!2488 = !DILocation(line: 513, column: 5, scope: !2486)
!2489 = !DILocation(line: 514, column: 3, scope: !2486)
!2490 = !DILocation(line: 514, column: 6, scope: !2486)
!2491 = !DILocation(line: 514, column: 11, scope: !2486)
!2492 = !DILocation(line: 515, column: 7, scope: !2493)
!2493 = distinct !DILexicalBlock(scope: !2486, file: !24, line: 515, column: 7)
!2494 = !DILocation(line: 515, column: 26, scope: !2493)
!2495 = !DILocation(line: 516, column: 4, scope: !2496)
!2496 = distinct !DILexicalBlock(scope: !2493, file: !24, line: 515, column: 49)
!2497 = !DILocation(line: 517, column: 4, scope: !2496)
!2498 = !DILocation(line: 517, column: 7, scope: !2496)
!2499 = !DILocation(line: 517, column: 12, scope: !2496)
!2500 = !DILocation(line: 518, column: 10, scope: !2496)
!2501 = !DILocation(line: 518, column: 17, scope: !2496)
!2502 = !DILocation(line: 518, column: 23, scope: !2496)
!2503 = !DILocation(line: 518, column: 36, scope: !2496)
!2504 = !DILocation(line: 518, column: 4, scope: !2496)
!2505 = !DILocation(line: 518, column: 46, scope: !2496)
!2506 = !DILocation(line: 518, column: 51, scope: !2496)
!2507 = !DILocation(line: 519, column: 4, scope: !2496)
!2508 = !DILocation(line: 521, column: 21, scope: !2486)
!2509 = !DILocation(line: 522, column: 2, scope: !2486)
!2510 = !DILocation(line: 524, column: 3, scope: !2511)
!2511 = distinct !DILexicalBlock(scope: !2482, file: !24, line: 523, column: 7)
!2512 = !DILocation(line: 525, column: 3, scope: !2511)
!2513 = !DILocation(line: 528, column: 2, scope: !2388)
!2514 = !DILocation(line: 528, column: 5, scope: !2388)
!2515 = !DILocation(line: 528, column: 11, scope: !2388)
!2516 = !DILocation(line: 529, column: 8, scope: !2388)
!2517 = !DILocation(line: 529, column: 15, scope: !2388)
!2518 = !DILocation(line: 529, column: 21, scope: !2388)
!2519 = !DILocation(line: 529, column: 34, scope: !2388)
!2520 = !DILocation(line: 529, column: 2, scope: !2388)
!2521 = !DILocation(line: 529, column: 44, scope: !2388)
!2522 = !DILocation(line: 529, column: 50, scope: !2388)
!2523 = !DILocation(line: 531, column: 21, scope: !2388)
!2524 = !DILocation(line: 531, column: 26, scope: !2388)
!2525 = !DILocation(line: 531, column: 32, scope: !2388)
!2526 = !DILocation(line: 531, column: 38, scope: !2388)
!2527 = !DILocation(line: 531, column: 2, scope: !2388)
!2528 = !DILocation(line: 531, column: 5, scope: !2388)
!2529 = !DILocation(line: 531, column: 19, scope: !2388)
!2530 = !DILocation(line: 532, column: 20, scope: !2388)
!2531 = !DILocation(line: 532, column: 27, scope: !2388)
!2532 = !DILocation(line: 532, column: 33, scope: !2388)
!2533 = !DILocation(line: 532, column: 46, scope: !2388)
!2534 = !DILocation(line: 532, column: 2, scope: !2388)
!2535 = !DILocation(line: 532, column: 5, scope: !2388)
!2536 = !DILocation(line: 532, column: 18, scope: !2388)
!2537 = !DILocation(line: 534, column: 2, scope: !2388)
!2538 = !DILocation(line: 536, column: 2, scope: !2388)
!2539 = !DILocation(line: 538, column: 6, scope: !2540)
!2540 = distinct !DILexicalBlock(scope: !2388, file: !24, line: 538, column: 6)
!2541 = !DILocation(line: 538, column: 20, scope: !2540)
!2542 = !DILocalVariable(name: "cp", scope: !2543, file: !24, line: 539, type: !1583)
!2543 = distinct !DILexicalBlock(scope: !2540, file: !24, line: 538, column: 42)
!2544 = !DILocation(line: 539, column: 14, scope: !2543)
!2545 = !DILocation(line: 540, column: 37, scope: !2543)
!2546 = !DILocation(line: 540, column: 42, scope: !2543)
!2547 = !DILocation(line: 540, column: 3, scope: !2543)
!2548 = !DILocation(line: 541, column: 47, scope: !2543)
!2549 = !DILocation(line: 541, column: 51, scope: !2543)
!2550 = !DILocation(line: 541, column: 63, scope: !2543)
!2551 = !DILocation(line: 541, column: 3, scope: !2543)
!2552 = !DILocation(line: 542, column: 2, scope: !2543)
!2553 = !DILocation(line: 544, column: 9, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2388, file: !24, line: 544, column: 2)
!2555 = !DILocation(line: 544, column: 7, scope: !2554)
!2556 = !DILocation(line: 544, column: 14, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2554, file: !24, line: 544, column: 2)
!2558 = !DILocation(line: 544, column: 16, scope: !2557)
!2559 = !DILocation(line: 544, column: 2, scope: !2554)
!2560 = !DILocation(line: 545, column: 20, scope: !2561)
!2561 = distinct !DILexicalBlock(scope: !2557, file: !24, line: 544, column: 26)
!2562 = !DILocation(line: 545, column: 25, scope: !2561)
!2563 = !DILocation(line: 545, column: 31, scope: !2561)
!2564 = !DILocation(line: 545, column: 37, scope: !2561)
!2565 = !DILocation(line: 545, column: 42, scope: !2561)
!2566 = !DILocation(line: 545, column: 45, scope: !2561)
!2567 = !DILocation(line: 545, column: 3, scope: !2561)
!2568 = !DILocation(line: 545, column: 6, scope: !2561)
!2569 = !DILocation(line: 545, column: 15, scope: !2561)
!2570 = !DILocation(line: 545, column: 18, scope: !2561)
!2571 = !DILocation(line: 546, column: 19, scope: !2561)
!2572 = !DILocation(line: 546, column: 26, scope: !2561)
!2573 = !DILocation(line: 546, column: 32, scope: !2561)
!2574 = !DILocation(line: 546, column: 45, scope: !2561)
!2575 = !DILocation(line: 546, column: 50, scope: !2561)
!2576 = !DILocation(line: 546, column: 53, scope: !2561)
!2577 = !DILocation(line: 546, column: 3, scope: !2561)
!2578 = !DILocation(line: 546, column: 6, scope: !2561)
!2579 = !DILocation(line: 546, column: 14, scope: !2561)
!2580 = !DILocation(line: 546, column: 17, scope: !2561)
!2581 = !DILocation(line: 547, column: 2, scope: !2561)
!2582 = !DILocation(line: 544, column: 22, scope: !2557)
!2583 = !DILocation(line: 544, column: 2, scope: !2557)
!2584 = distinct !{!2584, !2559, !2585, !1964}
!2585 = !DILocation(line: 547, column: 2, scope: !2554)
!2586 = !DILocation(line: 548, column: 1, scope: !2388)
!2587 = distinct !DISubprogram(name: "start_wall_decloak", linkageName: "_Z18start_wall_decloakP7segmenti", scope: !24, file: !24, line: 552, type: !1815, scopeLine: 553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!2588 = !DILocalVariable(name: "seg", arg: 1, scope: !2587, file: !24, line: 552, type: !1558)
!2589 = !DILocation(line: 552, column: 34, scope: !2587)
!2590 = !DILocalVariable(name: "side", arg: 2, scope: !2587, file: !24, line: 552, type: !7)
!2591 = !DILocation(line: 552, column: 43, scope: !2587)
!2592 = !DILocalVariable(name: "w", scope: !2587, file: !24, line: 554, type: !2137)
!2593 = !DILocation(line: 554, column: 8, scope: !2587)
!2594 = !DILocalVariable(name: "d", scope: !2587, file: !24, line: 555, type: !2396)
!2595 = !DILocation(line: 555, column: 17, scope: !2587)
!2596 = !DILocalVariable(name: "Connectside", scope: !2587, file: !24, line: 556, type: !7)
!2597 = !DILocation(line: 556, column: 6, scope: !2587)
!2598 = !DILocalVariable(name: "csegp", scope: !2587, file: !24, line: 557, type: !1558)
!2599 = !DILocation(line: 557, column: 11, scope: !2587)
!2600 = !DILocalVariable(name: "i", scope: !2587, file: !24, line: 558, type: !7)
!2601 = !DILocation(line: 558, column: 6, scope: !2587)
!2602 = !DILocation(line: 560, column: 6, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2587, file: !24, line: 560, column: 6)
!2604 = !DILocation(line: 560, column: 20, scope: !2603)
!2605 = !DILocation(line: 560, column: 42, scope: !2603)
!2606 = !DILocation(line: 562, column: 2, scope: !2587)
!2607 = !DILocation(line: 564, column: 13, scope: !2587)
!2608 = !DILocation(line: 564, column: 18, scope: !2587)
!2609 = !DILocation(line: 564, column: 24, scope: !2587)
!2610 = !DILocation(line: 564, column: 30, scope: !2587)
!2611 = !DILocation(line: 564, column: 7, scope: !2587)
!2612 = !DILocation(line: 564, column: 4, scope: !2587)
!2613 = !DILocation(line: 566, column: 6, scope: !2614)
!2614 = distinct !DILexicalBlock(scope: !2587, file: !24, line: 566, column: 6)
!2615 = !DILocation(line: 566, column: 9, scope: !2614)
!2616 = !DILocation(line: 566, column: 14, scope: !2614)
!2617 = !DILocation(line: 566, column: 29, scope: !2614)
!2618 = !DILocation(line: 566, column: 32, scope: !2614)
!2619 = !DILocation(line: 566, column: 35, scope: !2614)
!2620 = !DILocation(line: 566, column: 41, scope: !2614)
!2621 = !DILocation(line: 567, column: 3, scope: !2614)
!2622 = !DILocation(line: 569, column: 6, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2587, file: !24, line: 569, column: 6)
!2624 = !DILocation(line: 569, column: 9, scope: !2623)
!2625 = !DILocation(line: 569, column: 15, scope: !2623)
!2626 = !DILocalVariable(name: "i", scope: !2627, file: !24, line: 571, type: !7)
!2627 = distinct !DILexicalBlock(scope: !2623, file: !24, line: 569, column: 38)
!2628 = !DILocation(line: 571, column: 7, scope: !2627)
!2629 = !DILocation(line: 573, column: 5, scope: !2627)
!2630 = !DILocation(line: 575, column: 10, scope: !2631)
!2631 = distinct !DILexicalBlock(scope: !2627, file: !24, line: 575, column: 3)
!2632 = !DILocation(line: 575, column: 8, scope: !2631)
!2633 = !DILocation(line: 575, column: 15, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2631, file: !24, line: 575, column: 3)
!2635 = !DILocation(line: 575, column: 19, scope: !2634)
!2636 = !DILocation(line: 575, column: 17, scope: !2634)
!2637 = !DILocation(line: 575, column: 3, scope: !2631)
!2638 = !DILocation(line: 577, column: 23, scope: !2639)
!2639 = distinct !DILexicalBlock(scope: !2634, file: !24, line: 575, column: 44)
!2640 = !DILocation(line: 577, column: 9, scope: !2639)
!2641 = !DILocation(line: 577, column: 6, scope: !2639)
!2642 = !DILocation(line: 579, column: 8, scope: !2643)
!2643 = distinct !DILexicalBlock(scope: !2639, file: !24, line: 579, column: 8)
!2644 = !DILocation(line: 579, column: 11, scope: !2643)
!2645 = !DILocation(line: 579, column: 28, scope: !2643)
!2646 = !DILocation(line: 579, column: 30, scope: !2643)
!2647 = !DILocation(line: 579, column: 25, scope: !2643)
!2648 = !DILocation(line: 579, column: 38, scope: !2643)
!2649 = !DILocation(line: 579, column: 41, scope: !2643)
!2650 = !DILocation(line: 579, column: 44, scope: !2643)
!2651 = !DILocation(line: 579, column: 60, scope: !2643)
!2652 = !DILocation(line: 579, column: 62, scope: !2643)
!2653 = !DILocation(line: 579, column: 57, scope: !2643)
!2654 = !DILocation(line: 580, column: 5, scope: !2643)
!2655 = !DILocation(line: 581, column: 3, scope: !2639)
!2656 = !DILocation(line: 575, column: 40, scope: !2634)
!2657 = !DILocation(line: 575, column: 3, scope: !2634)
!2658 = distinct !{!2658, !2637, !2659, !1964}
!2659 = !DILocation(line: 581, column: 3, scope: !2631)
!2660 = !DILocation(line: 583, column: 3, scope: !2627)
!2661 = !DILocation(line: 584, column: 3, scope: !2627)
!2662 = !DILocation(line: 586, column: 34, scope: !2627)
!2663 = !DILocation(line: 586, column: 37, scope: !2627)
!2664 = !DILocation(line: 586, column: 32, scope: !2627)
!2665 = !DILocation(line: 586, column: 3, scope: !2627)
!2666 = !DILocation(line: 586, column: 6, scope: !2627)
!2667 = !DILocation(line: 586, column: 11, scope: !2627)
!2668 = !DILocation(line: 588, column: 2, scope: !2627)
!2669 = !DILocation(line: 589, column: 11, scope: !2670)
!2670 = distinct !DILexicalBlock(scope: !2623, file: !24, line: 589, column: 11)
!2671 = !DILocation(line: 589, column: 14, scope: !2670)
!2672 = !DILocation(line: 589, column: 20, scope: !2670)
!2673 = !DILocation(line: 590, column: 22, scope: !2674)
!2674 = distinct !DILexicalBlock(scope: !2670, file: !24, line: 589, column: 41)
!2675 = !DILocation(line: 590, column: 8, scope: !2674)
!2676 = !DILocation(line: 590, column: 5, scope: !2674)
!2677 = !DILocation(line: 591, column: 3, scope: !2674)
!2678 = !DILocation(line: 591, column: 6, scope: !2674)
!2679 = !DILocation(line: 591, column: 11, scope: !2674)
!2680 = !DILocation(line: 592, column: 7, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2674, file: !24, line: 592, column: 7)
!2682 = !DILocation(line: 592, column: 26, scope: !2681)
!2683 = !DILocation(line: 593, column: 4, scope: !2684)
!2684 = distinct !DILexicalBlock(scope: !2681, file: !24, line: 592, column: 49)
!2685 = !DILocation(line: 594, column: 4, scope: !2684)
!2686 = !DILocation(line: 594, column: 7, scope: !2684)
!2687 = !DILocation(line: 594, column: 12, scope: !2684)
!2688 = !DILocation(line: 595, column: 10, scope: !2684)
!2689 = !DILocation(line: 595, column: 17, scope: !2684)
!2690 = !DILocation(line: 595, column: 23, scope: !2684)
!2691 = !DILocation(line: 595, column: 36, scope: !2684)
!2692 = !DILocation(line: 595, column: 4, scope: !2684)
!2693 = !DILocation(line: 595, column: 46, scope: !2684)
!2694 = !DILocation(line: 595, column: 51, scope: !2684)
!2695 = !DILocation(line: 596, column: 4, scope: !2684)
!2696 = !DILocation(line: 598, column: 21, scope: !2674)
!2697 = !DILocation(line: 599, column: 2, scope: !2674)
!2698 = !DILocation(line: 601, column: 3, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2670, file: !24, line: 600, column: 7)
!2700 = !DILocation(line: 602, column: 3, scope: !2699)
!2701 = !DILocation(line: 605, column: 2, scope: !2587)
!2702 = !DILocation(line: 605, column: 5, scope: !2587)
!2703 = !DILocation(line: 605, column: 11, scope: !2587)
!2704 = !DILocation(line: 608, column: 20, scope: !2587)
!2705 = !DILocation(line: 608, column: 25, scope: !2587)
!2706 = !DILocation(line: 608, column: 34, scope: !2587)
!2707 = !DILocation(line: 608, column: 11, scope: !2587)
!2708 = !DILocation(line: 608, column: 8, scope: !2587)
!2709 = !DILocation(line: 609, column: 34, scope: !2587)
!2710 = !DILocation(line: 609, column: 39, scope: !2587)
!2711 = !DILocation(line: 609, column: 16, scope: !2587)
!2712 = !DILocation(line: 609, column: 14, scope: !2587)
!2713 = !DILocation(line: 610, column: 2, scope: !2587)
!2714 = !DILocation(line: 612, column: 8, scope: !2587)
!2715 = !DILocation(line: 612, column: 15, scope: !2587)
!2716 = !DILocation(line: 612, column: 21, scope: !2587)
!2717 = !DILocation(line: 612, column: 34, scope: !2587)
!2718 = !DILocation(line: 612, column: 2, scope: !2587)
!2719 = !DILocation(line: 612, column: 44, scope: !2587)
!2720 = !DILocation(line: 612, column: 50, scope: !2587)
!2721 = !DILocation(line: 614, column: 21, scope: !2587)
!2722 = !DILocation(line: 614, column: 26, scope: !2587)
!2723 = !DILocation(line: 614, column: 32, scope: !2587)
!2724 = !DILocation(line: 614, column: 38, scope: !2587)
!2725 = !DILocation(line: 614, column: 2, scope: !2587)
!2726 = !DILocation(line: 614, column: 5, scope: !2587)
!2727 = !DILocation(line: 614, column: 19, scope: !2587)
!2728 = !DILocation(line: 615, column: 20, scope: !2587)
!2729 = !DILocation(line: 615, column: 27, scope: !2587)
!2730 = !DILocation(line: 615, column: 33, scope: !2587)
!2731 = !DILocation(line: 615, column: 46, scope: !2587)
!2732 = !DILocation(line: 615, column: 2, scope: !2587)
!2733 = !DILocation(line: 615, column: 5, scope: !2587)
!2734 = !DILocation(line: 615, column: 18, scope: !2587)
!2735 = !DILocation(line: 617, column: 2, scope: !2587)
!2736 = !DILocation(line: 619, column: 2, scope: !2587)
!2737 = !DILocation(line: 621, column: 6, scope: !2738)
!2738 = distinct !DILexicalBlock(scope: !2587, file: !24, line: 621, column: 6)
!2739 = !DILocation(line: 621, column: 20, scope: !2738)
!2740 = !DILocalVariable(name: "cp", scope: !2741, file: !24, line: 622, type: !1583)
!2741 = distinct !DILexicalBlock(scope: !2738, file: !24, line: 621, column: 42)
!2742 = !DILocation(line: 622, column: 14, scope: !2741)
!2743 = !DILocation(line: 623, column: 37, scope: !2741)
!2744 = !DILocation(line: 623, column: 42, scope: !2741)
!2745 = !DILocation(line: 623, column: 3, scope: !2741)
!2746 = !DILocation(line: 624, column: 48, scope: !2741)
!2747 = !DILocation(line: 624, column: 52, scope: !2741)
!2748 = !DILocation(line: 624, column: 64, scope: !2741)
!2749 = !DILocation(line: 624, column: 3, scope: !2741)
!2750 = !DILocation(line: 625, column: 2, scope: !2741)
!2751 = !DILocation(line: 627, column: 9, scope: !2752)
!2752 = distinct !DILexicalBlock(scope: !2587, file: !24, line: 627, column: 2)
!2753 = !DILocation(line: 627, column: 7, scope: !2752)
!2754 = !DILocation(line: 627, column: 14, scope: !2755)
!2755 = distinct !DILexicalBlock(scope: !2752, file: !24, line: 627, column: 2)
!2756 = !DILocation(line: 627, column: 16, scope: !2755)
!2757 = !DILocation(line: 627, column: 2, scope: !2752)
!2758 = !DILocation(line: 628, column: 20, scope: !2759)
!2759 = distinct !DILexicalBlock(scope: !2755, file: !24, line: 627, column: 26)
!2760 = !DILocation(line: 628, column: 25, scope: !2759)
!2761 = !DILocation(line: 628, column: 31, scope: !2759)
!2762 = !DILocation(line: 628, column: 37, scope: !2759)
!2763 = !DILocation(line: 628, column: 42, scope: !2759)
!2764 = !DILocation(line: 628, column: 45, scope: !2759)
!2765 = !DILocation(line: 628, column: 3, scope: !2759)
!2766 = !DILocation(line: 628, column: 6, scope: !2759)
!2767 = !DILocation(line: 628, column: 15, scope: !2759)
!2768 = !DILocation(line: 628, column: 18, scope: !2759)
!2769 = !DILocation(line: 629, column: 19, scope: !2759)
!2770 = !DILocation(line: 629, column: 26, scope: !2759)
!2771 = !DILocation(line: 629, column: 32, scope: !2759)
!2772 = !DILocation(line: 629, column: 45, scope: !2759)
!2773 = !DILocation(line: 629, column: 50, scope: !2759)
!2774 = !DILocation(line: 629, column: 53, scope: !2759)
!2775 = !DILocation(line: 629, column: 3, scope: !2759)
!2776 = !DILocation(line: 629, column: 6, scope: !2759)
!2777 = !DILocation(line: 629, column: 14, scope: !2759)
!2778 = !DILocation(line: 629, column: 17, scope: !2759)
!2779 = !DILocation(line: 630, column: 2, scope: !2759)
!2780 = !DILocation(line: 627, column: 22, scope: !2755)
!2781 = !DILocation(line: 627, column: 2, scope: !2755)
!2782 = distinct !{!2782, !2757, !2783, !1964}
!2783 = !DILocation(line: 630, column: 2, scope: !2752)
!2784 = !DILocation(line: 631, column: 1, scope: !2587)
!2785 = distinct !DISubprogram(name: "wall_close_door_num", linkageName: "_Z19wall_close_door_numi", scope: !24, file: !24, line: 636, type: !845, scopeLine: 637, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!2786 = !DILocalVariable(name: "door_num", arg: 1, scope: !2785, file: !24, line: 636, type: !7)
!2787 = !DILocation(line: 636, column: 30, scope: !2785)
!2788 = !DILocalVariable(name: "p", scope: !2785, file: !24, line: 638, type: !7)
!2789 = !DILocation(line: 638, column: 6, scope: !2785)
!2790 = !DILocalVariable(name: "d", scope: !2785, file: !24, line: 639, type: !2140)
!2791 = !DILocation(line: 639, column: 15, scope: !2785)
!2792 = !DILocalVariable(name: "i", scope: !2785, file: !24, line: 640, type: !7)
!2793 = !DILocation(line: 640, column: 6, scope: !2785)
!2794 = !DILocation(line: 642, column: 19, scope: !2785)
!2795 = !DILocation(line: 642, column: 7, scope: !2785)
!2796 = !DILocation(line: 642, column: 4, scope: !2785)
!2797 = !DILocation(line: 644, column: 9, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2785, file: !24, line: 644, column: 2)
!2799 = !DILocation(line: 644, column: 7, scope: !2798)
!2800 = !DILocation(line: 644, column: 14, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2798, file: !24, line: 644, column: 2)
!2802 = !DILocation(line: 644, column: 18, scope: !2801)
!2803 = !DILocation(line: 644, column: 21, scope: !2801)
!2804 = !DILocation(line: 644, column: 16, scope: !2801)
!2805 = !DILocation(line: 644, column: 2, scope: !2798)
!2806 = !DILocalVariable(name: "w", scope: !2807, file: !24, line: 645, type: !2137)
!2807 = distinct !DILexicalBlock(scope: !2801, file: !24, line: 644, column: 35)
!2808 = !DILocation(line: 645, column: 9, scope: !2807)
!2809 = !DILocalVariable(name: "Connectside", scope: !2807, file: !24, line: 646, type: !7)
!2810 = !DILocation(line: 646, column: 7, scope: !2807)
!2811 = !DILocalVariable(name: "side", scope: !2807, file: !24, line: 646, type: !7)
!2812 = !DILocation(line: 646, column: 20, scope: !2807)
!2813 = !DILocalVariable(name: "csegp", scope: !2807, file: !24, line: 647, type: !1558)
!2814 = !DILocation(line: 647, column: 12, scope: !2807)
!2815 = !DILocalVariable(name: "seg", scope: !2807, file: !24, line: 647, type: !1558)
!2816 = !DILocation(line: 647, column: 21, scope: !2807)
!2817 = !DILocation(line: 649, column: 14, scope: !2807)
!2818 = !DILocation(line: 649, column: 17, scope: !2807)
!2819 = !DILocation(line: 649, column: 31, scope: !2807)
!2820 = !DILocation(line: 649, column: 8, scope: !2807)
!2821 = !DILocation(line: 649, column: 5, scope: !2807)
!2822 = !DILocation(line: 651, column: 19, scope: !2807)
!2823 = !DILocation(line: 651, column: 22, scope: !2807)
!2824 = !DILocation(line: 651, column: 10, scope: !2807)
!2825 = !DILocation(line: 651, column: 7, scope: !2807)
!2826 = !DILocation(line: 652, column: 10, scope: !2807)
!2827 = !DILocation(line: 652, column: 13, scope: !2807)
!2828 = !DILocation(line: 652, column: 8, scope: !2807)
!2829 = !DILocation(line: 654, column: 3, scope: !2807)
!2830 = !DILocation(line: 656, column: 21, scope: !2807)
!2831 = !DILocation(line: 656, column: 26, scope: !2807)
!2832 = !DILocation(line: 656, column: 35, scope: !2807)
!2833 = !DILocation(line: 656, column: 12, scope: !2807)
!2834 = !DILocation(line: 656, column: 9, scope: !2807)
!2835 = !DILocation(line: 657, column: 35, scope: !2807)
!2836 = !DILocation(line: 657, column: 40, scope: !2807)
!2837 = !DILocation(line: 657, column: 17, scope: !2807)
!2838 = !DILocation(line: 657, column: 15, scope: !2807)
!2839 = !DILocation(line: 658, column: 3, scope: !2807)
!2840 = !DILocation(line: 660, column: 9, scope: !2807)
!2841 = !DILocation(line: 660, column: 14, scope: !2807)
!2842 = !DILocation(line: 660, column: 20, scope: !2807)
!2843 = !DILocation(line: 660, column: 26, scope: !2807)
!2844 = !DILocation(line: 660, column: 3, scope: !2807)
!2845 = !DILocation(line: 660, column: 36, scope: !2807)
!2846 = !DILocation(line: 660, column: 42, scope: !2807)
!2847 = !DILocation(line: 661, column: 9, scope: !2807)
!2848 = !DILocation(line: 661, column: 16, scope: !2807)
!2849 = !DILocation(line: 661, column: 22, scope: !2807)
!2850 = !DILocation(line: 661, column: 35, scope: !2807)
!2851 = !DILocation(line: 661, column: 3, scope: !2807)
!2852 = !DILocation(line: 661, column: 45, scope: !2807)
!2853 = !DILocation(line: 661, column: 51, scope: !2807)
!2854 = !DILocation(line: 663, column: 21, scope: !2807)
!2855 = !DILocation(line: 663, column: 26, scope: !2807)
!2856 = !DILocation(line: 663, column: 32, scope: !2807)
!2857 = !DILocation(line: 663, column: 39, scope: !2807)
!2858 = !DILocation(line: 663, column: 52, scope: !2807)
!2859 = !DILocation(line: 663, column: 55, scope: !2807)
!2860 = !DILocation(line: 663, column: 3, scope: !2807)
!2861 = !DILocation(line: 665, column: 2, scope: !2807)
!2862 = !DILocation(line: 644, column: 31, scope: !2801)
!2863 = !DILocation(line: 644, column: 2, scope: !2801)
!2864 = distinct !{!2864, !2805, !2865, !1964}
!2865 = !DILocation(line: 665, column: 2, scope: !2798)
!2866 = !DILocation(line: 667, column: 11, scope: !2867)
!2867 = distinct !DILexicalBlock(scope: !2785, file: !24, line: 667, column: 2)
!2868 = !DILocation(line: 667, column: 9, scope: !2867)
!2869 = !DILocation(line: 667, column: 7, scope: !2867)
!2870 = !DILocation(line: 667, column: 21, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2867, file: !24, line: 667, column: 2)
!2872 = !DILocation(line: 667, column: 25, scope: !2871)
!2873 = !DILocation(line: 667, column: 23, scope: !2871)
!2874 = !DILocation(line: 667, column: 2, scope: !2867)
!2875 = !DILocation(line: 668, column: 32, scope: !2871)
!2876 = !DILocation(line: 668, column: 34, scope: !2871)
!2877 = !DILocation(line: 668, column: 20, scope: !2871)
!2878 = !DILocation(line: 668, column: 15, scope: !2871)
!2879 = !DILocation(line: 668, column: 3, scope: !2871)
!2880 = !DILocation(line: 668, column: 18, scope: !2871)
!2881 = !DILocation(line: 667, column: 42, scope: !2871)
!2882 = !DILocation(line: 667, column: 2, scope: !2871)
!2883 = distinct !{!2883, !2874, !2884, !1964}
!2884 = !DILocation(line: 668, column: 37, scope: !2867)
!2885 = !DILocation(line: 670, column: 16, scope: !2785)
!2886 = !DILocation(line: 672, column: 1, scope: !2785)
!2887 = distinct !DISubprogram(name: "check_poke", linkageName: "_Z10check_pokeiii", scope: !24, file: !24, line: 674, type: !2888, scopeLine: 675, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!2888 = !DISubroutineType(types: !2889)
!2889 = !{!7, !7, !7, !7}
!2890 = !DILocalVariable(name: "objnum", arg: 1, scope: !2887, file: !24, line: 674, type: !7)
!2891 = !DILocation(line: 674, column: 20, scope: !2887)
!2892 = !DILocalVariable(name: "segnum", arg: 2, scope: !2887, file: !24, line: 674, type: !7)
!2893 = !DILocation(line: 674, column: 32, scope: !2887)
!2894 = !DILocalVariable(name: "side", arg: 3, scope: !2887, file: !24, line: 674, type: !7)
!2895 = !DILocation(line: 674, column: 44, scope: !2887)
!2896 = !DILocalVariable(name: "obj", scope: !2887, file: !24, line: 676, type: !2897)
!2897 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2898, size: 64)
!2898 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !2899, line: 259, baseType: !2900)
!2899 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!2900 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !2899, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !2901, identifier: "_ZTS6object")
!2901 = !{!2902, !2903, !2904, !2905, !2906, !2907, !2908, !2909, !2910, !2911, !2912, !2913, !2914, !2921, !2922, !2923, !2924, !2925, !2926, !2927, !2928, !2929, !2947, !3001}
!2902 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !2900, file: !2899, line: 212, baseType: !7, size: 32)
!2903 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2900, file: !2899, line: 213, baseType: !249, size: 8, offset: 32)
!2904 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !2900, file: !2899, line: 214, baseType: !249, size: 8, offset: 40)
!2905 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !2900, file: !2899, line: 215, baseType: !34, size: 16, offset: 48)
!2906 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !2900, file: !2899, line: 215, baseType: !34, size: 16, offset: 64)
!2907 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !2900, file: !2899, line: 216, baseType: !249, size: 8, offset: 80)
!2908 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !2900, file: !2899, line: 217, baseType: !249, size: 8, offset: 88)
!2909 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !2900, file: !2899, line: 218, baseType: !249, size: 8, offset: 96)
!2910 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2900, file: !2899, line: 219, baseType: !249, size: 8, offset: 104)
!2911 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !2900, file: !2899, line: 220, baseType: !34, size: 16, offset: 112)
!2912 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !2900, file: !2899, line: 221, baseType: !34, size: 16, offset: 128)
!2913 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2900, file: !2899, line: 222, baseType: !1583, size: 96, offset: 160)
!2914 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !2900, file: !2899, line: 223, baseType: !2915, size: 288, offset: 256)
!2915 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !1584, line: 47, baseType: !2916)
!2916 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !1584, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !2917, identifier: "_ZTS10vms_matrix")
!2917 = !{!2918, !2919, !2920}
!2918 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !2916, file: !1584, line: 46, baseType: !1583, size: 96)
!2919 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !2916, file: !1584, line: 46, baseType: !1583, size: 96, offset: 96)
!2920 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !2916, file: !1584, line: 46, baseType: !1583, size: 96, offset: 192)
!2921 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !2900, file: !2899, line: 224, baseType: !14, size: 32, offset: 544)
!2922 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !2900, file: !2899, line: 225, baseType: !14, size: 32, offset: 576)
!2923 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !2900, file: !2899, line: 226, baseType: !1583, size: 96, offset: 608)
!2924 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !2900, file: !2899, line: 227, baseType: !239, size: 8, offset: 704)
!2925 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !2900, file: !2899, line: 228, baseType: !239, size: 8, offset: 712)
!2926 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !2900, file: !2899, line: 229, baseType: !239, size: 8, offset: 720)
!2927 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !2900, file: !2899, line: 230, baseType: !239, size: 8, offset: 728)
!2928 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !2900, file: !2899, line: 231, baseType: !14, size: 32, offset: 736)
!2929 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !2900, file: !2899, line: 240, baseType: !2930, size: 512, offset: 768)
!2930 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2900, file: !2899, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !2931, identifier: "_ZTSN6objectUt_E")
!2931 = !{!2932, !2946}
!2932 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !2930, file: !2899, line: 238, baseType: !2933, size: 512)
!2933 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !2899, line: 153, baseType: !2934)
!2934 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !2899, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !2935, identifier: "_ZTS12physics_info")
!2935 = !{!2936, !2937, !2938, !2939, !2940, !2941, !2942, !2943, !2945}
!2936 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !2934, file: !2899, line: 144, baseType: !1583, size: 96)
!2937 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !2934, file: !2899, line: 145, baseType: !1583, size: 96, offset: 96)
!2938 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !2934, file: !2899, line: 146, baseType: !14, size: 32, offset: 192)
!2939 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !2934, file: !2899, line: 147, baseType: !14, size: 32, offset: 224)
!2940 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !2934, file: !2899, line: 148, baseType: !14, size: 32, offset: 256)
!2941 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !2934, file: !2899, line: 149, baseType: !1583, size: 96, offset: 288)
!2942 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !2934, file: !2899, line: 150, baseType: !1583, size: 96, offset: 384)
!2943 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !2934, file: !2899, line: 151, baseType: !2944, size: 16, offset: 480)
!2944 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !15, line: 21, baseType: !34)
!2945 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2934, file: !2899, line: 152, baseType: !253, size: 16, offset: 496)
!2946 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !2930, file: !2899, line: 239, baseType: !1583, size: 96)
!2947 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !2900, file: !2899, line: 250, baseType: !2948, size: 256, offset: 1280)
!2948 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2900, file: !2899, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !2949, identifier: "_ZTSN6objectUt0_E")
!2949 = !{!2950, !2961, !2971, !2989, !2994}
!2950 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !2948, file: !2899, line: 245, baseType: !2951, size: 160)
!2951 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !2899, line: 166, baseType: !2952)
!2952 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !2899, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !2953, identifier: "_ZTS12laser_info_s")
!2953 = !{!2954, !2955, !2956, !2957, !2958, !2959, !2960}
!2954 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !2952, file: !2899, line: 159, baseType: !34, size: 16)
!2955 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !2952, file: !2899, line: 160, baseType: !34, size: 16, offset: 16)
!2956 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !2952, file: !2899, line: 161, baseType: !7, size: 32, offset: 32)
!2957 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2952, file: !2899, line: 162, baseType: !14, size: 32, offset: 64)
!2958 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !2952, file: !2899, line: 163, baseType: !34, size: 16, offset: 96)
!2959 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !2952, file: !2899, line: 164, baseType: !34, size: 16, offset: 112)
!2960 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !2952, file: !2899, line: 165, baseType: !14, size: 32, offset: 128)
!2961 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !2948, file: !2899, line: 246, baseType: !2962, size: 128)
!2962 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !2899, line: 176, baseType: !2963)
!2963 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !2899, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !2964, identifier: "_ZTS14explosion_info")
!2964 = !{!2965, !2966, !2967, !2968, !2969, !2970}
!2965 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !2963, file: !2899, line: 170, baseType: !14, size: 32)
!2966 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !2963, file: !2899, line: 171, baseType: !14, size: 32, offset: 32)
!2967 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !2963, file: !2899, line: 172, baseType: !34, size: 16, offset: 64)
!2968 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !2963, file: !2899, line: 173, baseType: !34, size: 16, offset: 80)
!2969 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !2963, file: !2899, line: 174, baseType: !34, size: 16, offset: 96)
!2970 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !2963, file: !2899, line: 175, baseType: !34, size: 16, offset: 112)
!2971 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !2948, file: !2899, line: 247, baseType: !2972, size: 256)
!2972 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !2973, line: 144, baseType: !2974)
!2973 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!2974 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !2973, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !2975, identifier: "_ZTS9ai_static")
!2975 = !{!2976, !2977, !2981, !2982, !2983, !2984, !2985, !2986, !2987, !2988}
!2976 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !2974, file: !2973, line: 128, baseType: !249, size: 8)
!2977 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2974, file: !2973, line: 129, baseType: !2978, size: 88, offset: 8)
!2978 = !DICompositeType(tag: DW_TAG_array_type, baseType: !239, size: 88, elements: !2979)
!2979 = !{!2980}
!2980 = !DISubrange(count: 11)
!2981 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !2974, file: !2973, line: 130, baseType: !34, size: 16, offset: 96)
!2982 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !2974, file: !2973, line: 131, baseType: !34, size: 16, offset: 112)
!2983 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !2974, file: !2973, line: 132, baseType: !34, size: 16, offset: 128)
!2984 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !2974, file: !2973, line: 133, baseType: !239, size: 8, offset: 144)
!2985 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !2974, file: !2973, line: 134, baseType: !239, size: 8, offset: 152)
!2986 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !2974, file: !2973, line: 139, baseType: !34, size: 16, offset: 160)
!2987 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !2974, file: !2973, line: 140, baseType: !7, size: 32, offset: 192)
!2988 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !2974, file: !2973, line: 141, baseType: !14, size: 32, offset: 224)
!2989 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !2948, file: !2899, line: 248, baseType: !2990, size: 32)
!2990 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !2899, line: 181, baseType: !2991)
!2991 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !2899, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !2992, identifier: "_ZTS12light_info_s")
!2992 = !{!2993}
!2993 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !2991, file: !2899, line: 180, baseType: !14, size: 32)
!2994 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !2948, file: !2899, line: 249, baseType: !2995, size: 96)
!2995 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !2899, line: 190, baseType: !2996)
!2996 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !2899, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !2997, identifier: "_ZTS14powerup_info_s")
!2997 = !{!2998, !2999, !3000}
!2998 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !2996, file: !2899, line: 187, baseType: !7, size: 32)
!2999 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2996, file: !2899, line: 188, baseType: !14, size: 32, offset: 32)
!3000 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2996, file: !2899, line: 189, baseType: !7, size: 32, offset: 64)
!3001 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !2900, file: !2899, line: 257, baseType: !3002, size: 608, offset: 1536)
!3002 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2900, file: !2899, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !3003, identifier: "_ZTSN6objectUt1_E")
!3003 = !{!3004, !3020}
!3004 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !3002, file: !2899, line: 255, baseType: !3005, size: 608)
!3005 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !2899, line: 208, baseType: !3006)
!3006 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !2899, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !3007, identifier: "_ZTS12polyobj_info")
!3007 = !{!3008, !3009, !3017, !3018, !3019}
!3008 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !3006, file: !2899, line: 203, baseType: !7, size: 32)
!3009 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !3006, file: !2899, line: 204, baseType: !3010, size: 480, offset: 32)
!3010 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3011, size: 480, elements: !83)
!3011 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !1584, line: 40, baseType: !3012)
!3012 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !1584, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !3013, identifier: "_ZTS10vms_angvec")
!3013 = !{!3014, !3015, !3016}
!3014 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !3012, file: !1584, line: 39, baseType: !2944, size: 16)
!3015 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !3012, file: !1584, line: 39, baseType: !2944, size: 16, offset: 16)
!3016 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !3012, file: !1584, line: 39, baseType: !2944, size: 16, offset: 32)
!3017 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !3006, file: !2899, line: 205, baseType: !7, size: 32, offset: 512)
!3018 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !3006, file: !2899, line: 206, baseType: !7, size: 32, offset: 544)
!3019 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !3006, file: !2899, line: 207, baseType: !7, size: 32, offset: 576)
!3020 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !3002, file: !2899, line: 256, baseType: !3021, size: 96)
!3021 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !2899, line: 197, baseType: !3022)
!3022 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !2899, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !3023, identifier: "_ZTS12vclip_info_s")
!3023 = !{!3024, !3025, !3026}
!3024 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !3022, file: !2899, line: 194, baseType: !7, size: 32)
!3025 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !3022, file: !2899, line: 195, baseType: !14, size: 32, offset: 32)
!3026 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !3022, file: !2899, line: 196, baseType: !239, size: 8, offset: 64)
!3027 = !DILocation(line: 676, column: 10, scope: !2887)
!3028 = !DILocation(line: 676, column: 25, scope: !2887)
!3029 = !DILocation(line: 676, column: 17, scope: !2887)
!3030 = !DILocation(line: 680, column: 6, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !2887, file: !24, line: 680, column: 6)
!3032 = !DILocation(line: 680, column: 11, scope: !3031)
!3033 = !DILocation(line: 680, column: 16, scope: !3031)
!3034 = !DILocation(line: 680, column: 34, scope: !3031)
!3035 = !DILocation(line: 680, column: 39, scope: !3031)
!3036 = !DILocation(line: 680, column: 44, scope: !3031)
!3037 = !DILocation(line: 680, column: 52, scope: !3031)
!3038 = !DILocation(line: 680, column: 57, scope: !3031)
!3039 = !DILocation(line: 680, column: 19, scope: !3031)
!3040 = !DILocation(line: 680, column: 63, scope: !3031)
!3041 = !DILocation(line: 680, column: 80, scope: !3031)
!3042 = !DILocation(line: 680, column: 77, scope: !3031)
!3043 = !DILocation(line: 680, column: 72, scope: !3031)
!3044 = !DILocation(line: 0, scope: !3031)
!3045 = !DILocation(line: 681, column: 3, scope: !3031)
!3046 = !DILocation(line: 683, column: 3, scope: !3031)
!3047 = !DILocation(line: 685, column: 1, scope: !2887)
!3048 = distinct !DISubprogram(name: "is_door_free", linkageName: "_Z12is_door_freeP7segmenti", scope: !24, file: !24, line: 688, type: !1556, scopeLine: 689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3049 = !DILocalVariable(name: "seg", arg: 1, scope: !3048, file: !24, line: 688, type: !1558)
!3050 = !DILocation(line: 688, column: 27, scope: !3048)
!3051 = !DILocalVariable(name: "side", arg: 2, scope: !3048, file: !24, line: 688, type: !7)
!3052 = !DILocation(line: 688, column: 36, scope: !3048)
!3053 = !DILocalVariable(name: "Connectside", scope: !3048, file: !24, line: 696, type: !7)
!3054 = !DILocation(line: 696, column: 6, scope: !3048)
!3055 = !DILocalVariable(name: "csegp", scope: !3048, file: !24, line: 697, type: !1558)
!3056 = !DILocation(line: 697, column: 11, scope: !3048)
!3057 = !DILocalVariable(name: "objnum", scope: !3048, file: !24, line: 698, type: !7)
!3058 = !DILocation(line: 698, column: 6, scope: !3048)
!3059 = !DILocation(line: 700, column: 20, scope: !3048)
!3060 = !DILocation(line: 700, column: 25, scope: !3048)
!3061 = !DILocation(line: 700, column: 34, scope: !3048)
!3062 = !DILocation(line: 700, column: 11, scope: !3048)
!3063 = !DILocation(line: 700, column: 8, scope: !3048)
!3064 = !DILocation(line: 701, column: 34, scope: !3048)
!3065 = !DILocation(line: 701, column: 39, scope: !3048)
!3066 = !DILocation(line: 701, column: 16, scope: !3048)
!3067 = !DILocation(line: 701, column: 14, scope: !3048)
!3068 = !DILocation(line: 702, column: 2, scope: !3048)
!3069 = !DILocation(line: 707, column: 16, scope: !3070)
!3070 = distinct !DILexicalBlock(scope: !3048, file: !24, line: 707, column: 2)
!3071 = !DILocation(line: 707, column: 21, scope: !3070)
!3072 = !DILocation(line: 707, column: 14, scope: !3070)
!3073 = !DILocation(line: 707, column: 7, scope: !3070)
!3074 = !DILocation(line: 707, column: 30, scope: !3075)
!3075 = distinct !DILexicalBlock(scope: !3070, file: !24, line: 707, column: 2)
!3076 = !DILocation(line: 707, column: 37, scope: !3075)
!3077 = !DILocation(line: 707, column: 2, scope: !3070)
!3078 = !DILocation(line: 708, column: 15, scope: !3079)
!3079 = distinct !DILexicalBlock(scope: !3075, file: !24, line: 708, column: 7)
!3080 = !DILocation(line: 708, column: 7, scope: !3079)
!3081 = !DILocation(line: 708, column: 23, scope: !3079)
!3082 = !DILocation(line: 708, column: 28, scope: !3079)
!3083 = !DILocation(line: 708, column: 42, scope: !3079)
!3084 = !DILocation(line: 708, column: 53, scope: !3079)
!3085 = !DILocation(line: 708, column: 45, scope: !3079)
!3086 = !DILocation(line: 708, column: 61, scope: !3079)
!3087 = !DILocation(line: 708, column: 66, scope: !3079)
!3088 = !DILocation(line: 708, column: 82, scope: !3079)
!3089 = !DILocation(line: 708, column: 96, scope: !3079)
!3090 = !DILocation(line: 708, column: 104, scope: !3079)
!3091 = !DILocation(line: 708, column: 108, scope: !3079)
!3092 = !DILocation(line: 708, column: 120, scope: !3079)
!3093 = !DILocation(line: 708, column: 85, scope: !3079)
!3094 = !DILocation(line: 709, column: 4, scope: !3079)
!3095 = !DILocation(line: 708, column: 124, scope: !3079)
!3096 = !DILocation(line: 707, column: 61, scope: !3075)
!3097 = !DILocation(line: 707, column: 53, scope: !3075)
!3098 = !DILocation(line: 707, column: 69, scope: !3075)
!3099 = !DILocation(line: 707, column: 51, scope: !3075)
!3100 = !DILocation(line: 707, column: 2, scope: !3075)
!3101 = distinct !{!3101, !3077, !3102, !1964}
!3102 = !DILocation(line: 709, column: 11, scope: !3070)
!3103 = !DILocation(line: 711, column: 16, scope: !3104)
!3104 = distinct !DILexicalBlock(scope: !3048, file: !24, line: 711, column: 2)
!3105 = !DILocation(line: 711, column: 23, scope: !3104)
!3106 = !DILocation(line: 711, column: 14, scope: !3104)
!3107 = !DILocation(line: 711, column: 7, scope: !3104)
!3108 = !DILocation(line: 711, column: 32, scope: !3109)
!3109 = distinct !DILexicalBlock(scope: !3104, file: !24, line: 711, column: 2)
!3110 = !DILocation(line: 711, column: 39, scope: !3109)
!3111 = !DILocation(line: 711, column: 2, scope: !3104)
!3112 = !DILocation(line: 712, column: 15, scope: !3113)
!3113 = distinct !DILexicalBlock(scope: !3109, file: !24, line: 712, column: 7)
!3114 = !DILocation(line: 712, column: 7, scope: !3113)
!3115 = !DILocation(line: 712, column: 23, scope: !3113)
!3116 = !DILocation(line: 712, column: 28, scope: !3113)
!3117 = !DILocation(line: 712, column: 42, scope: !3113)
!3118 = !DILocation(line: 712, column: 53, scope: !3113)
!3119 = !DILocation(line: 712, column: 45, scope: !3113)
!3120 = !DILocation(line: 712, column: 61, scope: !3113)
!3121 = !DILocation(line: 712, column: 66, scope: !3113)
!3122 = !DILocation(line: 712, column: 82, scope: !3113)
!3123 = !DILocation(line: 712, column: 96, scope: !3113)
!3124 = !DILocation(line: 712, column: 104, scope: !3113)
!3125 = !DILocation(line: 712, column: 110, scope: !3113)
!3126 = !DILocation(line: 712, column: 122, scope: !3113)
!3127 = !DILocation(line: 712, column: 85, scope: !3113)
!3128 = !DILocation(line: 713, column: 4, scope: !3113)
!3129 = !DILocation(line: 712, column: 133, scope: !3113)
!3130 = !DILocation(line: 711, column: 63, scope: !3109)
!3131 = !DILocation(line: 711, column: 55, scope: !3109)
!3132 = !DILocation(line: 711, column: 71, scope: !3109)
!3133 = !DILocation(line: 711, column: 53, scope: !3109)
!3134 = !DILocation(line: 711, column: 2, scope: !3109)
!3135 = distinct !{!3135, !3111, !3136, !1964}
!3136 = !DILocation(line: 713, column: 11, scope: !3104)
!3137 = !DILocation(line: 715, column: 2, scope: !3048)
!3138 = !DILocation(line: 716, column: 1, scope: !3048)
!3139 = distinct !DISubprogram(name: "wall_close_door", linkageName: "_Z15wall_close_doorP7segmenti", scope: !24, file: !24, line: 722, type: !1815, scopeLine: 723, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3140 = !DILocalVariable(name: "seg", arg: 1, scope: !3139, file: !24, line: 722, type: !1558)
!3141 = !DILocation(line: 722, column: 31, scope: !3139)
!3142 = !DILocalVariable(name: "side", arg: 2, scope: !3139, file: !24, line: 722, type: !7)
!3143 = !DILocation(line: 722, column: 40, scope: !3139)
!3144 = !DILocalVariable(name: "w", scope: !3139, file: !24, line: 724, type: !2137)
!3145 = !DILocation(line: 724, column: 8, scope: !3139)
!3146 = !DILocalVariable(name: "d", scope: !3139, file: !24, line: 725, type: !2140)
!3147 = !DILocation(line: 725, column: 15, scope: !3139)
!3148 = !DILocalVariable(name: "Connectside", scope: !3139, file: !24, line: 726, type: !7)
!3149 = !DILocation(line: 726, column: 6, scope: !3139)
!3150 = !DILocalVariable(name: "csegp", scope: !3139, file: !24, line: 727, type: !1558)
!3151 = !DILocation(line: 727, column: 11, scope: !3139)
!3152 = !DILocation(line: 729, column: 2, scope: !3139)
!3153 = !DILocation(line: 731, column: 13, scope: !3139)
!3154 = !DILocation(line: 731, column: 18, scope: !3139)
!3155 = !DILocation(line: 731, column: 24, scope: !3139)
!3156 = !DILocation(line: 731, column: 30, scope: !3139)
!3157 = !DILocation(line: 731, column: 7, scope: !3139)
!3158 = !DILocation(line: 731, column: 4, scope: !3139)
!3159 = !DILocation(line: 733, column: 7, scope: !3160)
!3160 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 733, column: 6)
!3161 = !DILocation(line: 733, column: 10, scope: !3160)
!3162 = !DILocation(line: 733, column: 16, scope: !3160)
!3163 = !DILocation(line: 733, column: 38, scope: !3160)
!3164 = !DILocation(line: 734, column: 4, scope: !3160)
!3165 = !DILocation(line: 734, column: 7, scope: !3160)
!3166 = !DILocation(line: 734, column: 13, scope: !3160)
!3167 = !DILocation(line: 734, column: 35, scope: !3160)
!3168 = !DILocation(line: 735, column: 4, scope: !3160)
!3169 = !DILocation(line: 735, column: 7, scope: !3160)
!3170 = !DILocation(line: 735, column: 13, scope: !3160)
!3171 = !DILocation(line: 736, column: 3, scope: !3160)
!3172 = !DILocation(line: 738, column: 20, scope: !3173)
!3173 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 738, column: 6)
!3174 = !DILocation(line: 738, column: 25, scope: !3173)
!3175 = !DILocation(line: 738, column: 7, scope: !3173)
!3176 = !DILocation(line: 738, column: 6, scope: !3173)
!3177 = !DILocation(line: 739, column: 3, scope: !3173)
!3178 = !DILocation(line: 741, column: 6, scope: !3179)
!3179 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 741, column: 6)
!3180 = !DILocation(line: 741, column: 9, scope: !3179)
!3181 = !DILocation(line: 741, column: 15, scope: !3179)
!3182 = !DILocalVariable(name: "i", scope: !3183, file: !24, line: 743, type: !7)
!3183 = distinct !DILexicalBlock(scope: !3179, file: !24, line: 741, column: 37)
!3184 = !DILocation(line: 743, column: 7, scope: !3183)
!3185 = !DILocation(line: 745, column: 5, scope: !3183)
!3186 = !DILocation(line: 747, column: 10, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3183, file: !24, line: 747, column: 3)
!3188 = !DILocation(line: 747, column: 8, scope: !3187)
!3189 = !DILocation(line: 747, column: 15, scope: !3190)
!3190 = distinct !DILexicalBlock(scope: !3187, file: !24, line: 747, column: 3)
!3191 = !DILocation(line: 747, column: 19, scope: !3190)
!3192 = !DILocation(line: 747, column: 17, scope: !3190)
!3193 = !DILocation(line: 747, column: 3, scope: !3187)
!3194 = !DILocation(line: 749, column: 21, scope: !3195)
!3195 = distinct !DILexicalBlock(scope: !3190, file: !24, line: 747, column: 40)
!3196 = !DILocation(line: 749, column: 9, scope: !3195)
!3197 = !DILocation(line: 749, column: 6, scope: !3195)
!3198 = !DILocation(line: 751, column: 8, scope: !3199)
!3199 = distinct !DILexicalBlock(scope: !3195, file: !24, line: 751, column: 8)
!3200 = !DILocation(line: 751, column: 11, scope: !3199)
!3201 = !DILocation(line: 751, column: 31, scope: !3199)
!3202 = !DILocation(line: 751, column: 33, scope: !3199)
!3203 = !DILocation(line: 751, column: 28, scope: !3199)
!3204 = !DILocation(line: 751, column: 41, scope: !3199)
!3205 = !DILocation(line: 751, column: 44, scope: !3199)
!3206 = !DILocation(line: 751, column: 47, scope: !3199)
!3207 = !DILocation(line: 751, column: 66, scope: !3199)
!3208 = !DILocation(line: 751, column: 68, scope: !3199)
!3209 = !DILocation(line: 751, column: 63, scope: !3199)
!3210 = !DILocation(line: 751, column: 76, scope: !3199)
!3211 = !DILocation(line: 751, column: 80, scope: !3199)
!3212 = !DILocation(line: 751, column: 83, scope: !3199)
!3213 = !DILocation(line: 751, column: 91, scope: !3199)
!3214 = !DILocation(line: 751, column: 96, scope: !3199)
!3215 = !DILocation(line: 751, column: 100, scope: !3199)
!3216 = !DILocation(line: 751, column: 103, scope: !3199)
!3217 = !DILocation(line: 751, column: 123, scope: !3199)
!3218 = !DILocation(line: 751, column: 125, scope: !3199)
!3219 = !DILocation(line: 751, column: 120, scope: !3199)
!3220 = !DILocation(line: 751, column: 133, scope: !3199)
!3221 = !DILocation(line: 751, column: 136, scope: !3199)
!3222 = !DILocation(line: 751, column: 139, scope: !3199)
!3223 = !DILocation(line: 751, column: 158, scope: !3199)
!3224 = !DILocation(line: 751, column: 160, scope: !3199)
!3225 = !DILocation(line: 751, column: 155, scope: !3199)
!3226 = !DILocation(line: 752, column: 5, scope: !3199)
!3227 = !DILocation(line: 753, column: 3, scope: !3195)
!3228 = !DILocation(line: 747, column: 36, scope: !3190)
!3229 = !DILocation(line: 747, column: 3, scope: !3190)
!3230 = distinct !{!3230, !3193, !3231, !1964}
!3231 = !DILocation(line: 753, column: 3, scope: !3187)
!3232 = !DILocation(line: 755, column: 3, scope: !3183)
!3233 = !DILocation(line: 756, column: 3, scope: !3183)
!3234 = !DILocation(line: 758, column: 23, scope: !3183)
!3235 = !DILocation(line: 758, column: 26, scope: !3183)
!3236 = !DILocation(line: 758, column: 13, scope: !3183)
!3237 = !DILocation(line: 758, column: 36, scope: !3183)
!3238 = !DILocation(line: 758, column: 48, scope: !3183)
!3239 = !DILocation(line: 758, column: 51, scope: !3183)
!3240 = !DILocation(line: 758, column: 46, scope: !3183)
!3241 = !DILocation(line: 758, column: 3, scope: !3183)
!3242 = !DILocation(line: 758, column: 6, scope: !3183)
!3243 = !DILocation(line: 758, column: 11, scope: !3183)
!3244 = !DILocation(line: 760, column: 7, scope: !3245)
!3245 = distinct !DILexicalBlock(scope: !3183, file: !24, line: 760, column: 7)
!3246 = !DILocation(line: 760, column: 10, scope: !3245)
!3247 = !DILocation(line: 760, column: 15, scope: !3245)
!3248 = !DILocation(line: 761, column: 4, scope: !3245)
!3249 = !DILocation(line: 761, column: 7, scope: !3245)
!3250 = !DILocation(line: 761, column: 12, scope: !3245)
!3251 = !DILocation(line: 763, column: 2, scope: !3183)
!3252 = !DILocation(line: 765, column: 3, scope: !3253)
!3253 = distinct !DILexicalBlock(scope: !3179, file: !24, line: 764, column: 7)
!3254 = !DILocation(line: 766, column: 20, scope: !3253)
!3255 = !DILocation(line: 766, column: 8, scope: !3253)
!3256 = !DILocation(line: 766, column: 5, scope: !3253)
!3257 = !DILocation(line: 767, column: 3, scope: !3253)
!3258 = !DILocation(line: 767, column: 6, scope: !3253)
!3259 = !DILocation(line: 767, column: 11, scope: !3253)
!3260 = !DILocation(line: 768, column: 17, scope: !3253)
!3261 = !DILocation(line: 769, column: 3, scope: !3253)
!3262 = !DILocation(line: 772, column: 2, scope: !3139)
!3263 = !DILocation(line: 772, column: 5, scope: !3139)
!3264 = !DILocation(line: 772, column: 11, scope: !3139)
!3265 = !DILocation(line: 775, column: 20, scope: !3139)
!3266 = !DILocation(line: 775, column: 25, scope: !3139)
!3267 = !DILocation(line: 775, column: 34, scope: !3139)
!3268 = !DILocation(line: 775, column: 11, scope: !3139)
!3269 = !DILocation(line: 775, column: 8, scope: !3139)
!3270 = !DILocation(line: 776, column: 34, scope: !3139)
!3271 = !DILocation(line: 776, column: 39, scope: !3139)
!3272 = !DILocation(line: 776, column: 16, scope: !3139)
!3273 = !DILocation(line: 776, column: 14, scope: !3139)
!3274 = !DILocation(line: 777, column: 2, scope: !3139)
!3275 = !DILocation(line: 779, column: 8, scope: !3139)
!3276 = !DILocation(line: 779, column: 15, scope: !3139)
!3277 = !DILocation(line: 779, column: 21, scope: !3139)
!3278 = !DILocation(line: 779, column: 34, scope: !3139)
!3279 = !DILocation(line: 779, column: 2, scope: !3139)
!3280 = !DILocation(line: 779, column: 44, scope: !3139)
!3281 = !DILocation(line: 779, column: 50, scope: !3139)
!3282 = !DILocation(line: 781, column: 24, scope: !3139)
!3283 = !DILocation(line: 781, column: 29, scope: !3139)
!3284 = !DILocation(line: 781, column: 35, scope: !3139)
!3285 = !DILocation(line: 781, column: 41, scope: !3139)
!3286 = !DILocation(line: 781, column: 2, scope: !3139)
!3287 = !DILocation(line: 781, column: 5, scope: !3139)
!3288 = !DILocation(line: 781, column: 22, scope: !3139)
!3289 = !DILocation(line: 782, column: 23, scope: !3139)
!3290 = !DILocation(line: 782, column: 30, scope: !3139)
!3291 = !DILocation(line: 782, column: 36, scope: !3139)
!3292 = !DILocation(line: 782, column: 49, scope: !3139)
!3293 = !DILocation(line: 782, column: 2, scope: !3139)
!3294 = !DILocation(line: 782, column: 5, scope: !3139)
!3295 = !DILocation(line: 782, column: 21, scope: !3139)
!3296 = !DILocation(line: 784, column: 2, scope: !3139)
!3297 = !DILocation(line: 786, column: 6, scope: !3298)
!3298 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 786, column: 6)
!3299 = !DILocation(line: 786, column: 20, scope: !3298)
!3300 = !DILocation(line: 787, column: 31, scope: !3301)
!3301 = distinct !DILexicalBlock(scope: !3298, file: !24, line: 786, column: 43)
!3302 = !DILocation(line: 787, column: 35, scope: !3301)
!3303 = !DILocation(line: 787, column: 47, scope: !3301)
!3304 = !DILocation(line: 787, column: 3, scope: !3301)
!3305 = !DILocation(line: 788, column: 2, scope: !3301)
!3306 = !DILocation(line: 790, column: 6, scope: !3307)
!3307 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 790, column: 6)
!3308 = !DILocation(line: 790, column: 9, scope: !3307)
!3309 = !DILocation(line: 790, column: 21, scope: !3307)
!3310 = !DILocation(line: 791, column: 3, scope: !3311)
!3311 = distinct !DILexicalBlock(scope: !3307, file: !24, line: 790, column: 28)
!3312 = !DILocation(line: 792, column: 2, scope: !3311)
!3313 = !DILocation(line: 794, column: 3, scope: !3307)
!3314 = !DILocation(line: 794, column: 6, scope: !3307)
!3315 = !DILocation(line: 794, column: 14, scope: !3307)
!3316 = !DILocation(line: 797, column: 6, scope: !3317)
!3317 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 797, column: 6)
!3318 = !DILocation(line: 797, column: 20, scope: !3317)
!3319 = !DILocalVariable(name: "cp", scope: !3320, file: !24, line: 800, type: !1583)
!3320 = distinct !DILexicalBlock(scope: !3317, file: !24, line: 798, column: 2)
!3321 = !DILocation(line: 800, column: 14, scope: !3320)
!3322 = !DILocation(line: 801, column: 37, scope: !3320)
!3323 = !DILocation(line: 801, column: 42, scope: !3320)
!3324 = !DILocation(line: 801, column: 3, scope: !3320)
!3325 = !DILocation(line: 802, column: 17, scope: !3326)
!3326 = distinct !DILexicalBlock(scope: !3320, file: !24, line: 802, column: 7)
!3327 = !DILocation(line: 802, column: 20, scope: !3326)
!3328 = !DILocation(line: 802, column: 7, scope: !3326)
!3329 = !DILocation(line: 802, column: 30, scope: !3326)
!3330 = !DILocation(line: 802, column: 41, scope: !3326)
!3331 = !DILocation(line: 803, column: 37, scope: !3326)
!3332 = !DILocation(line: 803, column: 40, scope: !3326)
!3333 = !DILocation(line: 803, column: 27, scope: !3326)
!3334 = !DILocation(line: 803, column: 50, scope: !3326)
!3335 = !DILocation(line: 803, column: 62, scope: !3326)
!3336 = !DILocation(line: 803, column: 66, scope: !3326)
!3337 = !DILocation(line: 803, column: 78, scope: !3326)
!3338 = !DILocation(line: 803, column: 4, scope: !3326)
!3339 = !DILocation(line: 805, column: 2, scope: !3320)
!3340 = !DILocation(line: 806, column: 1, scope: !3139)
!3341 = distinct !DISubprogram(name: "do_door_open", linkageName: "_Z12do_door_openi", scope: !24, file: !24, line: 811, type: !845, scopeLine: 812, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3342 = !DILocalVariable(name: "door_num", arg: 1, scope: !3341, file: !24, line: 811, type: !7)
!3343 = !DILocation(line: 811, column: 23, scope: !3341)
!3344 = !DILocalVariable(name: "p", scope: !3341, file: !24, line: 813, type: !7)
!3345 = !DILocation(line: 813, column: 6, scope: !3341)
!3346 = !DILocalVariable(name: "d", scope: !3341, file: !24, line: 814, type: !2140)
!3347 = !DILocation(line: 814, column: 15, scope: !3341)
!3348 = !DILocation(line: 816, column: 2, scope: !3341)
!3349 = !DILocation(line: 818, column: 19, scope: !3341)
!3350 = !DILocation(line: 818, column: 7, scope: !3341)
!3351 = !DILocation(line: 818, column: 4, scope: !3341)
!3352 = !DILocation(line: 820, column: 9, scope: !3353)
!3353 = distinct !DILexicalBlock(scope: !3341, file: !24, line: 820, column: 2)
!3354 = !DILocation(line: 820, column: 7, scope: !3353)
!3355 = !DILocation(line: 820, column: 14, scope: !3356)
!3356 = distinct !DILexicalBlock(scope: !3353, file: !24, line: 820, column: 2)
!3357 = !DILocation(line: 820, column: 18, scope: !3356)
!3358 = !DILocation(line: 820, column: 21, scope: !3356)
!3359 = !DILocation(line: 820, column: 16, scope: !3356)
!3360 = !DILocation(line: 820, column: 2, scope: !3353)
!3361 = !DILocalVariable(name: "w", scope: !3362, file: !24, line: 821, type: !2137)
!3362 = distinct !DILexicalBlock(scope: !3356, file: !24, line: 820, column: 35)
!3363 = !DILocation(line: 821, column: 9, scope: !3362)
!3364 = !DILocalVariable(name: "Connectside", scope: !3362, file: !24, line: 822, type: !7)
!3365 = !DILocation(line: 822, column: 7, scope: !3362)
!3366 = !DILocalVariable(name: "side", scope: !3362, file: !24, line: 822, type: !7)
!3367 = !DILocation(line: 822, column: 20, scope: !3362)
!3368 = !DILocalVariable(name: "csegp", scope: !3362, file: !24, line: 823, type: !1558)
!3369 = !DILocation(line: 823, column: 12, scope: !3362)
!3370 = !DILocalVariable(name: "seg", scope: !3362, file: !24, line: 823, type: !1558)
!3371 = !DILocation(line: 823, column: 21, scope: !3362)
!3372 = !DILocalVariable(name: "time_elapsed", scope: !3362, file: !24, line: 824, type: !14)
!3373 = !DILocation(line: 824, column: 7, scope: !3362)
!3374 = !DILocalVariable(name: "time_total", scope: !3362, file: !24, line: 824, type: !14)
!3375 = !DILocation(line: 824, column: 21, scope: !3362)
!3376 = !DILocalVariable(name: "one_frame", scope: !3362, file: !24, line: 824, type: !14)
!3377 = !DILocation(line: 824, column: 33, scope: !3362)
!3378 = !DILocalVariable(name: "i", scope: !3362, file: !24, line: 825, type: !7)
!3379 = !DILocation(line: 825, column: 7, scope: !3362)
!3380 = !DILocalVariable(name: "n", scope: !3362, file: !24, line: 825, type: !7)
!3381 = !DILocation(line: 825, column: 10, scope: !3362)
!3382 = !DILocation(line: 827, column: 14, scope: !3362)
!3383 = !DILocation(line: 827, column: 17, scope: !3362)
!3384 = !DILocation(line: 827, column: 31, scope: !3362)
!3385 = !DILocation(line: 827, column: 8, scope: !3362)
!3386 = !DILocation(line: 827, column: 5, scope: !3362)
!3387 = !DILocation(line: 828, column: 22, scope: !3362)
!3388 = !DILocation(line: 828, column: 25, scope: !3362)
!3389 = !DILocation(line: 828, column: 39, scope: !3362)
!3390 = !DILocation(line: 828, column: 3, scope: !3362)
!3391 = !DILocation(line: 829, column: 22, scope: !3362)
!3392 = !DILocation(line: 829, column: 25, scope: !3362)
!3393 = !DILocation(line: 829, column: 38, scope: !3362)
!3394 = !DILocation(line: 829, column: 3, scope: !3362)
!3395 = !DILocation(line: 831, column: 19, scope: !3362)
!3396 = !DILocation(line: 831, column: 22, scope: !3362)
!3397 = !DILocation(line: 831, column: 10, scope: !3362)
!3398 = !DILocation(line: 831, column: 7, scope: !3362)
!3399 = !DILocation(line: 832, column: 10, scope: !3362)
!3400 = !DILocation(line: 832, column: 13, scope: !3362)
!3401 = !DILocation(line: 832, column: 8, scope: !3362)
!3402 = !DILocation(line: 834, column: 3, scope: !3362)
!3403 = !DILocation(line: 836, column: 21, scope: !3362)
!3404 = !DILocation(line: 836, column: 26, scope: !3362)
!3405 = !DILocation(line: 836, column: 35, scope: !3362)
!3406 = !DILocation(line: 836, column: 12, scope: !3362)
!3407 = !DILocation(line: 836, column: 9, scope: !3362)
!3408 = !DILocation(line: 837, column: 35, scope: !3362)
!3409 = !DILocation(line: 837, column: 40, scope: !3362)
!3410 = !DILocation(line: 837, column: 17, scope: !3362)
!3411 = !DILocation(line: 837, column: 15, scope: !3362)
!3412 = !DILocation(line: 838, column: 3, scope: !3362)
!3413 = !DILocation(line: 840, column: 14, scope: !3362)
!3414 = !DILocation(line: 840, column: 3, scope: !3362)
!3415 = !DILocation(line: 840, column: 6, scope: !3362)
!3416 = !DILocation(line: 840, column: 11, scope: !3362)
!3417 = !DILocation(line: 842, column: 18, scope: !3362)
!3418 = !DILocation(line: 842, column: 21, scope: !3362)
!3419 = !DILocation(line: 842, column: 16, scope: !3362)
!3420 = !DILocation(line: 843, column: 17, scope: !3362)
!3421 = !DILocation(line: 843, column: 20, scope: !3362)
!3422 = !DILocation(line: 843, column: 7, scope: !3362)
!3423 = !DILocation(line: 843, column: 30, scope: !3362)
!3424 = !DILocation(line: 843, column: 5, scope: !3362)
!3425 = !DILocation(line: 844, column: 26, scope: !3362)
!3426 = !DILocation(line: 844, column: 29, scope: !3362)
!3427 = !DILocation(line: 844, column: 16, scope: !3362)
!3428 = !DILocation(line: 844, column: 39, scope: !3362)
!3429 = !DILocation(line: 844, column: 14, scope: !3362)
!3430 = !DILocation(line: 846, column: 15, scope: !3362)
!3431 = !DILocation(line: 846, column: 28, scope: !3362)
!3432 = !DILocation(line: 846, column: 26, scope: !3362)
!3433 = !DILocation(line: 846, column: 13, scope: !3362)
!3434 = !DILocation(line: 848, column: 7, scope: !3362)
!3435 = !DILocation(line: 848, column: 22, scope: !3362)
!3436 = !DILocation(line: 848, column: 20, scope: !3362)
!3437 = !DILocation(line: 848, column: 5, scope: !3362)
!3438 = !DILocation(line: 850, column: 7, scope: !3439)
!3439 = distinct !DILexicalBlock(scope: !3362, file: !24, line: 850, column: 7)
!3440 = !DILocation(line: 850, column: 11, scope: !3439)
!3441 = !DILocation(line: 850, column: 9, scope: !3439)
!3442 = !DILocation(line: 851, column: 22, scope: !3439)
!3443 = !DILocation(line: 851, column: 27, scope: !3439)
!3444 = !DILocation(line: 851, column: 33, scope: !3439)
!3445 = !DILocation(line: 851, column: 40, scope: !3439)
!3446 = !DILocation(line: 851, column: 53, scope: !3439)
!3447 = !DILocation(line: 851, column: 56, scope: !3439)
!3448 = !DILocation(line: 851, column: 66, scope: !3439)
!3449 = !DILocation(line: 851, column: 4, scope: !3439)
!3450 = !DILocation(line: 853, column: 7, scope: !3451)
!3451 = distinct !DILexicalBlock(scope: !3362, file: !24, line: 853, column: 7)
!3452 = !DILocation(line: 853, column: 11, scope: !3451)
!3453 = !DILocation(line: 853, column: 13, scope: !3451)
!3454 = !DILocation(line: 853, column: 9, scope: !3451)
!3455 = !DILocation(line: 854, column: 10, scope: !3456)
!3456 = distinct !DILexicalBlock(scope: !3451, file: !24, line: 853, column: 18)
!3457 = !DILocation(line: 854, column: 15, scope: !3456)
!3458 = !DILocation(line: 854, column: 21, scope: !3456)
!3459 = !DILocation(line: 854, column: 27, scope: !3456)
!3460 = !DILocation(line: 854, column: 4, scope: !3456)
!3461 = !DILocation(line: 854, column: 37, scope: !3456)
!3462 = !DILocation(line: 854, column: 43, scope: !3456)
!3463 = !DILocation(line: 855, column: 10, scope: !3456)
!3464 = !DILocation(line: 855, column: 17, scope: !3456)
!3465 = !DILocation(line: 855, column: 23, scope: !3456)
!3466 = !DILocation(line: 855, column: 36, scope: !3456)
!3467 = !DILocation(line: 855, column: 4, scope: !3456)
!3468 = !DILocation(line: 855, column: 46, scope: !3456)
!3469 = !DILocation(line: 855, column: 52, scope: !3456)
!3470 = !DILocation(line: 856, column: 3, scope: !3456)
!3471 = !DILocation(line: 858, column: 7, scope: !3472)
!3472 = distinct !DILexicalBlock(scope: !3362, file: !24, line: 858, column: 7)
!3473 = !DILocation(line: 858, column: 12, scope: !3472)
!3474 = !DILocation(line: 858, column: 14, scope: !3472)
!3475 = !DILocation(line: 858, column: 9, scope: !3472)
!3476 = !DILocation(line: 859, column: 22, scope: !3477)
!3477 = distinct !DILexicalBlock(scope: !3472, file: !24, line: 858, column: 19)
!3478 = !DILocation(line: 859, column: 27, scope: !3477)
!3479 = !DILocation(line: 859, column: 33, scope: !3477)
!3480 = !DILocation(line: 859, column: 40, scope: !3477)
!3481 = !DILocation(line: 859, column: 53, scope: !3477)
!3482 = !DILocation(line: 859, column: 56, scope: !3477)
!3483 = !DILocation(line: 859, column: 66, scope: !3477)
!3484 = !DILocation(line: 859, column: 68, scope: !3477)
!3485 = !DILocation(line: 859, column: 4, scope: !3477)
!3486 = !DILocation(line: 862, column: 16, scope: !3487)
!3487 = distinct !DILexicalBlock(scope: !3477, file: !24, line: 862, column: 8)
!3488 = !DILocation(line: 862, column: 21, scope: !3487)
!3489 = !DILocation(line: 862, column: 27, scope: !3487)
!3490 = !DILocation(line: 862, column: 33, scope: !3487)
!3491 = !DILocation(line: 862, column: 10, scope: !3487)
!3492 = !DILocation(line: 862, column: 43, scope: !3487)
!3493 = !DILocation(line: 862, column: 49, scope: !3487)
!3494 = !DILocation(line: 862, column: 9, scope: !3487)
!3495 = !DILocation(line: 862, column: 8, scope: !3487)
!3496 = !DILocation(line: 863, column: 14, scope: !3497)
!3497 = distinct !DILexicalBlock(scope: !3498, file: !24, line: 863, column: 5)
!3498 = distinct !DILexicalBlock(scope: !3487, file: !24, line: 862, column: 68)
!3499 = !DILocation(line: 863, column: 12, scope: !3497)
!3500 = !DILocation(line: 863, column: 10, scope: !3497)
!3501 = !DILocation(line: 863, column: 24, scope: !3502)
!3502 = distinct !DILexicalBlock(scope: !3497, file: !24, line: 863, column: 5)
!3503 = !DILocation(line: 863, column: 28, scope: !3502)
!3504 = !DILocation(line: 863, column: 26, scope: !3502)
!3505 = !DILocation(line: 863, column: 5, scope: !3497)
!3506 = !DILocation(line: 864, column: 35, scope: !3502)
!3507 = !DILocation(line: 864, column: 37, scope: !3502)
!3508 = !DILocation(line: 864, column: 23, scope: !3502)
!3509 = !DILocation(line: 864, column: 18, scope: !3502)
!3510 = !DILocation(line: 864, column: 6, scope: !3502)
!3511 = !DILocation(line: 864, column: 21, scope: !3502)
!3512 = !DILocation(line: 863, column: 45, scope: !3502)
!3513 = !DILocation(line: 863, column: 5, scope: !3502)
!3514 = distinct !{!3514, !3505, !3515, !1964}
!3515 = !DILocation(line: 864, column: 40, scope: !3497)
!3516 = !DILocation(line: 865, column: 19, scope: !3498)
!3517 = !DILocation(line: 866, column: 11, scope: !3498)
!3518 = !DILocation(line: 866, column: 16, scope: !3498)
!3519 = !DILocation(line: 866, column: 22, scope: !3498)
!3520 = !DILocation(line: 866, column: 28, scope: !3498)
!3521 = !DILocation(line: 866, column: 5, scope: !3498)
!3522 = !DILocation(line: 866, column: 38, scope: !3498)
!3523 = !DILocation(line: 866, column: 44, scope: !3498)
!3524 = !DILocation(line: 867, column: 11, scope: !3498)
!3525 = !DILocation(line: 867, column: 18, scope: !3498)
!3526 = !DILocation(line: 867, column: 24, scope: !3498)
!3527 = !DILocation(line: 867, column: 37, scope: !3498)
!3528 = !DILocation(line: 867, column: 5, scope: !3498)
!3529 = !DILocation(line: 867, column: 47, scope: !3498)
!3530 = !DILocation(line: 867, column: 53, scope: !3498)
!3531 = !DILocation(line: 868, column: 4, scope: !3498)
!3532 = !DILocation(line: 871, column: 11, scope: !3533)
!3533 = distinct !DILexicalBlock(scope: !3487, file: !24, line: 869, column: 9)
!3534 = !DILocation(line: 871, column: 16, scope: !3533)
!3535 = !DILocation(line: 871, column: 22, scope: !3533)
!3536 = !DILocation(line: 871, column: 28, scope: !3533)
!3537 = !DILocation(line: 871, column: 5, scope: !3533)
!3538 = !DILocation(line: 871, column: 38, scope: !3533)
!3539 = !DILocation(line: 871, column: 44, scope: !3533)
!3540 = !DILocation(line: 872, column: 11, scope: !3533)
!3541 = !DILocation(line: 872, column: 18, scope: !3533)
!3542 = !DILocation(line: 872, column: 24, scope: !3533)
!3543 = !DILocation(line: 872, column: 37, scope: !3533)
!3544 = !DILocation(line: 872, column: 5, scope: !3533)
!3545 = !DILocation(line: 872, column: 47, scope: !3533)
!3546 = !DILocation(line: 872, column: 53, scope: !3533)
!3547 = !DILocation(line: 874, column: 17, scope: !3533)
!3548 = !DILocation(line: 874, column: 5, scope: !3533)
!3549 = !DILocation(line: 874, column: 33, scope: !3533)
!3550 = !DILocation(line: 874, column: 38, scope: !3533)
!3551 = !DILocation(line: 876, column: 3, scope: !3477)
!3552 = !DILocation(line: 878, column: 2, scope: !3362)
!3553 = !DILocation(line: 820, column: 31, scope: !3356)
!3554 = !DILocation(line: 820, column: 2, scope: !3356)
!3555 = distinct !{!3555, !3360, !3556, !1964}
!3556 = !DILocation(line: 878, column: 2, scope: !3353)
!3557 = !DILocation(line: 880, column: 1, scope: !3341)
!3558 = distinct !DISubprogram(name: "do_door_close", linkageName: "_Z13do_door_closei", scope: !24, file: !24, line: 885, type: !845, scopeLine: 886, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3559 = !DILocalVariable(name: "door_num", arg: 1, scope: !3558, file: !24, line: 885, type: !7)
!3560 = !DILocation(line: 885, column: 24, scope: !3558)
!3561 = !DILocalVariable(name: "p", scope: !3558, file: !24, line: 887, type: !7)
!3562 = !DILocation(line: 887, column: 6, scope: !3558)
!3563 = !DILocalVariable(name: "d", scope: !3558, file: !24, line: 888, type: !2140)
!3564 = !DILocation(line: 888, column: 15, scope: !3558)
!3565 = !DILocalVariable(name: "w", scope: !3558, file: !24, line: 889, type: !2137)
!3566 = !DILocation(line: 889, column: 8, scope: !3558)
!3567 = !DILocation(line: 891, column: 2, scope: !3558)
!3568 = !DILocation(line: 893, column: 19, scope: !3558)
!3569 = !DILocation(line: 893, column: 7, scope: !3558)
!3570 = !DILocation(line: 893, column: 4, scope: !3558)
!3571 = !DILocation(line: 895, column: 13, scope: !3558)
!3572 = !DILocation(line: 895, column: 16, scope: !3558)
!3573 = !DILocation(line: 895, column: 7, scope: !3558)
!3574 = !DILocation(line: 895, column: 4, scope: !3558)
!3575 = !DILocation(line: 898, column: 6, scope: !3576)
!3576 = distinct !DILexicalBlock(scope: !3558, file: !24, line: 898, column: 6)
!3577 = !DILocation(line: 898, column: 9, scope: !3576)
!3578 = !DILocation(line: 898, column: 15, scope: !3576)
!3579 = !DILocation(line: 899, column: 31, scope: !3580)
!3580 = distinct !DILexicalBlock(scope: !3576, file: !24, line: 899, column: 7)
!3581 = !DILocation(line: 899, column: 34, scope: !3580)
!3582 = !DILocation(line: 899, column: 22, scope: !3580)
!3583 = !DILocation(line: 899, column: 43, scope: !3580)
!3584 = !DILocation(line: 899, column: 46, scope: !3580)
!3585 = !DILocation(line: 899, column: 8, scope: !3580)
!3586 = !DILocation(line: 899, column: 7, scope: !3580)
!3587 = !DILocation(line: 900, column: 38, scope: !3588)
!3588 = distinct !DILexicalBlock(scope: !3580, file: !24, line: 899, column: 56)
!3589 = !DILocation(line: 900, column: 41, scope: !3588)
!3590 = !DILocation(line: 900, column: 49, scope: !3588)
!3591 = !DILocation(line: 900, column: 52, scope: !3588)
!3592 = !DILocation(line: 900, column: 4, scope: !3588)
!3593 = !DILocation(line: 901, column: 29, scope: !3588)
!3594 = !DILocation(line: 901, column: 32, scope: !3588)
!3595 = !DILocation(line: 901, column: 20, scope: !3588)
!3596 = !DILocation(line: 901, column: 41, scope: !3588)
!3597 = !DILocation(line: 901, column: 44, scope: !3588)
!3598 = !DILocation(line: 901, column: 4, scope: !3588)
!3599 = !DILocation(line: 902, column: 4, scope: !3588)
!3600 = !DILocation(line: 899, column: 53, scope: !3580)
!3601 = !DILocation(line: 905, column: 9, scope: !3602)
!3602 = distinct !DILexicalBlock(scope: !3558, file: !24, line: 905, column: 2)
!3603 = !DILocation(line: 905, column: 7, scope: !3602)
!3604 = !DILocation(line: 905, column: 14, scope: !3605)
!3605 = distinct !DILexicalBlock(scope: !3602, file: !24, line: 905, column: 2)
!3606 = !DILocation(line: 905, column: 18, scope: !3605)
!3607 = !DILocation(line: 905, column: 21, scope: !3605)
!3608 = !DILocation(line: 905, column: 16, scope: !3605)
!3609 = !DILocation(line: 905, column: 2, scope: !3602)
!3610 = !DILocalVariable(name: "w", scope: !3611, file: !24, line: 906, type: !2137)
!3611 = distinct !DILexicalBlock(scope: !3605, file: !24, line: 905, column: 35)
!3612 = !DILocation(line: 906, column: 9, scope: !3611)
!3613 = !DILocalVariable(name: "Connectside", scope: !3611, file: !24, line: 907, type: !7)
!3614 = !DILocation(line: 907, column: 7, scope: !3611)
!3615 = !DILocalVariable(name: "side", scope: !3611, file: !24, line: 907, type: !7)
!3616 = !DILocation(line: 907, column: 20, scope: !3611)
!3617 = !DILocalVariable(name: "csegp", scope: !3611, file: !24, line: 908, type: !1558)
!3618 = !DILocation(line: 908, column: 12, scope: !3611)
!3619 = !DILocalVariable(name: "seg", scope: !3611, file: !24, line: 908, type: !1558)
!3620 = !DILocation(line: 908, column: 21, scope: !3611)
!3621 = !DILocalVariable(name: "time_elapsed", scope: !3611, file: !24, line: 909, type: !14)
!3622 = !DILocation(line: 909, column: 7, scope: !3611)
!3623 = !DILocalVariable(name: "time_total", scope: !3611, file: !24, line: 909, type: !14)
!3624 = !DILocation(line: 909, column: 21, scope: !3611)
!3625 = !DILocalVariable(name: "one_frame", scope: !3611, file: !24, line: 909, type: !14)
!3626 = !DILocation(line: 909, column: 33, scope: !3611)
!3627 = !DILocalVariable(name: "i", scope: !3611, file: !24, line: 910, type: !7)
!3628 = !DILocation(line: 910, column: 7, scope: !3611)
!3629 = !DILocalVariable(name: "n", scope: !3611, file: !24, line: 910, type: !7)
!3630 = !DILocation(line: 910, column: 10, scope: !3611)
!3631 = !DILocation(line: 912, column: 14, scope: !3611)
!3632 = !DILocation(line: 912, column: 17, scope: !3611)
!3633 = !DILocation(line: 912, column: 31, scope: !3611)
!3634 = !DILocation(line: 912, column: 8, scope: !3611)
!3635 = !DILocation(line: 912, column: 5, scope: !3611)
!3636 = !DILocation(line: 914, column: 19, scope: !3611)
!3637 = !DILocation(line: 914, column: 22, scope: !3611)
!3638 = !DILocation(line: 914, column: 10, scope: !3611)
!3639 = !DILocation(line: 914, column: 7, scope: !3611)
!3640 = !DILocation(line: 915, column: 10, scope: !3611)
!3641 = !DILocation(line: 915, column: 13, scope: !3611)
!3642 = !DILocation(line: 915, column: 8, scope: !3611)
!3643 = !DILocation(line: 917, column: 7, scope: !3644)
!3644 = distinct !DILexicalBlock(scope: !3611, file: !24, line: 917, column: 7)
!3645 = !DILocation(line: 917, column: 12, scope: !3644)
!3646 = !DILocation(line: 917, column: 18, scope: !3644)
!3647 = !DILocation(line: 917, column: 24, scope: !3644)
!3648 = !DILocation(line: 917, column: 33, scope: !3644)
!3649 = !DILocation(line: 918, column: 4, scope: !3650)
!3650 = distinct !DILexicalBlock(scope: !3644, file: !24, line: 917, column: 40)
!3651 = !DILocation(line: 919, column: 4, scope: !3650)
!3652 = !DILocation(line: 927, column: 21, scope: !3611)
!3653 = !DILocation(line: 927, column: 26, scope: !3611)
!3654 = !DILocation(line: 927, column: 35, scope: !3611)
!3655 = !DILocation(line: 927, column: 12, scope: !3611)
!3656 = !DILocation(line: 927, column: 9, scope: !3611)
!3657 = !DILocation(line: 928, column: 35, scope: !3611)
!3658 = !DILocation(line: 928, column: 40, scope: !3611)
!3659 = !DILocation(line: 928, column: 17, scope: !3611)
!3660 = !DILocation(line: 928, column: 15, scope: !3611)
!3661 = !DILocation(line: 929, column: 3, scope: !3611)
!3662 = !DILocation(line: 932, column: 7, scope: !3663)
!3663 = distinct !DILexicalBlock(scope: !3611, file: !24, line: 932, column: 7)
!3664 = !DILocation(line: 932, column: 21, scope: !3663)
!3665 = !DILocation(line: 934, column: 8, scope: !3666)
!3666 = distinct !DILexicalBlock(scope: !3663, file: !24, line: 934, column: 8)
!3667 = !DILocation(line: 934, column: 10, scope: !3666)
!3668 = !DILocation(line: 935, column: 9, scope: !3669)
!3669 = distinct !DILexicalBlock(scope: !3666, file: !24, line: 935, column: 9)
!3670 = !DILocation(line: 935, column: 12, scope: !3669)
!3671 = !DILocation(line: 935, column: 17, scope: !3669)
!3672 = !DILocalVariable(name: "cp", scope: !3673, file: !24, line: 936, type: !1583)
!3673 = distinct !DILexicalBlock(scope: !3669, file: !24, line: 935, column: 23)
!3674 = !DILocation(line: 936, column: 17, scope: !3673)
!3675 = !DILocation(line: 937, column: 40, scope: !3673)
!3676 = !DILocation(line: 937, column: 45, scope: !3673)
!3677 = !DILocation(line: 937, column: 6, scope: !3673)
!3678 = !DILocation(line: 938, column: 20, scope: !3679)
!3679 = distinct !DILexicalBlock(scope: !3673, file: !24, line: 938, column: 10)
!3680 = !DILocation(line: 938, column: 23, scope: !3679)
!3681 = !DILocation(line: 938, column: 10, scope: !3679)
!3682 = !DILocation(line: 938, column: 33, scope: !3679)
!3683 = !DILocation(line: 938, column: 45, scope: !3679)
!3684 = !DILocation(line: 939, column: 46, scope: !3679)
!3685 = !DILocation(line: 939, column: 51, scope: !3679)
!3686 = !DILocation(line: 939, column: 57, scope: !3679)
!3687 = !DILocation(line: 939, column: 63, scope: !3679)
!3688 = !DILocation(line: 939, column: 40, scope: !3679)
!3689 = !DILocation(line: 939, column: 73, scope: !3679)
!3690 = !DILocation(line: 939, column: 30, scope: !3679)
!3691 = !DILocation(line: 939, column: 83, scope: !3679)
!3692 = !DILocation(line: 939, column: 96, scope: !3679)
!3693 = !DILocation(line: 939, column: 100, scope: !3679)
!3694 = !DILocation(line: 939, column: 112, scope: !3679)
!3695 = !DILocation(line: 939, column: 7, scope: !3679)
!3696 = !DILocation(line: 940, column: 5, scope: !3673)
!3697 = !DILocation(line: 935, column: 20, scope: !3669)
!3698 = !DILocation(line: 934, column: 13, scope: !3666)
!3699 = !DILocation(line: 942, column: 14, scope: !3611)
!3700 = !DILocation(line: 942, column: 3, scope: !3611)
!3701 = !DILocation(line: 942, column: 6, scope: !3611)
!3702 = !DILocation(line: 942, column: 11, scope: !3611)
!3703 = !DILocation(line: 944, column: 18, scope: !3611)
!3704 = !DILocation(line: 944, column: 21, scope: !3611)
!3705 = !DILocation(line: 944, column: 16, scope: !3611)
!3706 = !DILocation(line: 945, column: 17, scope: !3611)
!3707 = !DILocation(line: 945, column: 20, scope: !3611)
!3708 = !DILocation(line: 945, column: 7, scope: !3611)
!3709 = !DILocation(line: 945, column: 30, scope: !3611)
!3710 = !DILocation(line: 945, column: 5, scope: !3611)
!3711 = !DILocation(line: 946, column: 26, scope: !3611)
!3712 = !DILocation(line: 946, column: 29, scope: !3611)
!3713 = !DILocation(line: 946, column: 16, scope: !3611)
!3714 = !DILocation(line: 946, column: 39, scope: !3611)
!3715 = !DILocation(line: 946, column: 14, scope: !3611)
!3716 = !DILocation(line: 948, column: 15, scope: !3611)
!3717 = !DILocation(line: 948, column: 28, scope: !3611)
!3718 = !DILocation(line: 948, column: 26, scope: !3611)
!3719 = !DILocation(line: 948, column: 13, scope: !3611)
!3720 = !DILocation(line: 950, column: 7, scope: !3611)
!3721 = !DILocation(line: 950, column: 11, scope: !3611)
!3722 = !DILocation(line: 950, column: 26, scope: !3611)
!3723 = !DILocation(line: 950, column: 24, scope: !3611)
!3724 = !DILocation(line: 950, column: 9, scope: !3611)
!3725 = !DILocation(line: 950, column: 36, scope: !3611)
!3726 = !DILocation(line: 950, column: 5, scope: !3611)
!3727 = !DILocation(line: 952, column: 7, scope: !3728)
!3728 = distinct !DILexicalBlock(scope: !3611, file: !24, line: 952, column: 7)
!3729 = !DILocation(line: 952, column: 11, scope: !3728)
!3730 = !DILocation(line: 952, column: 13, scope: !3728)
!3731 = !DILocation(line: 952, column: 9, scope: !3728)
!3732 = !DILocation(line: 953, column: 10, scope: !3733)
!3733 = distinct !DILexicalBlock(scope: !3728, file: !24, line: 952, column: 18)
!3734 = !DILocation(line: 953, column: 15, scope: !3733)
!3735 = !DILocation(line: 953, column: 21, scope: !3733)
!3736 = !DILocation(line: 953, column: 27, scope: !3733)
!3737 = !DILocation(line: 953, column: 4, scope: !3733)
!3738 = !DILocation(line: 953, column: 37, scope: !3733)
!3739 = !DILocation(line: 953, column: 43, scope: !3733)
!3740 = !DILocation(line: 954, column: 10, scope: !3733)
!3741 = !DILocation(line: 954, column: 17, scope: !3733)
!3742 = !DILocation(line: 954, column: 23, scope: !3733)
!3743 = !DILocation(line: 954, column: 36, scope: !3733)
!3744 = !DILocation(line: 954, column: 4, scope: !3733)
!3745 = !DILocation(line: 954, column: 46, scope: !3733)
!3746 = !DILocation(line: 954, column: 52, scope: !3733)
!3747 = !DILocation(line: 955, column: 3, scope: !3733)
!3748 = !DILocation(line: 958, column: 7, scope: !3749)
!3749 = distinct !DILexicalBlock(scope: !3611, file: !24, line: 958, column: 7)
!3750 = !DILocation(line: 958, column: 9, scope: !3749)
!3751 = !DILocation(line: 959, column: 22, scope: !3752)
!3752 = distinct !DILexicalBlock(scope: !3749, file: !24, line: 958, column: 14)
!3753 = !DILocation(line: 959, column: 27, scope: !3752)
!3754 = !DILocation(line: 959, column: 33, scope: !3752)
!3755 = !DILocation(line: 959, column: 40, scope: !3752)
!3756 = !DILocation(line: 959, column: 53, scope: !3752)
!3757 = !DILocation(line: 959, column: 56, scope: !3752)
!3758 = !DILocation(line: 959, column: 66, scope: !3752)
!3759 = !DILocation(line: 959, column: 4, scope: !3752)
!3760 = !DILocation(line: 961, column: 10, scope: !3752)
!3761 = !DILocation(line: 961, column: 15, scope: !3752)
!3762 = !DILocation(line: 961, column: 21, scope: !3752)
!3763 = !DILocation(line: 961, column: 27, scope: !3752)
!3764 = !DILocation(line: 961, column: 4, scope: !3752)
!3765 = !DILocation(line: 961, column: 37, scope: !3752)
!3766 = !DILocation(line: 961, column: 43, scope: !3752)
!3767 = !DILocation(line: 962, column: 10, scope: !3752)
!3768 = !DILocation(line: 962, column: 17, scope: !3752)
!3769 = !DILocation(line: 962, column: 23, scope: !3752)
!3770 = !DILocation(line: 962, column: 36, scope: !3752)
!3771 = !DILocation(line: 962, column: 4, scope: !3752)
!3772 = !DILocation(line: 962, column: 46, scope: !3752)
!3773 = !DILocation(line: 962, column: 52, scope: !3752)
!3774 = !DILocation(line: 964, column: 16, scope: !3752)
!3775 = !DILocation(line: 964, column: 4, scope: !3752)
!3776 = !DILocation(line: 964, column: 32, scope: !3752)
!3777 = !DILocation(line: 964, column: 37, scope: !3752)
!3778 = !DILocation(line: 966, column: 3, scope: !3752)
!3779 = !DILocation(line: 968, column: 24, scope: !3749)
!3780 = !DILocation(line: 968, column: 4, scope: !3749)
!3781 = !DILocation(line: 969, column: 2, scope: !3611)
!3782 = !DILocation(line: 905, column: 31, scope: !3605)
!3783 = !DILocation(line: 905, column: 2, scope: !3605)
!3784 = distinct !{!3784, !3609, !3785, !1964}
!3785 = !DILocation(line: 969, column: 2, scope: !3602)
!3786 = !DILocation(line: 970, column: 1, scope: !3558)
!3787 = distinct !DISubprogram(name: "wall_illusion_off", linkageName: "_Z17wall_illusion_offP7segmenti", scope: !24, file: !24, line: 976, type: !1815, scopeLine: 977, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3788 = !DILocalVariable(name: "seg", arg: 1, scope: !3787, file: !24, line: 976, type: !1558)
!3789 = !DILocation(line: 976, column: 33, scope: !3787)
!3790 = !DILocalVariable(name: "side", arg: 2, scope: !3787, file: !24, line: 976, type: !7)
!3791 = !DILocation(line: 976, column: 42, scope: !3787)
!3792 = !DILocalVariable(name: "csegp", scope: !3787, file: !24, line: 978, type: !1558)
!3793 = !DILocation(line: 978, column: 11, scope: !3787)
!3794 = !DILocalVariable(name: "cside", scope: !3787, file: !24, line: 979, type: !7)
!3795 = !DILocation(line: 979, column: 6, scope: !3787)
!3796 = !DILocation(line: 981, column: 20, scope: !3787)
!3797 = !DILocation(line: 981, column: 25, scope: !3787)
!3798 = !DILocation(line: 981, column: 34, scope: !3787)
!3799 = !DILocation(line: 981, column: 11, scope: !3787)
!3800 = !DILocation(line: 981, column: 8, scope: !3787)
!3801 = !DILocation(line: 982, column: 28, scope: !3787)
!3802 = !DILocation(line: 982, column: 33, scope: !3787)
!3803 = !DILocation(line: 982, column: 10, scope: !3787)
!3804 = !DILocation(line: 982, column: 8, scope: !3787)
!3805 = !DILocation(line: 983, column: 2, scope: !3787)
!3806 = !DILocation(line: 985, column: 6, scope: !3807)
!3807 = distinct !DILexicalBlock(scope: !3787, file: !24, line: 985, column: 6)
!3808 = !DILocation(line: 985, column: 11, scope: !3807)
!3809 = !DILocation(line: 985, column: 17, scope: !3807)
!3810 = !DILocation(line: 985, column: 23, scope: !3807)
!3811 = !DILocation(line: 985, column: 32, scope: !3807)
!3812 = !DILocation(line: 986, column: 3, scope: !3813)
!3813 = distinct !DILexicalBlock(scope: !3807, file: !24, line: 985, column: 39)
!3814 = !DILocation(line: 987, column: 3, scope: !3813)
!3815 = !DILocation(line: 990, column: 8, scope: !3787)
!3816 = !DILocation(line: 990, column: 13, scope: !3787)
!3817 = !DILocation(line: 990, column: 19, scope: !3787)
!3818 = !DILocation(line: 990, column: 25, scope: !3787)
!3819 = !DILocation(line: 990, column: 2, scope: !3787)
!3820 = !DILocation(line: 990, column: 35, scope: !3787)
!3821 = !DILocation(line: 990, column: 41, scope: !3787)
!3822 = !DILocation(line: 991, column: 8, scope: !3787)
!3823 = !DILocation(line: 991, column: 15, scope: !3787)
!3824 = !DILocation(line: 991, column: 21, scope: !3787)
!3825 = !DILocation(line: 991, column: 28, scope: !3787)
!3826 = !DILocation(line: 991, column: 2, scope: !3787)
!3827 = !DILocation(line: 991, column: 38, scope: !3787)
!3828 = !DILocation(line: 991, column: 44, scope: !3787)
!3829 = !DILocation(line: 993, column: 21, scope: !3787)
!3830 = !DILocation(line: 993, column: 26, scope: !3787)
!3831 = !DILocation(line: 993, column: 32, scope: !3787)
!3832 = !DILocation(line: 993, column: 38, scope: !3787)
!3833 = !DILocation(line: 993, column: 2, scope: !3787)
!3834 = !DILocation(line: 994, column: 21, scope: !3787)
!3835 = !DILocation(line: 994, column: 28, scope: !3787)
!3836 = !DILocation(line: 994, column: 34, scope: !3787)
!3837 = !DILocation(line: 994, column: 41, scope: !3787)
!3838 = !DILocation(line: 994, column: 2, scope: !3787)
!3839 = !DILocation(line: 995, column: 1, scope: !3787)
!3840 = distinct !DISubprogram(name: "wall_illusion_on", linkageName: "_Z16wall_illusion_onP7segmenti", scope: !24, file: !24, line: 1000, type: !1815, scopeLine: 1001, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3841 = !DILocalVariable(name: "seg", arg: 1, scope: !3840, file: !24, line: 1000, type: !1558)
!3842 = !DILocation(line: 1000, column: 32, scope: !3840)
!3843 = !DILocalVariable(name: "side", arg: 2, scope: !3840, file: !24, line: 1000, type: !7)
!3844 = !DILocation(line: 1000, column: 41, scope: !3840)
!3845 = !DILocalVariable(name: "csegp", scope: !3840, file: !24, line: 1029, type: !1558)
!3846 = !DILocation(line: 1029, column: 11, scope: !3840)
!3847 = !DILocalVariable(name: "cside", scope: !3840, file: !24, line: 1030, type: !7)
!3848 = !DILocation(line: 1030, column: 6, scope: !3840)
!3849 = !DILocation(line: 1032, column: 20, scope: !3840)
!3850 = !DILocation(line: 1032, column: 25, scope: !3840)
!3851 = !DILocation(line: 1032, column: 34, scope: !3840)
!3852 = !DILocation(line: 1032, column: 11, scope: !3840)
!3853 = !DILocation(line: 1032, column: 8, scope: !3840)
!3854 = !DILocation(line: 1033, column: 28, scope: !3840)
!3855 = !DILocation(line: 1033, column: 33, scope: !3840)
!3856 = !DILocation(line: 1033, column: 10, scope: !3840)
!3857 = !DILocation(line: 1033, column: 8, scope: !3840)
!3858 = !DILocation(line: 1034, column: 2, scope: !3840)
!3859 = !DILocation(line: 1036, column: 6, scope: !3860)
!3860 = distinct !DILexicalBlock(scope: !3840, file: !24, line: 1036, column: 6)
!3861 = !DILocation(line: 1036, column: 11, scope: !3860)
!3862 = !DILocation(line: 1036, column: 17, scope: !3860)
!3863 = !DILocation(line: 1036, column: 23, scope: !3860)
!3864 = !DILocation(line: 1036, column: 32, scope: !3860)
!3865 = !DILocation(line: 1037, column: 3, scope: !3866)
!3866 = distinct !DILexicalBlock(scope: !3860, file: !24, line: 1036, column: 39)
!3867 = !DILocation(line: 1038, column: 3, scope: !3866)
!3868 = !DILocation(line: 1041, column: 8, scope: !3840)
!3869 = !DILocation(line: 1041, column: 13, scope: !3840)
!3870 = !DILocation(line: 1041, column: 19, scope: !3840)
!3871 = !DILocation(line: 1041, column: 25, scope: !3840)
!3872 = !DILocation(line: 1041, column: 2, scope: !3840)
!3873 = !DILocation(line: 1041, column: 35, scope: !3840)
!3874 = !DILocation(line: 1041, column: 41, scope: !3840)
!3875 = !DILocation(line: 1042, column: 8, scope: !3840)
!3876 = !DILocation(line: 1042, column: 15, scope: !3840)
!3877 = !DILocation(line: 1042, column: 21, scope: !3840)
!3878 = !DILocation(line: 1042, column: 28, scope: !3840)
!3879 = !DILocation(line: 1042, column: 2, scope: !3840)
!3880 = !DILocation(line: 1042, column: 38, scope: !3840)
!3881 = !DILocation(line: 1042, column: 44, scope: !3840)
!3882 = !DILocation(line: 1043, column: 1, scope: !3840)
!3883 = distinct !DISubprogram(name: "special_boss_opening_allowed", linkageName: "_Z28special_boss_opening_allowedii", scope: !24, file: !24, line: 1047, type: !3884, scopeLine: 1048, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3884 = !DISubroutineType(types: !3885)
!3885 = !{!7, !7, !7}
!3886 = !DILocalVariable(name: "segnum", arg: 1, scope: !3883, file: !24, line: 1047, type: !7)
!3887 = !DILocation(line: 1047, column: 38, scope: !3883)
!3888 = !DILocalVariable(name: "sidenum", arg: 2, scope: !3883, file: !24, line: 1047, type: !7)
!3889 = !DILocation(line: 1047, column: 50, scope: !3883)
!3890 = !DILocation(line: 1049, column: 6, scope: !3891)
!3891 = distinct !DILexicalBlock(scope: !3883, file: !24, line: 1049, column: 6)
!3892 = !DILocation(line: 1049, column: 16, scope: !3891)
!3893 = !DILocation(line: 1050, column: 11, scope: !3891)
!3894 = !DILocation(line: 1050, column: 29, scope: !3891)
!3895 = !DILocation(line: 1050, column: 56, scope: !3891)
!3896 = !DILocation(line: 1050, column: 60, scope: !3891)
!3897 = !DILocation(line: 1050, column: 67, scope: !3891)
!3898 = !DILocation(line: 1050, column: 92, scope: !3891)
!3899 = !DILocation(line: 1050, column: 96, scope: !3891)
!3900 = !DILocation(line: 1050, column: 104, scope: !3891)
!3901 = !DILocation(line: 0, scope: !3891)
!3902 = !DILocation(line: 1050, column: 10, scope: !3891)
!3903 = !DILocation(line: 1050, column: 3, scope: !3891)
!3904 = !DILocation(line: 1052, column: 3, scope: !3891)
!3905 = !DILocation(line: 1053, column: 1, scope: !3883)
!3906 = distinct !DISubprogram(name: "wall_hit_process", linkageName: "_Z16wall_hit_processP7segmentiiiP6object", scope: !24, file: !24, line: 1061, type: !3907, scopeLine: 1062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!3907 = !DISubroutineType(types: !3908)
!3908 = !{!7, !1558, !7, !14, !7, !2897}
!3909 = !DILocalVariable(name: "seg", arg: 1, scope: !3906, file: !24, line: 1061, type: !1558)
!3910 = !DILocation(line: 1061, column: 31, scope: !3906)
!3911 = !DILocalVariable(name: "side", arg: 2, scope: !3906, file: !24, line: 1061, type: !7)
!3912 = !DILocation(line: 1061, column: 40, scope: !3906)
!3913 = !DILocalVariable(name: "damage", arg: 3, scope: !3906, file: !24, line: 1061, type: !14)
!3914 = !DILocation(line: 1061, column: 50, scope: !3906)
!3915 = !DILocalVariable(name: "playernum", arg: 4, scope: !3906, file: !24, line: 1061, type: !7)
!3916 = !DILocation(line: 1061, column: 62, scope: !3906)
!3917 = !DILocalVariable(name: "obj", arg: 5, scope: !3906, file: !24, line: 1061, type: !2897)
!3918 = !DILocation(line: 1061, column: 81, scope: !3906)
!3919 = !DILocalVariable(name: "w", scope: !3906, file: !24, line: 1063, type: !2137)
!3920 = !DILocation(line: 1063, column: 8, scope: !3906)
!3921 = !DILocalVariable(name: "show_message", scope: !3906, file: !24, line: 1064, type: !14)
!3922 = !DILocation(line: 1064, column: 6, scope: !3906)
!3923 = !DILocation(line: 1066, column: 2, scope: !3906)
!3924 = !DILocation(line: 1069, column: 6, scope: !3925)
!3925 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1069, column: 6)
!3926 = !DILocation(line: 1069, column: 11, scope: !3925)
!3927 = !DILocation(line: 1069, column: 17, scope: !3925)
!3928 = !DILocation(line: 1069, column: 23, scope: !3925)
!3929 = !DILocation(line: 1069, column: 32, scope: !3925)
!3930 = !DILocation(line: 1070, column: 3, scope: !3925)
!3931 = !DILocation(line: 1072, column: 13, scope: !3906)
!3932 = !DILocation(line: 1072, column: 18, scope: !3906)
!3933 = !DILocation(line: 1072, column: 24, scope: !3906)
!3934 = !DILocation(line: 1072, column: 30, scope: !3906)
!3935 = !DILocation(line: 1072, column: 7, scope: !3906)
!3936 = !DILocation(line: 1072, column: 4, scope: !3906)
!3937 = !DILocation(line: 1074, column: 6, scope: !3938)
!3938 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1074, column: 6)
!3939 = !DILocation(line: 1074, column: 20, scope: !3938)
!3940 = !DILocation(line: 1075, column: 35, scope: !3938)
!3941 = !DILocation(line: 1075, column: 39, scope: !3938)
!3942 = !DILocation(line: 1075, column: 51, scope: !3938)
!3943 = !DILocation(line: 1075, column: 57, scope: !3938)
!3944 = !DILocation(line: 1075, column: 65, scope: !3938)
!3945 = !DILocation(line: 1075, column: 3, scope: !3938)
!3946 = !DILocation(line: 1077, column: 6, scope: !3947)
!3947 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1077, column: 6)
!3948 = !DILocation(line: 1077, column: 9, scope: !3947)
!3949 = !DILocation(line: 1077, column: 14, scope: !3947)
!3950 = !DILocation(line: 1079, column: 7, scope: !3951)
!3951 = distinct !DILexicalBlock(scope: !3952, file: !24, line: 1079, column: 7)
!3952 = distinct !DILexicalBlock(scope: !3947, file: !24, line: 1078, column: 2)
!3953 = !DILocation(line: 1079, column: 27, scope: !3951)
!3954 = !DILocation(line: 1079, column: 50, scope: !3951)
!3955 = !DILocation(line: 1079, column: 53, scope: !3951)
!3956 = !DILocation(line: 1079, column: 58, scope: !3951)
!3957 = !DILocation(line: 1079, column: 75, scope: !3951)
!3958 = !DILocation(line: 1079, column: 87, scope: !3951)
!3959 = !DILocation(line: 1080, column: 16, scope: !3951)
!3960 = !DILocation(line: 1080, column: 21, scope: !3951)
!3961 = !DILocation(line: 1080, column: 27, scope: !3951)
!3962 = !DILocation(line: 1080, column: 4, scope: !3951)
!3963 = !DILocation(line: 1081, column: 3, scope: !3952)
!3964 = !DILocation(line: 1084, column: 6, scope: !3965)
!3965 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1084, column: 6)
!3966 = !DILocation(line: 1084, column: 19, scope: !3965)
!3967 = !DILocation(line: 1084, column: 16, scope: !3965)
!3968 = !DILocation(line: 1085, column: 3, scope: !3965)
!3969 = !DILocation(line: 1087, column: 2, scope: !3906)
!3970 = !DILocation(line: 1091, column: 6, scope: !3971)
!3971 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1091, column: 6)
!3972 = !DILocation(line: 1091, column: 11, scope: !3971)
!3973 = !DILocation(line: 1091, column: 16, scope: !3971)
!3974 = !DILocation(line: 1092, column: 19, scope: !3971)
!3975 = !DILocation(line: 1092, column: 81, scope: !3971)
!3976 = !DILocation(line: 1092, column: 18, scope: !3971)
!3977 = !DILocation(line: 1092, column: 16, scope: !3971)
!3978 = !DILocation(line: 1092, column: 3, scope: !3971)
!3979 = !DILocation(line: 1093, column: 11, scope: !3980)
!3980 = distinct !DILexicalBlock(scope: !3971, file: !24, line: 1093, column: 11)
!3981 = !DILocation(line: 1093, column: 16, scope: !3980)
!3982 = !DILocation(line: 1093, column: 21, scope: !3980)
!3983 = !DILocation(line: 1094, column: 16, scope: !3980)
!3984 = !DILocation(line: 1094, column: 3, scope: !3980)
!3985 = !DILocation(line: 1095, column: 12, scope: !3986)
!3986 = distinct !DILexicalBlock(scope: !3980, file: !24, line: 1095, column: 11)
!3987 = !DILocation(line: 1095, column: 17, scope: !3986)
!3988 = !DILocation(line: 1095, column: 22, scope: !3986)
!3989 = !DILocation(line: 1095, column: 37, scope: !3986)
!3990 = !DILocation(line: 1095, column: 41, scope: !3986)
!3991 = !DILocation(line: 1095, column: 46, scope: !3986)
!3992 = !DILocation(line: 1095, column: 63, scope: !3986)
!3993 = !DILocation(line: 1095, column: 75, scope: !3986)
!3994 = !DILocation(line: 1096, column: 16, scope: !3986)
!3995 = !DILocation(line: 1096, column: 3, scope: !3986)
!3996 = !DILocation(line: 1098, column: 16, scope: !3986)
!3997 = !DILocation(line: 1100, column: 6, scope: !3998)
!3998 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1100, column: 6)
!3999 = !DILocation(line: 1100, column: 9, scope: !3998)
!4000 = !DILocation(line: 1100, column: 14, scope: !3998)
!4001 = !DILocation(line: 1101, column: 17, scope: !4002)
!4002 = distinct !DILexicalBlock(scope: !3998, file: !24, line: 1101, column: 7)
!4003 = !DILocation(line: 1101, column: 9, scope: !4002)
!4004 = !DILocation(line: 1101, column: 28, scope: !4002)
!4005 = !DILocation(line: 1101, column: 34, scope: !4002)
!4006 = !DILocation(line: 1101, column: 8, scope: !4002)
!4007 = !DILocation(line: 1101, column: 7, scope: !4002)
!4008 = !DILocation(line: 1102, column: 8, scope: !4009)
!4009 = distinct !DILexicalBlock(scope: !4010, file: !24, line: 1102, column: 8)
!4010 = distinct !DILexicalBlock(scope: !4002, file: !24, line: 1101, column: 60)
!4011 = !DILocation(line: 1102, column: 21, scope: !4009)
!4012 = !DILocation(line: 1102, column: 18, scope: !4009)
!4013 = !DILocation(line: 1103, column: 9, scope: !4014)
!4014 = distinct !DILexicalBlock(scope: !4009, file: !24, line: 1103, column: 9)
!4015 = !DILocation(line: 1104, column: 32, scope: !4014)
!4016 = !DILocation(line: 1104, column: 42, scope: !4014)
!4017 = !DILocation(line: 1104, column: 6, scope: !4014)
!4018 = !DILocation(line: 1105, column: 4, scope: !4010)
!4019 = !DILocation(line: 1101, column: 57, scope: !4002)
!4020 = !DILocation(line: 1108, column: 6, scope: !4021)
!4021 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1108, column: 6)
!4022 = !DILocation(line: 1108, column: 9, scope: !4021)
!4023 = !DILocation(line: 1108, column: 14, scope: !4021)
!4024 = !DILocation(line: 1109, column: 17, scope: !4025)
!4025 = distinct !DILexicalBlock(scope: !4021, file: !24, line: 1109, column: 7)
!4026 = !DILocation(line: 1109, column: 9, scope: !4025)
!4027 = !DILocation(line: 1109, column: 28, scope: !4025)
!4028 = !DILocation(line: 1109, column: 34, scope: !4025)
!4029 = !DILocation(line: 1109, column: 8, scope: !4025)
!4030 = !DILocation(line: 1109, column: 7, scope: !4025)
!4031 = !DILocation(line: 1110, column: 8, scope: !4032)
!4032 = distinct !DILexicalBlock(scope: !4033, file: !24, line: 1110, column: 8)
!4033 = distinct !DILexicalBlock(scope: !4025, file: !24, line: 1109, column: 59)
!4034 = !DILocation(line: 1110, column: 21, scope: !4032)
!4035 = !DILocation(line: 1110, column: 18, scope: !4032)
!4036 = !DILocation(line: 1111, column: 9, scope: !4037)
!4037 = distinct !DILexicalBlock(scope: !4032, file: !24, line: 1111, column: 9)
!4038 = !DILocation(line: 1112, column: 32, scope: !4037)
!4039 = !DILocation(line: 1112, column: 41, scope: !4037)
!4040 = !DILocation(line: 1112, column: 6, scope: !4037)
!4041 = !DILocation(line: 1113, column: 4, scope: !4033)
!4042 = !DILocation(line: 1109, column: 56, scope: !4025)
!4043 = !DILocation(line: 1116, column: 6, scope: !4044)
!4044 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1116, column: 6)
!4045 = !DILocation(line: 1116, column: 9, scope: !4044)
!4046 = !DILocation(line: 1116, column: 14, scope: !4044)
!4047 = !DILocation(line: 1117, column: 17, scope: !4048)
!4048 = distinct !DILexicalBlock(scope: !4044, file: !24, line: 1117, column: 7)
!4049 = !DILocation(line: 1117, column: 9, scope: !4048)
!4050 = !DILocation(line: 1117, column: 28, scope: !4048)
!4051 = !DILocation(line: 1117, column: 34, scope: !4048)
!4052 = !DILocation(line: 1117, column: 8, scope: !4048)
!4053 = !DILocation(line: 1117, column: 7, scope: !4048)
!4054 = !DILocation(line: 1118, column: 8, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4056, file: !24, line: 1118, column: 8)
!4056 = distinct !DILexicalBlock(scope: !4048, file: !24, line: 1117, column: 60)
!4057 = !DILocation(line: 1118, column: 21, scope: !4055)
!4058 = !DILocation(line: 1118, column: 18, scope: !4055)
!4059 = !DILocation(line: 1119, column: 9, scope: !4060)
!4060 = distinct !DILexicalBlock(scope: !4055, file: !24, line: 1119, column: 9)
!4061 = !DILocation(line: 1120, column: 32, scope: !4060)
!4062 = !DILocation(line: 1120, column: 44, scope: !4060)
!4063 = !DILocation(line: 1120, column: 6, scope: !4060)
!4064 = !DILocation(line: 1121, column: 4, scope: !4056)
!4065 = !DILocation(line: 1117, column: 57, scope: !4048)
!4066 = !DILocation(line: 1124, column: 6, scope: !4067)
!4067 = distinct !DILexicalBlock(scope: !3906, file: !24, line: 1124, column: 6)
!4068 = !DILocation(line: 1124, column: 9, scope: !4067)
!4069 = !DILocation(line: 1124, column: 14, scope: !4067)
!4070 = !DILocation(line: 1125, column: 8, scope: !4071)
!4071 = distinct !DILexicalBlock(scope: !4067, file: !24, line: 1125, column: 7)
!4072 = !DILocation(line: 1125, column: 11, scope: !4071)
!4073 = !DILocation(line: 1125, column: 17, scope: !4071)
!4074 = !DILocation(line: 1125, column: 7, scope: !4071)
!4075 = !DILocation(line: 1125, column: 37, scope: !4071)
!4076 = !DILocation(line: 1125, column: 71, scope: !4071)
!4077 = !DILocation(line: 1125, column: 75, scope: !4071)
!4078 = !DILocation(line: 1125, column: 87, scope: !4071)
!4079 = !DILocation(line: 1125, column: 42, scope: !4071)
!4080 = !DILocation(line: 1125, column: 41, scope: !4071)
!4081 = !DILocation(line: 1126, column: 8, scope: !4082)
!4082 = distinct !DILexicalBlock(scope: !4083, file: !24, line: 1126, column: 8)
!4083 = distinct !DILexicalBlock(scope: !4071, file: !24, line: 1125, column: 95)
!4084 = !DILocation(line: 1126, column: 21, scope: !4082)
!4085 = !DILocation(line: 1126, column: 18, scope: !4082)
!4086 = !DILocation(line: 1127, column: 9, scope: !4087)
!4087 = distinct !DILexicalBlock(scope: !4082, file: !24, line: 1127, column: 9)
!4088 = !DILocation(line: 1128, column: 23, scope: !4087)
!4089 = !DILocation(line: 1128, column: 6, scope: !4087)
!4090 = !DILocation(line: 1129, column: 4, scope: !4083)
!4091 = !DILocation(line: 1132, column: 8, scope: !4092)
!4092 = distinct !DILexicalBlock(scope: !4093, file: !24, line: 1132, column: 8)
!4093 = distinct !DILexicalBlock(scope: !4071, file: !24, line: 1131, column: 8)
!4094 = !DILocation(line: 1132, column: 11, scope: !4092)
!4095 = !DILocation(line: 1132, column: 17, scope: !4092)
!4096 = !DILocation(line: 1134, column: 20, scope: !4097)
!4097 = distinct !DILexicalBlock(scope: !4092, file: !24, line: 1133, column: 4)
!4098 = !DILocation(line: 1134, column: 25, scope: !4097)
!4099 = !DILocation(line: 1134, column: 5, scope: !4097)
!4100 = !DILocation(line: 1139, column: 4, scope: !4097)
!4101 = !DILocation(line: 1140, column: 4, scope: !4093)
!4102 = !DILocation(line: 1144, column: 2, scope: !3906)
!4103 = !DILocation(line: 1145, column: 1, scope: !3906)
!4104 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !4106, file: !4105, line: 402, type: !4306, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, declaration: !4305, retainedNodes: !1597)
!4105 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__vector/vector.h", directory: "")
!4106 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<char *, std::__1::allocator<char *> >", scope: !237, file: !4105, line: 86, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !4107, templateParams: !4455, identifier: "_ZTSNSt3__16vectorIPcNS_9allocatorIS1_EEEE")
!4107 = !{!4108, !4179, !4180, !4181, !4187, !4189, !4193, !4197, !4202, !4206, !4209, !4215, !4216, !4221, !4231, !4235, !4240, !4243, !4246, !4250, !4253, !4256, !4260, !4261, !4265, !4271, !4276, !4277, !4278, !4284, !4289, !4290, !4291, !4292, !4293, !4294, !4295, !4298, !4299, !4302, !4303, !4304, !4305, !4310, !4313, !4314, !4315, !4318, !4321, !4322, !4323, !4327, !4331, !4334, !4338, !4339, !4342, !4345, !4348, !4351, !4354, !4357, !4358, !4359, !4360, !4363, !4364, !4365, !4366, !4369, !4370, !4371, !4372, !4373, !4376, !4381, !4387, !4390, !4393, !4412, !4428, !4431, !4434, !4437, !4440, !4441, !4442, !4443, !4444, !4445, !4446, !4447, !4450, !4453, !4454}
!4108 = !DIDerivedType(tag: DW_TAG_member, name: "__begin_", scope: !4106, file: !4105, line: 548, baseType: !4109, size: 64)
!4109 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !4106, file: !4105, line: 102, baseType: !4110, flags: DIFlagPublic)
!4110 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !4112, file: !4111, line: 241, baseType: !4147)
!4111 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator_traits.h", directory: "")
!4112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::__1::allocator<char *> >", scope: !237, file: !4111, line: 238, size: 8, flags: DIFlagTypePassByValue, elements: !4113, templateParams: !4177, identifier: "_ZTSNSt3__116allocator_traitsINS_9allocatorIPcEEEE")
!4113 = !{!4114, !4174}
!4114 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE8allocateB8ne200100ERS3_m", scope: !4112, file: !4111, line: 269, type: !4115, scopeLine: 269, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!4115 = !DISubroutineType(types: !4116)
!4116 = !{!4110, !4117, !4172}
!4117 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4118, size: 64)
!4118 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !4112, file: !4111, line: 239, baseType: !4119)
!4119 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char *>", scope: !237, file: !4120, line: 80, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !4121, templateParams: !4170, identifier: "_ZTSNSt3__19allocatorIPcEE")
!4120 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator.h", directory: "")
!4121 = !{!4122, !4132, !4136, !4141, !4144, !4152, !4160, !4163, !4167}
!4122 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !4119, baseType: !4123, extraData: i32 0)
!4123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__non_trivial_if<true, std::__1::allocator<char *> >", scope: !237, file: !4120, line: 70, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !4124, templateParams: !4129, identifier: "_ZTSNSt3__116__non_trivial_ifILb1ENS_9allocatorIPcEEEE")
!4124 = !{!4125}
!4125 = !DISubprogram(name: "__non_trivial_if", scope: !4123, file: !4120, line: 71, type: !4126, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!4126 = !DISubroutineType(types: !4127)
!4127 = !{null, !4128}
!4128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4123, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4129 = !{!4130, !4131}
!4130 = !DITemplateValueParameter(name: "_Cond", type: !319, value: i8 1)
!4131 = !DITemplateTypeParameter(name: "_Unique", type: !4119)
!4132 = !DISubprogram(name: "allocator", scope: !4119, file: !4120, line: 93, type: !4133, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4133 = !DISubroutineType(types: !4134)
!4134 = !{null, !4135}
!4135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4119, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4136 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100Em", scope: !4119, file: !4120, line: 98, type: !4137, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4137 = !DISubroutineType(types: !4138)
!4138 = !{!783, !4135, !4139}
!4139 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !237, file: !4140, line: 20, baseType: !306)
!4140 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/size_t.h", directory: "")
!4141 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__19allocatorIPcE10deallocateB8ne200100EPS1_m", scope: !4119, file: !4120, line: 116, type: !4142, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4142 = !DISubroutineType(types: !4143)
!4143 = !{null, !4135, !783, !4139}
!4144 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERS1_", scope: !4119, file: !4120, line: 136, type: !4145, scopeLine: 136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4145 = !DISubroutineType(types: !4146)
!4146 = !{!4147, !4148, !4150}
!4147 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !4119, file: !4120, line: 126, baseType: !783, flags: DIFlagPublic)
!4148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4149, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4149 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4119)
!4150 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !4119, file: !4120, line: 128, baseType: !4151, flags: DIFlagPublic)
!4151 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !464, size: 64)
!4152 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERKS1_", scope: !4119, file: !4120, line: 139, type: !4153, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4153 = !DISubroutineType(types: !4154)
!4154 = !{!4155, !4148, !4158}
!4155 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !4119, file: !4120, line: 127, baseType: !4156, flags: DIFlagPublic)
!4156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4157, size: 64)
!4157 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !464)
!4158 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !4119, file: !4120, line: 129, baseType: !4159, flags: DIFlagPublic)
!4159 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4157, size: 64)
!4160 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100EmPKv", scope: !4119, file: !4120, line: 143, type: !4161, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4161 = !DISubroutineType(types: !4162)
!4162 = !{!783, !4135, !4139, !859}
!4163 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__19allocatorIPcE8max_sizeB8ne200100Ev", scope: !4119, file: !4120, line: 147, type: !4164, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4164 = !DISubroutineType(types: !4165)
!4165 = !{!4166, !4148}
!4166 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !4120, line: 85, baseType: !4139, flags: DIFlagPublic)
!4167 = !DISubprogram(name: "destroy", linkageName: "_ZNSt3__19allocatorIPcE7destroyB8ne200100EPS1_", scope: !4119, file: !4120, line: 156, type: !4168, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4168 = !DISubroutineType(types: !4169)
!4169 = !{null, !4135, !4147}
!4170 = !{!4171}
!4171 = !DITemplateTypeParameter(name: "_Tp", type: !464)
!4172 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !4112, file: !4111, line: 246, baseType: !4173)
!4173 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !4119, file: !4120, line: 85, baseType: !4139, flags: DIFlagPublic)
!4174 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE10deallocateB8ne200100ERS3_PS2_m", scope: !4112, file: !4111, line: 301, type: !4175, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!4175 = !DISubroutineType(types: !4176)
!4176 = !{null, !4117, !4110, !4172}
!4177 = !{!4178}
!4178 = !DITemplateTypeParameter(name: "_Alloc", type: !4119)
!4179 = !DIDerivedType(tag: DW_TAG_member, name: "__end_", scope: !4106, file: !4105, line: 549, baseType: !4109, size: 64, offset: 64)
!4180 = !DIDerivedType(tag: DW_TAG_member, name: "__cap_", scope: !4106, file: !4105, line: 550, baseType: !4109, size: 64, align: 8, offset: 128)
!4181 = !DIDerivedType(tag: DW_TAG_member, name: "__padding1_550_", scope: !4106, file: !4105, line: 550, baseType: !4182, size: 8)
!4182 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<char **, true>", scope: !237, file: !4183, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1597, templateParams: !4184, identifier: "_ZTSNSt3__125__compressed_pair_paddingIPPcLb1EEE")
!4183 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/compressed_pair.h", directory: "")
!4184 = !{!4185, !4186}
!4185 = !DITemplateTypeParameter(name: "_ToPad", type: !783)
!4186 = !DITemplateValueParameter(name: "_Empty", type: !319, defaulted: true, value: i8 1)
!4187 = !DIDerivedType(tag: DW_TAG_member, name: "__alloc_", scope: !4106, file: !4105, line: 550, baseType: !4188, size: 8)
!4188 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !4106, file: !4105, line: 96, baseType: !4119, flags: DIFlagPublic)
!4189 = !DIDerivedType(tag: DW_TAG_member, name: "__padding2_550_", scope: !4106, file: !4105, line: 550, baseType: !4190, size: 8)
!4190 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<std::__1::allocator<char *>, true>", scope: !237, file: !4183, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1597, templateParams: !4191, identifier: "_ZTSNSt3__125__compressed_pair_paddingINS_9allocatorIPcEELb1EEE")
!4191 = !{!4192, !4186}
!4192 = !DITemplateTypeParameter(name: "_ToPad", type: !4119)
!4193 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 133, type: !4194, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4194 = !DISubroutineType(types: !4195)
!4195 = !{null, !4196}
!4196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4106, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4197 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 135, type: !4198, scopeLine: 135, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!4198 = !DISubroutineType(types: !4199)
!4199 = !{null, !4196, !4200}
!4200 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4201, size: 64)
!4201 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4188)
!4202 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 144, type: !4203, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!4203 = !DISubroutineType(types: !4204)
!4204 = !{null, !4196, !4205}
!4205 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !4106, file: !4105, line: 100, baseType: !4172, flags: DIFlagPublic)
!4206 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 154, type: !4207, scopeLine: 154, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!4207 = !DISubroutineType(types: !4208)
!4208 = !{null, !4196, !4205, !4200}
!4209 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 165, type: !4210, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4210 = !DISubroutineType(types: !4211)
!4211 = !{null, !4196, !4205, !4212}
!4212 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4213, size: 64)
!4213 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4214)
!4214 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !4106, file: !4105, line: 95, baseType: !464, flags: DIFlagPublic)
!4215 = !DISubprogram(name: "~vector", scope: !4106, file: !4105, line: 259, type: !4194, scopeLine: 259, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4216 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 261, type: !4217, scopeLine: 261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4217 = !DISubroutineType(types: !4218)
!4218 = !{null, !4196, !4219}
!4219 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4220, size: 64)
!4220 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4106)
!4221 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 266, type: !4222, scopeLine: 266, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4222 = !DISubroutineType(types: !4223)
!4223 = !{null, !4196, !4219, !4224}
!4224 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4225, size: 64)
!4225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4226)
!4226 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !4228, file: !4227, line: 22, baseType: !4119)
!4227 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/type_identity.h", directory: "")
!4228 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__type_identity<std::__1::allocator<char *> >", scope: !237, file: !4227, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !1597, templateParams: !4229, identifier: "_ZTSNSt3__115__type_identityINS_9allocatorIPcEEEE")
!4229 = !{!4230}
!4230 = !DITemplateTypeParameter(name: "_Tp", type: !4119)
!4231 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ERKS4_", scope: !4106, file: !4105, line: 270, type: !4232, scopeLine: 270, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4232 = !DISubroutineType(types: !4233)
!4233 = !{!4234, !4196, !4219}
!4234 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4106, size: 64)
!4235 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 273, type: !4236, scopeLine: 273, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4236 = !DISubroutineType(types: !4237)
!4237 = !{null, !4196, !4238}
!4238 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char *>", scope: !238, file: !4239, line: 62, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIPcE")
!4239 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/initializer_list", directory: "")
!4240 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 278, type: !4241, scopeLine: 278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4241 = !DISubroutineType(types: !4242)
!4242 = !{null, !4196, !4238, !4200}
!4243 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ESt16initializer_listIS1_E", scope: !4106, file: !4105, line: 283, type: !4244, scopeLine: 283, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4244 = !DISubroutineType(types: !4245)
!4245 = !{!4234, !4196, !4238}
!4246 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 289, type: !4247, scopeLine: 289, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4247 = !DISubroutineType(types: !4248)
!4248 = !{null, !4196, !4249}
!4249 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !4106, size: 64)
!4250 = !DISubprogram(name: "vector", scope: !4106, file: !4105, line: 297, type: !4251, scopeLine: 297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4251 = !DISubroutineType(types: !4252)
!4252 = !{null, !4196, !4249, !4224}
!4253 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100EOS4_", scope: !4106, file: !4105, line: 298, type: !4254, scopeLine: 298, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4254 = !DISubroutineType(types: !4255)
!4255 = !{!4234, !4196, !4249}
!4256 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignEmRKS1_", scope: !4106, file: !4105, line: 333, type: !4257, scopeLine: 333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4257 = !DISubroutineType(types: !4258)
!4258 = !{null, !4196, !4205, !4259}
!4259 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !4106, file: !4105, line: 99, baseType: !4212, flags: DIFlagPublic)
!4260 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignB8ne200100ESt16initializer_listIS1_E", scope: !4106, file: !4105, line: 336, type: !4236, scopeLine: 336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4261 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE13get_allocatorB8ne200100Ev", scope: !4106, file: !4105, line: 341, type: !4262, scopeLine: 341, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4262 = !DISubroutineType(types: !4263)
!4263 = !{!4188, !4264}
!4264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4220, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4265 = !DISubprogram(name: "begin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !4106, file: !4105, line: 348, type: !4266, scopeLine: 348, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4266 = !DISubroutineType(types: !4267)
!4267 = !{!4268, !4196}
!4268 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !4106, file: !4105, line: 111, baseType: !4269, flags: DIFlagPublic)
!4269 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char **>", scope: !237, file: !4270, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPPcEE")
!4270 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/wrap_iter.h", directory: "")
!4271 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !4106, file: !4105, line: 351, type: !4272, scopeLine: 351, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4272 = !DISubroutineType(types: !4273)
!4273 = !{!4274, !4264}
!4274 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !4106, file: !4105, line: 112, baseType: !4275, flags: DIFlagPublic)
!4275 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char *const *>", scope: !237, file: !4270, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPKPcEE")
!4276 = !DISubprogram(name: "end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !4106, file: !4105, line: 354, type: !4266, scopeLine: 354, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4277 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !4106, file: !4105, line: 357, type: !4272, scopeLine: 357, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4278 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !4106, file: !4105, line: 361, type: !4279, scopeLine: 361, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4279 = !DISubroutineType(types: !4280)
!4280 = !{!4281, !4196}
!4281 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !4106, file: !4105, line: 114, baseType: !4282, flags: DIFlagPublic)
!4282 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char **> >", scope: !237, file: !4283, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPPcEEEE")
!4283 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/reverse_iterator.h", directory: "")
!4284 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !4106, file: !4105, line: 364, type: !4285, scopeLine: 364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4285 = !DISubroutineType(types: !4286)
!4286 = !{!4287, !4264}
!4287 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !4106, file: !4105, line: 115, baseType: !4288, flags: DIFlagPublic)
!4288 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char *const *> >", scope: !237, file: !4283, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPKPcEEEE")
!4289 = !DISubprogram(name: "rend", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !4106, file: !4105, line: 367, type: !4279, scopeLine: 367, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4290 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !4106, file: !4105, line: 370, type: !4285, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4291 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6cbeginB8ne200100Ev", scope: !4106, file: !4105, line: 374, type: !4272, scopeLine: 374, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4292 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4cendB8ne200100Ev", scope: !4106, file: !4105, line: 375, type: !4272, scopeLine: 375, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4293 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE7crbeginB8ne200100Ev", scope: !4106, file: !4105, line: 376, type: !4285, scopeLine: 376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4294 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5crendB8ne200100Ev", scope: !4106, file: !4105, line: 379, type: !4285, scopeLine: 379, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4295 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4sizeB8ne200100Ev", scope: !4106, file: !4105, line: 384, type: !4296, scopeLine: 384, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4296 = !DISubroutineType(types: !4297)
!4297 = !{!4205, !4264}
!4298 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8capacityB8ne200100Ev", scope: !4106, file: !4105, line: 387, type: !4296, scopeLine: 387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4299 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5emptyB8ne200100Ev", scope: !4106, file: !4105, line: 390, type: !4300, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4300 = !DISubroutineType(types: !4301)
!4301 = !{!319, !4264}
!4302 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8max_sizeB8ne200100Ev", scope: !4106, file: !4105, line: 393, type: !4296, scopeLine: 393, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4303 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE7reserveEm", scope: !4106, file: !4105, line: 396, type: !4203, scopeLine: 396, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4304 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13shrink_to_fitEv", scope: !4106, file: !4105, line: 397, type: !4194, scopeLine: 397, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4305 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !4106, file: !4105, line: 402, type: !4306, scopeLine: 402, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4306 = !DISubroutineType(types: !4307)
!4307 = !{!4308, !4196, !4205}
!4308 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !4106, file: !4105, line: 98, baseType: !4309, flags: DIFlagPublic)
!4309 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4214, size: 64)
!4310 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !4106, file: !4105, line: 406, type: !4311, scopeLine: 406, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4311 = !DISubroutineType(types: !4312)
!4312 = !{!4259, !4264, !4205}
!4313 = !DISubprogram(name: "at", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !4106, file: !4105, line: 410, type: !4306, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4314 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !4106, file: !4105, line: 415, type: !4311, scopeLine: 415, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4315 = !DISubprogram(name: "front", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !4106, file: !4105, line: 421, type: !4316, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4316 = !DISubroutineType(types: !4317)
!4317 = !{!4308, !4196}
!4318 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !4106, file: !4105, line: 425, type: !4319, scopeLine: 425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4319 = !DISubroutineType(types: !4320)
!4320 = !{!4259, !4264}
!4321 = !DISubprogram(name: "back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !4106, file: !4105, line: 429, type: !4316, scopeLine: 429, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4322 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !4106, file: !4105, line: 433, type: !4319, scopeLine: 433, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4323 = !DISubprogram(name: "data", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !4106, file: !4105, line: 441, type: !4324, scopeLine: 441, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4324 = !DISubroutineType(types: !4325)
!4325 = !{!4326, !4196}
!4326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4214, size: 64)
!4327 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !4106, file: !4105, line: 445, type: !4328, scopeLine: 445, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4328 = !DISubroutineType(types: !4329)
!4329 = !{!4330, !4264}
!4330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4213, size: 64)
!4331 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100ERKS1_", scope: !4106, file: !4105, line: 452, type: !4332, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4332 = !DISubroutineType(types: !4333)
!4333 = !{null, !4196, !4259}
!4334 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100EOS1_", scope: !4106, file: !4105, line: 454, type: !4335, scopeLine: 454, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4335 = !DISubroutineType(types: !4336)
!4336 = !{null, !4196, !4337}
!4337 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !4214, size: 64)
!4338 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8pop_backB8ne200100Ev", scope: !4106, file: !4105, line: 473, type: !4194, scopeLine: 473, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4339 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EERS6_", scope: !4106, file: !4105, line: 478, type: !4340, scopeLine: 478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4340 = !DISubroutineType(types: !4341)
!4341 = !{!4268, !4196, !4274, !4259}
!4342 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEOS1_", scope: !4106, file: !4105, line: 480, type: !4343, scopeLine: 480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4343 = !DISubroutineType(types: !4344)
!4344 = !{!4268, !4196, !4274, !4337}
!4345 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_", scope: !4106, file: !4105, line: 485, type: !4346, scopeLine: 485, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4346 = !DISubroutineType(types: !4347)
!4347 = !{!4268, !4196, !4274, !4205, !4259}
!4348 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertB8ne200100ENS_11__wrap_iterIPKS1_EESt16initializer_listIS1_E", scope: !4106, file: !4105, line: 521, type: !4349, scopeLine: 521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4349 = !DISubroutineType(types: !4350)
!4350 = !{!4268, !4196, !4274, !4238}
!4351 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseB8ne200100ENS_11__wrap_iterIPKS1_EE", scope: !4106, file: !4105, line: 526, type: !4352, scopeLine: 526, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4352 = !DISubroutineType(types: !4353)
!4353 = !{!4268, !4196, !4274}
!4354 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseENS_11__wrap_iterIPKS1_EES8_", scope: !4106, file: !4105, line: 527, type: !4355, scopeLine: 527, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4355 = !DISubroutineType(types: !4356)
!4356 = !{!4268, !4196, !4274, !4274}
!4357 = !DISubprogram(name: "clear", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5clearB8ne200100Ev", scope: !4106, file: !4105, line: 529, type: !4194, scopeLine: 529, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4358 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEm", scope: !4106, file: !4105, line: 535, type: !4203, scopeLine: 535, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4359 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEmRKS1_", scope: !4106, file: !4105, line: 536, type: !4257, scopeLine: 536, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4360 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4swapERS4_", scope: !4106, file: !4105, line: 538, type: !4361, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4361 = !DISubroutineType(types: !4362)
!4362 = !{null, !4196, !4234}
!4363 = !DISubprogram(name: "__invariants", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE12__invariantsEv", scope: !4106, file: !4105, line: 545, type: !4300, scopeLine: 545, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4364 = !DISubprogram(name: "__vallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__vallocateB8ne200100Em", scope: !4106, file: !4105, line: 559, type: !4203, scopeLine: 559, flags: DIFlagPrototyped, spFlags: 0)
!4365 = !DISubprogram(name: "__vdeallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__vdeallocateEv", scope: !4106, file: !4105, line: 569, type: !4194, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!4366 = !DISubprogram(name: "__recommend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__recommendB8ne200100Em", scope: !4106, file: !4105, line: 570, type: !4367, scopeLine: 570, flags: DIFlagPrototyped, spFlags: 0)
!4367 = !DISubroutineType(types: !4368)
!4368 = !{!4205, !4264, !4205}
!4369 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEm", scope: !4106, file: !4105, line: 571, type: !4203, scopeLine: 571, flags: DIFlagPrototyped, spFlags: 0)
!4370 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEmRKS1_", scope: !4106, file: !4105, line: 572, type: !4257, scopeLine: 572, flags: DIFlagPrototyped, spFlags: 0)
!4371 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEm", scope: !4106, file: !4105, line: 620, type: !4203, scopeLine: 620, flags: DIFlagPrototyped, spFlags: 0)
!4372 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEmRKS1_", scope: !4106, file: !4105, line: 621, type: !4257, scopeLine: 621, flags: DIFlagPrototyped, spFlags: 0)
!4373 = !DISubprogram(name: "__make_iter", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPS1_", scope: !4106, file: !4105, line: 623, type: !4374, scopeLine: 623, flags: DIFlagPrototyped, spFlags: 0)
!4374 = !DISubroutineType(types: !4375)
!4375 = !{!4268, !4196, !4109}
!4376 = !DISubprogram(name: "__make_iter", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPKS1_", scope: !4106, file: !4105, line: 643, type: !4377, scopeLine: 643, flags: DIFlagPrototyped, spFlags: 0)
!4377 = !DISubroutineType(types: !4378)
!4378 = !{!4274, !4264, !4379}
!4379 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !4106, file: !4105, line: 103, baseType: !4380, flags: DIFlagPublic)
!4380 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !4112, file: !4111, line: 242, baseType: !4155)
!4381 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE", scope: !4106, file: !4105, line: 656, type: !4382, scopeLine: 656, flags: DIFlagPrototyped, spFlags: 0)
!4382 = !DISubroutineType(types: !4383)
!4383 = !{null, !4196, !4384}
!4384 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4385, size: 64)
!4385 = !DICompositeType(tag: DW_TAG_structure_type, name: "__split_buffer<char *, std::__1::allocator<char *> &>", scope: !237, file: !4386, line: 52, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__114__split_bufferIPcRNS_9allocatorIS1_EEEE")
!4386 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__split_buffer", directory: "")
!4387 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_", scope: !4106, file: !4105, line: 658, type: !4388, scopeLine: 658, flags: DIFlagPrototyped, spFlags: 0)
!4388 = !DISubroutineType(types: !4389)
!4389 = !{!4109, !4196, !4384, !4109}
!4390 = !DISubprogram(name: "__move_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE12__move_rangeEPS1_S5_S5_", scope: !4106, file: !4105, line: 660, type: !4391, scopeLine: 660, flags: DIFlagPrototyped, spFlags: 0)
!4391 = !DISubroutineType(types: !4392)
!4392 = !{null, !4196, !4109, !4109, !4109}
!4393 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE", scope: !4106, file: !4105, line: 661, type: !4394, scopeLine: 661, flags: DIFlagPrototyped, spFlags: 0)
!4394 = !DISubroutineType(types: !4395)
!4395 = !{null, !4196, !4234, !4396}
!4396 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !237, file: !4397, line: 31, baseType: !4398)
!4397 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/integral_constant.h", directory: "")
!4398 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !237, file: !4397, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !4399, templateParams: !4409, identifier: "_ZTSNSt3__117integral_constantIbLb1EEE")
!4399 = !{!4400, !4402, !4408}
!4400 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !4398, file: !4397, line: 22, baseType: !4401, flags: DIFlagStaticMember, extraData: i1 true)
!4401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !319)
!4402 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb1EEcvbB8ne200100Ev", scope: !4398, file: !4397, line: 25, type: !4403, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!4403 = !DISubroutineType(types: !4404)
!4404 = !{!4405, !4406}
!4405 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !4398, file: !4397, line: 23, baseType: !319)
!4406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4407, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4407 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4398)
!4408 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb1EEclB8ne200100Ev", scope: !4398, file: !4397, line: 27, type: !4403, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!4409 = !{!4410, !4411}
!4410 = !DITemplateTypeParameter(name: "_Tp", type: !319)
!4411 = !DITemplateValueParameter(name: "__v", type: !319, value: i8 1)
!4412 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb0EEE", scope: !4106, file: !4105, line: 663, type: !4413, scopeLine: 663, flags: DIFlagPrototyped, spFlags: 0)
!4413 = !DISubroutineType(types: !4414)
!4414 = !{null, !4196, !4234, !4415}
!4415 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !237, file: !4397, line: 32, baseType: !4416)
!4416 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !237, file: !4397, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !4417, templateParams: !4426, identifier: "_ZTSNSt3__117integral_constantIbLb0EEE")
!4417 = !{!4418, !4419, !4425}
!4418 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !4416, file: !4397, line: 22, baseType: !4401, flags: DIFlagStaticMember, extraData: i1 false)
!4419 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb0EEcvbB8ne200100Ev", scope: !4416, file: !4397, line: 25, type: !4420, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!4420 = !DISubroutineType(types: !4421)
!4421 = !{!4422, !4423}
!4422 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !4416, file: !4397, line: 23, baseType: !319)
!4423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4424, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4424 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4416)
!4425 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb0EEclB8ne200100Ev", scope: !4416, file: !4397, line: 27, type: !4420, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!4426 = !{!4410, !4427}
!4427 = !DITemplateValueParameter(name: "__v", type: !319, value: i8 0)
!4428 = !DISubprogram(name: "__destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_", scope: !4106, file: !4105, line: 665, type: !4429, scopeLine: 665, flags: DIFlagPrototyped, spFlags: 0)
!4429 = !DISubroutineType(types: !4430)
!4430 = !{null, !4196, !4109}
!4431 = !DISubprogram(name: "__annotate_contiguous_container", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE31__annotate_contiguous_containerB8ne200100EPKvS6_", scope: !4106, file: !4105, line: 683, type: !4432, scopeLine: 683, flags: DIFlagPrototyped, spFlags: 0)
!4432 = !DISubroutineType(types: !4433)
!4433 = !{null, !4264, !859, !859}
!4434 = !DISubprogram(name: "__annotate_new", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE14__annotate_newB8ne200100Em", scope: !4106, file: !4105, line: 687, type: !4435, scopeLine: 687, flags: DIFlagPrototyped, spFlags: 0)
!4435 = !DISubroutineType(types: !4436)
!4436 = !{null, !4264, !4205}
!4437 = !DISubprogram(name: "__annotate_delete", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_deleteB8ne200100Ev", scope: !4106, file: !4105, line: 694, type: !4438, scopeLine: 694, flags: DIFlagPrototyped, spFlags: 0)
!4438 = !DISubroutineType(types: !4439)
!4439 = !{null, !4264}
!4440 = !DISubprogram(name: "__annotate_increase", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE19__annotate_increaseB8ne200100Em", scope: !4106, file: !4105, line: 700, type: !4435, scopeLine: 700, flags: DIFlagPrototyped, spFlags: 0)
!4441 = !DISubprogram(name: "__annotate_shrink", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_shrinkB8ne200100Em", scope: !4106, file: !4105, line: 707, type: !4435, scopeLine: 707, flags: DIFlagPrototyped, spFlags: 0)
!4442 = !DISubprogram(name: "__base_destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_", scope: !4106, file: !4105, line: 746, type: !4429, scopeLine: 746, flags: DIFlagPrototyped, spFlags: 0)
!4443 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_", scope: !4106, file: !4105, line: 753, type: !4217, scopeLine: 753, flags: DIFlagPrototyped, spFlags: 0)
!4444 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_", scope: !4106, file: !4105, line: 757, type: !4361, scopeLine: 757, flags: DIFlagPrototyped, spFlags: 0)
!4445 = !DISubprogram(name: "__throw_length_error", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev", scope: !4106, file: !4105, line: 763, type: !836, scopeLine: 763, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!4446 = !DISubprogram(name: "__throw_out_of_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_out_of_rangeB8ne200100Ev", scope: !4106, file: !4105, line: 765, type: !836, scopeLine: 765, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!4447 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb1EEE", scope: !4106, file: !4105, line: 767, type: !4448, scopeLine: 767, flags: DIFlagPrototyped, spFlags: 0)
!4448 = !DISubroutineType(types: !4449)
!4449 = !{null, !4196, !4219, !4396}
!4450 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb0EEE", scope: !4106, file: !4105, line: 777, type: !4451, scopeLine: 777, flags: DIFlagPrototyped, spFlags: 0)
!4451 = !DISubroutineType(types: !4452)
!4452 = !{null, !4196, !4219, !4415}
!4453 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb1EEE", scope: !4106, file: !4105, line: 779, type: !4394, scopeLine: 779, flags: DIFlagPrototyped, spFlags: 0)
!4454 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb0EEE", scope: !4106, file: !4105, line: 784, type: !4413, scopeLine: 784, flags: DIFlagPrototyped, spFlags: 0)
!4455 = !{!4171, !4456}
!4456 = !DITemplateTypeParameter(name: "_Allocator", type: !4119, defaulted: true)
!4457 = !DILocalVariable(name: "this", arg: 1, scope: !4104, type: !4458, flags: DIFlagArtificial | DIFlagObjectPointer)
!4458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4106, size: 64)
!4459 = !DILocation(line: 0, scope: !4104)
!4460 = !DILocalVariable(name: "__n", arg: 2, scope: !4104, file: !4105, line: 402, type: !4205)
!4461 = !DILocation(line: 402, column: 86, scope: !4104)
!4462 = !DILocation(line: 404, column: 18, scope: !4104)
!4463 = !DILocation(line: 404, column: 27, scope: !4104)
!4464 = !DILocation(line: 404, column: 12, scope: !4104)
!4465 = !DILocation(line: 404, column: 5, scope: !4104)
!4466 = distinct !DISubprogram(name: "wall_toggle", linkageName: "_Z11wall_toggleP7segmenti", scope: !24, file: !24, line: 1149, type: !1815, scopeLine: 1150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!4467 = !DILocalVariable(name: "seg", arg: 1, scope: !4466, file: !24, line: 1149, type: !1558)
!4468 = !DILocation(line: 1149, column: 27, scope: !4466)
!4469 = !DILocalVariable(name: "side", arg: 2, scope: !4466, file: !24, line: 1149, type: !7)
!4470 = !DILocation(line: 1149, column: 36, scope: !4466)
!4471 = !DILocalVariable(name: "wall_num", scope: !4466, file: !24, line: 1151, type: !7)
!4472 = !DILocation(line: 1151, column: 6, scope: !4466)
!4473 = !DILocation(line: 1153, column: 2, scope: !4466)
!4474 = !DILocation(line: 1154, column: 2, scope: !4466)
!4475 = !DILocation(line: 1156, column: 13, scope: !4466)
!4476 = !DILocation(line: 1156, column: 18, scope: !4466)
!4477 = !DILocation(line: 1156, column: 24, scope: !4466)
!4478 = !DILocation(line: 1156, column: 30, scope: !4466)
!4479 = !DILocation(line: 1156, column: 11, scope: !4466)
!4480 = !DILocation(line: 1158, column: 6, scope: !4481)
!4481 = distinct !DILexicalBlock(scope: !4466, file: !24, line: 1158, column: 6)
!4482 = !DILocation(line: 1158, column: 15, scope: !4481)
!4483 = !DILocation(line: 1159, column: 3, scope: !4484)
!4484 = distinct !DILexicalBlock(scope: !4481, file: !24, line: 1158, column: 22)
!4485 = !DILocation(line: 1160, column: 3, scope: !4484)
!4486 = !DILocation(line: 1163, column: 6, scope: !4487)
!4487 = distinct !DILexicalBlock(scope: !4466, file: !24, line: 1163, column: 6)
!4488 = !DILocation(line: 1163, column: 20, scope: !4487)
!4489 = !DILocation(line: 1164, column: 30, scope: !4487)
!4490 = !DILocation(line: 1164, column: 34, scope: !4487)
!4491 = !DILocation(line: 1164, column: 46, scope: !4487)
!4492 = !DILocation(line: 1164, column: 3, scope: !4487)
!4493 = !DILocation(line: 1166, column: 12, scope: !4494)
!4494 = distinct !DILexicalBlock(scope: !4466, file: !24, line: 1166, column: 6)
!4495 = !DILocation(line: 1166, column: 6, scope: !4494)
!4496 = !DILocation(line: 1166, column: 22, scope: !4494)
!4497 = !DILocation(line: 1166, column: 27, scope: !4494)
!4498 = !DILocation(line: 1167, column: 16, scope: !4494)
!4499 = !DILocation(line: 1167, column: 21, scope: !4494)
!4500 = !DILocation(line: 1167, column: 3, scope: !4494)
!4501 = !DILocation(line: 1169, column: 13, scope: !4502)
!4502 = distinct !DILexicalBlock(scope: !4466, file: !24, line: 1169, column: 6)
!4503 = !DILocation(line: 1169, column: 7, scope: !4502)
!4504 = !DILocation(line: 1169, column: 23, scope: !4502)
!4505 = !DILocation(line: 1169, column: 28, scope: !4502)
!4506 = !DILocation(line: 1169, column: 42, scope: !4502)
!4507 = !DILocation(line: 1169, column: 52, scope: !4502)
!4508 = !DILocation(line: 1169, column: 46, scope: !4502)
!4509 = !DILocation(line: 1169, column: 62, scope: !4502)
!4510 = !DILocation(line: 1169, column: 68, scope: !4502)
!4511 = !DILocation(line: 1170, column: 18, scope: !4502)
!4512 = !DILocation(line: 1170, column: 23, scope: !4502)
!4513 = !DILocation(line: 1170, column: 3, scope: !4502)
!4514 = !DILocation(line: 1172, column: 1, scope: !4466)
!4515 = distinct !DISubprogram(name: "reset_walls", linkageName: "_Z11reset_wallsv", scope: !24, file: !24, line: 1177, type: !836, scopeLine: 1178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!4516 = !DILocalVariable(name: "i", scope: !4515, file: !24, line: 1208, type: !7)
!4517 = !DILocation(line: 1208, column: 6, scope: !4515)
!4518 = !DILocation(line: 1210, column: 6, scope: !4519)
!4519 = distinct !DILexicalBlock(scope: !4515, file: !24, line: 1210, column: 6)
!4520 = !DILocation(line: 1210, column: 16, scope: !4519)
!4521 = !DILocation(line: 1211, column: 3, scope: !4522)
!4522 = distinct !DILexicalBlock(scope: !4519, file: !24, line: 1210, column: 21)
!4523 = !DILocation(line: 1212, column: 3, scope: !4522)
!4524 = !DILocation(line: 1215, column: 11, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4515, file: !24, line: 1215, column: 2)
!4526 = !DILocation(line: 1215, column: 9, scope: !4525)
!4527 = !DILocation(line: 1215, column: 7, scope: !4525)
!4528 = !DILocation(line: 1215, column: 22, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4525, file: !24, line: 1215, column: 2)
!4530 = !DILocation(line: 1215, column: 24, scope: !4529)
!4531 = !DILocation(line: 1215, column: 2, scope: !4525)
!4532 = !DILocation(line: 1216, column: 9, scope: !4533)
!4533 = distinct !DILexicalBlock(scope: !4529, file: !24, line: 1215, column: 42)
!4534 = !DILocation(line: 1216, column: 3, scope: !4533)
!4535 = !DILocation(line: 1216, column: 12, scope: !4533)
!4536 = !DILocation(line: 1216, column: 17, scope: !4533)
!4537 = !DILocation(line: 1217, column: 9, scope: !4533)
!4538 = !DILocation(line: 1217, column: 3, scope: !4533)
!4539 = !DILocation(line: 1217, column: 12, scope: !4533)
!4540 = !DILocation(line: 1217, column: 18, scope: !4533)
!4541 = !DILocation(line: 1218, column: 9, scope: !4533)
!4542 = !DILocation(line: 1218, column: 3, scope: !4533)
!4543 = !DILocation(line: 1218, column: 12, scope: !4533)
!4544 = !DILocation(line: 1218, column: 16, scope: !4533)
!4545 = !DILocation(line: 1219, column: 9, scope: !4533)
!4546 = !DILocation(line: 1219, column: 3, scope: !4533)
!4547 = !DILocation(line: 1219, column: 12, scope: !4533)
!4548 = !DILocation(line: 1219, column: 20, scope: !4533)
!4549 = !DILocation(line: 1220, column: 9, scope: !4533)
!4550 = !DILocation(line: 1220, column: 3, scope: !4533)
!4551 = !DILocation(line: 1220, column: 12, scope: !4533)
!4552 = !DILocation(line: 1220, column: 21, scope: !4533)
!4553 = !DILocation(line: 1221, column: 2, scope: !4533)
!4554 = !DILocation(line: 1215, column: 38, scope: !4529)
!4555 = !DILocation(line: 1215, column: 2, scope: !4529)
!4556 = distinct !{!4556, !4531, !4557, !1964}
!4557 = !DILocation(line: 1221, column: 2, scope: !4525)
!4558 = !DILocation(line: 1222, column: 1, scope: !4515)
!4559 = distinct !DISubprogram(name: "do_cloaking_wall_frame", linkageName: "_Z22do_cloaking_wall_framei", scope: !24, file: !24, line: 1224, type: !845, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!4560 = !DILocalVariable(name: "cloaking_wall_num", arg: 1, scope: !4559, file: !24, line: 1224, type: !7)
!4561 = !DILocation(line: 1224, column: 33, scope: !4559)
!4562 = !DILocalVariable(name: "d", scope: !4559, file: !24, line: 1226, type: !2396)
!4563 = !DILocation(line: 1226, column: 17, scope: !4559)
!4564 = !DILocalVariable(name: "wfront", scope: !4559, file: !24, line: 1227, type: !2137)
!4565 = !DILocation(line: 1227, column: 8, scope: !4559)
!4566 = !DILocalVariable(name: "wback", scope: !4559, file: !24, line: 1227, type: !2137)
!4567 = !DILocation(line: 1227, column: 18, scope: !4559)
!4568 = !DILocation(line: 1229, column: 6, scope: !4569)
!4569 = distinct !DILexicalBlock(scope: !4559, file: !24, line: 1229, column: 6)
!4570 = !DILocation(line: 1229, column: 20, scope: !4569)
!4571 = !DILocation(line: 1229, column: 42, scope: !4569)
!4572 = !DILocation(line: 1231, column: 21, scope: !4559)
!4573 = !DILocation(line: 1231, column: 7, scope: !4559)
!4574 = !DILocation(line: 1231, column: 4, scope: !4559)
!4575 = !DILocation(line: 1232, column: 18, scope: !4559)
!4576 = !DILocation(line: 1232, column: 21, scope: !4559)
!4577 = !DILocation(line: 1232, column: 12, scope: !4559)
!4578 = !DILocation(line: 1232, column: 9, scope: !4559)
!4579 = !DILocation(line: 1233, column: 17, scope: !4559)
!4580 = !DILocation(line: 1233, column: 20, scope: !4559)
!4581 = !DILocation(line: 1233, column: 11, scope: !4559)
!4582 = !DILocation(line: 1233, column: 8, scope: !4559)
!4583 = !DILocation(line: 1235, column: 13, scope: !4559)
!4584 = !DILocation(line: 1235, column: 2, scope: !4559)
!4585 = !DILocation(line: 1235, column: 5, scope: !4559)
!4586 = !DILocation(line: 1235, column: 10, scope: !4559)
!4587 = !DILocation(line: 1237, column: 6, scope: !4588)
!4588 = distinct !DILexicalBlock(scope: !4559, file: !24, line: 1237, column: 6)
!4589 = !DILocation(line: 1237, column: 9, scope: !4588)
!4590 = !DILocation(line: 1237, column: 14, scope: !4588)
!4591 = !DILocalVariable(name: "i", scope: !4592, file: !24, line: 1238, type: !7)
!4592 = distinct !DILexicalBlock(scope: !4588, file: !24, line: 1237, column: 36)
!4593 = !DILocation(line: 1238, column: 7, scope: !4592)
!4594 = !DILocation(line: 1240, column: 18, scope: !4592)
!4595 = !DILocation(line: 1240, column: 25, scope: !4592)
!4596 = !DILocation(line: 1240, column: 30, scope: !4592)
!4597 = !DILocation(line: 1240, column: 3, scope: !4592)
!4598 = !DILocation(line: 1240, column: 11, scope: !4592)
!4599 = !DILocation(line: 1240, column: 16, scope: !4592)
!4600 = !DILocation(line: 1241, column: 19, scope: !4592)
!4601 = !DILocation(line: 1241, column: 26, scope: !4592)
!4602 = !DILocation(line: 1241, column: 32, scope: !4592)
!4603 = !DILocation(line: 1241, column: 3, scope: !4592)
!4604 = !DILocation(line: 1241, column: 11, scope: !4592)
!4605 = !DILocation(line: 1241, column: 17, scope: !4592)
!4606 = !DILocation(line: 1243, column: 12, scope: !4607)
!4607 = distinct !DILexicalBlock(scope: !4592, file: !24, line: 1243, column: 3)
!4608 = !DILocation(line: 1243, column: 10, scope: !4607)
!4609 = !DILocation(line: 1243, column: 8, scope: !4607)
!4610 = !DILocation(line: 1243, column: 31, scope: !4611)
!4611 = distinct !DILexicalBlock(scope: !4607, file: !24, line: 1243, column: 3)
!4612 = !DILocation(line: 1243, column: 35, scope: !4611)
!4613 = !DILocation(line: 1243, column: 33, scope: !4611)
!4614 = !DILocation(line: 1243, column: 3, scope: !4607)
!4615 = !DILocation(line: 1244, column: 37, scope: !4611)
!4616 = !DILocation(line: 1244, column: 39, scope: !4611)
!4617 = !DILocation(line: 1244, column: 23, scope: !4611)
!4618 = !DILocation(line: 1244, column: 18, scope: !4611)
!4619 = !DILocation(line: 1244, column: 4, scope: !4611)
!4620 = !DILocation(line: 1244, column: 21, scope: !4611)
!4621 = !DILocation(line: 1243, column: 56, scope: !4611)
!4622 = !DILocation(line: 1243, column: 3, scope: !4611)
!4623 = distinct !{!4623, !4614, !4624, !1964}
!4624 = !DILocation(line: 1244, column: 42, scope: !4607)
!4625 = !DILocation(line: 1245, column: 21, scope: !4592)
!4626 = !DILocation(line: 1247, column: 2, scope: !4592)
!4627 = !DILocation(line: 1248, column: 11, scope: !4628)
!4628 = distinct !DILexicalBlock(scope: !4588, file: !24, line: 1248, column: 11)
!4629 = !DILocation(line: 1248, column: 14, scope: !4628)
!4630 = !DILocation(line: 1248, column: 19, scope: !4628)
!4631 = !DILocalVariable(name: "old_type", scope: !4632, file: !24, line: 1249, type: !7)
!4632 = distinct !DILexicalBlock(scope: !4628, file: !24, line: 1248, column: 45)
!4633 = !DILocation(line: 1249, column: 7, scope: !4632)
!4634 = !DILocation(line: 1249, column: 18, scope: !4632)
!4635 = !DILocation(line: 1249, column: 26, scope: !4632)
!4636 = !DILocation(line: 1251, column: 48, scope: !4632)
!4637 = !DILocation(line: 1251, column: 51, scope: !4632)
!4638 = !DILocation(line: 1251, column: 56, scope: !4632)
!4639 = !DILocation(line: 1251, column: 82, scope: !4632)
!4640 = !DILocation(line: 1251, column: 106, scope: !4632)
!4641 = !DILocation(line: 1251, column: 46, scope: !4632)
!4642 = !DILocation(line: 1251, column: 25, scope: !4632)
!4643 = !DILocation(line: 1251, column: 32, scope: !4632)
!4644 = !DILocation(line: 1251, column: 44, scope: !4632)
!4645 = !DILocation(line: 1251, column: 3, scope: !4632)
!4646 = !DILocation(line: 1251, column: 11, scope: !4632)
!4647 = !DILocation(line: 1251, column: 23, scope: !4632)
!4648 = !DILocation(line: 1253, column: 7, scope: !4649)
!4649 = distinct !DILexicalBlock(scope: !4632, file: !24, line: 1253, column: 7)
!4650 = !DILocation(line: 1253, column: 16, scope: !4649)
!4651 = !DILocalVariable(name: "i", scope: !4652, file: !24, line: 1254, type: !7)
!4652 = distinct !DILexicalBlock(scope: !4649, file: !24, line: 1253, column: 33)
!4653 = !DILocation(line: 1254, column: 8, scope: !4652)
!4654 = !DILocation(line: 1256, column: 19, scope: !4652)
!4655 = !DILocation(line: 1256, column: 26, scope: !4652)
!4656 = !DILocation(line: 1256, column: 31, scope: !4652)
!4657 = !DILocation(line: 1256, column: 4, scope: !4652)
!4658 = !DILocation(line: 1256, column: 12, scope: !4652)
!4659 = !DILocation(line: 1256, column: 17, scope: !4652)
!4660 = !DILocation(line: 1258, column: 11, scope: !4661)
!4661 = distinct !DILexicalBlock(scope: !4652, file: !24, line: 1258, column: 4)
!4662 = !DILocation(line: 1258, column: 9, scope: !4661)
!4663 = !DILocation(line: 1258, column: 16, scope: !4664)
!4664 = distinct !DILexicalBlock(scope: !4661, file: !24, line: 1258, column: 4)
!4665 = !DILocation(line: 1258, column: 18, scope: !4664)
!4666 = !DILocation(line: 1258, column: 4, scope: !4661)
!4667 = !DILocation(line: 1259, column: 65, scope: !4668)
!4668 = distinct !DILexicalBlock(scope: !4664, file: !24, line: 1258, column: 28)
!4669 = !DILocation(line: 1259, column: 68, scope: !4668)
!4670 = !DILocation(line: 1259, column: 77, scope: !4668)
!4671 = !DILocation(line: 1259, column: 14, scope: !4668)
!4672 = !DILocation(line: 1259, column: 22, scope: !4668)
!4673 = !DILocation(line: 1259, column: 5, scope: !4668)
!4674 = !DILocation(line: 1259, column: 30, scope: !4668)
!4675 = !DILocation(line: 1259, column: 36, scope: !4668)
!4676 = !DILocation(line: 1259, column: 44, scope: !4668)
!4677 = !DILocation(line: 1259, column: 53, scope: !4668)
!4678 = !DILocation(line: 1259, column: 58, scope: !4668)
!4679 = !DILocation(line: 1259, column: 61, scope: !4668)
!4680 = !DILocation(line: 1259, column: 63, scope: !4668)
!4681 = !DILocation(line: 1260, column: 63, scope: !4668)
!4682 = !DILocation(line: 1260, column: 66, scope: !4668)
!4683 = !DILocation(line: 1260, column: 74, scope: !4668)
!4684 = !DILocation(line: 1260, column: 14, scope: !4668)
!4685 = !DILocation(line: 1260, column: 21, scope: !4668)
!4686 = !DILocation(line: 1260, column: 5, scope: !4668)
!4687 = !DILocation(line: 1260, column: 29, scope: !4668)
!4688 = !DILocation(line: 1260, column: 35, scope: !4668)
!4689 = !DILocation(line: 1260, column: 42, scope: !4668)
!4690 = !DILocation(line: 1260, column: 51, scope: !4668)
!4691 = !DILocation(line: 1260, column: 56, scope: !4668)
!4692 = !DILocation(line: 1260, column: 59, scope: !4668)
!4693 = !DILocation(line: 1260, column: 61, scope: !4668)
!4694 = !DILocation(line: 1261, column: 4, scope: !4668)
!4695 = !DILocation(line: 1258, column: 24, scope: !4664)
!4696 = !DILocation(line: 1258, column: 4, scope: !4664)
!4697 = distinct !{!4697, !4666, !4698, !1964}
!4698 = !DILocation(line: 1261, column: 4, scope: !4661)
!4699 = !DILocation(line: 1262, column: 3, scope: !4652)
!4700 = !DILocation(line: 1263, column: 2, scope: !4632)
!4701 = !DILocalVariable(name: "light_scale", scope: !4702, file: !24, line: 1265, type: !14)
!4702 = distinct !DILexicalBlock(scope: !4628, file: !24, line: 1264, column: 7)
!4703 = !DILocation(line: 1265, column: 7, scope: !4702)
!4704 = !DILocalVariable(name: "i", scope: !4702, file: !24, line: 1266, type: !7)
!4705 = !DILocation(line: 1266, column: 7, scope: !4702)
!4706 = !DILocation(line: 1268, column: 49, scope: !4702)
!4707 = !DILocation(line: 1268, column: 52, scope: !4702)
!4708 = !DILocation(line: 1268, column: 47, scope: !4702)
!4709 = !DILocation(line: 1268, column: 17, scope: !4702)
!4710 = !DILocation(line: 1268, column: 15, scope: !4702)
!4711 = !DILocation(line: 1270, column: 10, scope: !4712)
!4712 = distinct !DILexicalBlock(scope: !4702, file: !24, line: 1270, column: 3)
!4713 = !DILocation(line: 1270, column: 8, scope: !4712)
!4714 = !DILocation(line: 1270, column: 15, scope: !4715)
!4715 = distinct !DILexicalBlock(scope: !4712, file: !24, line: 1270, column: 3)
!4716 = !DILocation(line: 1270, column: 17, scope: !4715)
!4717 = !DILocation(line: 1270, column: 3, scope: !4712)
!4718 = !DILocation(line: 1271, column: 71, scope: !4719)
!4719 = distinct !DILexicalBlock(scope: !4715, file: !24, line: 1270, column: 27)
!4720 = !DILocation(line: 1271, column: 74, scope: !4719)
!4721 = !DILocation(line: 1271, column: 83, scope: !4719)
!4722 = !DILocation(line: 1271, column: 87, scope: !4719)
!4723 = !DILocation(line: 1271, column: 64, scope: !4719)
!4724 = !DILocation(line: 1271, column: 13, scope: !4719)
!4725 = !DILocation(line: 1271, column: 21, scope: !4719)
!4726 = !DILocation(line: 1271, column: 4, scope: !4719)
!4727 = !DILocation(line: 1271, column: 29, scope: !4719)
!4728 = !DILocation(line: 1271, column: 35, scope: !4719)
!4729 = !DILocation(line: 1271, column: 43, scope: !4719)
!4730 = !DILocation(line: 1271, column: 52, scope: !4719)
!4731 = !DILocation(line: 1271, column: 57, scope: !4719)
!4732 = !DILocation(line: 1271, column: 60, scope: !4719)
!4733 = !DILocation(line: 1271, column: 62, scope: !4719)
!4734 = !DILocation(line: 1272, column: 69, scope: !4719)
!4735 = !DILocation(line: 1272, column: 72, scope: !4719)
!4736 = !DILocation(line: 1272, column: 80, scope: !4719)
!4737 = !DILocation(line: 1272, column: 84, scope: !4719)
!4738 = !DILocation(line: 1272, column: 62, scope: !4719)
!4739 = !DILocation(line: 1272, column: 13, scope: !4719)
!4740 = !DILocation(line: 1272, column: 20, scope: !4719)
!4741 = !DILocation(line: 1272, column: 4, scope: !4719)
!4742 = !DILocation(line: 1272, column: 28, scope: !4719)
!4743 = !DILocation(line: 1272, column: 34, scope: !4719)
!4744 = !DILocation(line: 1272, column: 41, scope: !4719)
!4745 = !DILocation(line: 1272, column: 50, scope: !4719)
!4746 = !DILocation(line: 1272, column: 55, scope: !4719)
!4747 = !DILocation(line: 1272, column: 58, scope: !4719)
!4748 = !DILocation(line: 1272, column: 60, scope: !4719)
!4749 = !DILocation(line: 1273, column: 3, scope: !4719)
!4750 = !DILocation(line: 1270, column: 23, scope: !4715)
!4751 = !DILocation(line: 1270, column: 3, scope: !4715)
!4752 = distinct !{!4752, !4717, !4753, !1964}
!4753 = !DILocation(line: 1273, column: 3, scope: !4712)
!4754 = !DILocation(line: 1276, column: 6, scope: !4755)
!4755 = distinct !DILexicalBlock(scope: !4559, file: !24, line: 1276, column: 6)
!4756 = !DILocation(line: 1276, column: 20, scope: !4755)
!4757 = !DILocation(line: 1277, column: 32, scope: !4755)
!4758 = !DILocation(line: 1277, column: 35, scope: !4755)
!4759 = !DILocation(line: 1277, column: 50, scope: !4755)
!4760 = !DILocation(line: 1277, column: 53, scope: !4755)
!4761 = !DILocation(line: 1277, column: 67, scope: !4755)
!4762 = !DILocation(line: 1277, column: 75, scope: !4755)
!4763 = !DILocation(line: 1277, column: 81, scope: !4755)
!4764 = !DILocation(line: 1277, column: 89, scope: !4755)
!4765 = !DILocation(line: 1277, column: 96, scope: !4755)
!4766 = !DILocation(line: 1277, column: 104, scope: !4755)
!4767 = !DILocation(line: 1277, column: 126, scope: !4755)
!4768 = !DILocation(line: 1277, column: 134, scope: !4755)
!4769 = !DILocation(line: 1277, column: 117, scope: !4755)
!4770 = !DILocation(line: 1277, column: 142, scope: !4755)
!4771 = !DILocation(line: 1277, column: 148, scope: !4755)
!4772 = !DILocation(line: 1277, column: 156, scope: !4755)
!4773 = !DILocation(line: 1277, column: 165, scope: !4755)
!4774 = !DILocation(line: 1277, column: 173, scope: !4755)
!4775 = !DILocation(line: 1277, column: 185, scope: !4755)
!4776 = !DILocation(line: 1277, column: 193, scope: !4755)
!4777 = !DILocation(line: 1277, column: 176, scope: !4755)
!4778 = !DILocation(line: 1277, column: 201, scope: !4755)
!4779 = !DILocation(line: 1277, column: 207, scope: !4755)
!4780 = !DILocation(line: 1277, column: 215, scope: !4755)
!4781 = !DILocation(line: 1277, column: 224, scope: !4755)
!4782 = !DILocation(line: 1277, column: 232, scope: !4755)
!4783 = !DILocation(line: 1277, column: 244, scope: !4755)
!4784 = !DILocation(line: 1277, column: 252, scope: !4755)
!4785 = !DILocation(line: 1277, column: 235, scope: !4755)
!4786 = !DILocation(line: 1277, column: 260, scope: !4755)
!4787 = !DILocation(line: 1277, column: 266, scope: !4755)
!4788 = !DILocation(line: 1277, column: 274, scope: !4755)
!4789 = !DILocation(line: 1277, column: 283, scope: !4755)
!4790 = !DILocation(line: 1277, column: 291, scope: !4755)
!4791 = !DILocation(line: 1277, column: 303, scope: !4755)
!4792 = !DILocation(line: 1277, column: 311, scope: !4755)
!4793 = !DILocation(line: 1277, column: 294, scope: !4755)
!4794 = !DILocation(line: 1277, column: 319, scope: !4755)
!4795 = !DILocation(line: 1277, column: 325, scope: !4755)
!4796 = !DILocation(line: 1277, column: 333, scope: !4755)
!4797 = !DILocation(line: 1277, column: 342, scope: !4755)
!4798 = !DILocation(line: 1277, column: 350, scope: !4755)
!4799 = !DILocation(line: 1277, column: 3, scope: !4755)
!4800 = !DILocation(line: 1279, column: 1, scope: !4559)
!4801 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !15, file: !15, line: 89, type: !4802, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!4802 = !DISubroutineType(types: !4803)
!4803 = !{!14, !14, !14}
!4804 = !DILocalVariable(name: "a", arg: 1, scope: !4801, file: !15, line: 89, type: !14)
!4805 = !DILocation(line: 89, column: 26, scope: !4801)
!4806 = !DILocalVariable(name: "b", arg: 2, scope: !4801, file: !15, line: 89, type: !14)
!4807 = !DILocation(line: 89, column: 33, scope: !4801)
!4808 = !DILocation(line: 92, column: 6, scope: !4809)
!4809 = distinct !DILexicalBlock(scope: !4801, file: !15, line: 92, column: 6)
!4810 = !DILocation(line: 92, column: 8, scope: !4809)
!4811 = !DILocation(line: 92, column: 14, scope: !4809)
!4812 = !DILocation(line: 94, column: 25, scope: !4801)
!4813 = !DILocation(line: 94, column: 27, scope: !4801)
!4814 = !DILocation(line: 94, column: 36, scope: !4801)
!4815 = !DILocation(line: 94, column: 34, scope: !4801)
!4816 = !DILocation(line: 94, column: 14, scope: !4801)
!4817 = !DILocation(line: 94, column: 2, scope: !4801)
!4818 = !DILocation(line: 95, column: 1, scope: !4801)
!4819 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !15, file: !15, line: 83, type: !4802, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!4820 = !DILocalVariable(name: "a", arg: 1, scope: !4819, file: !15, line: 83, type: !14)
!4821 = !DILocation(line: 83, column: 26, scope: !4819)
!4822 = !DILocalVariable(name: "b", arg: 2, scope: !4819, file: !15, line: 83, type: !14)
!4823 = !DILocation(line: 83, column: 33, scope: !4819)
!4824 = !DILocation(line: 85, column: 19, scope: !4819)
!4825 = !DILocation(line: 85, column: 32, scope: !4819)
!4826 = !DILocation(line: 85, column: 21, scope: !4819)
!4827 = !DILocation(line: 85, column: 35, scope: !4819)
!4828 = !DILocation(line: 85, column: 9, scope: !4819)
!4829 = !DILocation(line: 85, column: 2, scope: !4819)
!4830 = distinct !DISubprogram(name: "do_decloaking_wall_frame", linkageName: "_Z24do_decloaking_wall_framei", scope: !24, file: !24, line: 1281, type: !845, scopeLine: 1282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!4831 = !DILocalVariable(name: "cloaking_wall_num", arg: 1, scope: !4830, file: !24, line: 1281, type: !7)
!4832 = !DILocation(line: 1281, column: 35, scope: !4830)
!4833 = !DILocalVariable(name: "d", scope: !4830, file: !24, line: 1283, type: !2396)
!4834 = !DILocation(line: 1283, column: 17, scope: !4830)
!4835 = !DILocalVariable(name: "wfront", scope: !4830, file: !24, line: 1284, type: !2137)
!4836 = !DILocation(line: 1284, column: 8, scope: !4830)
!4837 = !DILocalVariable(name: "wback", scope: !4830, file: !24, line: 1284, type: !2137)
!4838 = !DILocation(line: 1284, column: 18, scope: !4830)
!4839 = !DILocation(line: 1286, column: 6, scope: !4840)
!4840 = distinct !DILexicalBlock(scope: !4830, file: !24, line: 1286, column: 6)
!4841 = !DILocation(line: 1286, column: 20, scope: !4840)
!4842 = !DILocation(line: 1286, column: 42, scope: !4840)
!4843 = !DILocation(line: 1288, column: 21, scope: !4830)
!4844 = !DILocation(line: 1288, column: 7, scope: !4830)
!4845 = !DILocation(line: 1288, column: 4, scope: !4830)
!4846 = !DILocation(line: 1289, column: 18, scope: !4830)
!4847 = !DILocation(line: 1289, column: 21, scope: !4830)
!4848 = !DILocation(line: 1289, column: 12, scope: !4830)
!4849 = !DILocation(line: 1289, column: 9, scope: !4830)
!4850 = !DILocation(line: 1290, column: 17, scope: !4830)
!4851 = !DILocation(line: 1290, column: 20, scope: !4830)
!4852 = !DILocation(line: 1290, column: 11, scope: !4830)
!4853 = !DILocation(line: 1290, column: 8, scope: !4830)
!4854 = !DILocation(line: 1292, column: 13, scope: !4830)
!4855 = !DILocation(line: 1292, column: 2, scope: !4830)
!4856 = !DILocation(line: 1292, column: 5, scope: !4830)
!4857 = !DILocation(line: 1292, column: 10, scope: !4830)
!4858 = !DILocation(line: 1294, column: 6, scope: !4859)
!4859 = distinct !DILexicalBlock(scope: !4830, file: !24, line: 1294, column: 6)
!4860 = !DILocation(line: 1294, column: 9, scope: !4859)
!4861 = !DILocation(line: 1294, column: 14, scope: !4859)
!4862 = !DILocalVariable(name: "i", scope: !4863, file: !24, line: 1295, type: !7)
!4863 = distinct !DILexicalBlock(scope: !4859, file: !24, line: 1294, column: 36)
!4864 = !DILocation(line: 1295, column: 7, scope: !4863)
!4865 = !DILocation(line: 1297, column: 19, scope: !4863)
!4866 = !DILocation(line: 1297, column: 26, scope: !4863)
!4867 = !DILocation(line: 1297, column: 32, scope: !4863)
!4868 = !DILocation(line: 1297, column: 3, scope: !4863)
!4869 = !DILocation(line: 1297, column: 11, scope: !4863)
!4870 = !DILocation(line: 1297, column: 17, scope: !4863)
!4871 = !DILocation(line: 1299, column: 10, scope: !4872)
!4872 = distinct !DILexicalBlock(scope: !4863, file: !24, line: 1299, column: 3)
!4873 = !DILocation(line: 1299, column: 8, scope: !4872)
!4874 = !DILocation(line: 1299, column: 15, scope: !4875)
!4875 = distinct !DILexicalBlock(scope: !4872, file: !24, line: 1299, column: 3)
!4876 = !DILocation(line: 1299, column: 17, scope: !4875)
!4877 = !DILocation(line: 1299, column: 3, scope: !4872)
!4878 = !DILocation(line: 1300, column: 64, scope: !4879)
!4879 = distinct !DILexicalBlock(scope: !4875, file: !24, line: 1299, column: 27)
!4880 = !DILocation(line: 1300, column: 67, scope: !4879)
!4881 = !DILocation(line: 1300, column: 76, scope: !4879)
!4882 = !DILocation(line: 1300, column: 13, scope: !4879)
!4883 = !DILocation(line: 1300, column: 21, scope: !4879)
!4884 = !DILocation(line: 1300, column: 4, scope: !4879)
!4885 = !DILocation(line: 1300, column: 29, scope: !4879)
!4886 = !DILocation(line: 1300, column: 35, scope: !4879)
!4887 = !DILocation(line: 1300, column: 43, scope: !4879)
!4888 = !DILocation(line: 1300, column: 52, scope: !4879)
!4889 = !DILocation(line: 1300, column: 57, scope: !4879)
!4890 = !DILocation(line: 1300, column: 60, scope: !4879)
!4891 = !DILocation(line: 1300, column: 62, scope: !4879)
!4892 = !DILocation(line: 1301, column: 62, scope: !4879)
!4893 = !DILocation(line: 1301, column: 65, scope: !4879)
!4894 = !DILocation(line: 1301, column: 73, scope: !4879)
!4895 = !DILocation(line: 1301, column: 13, scope: !4879)
!4896 = !DILocation(line: 1301, column: 20, scope: !4879)
!4897 = !DILocation(line: 1301, column: 4, scope: !4879)
!4898 = !DILocation(line: 1301, column: 28, scope: !4879)
!4899 = !DILocation(line: 1301, column: 34, scope: !4879)
!4900 = !DILocation(line: 1301, column: 41, scope: !4879)
!4901 = !DILocation(line: 1301, column: 50, scope: !4879)
!4902 = !DILocation(line: 1301, column: 55, scope: !4879)
!4903 = !DILocation(line: 1301, column: 58, scope: !4879)
!4904 = !DILocation(line: 1301, column: 60, scope: !4879)
!4905 = !DILocation(line: 1302, column: 3, scope: !4879)
!4906 = !DILocation(line: 1299, column: 23, scope: !4875)
!4907 = !DILocation(line: 1299, column: 3, scope: !4875)
!4908 = distinct !{!4908, !4877, !4909, !1964}
!4909 = !DILocation(line: 1302, column: 3, scope: !4872)
!4910 = !DILocation(line: 1304, column: 12, scope: !4911)
!4911 = distinct !DILexicalBlock(scope: !4863, file: !24, line: 1304, column: 3)
!4912 = !DILocation(line: 1304, column: 10, scope: !4911)
!4913 = !DILocation(line: 1304, column: 8, scope: !4911)
!4914 = !DILocation(line: 1304, column: 31, scope: !4915)
!4915 = distinct !DILexicalBlock(scope: !4911, file: !24, line: 1304, column: 3)
!4916 = !DILocation(line: 1304, column: 35, scope: !4915)
!4917 = !DILocation(line: 1304, column: 33, scope: !4915)
!4918 = !DILocation(line: 1304, column: 3, scope: !4911)
!4919 = !DILocation(line: 1305, column: 37, scope: !4915)
!4920 = !DILocation(line: 1305, column: 39, scope: !4915)
!4921 = !DILocation(line: 1305, column: 23, scope: !4915)
!4922 = !DILocation(line: 1305, column: 18, scope: !4915)
!4923 = !DILocation(line: 1305, column: 4, scope: !4915)
!4924 = !DILocation(line: 1305, column: 21, scope: !4915)
!4925 = !DILocation(line: 1304, column: 56, scope: !4915)
!4926 = !DILocation(line: 1304, column: 3, scope: !4915)
!4927 = distinct !{!4927, !4918, !4928, !1964}
!4928 = !DILocation(line: 1305, column: 42, scope: !4911)
!4929 = !DILocation(line: 1306, column: 21, scope: !4863)
!4930 = !DILocation(line: 1308, column: 2, scope: !4863)
!4931 = !DILocation(line: 1309, column: 11, scope: !4932)
!4932 = distinct !DILexicalBlock(scope: !4859, file: !24, line: 1309, column: 11)
!4933 = !DILocation(line: 1309, column: 14, scope: !4932)
!4934 = !DILocation(line: 1309, column: 19, scope: !4932)
!4935 = !DILocalVariable(name: "light_scale", scope: !4936, file: !24, line: 1310, type: !14)
!4936 = distinct !DILexicalBlock(scope: !4932, file: !24, line: 1309, column: 45)
!4937 = !DILocation(line: 1310, column: 7, scope: !4936)
!4938 = !DILocalVariable(name: "i", scope: !4936, file: !24, line: 1311, type: !7)
!4939 = !DILocation(line: 1311, column: 7, scope: !4936)
!4940 = !DILocation(line: 1313, column: 18, scope: !4936)
!4941 = !DILocation(line: 1313, column: 25, scope: !4936)
!4942 = !DILocation(line: 1313, column: 30, scope: !4936)
!4943 = !DILocation(line: 1313, column: 3, scope: !4936)
!4944 = !DILocation(line: 1313, column: 11, scope: !4936)
!4945 = !DILocation(line: 1313, column: 16, scope: !4936)
!4946 = !DILocation(line: 1315, column: 24, scope: !4936)
!4947 = !DILocation(line: 1315, column: 27, scope: !4936)
!4948 = !DILocation(line: 1315, column: 32, scope: !4936)
!4949 = !DILocation(line: 1315, column: 17, scope: !4936)
!4950 = !DILocation(line: 1315, column: 15, scope: !4936)
!4951 = !DILocation(line: 1317, column: 10, scope: !4952)
!4952 = distinct !DILexicalBlock(scope: !4936, file: !24, line: 1317, column: 3)
!4953 = !DILocation(line: 1317, column: 8, scope: !4952)
!4954 = !DILocation(line: 1317, column: 15, scope: !4955)
!4955 = distinct !DILexicalBlock(scope: !4952, file: !24, line: 1317, column: 3)
!4956 = !DILocation(line: 1317, column: 17, scope: !4955)
!4957 = !DILocation(line: 1317, column: 3, scope: !4952)
!4958 = !DILocation(line: 1318, column: 71, scope: !4959)
!4959 = distinct !DILexicalBlock(scope: !4955, file: !24, line: 1317, column: 27)
!4960 = !DILocation(line: 1318, column: 74, scope: !4959)
!4961 = !DILocation(line: 1318, column: 83, scope: !4959)
!4962 = !DILocation(line: 1318, column: 87, scope: !4959)
!4963 = !DILocation(line: 1318, column: 64, scope: !4959)
!4964 = !DILocation(line: 1318, column: 13, scope: !4959)
!4965 = !DILocation(line: 1318, column: 21, scope: !4959)
!4966 = !DILocation(line: 1318, column: 4, scope: !4959)
!4967 = !DILocation(line: 1318, column: 29, scope: !4959)
!4968 = !DILocation(line: 1318, column: 35, scope: !4959)
!4969 = !DILocation(line: 1318, column: 43, scope: !4959)
!4970 = !DILocation(line: 1318, column: 52, scope: !4959)
!4971 = !DILocation(line: 1318, column: 57, scope: !4959)
!4972 = !DILocation(line: 1318, column: 60, scope: !4959)
!4973 = !DILocation(line: 1318, column: 62, scope: !4959)
!4974 = !DILocation(line: 1319, column: 69, scope: !4959)
!4975 = !DILocation(line: 1319, column: 72, scope: !4959)
!4976 = !DILocation(line: 1319, column: 80, scope: !4959)
!4977 = !DILocation(line: 1319, column: 84, scope: !4959)
!4978 = !DILocation(line: 1319, column: 62, scope: !4959)
!4979 = !DILocation(line: 1319, column: 13, scope: !4959)
!4980 = !DILocation(line: 1319, column: 20, scope: !4959)
!4981 = !DILocation(line: 1319, column: 4, scope: !4959)
!4982 = !DILocation(line: 1319, column: 28, scope: !4959)
!4983 = !DILocation(line: 1319, column: 34, scope: !4959)
!4984 = !DILocation(line: 1319, column: 41, scope: !4959)
!4985 = !DILocation(line: 1319, column: 50, scope: !4959)
!4986 = !DILocation(line: 1319, column: 55, scope: !4959)
!4987 = !DILocation(line: 1319, column: 58, scope: !4959)
!4988 = !DILocation(line: 1319, column: 60, scope: !4959)
!4989 = !DILocation(line: 1320, column: 3, scope: !4959)
!4990 = !DILocation(line: 1317, column: 23, scope: !4955)
!4991 = !DILocation(line: 1317, column: 3, scope: !4955)
!4992 = distinct !{!4992, !4957, !4993, !1964}
!4993 = !DILocation(line: 1320, column: 3, scope: !4952)
!4994 = !DILocation(line: 1321, column: 2, scope: !4936)
!4995 = !DILocation(line: 1323, column: 73, scope: !4996)
!4996 = distinct !DILexicalBlock(scope: !4932, file: !24, line: 1322, column: 7)
!4997 = !DILocation(line: 1323, column: 76, scope: !4996)
!4998 = !DILocation(line: 1323, column: 71, scope: !4996)
!4999 = !DILocation(line: 1323, column: 82, scope: !4996)
!5000 = !DILocation(line: 1323, column: 106, scope: !4996)
!5001 = !DILocation(line: 1323, column: 46, scope: !4996)
!5002 = !DILocation(line: 1323, column: 25, scope: !4996)
!5003 = !DILocation(line: 1323, column: 32, scope: !4996)
!5004 = !DILocation(line: 1323, column: 44, scope: !4996)
!5005 = !DILocation(line: 1323, column: 3, scope: !4996)
!5006 = !DILocation(line: 1323, column: 11, scope: !4996)
!5007 = !DILocation(line: 1323, column: 23, scope: !4996)
!5008 = !DILocation(line: 1324, column: 18, scope: !4996)
!5009 = !DILocation(line: 1324, column: 25, scope: !4996)
!5010 = !DILocation(line: 1324, column: 30, scope: !4996)
!5011 = !DILocation(line: 1324, column: 3, scope: !4996)
!5012 = !DILocation(line: 1324, column: 11, scope: !4996)
!5013 = !DILocation(line: 1324, column: 16, scope: !4996)
!5014 = !DILocation(line: 1327, column: 6, scope: !5015)
!5015 = distinct !DILexicalBlock(scope: !4830, file: !24, line: 1327, column: 6)
!5016 = !DILocation(line: 1327, column: 20, scope: !5015)
!5017 = !DILocation(line: 1328, column: 32, scope: !5015)
!5018 = !DILocation(line: 1328, column: 35, scope: !5015)
!5019 = !DILocation(line: 1328, column: 50, scope: !5015)
!5020 = !DILocation(line: 1328, column: 53, scope: !5015)
!5021 = !DILocation(line: 1328, column: 67, scope: !5015)
!5022 = !DILocation(line: 1328, column: 75, scope: !5015)
!5023 = !DILocation(line: 1328, column: 81, scope: !5015)
!5024 = !DILocation(line: 1328, column: 89, scope: !5015)
!5025 = !DILocation(line: 1328, column: 96, scope: !5015)
!5026 = !DILocation(line: 1328, column: 104, scope: !5015)
!5027 = !DILocation(line: 1328, column: 126, scope: !5015)
!5028 = !DILocation(line: 1328, column: 134, scope: !5015)
!5029 = !DILocation(line: 1328, column: 117, scope: !5015)
!5030 = !DILocation(line: 1328, column: 142, scope: !5015)
!5031 = !DILocation(line: 1328, column: 148, scope: !5015)
!5032 = !DILocation(line: 1328, column: 156, scope: !5015)
!5033 = !DILocation(line: 1328, column: 165, scope: !5015)
!5034 = !DILocation(line: 1328, column: 173, scope: !5015)
!5035 = !DILocation(line: 1328, column: 185, scope: !5015)
!5036 = !DILocation(line: 1328, column: 193, scope: !5015)
!5037 = !DILocation(line: 1328, column: 176, scope: !5015)
!5038 = !DILocation(line: 1328, column: 201, scope: !5015)
!5039 = !DILocation(line: 1328, column: 207, scope: !5015)
!5040 = !DILocation(line: 1328, column: 215, scope: !5015)
!5041 = !DILocation(line: 1328, column: 224, scope: !5015)
!5042 = !DILocation(line: 1328, column: 232, scope: !5015)
!5043 = !DILocation(line: 1328, column: 244, scope: !5015)
!5044 = !DILocation(line: 1328, column: 252, scope: !5015)
!5045 = !DILocation(line: 1328, column: 235, scope: !5015)
!5046 = !DILocation(line: 1328, column: 260, scope: !5015)
!5047 = !DILocation(line: 1328, column: 266, scope: !5015)
!5048 = !DILocation(line: 1328, column: 274, scope: !5015)
!5049 = !DILocation(line: 1328, column: 283, scope: !5015)
!5050 = !DILocation(line: 1328, column: 291, scope: !5015)
!5051 = !DILocation(line: 1328, column: 303, scope: !5015)
!5052 = !DILocation(line: 1328, column: 311, scope: !5015)
!5053 = !DILocation(line: 1328, column: 294, scope: !5015)
!5054 = !DILocation(line: 1328, column: 319, scope: !5015)
!5055 = !DILocation(line: 1328, column: 325, scope: !5015)
!5056 = !DILocation(line: 1328, column: 333, scope: !5015)
!5057 = !DILocation(line: 1328, column: 342, scope: !5015)
!5058 = !DILocation(line: 1328, column: 350, scope: !5015)
!5059 = !DILocation(line: 1328, column: 3, scope: !5015)
!5060 = !DILocation(line: 1330, column: 1, scope: !4830)
!5061 = distinct !DISubprogram(name: "wall_frame_process", linkageName: "_Z18wall_frame_processv", scope: !24, file: !24, line: 1332, type: !836, scopeLine: 1333, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5062 = !DILocalVariable(name: "i", scope: !5061, file: !24, line: 1334, type: !7)
!5063 = !DILocation(line: 1334, column: 6, scope: !5061)
!5064 = !DILocation(line: 1336, column: 9, scope: !5065)
!5065 = distinct !DILexicalBlock(scope: !5061, file: !24, line: 1336, column: 2)
!5066 = !DILocation(line: 1336, column: 7, scope: !5065)
!5067 = !DILocation(line: 1336, column: 14, scope: !5068)
!5068 = distinct !DILexicalBlock(scope: !5065, file: !24, line: 1336, column: 2)
!5069 = !DILocation(line: 1336, column: 18, scope: !5068)
!5070 = !DILocation(line: 1336, column: 16, scope: !5068)
!5071 = !DILocation(line: 1336, column: 2, scope: !5065)
!5072 = !DILocalVariable(name: "d", scope: !5073, file: !24, line: 1337, type: !2140)
!5073 = distinct !DILexicalBlock(scope: !5068, file: !24, line: 1336, column: 39)
!5074 = !DILocation(line: 1337, column: 16, scope: !5073)
!5075 = !DILocalVariable(name: "w", scope: !5073, file: !24, line: 1338, type: !2137)
!5076 = !DILocation(line: 1338, column: 9, scope: !5073)
!5077 = !DILocation(line: 1340, column: 20, scope: !5073)
!5078 = !DILocation(line: 1340, column: 8, scope: !5073)
!5079 = !DILocation(line: 1340, column: 5, scope: !5073)
!5080 = !DILocation(line: 1341, column: 14, scope: !5073)
!5081 = !DILocation(line: 1341, column: 17, scope: !5073)
!5082 = !DILocation(line: 1341, column: 8, scope: !5073)
!5083 = !DILocation(line: 1341, column: 5, scope: !5073)
!5084 = !DILocation(line: 1343, column: 7, scope: !5085)
!5085 = distinct !DILexicalBlock(scope: !5073, file: !24, line: 1343, column: 7)
!5086 = !DILocation(line: 1343, column: 10, scope: !5085)
!5087 = !DILocation(line: 1343, column: 16, scope: !5085)
!5088 = !DILocation(line: 1344, column: 17, scope: !5085)
!5089 = !DILocation(line: 1344, column: 4, scope: !5085)
!5090 = !DILocation(line: 1345, column: 12, scope: !5091)
!5091 = distinct !DILexicalBlock(scope: !5085, file: !24, line: 1345, column: 12)
!5092 = !DILocation(line: 1345, column: 15, scope: !5091)
!5093 = !DILocation(line: 1345, column: 21, scope: !5091)
!5094 = !DILocation(line: 1346, column: 18, scope: !5091)
!5095 = !DILocation(line: 1346, column: 4, scope: !5091)
!5096 = !DILocation(line: 1347, column: 12, scope: !5097)
!5097 = distinct !DILexicalBlock(scope: !5091, file: !24, line: 1347, column: 12)
!5098 = !DILocation(line: 1347, column: 15, scope: !5097)
!5099 = !DILocation(line: 1347, column: 21, scope: !5097)
!5100 = !DILocation(line: 1348, column: 15, scope: !5101)
!5101 = distinct !DILexicalBlock(scope: !5097, file: !24, line: 1347, column: 43)
!5102 = !DILocation(line: 1348, column: 4, scope: !5101)
!5103 = !DILocation(line: 1348, column: 7, scope: !5101)
!5104 = !DILocation(line: 1348, column: 12, scope: !5101)
!5105 = !DILocation(line: 1352, column: 4, scope: !5101)
!5106 = !DILocation(line: 1353, column: 4, scope: !5101)
!5107 = !DILocation(line: 1353, column: 7, scope: !5101)
!5108 = !DILocation(line: 1353, column: 13, scope: !5101)
!5109 = !DILocation(line: 1354, column: 10, scope: !5101)
!5110 = !DILocation(line: 1354, column: 13, scope: !5101)
!5111 = !DILocation(line: 1354, column: 4, scope: !5101)
!5112 = !DILocation(line: 1354, column: 30, scope: !5101)
!5113 = !DILocation(line: 1354, column: 36, scope: !5101)
!5114 = !DILocation(line: 1356, column: 8, scope: !5115)
!5115 = distinct !DILexicalBlock(scope: !5101, file: !24, line: 1356, column: 8)
!5116 = !DILocation(line: 1356, column: 11, scope: !5115)
!5117 = !DILocation(line: 1356, column: 18, scope: !5115)
!5118 = !DILocation(line: 1356, column: 16, scope: !5115)
!5119 = !DILocation(line: 1356, column: 33, scope: !5115)
!5120 = !DILocation(line: 1356, column: 59, scope: !5115)
!5121 = !DILocation(line: 1356, column: 62, scope: !5115)
!5122 = !DILocation(line: 1356, column: 50, scope: !5115)
!5123 = !DILocation(line: 1356, column: 71, scope: !5115)
!5124 = !DILocation(line: 1356, column: 74, scope: !5115)
!5125 = !DILocation(line: 1356, column: 36, scope: !5115)
!5126 = !DILocation(line: 1357, column: 5, scope: !5127)
!5127 = distinct !DILexicalBlock(scope: !5115, file: !24, line: 1356, column: 84)
!5128 = !DILocation(line: 1357, column: 8, scope: !5127)
!5129 = !DILocation(line: 1357, column: 14, scope: !5127)
!5130 = !DILocation(line: 1358, column: 5, scope: !5127)
!5131 = !DILocation(line: 1358, column: 8, scope: !5127)
!5132 = !DILocation(line: 1358, column: 13, scope: !5127)
!5133 = !DILocation(line: 1359, column: 4, scope: !5127)
!5134 = !DILocation(line: 1360, column: 3, scope: !5101)
!5135 = !DILocation(line: 1361, column: 12, scope: !5136)
!5136 = distinct !DILexicalBlock(scope: !5097, file: !24, line: 1361, column: 12)
!5137 = !DILocation(line: 1361, column: 15, scope: !5136)
!5138 = !DILocation(line: 1361, column: 21, scope: !5136)
!5139 = !DILocation(line: 1361, column: 41, scope: !5136)
!5140 = !DILocation(line: 1361, column: 44, scope: !5136)
!5141 = !DILocation(line: 1361, column: 47, scope: !5136)
!5142 = !DILocation(line: 1361, column: 53, scope: !5136)
!5143 = !DILocalVariable(name: "t", scope: !5144, file: !24, line: 1365, type: !7)
!5144 = distinct !DILexicalBlock(scope: !5136, file: !24, line: 1361, column: 72)
!5145 = !DILocation(line: 1365, column: 8, scope: !5144)
!5146 = !DILocation(line: 1366, column: 4, scope: !5144)
!5147 = !DILocation(line: 1367, column: 13, scope: !5148)
!5148 = distinct !DILexicalBlock(scope: !5144, file: !24, line: 1367, column: 4)
!5149 = !DILocation(line: 1367, column: 11, scope: !5148)
!5150 = !DILocation(line: 1367, column: 9, scope: !5148)
!5151 = !DILocation(line: 1367, column: 16, scope: !5152)
!5152 = distinct !DILexicalBlock(scope: !5148, file: !24, line: 1367, column: 4)
!5153 = !DILocation(line: 1367, column: 20, scope: !5152)
!5154 = !DILocation(line: 1367, column: 18, scope: !5152)
!5155 = !DILocation(line: 1367, column: 4, scope: !5148)
!5156 = !DILocation(line: 1368, column: 34, scope: !5152)
!5157 = !DILocation(line: 1368, column: 36, scope: !5152)
!5158 = !DILocation(line: 1368, column: 22, scope: !5152)
!5159 = !DILocation(line: 1368, column: 17, scope: !5152)
!5160 = !DILocation(line: 1368, column: 5, scope: !5152)
!5161 = !DILocation(line: 1368, column: 20, scope: !5152)
!5162 = !DILocation(line: 1367, column: 37, scope: !5152)
!5163 = !DILocation(line: 1367, column: 4, scope: !5152)
!5164 = distinct !{!5164, !5155, !5165, !1964}
!5165 = !DILocation(line: 1368, column: 39, scope: !5148)
!5166 = !DILocation(line: 1369, column: 18, scope: !5144)
!5167 = !DILocation(line: 1370, column: 3, scope: !5144)
!5168 = !DILocation(line: 1371, column: 2, scope: !5073)
!5169 = !DILocation(line: 1336, column: 35, scope: !5068)
!5170 = !DILocation(line: 1336, column: 2, scope: !5068)
!5171 = distinct !{!5171, !5071, !5172, !1964}
!5172 = !DILocation(line: 1371, column: 2, scope: !5065)
!5173 = !DILocation(line: 1373, column: 9, scope: !5174)
!5174 = distinct !DILexicalBlock(scope: !5061, file: !24, line: 1373, column: 2)
!5175 = !DILocation(line: 1373, column: 7, scope: !5174)
!5176 = !DILocation(line: 1373, column: 14, scope: !5177)
!5177 = distinct !DILexicalBlock(scope: !5174, file: !24, line: 1373, column: 2)
!5178 = !DILocation(line: 1373, column: 18, scope: !5177)
!5179 = !DILocation(line: 1373, column: 16, scope: !5177)
!5180 = !DILocation(line: 1373, column: 2, scope: !5174)
!5181 = !DILocalVariable(name: "d", scope: !5182, file: !24, line: 1374, type: !2396)
!5182 = distinct !DILexicalBlock(scope: !5177, file: !24, line: 1373, column: 43)
!5183 = !DILocation(line: 1374, column: 18, scope: !5182)
!5184 = !DILocalVariable(name: "w", scope: !5182, file: !24, line: 1375, type: !2137)
!5185 = !DILocation(line: 1375, column: 9, scope: !5182)
!5186 = !DILocation(line: 1377, column: 22, scope: !5182)
!5187 = !DILocation(line: 1377, column: 8, scope: !5182)
!5188 = !DILocation(line: 1377, column: 5, scope: !5182)
!5189 = !DILocation(line: 1378, column: 14, scope: !5182)
!5190 = !DILocation(line: 1378, column: 17, scope: !5182)
!5191 = !DILocation(line: 1378, column: 8, scope: !5182)
!5192 = !DILocation(line: 1378, column: 5, scope: !5182)
!5193 = !DILocation(line: 1380, column: 7, scope: !5194)
!5194 = distinct !DILexicalBlock(scope: !5182, file: !24, line: 1380, column: 7)
!5195 = !DILocation(line: 1380, column: 10, scope: !5194)
!5196 = !DILocation(line: 1380, column: 16, scope: !5194)
!5197 = !DILocation(line: 1381, column: 27, scope: !5194)
!5198 = !DILocation(line: 1381, column: 4, scope: !5194)
!5199 = !DILocation(line: 1382, column: 12, scope: !5200)
!5200 = distinct !DILexicalBlock(scope: !5194, file: !24, line: 1382, column: 12)
!5201 = !DILocation(line: 1382, column: 15, scope: !5200)
!5202 = !DILocation(line: 1382, column: 21, scope: !5200)
!5203 = !DILocation(line: 1383, column: 29, scope: !5200)
!5204 = !DILocation(line: 1383, column: 4, scope: !5200)
!5205 = !DILocation(line: 1385, column: 4, scope: !5200)
!5206 = !DILocation(line: 1386, column: 2, scope: !5182)
!5207 = !DILocation(line: 1373, column: 39, scope: !5177)
!5208 = !DILocation(line: 1373, column: 2, scope: !5177)
!5209 = distinct !{!5209, !5180, !5210, !1964}
!5210 = !DILocation(line: 1386, column: 2, scope: !5174)
!5211 = !DILocation(line: 1387, column: 1, scope: !5061)
!5212 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !15, file: !15, line: 49, type: !5213, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5213 = !DISubroutineType(types: !5214)
!5214 = !{!14, !7}
!5215 = !DILocalVariable(name: "i", arg: 1, scope: !5212, file: !15, line: 49, type: !7)
!5216 = !DILocation(line: 49, column: 23, scope: !5212)
!5217 = !DILocation(line: 51, column: 9, scope: !5212)
!5218 = !DILocation(line: 51, column: 11, scope: !5212)
!5219 = !DILocation(line: 51, column: 2, scope: !5212)
!5220 = distinct !DISubprogram(name: "add_stuck_object", linkageName: "_Z16add_stuck_objectP6objectii", scope: !24, file: !24, line: 1395, type: !5221, scopeLine: 1396, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5221 = !DISubroutineType(types: !5222)
!5222 = !{null, !2897, !7, !7}
!5223 = !DILocalVariable(name: "objp", arg: 1, scope: !5220, file: !24, line: 1395, type: !2897)
!5224 = !DILocation(line: 1395, column: 31, scope: !5220)
!5225 = !DILocalVariable(name: "segnum", arg: 2, scope: !5220, file: !24, line: 1395, type: !7)
!5226 = !DILocation(line: 1395, column: 41, scope: !5220)
!5227 = !DILocalVariable(name: "sidenum", arg: 3, scope: !5220, file: !24, line: 1395, type: !7)
!5228 = !DILocation(line: 1395, column: 53, scope: !5220)
!5229 = !DILocalVariable(name: "i", scope: !5220, file: !24, line: 1397, type: !7)
!5230 = !DILocation(line: 1397, column: 6, scope: !5220)
!5231 = !DILocalVariable(name: "wallnum", scope: !5220, file: !24, line: 1398, type: !7)
!5232 = !DILocation(line: 1398, column: 6, scope: !5220)
!5233 = !DILocation(line: 1400, column: 21, scope: !5220)
!5234 = !DILocation(line: 1400, column: 12, scope: !5220)
!5235 = !DILocation(line: 1400, column: 29, scope: !5220)
!5236 = !DILocation(line: 1400, column: 35, scope: !5220)
!5237 = !DILocation(line: 1400, column: 44, scope: !5220)
!5238 = !DILocation(line: 1400, column: 10, scope: !5220)
!5239 = !DILocation(line: 1402, column: 6, scope: !5240)
!5240 = distinct !DILexicalBlock(scope: !5220, file: !24, line: 1402, column: 6)
!5241 = !DILocation(line: 1402, column: 14, scope: !5240)
!5242 = !DILocation(line: 1403, column: 13, scope: !5243)
!5243 = distinct !DILexicalBlock(scope: !5244, file: !24, line: 1403, column: 7)
!5244 = distinct !DILexicalBlock(scope: !5240, file: !24, line: 1402, column: 21)
!5245 = !DILocation(line: 1403, column: 7, scope: !5243)
!5246 = !DILocation(line: 1403, column: 22, scope: !5243)
!5247 = !DILocation(line: 1403, column: 28, scope: !5243)
!5248 = !DILocation(line: 1404, column: 4, scope: !5243)
!5249 = !DILocation(line: 1404, column: 10, scope: !5243)
!5250 = !DILocation(line: 1404, column: 16, scope: !5243)
!5251 = !DILocation(line: 1406, column: 10, scope: !5252)
!5252 = distinct !DILexicalBlock(scope: !5244, file: !24, line: 1406, column: 3)
!5253 = !DILocation(line: 1406, column: 8, scope: !5252)
!5254 = !DILocation(line: 1406, column: 15, scope: !5255)
!5255 = distinct !DILexicalBlock(scope: !5252, file: !24, line: 1406, column: 3)
!5256 = !DILocation(line: 1406, column: 17, scope: !5255)
!5257 = !DILocation(line: 1406, column: 3, scope: !5252)
!5258 = !DILocation(line: 1407, column: 22, scope: !5259)
!5259 = distinct !DILexicalBlock(scope: !5260, file: !24, line: 1407, column: 8)
!5260 = distinct !DILexicalBlock(scope: !5255, file: !24, line: 1406, column: 43)
!5261 = !DILocation(line: 1407, column: 8, scope: !5259)
!5262 = !DILocation(line: 1407, column: 25, scope: !5259)
!5263 = !DILocation(line: 1407, column: 33, scope: !5259)
!5264 = !DILocation(line: 1408, column: 32, scope: !5265)
!5265 = distinct !DILexicalBlock(scope: !5259, file: !24, line: 1407, column: 40)
!5266 = !DILocation(line: 1408, column: 19, scope: !5265)
!5267 = !DILocation(line: 1408, column: 5, scope: !5265)
!5268 = !DILocation(line: 1408, column: 22, scope: !5265)
!5269 = !DILocation(line: 1408, column: 30, scope: !5265)
!5270 = !DILocation(line: 1409, column: 31, scope: !5265)
!5271 = !DILocation(line: 1409, column: 36, scope: !5265)
!5272 = !DILocation(line: 1409, column: 19, scope: !5265)
!5273 = !DILocation(line: 1409, column: 5, scope: !5265)
!5274 = !DILocation(line: 1409, column: 22, scope: !5265)
!5275 = !DILocation(line: 1409, column: 29, scope: !5265)
!5276 = !DILocation(line: 1410, column: 34, scope: !5265)
!5277 = !DILocation(line: 1410, column: 40, scope: !5265)
!5278 = !DILocation(line: 1410, column: 19, scope: !5265)
!5279 = !DILocation(line: 1410, column: 5, scope: !5265)
!5280 = !DILocation(line: 1410, column: 22, scope: !5265)
!5281 = !DILocation(line: 1410, column: 32, scope: !5265)
!5282 = !DILocation(line: 1412, column: 22, scope: !5265)
!5283 = !DILocation(line: 1413, column: 5, scope: !5265)
!5284 = !DILocation(line: 1415, column: 3, scope: !5260)
!5285 = !DILocation(line: 1406, column: 39, scope: !5255)
!5286 = !DILocation(line: 1406, column: 3, scope: !5255)
!5287 = distinct !{!5287, !5257, !5288, !1964}
!5288 = !DILocation(line: 1415, column: 3, scope: !5252)
!5289 = !DILocation(line: 1416, column: 7, scope: !5290)
!5290 = distinct !DILexicalBlock(scope: !5244, file: !24, line: 1416, column: 7)
!5291 = !DILocation(line: 1416, column: 9, scope: !5290)
!5292 = !DILocation(line: 1417, column: 4, scope: !5290)
!5293 = !DILocation(line: 1418, column: 2, scope: !5244)
!5294 = !DILocation(line: 1422, column: 1, scope: !5220)
!5295 = distinct !DISubprogram(name: "remove_obsolete_stuck_objects", linkageName: "_Z29remove_obsolete_stuck_objectsv", scope: !24, file: !24, line: 1427, type: !836, scopeLine: 1428, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5296 = !DILocalVariable(name: "objnum", scope: !5295, file: !24, line: 1429, type: !7)
!5297 = !DILocation(line: 1429, column: 6, scope: !5295)
!5298 = !DILocation(line: 1432, column: 7, scope: !5299)
!5299 = distinct !DILexicalBlock(scope: !5295, file: !24, line: 1432, column: 6)
!5300 = !DILocation(line: 1432, column: 6, scope: !5299)
!5301 = !DILocation(line: 1433, column: 3, scope: !5299)
!5302 = !DILocation(line: 1435, column: 11, scope: !5295)
!5303 = !DILocation(line: 1435, column: 22, scope: !5295)
!5304 = !DILocation(line: 1435, column: 9, scope: !5295)
!5305 = !DILocation(line: 1437, column: 20, scope: !5306)
!5306 = distinct !DILexicalBlock(scope: !5295, file: !24, line: 1437, column: 6)
!5307 = !DILocation(line: 1437, column: 6, scope: !5306)
!5308 = !DILocation(line: 1437, column: 28, scope: !5306)
!5309 = !DILocation(line: 1437, column: 36, scope: !5306)
!5310 = !DILocation(line: 1438, column: 28, scope: !5311)
!5311 = distinct !DILexicalBlock(scope: !5306, file: !24, line: 1438, column: 7)
!5312 = !DILocation(line: 1438, column: 14, scope: !5311)
!5313 = !DILocation(line: 1438, column: 36, scope: !5311)
!5314 = !DILocation(line: 1438, column: 8, scope: !5311)
!5315 = !DILocation(line: 1438, column: 45, scope: !5311)
!5316 = !DILocation(line: 1438, column: 51, scope: !5311)
!5317 = !DILocation(line: 1438, column: 72, scope: !5311)
!5318 = !DILocation(line: 1438, column: 98, scope: !5311)
!5319 = !DILocation(line: 1438, column: 84, scope: !5311)
!5320 = !DILocation(line: 1438, column: 106, scope: !5311)
!5321 = !DILocation(line: 1438, column: 76, scope: !5311)
!5322 = !DILocation(line: 1438, column: 114, scope: !5311)
!5323 = !DILocation(line: 1438, column: 141, scope: !5311)
!5324 = !DILocation(line: 1438, column: 127, scope: !5311)
!5325 = !DILocation(line: 1438, column: 149, scope: !5311)
!5326 = !DILocation(line: 1438, column: 124, scope: !5311)
!5327 = !DILocation(line: 1439, column: 21, scope: !5328)
!5328 = distinct !DILexicalBlock(scope: !5311, file: !24, line: 1438, column: 161)
!5329 = !DILocation(line: 1440, column: 26, scope: !5328)
!5330 = !DILocation(line: 1440, column: 12, scope: !5328)
!5331 = !DILocation(line: 1440, column: 34, scope: !5328)
!5332 = !DILocation(line: 1440, column: 4, scope: !5328)
!5333 = !DILocation(line: 1440, column: 42, scope: !5328)
!5334 = !DILocation(line: 1440, column: 51, scope: !5328)
!5335 = !DILocation(line: 1441, column: 18, scope: !5328)
!5336 = !DILocation(line: 1441, column: 4, scope: !5328)
!5337 = !DILocation(line: 1441, column: 26, scope: !5328)
!5338 = !DILocation(line: 1441, column: 34, scope: !5328)
!5339 = !DILocation(line: 1442, column: 3, scope: !5328)
!5340 = !DILocation(line: 1438, column: 158, scope: !5311)
!5341 = !DILocation(line: 1444, column: 1, scope: !5295)
!5342 = distinct !DISubprogram(name: "init_stuck_objects", linkageName: "_Z18init_stuck_objectsv", scope: !24, file: !24, line: 1541, type: !836, scopeLine: 1542, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5343 = !DILocalVariable(name: "i", scope: !5342, file: !24, line: 1543, type: !7)
!5344 = !DILocation(line: 1543, column: 6, scope: !5342)
!5345 = !DILocation(line: 1545, column: 9, scope: !5346)
!5346 = distinct !DILexicalBlock(scope: !5342, file: !24, line: 1545, column: 2)
!5347 = !DILocation(line: 1545, column: 7, scope: !5346)
!5348 = !DILocation(line: 1545, column: 14, scope: !5349)
!5349 = distinct !DILexicalBlock(scope: !5346, file: !24, line: 1545, column: 2)
!5350 = !DILocation(line: 1545, column: 16, scope: !5349)
!5351 = !DILocation(line: 1545, column: 2, scope: !5346)
!5352 = !DILocation(line: 1546, column: 17, scope: !5349)
!5353 = !DILocation(line: 1546, column: 3, scope: !5349)
!5354 = !DILocation(line: 1546, column: 20, scope: !5349)
!5355 = !DILocation(line: 1546, column: 28, scope: !5349)
!5356 = !DILocation(line: 1545, column: 38, scope: !5349)
!5357 = !DILocation(line: 1545, column: 2, scope: !5349)
!5358 = distinct !{!5358, !5351, !5359, !1964}
!5359 = !DILocation(line: 1546, column: 31, scope: !5346)
!5360 = !DILocation(line: 1548, column: 20, scope: !5342)
!5361 = !DILocation(line: 1549, column: 1, scope: !5342)
!5362 = distinct !DISubprogram(name: "clear_stuck_objects", linkageName: "_Z19clear_stuck_objectsv", scope: !24, file: !24, line: 1553, type: !836, scopeLine: 1554, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5363 = !DILocalVariable(name: "i", scope: !5362, file: !24, line: 1592, type: !7)
!5364 = !DILocation(line: 1592, column: 6, scope: !5362)
!5365 = !DILocation(line: 1594, column: 9, scope: !5366)
!5366 = distinct !DILexicalBlock(scope: !5362, file: !24, line: 1594, column: 2)
!5367 = !DILocation(line: 1594, column: 7, scope: !5366)
!5368 = !DILocation(line: 1594, column: 14, scope: !5369)
!5369 = distinct !DILexicalBlock(scope: !5366, file: !24, line: 1594, column: 2)
!5370 = !DILocation(line: 1594, column: 16, scope: !5369)
!5371 = !DILocation(line: 1594, column: 2, scope: !5366)
!5372 = !DILocation(line: 1595, column: 21, scope: !5373)
!5373 = distinct !DILexicalBlock(scope: !5374, file: !24, line: 1595, column: 7)
!5374 = distinct !DILexicalBlock(scope: !5369, file: !24, line: 1594, column: 42)
!5375 = !DILocation(line: 1595, column: 7, scope: !5373)
!5376 = !DILocation(line: 1595, column: 24, scope: !5373)
!5377 = !DILocation(line: 1595, column: 32, scope: !5373)
!5378 = !DILocalVariable(name: "objnum", scope: !5379, file: !24, line: 1596, type: !7)
!5379 = distinct !DILexicalBlock(scope: !5373, file: !24, line: 1595, column: 39)
!5380 = !DILocation(line: 1596, column: 8, scope: !5379)
!5381 = !DILocation(line: 1598, column: 27, scope: !5379)
!5382 = !DILocation(line: 1598, column: 13, scope: !5379)
!5383 = !DILocation(line: 1598, column: 30, scope: !5379)
!5384 = !DILocation(line: 1598, column: 11, scope: !5379)
!5385 = !DILocation(line: 1600, column: 17, scope: !5386)
!5386 = distinct !DILexicalBlock(scope: !5379, file: !24, line: 1600, column: 8)
!5387 = !DILocation(line: 1600, column: 9, scope: !5386)
!5388 = !DILocation(line: 1600, column: 25, scope: !5386)
!5389 = !DILocation(line: 1600, column: 30, scope: !5386)
!5390 = !DILocation(line: 1600, column: 45, scope: !5386)
!5391 = !DILocation(line: 1600, column: 57, scope: !5386)
!5392 = !DILocation(line: 1600, column: 49, scope: !5386)
!5393 = !DILocation(line: 1600, column: 65, scope: !5386)
!5394 = !DILocation(line: 1600, column: 68, scope: !5386)
!5395 = !DILocation(line: 1601, column: 13, scope: !5386)
!5396 = !DILocation(line: 1601, column: 5, scope: !5386)
!5397 = !DILocation(line: 1601, column: 21, scope: !5386)
!5398 = !DILocation(line: 1601, column: 30, scope: !5386)
!5399 = !DILocation(line: 1603, column: 18, scope: !5379)
!5400 = !DILocation(line: 1603, column: 4, scope: !5379)
!5401 = !DILocation(line: 1603, column: 21, scope: !5379)
!5402 = !DILocation(line: 1603, column: 29, scope: !5379)
!5403 = !DILocation(line: 1605, column: 21, scope: !5379)
!5404 = !DILocation(line: 1606, column: 3, scope: !5379)
!5405 = !DILocation(line: 1607, column: 2, scope: !5374)
!5406 = !DILocation(line: 1594, column: 38, scope: !5369)
!5407 = !DILocation(line: 1594, column: 2, scope: !5369)
!5408 = distinct !{!5408, !5371, !5409, !1964}
!5409 = !DILocation(line: 1607, column: 2, scope: !5366)
!5410 = !DILocation(line: 1609, column: 2, scope: !5362)
!5411 = !DILocation(line: 1611, column: 1, scope: !5362)
!5412 = distinct !DISubprogram(name: "bng_process_segment", linkageName: "_Z19bng_process_segmentP6objectiP7segmentiPa", scope: !24, file: !24, line: 1616, type: !5413, scopeLine: 1617, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5413 = !DISubroutineType(types: !5414)
!5414 = !{null, !2897, !14, !1558, !7, !5415}
!5415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !239, size: 64)
!5416 = !DILocalVariable(name: "objp", arg: 1, scope: !5412, file: !24, line: 1616, type: !2897)
!5417 = !DILocation(line: 1616, column: 35, scope: !5412)
!5418 = !DILocalVariable(name: "damage", arg: 2, scope: !5412, file: !24, line: 1616, type: !14)
!5419 = !DILocation(line: 1616, column: 45, scope: !5412)
!5420 = !DILocalVariable(name: "segp", arg: 3, scope: !5412, file: !24, line: 1616, type: !1558)
!5421 = !DILocation(line: 1616, column: 63, scope: !5412)
!5422 = !DILocalVariable(name: "depth", arg: 4, scope: !5412, file: !24, line: 1616, type: !7)
!5423 = !DILocation(line: 1616, column: 73, scope: !5412)
!5424 = !DILocalVariable(name: "visited", arg: 5, scope: !5412, file: !24, line: 1616, type: !5415)
!5425 = !DILocation(line: 1616, column: 89, scope: !5412)
!5426 = !DILocalVariable(name: "i", scope: !5412, file: !24, line: 1618, type: !7)
!5427 = !DILocation(line: 1618, column: 6, scope: !5412)
!5428 = !DILocalVariable(name: "sidenum", scope: !5412, file: !24, line: 1618, type: !7)
!5429 = !DILocation(line: 1618, column: 9, scope: !5412)
!5430 = !DILocation(line: 1620, column: 6, scope: !5431)
!5431 = distinct !DILexicalBlock(scope: !5412, file: !24, line: 1620, column: 6)
!5432 = !DILocation(line: 1620, column: 12, scope: !5431)
!5433 = !DILocation(line: 1621, column: 3, scope: !5431)
!5434 = !DILocation(line: 1623, column: 7, scope: !5412)
!5435 = !DILocation(line: 1625, column: 15, scope: !5436)
!5436 = distinct !DILexicalBlock(scope: !5412, file: !24, line: 1625, column: 2)
!5437 = !DILocation(line: 1625, column: 7, scope: !5436)
!5438 = !DILocation(line: 1625, column: 20, scope: !5439)
!5439 = distinct !DILexicalBlock(scope: !5436, file: !24, line: 1625, column: 2)
!5440 = !DILocation(line: 1625, column: 28, scope: !5439)
!5441 = !DILocation(line: 1625, column: 2, scope: !5436)
!5442 = !DILocalVariable(name: "tm", scope: !5443, file: !24, line: 1626, type: !7)
!5443 = distinct !DILexicalBlock(scope: !5439, file: !24, line: 1625, column: 64)
!5444 = !DILocation(line: 1626, column: 9, scope: !5443)
!5445 = !DILocalVariable(name: "dist", scope: !5443, file: !24, line: 1627, type: !14)
!5446 = !DILocation(line: 1627, column: 9, scope: !5443)
!5447 = !DILocalVariable(name: "pnt", scope: !5443, file: !24, line: 1628, type: !1583)
!5448 = !DILocation(line: 1628, column: 14, scope: !5443)
!5449 = !DILocation(line: 1631, column: 13, scope: !5450)
!5450 = distinct !DILexicalBlock(scope: !5443, file: !24, line: 1631, column: 7)
!5451 = !DILocation(line: 1631, column: 19, scope: !5450)
!5452 = !DILocation(line: 1631, column: 25, scope: !5450)
!5453 = !DILocation(line: 1631, column: 34, scope: !5450)
!5454 = !DILocation(line: 1631, column: 11, scope: !5450)
!5455 = !DILocation(line: 1631, column: 45, scope: !5450)
!5456 = !DILocalVariable(name: "ec", scope: !5457, file: !24, line: 1632, type: !7)
!5457 = distinct !DILexicalBlock(scope: !5450, file: !24, line: 1631, column: 51)
!5458 = !DILocation(line: 1632, column: 8, scope: !5457)
!5459 = !DILocalVariable(name: "db", scope: !5457, file: !24, line: 1632, type: !7)
!5460 = !DILocation(line: 1632, column: 12, scope: !5457)
!5461 = !DILocation(line: 1634, column: 7, scope: !5457)
!5462 = !DILocation(line: 1636, column: 25, scope: !5463)
!5463 = distinct !DILexicalBlock(scope: !5457, file: !24, line: 1636, column: 8)
!5464 = !DILocation(line: 1636, column: 16, scope: !5463)
!5465 = !DILocation(line: 1636, column: 29, scope: !5463)
!5466 = !DILocation(line: 1636, column: 14, scope: !5463)
!5467 = !DILocation(line: 1636, column: 40, scope: !5463)
!5468 = !DILocation(line: 1636, column: 47, scope: !5463)
!5469 = !DILocation(line: 1636, column: 65, scope: !5463)
!5470 = !DILocation(line: 1636, column: 57, scope: !5463)
!5471 = !DILocation(line: 1636, column: 69, scope: !5463)
!5472 = !DILocation(line: 1636, column: 55, scope: !5463)
!5473 = !DILocation(line: 1636, column: 82, scope: !5463)
!5474 = !DILocation(line: 1636, column: 88, scope: !5463)
!5475 = !DILocation(line: 1636, column: 101, scope: !5463)
!5476 = !DILocation(line: 1636, column: 93, scope: !5463)
!5477 = !DILocation(line: 1636, column: 105, scope: !5463)
!5478 = !DILocation(line: 1636, column: 111, scope: !5463)
!5479 = !DILocation(line: 1636, column: 92, scope: !5463)
!5480 = !DILocation(line: 1636, column: 128, scope: !5463)
!5481 = !DILocation(line: 1636, column: 132, scope: !5463)
!5482 = !DILocation(line: 1636, column: 135, scope: !5463)
!5483 = !DILocation(line: 1636, column: 141, scope: !5463)
!5484 = !DILocation(line: 1636, column: 154, scope: !5463)
!5485 = !DILocation(line: 1636, column: 145, scope: !5463)
!5486 = !DILocation(line: 1636, column: 158, scope: !5463)
!5487 = !DILocation(line: 1636, column: 168, scope: !5463)
!5488 = !DILocation(line: 1637, column: 40, scope: !5489)
!5489 = distinct !DILexicalBlock(scope: !5463, file: !24, line: 1636, column: 177)
!5490 = !DILocation(line: 1637, column: 46, scope: !5489)
!5491 = !DILocation(line: 1637, column: 5, scope: !5489)
!5492 = !DILocation(line: 1638, column: 37, scope: !5489)
!5493 = !DILocation(line: 1638, column: 43, scope: !5489)
!5494 = !DILocation(line: 1638, column: 12, scope: !5489)
!5495 = !DILocation(line: 1638, column: 10, scope: !5489)
!5496 = !DILocation(line: 1639, column: 9, scope: !5497)
!5497 = distinct !DILexicalBlock(scope: !5489, file: !24, line: 1639, column: 9)
!5498 = !DILocation(line: 1639, column: 16, scope: !5497)
!5499 = !DILocation(line: 1639, column: 23, scope: !5497)
!5500 = !DILocation(line: 1639, column: 14, scope: !5497)
!5501 = !DILocation(line: 1640, column: 43, scope: !5502)
!5502 = distinct !DILexicalBlock(scope: !5497, file: !24, line: 1639, column: 28)
!5503 = !DILocation(line: 1640, column: 48, scope: !5502)
!5504 = !DILocation(line: 1640, column: 61, scope: !5502)
!5505 = !DILocation(line: 1640, column: 67, scope: !5502)
!5506 = !DILocation(line: 1640, column: 72, scope: !5502)
!5507 = !DILocation(line: 1640, column: 78, scope: !5502)
!5508 = !DILocation(line: 1640, column: 13, scope: !5502)
!5509 = !DILocation(line: 1640, column: 11, scope: !5502)
!5510 = !DILocation(line: 1641, column: 11, scope: !5511)
!5511 = distinct !DILexicalBlock(scope: !5502, file: !24, line: 1641, column: 10)
!5512 = !DILocation(line: 1641, column: 16, scope: !5511)
!5513 = !DILocation(line: 1641, column: 21, scope: !5511)
!5514 = !DILocation(line: 1641, column: 25, scope: !5511)
!5515 = !DILocation(line: 1641, column: 32, scope: !5511)
!5516 = !DILocation(line: 1641, column: 39, scope: !5511)
!5517 = !DILocation(line: 1641, column: 30, scope: !5511)
!5518 = !DILocation(line: 1642, column: 27, scope: !5511)
!5519 = !DILocation(line: 1642, column: 33, scope: !5511)
!5520 = !DILocation(line: 1642, column: 57, scope: !5511)
!5521 = !DILocation(line: 1642, column: 63, scope: !5511)
!5522 = !DILocation(line: 1642, column: 80, scope: !5511)
!5523 = !DILocation(line: 1642, column: 49, scope: !5511)
!5524 = !DILocation(line: 1642, column: 7, scope: !5511)
!5525 = !DILocation(line: 1643, column: 5, scope: !5502)
!5526 = !DILocation(line: 1644, column: 4, scope: !5489)
!5527 = !DILocation(line: 1645, column: 3, scope: !5457)
!5528 = !DILocation(line: 1646, column: 2, scope: !5443)
!5529 = !DILocation(line: 1625, column: 60, scope: !5439)
!5530 = !DILocation(line: 1625, column: 2, scope: !5439)
!5531 = distinct !{!5531, !5441, !5532, !1964}
!5532 = !DILocation(line: 1646, column: 2, scope: !5436)
!5533 = !DILocation(line: 1648, column: 9, scope: !5534)
!5534 = distinct !DILexicalBlock(scope: !5412, file: !24, line: 1648, column: 2)
!5535 = !DILocation(line: 1648, column: 7, scope: !5534)
!5536 = !DILocation(line: 1648, column: 14, scope: !5537)
!5537 = distinct !DILexicalBlock(scope: !5534, file: !24, line: 1648, column: 2)
!5538 = !DILocation(line: 1648, column: 16, scope: !5537)
!5539 = !DILocation(line: 1648, column: 2, scope: !5534)
!5540 = !DILocalVariable(name: "segnum", scope: !5541, file: !24, line: 1649, type: !7)
!5541 = distinct !DILexicalBlock(scope: !5537, file: !24, line: 1648, column: 46)
!5542 = !DILocation(line: 1649, column: 7, scope: !5541)
!5543 = !DILocation(line: 1649, column: 16, scope: !5541)
!5544 = !DILocation(line: 1649, column: 22, scope: !5541)
!5545 = !DILocation(line: 1649, column: 31, scope: !5541)
!5546 = !DILocation(line: 1651, column: 7, scope: !5547)
!5547 = distinct !DILexicalBlock(scope: !5541, file: !24, line: 1651, column: 7)
!5548 = !DILocation(line: 1651, column: 14, scope: !5547)
!5549 = !DILocation(line: 1652, column: 9, scope: !5550)
!5550 = distinct !DILexicalBlock(scope: !5551, file: !24, line: 1652, column: 8)
!5551 = distinct !DILexicalBlock(scope: !5547, file: !24, line: 1651, column: 21)
!5552 = !DILocation(line: 1652, column: 17, scope: !5550)
!5553 = !DILocation(line: 1652, column: 8, scope: !5550)
!5554 = !DILocation(line: 1653, column: 9, scope: !5555)
!5555 = distinct !DILexicalBlock(scope: !5556, file: !24, line: 1653, column: 9)
!5556 = distinct !DILexicalBlock(scope: !5550, file: !24, line: 1652, column: 26)
!5557 = !DILocation(line: 1653, column: 34, scope: !5555)
!5558 = !DILocation(line: 1654, column: 6, scope: !5559)
!5559 = distinct !DILexicalBlock(scope: !5555, file: !24, line: 1653, column: 50)
!5560 = !DILocation(line: 1654, column: 14, scope: !5559)
!5561 = !DILocation(line: 1654, column: 22, scope: !5559)
!5562 = !DILocation(line: 1655, column: 26, scope: !5559)
!5563 = !DILocation(line: 1655, column: 32, scope: !5559)
!5564 = !DILocation(line: 1655, column: 50, scope: !5559)
!5565 = !DILocation(line: 1655, column: 41, scope: !5559)
!5566 = !DILocation(line: 1655, column: 59, scope: !5559)
!5567 = !DILocation(line: 1655, column: 66, scope: !5559)
!5568 = !DILocation(line: 1655, column: 6, scope: !5559)
!5569 = !DILocation(line: 1656, column: 5, scope: !5559)
!5570 = !DILocation(line: 1657, column: 4, scope: !5556)
!5571 = !DILocation(line: 1658, column: 3, scope: !5551)
!5572 = !DILocation(line: 1659, column: 2, scope: !5541)
!5573 = !DILocation(line: 1648, column: 42, scope: !5537)
!5574 = !DILocation(line: 1648, column: 2, scope: !5537)
!5575 = distinct !{!5575, !5539, !5576, !1964}
!5576 = !DILocation(line: 1659, column: 2, scope: !5534)
!5577 = !DILocation(line: 1660, column: 1, scope: !5412)
!5578 = distinct !DISubprogram(name: "blast_nearby_glass", linkageName: "_Z18blast_nearby_glassP6objecti", scope: !24, file: !24, line: 1665, type: !5579, scopeLine: 1666, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5579 = !DISubroutineType(types: !5580)
!5580 = !{null, !2897, !14}
!5581 = !DILocalVariable(name: "objp", arg: 1, scope: !5578, file: !24, line: 1665, type: !2897)
!5582 = !DILocation(line: 1665, column: 33, scope: !5578)
!5583 = !DILocalVariable(name: "damage", arg: 2, scope: !5578, file: !24, line: 1665, type: !14)
!5584 = !DILocation(line: 1665, column: 43, scope: !5578)
!5585 = !DILocalVariable(name: "i", scope: !5578, file: !24, line: 1667, type: !7)
!5586 = !DILocation(line: 1667, column: 7, scope: !5578)
!5587 = !DILocalVariable(name: "visited", scope: !5578, file: !24, line: 1668, type: !5588)
!5588 = !DICompositeType(tag: DW_TAG_array_type, baseType: !239, size: 7200, elements: !5589)
!5589 = !{!5590}
!5590 = !DISubrange(count: 900)
!5591 = !DILocation(line: 1668, column: 10, scope: !5578)
!5592 = !DILocalVariable(name: "cursegp", scope: !5578, file: !24, line: 1669, type: !1558)
!5593 = !DILocation(line: 1669, column: 11, scope: !5578)
!5594 = !DILocation(line: 1671, column: 22, scope: !5578)
!5595 = !DILocation(line: 1671, column: 28, scope: !5578)
!5596 = !DILocation(line: 1671, column: 13, scope: !5578)
!5597 = !DILocation(line: 1671, column: 10, scope: !5578)
!5598 = !DILocation(line: 1672, column: 9, scope: !5599)
!5599 = distinct !DILexicalBlock(scope: !5578, file: !24, line: 1672, column: 2)
!5600 = !DILocation(line: 1672, column: 7, scope: !5599)
!5601 = !DILocation(line: 1672, column: 14, scope: !5602)
!5602 = distinct !DILexicalBlock(scope: !5599, file: !24, line: 1672, column: 2)
!5603 = !DILocation(line: 1672, column: 19, scope: !5602)
!5604 = !DILocation(line: 1672, column: 16, scope: !5602)
!5605 = !DILocation(line: 1672, column: 2, scope: !5599)
!5606 = !DILocation(line: 1673, column: 11, scope: !5602)
!5607 = !DILocation(line: 1673, column: 3, scope: !5602)
!5608 = !DILocation(line: 1673, column: 14, scope: !5602)
!5609 = !DILocation(line: 1672, column: 43, scope: !5602)
!5610 = !DILocation(line: 1672, column: 2, scope: !5602)
!5611 = distinct !{!5611, !5605, !5612, !1964}
!5612 = !DILocation(line: 1673, column: 16, scope: !5599)
!5613 = !DILocation(line: 1675, column: 10, scope: !5578)
!5614 = !DILocation(line: 1675, column: 16, scope: !5578)
!5615 = !DILocation(line: 1675, column: 2, scope: !5578)
!5616 = !DILocation(line: 1675, column: 24, scope: !5578)
!5617 = !DILocation(line: 1676, column: 22, scope: !5578)
!5618 = !DILocation(line: 1676, column: 28, scope: !5578)
!5619 = !DILocation(line: 1676, column: 36, scope: !5578)
!5620 = !DILocation(line: 1676, column: 48, scope: !5578)
!5621 = !DILocation(line: 1676, column: 2, scope: !5578)
!5622 = !DILocation(line: 1677, column: 1, scope: !5578)
!5623 = distinct !DISubprogram(name: "read_wall", linkageName: "_Z9read_wallP4wallP7__sFILE", scope: !24, file: !24, line: 1681, type: !5624, scopeLine: 1682, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5624 = !DISubroutineType(types: !5625)
!5625 = !{null, !2137, !526}
!5626 = !DILocalVariable(name: "nwall", arg: 1, scope: !5623, file: !24, line: 1681, type: !2137)
!5627 = !DILocation(line: 1681, column: 22, scope: !5623)
!5628 = !DILocalVariable(name: "fp", arg: 2, scope: !5623, file: !24, line: 1681, type: !526)
!5629 = !DILocation(line: 1681, column: 35, scope: !5623)
!5630 = !DILocation(line: 1683, column: 32, scope: !5623)
!5631 = !DILocation(line: 1683, column: 18, scope: !5623)
!5632 = !DILocation(line: 1683, column: 2, scope: !5623)
!5633 = !DILocation(line: 1683, column: 9, scope: !5623)
!5634 = !DILocation(line: 1683, column: 16, scope: !5623)
!5635 = !DILocation(line: 1684, column: 33, scope: !5623)
!5636 = !DILocation(line: 1684, column: 19, scope: !5623)
!5637 = !DILocation(line: 1684, column: 2, scope: !5623)
!5638 = !DILocation(line: 1684, column: 9, scope: !5623)
!5639 = !DILocation(line: 1684, column: 17, scope: !5623)
!5640 = !DILocation(line: 1685, column: 29, scope: !5623)
!5641 = !DILocation(line: 1685, column: 15, scope: !5623)
!5642 = !DILocation(line: 1685, column: 2, scope: !5623)
!5643 = !DILocation(line: 1685, column: 9, scope: !5623)
!5644 = !DILocation(line: 1685, column: 13, scope: !5623)
!5645 = !DILocation(line: 1686, column: 37, scope: !5623)
!5646 = !DILocation(line: 1686, column: 23, scope: !5623)
!5647 = !DILocation(line: 1686, column: 2, scope: !5623)
!5648 = !DILocation(line: 1686, column: 9, scope: !5623)
!5649 = !DILocation(line: 1686, column: 21, scope: !5623)
!5650 = !DILocation(line: 1687, column: 31, scope: !5623)
!5651 = !DILocation(line: 1687, column: 16, scope: !5623)
!5652 = !DILocation(line: 1687, column: 2, scope: !5623)
!5653 = !DILocation(line: 1687, column: 9, scope: !5623)
!5654 = !DILocation(line: 1687, column: 14, scope: !5623)
!5655 = !DILocation(line: 1688, column: 32, scope: !5623)
!5656 = !DILocation(line: 1688, column: 17, scope: !5623)
!5657 = !DILocation(line: 1688, column: 2, scope: !5623)
!5658 = !DILocation(line: 1688, column: 9, scope: !5623)
!5659 = !DILocation(line: 1688, column: 15, scope: !5623)
!5660 = !DILocation(line: 1689, column: 32, scope: !5623)
!5661 = !DILocation(line: 1689, column: 17, scope: !5623)
!5662 = !DILocation(line: 1689, column: 2, scope: !5623)
!5663 = !DILocation(line: 1689, column: 9, scope: !5623)
!5664 = !DILocation(line: 1689, column: 15, scope: !5623)
!5665 = !DILocation(line: 1690, column: 34, scope: !5623)
!5666 = !DILocation(line: 1690, column: 19, scope: !5623)
!5667 = !DILocation(line: 1690, column: 2, scope: !5623)
!5668 = !DILocation(line: 1690, column: 9, scope: !5623)
!5669 = !DILocation(line: 1690, column: 17, scope: !5623)
!5670 = !DILocation(line: 1691, column: 35, scope: !5623)
!5671 = !DILocation(line: 1691, column: 20, scope: !5623)
!5672 = !DILocation(line: 1691, column: 2, scope: !5623)
!5673 = !DILocation(line: 1691, column: 9, scope: !5623)
!5674 = !DILocation(line: 1691, column: 18, scope: !5623)
!5675 = !DILocation(line: 1692, column: 31, scope: !5623)
!5676 = !DILocation(line: 1692, column: 16, scope: !5623)
!5677 = !DILocation(line: 1692, column: 2, scope: !5623)
!5678 = !DILocation(line: 1692, column: 9, scope: !5623)
!5679 = !DILocation(line: 1692, column: 14, scope: !5623)
!5680 = !DILocation(line: 1693, column: 46, scope: !5623)
!5681 = !DILocation(line: 1693, column: 31, scope: !5623)
!5682 = !DILocation(line: 1693, column: 2, scope: !5623)
!5683 = !DILocation(line: 1693, column: 9, scope: !5623)
!5684 = !DILocation(line: 1693, column: 29, scope: !5623)
!5685 = !DILocation(line: 1694, column: 38, scope: !5623)
!5686 = !DILocation(line: 1694, column: 23, scope: !5623)
!5687 = !DILocation(line: 1694, column: 2, scope: !5623)
!5688 = !DILocation(line: 1694, column: 9, scope: !5623)
!5689 = !DILocation(line: 1694, column: 21, scope: !5623)
!5690 = !DILocation(line: 1695, column: 1, scope: !5623)
!5691 = distinct !DISubprogram(name: "read_active_door", linkageName: "_Z16read_active_doorP11active_doorP7__sFILE", scope: !24, file: !24, line: 1697, type: !5692, scopeLine: 1698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5692 = !DISubroutineType(types: !5693)
!5693 = !{null, !2140, !526}
!5694 = !DILocalVariable(name: "door", arg: 1, scope: !5691, file: !24, line: 1697, type: !2140)
!5695 = !DILocation(line: 1697, column: 36, scope: !5691)
!5696 = !DILocalVariable(name: "fp", arg: 2, scope: !5691, file: !24, line: 1697, type: !526)
!5697 = !DILocation(line: 1697, column: 48, scope: !5691)
!5698 = !DILocation(line: 1699, column: 32, scope: !5691)
!5699 = !DILocation(line: 1699, column: 18, scope: !5691)
!5700 = !DILocation(line: 1699, column: 2, scope: !5691)
!5701 = !DILocation(line: 1699, column: 8, scope: !5691)
!5702 = !DILocation(line: 1699, column: 16, scope: !5691)
!5703 = !DILocation(line: 1700, column: 43, scope: !5691)
!5704 = !DILocation(line: 1700, column: 27, scope: !5691)
!5705 = !DILocation(line: 1700, column: 2, scope: !5691)
!5706 = !DILocation(line: 1700, column: 8, scope: !5691)
!5707 = !DILocation(line: 1700, column: 25, scope: !5691)
!5708 = !DILocation(line: 1701, column: 43, scope: !5691)
!5709 = !DILocation(line: 1701, column: 27, scope: !5691)
!5710 = !DILocation(line: 1701, column: 2, scope: !5691)
!5711 = !DILocation(line: 1701, column: 8, scope: !5691)
!5712 = !DILocation(line: 1701, column: 25, scope: !5691)
!5713 = !DILocation(line: 1702, column: 42, scope: !5691)
!5714 = !DILocation(line: 1702, column: 26, scope: !5691)
!5715 = !DILocation(line: 1702, column: 2, scope: !5691)
!5716 = !DILocation(line: 1702, column: 8, scope: !5691)
!5717 = !DILocation(line: 1702, column: 24, scope: !5691)
!5718 = !DILocation(line: 1703, column: 42, scope: !5691)
!5719 = !DILocation(line: 1703, column: 26, scope: !5691)
!5720 = !DILocation(line: 1703, column: 2, scope: !5691)
!5721 = !DILocation(line: 1703, column: 8, scope: !5691)
!5722 = !DILocation(line: 1703, column: 24, scope: !5691)
!5723 = !DILocation(line: 1704, column: 29, scope: !5691)
!5724 = !DILocation(line: 1704, column: 15, scope: !5691)
!5725 = !DILocation(line: 1704, column: 2, scope: !5691)
!5726 = !DILocation(line: 1704, column: 8, scope: !5691)
!5727 = !DILocation(line: 1704, column: 13, scope: !5691)
!5728 = !DILocation(line: 1705, column: 1, scope: !5691)
!5729 = distinct !DISubprogram(name: "P_ReadCloakingWall", linkageName: "_Z18P_ReadCloakingWallP13cloaking_wallP7__sFILE", scope: !24, file: !24, line: 1707, type: !5730, scopeLine: 1708, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5730 = !DISubroutineType(types: !5731)
!5731 = !{null, !2396, !526}
!5732 = !DILocalVariable(name: "wall", arg: 1, scope: !5729, file: !24, line: 1707, type: !2396)
!5733 = !DILocation(line: 1707, column: 40, scope: !5729)
!5734 = !DILocalVariable(name: "fp", arg: 2, scope: !5729, file: !24, line: 1707, type: !526)
!5735 = !DILocation(line: 1707, column: 52, scope: !5729)
!5736 = !DILocalVariable(name: "i", scope: !5729, file: !24, line: 1709, type: !7)
!5737 = !DILocation(line: 1709, column: 6, scope: !5729)
!5738 = !DILocation(line: 1710, column: 40, scope: !5729)
!5739 = !DILocation(line: 1710, column: 24, scope: !5729)
!5740 = !DILocation(line: 1710, column: 2, scope: !5729)
!5741 = !DILocation(line: 1710, column: 8, scope: !5729)
!5742 = !DILocation(line: 1710, column: 22, scope: !5729)
!5743 = !DILocation(line: 1711, column: 39, scope: !5729)
!5744 = !DILocation(line: 1711, column: 23, scope: !5729)
!5745 = !DILocation(line: 1711, column: 2, scope: !5729)
!5746 = !DILocation(line: 1711, column: 8, scope: !5729)
!5747 = !DILocation(line: 1711, column: 21, scope: !5729)
!5748 = !DILocation(line: 1712, column: 9, scope: !5749)
!5749 = distinct !DILexicalBlock(scope: !5729, file: !24, line: 1712, column: 2)
!5750 = !DILocation(line: 1712, column: 7, scope: !5749)
!5751 = !DILocation(line: 1712, column: 14, scope: !5752)
!5752 = distinct !DILexicalBlock(scope: !5749, file: !24, line: 1712, column: 2)
!5753 = !DILocation(line: 1712, column: 16, scope: !5752)
!5754 = !DILocation(line: 1712, column: 2, scope: !5749)
!5755 = !DILocation(line: 1713, column: 37, scope: !5752)
!5756 = !DILocation(line: 1713, column: 23, scope: !5752)
!5757 = !DILocation(line: 1713, column: 3, scope: !5752)
!5758 = !DILocation(line: 1713, column: 9, scope: !5752)
!5759 = !DILocation(line: 1713, column: 18, scope: !5752)
!5760 = !DILocation(line: 1713, column: 21, scope: !5752)
!5761 = !DILocation(line: 1712, column: 22, scope: !5752)
!5762 = !DILocation(line: 1712, column: 2, scope: !5752)
!5763 = distinct !{!5763, !5754, !5764, !1964}
!5764 = !DILocation(line: 1713, column: 39, scope: !5749)
!5765 = !DILocation(line: 1714, column: 9, scope: !5766)
!5766 = distinct !DILexicalBlock(scope: !5729, file: !24, line: 1714, column: 2)
!5767 = !DILocation(line: 1714, column: 7, scope: !5766)
!5768 = !DILocation(line: 1714, column: 14, scope: !5769)
!5769 = distinct !DILexicalBlock(scope: !5766, file: !24, line: 1714, column: 2)
!5770 = !DILocation(line: 1714, column: 16, scope: !5769)
!5771 = !DILocation(line: 1714, column: 2, scope: !5766)
!5772 = !DILocation(line: 1715, column: 36, scope: !5769)
!5773 = !DILocation(line: 1715, column: 22, scope: !5769)
!5774 = !DILocation(line: 1715, column: 3, scope: !5769)
!5775 = !DILocation(line: 1715, column: 9, scope: !5769)
!5776 = !DILocation(line: 1715, column: 17, scope: !5769)
!5777 = !DILocation(line: 1715, column: 20, scope: !5769)
!5778 = !DILocation(line: 1714, column: 22, scope: !5769)
!5779 = !DILocation(line: 1714, column: 2, scope: !5769)
!5780 = distinct !{!5780, !5771, !5781, !1964}
!5781 = !DILocation(line: 1715, column: 38, scope: !5766)
!5782 = !DILocation(line: 1716, column: 29, scope: !5729)
!5783 = !DILocation(line: 1716, column: 15, scope: !5729)
!5784 = !DILocation(line: 1716, column: 2, scope: !5729)
!5785 = !DILocation(line: 1716, column: 8, scope: !5729)
!5786 = !DILocation(line: 1716, column: 13, scope: !5729)
!5787 = !DILocation(line: 1717, column: 1, scope: !5729)
!5788 = distinct !DISubprogram(name: "write_wall", linkageName: "_Z10write_wallP4wallP7__sFILE", scope: !24, file: !24, line: 1719, type: !5624, scopeLine: 1720, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5789 = !DILocalVariable(name: "nwall", arg: 1, scope: !5788, file: !24, line: 1719, type: !2137)
!5790 = !DILocation(line: 1719, column: 23, scope: !5788)
!5791 = !DILocalVariable(name: "fp", arg: 2, scope: !5788, file: !24, line: 1719, type: !526)
!5792 = !DILocation(line: 1719, column: 36, scope: !5788)
!5793 = !DILocation(line: 1721, column: 17, scope: !5788)
!5794 = !DILocation(line: 1721, column: 21, scope: !5788)
!5795 = !DILocation(line: 1721, column: 28, scope: !5788)
!5796 = !DILocation(line: 1721, column: 2, scope: !5788)
!5797 = !DILocation(line: 1722, column: 17, scope: !5788)
!5798 = !DILocation(line: 1722, column: 21, scope: !5788)
!5799 = !DILocation(line: 1722, column: 28, scope: !5788)
!5800 = !DILocation(line: 1722, column: 2, scope: !5788)
!5801 = !DILocation(line: 1723, column: 17, scope: !5788)
!5802 = !DILocation(line: 1723, column: 21, scope: !5788)
!5803 = !DILocation(line: 1723, column: 28, scope: !5788)
!5804 = !DILocation(line: 1723, column: 2, scope: !5788)
!5805 = !DILocation(line: 1724, column: 17, scope: !5788)
!5806 = !DILocation(line: 1724, column: 21, scope: !5788)
!5807 = !DILocation(line: 1724, column: 28, scope: !5788)
!5808 = !DILocation(line: 1724, column: 2, scope: !5788)
!5809 = !DILocation(line: 1725, column: 18, scope: !5788)
!5810 = !DILocation(line: 1725, column: 22, scope: !5788)
!5811 = !DILocation(line: 1725, column: 29, scope: !5788)
!5812 = !DILocation(line: 1725, column: 2, scope: !5788)
!5813 = !DILocation(line: 1726, column: 18, scope: !5788)
!5814 = !DILocation(line: 1726, column: 22, scope: !5788)
!5815 = !DILocation(line: 1726, column: 29, scope: !5788)
!5816 = !DILocation(line: 1726, column: 2, scope: !5788)
!5817 = !DILocation(line: 1727, column: 18, scope: !5788)
!5818 = !DILocation(line: 1727, column: 22, scope: !5788)
!5819 = !DILocation(line: 1727, column: 29, scope: !5788)
!5820 = !DILocation(line: 1727, column: 2, scope: !5788)
!5821 = !DILocation(line: 1728, column: 18, scope: !5788)
!5822 = !DILocation(line: 1728, column: 22, scope: !5788)
!5823 = !DILocation(line: 1728, column: 29, scope: !5788)
!5824 = !DILocation(line: 1728, column: 2, scope: !5788)
!5825 = !DILocation(line: 1729, column: 18, scope: !5788)
!5826 = !DILocation(line: 1729, column: 22, scope: !5788)
!5827 = !DILocation(line: 1729, column: 29, scope: !5788)
!5828 = !DILocation(line: 1729, column: 2, scope: !5788)
!5829 = !DILocation(line: 1730, column: 18, scope: !5788)
!5830 = !DILocation(line: 1730, column: 22, scope: !5788)
!5831 = !DILocation(line: 1730, column: 29, scope: !5788)
!5832 = !DILocation(line: 1730, column: 2, scope: !5788)
!5833 = !DILocation(line: 1731, column: 18, scope: !5788)
!5834 = !DILocation(line: 1731, column: 22, scope: !5788)
!5835 = !DILocation(line: 1731, column: 29, scope: !5788)
!5836 = !DILocation(line: 1731, column: 2, scope: !5788)
!5837 = !DILocation(line: 1732, column: 18, scope: !5788)
!5838 = !DILocation(line: 1732, column: 22, scope: !5788)
!5839 = !DILocation(line: 1732, column: 29, scope: !5788)
!5840 = !DILocation(line: 1732, column: 2, scope: !5788)
!5841 = !DILocation(line: 1733, column: 1, scope: !5788)
!5842 = distinct !DISubprogram(name: "write_active_door", linkageName: "_Z17write_active_doorP11active_doorP7__sFILE", scope: !24, file: !24, line: 1735, type: !5692, scopeLine: 1736, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5843 = !DILocalVariable(name: "door", arg: 1, scope: !5842, file: !24, line: 1735, type: !2140)
!5844 = !DILocation(line: 1735, column: 37, scope: !5842)
!5845 = !DILocalVariable(name: "fp", arg: 2, scope: !5842, file: !24, line: 1735, type: !526)
!5846 = !DILocation(line: 1735, column: 49, scope: !5842)
!5847 = !DILocation(line: 1737, column: 17, scope: !5842)
!5848 = !DILocation(line: 1737, column: 21, scope: !5842)
!5849 = !DILocation(line: 1737, column: 27, scope: !5842)
!5850 = !DILocation(line: 1737, column: 2, scope: !5842)
!5851 = !DILocation(line: 1738, column: 19, scope: !5842)
!5852 = !DILocation(line: 1738, column: 23, scope: !5842)
!5853 = !DILocation(line: 1738, column: 29, scope: !5842)
!5854 = !DILocation(line: 1738, column: 2, scope: !5842)
!5855 = !DILocation(line: 1739, column: 19, scope: !5842)
!5856 = !DILocation(line: 1739, column: 23, scope: !5842)
!5857 = !DILocation(line: 1739, column: 29, scope: !5842)
!5858 = !DILocation(line: 1739, column: 2, scope: !5842)
!5859 = !DILocation(line: 1740, column: 19, scope: !5842)
!5860 = !DILocation(line: 1740, column: 23, scope: !5842)
!5861 = !DILocation(line: 1740, column: 29, scope: !5842)
!5862 = !DILocation(line: 1740, column: 2, scope: !5842)
!5863 = !DILocation(line: 1741, column: 19, scope: !5842)
!5864 = !DILocation(line: 1741, column: 23, scope: !5842)
!5865 = !DILocation(line: 1741, column: 29, scope: !5842)
!5866 = !DILocation(line: 1741, column: 2, scope: !5842)
!5867 = !DILocation(line: 1742, column: 17, scope: !5842)
!5868 = !DILocation(line: 1742, column: 21, scope: !5842)
!5869 = !DILocation(line: 1742, column: 27, scope: !5842)
!5870 = !DILocation(line: 1742, column: 2, scope: !5842)
!5871 = !DILocation(line: 1743, column: 1, scope: !5842)
!5872 = distinct !DISubprogram(name: "P_WriteCloakingWall", linkageName: "_Z19P_WriteCloakingWallP13cloaking_wallP7__sFILE", scope: !24, file: !24, line: 1745, type: !5730, scopeLine: 1746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1597)
!5873 = !DILocalVariable(name: "wall", arg: 1, scope: !5872, file: !24, line: 1745, type: !2396)
!5874 = !DILocation(line: 1745, column: 41, scope: !5872)
!5875 = !DILocalVariable(name: "fp", arg: 2, scope: !5872, file: !24, line: 1745, type: !526)
!5876 = !DILocation(line: 1745, column: 53, scope: !5872)
!5877 = !DILocalVariable(name: "i", scope: !5872, file: !24, line: 1747, type: !7)
!5878 = !DILocation(line: 1747, column: 6, scope: !5872)
!5879 = !DILocation(line: 1748, column: 19, scope: !5872)
!5880 = !DILocation(line: 1748, column: 23, scope: !5872)
!5881 = !DILocation(line: 1748, column: 29, scope: !5872)
!5882 = !DILocation(line: 1748, column: 2, scope: !5872)
!5883 = !DILocation(line: 1749, column: 19, scope: !5872)
!5884 = !DILocation(line: 1749, column: 23, scope: !5872)
!5885 = !DILocation(line: 1749, column: 29, scope: !5872)
!5886 = !DILocation(line: 1749, column: 2, scope: !5872)
!5887 = !DILocation(line: 1750, column: 9, scope: !5888)
!5888 = distinct !DILexicalBlock(scope: !5872, file: !24, line: 1750, column: 2)
!5889 = !DILocation(line: 1750, column: 7, scope: !5888)
!5890 = !DILocation(line: 1750, column: 14, scope: !5891)
!5891 = distinct !DILexicalBlock(scope: !5888, file: !24, line: 1750, column: 2)
!5892 = !DILocation(line: 1750, column: 16, scope: !5891)
!5893 = !DILocation(line: 1750, column: 2, scope: !5888)
!5894 = !DILocation(line: 1751, column: 18, scope: !5891)
!5895 = !DILocation(line: 1751, column: 22, scope: !5891)
!5896 = !DILocation(line: 1751, column: 28, scope: !5891)
!5897 = !DILocation(line: 1751, column: 37, scope: !5891)
!5898 = !DILocation(line: 1751, column: 3, scope: !5891)
!5899 = !DILocation(line: 1750, column: 22, scope: !5891)
!5900 = !DILocation(line: 1750, column: 2, scope: !5891)
!5901 = distinct !{!5901, !5893, !5902, !1964}
!5902 = !DILocation(line: 1751, column: 39, scope: !5888)
!5903 = !DILocation(line: 1752, column: 9, scope: !5904)
!5904 = distinct !DILexicalBlock(scope: !5872, file: !24, line: 1752, column: 2)
!5905 = !DILocation(line: 1752, column: 7, scope: !5904)
!5906 = !DILocation(line: 1752, column: 14, scope: !5907)
!5907 = distinct !DILexicalBlock(scope: !5904, file: !24, line: 1752, column: 2)
!5908 = !DILocation(line: 1752, column: 16, scope: !5907)
!5909 = !DILocation(line: 1752, column: 2, scope: !5904)
!5910 = !DILocation(line: 1753, column: 18, scope: !5907)
!5911 = !DILocation(line: 1753, column: 22, scope: !5907)
!5912 = !DILocation(line: 1753, column: 28, scope: !5907)
!5913 = !DILocation(line: 1753, column: 36, scope: !5907)
!5914 = !DILocation(line: 1753, column: 3, scope: !5907)
!5915 = !DILocation(line: 1752, column: 22, scope: !5907)
!5916 = !DILocation(line: 1752, column: 2, scope: !5907)
!5917 = distinct !{!5917, !5909, !5918, !1964}
!5918 = !DILocation(line: 1753, column: 38, scope: !5904)
!5919 = !DILocation(line: 1754, column: 17, scope: !5872)
!5920 = !DILocation(line: 1754, column: 21, scope: !5872)
!5921 = !DILocation(line: 1754, column: 27, scope: !5872)
!5922 = !DILocation(line: 1754, column: 2, scope: !5872)
!5923 = !DILocation(line: 1755, column: 1, scope: !5872)
