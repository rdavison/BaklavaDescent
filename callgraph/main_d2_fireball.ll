; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/fireball.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/fireball.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%struct.vms_vector = type { i32, i32, i32 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.bitmap_index = type { i16 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.weapon_info = type { i8, i8, i16, i16, i8, i8, i16, i8, i8, i16, i8, i8, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32, %struct.bitmap_index, i32, i32, i32, [5 x i32], [5 x i32], i32, i32, i32, i32, i32, i32, i32, %struct.bitmap_index, %struct.bitmap_index }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.polymodel = type { i32, i32, ptr, [10 x i32], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x i32], [10 x i8], [10 x %struct.vms_vector], [10 x %struct.vms_vector], %struct.vms_vector, %struct.vms_vector, i32, i8, i16, i8 }
%struct.wall = type { i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
%struct.powerup_type_info = type { i32, i32, i32, i32 }
%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.expl_wall = type { i32, i32, i32 }
%struct.wclip = type { i32, i16, [50 x i16], i16, i16, i16, [13 x i8], i8 }
%struct.explosion_info = type { i32, i32, i16, i16, i16, i16 }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }
%"struct.std::__1::__less" = type { i8 }
%struct.player_ship = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x %struct.vms_vector] }
%struct.vclip_info_s = type { i32, i32, i8 }
%struct.powerup_info_s = type { i32, i32, i32 }

@Flash_effect = global i32 0, align 4, !dbg !0
@PK1 = global i32 1, align 4, !dbg !22
@PK2 = global i32 8, align 4, !dbg !25
@vmd_identity_matrix = external global %struct.vms_matrix, align 4
@.str = private unnamed_addr constant [53 x i8] c"Can't create object in object_create_explosion_sub.\0A\00", align 1, !dbg !27
@Objects = external global [0 x %struct.object], align 4
@Vclip = external global [110 x %struct.vclip], align 4
@Highest_object_index = external global i32, align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@Weapon_info = external global [0 x %struct.weapon_info], align 4
@FrameTime = external global i32, align 4
@Difficulty_level = external global i32, align 4
@Boss_invulnerable_matter = external global [8 x i8], align 1
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@.str.1 = private unnamed_addr constant [7 x i8] c"ouch! \00", align 1, !dbg !34
@ConsoleObject = external global ptr, align 8
@.str.2 = private unnamed_addr constant [26 x i8] c"force = %7.3f, adding %i\0A\00", align 1, !dbg !39
@Game_mode = external global i32, align 4
@.str.3 = private unnamed_addr constant [18 x i8] c"wi->damage_radius\00", align 1, !dbg !44
@.str.4 = private unnamed_addr constant [58 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/fireball.cpp\00", align 1, !dbg !49
@.str.5 = private unnamed_addr constant [60 x i8] c"(parent->type == OBJ_ROBOT) || (parent->type == OBJ_PLAYER)\00", align 1, !dbg !54
@Polygon_models = external global [0 x %struct.polymodel], align 8
@.str.6 = private unnamed_addr constant [46 x i8] c"Can't create object in object_create_debris.\0A\00", align 1, !dbg !59
@.str.7 = private unnamed_addr constant [16 x i8] c"subobj_num < 32\00", align 1, !dbg !64
@Walls = external global [254 x %struct.wall], align 4
@Highest_segment_index = external global i32, align 4
@Segments = external global [0 x %struct.segment], align 4
@.str.8 = private unnamed_addr constant [37 x i8] c"...failed at depth %i, returning -1\0A\00", align 1, !dbg !69
@.str.9 = private unnamed_addr constant [21 x i8] c"choose_drop_segment:\00", align 1, !dbg !74
@N_players = external global i32, align 4
@.str.10 = private unnamed_addr constant [4 x i8] c" %d\00", align 1, !dbg !79
@Segment2s = external global [0 x %struct.segment2], align 4
@.str.11 = private unnamed_addr constant [2 x i8] c"C\00", align 1, !dbg !84
@.str.12 = private unnamed_addr constant [2 x i8] c"c\00", align 1, !dbg !89
@.str.13 = private unnamed_addr constant [2 x i8] c"D\00", align 1, !dbg !91
@.str.14 = private unnamed_addr constant [10 x i8] c" dist=%x\0A\00", align 1, !dbg !93
@.str.15 = private unnamed_addr constant [69 x i8] c"Warning: Unable to find a connected segment.  Picking a random one.\0A\00", align 1, !dbg !98
@.str.16 = private unnamed_addr constant [56 x i8] c"Bashing cloak into nothing because there's one nearby.\0A\00", align 1, !dbg !103
@.str.17 = private unnamed_addr constant [73 x i8] c"Converting energy powerup to nothing because robot %i gated in by boss.\0A\00", align 1, !dbg !108
@Powerup_info = external global [50 x %struct.powerup_type_info], align 4
@.str.18 = private unnamed_addr constant [54 x i8] c"Can't create object in object_create_egg.  Aborting.\0A\00", align 1, !dbg !113
@.str.19 = private unnamed_addr constant [62 x i8] c"Can't create object in object_create_egg, robots.  Aborting.\0A\00", align 1, !dbg !118
@CurrentLogicVersion = external global i32, align 4
@Ai_local_info = external global [350 x %struct.ai_local], align 4
@.str.20 = private unnamed_addr constant [46 x i8] c"Error: Illegal type (%i) in object spawning.\0A\00", align 1, !dbg !123
@.str.21 = private unnamed_addr constant [22 x i8] c"Not dropping shield!\0A\00", align 1, !dbg !125
@.str.22 = private unnamed_addr constant [22 x i8] c"Not dropping energy!\0A\00", align 1, !dbg !130
@Player_ship = external global ptr, align 8
@.str.23 = private unnamed_addr constant [31 x i8] c"obj->render_type == RT_POLYOBJ\00", align 1, !dbg !132
@Dying_modelnums = external global [0 x i32], align 4
@Dead_modelnums = external global [0 x i32], align 4
@.str.24 = private unnamed_addr constant [47 x i8] c"Couldn't start explosion, deleting object now\0A\00", align 1, !dbg !137
@.str.25 = private unnamed_addr constant [31 x i8] c"obj->control_type == CT_DEBRIS\00", align 1, !dbg !142
@.str.26 = private unnamed_addr constant [34 x i8] c"obj->control_type == CT_EXPLOSION\00", align 1, !dbg !144
@.str.27 = private unnamed_addr constant [47 x i8] c"Illegal value for delete_objnum in fireball.c\0A\00", align 1, !dbg !149
@.str.28 = private unnamed_addr constant [58 x i8] c"Couldn't create secondary explosion, deleting object now\0A\00", align 1, !dbg !151
@expl_wall_list = global [10 x %struct.expl_wall] zeroinitializer, align 4, !dbg !153
@.str.29 = private unnamed_addr constant [45 x i8] c"Couldn't find free slot for exploding wall!\0A\00", align 1, !dbg !163
@WallAnims = external global [60 x %struct.wclip], align 4
@Vertices = external global [0 x %struct.vms_vector], align 4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z27object_create_explosion_subP6objectsP10vms_vectoriiiiii(ptr noundef %0, i16 noundef signext %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !1431 {
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i16, align 2
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca %struct.vms_vector, align 4
  %25 = alloca %struct.vms_vector, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca %struct.vms_vector, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca [26 x i8], align 1
  %35 = alloca ptr, align 8
  %36 = alloca %struct.vms_vector, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  store ptr %0, ptr %11, align 8
    #dbg_declare(ptr %11, !1573, !DIExpression(), !1574)
  store i16 %1, ptr %12, align 2
    #dbg_declare(ptr %12, !1575, !DIExpression(), !1576)
  store ptr %2, ptr %13, align 8
    #dbg_declare(ptr %13, !1577, !DIExpression(), !1578)
  store i32 %3, ptr %14, align 4
    #dbg_declare(ptr %14, !1579, !DIExpression(), !1580)
  store i32 %4, ptr %15, align 4
    #dbg_declare(ptr %15, !1581, !DIExpression(), !1582)
  store i32 %5, ptr %16, align 4
    #dbg_declare(ptr %16, !1583, !DIExpression(), !1584)
  store i32 %6, ptr %17, align 4
    #dbg_declare(ptr %17, !1585, !DIExpression(), !1586)
  store i32 %7, ptr %18, align 4
    #dbg_declare(ptr %18, !1587, !DIExpression(), !1588)
  store i32 %8, ptr %19, align 4
    #dbg_declare(ptr %19, !1589, !DIExpression(), !1590)
    #dbg_declare(ptr %20, !1591, !DIExpression(), !1592)
    #dbg_declare(ptr %21, !1593, !DIExpression(), !1594)
  %40 = load i32, ptr %15, align 4, !dbg !1595
  %41 = trunc i32 %40 to i8, !dbg !1595
  %42 = load i16, ptr %12, align 2, !dbg !1596
  %43 = sext i16 %42 to i32, !dbg !1596
  %44 = load ptr, ptr %13, align 8, !dbg !1597
  %45 = load i32, ptr %14, align 4, !dbg !1598
  %46 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 1, i8 noundef zeroext %41, i32 noundef %43, ptr noundef %44, ptr noundef @vmd_identity_matrix, i32 noundef %45, i8 noundef zeroext 2, i8 noundef zeroext 0, i8 noundef zeroext 2), !dbg !1599
  store i32 %46, ptr %20, align 4, !dbg !1600
  %47 = load i32, ptr %20, align 4, !dbg !1601
  %48 = icmp slt i32 %47, 0, !dbg !1603
  br i1 %48, label %49, label %50, !dbg !1603

49:                                               ; preds = %9
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str), !dbg !1604
  store ptr null, ptr %10, align 8, !dbg !1606
  br label %634, !dbg !1606

50:                                               ; preds = %9
  %51 = load i32, ptr %20, align 4, !dbg !1607
  %52 = sext i32 %51 to i64, !dbg !1608
  %53 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %52, !dbg !1608
  store ptr %53, ptr %21, align 8, !dbg !1609
  %54 = load i32, ptr %15, align 4, !dbg !1610
  %55 = sext i32 %54 to i64, !dbg !1611
  %56 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %55, !dbg !1611
  %57 = getelementptr inbounds nuw %struct.vclip, ptr %56, i32 0, i32 0, !dbg !1612
  %58 = load i32, ptr %57, align 4, !dbg !1612
  %59 = load ptr, ptr %21, align 8, !dbg !1613
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 20, !dbg !1614
  store i32 %58, ptr %60, align 4, !dbg !1615
  %61 = load ptr, ptr %21, align 8, !dbg !1616
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 22, !dbg !1617
  %63 = getelementptr inbounds nuw %struct.explosion_info, ptr %62, i32 0, i32 0, !dbg !1618
  store i32 -1, ptr %63, align 4, !dbg !1619
  %64 = load ptr, ptr %21, align 8, !dbg !1620
  %65 = getelementptr inbounds nuw %struct.object, ptr %64, i32 0, i32 22, !dbg !1621
  %66 = getelementptr inbounds nuw %struct.explosion_info, ptr %65, i32 0, i32 2, !dbg !1622
  store i16 -1, ptr %66, align 4, !dbg !1623
  %67 = load ptr, ptr %21, align 8, !dbg !1624
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 22, !dbg !1625
  %69 = getelementptr inbounds nuw %struct.explosion_info, ptr %68, i32 0, i32 1, !dbg !1626
  store i32 -1, ptr %69, align 4, !dbg !1627
  %70 = load i32, ptr %16, align 4, !dbg !1628
  %71 = icmp sgt i32 %70, 0, !dbg !1630
  br i1 %71, label %72, label %632, !dbg !1630

72:                                               ; preds = %50
    #dbg_declare(ptr %22, !1631, !DIExpression(), !1633)
    #dbg_declare(ptr %23, !1634, !DIExpression(), !1635)
    #dbg_declare(ptr %24, !1636, !DIExpression(), !1637)
    #dbg_declare(ptr %25, !1638, !DIExpression(), !1639)
    #dbg_declare(ptr %26, !1640, !DIExpression(), !1641)
    #dbg_declare(ptr %27, !1642, !DIExpression(), !1643)
    #dbg_declare(ptr %28, !1644, !DIExpression(), !1645)
  store ptr @Objects, ptr %28, align 8, !dbg !1645
  store i32 0, ptr %27, align 4, !dbg !1646
  br label %73, !dbg !1648

73:                                               ; preds = %628, %72
  %74 = load i32, ptr %27, align 4, !dbg !1649
  %75 = load i32, ptr @Highest_object_index, align 4, !dbg !1651
  %76 = icmp sle i32 %74, %75, !dbg !1652
  br i1 %76, label %77, label %631, !dbg !1653

77:                                               ; preds = %73
  %78 = load ptr, ptr %28, align 8, !dbg !1654
  %79 = load ptr, ptr %11, align 8, !dbg !1657
  %80 = icmp ne ptr %78, %79, !dbg !1658
  br i1 %80, label %81, label %625, !dbg !1659

81:                                               ; preds = %77
  %82 = load ptr, ptr %28, align 8, !dbg !1660
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 8, !dbg !1661
  %84 = load i8, ptr %83, align 1, !dbg !1661
  %85 = zext i8 %84 to i32, !dbg !1660
  %86 = and i32 %85, 2, !dbg !1662
  %87 = icmp ne i32 %86, 0, !dbg !1663
  br i1 %87, label %625, label %88, !dbg !1664

88:                                               ; preds = %81
  %89 = load ptr, ptr %28, align 8, !dbg !1665
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 1, !dbg !1666
  %91 = load i8, ptr %90, align 4, !dbg !1666
  %92 = zext i8 %91 to i32, !dbg !1665
  %93 = icmp eq i32 %92, 5, !dbg !1667
  br i1 %93, label %94, label %112, !dbg !1668

94:                                               ; preds = %88
  %95 = load ptr, ptr %28, align 8, !dbg !1669
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 2, !dbg !1670
  %97 = load i8, ptr %96, align 1, !dbg !1670
  %98 = zext i8 %97 to i32, !dbg !1669
  %99 = icmp eq i32 %98, 16, !dbg !1671
  br i1 %99, label %150, label %100, !dbg !1672

100:                                              ; preds = %94
  %101 = load ptr, ptr %28, align 8, !dbg !1673
  %102 = getelementptr inbounds nuw %struct.object, ptr %101, i32 0, i32 2, !dbg !1674
  %103 = load i8, ptr %102, align 1, !dbg !1674
  %104 = zext i8 %103 to i32, !dbg !1673
  %105 = icmp eq i32 %104, 38, !dbg !1675
  br i1 %105, label %150, label %106, !dbg !1676

106:                                              ; preds = %100
  %107 = load ptr, ptr %28, align 8, !dbg !1677
  %108 = getelementptr inbounds nuw %struct.object, ptr %107, i32 0, i32 2, !dbg !1678
  %109 = load i8, ptr %108, align 1, !dbg !1678
  %110 = zext i8 %109 to i32, !dbg !1677
  %111 = icmp eq i32 %110, 51, !dbg !1679
  br i1 %111, label %150, label %112, !dbg !1680

112:                                              ; preds = %106, %88
  %113 = load ptr, ptr %28, align 8, !dbg !1681
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 1, !dbg !1682
  %115 = load i8, ptr %114, align 4, !dbg !1682
  %116 = zext i8 %115 to i32, !dbg !1681
  %117 = icmp eq i32 %116, 9, !dbg !1683
  br i1 %117, label %150, label %118, !dbg !1684

118:                                              ; preds = %112
  %119 = load ptr, ptr %28, align 8, !dbg !1685
  %120 = getelementptr inbounds nuw %struct.object, ptr %119, i32 0, i32 1, !dbg !1686
  %121 = load i8, ptr %120, align 4, !dbg !1686
  %122 = zext i8 %121 to i32, !dbg !1685
  %123 = icmp eq i32 %122, 4, !dbg !1687
  br i1 %123, label %150, label %124, !dbg !1688

124:                                              ; preds = %118
  %125 = load ptr, ptr %28, align 8, !dbg !1689
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 1, !dbg !1690
  %127 = load i8, ptr %126, align 4, !dbg !1690
  %128 = zext i8 %127 to i32, !dbg !1689
  %129 = icmp eq i32 %128, 2, !dbg !1691
  br i1 %129, label %130, label %625, !dbg !1692

130:                                              ; preds = %124
  %131 = load i32, ptr %19, align 4, !dbg !1693
  %132 = sext i32 %131 to i64, !dbg !1694
  %133 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %132, !dbg !1694
  %134 = getelementptr inbounds nuw %struct.object, ptr %133, i32 0, i32 1, !dbg !1695
  %135 = load i8, ptr %134, align 4, !dbg !1695
  %136 = zext i8 %135 to i32, !dbg !1694
  %137 = icmp ne i32 %136, 2, !dbg !1696
  br i1 %137, label %150, label %138, !dbg !1697

138:                                              ; preds = %130
  %139 = load i32, ptr %19, align 4, !dbg !1698
  %140 = sext i32 %139 to i64, !dbg !1699
  %141 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %140, !dbg !1699
  %142 = getelementptr inbounds nuw %struct.object, ptr %141, i32 0, i32 2, !dbg !1700
  %143 = load i8, ptr %142, align 1, !dbg !1700
  %144 = zext i8 %143 to i32, !dbg !1699
  %145 = load ptr, ptr %28, align 8, !dbg !1701
  %146 = getelementptr inbounds nuw %struct.object, ptr %145, i32 0, i32 2, !dbg !1702
  %147 = load i8, ptr %146, align 1, !dbg !1702
  %148 = zext i8 %147 to i32, !dbg !1701
  %149 = icmp ne i32 %144, %148, !dbg !1703
  br i1 %149, label %150, label %625, !dbg !1664

150:                                              ; preds = %138, %130, %118, %112, %106, %100, %94
  %151 = load ptr, ptr %28, align 8, !dbg !1704
  %152 = getelementptr inbounds nuw %struct.object, ptr %151, i32 0, i32 11, !dbg !1706
  %153 = load ptr, ptr %21, align 8, !dbg !1707
  %154 = getelementptr inbounds nuw %struct.object, ptr %153, i32 0, i32 11, !dbg !1708
  %155 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %152, ptr noundef %154), !dbg !1709
  store i32 %155, ptr %22, align 4, !dbg !1710
  %156 = load i32, ptr %22, align 4, !dbg !1711
  %157 = load i32, ptr %17, align 4, !dbg !1713
  %158 = icmp slt i32 %156, %157, !dbg !1714
  br i1 %158, label %159, label %624, !dbg !1714

159:                                              ; preds = %150
  %160 = load ptr, ptr %21, align 8, !dbg !1715
  %161 = load ptr, ptr %28, align 8, !dbg !1718
  %162 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %160, ptr noundef %161, i32 noundef 2), !dbg !1719
  %163 = icmp ne i32 %162, 0, !dbg !1719
  br i1 %163, label %164, label %622, !dbg !1719

164:                                              ; preds = %159
  %165 = load i32, ptr %16, align 4, !dbg !1720
  %166 = load i32, ptr %22, align 4, !dbg !1722
  %167 = load i32, ptr %16, align 4, !dbg !1723
  %168 = load i32, ptr %17, align 4, !dbg !1724
  %169 = call noundef i32 @_Z9fixmuldiviii(i32 noundef %166, i32 noundef %167, i32 noundef %168), !dbg !1725
  %170 = sub nsw i32 %165, %169, !dbg !1726
  store i32 %170, ptr %26, align 4, !dbg !1727
  %171 = load i32, ptr %18, align 4, !dbg !1728
  %172 = load i32, ptr %22, align 4, !dbg !1729
  %173 = load i32, ptr %18, align 4, !dbg !1730
  %174 = load i32, ptr %17, align 4, !dbg !1731
  %175 = call noundef i32 @_Z9fixmuldiviii(i32 noundef %172, i32 noundef %173, i32 noundef %174), !dbg !1732
  %176 = sub nsw i32 %171, %175, !dbg !1733
  store i32 %176, ptr %23, align 4, !dbg !1734
  %177 = load ptr, ptr %28, align 8, !dbg !1735
  %178 = getelementptr inbounds nuw %struct.object, ptr %177, i32 0, i32 11, !dbg !1736
  %179 = load ptr, ptr %21, align 8, !dbg !1737
  %180 = getelementptr inbounds nuw %struct.object, ptr %179, i32 0, i32 11, !dbg !1738
  %181 = call noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef %25, ptr noundef %178, ptr noundef %180), !dbg !1739
  %182 = load i32, ptr %23, align 4, !dbg !1740
  %183 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %25, i32 noundef %182), !dbg !1741
  %184 = load ptr, ptr %21, align 8, !dbg !1742
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 11, !dbg !1743
  %186 = load ptr, ptr %28, align 8, !dbg !1744
  %187 = getelementptr inbounds nuw %struct.object, ptr %186, i32 0, i32 11, !dbg !1745
  %188 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %24, ptr noundef %185, ptr noundef %187), !dbg !1746
  %189 = load ptr, ptr %28, align 8, !dbg !1747
  %190 = getelementptr inbounds nuw %struct.object, ptr %189, i32 0, i32 13, !dbg !1748
  %191 = load i32, ptr %190, align 4, !dbg !1748
  %192 = load ptr, ptr %28, align 8, !dbg !1749
  %193 = getelementptr inbounds nuw %struct.object, ptr %192, i32 0, i32 13, !dbg !1750
  %194 = load i32, ptr %193, align 4, !dbg !1750
  %195 = load i32, ptr %22, align 4, !dbg !1751
  %196 = add nsw i32 %194, %195, !dbg !1752
  %197 = call noundef i32 @_Z6fixdivii(i32 noundef %191, i32 noundef %196), !dbg !1753
  %198 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %188, i32 noundef %197), !dbg !1754
  %199 = load ptr, ptr %28, align 8, !dbg !1755
  %200 = getelementptr inbounds nuw %struct.object, ptr %199, i32 0, i32 1, !dbg !1756
  %201 = load i8, ptr %200, align 4, !dbg !1756
  %202 = zext i8 %201 to i32, !dbg !1755
  switch i32 %202, label %620 [
    i32 5, label %203
    i32 2, label %235
    i32 9, label %467
    i32 4, label %478
  ], !dbg !1757

203:                                              ; preds = %164
  %204 = load ptr, ptr %28, align 8, !dbg !1758
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %204, ptr noundef %25), !dbg !1760
  %205 = load ptr, ptr %28, align 8, !dbg !1761
  %206 = getelementptr inbounds nuw %struct.object, ptr %205, i32 0, i32 2, !dbg !1763
  %207 = load i8, ptr %206, align 1, !dbg !1763
  %208 = zext i8 %207 to i32, !dbg !1761
  %209 = icmp eq i32 %208, 16, !dbg !1764
  br i1 %209, label %216, label %210, !dbg !1765

210:                                              ; preds = %203
  %211 = load ptr, ptr %28, align 8, !dbg !1766
  %212 = getelementptr inbounds nuw %struct.object, ptr %211, i32 0, i32 2, !dbg !1767
  %213 = load i8, ptr %212, align 1, !dbg !1767
  %214 = zext i8 %213 to i32, !dbg !1766
  %215 = icmp eq i32 %214, 38, !dbg !1768
  br i1 %215, label %216, label %234, !dbg !1765

216:                                              ; preds = %210, %203
  %217 = load i32, ptr %22, align 4, !dbg !1769
  %218 = load i32, ptr %23, align 4, !dbg !1772
  %219 = call noundef i32 @_Z6fixmulii(i32 noundef %217, i32 noundef %218), !dbg !1773
  %220 = call noundef i32 @_Z3i2fi(i32 noundef 8000), !dbg !1774
  %221 = icmp sgt i32 %219, %220, !dbg !1775
  br i1 %221, label %222, label %233, !dbg !1775

222:                                              ; preds = %216
  %223 = load ptr, ptr %28, align 8, !dbg !1776
  %224 = getelementptr inbounds nuw %struct.object, ptr %223, i32 0, i32 8, !dbg !1778
  %225 = load i8, ptr %224, align 1, !dbg !1779
  %226 = zext i8 %225 to i32, !dbg !1779
  %227 = or i32 %226, 2, !dbg !1779
  %228 = trunc i32 %227 to i8, !dbg !1779
  store i8 %228, ptr %224, align 1, !dbg !1779
  %229 = load ptr, ptr %28, align 8, !dbg !1780
  %230 = load ptr, ptr %28, align 8, !dbg !1781
  %231 = getelementptr inbounds nuw %struct.object, ptr %230, i32 0, i32 11, !dbg !1782
  %232 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %229, ptr noundef %231), !dbg !1783
  br label %233, !dbg !1784

233:                                              ; preds = %222, %216
  br label %234, !dbg !1785

234:                                              ; preds = %233, %210
  br label %621, !dbg !1786

235:                                              ; preds = %164
  %236 = load ptr, ptr %28, align 8, !dbg !1787
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %236, ptr noundef %25), !dbg !1789
  %237 = load ptr, ptr %11, align 8, !dbg !1790
  %238 = icmp ne ptr %237, null, !dbg !1792
  br i1 %238, label %239, label %334, !dbg !1793

239:                                              ; preds = %235
  %240 = load ptr, ptr %28, align 8, !dbg !1794
  %241 = getelementptr inbounds nuw %struct.object, ptr %240, i32 0, i32 2, !dbg !1795
  %242 = load i8, ptr %241, align 1, !dbg !1795
  %243 = zext i8 %242 to i64, !dbg !1796
  %244 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %243, !dbg !1796
  %245 = getelementptr inbounds nuw %struct.robot_info, ptr %244, i32 0, i32 36, !dbg !1797
  %246 = load i8, ptr %245, align 4, !dbg !1797
  %247 = icmp ne i8 %246, 0, !dbg !1796
  br i1 %247, label %334, label %248, !dbg !1798

248:                                              ; preds = %239
  %249 = load ptr, ptr %11, align 8, !dbg !1799
  %250 = getelementptr inbounds nuw %struct.object, ptr %249, i32 0, i32 2, !dbg !1800
  %251 = load i8, ptr %250, align 1, !dbg !1800
  %252 = zext i8 %251 to i64, !dbg !1801
  %253 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %252, !dbg !1801
  %254 = getelementptr inbounds nuw %struct.weapon_info, ptr %253, i32 0, i32 19, !dbg !1802
  %255 = load i8, ptr %254, align 4, !dbg !1802
  %256 = icmp ne i8 %255, 0, !dbg !1803
  br i1 %256, label %257, label %334, !dbg !1798

257:                                              ; preds = %248
    #dbg_declare(ptr %29, !1804, !DIExpression(), !1807)
  %258 = load ptr, ptr %28, align 8, !dbg !1808
  %259 = getelementptr inbounds nuw %struct.object, ptr %258, i32 0, i32 22, !dbg !1809
  store ptr %259, ptr %29, align 8, !dbg !1807
    #dbg_declare(ptr %30, !1810, !DIExpression(), !1811)
  %260 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %25), !dbg !1812
  %261 = load ptr, ptr %11, align 8, !dbg !1813
  %262 = getelementptr inbounds nuw %struct.object, ptr %261, i32 0, i32 2, !dbg !1814
  %263 = load i8, ptr %262, align 1, !dbg !1814
  %264 = zext i8 %263 to i64, !dbg !1815
  %265 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %264, !dbg !1815
  %266 = getelementptr inbounds nuw %struct.weapon_info, ptr %265, i32 0, i32 19, !dbg !1816
  %267 = load i8, ptr %266, align 4, !dbg !1816
  %268 = sext i8 %267 to i32, !dbg !1815
  %269 = mul nsw i32 %260, %268, !dbg !1817
  %270 = load i32, ptr @FrameTime, align 4, !dbg !1818
  %271 = call noundef i32 @_Z6fixdivii(i32 noundef %269, i32 noundef %270), !dbg !1819
  %272 = sdiv i32 %271, 128, !dbg !1820
  %273 = call noundef i32 @_Z3f2ii(i32 noundef %272), !dbg !1821
  %274 = add nsw i32 %273, 2, !dbg !1822
  store i32 %274, ptr %30, align 4, !dbg !1811
  %275 = load ptr, ptr %21, align 8, !dbg !1823
  %276 = getelementptr inbounds nuw %struct.object, ptr %275, i32 0, i32 22, !dbg !1825
  %277 = getelementptr inbounds nuw %struct.ai_static, ptr %276, i32 0, i32 1, !dbg !1826
  %278 = getelementptr inbounds [11 x i8], ptr %277, i64 0, i64 7, !dbg !1823
  %279 = load i8, ptr %278, align 1, !dbg !1823
  %280 = sext i8 %279 to i32, !dbg !1823
  %281 = load i32, ptr @FrameTime, align 4, !dbg !1827
  %282 = mul nsw i32 %280, %281, !dbg !1828
  %283 = icmp slt i32 %282, 65536, !dbg !1829
  br i1 %283, label %284, label %327, !dbg !1829

284:                                              ; preds = %257
  %285 = load i32, ptr %30, align 4, !dbg !1830
  %286 = load ptr, ptr %29, align 8, !dbg !1832
  %287 = getelementptr inbounds nuw %struct.ai_static, ptr %286, i32 0, i32 1, !dbg !1833
  %288 = getelementptr inbounds [11 x i8], ptr %287, i64 0, i64 7, !dbg !1832
  %289 = load i8, ptr %288, align 1, !dbg !1834
  %290 = sext i8 %289 to i32, !dbg !1834
  %291 = add nsw i32 %290, %285, !dbg !1834
  %292 = trunc i32 %291 to i8, !dbg !1834
  store i8 %292, ptr %288, align 1, !dbg !1834
  %293 = call noundef i32 @_Z6P_Randv(), !dbg !1835
  %294 = sub nsw i32 %293, 16384, !dbg !1836
  %295 = load i32, ptr %30, align 4, !dbg !1837
  %296 = mul nsw i32 %294, %295, !dbg !1838
  %297 = sdiv i32 %296, 16, !dbg !1839
  %298 = load ptr, ptr %28, align 8, !dbg !1840
  %299 = getelementptr inbounds nuw %struct.object, ptr %298, i32 0, i32 21, !dbg !1841
  %300 = getelementptr inbounds nuw %struct.physics_info, ptr %299, i32 0, i32 6, !dbg !1842
  %301 = getelementptr inbounds nuw %struct.vms_vector, ptr %300, i32 0, i32 0, !dbg !1843
  store i32 %297, ptr %301, align 4, !dbg !1844
  %302 = call noundef i32 @_Z6P_Randv(), !dbg !1845
  %303 = sub nsw i32 %302, 16384, !dbg !1846
  %304 = load i32, ptr %30, align 4, !dbg !1847
  %305 = mul nsw i32 %303, %304, !dbg !1848
  %306 = sdiv i32 %305, 16, !dbg !1849
  %307 = load ptr, ptr %28, align 8, !dbg !1850
  %308 = getelementptr inbounds nuw %struct.object, ptr %307, i32 0, i32 21, !dbg !1851
  %309 = getelementptr inbounds nuw %struct.physics_info, ptr %308, i32 0, i32 6, !dbg !1852
  %310 = getelementptr inbounds nuw %struct.vms_vector, ptr %309, i32 0, i32 1, !dbg !1853
  store i32 %306, ptr %310, align 4, !dbg !1854
  %311 = call noundef i32 @_Z6P_Randv(), !dbg !1855
  %312 = sub nsw i32 %311, 16384, !dbg !1856
  %313 = load i32, ptr %30, align 4, !dbg !1857
  %314 = mul nsw i32 %312, %313, !dbg !1858
  %315 = sdiv i32 %314, 16, !dbg !1859
  %316 = load ptr, ptr %28, align 8, !dbg !1860
  %317 = getelementptr inbounds nuw %struct.object, ptr %316, i32 0, i32 21, !dbg !1861
  %318 = getelementptr inbounds nuw %struct.physics_info, ptr %317, i32 0, i32 6, !dbg !1862
  %319 = getelementptr inbounds nuw %struct.vms_vector, ptr %318, i32 0, i32 2, !dbg !1863
  store i32 %315, ptr %319, align 4, !dbg !1864
  %320 = load ptr, ptr %28, align 8, !dbg !1865
  %321 = getelementptr inbounds nuw %struct.object, ptr %320, i32 0, i32 21, !dbg !1866
  %322 = getelementptr inbounds nuw %struct.physics_info, ptr %321, i32 0, i32 8, !dbg !1867
  %323 = load i16, ptr %322, align 2, !dbg !1868
  %324 = zext i16 %323 to i32, !dbg !1868
  %325 = or i32 %324, 64, !dbg !1868
  %326 = trunc i32 %325 to i16, !dbg !1868
  store i16 %326, ptr %322, align 2, !dbg !1868
  br label %333, !dbg !1869

327:                                              ; preds = %257
  %328 = load ptr, ptr %29, align 8, !dbg !1870
  %329 = getelementptr inbounds nuw %struct.ai_static, ptr %328, i32 0, i32 1, !dbg !1871
  %330 = getelementptr inbounds [11 x i8], ptr %329, i64 0, i64 7, !dbg !1870
  %331 = load i8, ptr %330, align 1, !dbg !1872
  %332 = add i8 %331, -1, !dbg !1872
  store i8 %332, ptr %330, align 1, !dbg !1872
  br label %333

333:                                              ; preds = %327, %284
  br label %334, !dbg !1873

334:                                              ; preds = %333, %248, %239, %235
    #dbg_declare(ptr %31, !1874, !DIExpression(), !1876)
  %335 = getelementptr inbounds nuw %struct.vms_vector, ptr %25, i32 0, i32 0, !dbg !1877
  %336 = load i32, ptr %335, align 4, !dbg !1877
  %337 = mul nsw i32 %336, -2, !dbg !1878
  %338 = load i32, ptr @Difficulty_level, align 4, !dbg !1879
  %339 = sub nsw i32 7, %338, !dbg !1880
  %340 = mul nsw i32 %337, %339, !dbg !1881
  %341 = sdiv i32 %340, 8, !dbg !1882
  %342 = getelementptr inbounds nuw %struct.vms_vector, ptr %31, i32 0, i32 0, !dbg !1883
  store i32 %341, ptr %342, align 4, !dbg !1884
  %343 = getelementptr inbounds nuw %struct.vms_vector, ptr %25, i32 0, i32 1, !dbg !1885
  %344 = load i32, ptr %343, align 4, !dbg !1885
  %345 = mul nsw i32 %344, -2, !dbg !1886
  %346 = load i32, ptr @Difficulty_level, align 4, !dbg !1887
  %347 = sub nsw i32 7, %346, !dbg !1888
  %348 = mul nsw i32 %345, %347, !dbg !1889
  %349 = sdiv i32 %348, 8, !dbg !1890
  %350 = getelementptr inbounds nuw %struct.vms_vector, ptr %31, i32 0, i32 1, !dbg !1891
  store i32 %349, ptr %350, align 4, !dbg !1892
  %351 = getelementptr inbounds nuw %struct.vms_vector, ptr %25, i32 0, i32 2, !dbg !1893
  %352 = load i32, ptr %351, align 4, !dbg !1893
  %353 = mul nsw i32 %352, -2, !dbg !1894
  %354 = load i32, ptr @Difficulty_level, align 4, !dbg !1895
  %355 = sub nsw i32 7, %354, !dbg !1896
  %356 = mul nsw i32 %353, %355, !dbg !1897
  %357 = sdiv i32 %356, 8, !dbg !1898
  %358 = getelementptr inbounds nuw %struct.vms_vector, ptr %31, i32 0, i32 2, !dbg !1899
  store i32 %357, ptr %358, align 4, !dbg !1900
  %359 = load ptr, ptr %28, align 8, !dbg !1901
  call void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %359, ptr noundef %31), !dbg !1902
  %360 = load ptr, ptr %28, align 8, !dbg !1903
  %361 = getelementptr inbounds nuw %struct.object, ptr %360, i32 0, i32 14, !dbg !1905
  %362 = load i32, ptr %361, align 4, !dbg !1905
  %363 = icmp sge i32 %362, 0, !dbg !1906
  br i1 %363, label %364, label %419, !dbg !1906

364:                                              ; preds = %334
  %365 = load ptr, ptr %28, align 8, !dbg !1907
  %366 = getelementptr inbounds nuw %struct.object, ptr %365, i32 0, i32 2, !dbg !1910
  %367 = load i8, ptr %366, align 1, !dbg !1910
  %368 = zext i8 %367 to i64, !dbg !1911
  %369 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %368, !dbg !1911
  %370 = getelementptr inbounds nuw %struct.robot_info, ptr %369, i32 0, i32 36, !dbg !1912
  %371 = load i8, ptr %370, align 4, !dbg !1912
  %372 = icmp ne i8 %371, 0, !dbg !1911
  br i1 %372, label %373, label %391, !dbg !1911

373:                                              ; preds = %364
  %374 = load ptr, ptr %28, align 8, !dbg !1913
  %375 = getelementptr inbounds nuw %struct.object, ptr %374, i32 0, i32 2, !dbg !1915
  %376 = load i8, ptr %375, align 1, !dbg !1915
  %377 = zext i8 %376 to i64, !dbg !1916
  %378 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %377, !dbg !1916
  %379 = getelementptr inbounds nuw %struct.robot_info, ptr %378, i32 0, i32 36, !dbg !1917
  %380 = load i8, ptr %379, align 4, !dbg !1917
  %381 = sext i8 %380 to i32, !dbg !1916
  %382 = sub nsw i32 %381, 21, !dbg !1918
  %383 = sext i32 %382 to i64, !dbg !1919
  %384 = getelementptr inbounds [8 x i8], ptr @Boss_invulnerable_matter, i64 0, i64 %383, !dbg !1919
  %385 = load i8, ptr %384, align 1, !dbg !1919
  %386 = icmp ne i8 %385, 0, !dbg !1919
  br i1 %386, label %387, label %390, !dbg !1919

387:                                              ; preds = %373
  %388 = load i32, ptr %26, align 4, !dbg !1920
  %389 = sdiv i32 %388, 4, !dbg !1920
  store i32 %389, ptr %26, align 4, !dbg !1920
  br label %390, !dbg !1921

390:                                              ; preds = %387, %373
  br label %391, !dbg !1922

391:                                              ; preds = %390, %364
  %392 = load ptr, ptr %28, align 8, !dbg !1923
  %393 = load i32, ptr %26, align 4, !dbg !1925
  %394 = load i32, ptr %19, align 4, !dbg !1926
  %395 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %392, i32 noundef %393, i32 noundef %394), !dbg !1927
  %396 = icmp ne i32 %395, 0, !dbg !1927
  br i1 %396, label %397, label %418, !dbg !1927

397:                                              ; preds = %391
  %398 = load ptr, ptr %11, align 8, !dbg !1928
  %399 = icmp ne ptr %398, null, !dbg !1930
  br i1 %399, label %400, label %417, !dbg !1931

400:                                              ; preds = %397
  %401 = load i32, ptr %19, align 4, !dbg !1932
  %402 = load i32, ptr @Player_num, align 4, !dbg !1933
  %403 = sext i32 %402 to i64, !dbg !1934
  %404 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %403, !dbg !1934
  %405 = getelementptr inbounds nuw %struct.player, ptr %404, i32 0, i32 4, !dbg !1935
  %406 = load i32, ptr %405, align 4, !dbg !1935
  %407 = icmp eq i32 %401, %406, !dbg !1936
  br i1 %407, label %408, label %417, !dbg !1931

408:                                              ; preds = %400
  %409 = load ptr, ptr %28, align 8, !dbg !1937
  %410 = getelementptr inbounds nuw %struct.object, ptr %409, i32 0, i32 2, !dbg !1938
  %411 = load i8, ptr %410, align 1, !dbg !1938
  %412 = zext i8 %411 to i64, !dbg !1939
  %413 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %412, !dbg !1939
  %414 = getelementptr inbounds nuw %struct.robot_info, ptr %413, i32 0, i32 15, !dbg !1940
  %415 = load i16, ptr %414, align 4, !dbg !1940
  %416 = sext i16 %415 to i32, !dbg !1939
  call void @_Z19add_points_to_scorei(i32 noundef %416), !dbg !1941
  br label %417, !dbg !1941

417:                                              ; preds = %408, %400, %397
  br label %418, !dbg !1942

418:                                              ; preds = %417, %391
  br label %419, !dbg !1943

419:                                              ; preds = %418, %334
  %420 = load ptr, ptr %11, align 8, !dbg !1944
  %421 = icmp ne ptr %420, null, !dbg !1946
  br i1 %421, label %422, label %466, !dbg !1947

422:                                              ; preds = %419
  %423 = load ptr, ptr %28, align 8, !dbg !1948
  %424 = getelementptr inbounds nuw %struct.object, ptr %423, i32 0, i32 2, !dbg !1949
  %425 = load i8, ptr %424, align 1, !dbg !1949
  %426 = zext i8 %425 to i64, !dbg !1950
  %427 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %426, !dbg !1950
  %428 = getelementptr inbounds nuw %struct.robot_info, ptr %427, i32 0, i32 37, !dbg !1951
  %429 = load i8, ptr %428, align 1, !dbg !1951
  %430 = icmp ne i8 %429, 0, !dbg !1952
  br i1 %430, label %431, label %466, !dbg !1953

431:                                              ; preds = %422
  %432 = load ptr, ptr %11, align 8, !dbg !1954
  %433 = getelementptr inbounds nuw %struct.object, ptr %432, i32 0, i32 2, !dbg !1955
  %434 = load i8, ptr %433, align 1, !dbg !1955
  %435 = zext i8 %434 to i64, !dbg !1956
  %436 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %435, !dbg !1956
  %437 = getelementptr inbounds nuw %struct.weapon_info, ptr %436, i32 0, i32 19, !dbg !1957
  %438 = load i8, ptr %437, align 4, !dbg !1957
  %439 = icmp ne i8 %438, 0, !dbg !1956
  br i1 %439, label %466, label %440, !dbg !1953

440:                                              ; preds = %431
    #dbg_declare(ptr %32, !1958, !DIExpression(), !1960)
    #dbg_declare(ptr %33, !1961, !DIExpression(), !1962)
    #dbg_declare(ptr %34, !1963, !DIExpression(), !1965)
  %441 = load i32, ptr %26, align 4, !dbg !1966
  %442 = sdiv i32 %441, 8, !dbg !1967
  %443 = call noundef i32 @_Z3f2ii(i32 noundef %442), !dbg !1968
  store i32 %443, ptr %33, align 4, !dbg !1969
  %444 = load i32, ptr %33, align 4, !dbg !1970
  %445 = icmp sgt i32 %444, 4, !dbg !1972
  br i1 %445, label %446, label %447, !dbg !1972

446:                                              ; preds = %440
  store i32 4, ptr %33, align 4, !dbg !1973
  br label %452, !dbg !1974

447:                                              ; preds = %440
  %448 = load i32, ptr %33, align 4, !dbg !1975
  %449 = icmp sle i32 %448, 0, !dbg !1977
  br i1 %449, label %450, label %451, !dbg !1977

450:                                              ; preds = %447
  store i32 1, ptr %33, align 4, !dbg !1978
  br label %451, !dbg !1979

451:                                              ; preds = %450, %447
  br label %452

452:                                              ; preds = %451, %446
  %453 = getelementptr inbounds [26 x i8], ptr %34, i64 0, i64 0, !dbg !1980
  store i8 0, ptr %453, align 1, !dbg !1981
  store i32 0, ptr %32, align 4, !dbg !1982
  br label %454, !dbg !1984

454:                                              ; preds = %461, %452
  %455 = load i32, ptr %32, align 4, !dbg !1985
  %456 = load i32, ptr %33, align 4, !dbg !1987
  %457 = icmp slt i32 %455, %456, !dbg !1988
  br i1 %457, label %458, label %464, !dbg !1989

458:                                              ; preds = %454
  %459 = getelementptr inbounds [26 x i8], ptr %34, i64 0, i64 0, !dbg !1990
  %460 = call ptr @strcat(ptr noundef %459, ptr noundef @.str.1) #6, !dbg !1991
  br label %461, !dbg !1991

461:                                              ; preds = %458
  %462 = load i32, ptr %32, align 4, !dbg !1992
  %463 = add nsw i32 %462, 1, !dbg !1992
  store i32 %463, ptr %32, align 4, !dbg !1992
  br label %454, !dbg !1993, !llvm.loop !1994

464:                                              ; preds = %454
  %465 = getelementptr inbounds [26 x i8], ptr %34, i64 0, i64 0, !dbg !1997
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef %465), !dbg !1998
  br label %466, !dbg !1999

466:                                              ; preds = %464, %431, %422, %419
  br label %621, !dbg !2000

467:                                              ; preds = %164
  %468 = load ptr, ptr %28, align 8, !dbg !2001
  %469 = getelementptr inbounds nuw %struct.object, ptr %468, i32 0, i32 14, !dbg !2003
  %470 = load i32, ptr %469, align 4, !dbg !2003
  %471 = icmp sge i32 %470, 0, !dbg !2004
  br i1 %471, label %472, label %477, !dbg !2004

472:                                              ; preds = %467
  %473 = load ptr, ptr %28, align 8, !dbg !2005
  %474 = load i32, ptr %26, align 4, !dbg !2007
  %475 = load i32, ptr %19, align 4, !dbg !2008
  %476 = trunc i32 %475 to i16, !dbg !2008
  call void @_Z26apply_damage_to_controlcenP6objectis(ptr noundef %473, i32 noundef %474, i16 noundef signext %476), !dbg !2009
  br label %477, !dbg !2010

477:                                              ; preds = %472, %467
  br label %621, !dbg !2011

478:                                              ; preds = %164
    #dbg_declare(ptr %35, !2012, !DIExpression(), !2014)
  store ptr null, ptr %35, align 8, !dbg !2014
    #dbg_declare(ptr %36, !2015, !DIExpression(), !2016)
  %479 = load ptr, ptr %11, align 8, !dbg !2017
  %480 = icmp ne ptr %479, null, !dbg !2019
  br i1 %480, label %481, label %557, !dbg !2020

481:                                              ; preds = %478
  %482 = load ptr, ptr %11, align 8, !dbg !2021
  %483 = getelementptr inbounds nuw %struct.object, ptr %482, i32 0, i32 2, !dbg !2022
  %484 = load i8, ptr %483, align 1, !dbg !2022
  %485 = zext i8 %484 to i64, !dbg !2023
  %486 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %485, !dbg !2023
  %487 = getelementptr inbounds nuw %struct.weapon_info, ptr %486, i32 0, i32 19, !dbg !2024
  %488 = load i8, ptr %487, align 4, !dbg !2024
  %489 = icmp ne i8 %488, 0, !dbg !2023
  br i1 %489, label %490, label %557, !dbg !2025

490:                                              ; preds = %481
  %491 = load ptr, ptr %28, align 8, !dbg !2026
  %492 = getelementptr inbounds nuw %struct.object, ptr %491, i32 0, i32 2, !dbg !2027
  %493 = load i8, ptr %492, align 1, !dbg !2027
  %494 = zext i8 %493 to i32, !dbg !2026
  %495 = load i32, ptr @Player_num, align 4, !dbg !2028
  %496 = icmp eq i32 %494, %495, !dbg !2029
  br i1 %496, label %497, label %557, !dbg !2025

497:                                              ; preds = %490
    #dbg_declare(ptr %37, !2030, !DIExpression(), !2032)
  store i32 262144, ptr %38, align 4, !dbg !2033
  %498 = load i32, ptr %23, align 4, !dbg !2034
  %499 = load ptr, ptr %11, align 8, !dbg !2035
  %500 = getelementptr inbounds nuw %struct.object, ptr %499, i32 0, i32 2, !dbg !2036
  %501 = load i8, ptr %500, align 1, !dbg !2036
  %502 = zext i8 %501 to i64, !dbg !2037
  %503 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %502, !dbg !2037
  %504 = getelementptr inbounds nuw %struct.weapon_info, ptr %503, i32 0, i32 19, !dbg !2038
  %505 = load i8, ptr %504, align 4, !dbg !2038
  %506 = sext i8 %505 to i32, !dbg !2037
  %507 = mul nsw i32 %498, %506, !dbg !2039
  %508 = sdiv i32 %507, 32, !dbg !2040
  store i32 %508, ptr %39, align 4, !dbg !2041
  %509 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %38, ptr noundef nonnull align 4 dereferenceable(4) %39), !dbg !2042
  %510 = load i32, ptr %509, align 4, !dbg !2042
  store i32 %510, ptr %37, align 4, !dbg !2043
  %511 = load ptr, ptr %11, align 8, !dbg !2044
  %512 = getelementptr inbounds nuw %struct.object, ptr %511, i32 0, i32 22, !dbg !2046
  %513 = getelementptr inbounds nuw %struct.laser_info_s, ptr %512, i32 0, i32 2, !dbg !2047
  %514 = load i32, ptr %513, align 4, !dbg !2047
  %515 = load ptr, ptr @ConsoleObject, align 8, !dbg !2048
  %516 = getelementptr inbounds nuw %struct.object, ptr %515, i32 0, i32 0, !dbg !2049
  %517 = load i32, ptr %516, align 4, !dbg !2049
  %518 = icmp eq i32 %514, %517, !dbg !2050
  br i1 %518, label %519, label %524, !dbg !2050

519:                                              ; preds = %497
  %520 = load i32, ptr %37, align 4, !dbg !2051
  %521 = sdiv i32 %520, 2, !dbg !2051
  store i32 %521, ptr %37, align 4, !dbg !2051
  %522 = load i32, ptr %23, align 4, !dbg !2053
  %523 = sdiv i32 %522, 2, !dbg !2053
  store i32 %523, ptr %23, align 4, !dbg !2053
  br label %524, !dbg !2054

524:                                              ; preds = %519, %497
  %525 = load i32, ptr %23, align 4, !dbg !2055
  %526 = icmp sgt i32 %525, 65536, !dbg !2057
  br i1 %526, label %527, label %556, !dbg !2057

527:                                              ; preds = %524
  %528 = load i32, ptr %37, align 4, !dbg !2058
  store i32 %528, ptr @Flash_effect, align 4, !dbg !2060
  %529 = load i32, ptr @PK1, align 4, !dbg !2061
  %530 = load i32, ptr @PK2, align 4, !dbg !2062
  %531 = load i32, ptr %23, align 4, !dbg !2063
  %532 = mul nsw i32 %530, %531, !dbg !2064
  %533 = call noundef i32 @_Z3f2ii(i32 noundef %532), !dbg !2065
  %534 = add nsw i32 %529, %533, !dbg !2066
  %535 = load i32, ptr @PK1, align 4, !dbg !2067
  %536 = load i32, ptr @PK2, align 4, !dbg !2068
  %537 = load i32, ptr %23, align 4, !dbg !2069
  %538 = mul nsw i32 %536, %537, !dbg !2070
  %539 = call noundef i32 @_Z3f2ii(i32 noundef %538), !dbg !2071
  %540 = add nsw i32 %535, %539, !dbg !2072
  %541 = load i32, ptr @PK1, align 4, !dbg !2073
  %542 = load i32, ptr @PK2, align 4, !dbg !2074
  %543 = load i32, ptr %23, align 4, !dbg !2075
  %544 = mul nsw i32 %542, %543, !dbg !2076
  %545 = call noundef i32 @_Z3f2ii(i32 noundef %544), !dbg !2077
  %546 = add nsw i32 %541, %545, !dbg !2078
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef %534, i32 noundef %540, i32 noundef %546), !dbg !2079
  %547 = load i32, ptr %23, align 4, !dbg !2080
  %548 = call noundef float @_Z4f2fli(i32 noundef %547), !dbg !2080
  %549 = fpext float %548 to double, !dbg !2080
  %550 = load i32, ptr @PK1, align 4, !dbg !2080
  %551 = load i32, ptr @PK2, align 4, !dbg !2080
  %552 = load i32, ptr %23, align 4, !dbg !2080
  %553 = mul nsw i32 %551, %552, !dbg !2080
  %554 = call noundef i32 @_Z3f2ii(i32 noundef %553), !dbg !2080
  %555 = add nsw i32 %550, %554, !dbg !2080
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.2, double noundef %549, i32 noundef %555), !dbg !2080
  br label %556, !dbg !2081

556:                                              ; preds = %527, %524
  br label %557, !dbg !2082

557:                                              ; preds = %556, %490, %481, %478
  %558 = load ptr, ptr %11, align 8, !dbg !2083
  %559 = icmp ne ptr %558, null, !dbg !2085
  br i1 %559, label %560, label %572, !dbg !2086

560:                                              ; preds = %557
  %561 = load i32, ptr @Game_mode, align 4, !dbg !2087
  %562 = and i32 %561, 38, !dbg !2088
  %563 = icmp ne i32 %562, 0, !dbg !2089
  br i1 %563, label %564, label %572, !dbg !2090

564:                                              ; preds = %560
  %565 = load ptr, ptr %11, align 8, !dbg !2091
  %566 = getelementptr inbounds nuw %struct.object, ptr %565, i32 0, i32 1, !dbg !2092
  %567 = load i8, ptr %566, align 4, !dbg !2092
  %568 = zext i8 %567 to i32, !dbg !2091
  %569 = icmp eq i32 %568, 4, !dbg !2093
  br i1 %569, label %570, label %572, !dbg !2090

570:                                              ; preds = %564
  %571 = load ptr, ptr %11, align 8, !dbg !2094
  store ptr %571, ptr %35, align 8, !dbg !2096
  br label %572, !dbg !2097

572:                                              ; preds = %570, %564, %560, %557
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %36, ptr align 4 %25, i64 12, i1 false), !dbg !2098
  %573 = load i32, ptr %19, align 4, !dbg !2099
  %574 = icmp sgt i32 %573, -1, !dbg !2101
  br i1 %574, label %575, label %593, !dbg !2101

575:                                              ; preds = %572
  %576 = load i32, ptr %19, align 4, !dbg !2102
  %577 = sext i32 %576 to i64, !dbg !2104
  %578 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %577, !dbg !2104
  store ptr %578, ptr %35, align 8, !dbg !2105
  %579 = load ptr, ptr %35, align 8, !dbg !2106
  %580 = load ptr, ptr @ConsoleObject, align 8, !dbg !2108
  %581 = icmp ne ptr %579, %580, !dbg !2109
  br i1 %581, label %582, label %586, !dbg !2109

582:                                              ; preds = %575
  %583 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 0, !dbg !2110
  %584 = load i32, ptr %583, align 4, !dbg !2111
  %585 = sdiv i32 %584, 2, !dbg !2111
  store i32 %585, ptr %583, align 4, !dbg !2111
  br label %586, !dbg !2112

586:                                              ; preds = %582, %575
  %587 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 1, !dbg !2113
  %588 = load i32, ptr %587, align 4, !dbg !2114
  %589 = sdiv i32 %588, 2, !dbg !2114
  store i32 %589, ptr %587, align 4, !dbg !2114
  %590 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !2115
  %591 = load i32, ptr %590, align 4, !dbg !2116
  %592 = sdiv i32 %591, 2, !dbg !2116
  store i32 %592, ptr %590, align 4, !dbg !2116
  br label %593, !dbg !2117

593:                                              ; preds = %586, %572
  %594 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 0, !dbg !2118
  %595 = load i32, ptr %594, align 4, !dbg !2119
  %596 = sdiv i32 %595, 2, !dbg !2119
  store i32 %596, ptr %594, align 4, !dbg !2119
  %597 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 1, !dbg !2120
  %598 = load i32, ptr %597, align 4, !dbg !2121
  %599 = sdiv i32 %598, 2, !dbg !2121
  store i32 %599, ptr %597, align 4, !dbg !2121
  %600 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !2122
  %601 = load i32, ptr %600, align 4, !dbg !2123
  %602 = sdiv i32 %601, 2, !dbg !2123
  store i32 %602, ptr %600, align 4, !dbg !2123
  %603 = load ptr, ptr %28, align 8, !dbg !2124
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %603, ptr noundef %25), !dbg !2125
  %604 = load ptr, ptr %28, align 8, !dbg !2126
  call void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %604, ptr noundef %36), !dbg !2127
  %605 = load i32, ptr @Difficulty_level, align 4, !dbg !2128
  %606 = icmp eq i32 %605, 0, !dbg !2130
  br i1 %606, label %607, label %610, !dbg !2130

607:                                              ; preds = %593
  %608 = load i32, ptr %26, align 4, !dbg !2131
  %609 = sdiv i32 %608, 4, !dbg !2131
  store i32 %609, ptr %26, align 4, !dbg !2131
  br label %610, !dbg !2132

610:                                              ; preds = %607, %593
  %611 = load ptr, ptr %28, align 8, !dbg !2133
  %612 = getelementptr inbounds nuw %struct.object, ptr %611, i32 0, i32 14, !dbg !2135
  %613 = load i32, ptr %612, align 4, !dbg !2135
  %614 = icmp sge i32 %613, 0, !dbg !2136
  br i1 %614, label %615, label %619, !dbg !2136

615:                                              ; preds = %610
  %616 = load ptr, ptr %28, align 8, !dbg !2137
  %617 = load ptr, ptr %35, align 8, !dbg !2138
  %618 = load i32, ptr %26, align 4, !dbg !2139
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %616, ptr noundef %617, i32 noundef %618), !dbg !2140
  br label %619, !dbg !2140

619:                                              ; preds = %615, %610
  br label %621, !dbg !2141

620:                                              ; preds = %164
  call void @_Z4Int3v(), !dbg !2142
  br label %621, !dbg !2143

621:                                              ; preds = %620, %619, %477, %466, %234
  br label %623, !dbg !2144

622:                                              ; preds = %159
  br label %623

623:                                              ; preds = %622, %621
  br label %624, !dbg !2145

624:                                              ; preds = %623, %150
  br label %625, !dbg !2146

625:                                              ; preds = %624, %138, %124, %81, %77
  %626 = load ptr, ptr %28, align 8, !dbg !2147
  %627 = getelementptr inbounds nuw %struct.object, ptr %626, i32 1, !dbg !2147
  store ptr %627, ptr %28, align 8, !dbg !2147
  br label %628, !dbg !2148

628:                                              ; preds = %625
  %629 = load i32, ptr %27, align 4, !dbg !2149
  %630 = add nsw i32 %629, 1, !dbg !2149
  store i32 %630, ptr %27, align 4, !dbg !2149
  br label %73, !dbg !2150, !llvm.loop !2151

631:                                              ; preds = %73
  br label %632, !dbg !2153

632:                                              ; preds = %631, %50
  %633 = load ptr, ptr %21, align 8, !dbg !2154
  store ptr %633, ptr %10, align 8, !dbg !2155
  br label %634, !dbg !2155

634:                                              ; preds = %632, %49
  %635 = load ptr, ptr %10, align 8, !dbg !2156
  ret ptr %635, !dbg !2156
}

declare noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext, i8 noundef zeroext, i32 noundef, ptr noundef, ptr noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z9fixmuldiviii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #2 !dbg !2157 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !2160, !DIExpression(), !2161)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2162, !DIExpression(), !2163)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2164, !DIExpression(), !2165)
  %8 = load i32, ptr %7, align 4, !dbg !2166
  %9 = icmp eq i32 %8, 0, !dbg !2168
  br i1 %9, label %10, label %11, !dbg !2168

10:                                               ; preds = %3
  store i32 1, ptr %4, align 4, !dbg !2169
  br label %21, !dbg !2169

11:                                               ; preds = %3
  %12 = load i32, ptr %5, align 4, !dbg !2170
  %13 = sext i32 %12 to i64, !dbg !2170
  %14 = load i32, ptr %6, align 4, !dbg !2171
  %15 = sext i32 %14 to i64, !dbg !2171
  %16 = mul nsw i64 %13, %15, !dbg !2172
  %17 = load i32, ptr %7, align 4, !dbg !2173
  %18 = sext i32 %17 to i64, !dbg !2173
  %19 = sdiv i64 %16, %18, !dbg !2174
  %20 = trunc i64 %19 to i32, !dbg !2175
  store i32 %20, ptr %4, align 4, !dbg !2176
  br label %21, !dbg !2176

21:                                               ; preds = %11, %10
  %22 = load i32, ptr %4, align 4, !dbg !2177
  ret i32 %22, !dbg !2177
}

declare noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #2 !dbg !2178 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !2181, !DIExpression(), !2182)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2183, !DIExpression(), !2184)
  %6 = load i32, ptr %5, align 4, !dbg !2185
  %7 = icmp eq i32 %6, 0, !dbg !2187
  br i1 %7, label %8, label %9, !dbg !2187

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !2188
  br label %17, !dbg !2188

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !2189
  %11 = sext i32 %10 to i64, !dbg !2189
  %12 = shl i64 %11, 16, !dbg !2190
  %13 = load i32, ptr %5, align 4, !dbg !2191
  %14 = sext i32 %13 to i64, !dbg !2191
  %15 = sdiv i64 %12, %14, !dbg !2192
  %16 = trunc i64 %15 to i32, !dbg !2193
  store i32 %16, ptr %3, align 4, !dbg !2194
  br label %17, !dbg !2194

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !2195
  ret i32 %18, !dbg !2195
}

declare void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #2 !dbg !2196 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2197, !DIExpression(), !2198)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2199, !DIExpression(), !2200)
  %5 = load i32, ptr %3, align 4, !dbg !2201
  %6 = sext i32 %5 to i64, !dbg !2201
  %7 = load i32, ptr %4, align 4, !dbg !2202
  %8 = sext i32 %7 to i64, !dbg !2202
  %9 = mul nsw i64 %6, %8, !dbg !2203
  %10 = ashr i64 %9, 16, !dbg !2204
  %11 = trunc i64 %10 to i32, !dbg !2205
  ret i32 %11, !dbg !2206
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #2 !dbg !2207 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2210, !DIExpression(), !2211)
  %3 = load i32, ptr %2, align 4, !dbg !2212
  %4 = shl i32 %3, 16, !dbg !2213
  ret i32 %4, !dbg !2214
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %0, ptr noundef %1) #0 !dbg !2215 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2218, !DIExpression(), !2219)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2220, !DIExpression(), !2221)
    #dbg_declare(ptr %5, !2222, !DIExpression(), !2276)
  %6 = load ptr, ptr %3, align 8, !dbg !2277
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 2, !dbg !2278
  %8 = load i8, ptr %7, align 1, !dbg !2278
  %9 = zext i8 %8 to i64, !dbg !2279
  %10 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %9, !dbg !2279
  store ptr %10, ptr %5, align 8, !dbg !2276
  %11 = load ptr, ptr %5, align 8, !dbg !2280
  %12 = getelementptr inbounds nuw %struct.weapon_info, ptr %11, i32 0, i32 37, !dbg !2280
  %13 = load i32, ptr %12, align 4, !dbg !2280
  call void @_Z7_AssertiPKcS0_i(i32 noundef %13, ptr noundef @.str.3, ptr noundef @.str.4, i32 noundef 297), !dbg !2280
  %14 = load ptr, ptr %3, align 8, !dbg !2281
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 2, !dbg !2283
  %16 = load i8, ptr %15, align 1, !dbg !2283
  %17 = zext i8 %16 to i32, !dbg !2281
  %18 = icmp eq i32 %17, 40, !dbg !2284
  br i1 %18, label %25, label %19, !dbg !2285

19:                                               ; preds = %2
  %20 = load ptr, ptr %3, align 8, !dbg !2286
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 2, !dbg !2287
  %22 = load i8, ptr %21, align 1, !dbg !2287
  %23 = zext i8 %22 to i32, !dbg !2286
  %24 = icmp eq i32 %23, 58, !dbg !2288
  br i1 %24, label %25, label %26, !dbg !2285

25:                                               ; preds = %19, %2
  call void @_Z16smega_rock_stuffv(), !dbg !2289
  br label %26, !dbg !2289

26:                                               ; preds = %25, %19
  %27 = load ptr, ptr %3, align 8, !dbg !2290
  %28 = ptrtoint ptr %27 to i64, !dbg !2291
  %29 = sub i64 %28, ptrtoint (ptr @Objects to i64), !dbg !2291
  %30 = sdiv exact i64 %29, 268, !dbg !2291
  %31 = trunc i64 %30 to i16, !dbg !2290
  %32 = call noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef 11, i16 noundef signext %31, i32 noundef 0, i32 noundef 65536), !dbg !2292
  %33 = load ptr, ptr %3, align 8, !dbg !2293
  %34 = load ptr, ptr %3, align 8, !dbg !2294
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 9, !dbg !2295
  %36 = load i16, ptr %35, align 2, !dbg !2295
  %37 = load ptr, ptr %4, align 8, !dbg !2296
  %38 = load ptr, ptr %5, align 8, !dbg !2297
  %39 = getelementptr inbounds nuw %struct.weapon_info, ptr %38, i32 0, i32 28, !dbg !2298
  %40 = load i32, ptr %39, align 4, !dbg !2298
  %41 = load ptr, ptr %5, align 8, !dbg !2299
  %42 = getelementptr inbounds nuw %struct.weapon_info, ptr %41, i32 0, i32 5, !dbg !2300
  %43 = load i8, ptr %42, align 1, !dbg !2300
  %44 = sext i8 %43 to i32, !dbg !2299
  %45 = load ptr, ptr %5, align 8, !dbg !2301
  %46 = getelementptr inbounds nuw %struct.weapon_info, ptr %45, i32 0, i32 29, !dbg !2302
  %47 = load i32, ptr @Difficulty_level, align 4, !dbg !2303
  %48 = sext i32 %47 to i64, !dbg !2301
  %49 = getelementptr inbounds [5 x i32], ptr %46, i64 0, i64 %48, !dbg !2301
  %50 = load i32, ptr %49, align 4, !dbg !2301
  %51 = load ptr, ptr %5, align 8, !dbg !2304
  %52 = getelementptr inbounds nuw %struct.weapon_info, ptr %51, i32 0, i32 37, !dbg !2305
  %53 = load i32, ptr %52, align 4, !dbg !2305
  %54 = load ptr, ptr %5, align 8, !dbg !2306
  %55 = getelementptr inbounds nuw %struct.weapon_info, ptr %54, i32 0, i32 29, !dbg !2307
  %56 = load i32, ptr @Difficulty_level, align 4, !dbg !2308
  %57 = sext i32 %56 to i64, !dbg !2306
  %58 = getelementptr inbounds [5 x i32], ptr %55, i64 0, i64 %57, !dbg !2306
  %59 = load i32, ptr %58, align 4, !dbg !2306
  %60 = load ptr, ptr %3, align 8, !dbg !2309
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 22, !dbg !2310
  %62 = getelementptr inbounds nuw %struct.laser_info_s, ptr %61, i32 0, i32 1, !dbg !2311
  %63 = load i16, ptr %62, align 2, !dbg !2311
  %64 = sext i16 %63 to i32, !dbg !2309
  %65 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef %33, i16 noundef signext %36, ptr noundef %37, i32 noundef %40, i32 noundef %44, i32 noundef %50, i32 noundef %53, i32 noundef %59, i32 noundef %64), !dbg !2312
  ret ptr %65, !dbg !2313
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #2 !dbg !2314 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2317, !DIExpression(), !2318)
  %3 = load i32, ptr %2, align 4, !dbg !2319
  %4 = ashr i32 %3, 16, !dbg !2320
  ret i32 %4, !dbg !2321
}

declare noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef) #1

declare noundef i32 @_Z6P_Randv() #1

declare void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z19add_points_to_scorei(i32 noundef) #1

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #3

declare void @_Z13buddy_messagePKcz(ptr noundef, ...) #1

declare void @_Z26apply_damage_to_controlcenP6objectis(ptr noundef, i32 noundef, i16 noundef signext) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !2322 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2329, !DIExpression(), !2330)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2331, !DIExpression(), !2332)
  %6 = load ptr, ptr %3, align 8, !dbg !2333
  %7 = load ptr, ptr %4, align 8, !dbg !2334
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2335
  ret ptr %8, !dbg !2336
}

declare void @_Z17PALETTE_FLASH_ADDiii(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef float @_Z4f2fli(i32 noundef %0) #2 !dbg !2337 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2340, !DIExpression(), !2341)
  %3 = load i32, ptr %2, align 4, !dbg !2342
  %4 = sitofp i32 %3 to float, !dbg !2342
  %5 = fdiv float %4, 6.553600e+04, !dbg !2343
  ret float %5, !dbg !2344
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z4Int3v() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z26object_create_muzzle_flashsP10vms_vectorii(i16 noundef signext %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2345 {
  %5 = alloca i16, align 2
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i16 %0, ptr %5, align 2
    #dbg_declare(ptr %5, !2348, !DIExpression(), !2349)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2350, !DIExpression(), !2351)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2352, !DIExpression(), !2353)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2354, !DIExpression(), !2355)
  %9 = load i16, ptr %5, align 2, !dbg !2356
  %10 = load ptr, ptr %6, align 8, !dbg !2357
  %11 = load i32, ptr %7, align 4, !dbg !2358
  %12 = load i32, ptr %8, align 4, !dbg !2359
  %13 = call noundef ptr @_Z27object_create_explosion_subP6objectsP10vms_vectoriiiiii(ptr noundef null, i16 noundef signext %9, ptr noundef %10, i32 noundef %11, i32 noundef %12, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef -1), !dbg !2360
  ret ptr %13, !dbg !2361
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2362 {
  %5 = alloca i16, align 2
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i16 %0, ptr %5, align 2
    #dbg_declare(ptr %5, !2363, !DIExpression(), !2364)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2365, !DIExpression(), !2366)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2367, !DIExpression(), !2368)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2369, !DIExpression(), !2370)
  %9 = load i16, ptr %5, align 2, !dbg !2371
  %10 = load ptr, ptr %6, align 8, !dbg !2372
  %11 = load i32, ptr %7, align 4, !dbg !2373
  %12 = load i32, ptr %8, align 4, !dbg !2374
  %13 = call noundef ptr @_Z27object_create_explosion_subP6objectsP10vms_vectoriiiiii(ptr noundef null, i16 noundef signext %9, ptr noundef %10, i32 noundef %11, i32 noundef %12, i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef -1), !dbg !2375
  ret ptr %13, !dbg !2376
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef %0, i16 noundef signext %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8) #0 !dbg !2377 {
  %10 = alloca ptr, align 8
  %11 = alloca i16, align 2
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  store ptr %0, ptr %10, align 8
    #dbg_declare(ptr %10, !2378, !DIExpression(), !2379)
  store i16 %1, ptr %11, align 2
    #dbg_declare(ptr %11, !2380, !DIExpression(), !2381)
  store ptr %2, ptr %12, align 8
    #dbg_declare(ptr %12, !2382, !DIExpression(), !2383)
  store i32 %3, ptr %13, align 4
    #dbg_declare(ptr %13, !2384, !DIExpression(), !2385)
  store i32 %4, ptr %14, align 4
    #dbg_declare(ptr %14, !2386, !DIExpression(), !2387)
  store i32 %5, ptr %15, align 4
    #dbg_declare(ptr %15, !2388, !DIExpression(), !2389)
  store i32 %6, ptr %16, align 4
    #dbg_declare(ptr %16, !2390, !DIExpression(), !2391)
  store i32 %7, ptr %17, align 4
    #dbg_declare(ptr %17, !2392, !DIExpression(), !2393)
  store i32 %8, ptr %18, align 4
    #dbg_declare(ptr %18, !2394, !DIExpression(), !2395)
    #dbg_declare(ptr %19, !2396, !DIExpression(), !2397)
  %20 = load ptr, ptr %10, align 8, !dbg !2398
  %21 = load i16, ptr %11, align 2, !dbg !2399
  %22 = load ptr, ptr %12, align 8, !dbg !2400
  %23 = load i32, ptr %13, align 4, !dbg !2401
  %24 = load i32, ptr %14, align 4, !dbg !2402
  %25 = load i32, ptr %15, align 4, !dbg !2403
  %26 = load i32, ptr %16, align 4, !dbg !2404
  %27 = load i32, ptr %17, align 4, !dbg !2405
  %28 = load i32, ptr %18, align 4, !dbg !2406
  %29 = call noundef ptr @_Z27object_create_explosion_subP6objectsP10vms_vectoriiiiii(ptr noundef %20, i16 noundef signext %21, ptr noundef %22, i32 noundef %23, i32 noundef %24, i32 noundef %25, i32 noundef %26, i32 noundef %27, i32 noundef %28), !dbg !2407
  store ptr %29, ptr %19, align 8, !dbg !2408
  %30 = load ptr, ptr %10, align 8, !dbg !2409
  %31 = icmp ne ptr %30, null, !dbg !2411
  br i1 %31, label %32, label %40, !dbg !2412

32:                                               ; preds = %9
  %33 = load ptr, ptr %10, align 8, !dbg !2413
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 1, !dbg !2414
  %35 = load i8, ptr %34, align 4, !dbg !2414
  %36 = zext i8 %35 to i32, !dbg !2413
  %37 = icmp eq i32 %36, 5, !dbg !2415
  br i1 %37, label %38, label %40, !dbg !2412

38:                                               ; preds = %32
  %39 = load ptr, ptr %10, align 8, !dbg !2416
  call void @_Z21create_smart_childrenP6objecti(ptr noundef %39, i32 noundef 6), !dbg !2417
  br label %40, !dbg !2417

40:                                               ; preds = %38, %32, %9
  %41 = load ptr, ptr %19, align 8, !dbg !2418
  ret ptr %41, !dbg !2419
}

declare void @_Z21create_smart_childrenP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z16smega_rock_stuffv() #1

declare noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef, i16 noundef signext, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z21explode_badass_objectP6objectiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2420 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2423, !DIExpression(), !2424)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2425, !DIExpression(), !2426)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2427, !DIExpression(), !2428)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2429, !DIExpression(), !2430)
    #dbg_declare(ptr %9, !2431, !DIExpression(), !2432)
  %10 = load ptr, ptr %5, align 8, !dbg !2433
  %11 = load ptr, ptr %5, align 8, !dbg !2434
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 9, !dbg !2435
  %13 = load i16, ptr %12, align 2, !dbg !2435
  %14 = load ptr, ptr %5, align 8, !dbg !2436
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 11, !dbg !2437
  %16 = load ptr, ptr %5, align 8, !dbg !2438
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 13, !dbg !2439
  %18 = load i32, ptr %17, align 4, !dbg !2439
  %19 = load ptr, ptr %5, align 8, !dbg !2440
  %20 = call noundef i32 @_Z19get_explosion_vclipP6objecti(ptr noundef %19, i32 noundef 0), !dbg !2441
  %21 = load i32, ptr %6, align 4, !dbg !2442
  %22 = load i32, ptr %7, align 4, !dbg !2443
  %23 = load i32, ptr %8, align 4, !dbg !2444
  %24 = load ptr, ptr %5, align 8, !dbg !2445
  %25 = ptrtoint ptr %24 to i64, !dbg !2446
  %26 = sub i64 %25, ptrtoint (ptr @Objects to i64), !dbg !2446
  %27 = sdiv exact i64 %26, 268, !dbg !2446
  %28 = trunc i64 %27 to i32, !dbg !2445
  %29 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef %10, i16 noundef signext %13, ptr noundef %15, i32 noundef %18, i32 noundef %20, i32 noundef %21, i32 noundef %22, i32 noundef %23, i32 noundef %28), !dbg !2447
  store ptr %29, ptr %9, align 8, !dbg !2448
  %30 = load ptr, ptr %9, align 8, !dbg !2449
  %31 = icmp ne ptr %30, null, !dbg !2449
  br i1 %31, label %32, label %39, !dbg !2449

32:                                               ; preds = %4
  %33 = load ptr, ptr %9, align 8, !dbg !2451
  %34 = ptrtoint ptr %33 to i64, !dbg !2452
  %35 = sub i64 %34, ptrtoint (ptr @Objects to i64), !dbg !2452
  %36 = sdiv exact i64 %35, 268, !dbg !2452
  %37 = trunc i64 %36 to i16, !dbg !2451
  %38 = call noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef 11, i16 noundef signext %37, i32 noundef 0, i32 noundef 65536), !dbg !2453
  br label %39, !dbg !2453

39:                                               ; preds = %32, %4
  %40 = load ptr, ptr %9, align 8, !dbg !2454
  ret ptr %40, !dbg !2455
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z19get_explosion_vclipP6objecti(ptr noundef %0, i32 noundef %1) #2 !dbg !2456 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2459, !DIExpression(), !2460)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2461, !DIExpression(), !2462)
  %6 = load ptr, ptr %4, align 8, !dbg !2463
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 1, !dbg !2465
  %8 = load i8, ptr %7, align 4, !dbg !2465
  %9 = zext i8 %8 to i32, !dbg !2463
  %10 = icmp eq i32 %9, 2, !dbg !2466
  br i1 %10, label %11, label %57, !dbg !2466

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4, !dbg !2467
  %13 = icmp eq i32 %12, 0, !dbg !2470
  br i1 %13, label %14, label %33, !dbg !2471

14:                                               ; preds = %11
  %15 = load ptr, ptr %4, align 8, !dbg !2472
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 2, !dbg !2473
  %17 = load i8, ptr %16, align 1, !dbg !2473
  %18 = zext i8 %17 to i64, !dbg !2474
  %19 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %18, !dbg !2474
  %20 = getelementptr inbounds nuw %struct.robot_info, ptr %19, i32 0, i32 3, !dbg !2475
  %21 = load i16, ptr %20, align 4, !dbg !2475
  %22 = sext i16 %21 to i32, !dbg !2474
  %23 = icmp sgt i32 %22, -1, !dbg !2476
  br i1 %23, label %24, label %33, !dbg !2471

24:                                               ; preds = %14
  %25 = load ptr, ptr %4, align 8, !dbg !2477
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 2, !dbg !2478
  %27 = load i8, ptr %26, align 1, !dbg !2478
  %28 = zext i8 %27 to i64, !dbg !2479
  %29 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %28, !dbg !2479
  %30 = getelementptr inbounds nuw %struct.robot_info, ptr %29, i32 0, i32 3, !dbg !2480
  %31 = load i16, ptr %30, align 4, !dbg !2480
  %32 = sext i16 %31 to i32, !dbg !2479
  store i32 %32, ptr %3, align 4, !dbg !2481
  br label %74, !dbg !2481

33:                                               ; preds = %14, %11
  %34 = load i32, ptr %5, align 4, !dbg !2482
  %35 = icmp eq i32 %34, 1, !dbg !2484
  br i1 %35, label %36, label %55, !dbg !2485

36:                                               ; preds = %33
  %37 = load ptr, ptr %4, align 8, !dbg !2486
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 2, !dbg !2487
  %39 = load i8, ptr %38, align 1, !dbg !2487
  %40 = zext i8 %39 to i64, !dbg !2488
  %41 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %40, !dbg !2488
  %42 = getelementptr inbounds nuw %struct.robot_info, ptr %41, i32 0, i32 5, !dbg !2489
  %43 = load i16, ptr %42, align 4, !dbg !2489
  %44 = sext i16 %43 to i32, !dbg !2488
  %45 = icmp sgt i32 %44, -1, !dbg !2490
  br i1 %45, label %46, label %55, !dbg !2485

46:                                               ; preds = %36
  %47 = load ptr, ptr %4, align 8, !dbg !2491
  %48 = getelementptr inbounds nuw %struct.object, ptr %47, i32 0, i32 2, !dbg !2492
  %49 = load i8, ptr %48, align 1, !dbg !2492
  %50 = zext i8 %49 to i64, !dbg !2493
  %51 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %50, !dbg !2493
  %52 = getelementptr inbounds nuw %struct.robot_info, ptr %51, i32 0, i32 5, !dbg !2494
  %53 = load i16, ptr %52, align 4, !dbg !2494
  %54 = sext i16 %53 to i32, !dbg !2493
  store i32 %54, ptr %3, align 4, !dbg !2495
  br label %74, !dbg !2495

55:                                               ; preds = %36, %33
  br label %56

56:                                               ; preds = %55
  br label %73, !dbg !2496

57:                                               ; preds = %2
  %58 = load ptr, ptr %4, align 8, !dbg !2497
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 1, !dbg !2499
  %60 = load i8, ptr %59, align 4, !dbg !2499
  %61 = zext i8 %60 to i32, !dbg !2497
  %62 = icmp eq i32 %61, 4, !dbg !2500
  br i1 %62, label %63, label %72, !dbg !2501

63:                                               ; preds = %57
  %64 = load ptr, ptr @Player_ship, align 8, !dbg !2502
  %65 = getelementptr inbounds nuw %struct.player_ship, ptr %64, i32 0, i32 1, !dbg !2503
  %66 = load i32, ptr %65, align 4, !dbg !2503
  %67 = icmp sgt i32 %66, -1, !dbg !2504
  br i1 %67, label %68, label %72, !dbg !2501

68:                                               ; preds = %63
  %69 = load ptr, ptr @Player_ship, align 8, !dbg !2505
  %70 = getelementptr inbounds nuw %struct.player_ship, ptr %69, i32 0, i32 1, !dbg !2506
  %71 = load i32, ptr %70, align 4, !dbg !2506
  store i32 %71, ptr %3, align 4, !dbg !2507
  br label %74, !dbg !2507

72:                                               ; preds = %63, %57
  br label %73

73:                                               ; preds = %72, %56
  store i32 2, ptr %3, align 4, !dbg !2508
  br label %74, !dbg !2508

74:                                               ; preds = %73, %68, %46, %24
  %75 = load i32, ptr %3, align 4, !dbg !2509
  ret i32 %75, !dbg !2509
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z21explode_badass_playerP6object(ptr noundef %0) #0 !dbg !2510 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2513, !DIExpression(), !2514)
  %3 = load ptr, ptr %2, align 8, !dbg !2515
  %4 = call noundef ptr @_Z21explode_badass_objectP6objectiii(ptr noundef %3, i32 noundef 3276800, i32 noundef 2621440, i32 noundef 9830400), !dbg !2516
  ret ptr %4, !dbg !2517
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z20object_create_debrisP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !2518 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2521, !DIExpression(), !2522)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2523, !DIExpression(), !2524)
    #dbg_declare(ptr %6, !2525, !DIExpression(), !2526)
    #dbg_declare(ptr %7, !2527, !DIExpression(), !2528)
    #dbg_declare(ptr %8, !2529, !DIExpression(), !2557)
  %9 = load ptr, ptr %4, align 8, !dbg !2558
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 1, !dbg !2558
  %11 = load i8, ptr %10, align 4, !dbg !2558
  %12 = zext i8 %11 to i32, !dbg !2558
  %13 = icmp eq i32 %12, 2, !dbg !2558
  br i1 %13, label %20, label %14, !dbg !2558

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8, !dbg !2558
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 1, !dbg !2558
  %17 = load i8, ptr %16, align 4, !dbg !2558
  %18 = zext i8 %17 to i32, !dbg !2558
  %19 = icmp eq i32 %18, 4, !dbg !2558
  br label %20, !dbg !2558

20:                                               ; preds = %14, %2
  %21 = phi i1 [ true, %2 ], [ %19, %14 ]
  %22 = zext i1 %21 to i32, !dbg !2558
  call void @_Z7_AssertiPKcS0_i(i32 noundef %22, ptr noundef @.str.5, ptr noundef @.str.4, i32 noundef 345), !dbg !2558
  %23 = load ptr, ptr %4, align 8, !dbg !2559
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 9, !dbg !2560
  %25 = load i16, ptr %24, align 2, !dbg !2560
  %26 = sext i16 %25 to i32, !dbg !2559
  %27 = load ptr, ptr %4, align 8, !dbg !2561
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 11, !dbg !2562
  %29 = load ptr, ptr %4, align 8, !dbg !2563
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 12, !dbg !2564
  %31 = load ptr, ptr %4, align 8, !dbg !2565
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 23, !dbg !2566
  %33 = getelementptr inbounds nuw %struct.polyobj_info, ptr %32, i32 0, i32 0, !dbg !2567
  %34 = load i32, ptr %33, align 4, !dbg !2567
  %35 = sext i32 %34 to i64, !dbg !2568
  %36 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %35, !dbg !2568
  %37 = getelementptr inbounds nuw %struct.polymodel, ptr %36, i32 0, i32 7, !dbg !2569
  %38 = load i32, ptr %5, align 4, !dbg !2570
  %39 = sext i32 %38 to i64, !dbg !2568
  %40 = getelementptr inbounds [10 x i32], ptr %37, i64 0, i64 %39, !dbg !2568
  %41 = load i32, ptr %40, align 4, !dbg !2568
  %42 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 8, i8 noundef zeroext 0, i32 noundef %26, ptr noundef %28, ptr noundef %30, i32 noundef %41, i8 noundef zeroext 12, i8 noundef zeroext 1, i8 noundef zeroext 1), !dbg !2571
  store i32 %42, ptr %6, align 4, !dbg !2572
  %43 = load i32, ptr %6, align 4, !dbg !2573
  %44 = icmp slt i32 %43, 0, !dbg !2575
  br i1 %44, label %45, label %49, !dbg !2576

45:                                               ; preds = %20
  %46 = load i32, ptr @Highest_object_index, align 4, !dbg !2577
  %47 = icmp sge i32 %46, 349, !dbg !2578
  br i1 %47, label %48, label %49, !dbg !2576

48:                                               ; preds = %45
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.6), !dbg !2579
  call void @_Z4Int3v(), !dbg !2581
  store ptr null, ptr %3, align 8, !dbg !2582
  br label %170, !dbg !2582

49:                                               ; preds = %45, %20
  %50 = load i32, ptr %6, align 4, !dbg !2583
  %51 = icmp slt i32 %50, 0, !dbg !2585
  br i1 %51, label %52, label %53, !dbg !2585

52:                                               ; preds = %49
  store ptr null, ptr %3, align 8, !dbg !2586
  br label %170, !dbg !2586

53:                                               ; preds = %49
  %54 = load i32, ptr %6, align 4, !dbg !2587
  %55 = sext i32 %54 to i64, !dbg !2588
  %56 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %55, !dbg !2588
  store ptr %56, ptr %7, align 8, !dbg !2589
  %57 = load i32, ptr %5, align 4, !dbg !2590
  %58 = icmp slt i32 %57, 32, !dbg !2590
  %59 = zext i1 %58 to i32, !dbg !2590
  call void @_Z7_AssertiPKcS0_i(i32 noundef %59, ptr noundef @.str.7, ptr noundef @.str.4, i32 noundef 360), !dbg !2590
  %60 = load ptr, ptr %4, align 8, !dbg !2591
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 23, !dbg !2592
  %62 = getelementptr inbounds nuw %struct.polyobj_info, ptr %61, i32 0, i32 0, !dbg !2593
  %63 = load i32, ptr %62, align 4, !dbg !2593
  %64 = load ptr, ptr %7, align 8, !dbg !2594
  %65 = getelementptr inbounds nuw %struct.object, ptr %64, i32 0, i32 23, !dbg !2595
  %66 = getelementptr inbounds nuw %struct.polyobj_info, ptr %65, i32 0, i32 0, !dbg !2596
  store i32 %63, ptr %66, align 4, !dbg !2597
  %67 = load i32, ptr %5, align 4, !dbg !2598
  %68 = shl i32 1, %67, !dbg !2599
  %69 = load ptr, ptr %7, align 8, !dbg !2600
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 23, !dbg !2601
  %71 = getelementptr inbounds nuw %struct.polyobj_info, ptr %70, i32 0, i32 2, !dbg !2602
  store i32 %68, ptr %71, align 4, !dbg !2603
  %72 = load ptr, ptr %4, align 8, !dbg !2604
  %73 = getelementptr inbounds nuw %struct.object, ptr %72, i32 0, i32 23, !dbg !2605
  %74 = getelementptr inbounds nuw %struct.polyobj_info, ptr %73, i32 0, i32 3, !dbg !2606
  %75 = load i32, ptr %74, align 4, !dbg !2606
  %76 = load ptr, ptr %7, align 8, !dbg !2607
  %77 = getelementptr inbounds nuw %struct.object, ptr %76, i32 0, i32 23, !dbg !2608
  %78 = getelementptr inbounds nuw %struct.polyobj_info, ptr %77, i32 0, i32 3, !dbg !2609
  store i32 %75, ptr %78, align 4, !dbg !2610
  %79 = load ptr, ptr %7, align 8, !dbg !2611
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 23, !dbg !2612
  %81 = getelementptr inbounds nuw %struct.polyobj_info, ptr %80, i32 0, i32 0, !dbg !2613
  %82 = load i32, ptr %81, align 4, !dbg !2613
  %83 = sext i32 %82 to i64, !dbg !2614
  %84 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %83, !dbg !2614
  store ptr %84, ptr %8, align 8, !dbg !2615
  %85 = call noundef i32 @_Z6P_Randv(), !dbg !2616
  %86 = sub nsw i32 16383, %85, !dbg !2617
  %87 = load ptr, ptr %7, align 8, !dbg !2618
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 21, !dbg !2619
  %89 = getelementptr inbounds nuw %struct.physics_info, ptr %88, i32 0, i32 0, !dbg !2620
  %90 = getelementptr inbounds nuw %struct.vms_vector, ptr %89, i32 0, i32 0, !dbg !2621
  store i32 %86, ptr %90, align 4, !dbg !2622
  %91 = call noundef i32 @_Z6P_Randv(), !dbg !2623
  %92 = sub nsw i32 16383, %91, !dbg !2624
  %93 = load ptr, ptr %7, align 8, !dbg !2625
  %94 = getelementptr inbounds nuw %struct.object, ptr %93, i32 0, i32 21, !dbg !2626
  %95 = getelementptr inbounds nuw %struct.physics_info, ptr %94, i32 0, i32 0, !dbg !2627
  %96 = getelementptr inbounds nuw %struct.vms_vector, ptr %95, i32 0, i32 1, !dbg !2628
  store i32 %92, ptr %96, align 4, !dbg !2629
  %97 = call noundef i32 @_Z6P_Randv(), !dbg !2630
  %98 = sub nsw i32 16383, %97, !dbg !2631
  %99 = load ptr, ptr %7, align 8, !dbg !2632
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 21, !dbg !2633
  %101 = getelementptr inbounds nuw %struct.physics_info, ptr %100, i32 0, i32 0, !dbg !2634
  %102 = getelementptr inbounds nuw %struct.vms_vector, ptr %101, i32 0, i32 2, !dbg !2635
  store i32 %98, ptr %102, align 4, !dbg !2636
  %103 = load ptr, ptr %7, align 8, !dbg !2637
  %104 = getelementptr inbounds nuw %struct.object, ptr %103, i32 0, i32 21, !dbg !2638
  %105 = getelementptr inbounds nuw %struct.physics_info, ptr %104, i32 0, i32 0, !dbg !2639
  %106 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %105), !dbg !2640
  %107 = load ptr, ptr %7, align 8, !dbg !2641
  %108 = getelementptr inbounds nuw %struct.object, ptr %107, i32 0, i32 21, !dbg !2642
  %109 = getelementptr inbounds nuw %struct.physics_info, ptr %108, i32 0, i32 0, !dbg !2643
  %110 = call noundef i32 @_Z6P_Randv(), !dbg !2644
  %111 = mul nsw i32 30, %110, !dbg !2645
  %112 = sdiv i32 %111, 32767, !dbg !2646
  %113 = add nsw i32 10, %112, !dbg !2647
  %114 = call noundef i32 @_Z3i2fi(i32 noundef %113), !dbg !2648
  %115 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %109, i32 noundef %114), !dbg !2649
  %116 = load ptr, ptr %7, align 8, !dbg !2650
  %117 = getelementptr inbounds nuw %struct.object, ptr %116, i32 0, i32 21, !dbg !2651
  %118 = getelementptr inbounds nuw %struct.physics_info, ptr %117, i32 0, i32 0, !dbg !2652
  %119 = load ptr, ptr %4, align 8, !dbg !2653
  %120 = getelementptr inbounds nuw %struct.object, ptr %119, i32 0, i32 21, !dbg !2654
  %121 = getelementptr inbounds nuw %struct.physics_info, ptr %120, i32 0, i32 0, !dbg !2655
  %122 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %118, ptr noundef %121), !dbg !2656
  %123 = load ptr, ptr %7, align 8, !dbg !2657
  %124 = getelementptr inbounds nuw %struct.object, ptr %123, i32 0, i32 21, !dbg !2658
  %125 = getelementptr inbounds nuw %struct.physics_info, ptr %124, i32 0, i32 5, !dbg !2659
  %126 = call noundef i32 @_Z6P_Randv(), !dbg !2660
  %127 = add nsw i32 %126, 4096, !dbg !2661
  %128 = call noundef i32 @_Z6P_Randv(), !dbg !2662
  %129 = mul nsw i32 %128, 2, !dbg !2663
  %130 = add nsw i32 %129, 16384, !dbg !2664
  %131 = call noundef i32 @_Z6P_Randv(), !dbg !2665
  %132 = mul nsw i32 %131, 3, !dbg !2666
  %133 = add nsw i32 %132, 8192, !dbg !2667
  %134 = call noundef ptr @_Z11vm_vec_makeP10vms_vectoriii(ptr noundef %125, i32 noundef %127, i32 noundef %130, i32 noundef %133), !dbg !2668
  %135 = load ptr, ptr %7, align 8, !dbg !2669
  %136 = getelementptr inbounds nuw %struct.object, ptr %135, i32 0, i32 21, !dbg !2669
  %137 = getelementptr inbounds nuw %struct.physics_info, ptr %136, i32 0, i32 6, !dbg !2669
  %138 = getelementptr inbounds nuw %struct.vms_vector, ptr %137, i32 0, i32 2, !dbg !2669
  store i32 0, ptr %138, align 4, !dbg !2669
  %139 = load ptr, ptr %7, align 8, !dbg !2669
  %140 = getelementptr inbounds nuw %struct.object, ptr %139, i32 0, i32 21, !dbg !2669
  %141 = getelementptr inbounds nuw %struct.physics_info, ptr %140, i32 0, i32 6, !dbg !2669
  %142 = getelementptr inbounds nuw %struct.vms_vector, ptr %141, i32 0, i32 1, !dbg !2669
  store i32 0, ptr %142, align 4, !dbg !2669
  %143 = load ptr, ptr %7, align 8, !dbg !2669
  %144 = getelementptr inbounds nuw %struct.object, ptr %143, i32 0, i32 21, !dbg !2669
  %145 = getelementptr inbounds nuw %struct.physics_info, ptr %144, i32 0, i32 6, !dbg !2669
  %146 = getelementptr inbounds nuw %struct.vms_vector, ptr %145, i32 0, i32 0, !dbg !2669
  store i32 0, ptr %146, align 4, !dbg !2669
  %147 = call noundef i32 @_Z6P_Randv(), !dbg !2670
  %148 = call noundef i32 @_Z6fixmulii(i32 noundef %147, i32 noundef 131072), !dbg !2671
  %149 = add nsw i32 98304, %148, !dbg !2672
  %150 = load ptr, ptr %7, align 8, !dbg !2673
  %151 = getelementptr inbounds nuw %struct.object, ptr %150, i32 0, i32 20, !dbg !2674
  store i32 %149, ptr %151, align 4, !dbg !2675
  %152 = load ptr, ptr %4, align 8, !dbg !2676
  %153 = getelementptr inbounds nuw %struct.object, ptr %152, i32 0, i32 21, !dbg !2677
  %154 = getelementptr inbounds nuw %struct.physics_info, ptr %153, i32 0, i32 2, !dbg !2678
  %155 = load i32, ptr %154, align 4, !dbg !2678
  %156 = load ptr, ptr %7, align 8, !dbg !2679
  %157 = getelementptr inbounds nuw %struct.object, ptr %156, i32 0, i32 13, !dbg !2680
  %158 = load i32, ptr %157, align 4, !dbg !2680
  %159 = load ptr, ptr %4, align 8, !dbg !2681
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 13, !dbg !2682
  %161 = load i32, ptr %160, align 4, !dbg !2682
  %162 = call noundef i32 @_Z9fixmuldiviii(i32 noundef %155, i32 noundef %158, i32 noundef %161), !dbg !2683
  %163 = load ptr, ptr %7, align 8, !dbg !2684
  %164 = getelementptr inbounds nuw %struct.object, ptr %163, i32 0, i32 21, !dbg !2685
  %165 = getelementptr inbounds nuw %struct.physics_info, ptr %164, i32 0, i32 2, !dbg !2686
  store i32 %162, ptr %165, align 4, !dbg !2687
  %166 = load ptr, ptr %7, align 8, !dbg !2688
  %167 = getelementptr inbounds nuw %struct.object, ptr %166, i32 0, i32 21, !dbg !2689
  %168 = getelementptr inbounds nuw %struct.physics_info, ptr %167, i32 0, i32 3, !dbg !2690
  store i32 0, ptr %168, align 4, !dbg !2691
  %169 = load ptr, ptr %7, align 8, !dbg !2692
  store ptr %169, ptr %3, align 8, !dbg !2693
  br label %170, !dbg !2693

170:                                              ; preds = %53, %52, %48
  %171 = load ptr, ptr %3, align 8, !dbg !2694
  ret ptr %171, !dbg !2694
}

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z11vm_vec_makeP10vms_vectoriii(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13draw_fireballP6object(ptr noundef %0) #0 !dbg !2695 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2698, !DIExpression(), !2699)
  %3 = load ptr, ptr %2, align 8, !dbg !2700
  %4 = getelementptr inbounds nuw %struct.object, ptr %3, i32 0, i32 20, !dbg !2702
  %5 = load i32, ptr %4, align 4, !dbg !2702
  %6 = icmp sgt i32 %5, 0, !dbg !2703
  br i1 %6, label %7, label %16, !dbg !2703

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8, !dbg !2704
  %9 = load ptr, ptr %2, align 8, !dbg !2705
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 20, !dbg !2706
  %11 = load i32, ptr %10, align 4, !dbg !2706
  %12 = load ptr, ptr %2, align 8, !dbg !2707
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 2, !dbg !2708
  %14 = load i8, ptr %13, align 1, !dbg !2708
  %15 = zext i8 %14 to i32, !dbg !2707
  call void @_Z17draw_vclip_objectP6objectiii(ptr noundef %8, i32 noundef %11, i32 noundef 0, i32 noundef %15), !dbg !2709
  br label %16, !dbg !2709

16:                                               ; preds = %7, %1
  ret void, !dbg !2710
}

declare void @_Z17draw_vclip_objectP6objectiii(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z26door_is_openable_by_playerP7segmenti(ptr noundef %0, i32 noundef %1) #2 !dbg !2711 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2748, !DIExpression(), !2749)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2750, !DIExpression(), !2751)
    #dbg_declare(ptr %6, !2752, !DIExpression(), !2753)
    #dbg_declare(ptr %7, !2754, !DIExpression(), !2755)
  %8 = load ptr, ptr %4, align 8, !dbg !2756
  %9 = getelementptr inbounds nuw %struct.segment, ptr %8, i32 0, i32 0, !dbg !2757
  %10 = load i32, ptr %5, align 4, !dbg !2758
  %11 = sext i32 %10 to i64, !dbg !2756
  %12 = getelementptr inbounds [6 x %struct.side], ptr %9, i64 0, i64 %11, !dbg !2756
  %13 = getelementptr inbounds nuw %struct.side, ptr %12, i32 0, i32 2, !dbg !2759
  %14 = load i16, ptr %13, align 2, !dbg !2759
  %15 = sext i16 %14 to i32, !dbg !2756
  store i32 %15, ptr %6, align 4, !dbg !2760
  %16 = load i32, ptr %6, align 4, !dbg !2761
  %17 = sext i32 %16 to i64, !dbg !2762
  %18 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %17, !dbg !2762
  %19 = getelementptr inbounds nuw %struct.wall, ptr %18, i32 0, i32 4, !dbg !2763
  %20 = load i8, ptr %19, align 4, !dbg !2763
  %21 = zext i8 %20 to i32, !dbg !2762
  store i32 %21, ptr %7, align 4, !dbg !2764
  %22 = load i32, ptr %6, align 4, !dbg !2765
  %23 = icmp eq i32 %22, -1, !dbg !2767
  br i1 %23, label %24, label %25, !dbg !2767

24:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !2768
  br label %42, !dbg !2768

25:                                               ; preds = %2
  %26 = load i32, ptr %7, align 4, !dbg !2769
  %27 = icmp eq i32 %26, 2, !dbg !2771
  br i1 %27, label %28, label %37, !dbg !2772

28:                                               ; preds = %25
  %29 = load i32, ptr %6, align 4, !dbg !2773
  %30 = sext i32 %29 to i64, !dbg !2774
  %31 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %30, !dbg !2774
  %32 = getelementptr inbounds nuw %struct.wall, ptr %31, i32 0, i32 5, !dbg !2775
  %33 = load i8, ptr %32, align 1, !dbg !2775
  %34 = zext i8 %33 to i32, !dbg !2774
  %35 = and i32 %34, 8, !dbg !2776
  %36 = icmp ne i32 %35, 0, !dbg !2777
  br i1 %36, label %40, label %37, !dbg !2778

37:                                               ; preds = %28, %25
  %38 = load i32, ptr %7, align 4, !dbg !2779
  %39 = icmp eq i32 %38, 5, !dbg !2780
  br i1 %39, label %40, label %41, !dbg !2778

40:                                               ; preds = %37, %28
  store i32 0, ptr %3, align 4, !dbg !2781
  br label %42, !dbg !2781

41:                                               ; preds = %37
  store i32 1, ptr %3, align 4, !dbg !2782
  br label %42, !dbg !2782

42:                                               ; preds = %41, %40, %24
  %43 = load i32, ptr %3, align 4, !dbg !2783
  ret i32 %43, !dbg !2783
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22pick_connected_segmentP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !2784 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [128 x i32], align 4
  %12 = alloca [900 x i8], align 1
  %13 = alloca [900 x i8], align 1
  %14 = alloca [6 x i8], align 1
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2785, !DIExpression(), !2786)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2787, !DIExpression(), !2788)
    #dbg_declare(ptr %6, !2789, !DIExpression(), !2790)
    #dbg_declare(ptr %7, !2791, !DIExpression(), !2792)
    #dbg_declare(ptr %8, !2793, !DIExpression(), !2794)
    #dbg_declare(ptr %9, !2795, !DIExpression(), !2796)
    #dbg_declare(ptr %10, !2797, !DIExpression(), !2798)
    #dbg_declare(ptr %11, !2799, !DIExpression(), !2801)
    #dbg_declare(ptr %12, !2802, !DIExpression(), !2806)
    #dbg_declare(ptr %13, !2807, !DIExpression(), !2808)
    #dbg_declare(ptr %14, !2809, !DIExpression(), !2811)
  %25 = load ptr, ptr %4, align 8, !dbg !2812
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 9, !dbg !2813
  %27 = load i16, ptr %26, align 2, !dbg !2813
  %28 = sext i16 %27 to i32, !dbg !2812
  store i32 %28, ptr %8, align 4, !dbg !2814
  store i32 0, ptr %9, align 4, !dbg !2815
  store i32 0, ptr %10, align 4, !dbg !2816
  %29 = load i32, ptr %8, align 4, !dbg !2817
  %30 = load i32, ptr %9, align 4, !dbg !2818
  %31 = add nsw i32 %30, 1, !dbg !2818
  store i32 %31, ptr %9, align 4, !dbg !2818
  %32 = sext i32 %30 to i64, !dbg !2819
  %33 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %32, !dbg !2819
  store i32 %29, ptr %33, align 4, !dbg !2820
  %34 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 0, !dbg !2821
  %35 = load i32, ptr @Highest_segment_index, align 4, !dbg !2822
  %36 = add nsw i32 %35, 1, !dbg !2823
  %37 = sext i32 %36 to i64, !dbg !2822
  call void @llvm.memset.p0.i64(ptr align 1 %34, i8 0, i64 %37, i1 false), !dbg !2821
  %38 = getelementptr inbounds [900 x i8], ptr %13, i64 0, i64 0, !dbg !2824
  %39 = load i32, ptr @Highest_segment_index, align 4, !dbg !2825
  %40 = add nsw i32 %39, 1, !dbg !2826
  %41 = sext i32 %40 to i64, !dbg !2825
  call void @llvm.memset.p0.i64(ptr align 1 %38, i8 0, i64 %41, i1 false), !dbg !2824
  store i32 0, ptr %7, align 4, !dbg !2827
  store i32 0, ptr %6, align 4, !dbg !2828
  br label %42, !dbg !2830

42:                                               ; preds = %51, %2
  %43 = load i32, ptr %6, align 4, !dbg !2831
  %44 = icmp slt i32 %43, 6, !dbg !2833
  br i1 %44, label %45, label %54, !dbg !2834

45:                                               ; preds = %42
  %46 = load i32, ptr %6, align 4, !dbg !2835
  %47 = trunc i32 %46 to i8, !dbg !2835
  %48 = load i32, ptr %6, align 4, !dbg !2836
  %49 = sext i32 %48 to i64, !dbg !2837
  %50 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %49, !dbg !2837
  store i8 %47, ptr %50, align 1, !dbg !2838
  br label %51, !dbg !2837

51:                                               ; preds = %45
  %52 = load i32, ptr %6, align 4, !dbg !2839
  %53 = add nsw i32 %52, 1, !dbg !2839
  store i32 %53, ptr %6, align 4, !dbg !2839
  br label %42, !dbg !2840, !llvm.loop !2841

54:                                               ; preds = %42
  store i32 0, ptr %6, align 4, !dbg !2843
  br label %55, !dbg !2845

55:                                               ; preds = %79, %54
  %56 = load i32, ptr %6, align 4, !dbg !2846
  %57 = icmp slt i32 %56, 4, !dbg !2848
  br i1 %57, label %58, label %82, !dbg !2849

58:                                               ; preds = %55
    #dbg_declare(ptr %15, !2850, !DIExpression(), !2852)
    #dbg_declare(ptr %16, !2853, !DIExpression(), !2854)
  %59 = call noundef i32 @_Z6P_Randv(), !dbg !2855
  %60 = mul nsw i32 %59, 6, !dbg !2856
  %61 = ashr i32 %60, 15, !dbg !2857
  store i32 %61, ptr %15, align 4, !dbg !2858
  %62 = load i32, ptr %15, align 4, !dbg !2859
  %63 = sext i32 %62 to i64, !dbg !2860
  %64 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %63, !dbg !2860
  %65 = load i8, ptr %64, align 1, !dbg !2860
  %66 = sext i8 %65 to i32, !dbg !2860
  store i32 %66, ptr %16, align 4, !dbg !2861
  %67 = load i32, ptr %6, align 4, !dbg !2862
  %68 = sext i32 %67 to i64, !dbg !2863
  %69 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %68, !dbg !2863
  %70 = load i8, ptr %69, align 1, !dbg !2863
  %71 = load i32, ptr %15, align 4, !dbg !2864
  %72 = sext i32 %71 to i64, !dbg !2865
  %73 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %72, !dbg !2865
  store i8 %70, ptr %73, align 1, !dbg !2866
  %74 = load i32, ptr %16, align 4, !dbg !2867
  %75 = trunc i32 %74 to i8, !dbg !2867
  %76 = load i32, ptr %6, align 4, !dbg !2868
  %77 = sext i32 %76 to i64, !dbg !2869
  %78 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %77, !dbg !2869
  store i8 %75, ptr %78, align 1, !dbg !2870
  br label %79, !dbg !2871

79:                                               ; preds = %58
  %80 = load i32, ptr %6, align 4, !dbg !2872
  %81 = add nsw i32 %80, 1, !dbg !2872
  store i32 %81, ptr %6, align 4, !dbg !2872
  br label %55, !dbg !2873, !llvm.loop !2874

82:                                               ; preds = %55
  br label %83, !dbg !2876

83:                                               ; preds = %254, %82
  %84 = load i32, ptr %10, align 4, !dbg !2877
  %85 = load i32, ptr %9, align 4, !dbg !2878
  %86 = icmp ne i32 %84, %85, !dbg !2879
  br i1 %86, label %87, label %263, !dbg !2876

87:                                               ; preds = %83
    #dbg_declare(ptr %17, !2880, !DIExpression(), !2882)
    #dbg_declare(ptr %18, !2883, !DIExpression(), !2884)
    #dbg_declare(ptr %19, !2885, !DIExpression(), !2886)
    #dbg_declare(ptr %20, !2887, !DIExpression(), !2888)
    #dbg_declare(ptr %21, !2889, !DIExpression(), !2890)
    #dbg_declare(ptr %22, !2891, !DIExpression(), !2892)
  %88 = load i32, ptr %7, align 4, !dbg !2893
  %89 = load i32, ptr %5, align 4, !dbg !2895
  %90 = icmp sge i32 %88, %89, !dbg !2896
  br i1 %90, label %91, label %96, !dbg !2896

91:                                               ; preds = %87
  %92 = load i32, ptr %10, align 4, !dbg !2897
  %93 = sext i32 %92 to i64, !dbg !2899
  %94 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %93, !dbg !2899
  %95 = load i32, ptr %94, align 4, !dbg !2899
  store i32 %95, ptr %3, align 4, !dbg !2900
  br label %265, !dbg !2900

96:                                               ; preds = %87
  %97 = load i32, ptr %10, align 4, !dbg !2901
  %98 = add nsw i32 %97, 1, !dbg !2901
  store i32 %98, ptr %10, align 4, !dbg !2901
  %99 = sext i32 %97 to i64, !dbg !2902
  %100 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %99, !dbg !2902
  %101 = load i32, ptr %100, align 4, !dbg !2902
  %102 = sext i32 %101 to i64, !dbg !2903
  %103 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %102, !dbg !2903
  store ptr %103, ptr %19, align 8, !dbg !2904
  %104 = load i32, ptr %10, align 4, !dbg !2905
  %105 = and i32 %104, 63, !dbg !2905
  store i32 %105, ptr %10, align 4, !dbg !2905
  %106 = call noundef i32 @_Z6P_Randv(), !dbg !2906
  %107 = mul nsw i32 %106, 6, !dbg !2907
  %108 = ashr i32 %107, 15, !dbg !2908
  store i32 %108, ptr %20, align 4, !dbg !2909
  %109 = call noundef i32 @_Z6P_Randv(), !dbg !2910
  %110 = mul nsw i32 %109, 6, !dbg !2911
  %111 = ashr i32 %110, 15, !dbg !2912
  store i32 %111, ptr %21, align 4, !dbg !2913
  %112 = load i32, ptr %20, align 4, !dbg !2914
  %113 = sext i32 %112 to i64, !dbg !2915
  %114 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %113, !dbg !2915
  %115 = load i8, ptr %114, align 1, !dbg !2915
  %116 = sext i8 %115 to i32, !dbg !2915
  store i32 %116, ptr %22, align 4, !dbg !2916
  %117 = load i32, ptr %21, align 4, !dbg !2917
  %118 = sext i32 %117 to i64, !dbg !2918
  %119 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %118, !dbg !2918
  %120 = load i8, ptr %119, align 1, !dbg !2918
  %121 = load i32, ptr %20, align 4, !dbg !2919
  %122 = sext i32 %121 to i64, !dbg !2920
  %123 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %122, !dbg !2920
  store i8 %120, ptr %123, align 1, !dbg !2921
  %124 = load i32, ptr %22, align 4, !dbg !2922
  %125 = trunc i32 %124 to i8, !dbg !2922
  %126 = load i32, ptr %21, align 4, !dbg !2923
  %127 = sext i32 %126 to i64, !dbg !2924
  %128 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %127, !dbg !2924
  store i8 %125, ptr %128, align 1, !dbg !2925
  store i32 0, ptr %18, align 4, !dbg !2926
  %129 = load i32, ptr %20, align 4, !dbg !2927
  store i32 %129, ptr %17, align 4, !dbg !2929
  br label %130, !dbg !2930

130:                                              ; preds = %237, %96
  %131 = load i32, ptr %18, align 4, !dbg !2931
  %132 = icmp slt i32 %131, 6, !dbg !2933
  br i1 %132, label %133, label %240, !dbg !2934

133:                                              ; preds = %130
    #dbg_declare(ptr %23, !2935, !DIExpression(), !2937)
    #dbg_declare(ptr %24, !2938, !DIExpression(), !2939)
  %134 = load i32, ptr %17, align 4, !dbg !2940
  %135 = icmp eq i32 %134, 6, !dbg !2942
  br i1 %135, label %136, label %137, !dbg !2942

136:                                              ; preds = %133
  store i32 0, ptr %17, align 4, !dbg !2943
  br label %137, !dbg !2944

137:                                              ; preds = %136, %133
  %138 = load i32, ptr %17, align 4, !dbg !2945
  %139 = sext i32 %138 to i64, !dbg !2946
  %140 = getelementptr inbounds [6 x i8], ptr %14, i64 0, i64 %139, !dbg !2946
  %141 = load i8, ptr %140, align 1, !dbg !2946
  %142 = sext i8 %141 to i32, !dbg !2946
  store i32 %142, ptr %23, align 4, !dbg !2947
  %143 = load ptr, ptr %19, align 8, !dbg !2948
  %144 = getelementptr inbounds nuw %struct.segment, ptr %143, i32 0, i32 0, !dbg !2949
  %145 = load i32, ptr %23, align 4, !dbg !2950
  %146 = sext i32 %145 to i64, !dbg !2948
  %147 = getelementptr inbounds [6 x %struct.side], ptr %144, i64 0, i64 %146, !dbg !2948
  %148 = getelementptr inbounds nuw %struct.side, ptr %147, i32 0, i32 2, !dbg !2951
  %149 = load i16, ptr %148, align 2, !dbg !2951
  %150 = sext i16 %149 to i32, !dbg !2948
  store i32 %150, ptr %24, align 4, !dbg !2952
  %151 = load i32, ptr %17, align 4, !dbg !2953
  %152 = add nsw i32 %151, 1, !dbg !2953
  store i32 %152, ptr %17, align 4, !dbg !2953
  %153 = load i32, ptr %24, align 4, !dbg !2954
  %154 = icmp eq i32 %153, -1, !dbg !2956
  br i1 %154, label %155, label %164, !dbg !2957

155:                                              ; preds = %137
  %156 = load ptr, ptr %19, align 8, !dbg !2958
  %157 = getelementptr inbounds nuw %struct.segment, ptr %156, i32 0, i32 1, !dbg !2959
  %158 = load i32, ptr %23, align 4, !dbg !2960
  %159 = sext i32 %158 to i64, !dbg !2958
  %160 = getelementptr inbounds [6 x i16], ptr %157, i64 0, i64 %159, !dbg !2958
  %161 = load i16, ptr %160, align 2, !dbg !2958
  %162 = sext i16 %161 to i32, !dbg !2958
  %163 = icmp sgt i32 %162, -1, !dbg !2961
  br i1 %163, label %169, label %164, !dbg !2962

164:                                              ; preds = %155, %137
  %165 = load ptr, ptr %19, align 8, !dbg !2963
  %166 = load i32, ptr %23, align 4, !dbg !2964
  %167 = call noundef i32 @_Z26door_is_openable_by_playerP7segmenti(ptr noundef %165, i32 noundef %166), !dbg !2965
  %168 = icmp ne i32 %167, 0, !dbg !2965
  br i1 %168, label %169, label %236, !dbg !2962

169:                                              ; preds = %164, %155
  %170 = load ptr, ptr %19, align 8, !dbg !2966
  %171 = getelementptr inbounds nuw %struct.segment, ptr %170, i32 0, i32 1, !dbg !2969
  %172 = load i32, ptr %23, align 4, !dbg !2970
  %173 = sext i32 %172 to i64, !dbg !2966
  %174 = getelementptr inbounds [6 x i16], ptr %171, i64 0, i64 %173, !dbg !2966
  %175 = load i16, ptr %174, align 2, !dbg !2966
  %176 = sext i16 %175 to i64, !dbg !2971
  %177 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 %176, !dbg !2971
  %178 = load i8, ptr %177, align 1, !dbg !2971
  %179 = sext i8 %178 to i32, !dbg !2971
  %180 = icmp eq i32 %179, 0, !dbg !2972
  br i1 %180, label %181, label %235, !dbg !2972

181:                                              ; preds = %169
  %182 = load ptr, ptr %19, align 8, !dbg !2973
  %183 = getelementptr inbounds nuw %struct.segment, ptr %182, i32 0, i32 1, !dbg !2975
  %184 = load i32, ptr %23, align 4, !dbg !2976
  %185 = sext i32 %184 to i64, !dbg !2973
  %186 = getelementptr inbounds [6 x i16], ptr %183, i64 0, i64 %185, !dbg !2973
  %187 = load i16, ptr %186, align 2, !dbg !2973
  %188 = sext i16 %187 to i32, !dbg !2973
  %189 = load i32, ptr %9, align 4, !dbg !2977
  %190 = add nsw i32 %189, 1, !dbg !2977
  store i32 %190, ptr %9, align 4, !dbg !2977
  %191 = sext i32 %189 to i64, !dbg !2978
  %192 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %191, !dbg !2978
  store i32 %188, ptr %192, align 4, !dbg !2979
  %193 = load ptr, ptr %19, align 8, !dbg !2980
  %194 = getelementptr inbounds nuw %struct.segment, ptr %193, i32 0, i32 1, !dbg !2981
  %195 = load i32, ptr %23, align 4, !dbg !2982
  %196 = sext i32 %195 to i64, !dbg !2980
  %197 = getelementptr inbounds [6 x i16], ptr %194, i64 0, i64 %196, !dbg !2980
  %198 = load i16, ptr %197, align 2, !dbg !2980
  %199 = sext i16 %198 to i64, !dbg !2983
  %200 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 %199, !dbg !2983
  store i8 1, ptr %200, align 1, !dbg !2984
  %201 = load i32, ptr %7, align 4, !dbg !2985
  %202 = add nsw i32 %201, 1, !dbg !2986
  %203 = trunc i32 %202 to i8, !dbg !2985
  %204 = load ptr, ptr %19, align 8, !dbg !2987
  %205 = getelementptr inbounds nuw %struct.segment, ptr %204, i32 0, i32 1, !dbg !2988
  %206 = load i32, ptr %23, align 4, !dbg !2989
  %207 = sext i32 %206 to i64, !dbg !2987
  %208 = getelementptr inbounds [6 x i16], ptr %205, i64 0, i64 %207, !dbg !2987
  %209 = load i16, ptr %208, align 2, !dbg !2987
  %210 = sext i16 %209 to i64, !dbg !2990
  %211 = getelementptr inbounds [900 x i8], ptr %13, i64 0, i64 %210, !dbg !2990
  store i8 %203, ptr %211, align 1, !dbg !2991
  %212 = load i32, ptr %9, align 4, !dbg !2992
  %213 = and i32 %212, 63, !dbg !2992
  store i32 %213, ptr %9, align 4, !dbg !2992
  %214 = load i32, ptr %9, align 4, !dbg !2993
  %215 = load i32, ptr %10, align 4, !dbg !2995
  %216 = icmp sgt i32 %214, %215, !dbg !2996
  br i1 %216, label %217, label %225, !dbg !2996

217:                                              ; preds = %181
  %218 = load i32, ptr %9, align 4, !dbg !2997
  %219 = load i32, ptr %10, align 4, !dbg !3000
  %220 = add nsw i32 %219, 64, !dbg !3001
  %221 = sub nsw i32 %220, 1, !dbg !3002
  %222 = icmp eq i32 %218, %221, !dbg !3003
  br i1 %222, label %223, label %224, !dbg !3003

223:                                              ; preds = %217
  call void @_Z4Int3v(), !dbg !3004
  br label %224, !dbg !3004

224:                                              ; preds = %223, %217
  br label %234, !dbg !3005

225:                                              ; preds = %181
  %226 = load i32, ptr %9, align 4, !dbg !3006
  %227 = add nsw i32 %226, 64, !dbg !3008
  %228 = load i32, ptr %10, align 4, !dbg !3009
  %229 = add nsw i32 %228, 64, !dbg !3010
  %230 = sub nsw i32 %229, 1, !dbg !3011
  %231 = icmp eq i32 %227, %230, !dbg !3012
  br i1 %231, label %232, label %233, !dbg !3012

232:                                              ; preds = %225
  call void @_Z4Int3v(), !dbg !3013
  br label %233, !dbg !3013

233:                                              ; preds = %232, %225
  br label %234

234:                                              ; preds = %233, %224
  br label %235, !dbg !3014

235:                                              ; preds = %234, %169
  br label %236, !dbg !3015

236:                                              ; preds = %235, %164
  br label %237, !dbg !3016

237:                                              ; preds = %236
  %238 = load i32, ptr %18, align 4, !dbg !3017
  %239 = add nsw i32 %238, 1, !dbg !3017
  store i32 %239, ptr %18, align 4, !dbg !3017
  br label %130, !dbg !3018, !llvm.loop !3019

240:                                              ; preds = %130
  %241 = load i32, ptr %10, align 4, !dbg !3021
  %242 = sext i32 %241 to i64, !dbg !3023
  %243 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %242, !dbg !3023
  %244 = load i32, ptr %243, align 4, !dbg !3023
  %245 = icmp slt i32 %244, 0, !dbg !3024
  br i1 %245, label %253, label %246, !dbg !3025

246:                                              ; preds = %240
  %247 = load i32, ptr %10, align 4, !dbg !3026
  %248 = sext i32 %247 to i64, !dbg !3027
  %249 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %248, !dbg !3027
  %250 = load i32, ptr %249, align 4, !dbg !3027
  %251 = load i32, ptr @Highest_segment_index, align 4, !dbg !3028
  %252 = icmp sgt i32 %250, %251, !dbg !3029
  br i1 %252, label %253, label %254, !dbg !3025

253:                                              ; preds = %246, %240
  store i32 -1, ptr %3, align 4, !dbg !3030
  br label %265, !dbg !3030

254:                                              ; preds = %246
  %255 = load i32, ptr %10, align 4, !dbg !3032
  %256 = sext i32 %255 to i64, !dbg !3033
  %257 = getelementptr inbounds [128 x i32], ptr %11, i64 0, i64 %256, !dbg !3033
  %258 = load i32, ptr %257, align 4, !dbg !3033
  %259 = sext i32 %258 to i64, !dbg !3034
  %260 = getelementptr inbounds [900 x i8], ptr %13, i64 0, i64 %259, !dbg !3034
  %261 = load i8, ptr %260, align 1, !dbg !3034
  %262 = sext i8 %261 to i32, !dbg !3034
  store i32 %262, ptr %7, align 4, !dbg !3035
  br label %83, !dbg !2876, !llvm.loop !3036

263:                                              ; preds = %83
  %264 = load i32, ptr %7, align 4, !dbg !3038
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.8, i32 noundef %264), !dbg !3038
  store i32 -1, ptr %3, align 4, !dbg !3039
  br label %265, !dbg !3039

265:                                              ; preds = %263, %253, %91
  %266 = load i32, ptr %3, align 4, !dbg !3040
  ret i32 %266, !dbg !3040
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19choose_drop_segmentv() #0 !dbg !3041 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.vms_vector, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
    #dbg_declare(ptr %2, !3042, !DIExpression(), !3043)
  store i32 0, ptr %2, align 4, !dbg !3043
    #dbg_declare(ptr %3, !3044, !DIExpression(), !3045)
  store i32 -1, ptr %3, align 4, !dbg !3045
    #dbg_declare(ptr %4, !3046, !DIExpression(), !3047)
    #dbg_declare(ptr %5, !3048, !DIExpression(), !3049)
    #dbg_declare(ptr %6, !3050, !DIExpression(), !3051)
    #dbg_declare(ptr %7, !3052, !DIExpression(), !3053)
    #dbg_declare(ptr %8, !3054, !DIExpression(), !3055)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.9), !dbg !3056
  %11 = call noundef i32 @_Z23timer_get_fixed_secondsv(), !dbg !3057
  call void @_Z7P_SRandi(i32 noundef %11), !dbg !3058
  %12 = call noundef i32 @_Z6P_Randv(), !dbg !3059
  %13 = mul nsw i32 %12, 8, !dbg !3060
  %14 = mul nsw i32 %13, 2, !dbg !3061
  %15 = ashr i32 %14, 15, !dbg !3062
  %16 = add nsw i32 8, %15, !dbg !3063
  store i32 %16, ptr %4, align 4, !dbg !3064
  %17 = load i32, ptr @Player_num, align 4, !dbg !3065
  %18 = sext i32 %17 to i64, !dbg !3066
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !3066
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 4, !dbg !3067
  %21 = load i32, ptr %20, align 4, !dbg !3067
  %22 = sext i32 %21 to i64, !dbg !3068
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !3068
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 11, !dbg !3069
  store ptr %24, ptr %8, align 8, !dbg !3070
  %25 = load i32, ptr @Player_num, align 4, !dbg !3071
  %26 = sext i32 %25 to i64, !dbg !3072
  %27 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %26, !dbg !3072
  %28 = getelementptr inbounds nuw %struct.player, ptr %27, i32 0, i32 4, !dbg !3073
  %29 = load i32, ptr %28, align 4, !dbg !3073
  %30 = sext i32 %29 to i64, !dbg !3074
  %31 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %30, !dbg !3074
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 9, !dbg !3075
  %33 = load i16, ptr %32, align 2, !dbg !3075
  %34 = sext i16 %33 to i32, !dbg !3074
  store i32 %34, ptr %6, align 4, !dbg !3076
  br label %35, !dbg !3077

35:                                               ; preds = %97, %0
  %36 = load i32, ptr %3, align 4, !dbg !3078
  %37 = icmp eq i32 %36, -1, !dbg !3079
  br i1 %37, label %38, label %41, !dbg !3080

38:                                               ; preds = %35
  %39 = load i32, ptr %4, align 4, !dbg !3081
  %40 = icmp sgt i32 %39, 4, !dbg !3082
  br label %41

41:                                               ; preds = %38, %35
  %42 = phi i1 [ false, %35 ], [ %40, %38 ], !dbg !3083
  br i1 %42, label %43, label %158, !dbg !3077

43:                                               ; preds = %41
  %44 = call noundef i32 @_Z6P_Randv(), !dbg !3084
  %45 = load i32, ptr @N_players, align 4, !dbg !3086
  %46 = mul nsw i32 %44, %45, !dbg !3087
  %47 = ashr i32 %46, 15, !dbg !3088
  store i32 %47, ptr %2, align 4, !dbg !3089
  store i32 0, ptr %5, align 4, !dbg !3090
  br label %48, !dbg !3091

48:                                               ; preds = %68, %43
  %49 = load i32, ptr %5, align 4, !dbg !3092
  %50 = load i32, ptr @N_players, align 4, !dbg !3093
  %51 = icmp slt i32 %49, %50, !dbg !3094
  br i1 %51, label %52, label %66, !dbg !3095

52:                                               ; preds = %48
  %53 = load i32, ptr %2, align 4, !dbg !3096
  %54 = sext i32 %53 to i64, !dbg !3097
  %55 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %54, !dbg !3097
  %56 = getelementptr inbounds nuw %struct.player, ptr %55, i32 0, i32 3, !dbg !3098
  %57 = load i8, ptr %56, align 4, !dbg !3098
  %58 = sext i8 %57 to i32, !dbg !3097
  %59 = icmp eq i32 %58, 0, !dbg !3099
  br i1 %59, label %64, label %60, !dbg !3100

60:                                               ; preds = %52
  %61 = load i32, ptr %2, align 4, !dbg !3101
  %62 = load i32, ptr @Player_num, align 4, !dbg !3102
  %63 = icmp eq i32 %61, %62, !dbg !3103
  br label %64, !dbg !3100

64:                                               ; preds = %60, %52
  %65 = phi i1 [ true, %52 ], [ %63, %60 ]
  br label %66

66:                                               ; preds = %64, %48
  %67 = phi i1 [ false, %48 ], [ %65, %64 ], !dbg !3104
  br i1 %67, label %68, label %75, !dbg !3091

68:                                               ; preds = %66
  %69 = load i32, ptr %2, align 4, !dbg !3105
  %70 = add nsw i32 %69, 1, !dbg !3107
  %71 = load i32, ptr @N_players, align 4, !dbg !3108
  %72 = srem i32 %70, %71, !dbg !3109
  store i32 %72, ptr %2, align 4, !dbg !3110
  %73 = load i32, ptr %5, align 4, !dbg !3111
  %74 = add nsw i32 %73, 1, !dbg !3111
  store i32 %74, ptr %5, align 4, !dbg !3111
  br label %48, !dbg !3091, !llvm.loop !3112

75:                                               ; preds = %66
  %76 = load i32, ptr %5, align 4, !dbg !3114
  %77 = load i32, ptr @N_players, align 4, !dbg !3116
  %78 = icmp eq i32 %76, %77, !dbg !3117
  br i1 %78, label %79, label %81, !dbg !3117

79:                                               ; preds = %75
  %80 = load i32, ptr @Player_num, align 4, !dbg !3118
  store i32 %80, ptr %2, align 4, !dbg !3120
  br label %81, !dbg !3121

81:                                               ; preds = %79, %75
  %82 = load i32, ptr %2, align 4, !dbg !3122
  %83 = sext i32 %82 to i64, !dbg !3123
  %84 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %83, !dbg !3123
  %85 = getelementptr inbounds nuw %struct.player, ptr %84, i32 0, i32 4, !dbg !3124
  %86 = load i32, ptr %85, align 4, !dbg !3124
  %87 = sext i32 %86 to i64, !dbg !3125
  %88 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %87, !dbg !3125
  %89 = load i32, ptr %4, align 4, !dbg !3126
  %90 = call noundef i32 @_Z22pick_connected_segmentP6objecti(ptr noundef %88, i32 noundef %89), !dbg !3127
  store i32 %90, ptr %3, align 4, !dbg !3128
  %91 = load i32, ptr %3, align 4, !dbg !3129
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.10, i32 noundef %91), !dbg !3129
  %92 = load i32, ptr %3, align 4, !dbg !3130
  %93 = icmp eq i32 %92, -1, !dbg !3132
  br i1 %93, label %94, label %98, !dbg !3132

94:                                               ; preds = %81
  %95 = load i32, ptr %4, align 4, !dbg !3133
  %96 = add nsw i32 %95, -1, !dbg !3133
  store i32 %96, ptr %4, align 4, !dbg !3133
  br label %97, !dbg !3135

97:                                               ; preds = %94, %155
  br label %35, !dbg !3078, !llvm.loop !3136

98:                                               ; preds = %81
  %99 = load i32, ptr %3, align 4, !dbg !3138
  %100 = sext i32 %99 to i64, !dbg !3140
  %101 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %100, !dbg !3140
  %102 = getelementptr inbounds nuw %struct.segment2, ptr %101, i32 0, i32 0, !dbg !3141
  %103 = load i8, ptr %102, align 4, !dbg !3141
  %104 = zext i8 %103 to i32, !dbg !3140
  %105 = icmp eq i32 %104, 3, !dbg !3142
  br i1 %105, label %106, label %107, !dbg !3142

106:                                              ; preds = %98
  store i32 -1, ptr %3, align 4, !dbg !3143
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11), !dbg !3145
  br label %138, !dbg !3146

107:                                              ; preds = %98
    #dbg_declare(ptr %9, !3147, !DIExpression(), !3149)
  store i32 0, ptr %9, align 4, !dbg !3150
  br label %108, !dbg !3152

108:                                              ; preds = %133, %107
  %109 = load i32, ptr %9, align 4, !dbg !3153
  %110 = icmp slt i32 %109, 6, !dbg !3155
  br i1 %110, label %111, label %136, !dbg !3156

111:                                              ; preds = %108
    #dbg_declare(ptr %10, !3157, !DIExpression(), !3159)
  %112 = load i32, ptr %3, align 4, !dbg !3160
  %113 = sext i32 %112 to i64, !dbg !3161
  %114 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %113, !dbg !3161
  %115 = getelementptr inbounds nuw %struct.segment, ptr %114, i32 0, i32 1, !dbg !3162
  %116 = load i32, ptr %9, align 4, !dbg !3163
  %117 = sext i32 %116 to i64, !dbg !3161
  %118 = getelementptr inbounds [6 x i16], ptr %115, i64 0, i64 %117, !dbg !3161
  %119 = load i16, ptr %118, align 2, !dbg !3161
  %120 = sext i16 %119 to i32, !dbg !3161
  store i32 %120, ptr %10, align 4, !dbg !3159
  %121 = load i32, ptr %10, align 4, !dbg !3164
  %122 = icmp sgt i32 %121, -1, !dbg !3164
  br i1 %122, label %123, label %132, !dbg !3166

123:                                              ; preds = %111
  %124 = load i32, ptr %10, align 4, !dbg !3167
  %125 = sext i32 %124 to i64, !dbg !3168
  %126 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %125, !dbg !3168
  %127 = getelementptr inbounds nuw %struct.segment2, ptr %126, i32 0, i32 0, !dbg !3169
  %128 = load i8, ptr %127, align 4, !dbg !3169
  %129 = zext i8 %128 to i32, !dbg !3168
  %130 = icmp eq i32 %129, 3, !dbg !3170
  br i1 %130, label %131, label %132, !dbg !3166

131:                                              ; preds = %123
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12), !dbg !3171
  store i32 -1, ptr %3, align 4, !dbg !3173
  br label %137, !dbg !3174

132:                                              ; preds = %123, %111
  br label %133, !dbg !3175

133:                                              ; preds = %132
  %134 = load i32, ptr %9, align 4, !dbg !3176
  %135 = add nsw i32 %134, 1, !dbg !3176
  store i32 %135, ptr %9, align 4, !dbg !3176
  br label %108, !dbg !3177, !llvm.loop !3178

136:                                              ; preds = %108
  br label %137

137:                                              ; preds = %136, %131
  br label %138

138:                                              ; preds = %137, %106
  %139 = load i32, ptr %3, align 4, !dbg !3180
  %140 = icmp ne i32 %139, -1, !dbg !3182
  br i1 %140, label %141, label %155, !dbg !3182

141:                                              ; preds = %138
  %142 = load i32, ptr %3, align 4, !dbg !3183
  %143 = sext i32 %142 to i64, !dbg !3185
  %144 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %143, !dbg !3185
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %7, ptr noundef %144), !dbg !3186
  %145 = load ptr, ptr %8, align 8, !dbg !3187
  %146 = load i32, ptr %6, align 4, !dbg !3189
  %147 = load i32, ptr %3, align 4, !dbg !3190
  %148 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %145, i32 noundef %146, ptr noundef %7, i32 noundef %147, i32 noundef -1, i32 noundef 1), !dbg !3191
  %149 = call noundef i32 @_Z3i2fi(i32 noundef 20), !dbg !3192
  %150 = load i32, ptr %4, align 4, !dbg !3193
  %151 = mul nsw i32 %149, %150, !dbg !3194
  %152 = icmp slt i32 %148, %151, !dbg !3195
  br i1 %152, label %153, label %154, !dbg !3195

153:                                              ; preds = %141
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13), !dbg !3196
  store i32 -1, ptr %3, align 4, !dbg !3198
  br label %154, !dbg !3199

154:                                              ; preds = %153, %141
  br label %155, !dbg !3200

155:                                              ; preds = %154, %138
  %156 = load i32, ptr %4, align 4, !dbg !3201
  %157 = add nsw i32 %156, -1, !dbg !3201
  store i32 %157, ptr %4, align 4, !dbg !3201
  br label %97, !dbg !3077

158:                                              ; preds = %41
  %159 = load i32, ptr %3, align 4, !dbg !3202
  %160 = icmp ne i32 %159, -1, !dbg !3204
  br i1 %160, label %161, label %166, !dbg !3204

161:                                              ; preds = %158
  %162 = load ptr, ptr %8, align 8, !dbg !3205
  %163 = load i32, ptr %6, align 4, !dbg !3205
  %164 = load i32, ptr %3, align 4, !dbg !3205
  %165 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %162, i32 noundef %163, ptr noundef %7, i32 noundef %164, i32 noundef -1, i32 noundef 1), !dbg !3205
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.14, i32 noundef %165), !dbg !3205
  br label %166, !dbg !3205

166:                                              ; preds = %161, %158
  %167 = load i32, ptr %3, align 4, !dbg !3206
  %168 = icmp eq i32 %167, -1, !dbg !3208
  br i1 %168, label %169, label %174, !dbg !3208

169:                                              ; preds = %166
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.15), !dbg !3209
  %170 = call noundef i32 @_Z6P_Randv(), !dbg !3211
  %171 = load i32, ptr @Highest_segment_index, align 4, !dbg !3212
  %172 = mul nsw i32 %170, %171, !dbg !3213
  %173 = ashr i32 %172, 15, !dbg !3214
  store i32 %173, ptr %1, align 4, !dbg !3215
  br label %176, !dbg !3215

174:                                              ; preds = %166
  %175 = load i32, ptr %3, align 4, !dbg !3216
  store i32 %175, ptr %1, align 4, !dbg !3217
  br label %176, !dbg !3217

176:                                              ; preds = %174, %169
  %177 = load i32, ptr %1, align 4, !dbg !3218
  ret i32 %177, !dbg !3218
}

declare void @_Z7P_SRandi(i32 noundef) #1

declare noundef i32 @_Z23timer_get_fixed_secondsv() #1

declare void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z23segment_contains_objectiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #2 !dbg !3219 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !3222, !DIExpression(), !3223)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !3224, !DIExpression(), !3225)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !3226, !DIExpression(), !3227)
    #dbg_declare(ptr %8, !3228, !DIExpression(), !3229)
  %9 = load i32, ptr %7, align 4, !dbg !3230
  %10 = icmp eq i32 %9, -1, !dbg !3232
  br i1 %10, label %11, label %12, !dbg !3232

11:                                               ; preds = %3
  store i32 0, ptr %4, align 4, !dbg !3233
  br label %49, !dbg !3233

12:                                               ; preds = %3
  %13 = load i32, ptr %7, align 4, !dbg !3234
  %14 = sext i32 %13 to i64, !dbg !3235
  %15 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %14, !dbg !3235
  %16 = getelementptr inbounds nuw %struct.segment, ptr %15, i32 0, i32 3, !dbg !3236
  %17 = load i32, ptr %16, align 4, !dbg !3236
  store i32 %17, ptr %8, align 4, !dbg !3237
  br label %18, !dbg !3238

18:                                               ; preds = %47, %12
  %19 = load i32, ptr %8, align 4, !dbg !3239
  %20 = icmp ne i32 %19, -1, !dbg !3240
  br i1 %20, label %21, label %48, !dbg !3238

21:                                               ; preds = %18
  %22 = load i32, ptr %8, align 4, !dbg !3241
  %23 = sext i32 %22 to i64, !dbg !3243
  %24 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %23, !dbg !3243
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 1, !dbg !3244
  %26 = load i8, ptr %25, align 4, !dbg !3244
  %27 = zext i8 %26 to i32, !dbg !3243
  %28 = load i32, ptr %5, align 4, !dbg !3245
  %29 = icmp eq i32 %27, %28, !dbg !3246
  br i1 %29, label %30, label %40, !dbg !3247

30:                                               ; preds = %21
  %31 = load i32, ptr %8, align 4, !dbg !3248
  %32 = sext i32 %31 to i64, !dbg !3249
  %33 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %32, !dbg !3249
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 2, !dbg !3250
  %35 = load i8, ptr %34, align 1, !dbg !3250
  %36 = zext i8 %35 to i32, !dbg !3249
  %37 = load i32, ptr %6, align 4, !dbg !3251
  %38 = icmp eq i32 %36, %37, !dbg !3252
  br i1 %38, label %39, label %40, !dbg !3247

39:                                               ; preds = %30
  store i32 1, ptr %4, align 4, !dbg !3253
  br label %49, !dbg !3253

40:                                               ; preds = %30, %21
  %41 = load i32, ptr %8, align 4, !dbg !3254
  %42 = sext i32 %41 to i64, !dbg !3255
  %43 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %42, !dbg !3255
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 3, !dbg !3256
  %45 = load i16, ptr %44, align 2, !dbg !3256
  %46 = sext i16 %45 to i32, !dbg !3255
  store i32 %46, ptr %8, align 4, !dbg !3257
  br label %47

47:                                               ; preds = %40
  br label %18, !dbg !3238, !llvm.loop !3258

48:                                               ; preds = %18
  store i32 0, ptr %4, align 4, !dbg !3260
  br label %49, !dbg !3260

49:                                               ; preds = %48, %39, %11
  %50 = load i32, ptr %4, align 4, !dbg !3261
  ret i32 %50, !dbg !3261
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17object_nearby_auxiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !3262 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
    #dbg_declare(ptr %6, !3265, !DIExpression(), !3266)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !3267, !DIExpression(), !3268)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !3269, !DIExpression(), !3270)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !3271, !DIExpression(), !3272)
    #dbg_declare(ptr %10, !3273, !DIExpression(), !3274)
  %12 = load i32, ptr %9, align 4, !dbg !3275
  %13 = icmp eq i32 %12, 0, !dbg !3277
  br i1 %13, label %14, label %15, !dbg !3277

14:                                               ; preds = %4
  store i32 0, ptr %5, align 4, !dbg !3278
  br label %53, !dbg !3278

15:                                               ; preds = %4
  %16 = load i32, ptr %7, align 4, !dbg !3279
  %17 = load i32, ptr %8, align 4, !dbg !3281
  %18 = load i32, ptr %6, align 4, !dbg !3282
  %19 = call noundef i32 @_Z23segment_contains_objectiii(i32 noundef %16, i32 noundef %17, i32 noundef %18), !dbg !3283
  %20 = icmp ne i32 %19, 0, !dbg !3283
  br i1 %20, label %21, label %22, !dbg !3283

21:                                               ; preds = %15
  store i32 1, ptr %5, align 4, !dbg !3284
  br label %53, !dbg !3284

22:                                               ; preds = %15
  store i32 0, ptr %10, align 4, !dbg !3285
  br label %23, !dbg !3287

23:                                               ; preds = %49, %22
  %24 = load i32, ptr %10, align 4, !dbg !3288
  %25 = icmp slt i32 %24, 6, !dbg !3290
  br i1 %25, label %26, label %52, !dbg !3291

26:                                               ; preds = %23
    #dbg_declare(ptr %11, !3292, !DIExpression(), !3294)
  %27 = load i32, ptr %6, align 4, !dbg !3295
  %28 = sext i32 %27 to i64, !dbg !3296
  %29 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %28, !dbg !3296
  %30 = getelementptr inbounds nuw %struct.segment, ptr %29, i32 0, i32 1, !dbg !3297
  %31 = load i32, ptr %10, align 4, !dbg !3298
  %32 = sext i32 %31 to i64, !dbg !3296
  %33 = getelementptr inbounds [6 x i16], ptr %30, i64 0, i64 %32, !dbg !3296
  %34 = load i16, ptr %33, align 2, !dbg !3296
  %35 = sext i16 %34 to i32, !dbg !3296
  store i32 %35, ptr %11, align 4, !dbg !3294
  %36 = load i32, ptr %11, align 4, !dbg !3299
  %37 = icmp ne i32 %36, -1, !dbg !3301
  br i1 %37, label %38, label %48, !dbg !3301

38:                                               ; preds = %26
  %39 = load i32, ptr %11, align 4, !dbg !3302
  %40 = load i32, ptr %7, align 4, !dbg !3304
  %41 = load i32, ptr %8, align 4, !dbg !3305
  %42 = load i32, ptr %9, align 4, !dbg !3306
  %43 = sub nsw i32 %42, 1, !dbg !3307
  %44 = call noundef i32 @_Z17object_nearby_auxiiii(i32 noundef %39, i32 noundef %40, i32 noundef %41, i32 noundef %43), !dbg !3308
  %45 = icmp ne i32 %44, 0, !dbg !3308
  br i1 %45, label %46, label %47, !dbg !3308

46:                                               ; preds = %38
  store i32 1, ptr %5, align 4, !dbg !3309
  br label %53, !dbg !3309

47:                                               ; preds = %38
  br label %48, !dbg !3310

48:                                               ; preds = %47, %26
  br label %49, !dbg !3311

49:                                               ; preds = %48
  %50 = load i32, ptr %10, align 4, !dbg !3312
  %51 = add nsw i32 %50, 1, !dbg !3312
  store i32 %51, ptr %10, align 4, !dbg !3312
  br label %23, !dbg !3313, !llvm.loop !3314

52:                                               ; preds = %23
  store i32 0, ptr %5, align 4, !dbg !3316
  br label %53, !dbg !3316

53:                                               ; preds = %52, %46, %21, %14
  %54 = load i32, ptr %5, align 4, !dbg !3317
  ret i32 %54, !dbg !3317
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z13weapon_nearbyP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !3318 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3319, !DIExpression(), !3320)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3321, !DIExpression(), !3322)
  %5 = load ptr, ptr %3, align 8, !dbg !3323
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 9, !dbg !3324
  %7 = load i16, ptr %6, align 2, !dbg !3324
  %8 = sext i16 %7 to i32, !dbg !3323
  %9 = load i32, ptr %4, align 4, !dbg !3325
  %10 = call noundef i32 @_Z17object_nearby_auxiiii(i32 noundef %8, i32 noundef 7, i32 noundef %9, i32 noundef 3), !dbg !3326
  ret i32 %10, !dbg !3327
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z33maybe_replace_powerup_with_energyP6object(ptr noundef %0) #0 !dbg !3328 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !3329, !DIExpression(), !3330)
    #dbg_declare(ptr %3, !3331, !DIExpression(), !3332)
  store i32 -1, ptr %3, align 4, !dbg !3332
  %4 = load ptr, ptr %2, align 8, !dbg !3333
  %5 = getelementptr inbounds nuw %struct.object, ptr %4, i32 0, i32 16, !dbg !3335
  %6 = load i8, ptr %5, align 4, !dbg !3335
  %7 = sext i8 %6 to i32, !dbg !3333
  %8 = icmp ne i32 %7, 7, !dbg !3336
  br i1 %8, label %9, label %10, !dbg !3336

9:                                                ; preds = %1
  br label %206, !dbg !3337

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8, !dbg !3338
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 17, !dbg !3340
  %13 = load i8, ptr %12, align 1, !dbg !3340
  %14 = sext i8 %13 to i32, !dbg !3338
  %15 = icmp eq i32 %14, 23, !dbg !3341
  br i1 %15, label %16, label %28, !dbg !3341

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 8, !dbg !3342
  %18 = load ptr, ptr %2, align 8, !dbg !3345
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 17, !dbg !3346
  %20 = load i8, ptr %19, align 1, !dbg !3346
  %21 = sext i8 %20 to i32, !dbg !3345
  %22 = call noundef i32 @_Z13weapon_nearbyP6objecti(ptr noundef %17, i32 noundef %21), !dbg !3347
  %23 = icmp ne i32 %22, 0, !dbg !3347
  br i1 %23, label %24, label %27, !dbg !3347

24:                                               ; preds = %16
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.16), !dbg !3348
  %25 = load ptr, ptr %2, align 8, !dbg !3350
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 18, !dbg !3351
  store i8 0, ptr %26, align 2, !dbg !3352
  br label %27, !dbg !3353

27:                                               ; preds = %24, %16
  br label %206, !dbg !3354

28:                                               ; preds = %10
  %29 = load ptr, ptr %2, align 8, !dbg !3355
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 17, !dbg !3356
  %31 = load i8, ptr %30, align 1, !dbg !3356
  %32 = sext i8 %31 to i32, !dbg !3355
  switch i32 %32, label %41 [
    i32 13, label %33
    i32 28, label %34
    i32 14, label %35
    i32 15, label %36
    i32 16, label %37
    i32 29, label %38
    i32 30, label %39
    i32 31, label %40
  ], !dbg !3357

33:                                               ; preds = %28
  store i32 1, ptr %3, align 4, !dbg !3358
  br label %41, !dbg !3360

34:                                               ; preds = %28
  store i32 6, ptr %3, align 4, !dbg !3361
  br label %41, !dbg !3362

35:                                               ; preds = %28
  store i32 2, ptr %3, align 4, !dbg !3363
  br label %41, !dbg !3364

36:                                               ; preds = %28
  store i32 3, ptr %3, align 4, !dbg !3365
  br label %41, !dbg !3366

37:                                               ; preds = %28
  store i32 4, ptr %3, align 4, !dbg !3367
  br label %41, !dbg !3368

38:                                               ; preds = %28
  store i32 7, ptr %3, align 4, !dbg !3369
  br label %41, !dbg !3370

39:                                               ; preds = %28
  store i32 8, ptr %3, align 4, !dbg !3371
  br label %41, !dbg !3372

40:                                               ; preds = %28
  store i32 9, ptr %3, align 4, !dbg !3373
  br label %41, !dbg !3374

41:                                               ; preds = %28, %40, %39, %38, %37, %36, %35, %34, %33
  %42 = load i32, ptr %3, align 4, !dbg !3375
  %43 = icmp eq i32 %42, 1, !dbg !3377
  br i1 %43, label %50, label %44, !dbg !3378

44:                                               ; preds = %41
  %45 = load ptr, ptr %2, align 8, !dbg !3379
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 17, !dbg !3380
  %47 = load i8, ptr %46, align 1, !dbg !3380
  %48 = sext i8 %47 to i32, !dbg !3379
  %49 = icmp eq i32 %48, 22, !dbg !3381
  br i1 %49, label %50, label %62, !dbg !3382

50:                                               ; preds = %44, %41
  %51 = load i32, ptr @Player_num, align 4, !dbg !3383
  %52 = sext i32 %51 to i64, !dbg !3384
  %53 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %52, !dbg !3384
  %54 = getelementptr inbounds nuw %struct.player, ptr %53, i32 0, i32 17, !dbg !3385
  %55 = getelementptr inbounds [10 x i16], ptr %54, i64 0, i64 1, !dbg !3384
  %56 = load i16, ptr %55, align 2, !dbg !3384
  %57 = zext i16 %56 to i32, !dbg !3384
  %58 = icmp sge i32 %57, 1568, !dbg !3386
  br i1 %58, label %59, label %62, !dbg !3382

59:                                               ; preds = %50
  %60 = load ptr, ptr %2, align 8, !dbg !3387
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 18, !dbg !3388
  store i8 0, ptr %61, align 2, !dbg !3389
  br label %168, !dbg !3387

62:                                               ; preds = %50, %44
  %63 = load i32, ptr %3, align 4, !dbg !3390
  %64 = icmp eq i32 %63, 6, !dbg !3392
  br i1 %64, label %71, label %65, !dbg !3393

65:                                               ; preds = %62
  %66 = load ptr, ptr %2, align 8, !dbg !3394
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 17, !dbg !3395
  %68 = load i8, ptr %67, align 1, !dbg !3395
  %69 = sext i8 %68 to i32, !dbg !3394
  %70 = icmp eq i32 %69, 22, !dbg !3396
  br i1 %70, label %71, label %83, !dbg !3397

71:                                               ; preds = %65, %62
  %72 = load i32, ptr @Player_num, align 4, !dbg !3398
  %73 = sext i32 %72 to i64, !dbg !3399
  %74 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %73, !dbg !3399
  %75 = getelementptr inbounds nuw %struct.player, ptr %74, i32 0, i32 17, !dbg !3400
  %76 = getelementptr inbounds [10 x i16], ptr %75, i64 0, i64 1, !dbg !3399
  %77 = load i16, ptr %76, align 2, !dbg !3399
  %78 = zext i16 %77 to i32, !dbg !3399
  %79 = icmp sge i32 %78, 1568, !dbg !3401
  br i1 %79, label %80, label %83, !dbg !3397

80:                                               ; preds = %71
  %81 = load ptr, ptr %2, align 8, !dbg !3402
  %82 = getelementptr inbounds nuw %struct.object, ptr %81, i32 0, i32 18, !dbg !3403
  store i8 0, ptr %82, align 2, !dbg !3404
  br label %167, !dbg !3402

83:                                               ; preds = %71, %65
  %84 = load i32, ptr %3, align 4, !dbg !3405
  %85 = icmp ne i32 %84, -1, !dbg !3407
  br i1 %85, label %86, label %128, !dbg !3407

86:                                               ; preds = %83
  %87 = load i32, ptr %3, align 4, !dbg !3408
  %88 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %87, i32 noundef 0), !dbg !3411
  %89 = and i32 %88, 1, !dbg !3412
  %90 = icmp ne i32 %89, 0, !dbg !3413
  br i1 %90, label %99, label %91, !dbg !3414

91:                                               ; preds = %86
  %92 = load ptr, ptr %2, align 8, !dbg !3415
  %93 = load ptr, ptr %2, align 8, !dbg !3416
  %94 = getelementptr inbounds nuw %struct.object, ptr %93, i32 0, i32 17, !dbg !3417
  %95 = load i8, ptr %94, align 1, !dbg !3417
  %96 = sext i8 %95 to i32, !dbg !3416
  %97 = call noundef i32 @_Z13weapon_nearbyP6objecti(ptr noundef %92, i32 noundef %96), !dbg !3418
  %98 = icmp ne i32 %97, 0, !dbg !3418
  br i1 %98, label %99, label %127, !dbg !3414

99:                                               ; preds = %91, %86
  %100 = call noundef i32 @_Z6P_Randv(), !dbg !3419
  %101 = icmp sgt i32 %100, 16384, !dbg !3422
  br i1 %101, label %102, label %121, !dbg !3422

102:                                              ; preds = %99
  %103 = load ptr, ptr %2, align 8, !dbg !3423
  %104 = getelementptr inbounds nuw %struct.object, ptr %103, i32 0, i32 16, !dbg !3425
  store i8 7, ptr %104, align 4, !dbg !3426
  %105 = load i32, ptr %3, align 4, !dbg !3427
  %106 = icmp eq i32 %105, 1, !dbg !3429
  br i1 %106, label %107, label %110, !dbg !3429

107:                                              ; preds = %102
  %108 = load ptr, ptr %2, align 8, !dbg !3430
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 17, !dbg !3432
  store i8 22, ptr %109, align 1, !dbg !3433
  br label %120, !dbg !3434

110:                                              ; preds = %102
  %111 = load i32, ptr %3, align 4, !dbg !3435
  %112 = icmp eq i32 %111, 6, !dbg !3437
  br i1 %112, label %113, label %116, !dbg !3437

113:                                              ; preds = %110
  %114 = load ptr, ptr %2, align 8, !dbg !3438
  %115 = getelementptr inbounds nuw %struct.object, ptr %114, i32 0, i32 17, !dbg !3440
  store i8 22, ptr %115, align 1, !dbg !3441
  br label %119, !dbg !3442

116:                                              ; preds = %110
  %117 = load ptr, ptr %2, align 8, !dbg !3443
  %118 = getelementptr inbounds nuw %struct.object, ptr %117, i32 0, i32 17, !dbg !3445
  store i8 1, ptr %118, align 1, !dbg !3446
  br label %119

119:                                              ; preds = %116, %113
  br label %120

120:                                              ; preds = %119, %107
  br label %126, !dbg !3447

121:                                              ; preds = %99
  %122 = load ptr, ptr %2, align 8, !dbg !3448
  %123 = getelementptr inbounds nuw %struct.object, ptr %122, i32 0, i32 16, !dbg !3450
  store i8 7, ptr %123, align 4, !dbg !3451
  %124 = load ptr, ptr %2, align 8, !dbg !3452
  %125 = getelementptr inbounds nuw %struct.object, ptr %124, i32 0, i32 17, !dbg !3453
  store i8 2, ptr %125, align 1, !dbg !3454
  br label %126

126:                                              ; preds = %121, %120
  br label %127, !dbg !3455

127:                                              ; preds = %126, %91
  br label %166, !dbg !3456

128:                                              ; preds = %83
  %129 = load ptr, ptr %2, align 8, !dbg !3457
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 17, !dbg !3459
  %131 = load i8, ptr %130, align 1, !dbg !3459
  %132 = sext i8 %131 to i32, !dbg !3457
  %133 = icmp eq i32 %132, 12, !dbg !3460
  br i1 %133, label %134, label %165, !dbg !3460

134:                                              ; preds = %128
  %135 = load i32, ptr @Player_num, align 4, !dbg !3461
  %136 = sext i32 %135 to i64, !dbg !3463
  %137 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %136, !dbg !3463
  %138 = getelementptr inbounds nuw %struct.player, ptr %137, i32 0, i32 7, !dbg !3464
  %139 = load i32, ptr %138, align 4, !dbg !3464
  %140 = and i32 %139, 1024, !dbg !3465
  %141 = icmp ne i32 %140, 0, !dbg !3466
  br i1 %141, label %150, label %142, !dbg !3467

142:                                              ; preds = %134
  %143 = load ptr, ptr %2, align 8, !dbg !3468
  %144 = load ptr, ptr %2, align 8, !dbg !3469
  %145 = getelementptr inbounds nuw %struct.object, ptr %144, i32 0, i32 17, !dbg !3470
  %146 = load i8, ptr %145, align 1, !dbg !3470
  %147 = sext i8 %146 to i32, !dbg !3469
  %148 = call noundef i32 @_Z13weapon_nearbyP6objecti(ptr noundef %143, i32 noundef %147), !dbg !3471
  %149 = icmp ne i32 %148, 0, !dbg !3471
  br i1 %149, label %150, label %164, !dbg !3467

150:                                              ; preds = %142, %134
  %151 = call noundef i32 @_Z6P_Randv(), !dbg !3472
  %152 = icmp sgt i32 %151, 16384, !dbg !3475
  br i1 %152, label %153, label %158, !dbg !3475

153:                                              ; preds = %150
  %154 = load ptr, ptr %2, align 8, !dbg !3476
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 16, !dbg !3478
  store i8 7, ptr %155, align 4, !dbg !3479
  %156 = load ptr, ptr %2, align 8, !dbg !3480
  %157 = getelementptr inbounds nuw %struct.object, ptr %156, i32 0, i32 17, !dbg !3481
  store i8 1, ptr %157, align 1, !dbg !3482
  br label %163, !dbg !3483

158:                                              ; preds = %150
  %159 = load ptr, ptr %2, align 8, !dbg !3484
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 16, !dbg !3486
  store i8 7, ptr %160, align 4, !dbg !3487
  %161 = load ptr, ptr %2, align 8, !dbg !3488
  %162 = getelementptr inbounds nuw %struct.object, ptr %161, i32 0, i32 17, !dbg !3489
  store i8 2, ptr %162, align 1, !dbg !3490
  br label %163

163:                                              ; preds = %158, %153
  br label %164, !dbg !3491

164:                                              ; preds = %163, %142
  br label %165, !dbg !3492

165:                                              ; preds = %164, %128
  br label %166

166:                                              ; preds = %165, %127
  br label %167

167:                                              ; preds = %166, %80
  br label %168

168:                                              ; preds = %167, %59
  %169 = load ptr, ptr %2, align 8, !dbg !3493
  %170 = getelementptr inbounds nuw %struct.object, ptr %169, i32 0, i32 19, !dbg !3495
  %171 = load i8, ptr %170, align 1, !dbg !3495
  %172 = sext i8 %171 to i32, !dbg !3493
  %173 = icmp eq i32 %172, -1, !dbg !3496
  br i1 %173, label %174, label %193, !dbg !3497

174:                                              ; preds = %168
  %175 = load ptr, ptr %2, align 8, !dbg !3498
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 17, !dbg !3499
  %177 = load i8, ptr %176, align 1, !dbg !3499
  %178 = sext i8 %177 to i32, !dbg !3498
  %179 = icmp eq i32 %178, 1, !dbg !3500
  br i1 %179, label %180, label %193, !dbg !3501

180:                                              ; preds = %174
  %181 = load ptr, ptr %2, align 8, !dbg !3502
  %182 = getelementptr inbounds nuw %struct.object, ptr %181, i32 0, i32 16, !dbg !3503
  %183 = load i8, ptr %182, align 4, !dbg !3503
  %184 = sext i8 %183 to i32, !dbg !3502
  %185 = icmp eq i32 %184, 7, !dbg !3504
  br i1 %185, label %186, label %193, !dbg !3501

186:                                              ; preds = %180
  %187 = load ptr, ptr %2, align 8, !dbg !3505
  %188 = ptrtoint ptr %187 to i64, !dbg !3505
  %189 = sub i64 %188, ptrtoint (ptr @Objects to i64), !dbg !3505
  %190 = sdiv exact i64 %189, 268, !dbg !3505
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.17, i64 noundef %190), !dbg !3505
  %191 = load ptr, ptr %2, align 8, !dbg !3507
  %192 = getelementptr inbounds nuw %struct.object, ptr %191, i32 0, i32 18, !dbg !3508
  store i8 0, ptr %192, align 2, !dbg !3509
  br label %193, !dbg !3510

193:                                              ; preds = %186, %180, %174, %168
  %194 = load i32, ptr @Game_mode, align 4, !dbg !3511
  %195 = and i32 %194, 38, !dbg !3513
  %196 = icmp ne i32 %195, 0, !dbg !3514
  br i1 %196, label %197, label %206, !dbg !3515

197:                                              ; preds = %193
  %198 = load ptr, ptr %2, align 8, !dbg !3516
  %199 = getelementptr inbounds nuw %struct.object, ptr %198, i32 0, i32 17, !dbg !3517
  %200 = load i8, ptr %199, align 1, !dbg !3517
  %201 = sext i8 %200 to i32, !dbg !3516
  %202 = icmp eq i32 %201, 0, !dbg !3518
  br i1 %202, label %203, label %206, !dbg !3515

203:                                              ; preds = %197
  %204 = load ptr, ptr %2, align 8, !dbg !3519
  %205 = getelementptr inbounds nuw %struct.object, ptr %204, i32 0, i32 17, !dbg !3521
  store i8 25, ptr %205, align 1, !dbg !3522
  br label %206, !dbg !3523

206:                                              ; preds = %9, %27, %203, %197, %193
  ret void, !dbg !3524
}

declare noundef i32 @_Z17player_has_weaponii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z12drop_powerupiiiP10vms_vectorS0_i(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 !dbg !3525 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca %struct.vms_vector, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
    #dbg_declare(ptr %8, !3528, !DIExpression(), !3529)
  store i32 %1, ptr %9, align 4
    #dbg_declare(ptr %9, !3530, !DIExpression(), !3531)
  store i32 %2, ptr %10, align 4
    #dbg_declare(ptr %10, !3532, !DIExpression(), !3533)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !3534, !DIExpression(), !3535)
  store ptr %4, ptr %12, align 8
    #dbg_declare(ptr %12, !3536, !DIExpression(), !3537)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !3538, !DIExpression(), !3539)
    #dbg_declare(ptr %14, !3540, !DIExpression(), !3541)
  store i32 -1, ptr %14, align 4, !dbg !3541
    #dbg_declare(ptr %15, !3542, !DIExpression(), !3543)
    #dbg_declare(ptr %16, !3544, !DIExpression(), !3545)
    #dbg_declare(ptr %17, !3546, !DIExpression(), !3547)
    #dbg_declare(ptr %18, !3548, !DIExpression(), !3549)
    #dbg_declare(ptr %19, !3550, !DIExpression(), !3551)
  %22 = load i32, ptr %8, align 4, !dbg !3552
  switch i32 %22, label %349 [
    i32 7, label %23
    i32 2, label %177
  ], !dbg !3553

23:                                               ; preds = %6
  store i32 0, ptr %19, align 4, !dbg !3554
  br label %24, !dbg !3557

24:                                               ; preds = %173, %23
  %25 = load i32, ptr %19, align 4, !dbg !3558
  %26 = load i32, ptr %10, align 4, !dbg !3560
  %27 = icmp slt i32 %25, %26, !dbg !3561
  br i1 %27, label %28, label %176, !dbg !3562

28:                                               ; preds = %24
    #dbg_declare(ptr %20, !3563, !DIExpression(), !3565)
  %29 = load ptr, ptr %11, align 8, !dbg !3566
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %29, i64 12, i1 false), !dbg !3567
  %30 = load ptr, ptr %11, align 8, !dbg !3568
  %31 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %30), !dbg !3569
  store i32 %31, ptr %18, align 4, !dbg !3570
  %32 = load i32, ptr @Game_mode, align 4, !dbg !3571
  %33 = and i32 %32, 38, !dbg !3573
  %34 = icmp ne i32 %33, 0, !dbg !3574
  br i1 %34, label %35, label %44, !dbg !3575

35:                                               ; preds = %28
  %36 = load i32, ptr @Game_mode, align 4, !dbg !3576
  %37 = and i32 %36, 8, !dbg !3577
  %38 = icmp ne i32 %37, 0, !dbg !3578
  br i1 %38, label %44, label %39, !dbg !3575

39:                                               ; preds = %35
  store i32 4, ptr %20, align 4, !dbg !3579
  %40 = load i32, ptr %9, align 4, !dbg !3581
  %41 = icmp eq i32 %40, 0, !dbg !3583
  br i1 %41, label %42, label %43, !dbg !3583

42:                                               ; preds = %39
  store i32 25, ptr %9, align 4, !dbg !3584
  br label %43, !dbg !3585

43:                                               ; preds = %42, %39
  br label %45, !dbg !3586

44:                                               ; preds = %35, %28
  store i32 2, ptr %20, align 4, !dbg !3587
  br label %45

45:                                               ; preds = %44, %43
  %46 = load i32, ptr %18, align 4, !dbg !3588
  %47 = add nsw i32 %46, 2097152, !dbg !3589
  %48 = call noundef i32 @_Z6P_Randv(), !dbg !3590
  %49 = load i32, ptr %20, align 4, !dbg !3591
  %50 = mul nsw i32 %48, %49, !dbg !3592
  %51 = load i32, ptr %20, align 4, !dbg !3593
  %52 = mul nsw i32 16384, %51, !dbg !3594
  %53 = sub nsw i32 %50, %52, !dbg !3595
  %54 = call noundef i32 @_Z6fixmulii(i32 noundef %47, i32 noundef %53), !dbg !3596
  %55 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 0, !dbg !3597
  %56 = load i32, ptr %55, align 4, !dbg !3598
  %57 = add nsw i32 %56, %54, !dbg !3598
  store i32 %57, ptr %55, align 4, !dbg !3598
  %58 = load i32, ptr %18, align 4, !dbg !3599
  %59 = add nsw i32 %58, 2097152, !dbg !3600
  %60 = call noundef i32 @_Z6P_Randv(), !dbg !3601
  %61 = load i32, ptr %20, align 4, !dbg !3602
  %62 = mul nsw i32 %60, %61, !dbg !3603
  %63 = load i32, ptr %20, align 4, !dbg !3604
  %64 = mul nsw i32 16384, %63, !dbg !3605
  %65 = sub nsw i32 %62, %64, !dbg !3606
  %66 = call noundef i32 @_Z6fixmulii(i32 noundef %59, i32 noundef %65), !dbg !3607
  %67 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 1, !dbg !3608
  %68 = load i32, ptr %67, align 4, !dbg !3609
  %69 = add nsw i32 %68, %66, !dbg !3609
  store i32 %69, ptr %67, align 4, !dbg !3609
  %70 = load i32, ptr %18, align 4, !dbg !3610
  %71 = add nsw i32 %70, 2097152, !dbg !3611
  %72 = call noundef i32 @_Z6P_Randv(), !dbg !3612
  %73 = load i32, ptr %20, align 4, !dbg !3613
  %74 = mul nsw i32 %72, %73, !dbg !3614
  %75 = load i32, ptr %20, align 4, !dbg !3615
  %76 = mul nsw i32 16384, %75, !dbg !3616
  %77 = sub nsw i32 %74, %76, !dbg !3617
  %78 = call noundef i32 @_Z6fixmulii(i32 noundef %71, i32 noundef %77), !dbg !3618
  %79 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 2, !dbg !3619
  %80 = load i32, ptr %79, align 4, !dbg !3620
  %81 = add nsw i32 %80, %78, !dbg !3620
  store i32 %81, ptr %79, align 4, !dbg !3620
  %82 = load i32, ptr @Game_mode, align 4, !dbg !3621
  %83 = and i32 %82, 38, !dbg !3623
  %84 = icmp ne i32 %83, 0, !dbg !3624
  br i1 %84, label %85, label %95, !dbg !3625

85:                                               ; preds = %45
  %86 = load i32, ptr %9, align 4, !dbg !3626
  %87 = icmp sge i32 %86, 4, !dbg !3627
  br i1 %87, label %88, label %95, !dbg !3628

88:                                               ; preds = %85
  %89 = load i32, ptr %9, align 4, !dbg !3629
  %90 = icmp sle i32 %89, 6, !dbg !3630
  br i1 %90, label %91, label %95, !dbg !3628

91:                                               ; preds = %88
  %92 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 2, !dbg !3631
  store i32 0, ptr %92, align 4, !dbg !3631
  %93 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 1, !dbg !3631
  store i32 0, ptr %93, align 4, !dbg !3631
  %94 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 0, !dbg !3631
  store i32 0, ptr %94, align 4, !dbg !3631
  br label %95, !dbg !3631

95:                                               ; preds = %91, %88, %85, %45
  %96 = load ptr, ptr %12, align 8, !dbg !3632
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %96, i64 12, i1 false), !dbg !3633
  %97 = load i32, ptr %8, align 4, !dbg !3634
  %98 = trunc i32 %97 to i8, !dbg !3634
  %99 = load i32, ptr %9, align 4, !dbg !3635
  %100 = trunc i32 %99 to i8, !dbg !3635
  %101 = load i32, ptr %13, align 4, !dbg !3636
  %102 = load i32, ptr %9, align 4, !dbg !3637
  %103 = sext i32 %102 to i64, !dbg !3638
  %104 = getelementptr inbounds [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %103, !dbg !3638
  %105 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %104, i32 0, i32 2, !dbg !3639
  %106 = load i32, ptr %105, align 4, !dbg !3639
  %107 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext %98, i8 noundef zeroext %100, i32 noundef %101, ptr noundef %17, ptr noundef @vmd_identity_matrix, i32 noundef %106, i8 noundef zeroext 13, i8 noundef zeroext 1, i8 noundef zeroext 5), !dbg !3640
  store i32 %107, ptr %14, align 4, !dbg !3641
  %108 = load i32, ptr %14, align 4, !dbg !3642
  %109 = icmp slt i32 %108, 0, !dbg !3644
  br i1 %109, label %110, label %112, !dbg !3644

110:                                              ; preds = %95
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.18), !dbg !3645
  call void @_Z4Int3v(), !dbg !3647
  %111 = load i32, ptr %14, align 4, !dbg !3648
  store i32 %111, ptr %7, align 4, !dbg !3649
  br label %353, !dbg !3649

112:                                              ; preds = %95
  %113 = load i32, ptr %14, align 4, !dbg !3650
  %114 = sext i32 %113 to i64, !dbg !3651
  %115 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %114, !dbg !3651
  store ptr %115, ptr %15, align 8, !dbg !3652
  %116 = load ptr, ptr %15, align 8, !dbg !3653
  %117 = getelementptr inbounds nuw %struct.object, ptr %116, i32 0, i32 21, !dbg !3654
  %118 = getelementptr inbounds nuw %struct.physics_info, ptr %117, i32 0, i32 0, !dbg !3655
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %118, ptr align 4 %16, i64 12, i1 false), !dbg !3656
  %119 = load ptr, ptr %15, align 8, !dbg !3657
  %120 = getelementptr inbounds nuw %struct.object, ptr %119, i32 0, i32 21, !dbg !3658
  %121 = getelementptr inbounds nuw %struct.physics_info, ptr %120, i32 0, i32 3, !dbg !3659
  store i32 512, ptr %121, align 4, !dbg !3660
  %122 = load ptr, ptr %15, align 8, !dbg !3661
  %123 = getelementptr inbounds nuw %struct.object, ptr %122, i32 0, i32 21, !dbg !3662
  %124 = getelementptr inbounds nuw %struct.physics_info, ptr %123, i32 0, i32 2, !dbg !3663
  store i32 65536, ptr %124, align 4, !dbg !3664
  %125 = load ptr, ptr %15, align 8, !dbg !3665
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 21, !dbg !3666
  %127 = getelementptr inbounds nuw %struct.physics_info, ptr %126, i32 0, i32 8, !dbg !3667
  store i16 4, ptr %127, align 2, !dbg !3668
  %128 = load ptr, ptr %15, align 8, !dbg !3669
  %129 = getelementptr inbounds nuw %struct.object, ptr %128, i32 0, i32 2, !dbg !3670
  %130 = load i8, ptr %129, align 1, !dbg !3670
  %131 = zext i8 %130 to i64, !dbg !3671
  %132 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %131, !dbg !3671
  %133 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %132, i32 0, i32 0, !dbg !3672
  %134 = load i32, ptr %133, align 4, !dbg !3672
  %135 = load ptr, ptr %15, align 8, !dbg !3673
  %136 = getelementptr inbounds nuw %struct.object, ptr %135, i32 0, i32 23, !dbg !3674
  %137 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %136, i32 0, i32 0, !dbg !3675
  store i32 %134, ptr %137, align 4, !dbg !3676
  %138 = load ptr, ptr %15, align 8, !dbg !3677
  %139 = getelementptr inbounds nuw %struct.object, ptr %138, i32 0, i32 23, !dbg !3678
  %140 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %139, i32 0, i32 0, !dbg !3679
  %141 = load i32, ptr %140, align 4, !dbg !3679
  %142 = sext i32 %141 to i64, !dbg !3680
  %143 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %142, !dbg !3680
  %144 = getelementptr inbounds nuw %struct.vclip, ptr %143, i32 0, i32 2, !dbg !3681
  %145 = load i32, ptr %144, align 4, !dbg !3681
  %146 = load ptr, ptr %15, align 8, !dbg !3682
  %147 = getelementptr inbounds nuw %struct.object, ptr %146, i32 0, i32 23, !dbg !3683
  %148 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %147, i32 0, i32 1, !dbg !3684
  store i32 %145, ptr %148, align 4, !dbg !3685
  %149 = load ptr, ptr %15, align 8, !dbg !3686
  %150 = getelementptr inbounds nuw %struct.object, ptr %149, i32 0, i32 23, !dbg !3687
  %151 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %150, i32 0, i32 2, !dbg !3688
  store i8 0, ptr %151, align 4, !dbg !3689
  %152 = load ptr, ptr %15, align 8, !dbg !3690
  %153 = getelementptr inbounds nuw %struct.object, ptr %152, i32 0, i32 2, !dbg !3691
  %154 = load i8, ptr %153, align 1, !dbg !3691
  %155 = zext i8 %154 to i32, !dbg !3690
  switch i32 %155, label %171 [
    i32 10, label %156
    i32 11, label %156
    i32 2, label %156
    i32 1, label %156
  ], !dbg !3692

156:                                              ; preds = %112, %112, %112, %112
  %157 = call noundef i32 @_Z6P_Randv(), !dbg !3693
  %158 = add nsw i32 %157, 196608, !dbg !3695
  %159 = mul nsw i32 %158, 64, !dbg !3696
  %160 = load ptr, ptr %15, align 8, !dbg !3697
  %161 = getelementptr inbounds nuw %struct.object, ptr %160, i32 0, i32 20, !dbg !3698
  store i32 %159, ptr %161, align 4, !dbg !3699
  %162 = load i32, ptr @Game_mode, align 4, !dbg !3700
  %163 = and i32 %162, 38, !dbg !3702
  %164 = icmp ne i32 %163, 0, !dbg !3700
  br i1 %164, label %165, label %170, !dbg !3700

165:                                              ; preds = %156
  %166 = load ptr, ptr %15, align 8, !dbg !3703
  %167 = getelementptr inbounds nuw %struct.object, ptr %166, i32 0, i32 20, !dbg !3704
  %168 = load i32, ptr %167, align 4, !dbg !3705
  %169 = sdiv i32 %168, 2, !dbg !3705
  store i32 %169, ptr %167, align 4, !dbg !3705
  br label %170, !dbg !3703

170:                                              ; preds = %165, %156
  br label %172, !dbg !3706

171:                                              ; preds = %112
  br label %172, !dbg !3707

172:                                              ; preds = %171, %170
  br label %173, !dbg !3708

173:                                              ; preds = %172
  %174 = load i32, ptr %19, align 4, !dbg !3709
  %175 = add nsw i32 %174, 1, !dbg !3709
  store i32 %175, ptr %19, align 4, !dbg !3709
  br label %24, !dbg !3710, !llvm.loop !3711

176:                                              ; preds = %24
  br label %351, !dbg !3713

177:                                              ; preds = %6
  store i32 0, ptr %19, align 4, !dbg !3714
  br label %178, !dbg !3716

178:                                              ; preds = %334, %177
  %179 = load i32, ptr %19, align 4, !dbg !3717
  %180 = load i32, ptr %10, align 4, !dbg !3719
  %181 = icmp slt i32 %179, %180, !dbg !3720
  br i1 %181, label %182, label %337, !dbg !3721

182:                                              ; preds = %178
    #dbg_declare(ptr %21, !3722, !DIExpression(), !3724)
  %183 = load ptr, ptr %11, align 8, !dbg !3725
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %183, i64 12, i1 false), !dbg !3726
  %184 = load ptr, ptr %11, align 8, !dbg !3727
  %185 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %184), !dbg !3728
  store i32 %185, ptr %18, align 4, !dbg !3729
  %186 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %16), !dbg !3730
  store i32 2, ptr %21, align 4, !dbg !3731
  %187 = call noundef i32 @_Z6P_Randv(), !dbg !3732
  %188 = sub nsw i32 %187, 16384, !dbg !3733
  %189 = mul nsw i32 %188, 2, !dbg !3734
  %190 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 0, !dbg !3735
  %191 = load i32, ptr %190, align 4, !dbg !3736
  %192 = add nsw i32 %191, %189, !dbg !3736
  store i32 %192, ptr %190, align 4, !dbg !3736
  %193 = call noundef i32 @_Z6P_Randv(), !dbg !3737
  %194 = sub nsw i32 %193, 16384, !dbg !3738
  %195 = mul nsw i32 %194, 2, !dbg !3739
  %196 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 1, !dbg !3740
  %197 = load i32, ptr %196, align 4, !dbg !3741
  %198 = add nsw i32 %197, %195, !dbg !3741
  store i32 %198, ptr %196, align 4, !dbg !3741
  %199 = call noundef i32 @_Z6P_Randv(), !dbg !3742
  %200 = sub nsw i32 %199, 16384, !dbg !3743
  %201 = mul nsw i32 %200, 2, !dbg !3744
  %202 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 2, !dbg !3745
  %203 = load i32, ptr %202, align 4, !dbg !3746
  %204 = add nsw i32 %203, %201, !dbg !3746
  store i32 %204, ptr %202, align 4, !dbg !3746
  %205 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %16), !dbg !3747
  %206 = load i32, ptr %18, align 4, !dbg !3748
  %207 = add nsw i32 2097152, %206, !dbg !3749
  %208 = load i32, ptr %21, align 4, !dbg !3750
  %209 = mul nsw i32 %207, %208, !dbg !3751
  %210 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %16, i32 noundef %209), !dbg !3752
  %211 = load ptr, ptr %12, align 8, !dbg !3753
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %211, i64 12, i1 false), !dbg !3754
  %212 = load i32, ptr %9, align 4, !dbg !3755
  %213 = trunc i32 %212 to i8, !dbg !3755
  %214 = load i32, ptr %13, align 4, !dbg !3756
  %215 = load i32, ptr %9, align 4, !dbg !3757
  %216 = sext i32 %215 to i64, !dbg !3758
  %217 = getelementptr inbounds [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %216, !dbg !3758
  %218 = getelementptr inbounds nuw %struct.robot_info, ptr %217, i32 0, i32 0, !dbg !3759
  %219 = load i32, ptr %218, align 4, !dbg !3759
  %220 = sext i32 %219 to i64, !dbg !3760
  %221 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %220, !dbg !3760
  %222 = getelementptr inbounds nuw %struct.polymodel, ptr %221, i32 0, i32 13, !dbg !3761
  %223 = load i32, ptr %222, align 4, !dbg !3761
  %224 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 2, i8 noundef zeroext %213, i32 noundef %214, ptr noundef %17, ptr noundef @vmd_identity_matrix, i32 noundef %223, i8 noundef zeroext 1, i8 noundef zeroext 1, i8 noundef zeroext 1), !dbg !3762
  store i32 %224, ptr %14, align 4, !dbg !3763
  %225 = load i32, ptr %14, align 4, !dbg !3764
  %226 = icmp slt i32 %225, 0, !dbg !3766
  br i1 %226, label %227, label %229, !dbg !3766

227:                                              ; preds = %182
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.19), !dbg !3767
  call void @_Z4Int3v(), !dbg !3769
  %228 = load i32, ptr %14, align 4, !dbg !3770
  store i32 %228, ptr %7, align 4, !dbg !3771
  br label %353, !dbg !3771

229:                                              ; preds = %182
  %230 = load i32, ptr %14, align 4, !dbg !3772
  %231 = sext i32 %230 to i64, !dbg !3773
  %232 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %231, !dbg !3773
  store ptr %232, ptr %15, align 8, !dbg !3774
  %233 = load ptr, ptr %15, align 8, !dbg !3775
  %234 = getelementptr inbounds nuw %struct.object, ptr %233, i32 0, i32 2, !dbg !3777
  %235 = load i8, ptr %234, align 1, !dbg !3777
  %236 = zext i8 %235 to i64, !dbg !3778
  %237 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %236, !dbg !3778
  %238 = getelementptr inbounds nuw %struct.robot_info, ptr %237, i32 0, i32 44, !dbg !3779
  %239 = load i8, ptr %238, align 4, !dbg !3779
  %240 = zext i8 %239 to i32, !dbg !3778
  %241 = and i32 %240, 1, !dbg !3780
  %242 = icmp ne i32 %241, 0, !dbg !3778
  br i1 %242, label %243, label %254, !dbg !3781

243:                                              ; preds = %229
  %244 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3782
  %245 = icmp eq i32 %244, 0, !dbg !3783
  br i1 %245, label %246, label %254, !dbg !3781

246:                                              ; preds = %243
  %247 = load ptr, ptr %15, align 8, !dbg !3784
  %248 = getelementptr inbounds nuw %struct.object, ptr %247, i32 0, i32 13, !dbg !3785
  %249 = load i32, ptr %248, align 4, !dbg !3785
  %250 = mul nsw i32 %249, 3, !dbg !3786
  %251 = sdiv i32 %250, 2, !dbg !3787
  %252 = load ptr, ptr %15, align 8, !dbg !3788
  %253 = getelementptr inbounds nuw %struct.object, ptr %252, i32 0, i32 13, !dbg !3789
  store i32 %251, ptr %253, align 4, !dbg !3790
  br label %254, !dbg !3788

254:                                              ; preds = %246, %243, %229
  %255 = load ptr, ptr %15, align 8, !dbg !3791
  %256 = getelementptr inbounds nuw %struct.object, ptr %255, i32 0, i32 2, !dbg !3792
  %257 = load i8, ptr %256, align 1, !dbg !3792
  %258 = zext i8 %257 to i64, !dbg !3793
  %259 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %258, !dbg !3793
  %260 = getelementptr inbounds nuw %struct.robot_info, ptr %259, i32 0, i32 0, !dbg !3794
  %261 = load i32, ptr %260, align 4, !dbg !3794
  %262 = load ptr, ptr %15, align 8, !dbg !3795
  %263 = getelementptr inbounds nuw %struct.object, ptr %262, i32 0, i32 23, !dbg !3796
  %264 = getelementptr inbounds nuw %struct.polyobj_info, ptr %263, i32 0, i32 0, !dbg !3797
  store i32 %261, ptr %264, align 4, !dbg !3798
  %265 = load ptr, ptr %15, align 8, !dbg !3799
  %266 = getelementptr inbounds nuw %struct.object, ptr %265, i32 0, i32 23, !dbg !3800
  %267 = getelementptr inbounds nuw %struct.polyobj_info, ptr %266, i32 0, i32 2, !dbg !3801
  store i32 0, ptr %267, align 4, !dbg !3802
  %268 = load ptr, ptr %15, align 8, !dbg !3803
  %269 = getelementptr inbounds nuw %struct.object, ptr %268, i32 0, i32 21, !dbg !3804
  %270 = getelementptr inbounds nuw %struct.physics_info, ptr %269, i32 0, i32 0, !dbg !3805
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %270, ptr align 4 %16, i64 12, i1 false), !dbg !3806
  %271 = load ptr, ptr %15, align 8, !dbg !3807
  %272 = getelementptr inbounds nuw %struct.object, ptr %271, i32 0, i32 2, !dbg !3808
  %273 = load i8, ptr %272, align 1, !dbg !3808
  %274 = zext i8 %273 to i64, !dbg !3809
  %275 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %274, !dbg !3809
  %276 = getelementptr inbounds nuw %struct.robot_info, ptr %275, i32 0, i32 20, !dbg !3810
  %277 = load i32, ptr %276, align 4, !dbg !3810
  %278 = load ptr, ptr %15, align 8, !dbg !3811
  %279 = getelementptr inbounds nuw %struct.object, ptr %278, i32 0, i32 21, !dbg !3812
  %280 = getelementptr inbounds nuw %struct.physics_info, ptr %279, i32 0, i32 2, !dbg !3813
  store i32 %277, ptr %280, align 4, !dbg !3814
  %281 = load ptr, ptr %15, align 8, !dbg !3815
  %282 = getelementptr inbounds nuw %struct.object, ptr %281, i32 0, i32 2, !dbg !3816
  %283 = load i8, ptr %282, align 1, !dbg !3816
  %284 = zext i8 %283 to i64, !dbg !3817
  %285 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %284, !dbg !3817
  %286 = getelementptr inbounds nuw %struct.robot_info, ptr %285, i32 0, i32 21, !dbg !3818
  %287 = load i32, ptr %286, align 4, !dbg !3818
  %288 = load ptr, ptr %15, align 8, !dbg !3819
  %289 = getelementptr inbounds nuw %struct.object, ptr %288, i32 0, i32 21, !dbg !3820
  %290 = getelementptr inbounds nuw %struct.physics_info, ptr %289, i32 0, i32 3, !dbg !3821
  store i32 %287, ptr %290, align 4, !dbg !3822
  %291 = load ptr, ptr %15, align 8, !dbg !3823
  %292 = getelementptr inbounds nuw %struct.object, ptr %291, i32 0, i32 21, !dbg !3824
  %293 = getelementptr inbounds nuw %struct.physics_info, ptr %292, i32 0, i32 8, !dbg !3825
  %294 = load i16, ptr %293, align 2, !dbg !3826
  %295 = zext i16 %294 to i32, !dbg !3826
  %296 = or i32 %295, 2, !dbg !3826
  %297 = trunc i32 %296 to i16, !dbg !3826
  store i16 %297, ptr %293, align 2, !dbg !3826
  %298 = load ptr, ptr %15, align 8, !dbg !3827
  %299 = getelementptr inbounds nuw %struct.object, ptr %298, i32 0, i32 2, !dbg !3828
  %300 = load i8, ptr %299, align 1, !dbg !3828
  %301 = zext i8 %300 to i64, !dbg !3829
  %302 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %301, !dbg !3829
  %303 = getelementptr inbounds nuw %struct.robot_info, ptr %302, i32 0, i32 19, !dbg !3830
  %304 = load i32, ptr %303, align 4, !dbg !3830
  %305 = load ptr, ptr %15, align 8, !dbg !3831
  %306 = getelementptr inbounds nuw %struct.object, ptr %305, i32 0, i32 14, !dbg !3832
  store i32 %304, ptr %306, align 4, !dbg !3833
  %307 = load ptr, ptr %15, align 8, !dbg !3834
  %308 = getelementptr inbounds nuw %struct.object, ptr %307, i32 0, i32 22, !dbg !3835
  %309 = getelementptr inbounds nuw %struct.ai_static, ptr %308, i32 0, i32 0, !dbg !3836
  store i8 -127, ptr %309, align 4, !dbg !3837
  %310 = load ptr, ptr %15, align 8, !dbg !3838
  %311 = ptrtoint ptr %310 to i64, !dbg !3839
  %312 = sub i64 %311, ptrtoint (ptr @Objects to i64), !dbg !3839
  %313 = sdiv exact i64 %312, 268, !dbg !3839
  %314 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %313, !dbg !3840
  %315 = getelementptr inbounds nuw %struct.ai_local, ptr %314, i32 0, i32 0, !dbg !3841
  store i32 4, ptr %315, align 4, !dbg !3842
  %316 = load ptr, ptr %15, align 8, !dbg !3843
  %317 = ptrtoint ptr %316 to i64, !dbg !3844
  %318 = sub i64 %317, ptrtoint (ptr @Objects to i64), !dbg !3844
  %319 = sdiv exact i64 %318, 268, !dbg !3844
  %320 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %319, !dbg !3845
  %321 = getelementptr inbounds nuw %struct.ai_local, ptr %320, i32 0, i32 10, !dbg !3846
  store i32 196608, ptr %321, align 4, !dbg !3847
  %322 = load ptr, ptr %15, align 8, !dbg !3848
  %323 = getelementptr inbounds nuw %struct.object, ptr %322, i32 0, i32 22, !dbg !3849
  %324 = getelementptr inbounds nuw %struct.ai_static, ptr %323, i32 0, i32 1, !dbg !3850
  %325 = getelementptr inbounds [11 x i8], ptr %324, i64 0, i64 1, !dbg !3848
  store i8 3, ptr %325, align 1, !dbg !3851
  %326 = load ptr, ptr %15, align 8, !dbg !3852
  %327 = getelementptr inbounds nuw %struct.object, ptr %326, i32 0, i32 22, !dbg !3853
  %328 = getelementptr inbounds nuw %struct.ai_static, ptr %327, i32 0, i32 1, !dbg !3854
  %329 = getelementptr inbounds [11 x i8], ptr %328, i64 0, i64 2, !dbg !3852
  store i8 3, ptr %329, align 1, !dbg !3855
  %330 = load ptr, ptr %15, align 8, !dbg !3856
  %331 = getelementptr inbounds nuw %struct.object, ptr %330, i32 0, i32 22, !dbg !3857
  %332 = getelementptr inbounds nuw %struct.ai_static, ptr %331, i32 0, i32 1, !dbg !3858
  %333 = getelementptr inbounds [11 x i8], ptr %332, i64 0, i64 8, !dbg !3856
  store i8 -1, ptr %333, align 1, !dbg !3859
  br label %334, !dbg !3860

334:                                              ; preds = %254
  %335 = load i32, ptr %19, align 4, !dbg !3861
  %336 = add nsw i32 %335, 1, !dbg !3861
  store i32 %336, ptr %19, align 4, !dbg !3861
  br label %178, !dbg !3862, !llvm.loop !3863

337:                                              ; preds = %178
  %338 = call noundef i32 @_Z6P_Randv(), !dbg !3865
  %339 = icmp sgt i32 %338, 16384, !dbg !3867
  br i1 %339, label %340, label %348, !dbg !3868

340:                                              ; preds = %337
  %341 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3869
  %342 = icmp sge i32 %341, 1, !dbg !3870
  br i1 %342, label %343, label %348, !dbg !3868

343:                                              ; preds = %340
  %344 = load ptr, ptr %11, align 8, !dbg !3871
  %345 = load ptr, ptr %12, align 8, !dbg !3872
  %346 = load i32, ptr %13, align 4, !dbg !3873
  %347 = call noundef i32 @_Z12drop_powerupiiiP10vms_vectorS0_i(i32 noundef 7, i32 noundef 2, i32 noundef 1, ptr noundef %344, ptr noundef %345, i32 noundef %346), !dbg !3874
  br label %348, !dbg !3874

348:                                              ; preds = %343, %340, %337
  br label %351, !dbg !3875

349:                                              ; preds = %6
  %350 = load i32, ptr %8, align 4, !dbg !3876
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.20, i32 noundef %350), !dbg !3877
  br label %351, !dbg !3878

351:                                              ; preds = %349, %348, %176
  %352 = load i32, ptr %14, align 4, !dbg !3879
  store i32 %352, ptr %7, align 4, !dbg !3880
  br label %353, !dbg !3880

353:                                              ; preds = %351, %227, %110
  %354 = load i32, ptr %7, align 4, !dbg !3881
  ret i32 %354, !dbg !3881
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17object_create_eggP6object(ptr noundef %0) #0 !dbg !3882 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3885, !DIExpression(), !3886)
    #dbg_declare(ptr %4, !3887, !DIExpression(), !3888)
  %5 = load i32, ptr @Game_mode, align 4, !dbg !3889
  %6 = and i32 %5, 38, !dbg !3891
  %7 = icmp ne i32 %6, 0, !dbg !3892
  %8 = xor i1 %7, true, !dbg !3893
  %9 = zext i1 %8 to i32, !dbg !3893
  %10 = load ptr, ptr %3, align 8, !dbg !3894
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !3895
  %12 = load i8, ptr %11, align 4, !dbg !3895
  %13 = zext i8 %12 to i32, !dbg !3894
  %14 = icmp ne i32 %13, 4, !dbg !3896
  %15 = zext i1 %14 to i32, !dbg !3897
  %16 = and i32 %9, %15, !dbg !3898
  %17 = icmp ne i32 %16, 0, !dbg !3893
  br i1 %17, label %18, label %95, !dbg !3893

18:                                               ; preds = %1
  %19 = load ptr, ptr %3, align 8, !dbg !3899
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 16, !dbg !3901
  %21 = load i8, ptr %20, align 4, !dbg !3901
  %22 = sext i8 %21 to i32, !dbg !3899
  %23 = icmp eq i32 %22, 7, !dbg !3902
  br i1 %23, label %24, label %94, !dbg !3902

24:                                               ; preds = %18
  %25 = load ptr, ptr %3, align 8, !dbg !3903
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 17, !dbg !3905
  %27 = load i8, ptr %26, align 1, !dbg !3905
  %28 = sext i8 %27 to i32, !dbg !3903
  %29 = icmp eq i32 %28, 2, !dbg !3906
  br i1 %29, label %30, label %58, !dbg !3906

30:                                               ; preds = %24
  %31 = load i32, ptr @Player_num, align 4, !dbg !3907
  %32 = sext i32 %31 to i64, !dbg !3910
  %33 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %32, !dbg !3910
  %34 = getelementptr inbounds nuw %struct.player, ptr %33, i32 0, i32 9, !dbg !3911
  %35 = load i32, ptr %34, align 4, !dbg !3911
  %36 = call noundef i32 @_Z3i2fi(i32 noundef 100), !dbg !3912
  %37 = icmp sge i32 %35, %36, !dbg !3913
  br i1 %37, label %38, label %43, !dbg !3913

38:                                               ; preds = %30
  %39 = call noundef i32 @_Z6P_Randv(), !dbg !3914
  %40 = icmp sgt i32 %39, 16384, !dbg !3917
  br i1 %40, label %41, label %42, !dbg !3917

41:                                               ; preds = %38
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.21), !dbg !3918
  store i32 -1, ptr %2, align 4, !dbg !3920
  br label %189, !dbg !3920

42:                                               ; preds = %38
  br label %57, !dbg !3921

43:                                               ; preds = %30
  %44 = load i32, ptr @Player_num, align 4, !dbg !3922
  %45 = sext i32 %44 to i64, !dbg !3924
  %46 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %45, !dbg !3924
  %47 = getelementptr inbounds nuw %struct.player, ptr %46, i32 0, i32 9, !dbg !3925
  %48 = load i32, ptr %47, align 4, !dbg !3925
  %49 = call noundef i32 @_Z3i2fi(i32 noundef 150), !dbg !3926
  %50 = icmp sge i32 %48, %49, !dbg !3927
  br i1 %50, label %51, label %56, !dbg !3927

51:                                               ; preds = %43
  %52 = call noundef i32 @_Z6P_Randv(), !dbg !3928
  %53 = icmp sgt i32 %52, 8192, !dbg !3931
  br i1 %53, label %54, label %55, !dbg !3931

54:                                               ; preds = %51
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.21), !dbg !3932
  store i32 -1, ptr %2, align 4, !dbg !3934
  br label %189, !dbg !3934

55:                                               ; preds = %51
  br label %56, !dbg !3935

56:                                               ; preds = %55, %43
  br label %57

57:                                               ; preds = %56, %42
  br label %93, !dbg !3936

58:                                               ; preds = %24
  %59 = load ptr, ptr %3, align 8, !dbg !3937
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 17, !dbg !3939
  %61 = load i8, ptr %60, align 1, !dbg !3939
  %62 = sext i8 %61 to i32, !dbg !3937
  %63 = icmp eq i32 %62, 1, !dbg !3940
  br i1 %63, label %64, label %92, !dbg !3940

64:                                               ; preds = %58
  %65 = load i32, ptr @Player_num, align 4, !dbg !3941
  %66 = sext i32 %65 to i64, !dbg !3944
  %67 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %66, !dbg !3944
  %68 = getelementptr inbounds nuw %struct.player, ptr %67, i32 0, i32 8, !dbg !3945
  %69 = load i32, ptr %68, align 4, !dbg !3945
  %70 = call noundef i32 @_Z3i2fi(i32 noundef 100), !dbg !3946
  %71 = icmp sge i32 %69, %70, !dbg !3947
  br i1 %71, label %72, label %77, !dbg !3947

72:                                               ; preds = %64
  %73 = call noundef i32 @_Z6P_Randv(), !dbg !3948
  %74 = icmp sgt i32 %73, 16384, !dbg !3951
  br i1 %74, label %75, label %76, !dbg !3951

75:                                               ; preds = %72
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.22), !dbg !3952
  store i32 -1, ptr %2, align 4, !dbg !3954
  br label %189, !dbg !3954

76:                                               ; preds = %72
  br label %91, !dbg !3955

77:                                               ; preds = %64
  %78 = load i32, ptr @Player_num, align 4, !dbg !3956
  %79 = sext i32 %78 to i64, !dbg !3958
  %80 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %79, !dbg !3958
  %81 = getelementptr inbounds nuw %struct.player, ptr %80, i32 0, i32 8, !dbg !3959
  %82 = load i32, ptr %81, align 4, !dbg !3959
  %83 = call noundef i32 @_Z3i2fi(i32 noundef 150), !dbg !3960
  %84 = icmp sge i32 %82, %83, !dbg !3961
  br i1 %84, label %85, label %90, !dbg !3961

85:                                               ; preds = %77
  %86 = call noundef i32 @_Z6P_Randv(), !dbg !3962
  %87 = icmp sgt i32 %86, 8192, !dbg !3965
  br i1 %87, label %88, label %89, !dbg !3965

88:                                               ; preds = %85
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.22), !dbg !3966
  store i32 -1, ptr %2, align 4, !dbg !3968
  br label %189, !dbg !3968

89:                                               ; preds = %85
  br label %90, !dbg !3969

90:                                               ; preds = %89, %77
  br label %91

91:                                               ; preds = %90, %76
  br label %92, !dbg !3970

92:                                               ; preds = %91, %58
  br label %93

93:                                               ; preds = %92, %57
  br label %94, !dbg !3971

94:                                               ; preds = %93, %18
  br label %95, !dbg !3972

95:                                               ; preds = %94, %1
  %96 = load ptr, ptr %3, align 8, !dbg !3973
  %97 = getelementptr inbounds nuw %struct.object, ptr %96, i32 0, i32 16, !dbg !3974
  %98 = load i8, ptr %97, align 4, !dbg !3974
  %99 = sext i8 %98 to i32, !dbg !3973
  %100 = load ptr, ptr %3, align 8, !dbg !3975
  %101 = getelementptr inbounds nuw %struct.object, ptr %100, i32 0, i32 17, !dbg !3976
  %102 = load i8, ptr %101, align 1, !dbg !3976
  %103 = sext i8 %102 to i32, !dbg !3975
  %104 = load ptr, ptr %3, align 8, !dbg !3977
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 18, !dbg !3978
  %106 = load i8, ptr %105, align 2, !dbg !3978
  %107 = sext i8 %106 to i32, !dbg !3977
  %108 = load ptr, ptr %3, align 8, !dbg !3979
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 21, !dbg !3980
  %110 = getelementptr inbounds nuw %struct.physics_info, ptr %109, i32 0, i32 0, !dbg !3981
  %111 = load ptr, ptr %3, align 8, !dbg !3982
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 11, !dbg !3983
  %113 = load ptr, ptr %3, align 8, !dbg !3984
  %114 = getelementptr inbounds nuw %struct.object, ptr %113, i32 0, i32 9, !dbg !3985
  %115 = load i16, ptr %114, align 2, !dbg !3985
  %116 = sext i16 %115 to i32, !dbg !3984
  %117 = call noundef i32 @_Z12drop_powerupiiiP10vms_vectorS0_i(i32 noundef %99, i32 noundef %103, i32 noundef %107, ptr noundef %110, ptr noundef %112, i32 noundef %116), !dbg !3986
  store i32 %117, ptr %4, align 4, !dbg !3987
  %118 = load i32, ptr %4, align 4, !dbg !3988
  %119 = icmp ne i32 %118, -1, !dbg !3990
  br i1 %119, label %120, label %187, !dbg !3990

120:                                              ; preds = %95
  %121 = load ptr, ptr %3, align 8, !dbg !3991
  %122 = getelementptr inbounds nuw %struct.object, ptr %121, i32 0, i32 1, !dbg !3994
  %123 = load i8, ptr %122, align 4, !dbg !3994
  %124 = zext i8 %123 to i32, !dbg !3991
  %125 = icmp eq i32 %124, 4, !dbg !3995
  br i1 %125, label %126, label %142, !dbg !3996

126:                                              ; preds = %120
  %127 = load ptr, ptr %3, align 8, !dbg !3997
  %128 = getelementptr inbounds nuw %struct.object, ptr %127, i32 0, i32 2, !dbg !3998
  %129 = load i8, ptr %128, align 1, !dbg !3998
  %130 = zext i8 %129 to i32, !dbg !3997
  %131 = load i32, ptr @Player_num, align 4, !dbg !3999
  %132 = icmp eq i32 %130, %131, !dbg !4000
  br i1 %132, label %133, label %142, !dbg !3996

133:                                              ; preds = %126
  %134 = load i32, ptr %4, align 4, !dbg !4001
  %135 = sext i32 %134 to i64, !dbg !4002
  %136 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %135, !dbg !4002
  %137 = getelementptr inbounds nuw %struct.object, ptr %136, i32 0, i32 8, !dbg !4003
  %138 = load i8, ptr %137, align 1, !dbg !4004
  %139 = zext i8 %138 to i32, !dbg !4004
  %140 = or i32 %139, 64, !dbg !4004
  %141 = trunc i32 %140 to i8, !dbg !4004
  store i8 %141, ptr %137, align 1, !dbg !4004
  br label %142, !dbg !4002

142:                                              ; preds = %133, %126, %120
  %143 = load ptr, ptr %3, align 8, !dbg !4005
  %144 = getelementptr inbounds nuw %struct.object, ptr %143, i32 0, i32 1, !dbg !4007
  %145 = load i8, ptr %144, align 4, !dbg !4007
  %146 = zext i8 %145 to i32, !dbg !4005
  %147 = icmp eq i32 %146, 2, !dbg !4008
  br i1 %147, label %148, label %186, !dbg !4009

148:                                              ; preds = %142
  %149 = load ptr, ptr %3, align 8, !dbg !4010
  %150 = getelementptr inbounds nuw %struct.object, ptr %149, i32 0, i32 16, !dbg !4011
  %151 = load i8, ptr %150, align 4, !dbg !4011
  %152 = sext i8 %151 to i32, !dbg !4010
  %153 = icmp eq i32 %152, 7, !dbg !4012
  br i1 %153, label %154, label %186, !dbg !4009

154:                                              ; preds = %148
  %155 = load ptr, ptr %3, align 8, !dbg !4013
  %156 = getelementptr inbounds nuw %struct.object, ptr %155, i32 0, i32 17, !dbg !4015
  %157 = load i8, ptr %156, align 1, !dbg !4015
  %158 = sext i8 %157 to i32, !dbg !4013
  %159 = icmp eq i32 %158, 13, !dbg !4016
  br i1 %159, label %166, label %160, !dbg !4017

160:                                              ; preds = %154
  %161 = load ptr, ptr %3, align 8, !dbg !4018
  %162 = getelementptr inbounds nuw %struct.object, ptr %161, i32 0, i32 17, !dbg !4019
  %163 = load i8, ptr %162, align 1, !dbg !4019
  %164 = sext i8 %163 to i32, !dbg !4018
  %165 = icmp eq i32 %164, 28, !dbg !4020
  br i1 %165, label %166, label %172, !dbg !4017

166:                                              ; preds = %160, %154
  %167 = load i32, ptr %4, align 4, !dbg !4021
  %168 = sext i32 %167 to i64, !dbg !4022
  %169 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %168, !dbg !4022
  %170 = getelementptr inbounds nuw %struct.object, ptr %169, i32 0, i32 22, !dbg !4023
  %171 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %170, i32 0, i32 0, !dbg !4024
  store i32 196, ptr %171, align 4, !dbg !4025
  br label %185, !dbg !4022

172:                                              ; preds = %160
  %173 = load ptr, ptr %3, align 8, !dbg !4026
  %174 = getelementptr inbounds nuw %struct.object, ptr %173, i32 0, i32 17, !dbg !4028
  %175 = load i8, ptr %174, align 1, !dbg !4028
  %176 = sext i8 %175 to i32, !dbg !4026
  %177 = icmp eq i32 %176, 31, !dbg !4029
  br i1 %177, label %178, label %184, !dbg !4029

178:                                              ; preds = %172
  %179 = load i32, ptr %4, align 4, !dbg !4030
  %180 = sext i32 %179 to i64, !dbg !4031
  %181 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %180, !dbg !4031
  %182 = getelementptr inbounds nuw %struct.object, ptr %181, i32 0, i32 22, !dbg !4032
  %183 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %182, i32 0, i32 0, !dbg !4033
  store i32 65536, ptr %183, align 4, !dbg !4034
  br label %184, !dbg !4031

184:                                              ; preds = %178, %172
  br label %185

185:                                              ; preds = %184, %166
  br label %186, !dbg !4035

186:                                              ; preds = %185, %148, %142
  br label %187, !dbg !4036

187:                                              ; preds = %186, %95
  %188 = load i32, ptr %4, align 4, !dbg !4037
  store i32 %188, ptr %2, align 4, !dbg !4038
  br label %189, !dbg !4038

189:                                              ; preds = %187, %88, %75, %54, %41
  %190 = load i32, ptr %2, align 4, !dbg !4039
  ret i32 %190, !dbg !4039
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !4040 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !4043, !DIExpression(), !4044)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !4045, !DIExpression(), !4046)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !4047, !DIExpression(), !4048)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !4049, !DIExpression(), !4050)
  %10 = load i32, ptr %7, align 4, !dbg !4051
  %11 = icmp sgt i32 %10, 0, !dbg !4053
  br i1 %11, label %12, label %27, !dbg !4053

12:                                               ; preds = %4
  %13 = load i32, ptr %7, align 4, !dbg !4054
  %14 = trunc i32 %13 to i8, !dbg !4054
  %15 = load ptr, ptr %6, align 8, !dbg !4056
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 18, !dbg !4057
  store i8 %14, ptr %16, align 2, !dbg !4058
  %17 = load i32, ptr %8, align 4, !dbg !4059
  %18 = trunc i32 %17 to i8, !dbg !4059
  %19 = load ptr, ptr %6, align 8, !dbg !4060
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 16, !dbg !4061
  store i8 %18, ptr %20, align 4, !dbg !4062
  %21 = load i32, ptr %9, align 4, !dbg !4063
  %22 = trunc i32 %21 to i8, !dbg !4063
  %23 = load ptr, ptr %6, align 8, !dbg !4064
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 17, !dbg !4065
  store i8 %22, ptr %24, align 1, !dbg !4066
  %25 = load ptr, ptr %6, align 8, !dbg !4067
  %26 = call noundef i32 @_Z17object_create_eggP6object(ptr noundef %25), !dbg !4068
  store i32 %26, ptr %5, align 4, !dbg !4069
  br label %28, !dbg !4069

27:                                               ; preds = %4
  store i32 -1, ptr %5, align 4, !dbg !4070
  br label %28, !dbg !4070

28:                                               ; preds = %27, %12
  %29 = load i32, ptr %5, align 4, !dbg !4071
  ret i32 %29, !dbg !4071
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13explode_modelP6object(ptr noundef %0) #0 !dbg !4072 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4073, !DIExpression(), !4074)
  %4 = load ptr, ptr %2, align 8, !dbg !4075
  %5 = getelementptr inbounds nuw %struct.object, ptr %4, i32 0, i32 7, !dbg !4075
  %6 = load i8, ptr %5, align 4, !dbg !4075
  %7 = zext i8 %6 to i32, !dbg !4075
  %8 = icmp eq i32 %7, 1, !dbg !4075
  %9 = zext i1 %8 to i32, !dbg !4075
  call void @_Z7_AssertiPKcS0_i(i32 noundef %9, ptr noundef @.str.23, ptr noundef @.str.4, i32 noundef 1073), !dbg !4075
  %10 = load ptr, ptr %2, align 8, !dbg !4076
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 23, !dbg !4078
  %12 = getelementptr inbounds nuw %struct.polyobj_info, ptr %11, i32 0, i32 0, !dbg !4079
  %13 = load i32, ptr %12, align 4, !dbg !4079
  %14 = sext i32 %13 to i64, !dbg !4080
  %15 = getelementptr inbounds [0 x i32], ptr @Dying_modelnums, i64 0, i64 %14, !dbg !4080
  %16 = load i32, ptr %15, align 4, !dbg !4080
  %17 = icmp ne i32 %16, -1, !dbg !4081
  br i1 %17, label %18, label %29, !dbg !4081

18:                                               ; preds = %1
  %19 = load ptr, ptr %2, align 8, !dbg !4082
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 23, !dbg !4083
  %21 = getelementptr inbounds nuw %struct.polyobj_info, ptr %20, i32 0, i32 0, !dbg !4084
  %22 = load i32, ptr %21, align 4, !dbg !4084
  %23 = sext i32 %22 to i64, !dbg !4085
  %24 = getelementptr inbounds [0 x i32], ptr @Dying_modelnums, i64 0, i64 %23, !dbg !4085
  %25 = load i32, ptr %24, align 4, !dbg !4085
  %26 = load ptr, ptr %2, align 8, !dbg !4086
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 23, !dbg !4087
  %28 = getelementptr inbounds nuw %struct.polyobj_info, ptr %27, i32 0, i32 0, !dbg !4088
  store i32 %25, ptr %28, align 4, !dbg !4089
  br label %29, !dbg !4086

29:                                               ; preds = %18, %1
  %30 = load ptr, ptr %2, align 8, !dbg !4090
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 23, !dbg !4092
  %32 = getelementptr inbounds nuw %struct.polyobj_info, ptr %31, i32 0, i32 0, !dbg !4093
  %33 = load i32, ptr %32, align 4, !dbg !4093
  %34 = sext i32 %33 to i64, !dbg !4094
  %35 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %34, !dbg !4094
  %36 = getelementptr inbounds nuw %struct.polymodel, ptr %35, i32 0, i32 0, !dbg !4095
  %37 = load i32, ptr %36, align 8, !dbg !4095
  %38 = icmp sgt i32 %37, 1, !dbg !4096
  br i1 %38, label %39, label %78, !dbg !4096

39:                                               ; preds = %29
    #dbg_declare(ptr %3, !4097, !DIExpression(), !4099)
  store i32 1, ptr %3, align 4, !dbg !4100
  br label %40, !dbg !4102

40:                                               ; preds = %71, %39
  %41 = load i32, ptr %3, align 4, !dbg !4103
  %42 = load ptr, ptr %2, align 8, !dbg !4105
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 23, !dbg !4106
  %44 = getelementptr inbounds nuw %struct.polyobj_info, ptr %43, i32 0, i32 0, !dbg !4107
  %45 = load i32, ptr %44, align 4, !dbg !4107
  %46 = sext i32 %45 to i64, !dbg !4108
  %47 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %46, !dbg !4108
  %48 = getelementptr inbounds nuw %struct.polymodel, ptr %47, i32 0, i32 0, !dbg !4109
  %49 = load i32, ptr %48, align 8, !dbg !4109
  %50 = icmp slt i32 %41, %49, !dbg !4110
  br i1 %50, label %51, label %74, !dbg !4111

51:                                               ; preds = %40
  %52 = load ptr, ptr %2, align 8, !dbg !4112
  %53 = getelementptr inbounds nuw %struct.object, ptr %52, i32 0, i32 1, !dbg !4114
  %54 = load i8, ptr %53, align 4, !dbg !4114
  %55 = zext i8 %54 to i32, !dbg !4112
  %56 = icmp eq i32 %55, 2, !dbg !4115
  br i1 %56, label %57, label %66, !dbg !4116

57:                                               ; preds = %51
  %58 = load ptr, ptr %2, align 8, !dbg !4117
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 2, !dbg !4118
  %60 = load i8, ptr %59, align 1, !dbg !4118
  %61 = zext i8 %60 to i32, !dbg !4117
  %62 = icmp eq i32 %61, 44, !dbg !4119
  br i1 %62, label %63, label %66, !dbg !4120

63:                                               ; preds = %57
  %64 = load i32, ptr %3, align 4, !dbg !4121
  %65 = icmp eq i32 %64, 5, !dbg !4122
  br i1 %65, label %70, label %66, !dbg !4123

66:                                               ; preds = %63, %57, %51
  %67 = load ptr, ptr %2, align 8, !dbg !4124
  %68 = load i32, ptr %3, align 4, !dbg !4125
  %69 = call noundef ptr @_Z20object_create_debrisP6objecti(ptr noundef %67, i32 noundef %68), !dbg !4126
  br label %70, !dbg !4126

70:                                               ; preds = %66, %63
  br label %71, !dbg !4127

71:                                               ; preds = %70
  %72 = load i32, ptr %3, align 4, !dbg !4128
  %73 = add nsw i32 %72, 1, !dbg !4128
  store i32 %73, ptr %3, align 4, !dbg !4128
  br label %40, !dbg !4129, !llvm.loop !4130

74:                                               ; preds = %40
  %75 = load ptr, ptr %2, align 8, !dbg !4132
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 23, !dbg !4133
  %77 = getelementptr inbounds nuw %struct.polyobj_info, ptr %76, i32 0, i32 2, !dbg !4134
  store i32 1, ptr %77, align 4, !dbg !4135
  br label %78, !dbg !4136

78:                                               ; preds = %74, %29
  ret void, !dbg !4137
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z19maybe_delete_objectP6object(ptr noundef %0) #2 !dbg !4138 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4139, !DIExpression(), !4140)
  %3 = load ptr, ptr %2, align 8, !dbg !4141
  %4 = getelementptr inbounds nuw %struct.object, ptr %3, i32 0, i32 23, !dbg !4143
  %5 = getelementptr inbounds nuw %struct.polyobj_info, ptr %4, i32 0, i32 0, !dbg !4144
  %6 = load i32, ptr %5, align 4, !dbg !4144
  %7 = sext i32 %6 to i64, !dbg !4145
  %8 = getelementptr inbounds [0 x i32], ptr @Dead_modelnums, i64 0, i64 %7, !dbg !4145
  %9 = load i32, ptr %8, align 4, !dbg !4145
  %10 = icmp ne i32 %9, -1, !dbg !4146
  br i1 %10, label %11, label %28, !dbg !4146

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8, !dbg !4147
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 23, !dbg !4149
  %14 = getelementptr inbounds nuw %struct.polyobj_info, ptr %13, i32 0, i32 0, !dbg !4150
  %15 = load i32, ptr %14, align 4, !dbg !4150
  %16 = sext i32 %15 to i64, !dbg !4151
  %17 = getelementptr inbounds [0 x i32], ptr @Dead_modelnums, i64 0, i64 %16, !dbg !4151
  %18 = load i32, ptr %17, align 4, !dbg !4151
  %19 = load ptr, ptr %2, align 8, !dbg !4152
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 23, !dbg !4153
  %21 = getelementptr inbounds nuw %struct.polyobj_info, ptr %20, i32 0, i32 0, !dbg !4154
  store i32 %18, ptr %21, align 4, !dbg !4155
  %22 = load ptr, ptr %2, align 8, !dbg !4156
  %23 = getelementptr inbounds nuw %struct.object, ptr %22, i32 0, i32 8, !dbg !4157
  %24 = load i8, ptr %23, align 1, !dbg !4158
  %25 = zext i8 %24 to i32, !dbg !4158
  %26 = or i32 %25, 4, !dbg !4158
  %27 = trunc i32 %26 to i8, !dbg !4158
  store i8 %27, ptr %23, align 1, !dbg !4158
  br label %45, !dbg !4159

28:                                               ; preds = %1
  %29 = load ptr, ptr %2, align 8, !dbg !4160
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 1, !dbg !4163
  %31 = load i8, ptr %30, align 4, !dbg !4163
  %32 = zext i8 %31 to i32, !dbg !4160
  %33 = icmp eq i32 %32, 4, !dbg !4164
  br i1 %33, label %34, label %37, !dbg !4164

34:                                               ; preds = %28
  %35 = load ptr, ptr %2, align 8, !dbg !4165
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 7, !dbg !4166
  store i8 0, ptr %36, align 4, !dbg !4167
  br label %44, !dbg !4165

37:                                               ; preds = %28
  %38 = load ptr, ptr %2, align 8, !dbg !4168
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 8, !dbg !4169
  %40 = load i8, ptr %39, align 1, !dbg !4170
  %41 = zext i8 %40 to i32, !dbg !4170
  %42 = or i32 %41, 2, !dbg !4170
  %43 = trunc i32 %42 to i8, !dbg !4170
  store i8 %43, ptr %39, align 1, !dbg !4170
  br label %44

44:                                               ; preds = %37, %34
  br label %45

45:                                               ; preds = %44, %11
  ret void, !dbg !4171
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14explode_objectP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !4172 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4175, !DIExpression(), !4176)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4177, !DIExpression(), !4178)
  %9 = load ptr, ptr %3, align 8, !dbg !4179
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 8, !dbg !4181
  %11 = load i8, ptr %10, align 1, !dbg !4181
  %12 = zext i8 %11 to i32, !dbg !4179
  %13 = and i32 %12, 1, !dbg !4182
  %14 = icmp ne i32 %13, 0, !dbg !4179
  br i1 %14, label %15, label %16, !dbg !4179

15:                                               ; preds = %2
  br label %122, !dbg !4183

16:                                               ; preds = %2
  %17 = load i32, ptr %4, align 4, !dbg !4184
  %18 = icmp ne i32 %17, 0, !dbg !4184
  br i1 %18, label %19, label %60, !dbg !4184

19:                                               ; preds = %16
    #dbg_declare(ptr %5, !4186, !DIExpression(), !4188)
    #dbg_declare(ptr %6, !4189, !DIExpression(), !4190)
  %20 = load ptr, ptr %3, align 8, !dbg !4191
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 9, !dbg !4192
  %22 = load i16, ptr %21, align 2, !dbg !4192
  %23 = sext i16 %22 to i32, !dbg !4191
  %24 = load ptr, ptr %3, align 8, !dbg !4193
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 11, !dbg !4194
  %26 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 1, i8 noundef zeroext -1, i32 noundef %23, ptr noundef %25, ptr noundef @vmd_identity_matrix, i32 noundef 0, i8 noundef zeroext 2, i8 noundef zeroext 0, i8 noundef zeroext 0), !dbg !4195
  store i32 %26, ptr %5, align 4, !dbg !4196
  %27 = load i32, ptr %5, align 4, !dbg !4197
  %28 = icmp slt i32 %27, 0, !dbg !4199
  br i1 %28, label %29, label %31, !dbg !4199

29:                                               ; preds = %19
  %30 = load ptr, ptr %3, align 8, !dbg !4200
  call void @_Z19maybe_delete_objectP6object(ptr noundef %30), !dbg !4202
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.24), !dbg !4203
  call void @_Z4Int3v(), !dbg !4204
  br label %122, !dbg !4205

31:                                               ; preds = %19
  %32 = load i32, ptr %5, align 4, !dbg !4206
  %33 = sext i32 %32 to i64, !dbg !4207
  %34 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %33, !dbg !4207
  store ptr %34, ptr %6, align 8, !dbg !4208
  %35 = load i32, ptr %4, align 4, !dbg !4209
  %36 = load ptr, ptr %6, align 8, !dbg !4210
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 20, !dbg !4211
  store i32 %35, ptr %37, align 4, !dbg !4212
  %38 = load ptr, ptr %3, align 8, !dbg !4213
  %39 = ptrtoint ptr %38 to i64, !dbg !4214
  %40 = sub i64 %39, ptrtoint (ptr @Objects to i64), !dbg !4214
  %41 = sdiv exact i64 %40, 268, !dbg !4214
  %42 = trunc i64 %41 to i16, !dbg !4213
  %43 = load ptr, ptr %6, align 8, !dbg !4215
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 22, !dbg !4216
  %45 = getelementptr inbounds nuw %struct.explosion_info, ptr %44, i32 0, i32 2, !dbg !4217
  store i16 %42, ptr %45, align 4, !dbg !4218
  %46 = load ptr, ptr %6, align 8, !dbg !4219
  %47 = getelementptr inbounds nuw %struct.object, ptr %46, i32 0, i32 22, !dbg !4221
  %48 = getelementptr inbounds nuw %struct.explosion_info, ptr %47, i32 0, i32 2, !dbg !4222
  %49 = load i16, ptr %48, align 4, !dbg !4222
  %50 = sext i16 %49 to i32, !dbg !4219
  %51 = icmp slt i32 %50, 0, !dbg !4223
  br i1 %51, label %52, label %53, !dbg !4223

52:                                               ; preds = %31
  call void @_Z4Int3v(), !dbg !4224
  br label %53, !dbg !4224

53:                                               ; preds = %52, %31
  %54 = load ptr, ptr %6, align 8, !dbg !4225
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 22, !dbg !4226
  %56 = getelementptr inbounds nuw %struct.explosion_info, ptr %55, i32 0, i32 1, !dbg !4227
  store i32 -1, ptr %56, align 4, !dbg !4228
  %57 = load ptr, ptr %6, align 8, !dbg !4229
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 22, !dbg !4230
  %59 = getelementptr inbounds nuw %struct.explosion_info, ptr %58, i32 0, i32 0, !dbg !4231
  store i32 0, ptr %59, align 4, !dbg !4232
  br label %113, !dbg !4233

60:                                               ; preds = %16
    #dbg_declare(ptr %7, !4234, !DIExpression(), !4236)
    #dbg_declare(ptr %8, !4237, !DIExpression(), !4238)
  %61 = load ptr, ptr %3, align 8, !dbg !4239
  %62 = call noundef i32 @_Z19get_explosion_vclipP6objecti(ptr noundef %61, i32 noundef 0), !dbg !4240
  store i32 %62, ptr %8, align 4, !dbg !4241
  %63 = load ptr, ptr %3, align 8, !dbg !4242
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 9, !dbg !4243
  %65 = load i16, ptr %64, align 2, !dbg !4243
  %66 = load ptr, ptr %3, align 8, !dbg !4244
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 11, !dbg !4245
  %68 = load ptr, ptr %3, align 8, !dbg !4246
  %69 = getelementptr inbounds nuw %struct.object, ptr %68, i32 0, i32 13, !dbg !4247
  %70 = load i32, ptr %69, align 4, !dbg !4247
  %71 = call noundef i32 @_Z6fixmulii(i32 noundef %70, i32 noundef 163840), !dbg !4248
  %72 = load i32, ptr %8, align 4, !dbg !4249
  %73 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %65, ptr noundef %67, i32 noundef %71, i32 noundef %72), !dbg !4250
  store ptr %73, ptr %7, align 8, !dbg !4251
  %74 = load ptr, ptr %7, align 8, !dbg !4252
  %75 = icmp ne ptr %74, null, !dbg !4252
  br i1 %75, label %78, label %76, !dbg !4254

76:                                               ; preds = %60
  %77 = load ptr, ptr %3, align 8, !dbg !4255
  call void @_Z19maybe_delete_objectP6object(ptr noundef %77), !dbg !4257
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.24), !dbg !4258
  br label %122, !dbg !4259

78:                                               ; preds = %60
  %79 = load ptr, ptr %3, align 8, !dbg !4260
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 1, !dbg !4262
  %81 = load i8, ptr %80, align 4, !dbg !4262
  %82 = zext i8 %81 to i32, !dbg !4260
  %83 = icmp ne i32 %82, 8, !dbg !4263
  br i1 %83, label %84, label %97, !dbg !4264

84:                                               ; preds = %78
  %85 = load ptr, ptr %3, align 8, !dbg !4265
  %86 = getelementptr inbounds nuw %struct.object, ptr %85, i32 0, i32 6, !dbg !4266
  %87 = load i8, ptr %86, align 1, !dbg !4266
  %88 = zext i8 %87 to i32, !dbg !4265
  %89 = icmp eq i32 %88, 1, !dbg !4267
  br i1 %89, label %90, label %97, !dbg !4264

90:                                               ; preds = %84
  %91 = load ptr, ptr %7, align 8, !dbg !4268
  %92 = getelementptr inbounds nuw %struct.object, ptr %91, i32 0, i32 6, !dbg !4270
  store i8 1, ptr %92, align 1, !dbg !4271
  %93 = load ptr, ptr %3, align 8, !dbg !4272
  %94 = getelementptr inbounds nuw %struct.object, ptr %93, i32 0, i32 21, !dbg !4273
  %95 = load ptr, ptr %7, align 8, !dbg !4274
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 21, !dbg !4275
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %96, ptr align 4 %94, i64 64, i1 false), !dbg !4276
  br label %97, !dbg !4277

97:                                               ; preds = %90, %84, %78
  %98 = load ptr, ptr %3, align 8, !dbg !4278
  %99 = getelementptr inbounds nuw %struct.object, ptr %98, i32 0, i32 7, !dbg !4280
  %100 = load i8, ptr %99, align 4, !dbg !4280
  %101 = zext i8 %100 to i32, !dbg !4278
  %102 = icmp eq i32 %101, 1, !dbg !4281
  br i1 %102, label %103, label %111, !dbg !4282

103:                                              ; preds = %97
  %104 = load ptr, ptr %3, align 8, !dbg !4283
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 1, !dbg !4284
  %106 = load i8, ptr %105, align 4, !dbg !4284
  %107 = zext i8 %106 to i32, !dbg !4283
  %108 = icmp ne i32 %107, 8, !dbg !4285
  br i1 %108, label %109, label %111, !dbg !4282

109:                                              ; preds = %103
  %110 = load ptr, ptr %3, align 8, !dbg !4286
  call void @_Z13explode_modelP6object(ptr noundef %110), !dbg !4287
  br label %111, !dbg !4287

111:                                              ; preds = %109, %103, %97
  %112 = load ptr, ptr %3, align 8, !dbg !4288
  call void @_Z19maybe_delete_objectP6object(ptr noundef %112), !dbg !4289
  br label %113

113:                                              ; preds = %111, %53
  %114 = load ptr, ptr %3, align 8, !dbg !4290
  %115 = getelementptr inbounds nuw %struct.object, ptr %114, i32 0, i32 8, !dbg !4291
  %116 = load i8, ptr %115, align 1, !dbg !4292
  %117 = zext i8 %116 to i32, !dbg !4292
  %118 = or i32 %117, 1, !dbg !4292
  %119 = trunc i32 %118 to i8, !dbg !4292
  store i8 %119, ptr %115, align 1, !dbg !4292
  %120 = load ptr, ptr %3, align 8, !dbg !4293
  %121 = getelementptr inbounds nuw %struct.object, ptr %120, i32 0, i32 5, !dbg !4294
  store i8 0, ptr %121, align 2, !dbg !4295
  br label %122, !dbg !4296

122:                                              ; preds = %113, %76, %29, %15
  ret void, !dbg !4296
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15do_debris_frameP6object(ptr noundef %0) #0 !dbg !4297 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4298, !DIExpression(), !4299)
  %3 = load ptr, ptr %2, align 8, !dbg !4300
  %4 = getelementptr inbounds nuw %struct.object, ptr %3, i32 0, i32 5, !dbg !4300
  %5 = load i8, ptr %4, align 2, !dbg !4300
  %6 = zext i8 %5 to i32, !dbg !4300
  %7 = icmp eq i32 %6, 12, !dbg !4300
  %8 = zext i1 %7 to i32, !dbg !4300
  call void @_Z7_AssertiPKcS0_i(i32 noundef %8, ptr noundef @.str.25, ptr noundef @.str.4, i32 noundef 1178), !dbg !4300
  %9 = load ptr, ptr %2, align 8, !dbg !4301
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 20, !dbg !4303
  %11 = load i32, ptr %10, align 4, !dbg !4303
  %12 = icmp slt i32 %11, 0, !dbg !4304
  br i1 %12, label %13, label %15, !dbg !4304

13:                                               ; preds = %1
  %14 = load ptr, ptr %2, align 8, !dbg !4305
  call void @_Z14explode_objectP6objecti(ptr noundef %14, i32 noundef 0), !dbg !4306
  br label %15, !dbg !4306

15:                                               ; preds = %13, %1
  ret void, !dbg !4307
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21do_explosion_sequenceP6object(ptr noundef %0) #0 !dbg !4308 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4309, !DIExpression(), !4310)
  %9 = load ptr, ptr %2, align 8, !dbg !4311
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 5, !dbg !4311
  %11 = load i8, ptr %10, align 2, !dbg !4311
  %12 = zext i8 %11 to i32, !dbg !4311
  %13 = icmp eq i32 %12, 2, !dbg !4311
  %14 = zext i1 %13 to i32, !dbg !4311
  call void @_Z7_AssertiPKcS0_i(i32 noundef %14, ptr noundef @.str.26, ptr noundef @.str.4, i32 noundef 1190), !dbg !4311
  %15 = load ptr, ptr %2, align 8, !dbg !4312
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 20, !dbg !4314
  %17 = load i32, ptr %16, align 4, !dbg !4314
  %18 = icmp sle i32 %17, 0, !dbg !4315
  br i1 %18, label %19, label %28, !dbg !4315

19:                                               ; preds = %1
  %20 = load ptr, ptr %2, align 8, !dbg !4316
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 8, !dbg !4318
  %22 = load i8, ptr %21, align 1, !dbg !4319
  %23 = zext i8 %22 to i32, !dbg !4319
  %24 = or i32 %23, 2, !dbg !4319
  %25 = trunc i32 %24 to i8, !dbg !4319
  store i8 %25, ptr %21, align 1, !dbg !4319
  %26 = load ptr, ptr %2, align 8, !dbg !4320
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 20, !dbg !4321
  store i32 0, ptr %27, align 4, !dbg !4322
  br label %28, !dbg !4323

28:                                               ; preds = %19, %1
  %29 = load ptr, ptr %2, align 8, !dbg !4324
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 20, !dbg !4326
  %31 = load i32, ptr %30, align 4, !dbg !4326
  %32 = load ptr, ptr %2, align 8, !dbg !4327
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 22, !dbg !4328
  %34 = getelementptr inbounds nuw %struct.explosion_info, ptr %33, i32 0, i32 0, !dbg !4329
  %35 = load i32, ptr %34, align 4, !dbg !4329
  %36 = icmp sle i32 %31, %35, !dbg !4330
  br i1 %36, label %37, label %330, !dbg !4330

37:                                               ; preds = %28
    #dbg_declare(ptr %3, !4331, !DIExpression(), !4333)
    #dbg_declare(ptr %4, !4334, !DIExpression(), !4335)
    #dbg_declare(ptr %5, !4336, !DIExpression(), !4337)
    #dbg_declare(ptr %6, !4338, !DIExpression(), !4339)
  %38 = load ptr, ptr %2, align 8, !dbg !4340
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 22, !dbg !4342
  %40 = getelementptr inbounds nuw %struct.explosion_info, ptr %39, i32 0, i32 2, !dbg !4343
  %41 = load i16, ptr %40, align 4, !dbg !4343
  %42 = sext i16 %41 to i32, !dbg !4340
  %43 = icmp slt i32 %42, 0, !dbg !4344
  br i1 %43, label %52, label %44, !dbg !4345

44:                                               ; preds = %37
  %45 = load ptr, ptr %2, align 8, !dbg !4346
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 22, !dbg !4347
  %47 = getelementptr inbounds nuw %struct.explosion_info, ptr %46, i32 0, i32 2, !dbg !4348
  %48 = load i16, ptr %47, align 4, !dbg !4348
  %49 = sext i16 %48 to i32, !dbg !4346
  %50 = load i32, ptr @Highest_object_index, align 4, !dbg !4349
  %51 = icmp sgt i32 %49, %50, !dbg !4350
  br i1 %51, label %52, label %53, !dbg !4345

52:                                               ; preds = %44, %37
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.27), !dbg !4351
  call void @_Z4Int3v(), !dbg !4353
  br label %350, !dbg !4354

53:                                               ; preds = %44
  %54 = load ptr, ptr %2, align 8, !dbg !4355
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 22, !dbg !4356
  %56 = getelementptr inbounds nuw %struct.explosion_info, ptr %55, i32 0, i32 2, !dbg !4357
  %57 = load i16, ptr %56, align 4, !dbg !4357
  %58 = sext i16 %57 to i64, !dbg !4358
  %59 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %58, !dbg !4358
  store ptr %59, ptr %4, align 8, !dbg !4359
  %60 = load ptr, ptr %4, align 8, !dbg !4360
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 11, !dbg !4361
  store ptr %61, ptr %6, align 8, !dbg !4362
  %62 = load ptr, ptr %4, align 8, !dbg !4363
  %63 = getelementptr inbounds nuw %struct.object, ptr %62, i32 0, i32 1, !dbg !4365
  %64 = load i8, ptr %63, align 4, !dbg !4365
  %65 = zext i8 %64 to i32, !dbg !4363
  %66 = icmp eq i32 %65, 2, !dbg !4366
  br i1 %66, label %85, label %67, !dbg !4367

67:                                               ; preds = %53
  %68 = load ptr, ptr %4, align 8, !dbg !4368
  %69 = getelementptr inbounds nuw %struct.object, ptr %68, i32 0, i32 1, !dbg !4369
  %70 = load i8, ptr %69, align 4, !dbg !4369
  %71 = zext i8 %70 to i32, !dbg !4368
  %72 = icmp eq i32 %71, 11, !dbg !4370
  br i1 %72, label %85, label %73, !dbg !4371

73:                                               ; preds = %67
  %74 = load ptr, ptr %4, align 8, !dbg !4372
  %75 = getelementptr inbounds nuw %struct.object, ptr %74, i32 0, i32 1, !dbg !4373
  %76 = load i8, ptr %75, align 4, !dbg !4373
  %77 = zext i8 %76 to i32, !dbg !4372
  %78 = icmp eq i32 %77, 9, !dbg !4374
  br i1 %78, label %85, label %79, !dbg !4375

79:                                               ; preds = %73
  %80 = load ptr, ptr %4, align 8, !dbg !4376
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 1, !dbg !4377
  %82 = load i8, ptr %81, align 4, !dbg !4377
  %83 = zext i8 %82 to i32, !dbg !4376
  %84 = icmp eq i32 %83, 4, !dbg !4378
  br i1 %84, label %85, label %91, !dbg !4379

85:                                               ; preds = %79, %73, %67, %53
  %86 = load ptr, ptr %4, align 8, !dbg !4380
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 9, !dbg !4381
  %88 = load i16, ptr %87, align 2, !dbg !4381
  %89 = sext i16 %88 to i32, !dbg !4380
  %90 = icmp ne i32 %89, -1, !dbg !4382
  br i1 %90, label %92, label %91, !dbg !4383

91:                                               ; preds = %85, %79
  call void @_Z4Int3v(), !dbg !4384
  br label %350, !dbg !4386

92:                                               ; preds = %85
  %93 = load ptr, ptr %4, align 8, !dbg !4387
  %94 = call noundef i32 @_Z19get_explosion_vclipP6objecti(ptr noundef %93, i32 noundef 1), !dbg !4388
  store i32 %94, ptr %5, align 4, !dbg !4389
  %95 = load ptr, ptr %4, align 8, !dbg !4390
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 1, !dbg !4392
  %97 = load i8, ptr %96, align 4, !dbg !4392
  %98 = zext i8 %97 to i32, !dbg !4390
  %99 = icmp eq i32 %98, 2, !dbg !4393
  br i1 %99, label %100, label %149, !dbg !4394

100:                                              ; preds = %92
  %101 = load ptr, ptr %4, align 8, !dbg !4395
  %102 = getelementptr inbounds nuw %struct.object, ptr %101, i32 0, i32 2, !dbg !4396
  %103 = load i8, ptr %102, align 1, !dbg !4396
  %104 = zext i8 %103 to i64, !dbg !4397
  %105 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %104, !dbg !4397
  %106 = getelementptr inbounds nuw %struct.robot_info, ptr %105, i32 0, i32 16, !dbg !4398
  %107 = load i8, ptr %106, align 2, !dbg !4398
  %108 = icmp ne i8 %107, 0, !dbg !4397
  br i1 %108, label %109, label %149, !dbg !4394

109:                                              ; preds = %100
  %110 = load ptr, ptr %4, align 8, !dbg !4399
  %111 = getelementptr inbounds nuw %struct.object, ptr %110, i32 0, i32 9, !dbg !4400
  %112 = load i16, ptr %111, align 2, !dbg !4400
  %113 = load ptr, ptr %6, align 8, !dbg !4401
  %114 = load ptr, ptr %4, align 8, !dbg !4402
  %115 = getelementptr inbounds nuw %struct.object, ptr %114, i32 0, i32 13, !dbg !4403
  %116 = load i32, ptr %115, align 4, !dbg !4403
  %117 = call noundef i32 @_Z6fixmulii(i32 noundef %116, i32 noundef 163840), !dbg !4404
  %118 = load i32, ptr %5, align 4, !dbg !4405
  %119 = load ptr, ptr %4, align 8, !dbg !4406
  %120 = getelementptr inbounds nuw %struct.object, ptr %119, i32 0, i32 2, !dbg !4407
  %121 = load i8, ptr %120, align 1, !dbg !4407
  %122 = zext i8 %121 to i64, !dbg !4408
  %123 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %122, !dbg !4408
  %124 = getelementptr inbounds nuw %struct.robot_info, ptr %123, i32 0, i32 16, !dbg !4409
  %125 = load i8, ptr %124, align 2, !dbg !4409
  %126 = sext i8 %125 to i32, !dbg !4408
  %127 = mul nsw i32 65536, %126, !dbg !4410
  %128 = call noundef i32 @_Z3i2fi(i32 noundef 4), !dbg !4411
  %129 = load ptr, ptr %4, align 8, !dbg !4412
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 2, !dbg !4413
  %131 = load i8, ptr %130, align 1, !dbg !4413
  %132 = zext i8 %131 to i64, !dbg !4414
  %133 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %132, !dbg !4414
  %134 = getelementptr inbounds nuw %struct.robot_info, ptr %133, i32 0, i32 16, !dbg !4415
  %135 = load i8, ptr %134, align 2, !dbg !4415
  %136 = sext i8 %135 to i32, !dbg !4414
  %137 = mul nsw i32 %128, %136, !dbg !4416
  %138 = call noundef i32 @_Z3i2fi(i32 noundef 35), !dbg !4417
  %139 = load ptr, ptr %4, align 8, !dbg !4418
  %140 = getelementptr inbounds nuw %struct.object, ptr %139, i32 0, i32 2, !dbg !4419
  %141 = load i8, ptr %140, align 1, !dbg !4419
  %142 = zext i8 %141 to i64, !dbg !4420
  %143 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %142, !dbg !4420
  %144 = getelementptr inbounds nuw %struct.robot_info, ptr %143, i32 0, i32 16, !dbg !4421
  %145 = load i8, ptr %144, align 2, !dbg !4421
  %146 = sext i8 %145 to i32, !dbg !4420
  %147 = mul nsw i32 %138, %146, !dbg !4422
  %148 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef null, i16 noundef signext %112, ptr noundef %113, i32 noundef %117, i32 noundef %118, i32 noundef %127, i32 noundef %137, i32 noundef %147, i32 noundef -1), !dbg !4423
  store ptr %148, ptr %3, align 8, !dbg !4424
  br label %160, !dbg !4425

149:                                              ; preds = %100, %92
  %150 = load ptr, ptr %4, align 8, !dbg !4426
  %151 = getelementptr inbounds nuw %struct.object, ptr %150, i32 0, i32 9, !dbg !4427
  %152 = load i16, ptr %151, align 2, !dbg !4427
  %153 = load ptr, ptr %6, align 8, !dbg !4428
  %154 = load ptr, ptr %4, align 8, !dbg !4429
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 13, !dbg !4430
  %156 = load i32, ptr %155, align 4, !dbg !4430
  %157 = call noundef i32 @_Z6fixmulii(i32 noundef %156, i32 noundef 163840), !dbg !4431
  %158 = load i32, ptr %5, align 4, !dbg !4432
  %159 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %152, ptr noundef %153, i32 noundef %157, i32 noundef %158), !dbg !4433
  store ptr %159, ptr %3, align 8, !dbg !4434
  br label %160

160:                                              ; preds = %149, %109
  %161 = load ptr, ptr %4, align 8, !dbg !4435
  %162 = getelementptr inbounds nuw %struct.object, ptr %161, i32 0, i32 18, !dbg !4437
  %163 = load i8, ptr %162, align 2, !dbg !4437
  %164 = sext i8 %163 to i32, !dbg !4435
  %165 = icmp sgt i32 %164, 0, !dbg !4438
  br i1 %165, label %166, label %181, !dbg !4439

166:                                              ; preds = %160
  %167 = load i32, ptr @Game_mode, align 4, !dbg !4440
  %168 = and i32 %167, 38, !dbg !4441
  %169 = icmp ne i32 %168, 0, !dbg !4442
  br i1 %169, label %181, label %170, !dbg !4439

170:                                              ; preds = %166
  %171 = load ptr, ptr %4, align 8, !dbg !4443
  %172 = getelementptr inbounds nuw %struct.object, ptr %171, i32 0, i32 16, !dbg !4446
  %173 = load i8, ptr %172, align 4, !dbg !4446
  %174 = sext i8 %173 to i32, !dbg !4443
  %175 = icmp eq i32 %174, 7, !dbg !4447
  br i1 %175, label %176, label %178, !dbg !4447

176:                                              ; preds = %170
  %177 = load ptr, ptr %4, align 8, !dbg !4448
  call void @_Z33maybe_replace_powerup_with_energyP6object(ptr noundef %177), !dbg !4449
  br label %178, !dbg !4449

178:                                              ; preds = %176, %170
  %179 = load ptr, ptr %4, align 8, !dbg !4450
  %180 = call noundef i32 @_Z17object_create_eggP6object(ptr noundef %179), !dbg !4451
  br label %252, !dbg !4452

181:                                              ; preds = %166, %160
  %182 = load ptr, ptr %4, align 8, !dbg !4453
  %183 = getelementptr inbounds nuw %struct.object, ptr %182, i32 0, i32 1, !dbg !4455
  %184 = load i8, ptr %183, align 4, !dbg !4455
  %185 = zext i8 %184 to i32, !dbg !4453
  %186 = icmp eq i32 %185, 2, !dbg !4456
  br i1 %186, label %187, label %251, !dbg !4457

187:                                              ; preds = %181
  %188 = load i32, ptr @Game_mode, align 4, !dbg !4458
  %189 = and i32 %188, 38, !dbg !4459
  %190 = icmp ne i32 %189, 0, !dbg !4460
  br i1 %190, label %251, label %191, !dbg !4457

191:                                              ; preds = %187
    #dbg_declare(ptr %7, !4461, !DIExpression(), !4532)
  %192 = load ptr, ptr %4, align 8, !dbg !4533
  %193 = getelementptr inbounds nuw %struct.object, ptr %192, i32 0, i32 2, !dbg !4534
  %194 = load i8, ptr %193, align 1, !dbg !4534
  %195 = zext i8 %194 to i64, !dbg !4535
  %196 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %195, !dbg !4535
  store ptr %196, ptr %7, align 8, !dbg !4532
  %197 = load ptr, ptr %7, align 8, !dbg !4536
  %198 = getelementptr inbounds nuw %struct.robot_info, ptr %197, i32 0, i32 11, !dbg !4538
  %199 = load i8, ptr %198, align 4, !dbg !4538
  %200 = icmp ne i8 %199, 0, !dbg !4536
  br i1 %200, label %201, label %236, !dbg !4536

201:                                              ; preds = %191
  %202 = call noundef i32 @_Z6P_Randv(), !dbg !4539
  %203 = mul nsw i32 %202, 16, !dbg !4542
  %204 = ashr i32 %203, 15, !dbg !4543
  %205 = load ptr, ptr %7, align 8, !dbg !4544
  %206 = getelementptr inbounds nuw %struct.robot_info, ptr %205, i32 0, i32 12, !dbg !4545
  %207 = load i8, ptr %206, align 1, !dbg !4545
  %208 = sext i8 %207 to i32, !dbg !4544
  %209 = icmp slt i32 %204, %208, !dbg !4546
  br i1 %209, label %210, label %235, !dbg !4546

210:                                              ; preds = %201
  %211 = call noundef i32 @_Z6P_Randv(), !dbg !4547
  %212 = load ptr, ptr %7, align 8, !dbg !4549
  %213 = getelementptr inbounds nuw %struct.robot_info, ptr %212, i32 0, i32 11, !dbg !4550
  %214 = load i8, ptr %213, align 4, !dbg !4550
  %215 = sext i8 %214 to i32, !dbg !4549
  %216 = mul nsw i32 %211, %215, !dbg !4551
  %217 = ashr i32 %216, 15, !dbg !4552
  %218 = add nsw i32 %217, 1, !dbg !4553
  %219 = trunc i32 %218 to i8, !dbg !4554
  %220 = load ptr, ptr %4, align 8, !dbg !4555
  %221 = getelementptr inbounds nuw %struct.object, ptr %220, i32 0, i32 18, !dbg !4556
  store i8 %219, ptr %221, align 2, !dbg !4557
  %222 = load ptr, ptr %7, align 8, !dbg !4558
  %223 = getelementptr inbounds nuw %struct.robot_info, ptr %222, i32 0, i32 13, !dbg !4559
  %224 = load i8, ptr %223, align 2, !dbg !4559
  %225 = load ptr, ptr %4, align 8, !dbg !4560
  %226 = getelementptr inbounds nuw %struct.object, ptr %225, i32 0, i32 16, !dbg !4561
  store i8 %224, ptr %226, align 4, !dbg !4562
  %227 = load ptr, ptr %7, align 8, !dbg !4563
  %228 = getelementptr inbounds nuw %struct.robot_info, ptr %227, i32 0, i32 10, !dbg !4564
  %229 = load i8, ptr %228, align 1, !dbg !4564
  %230 = load ptr, ptr %4, align 8, !dbg !4565
  %231 = getelementptr inbounds nuw %struct.object, ptr %230, i32 0, i32 17, !dbg !4566
  store i8 %229, ptr %231, align 1, !dbg !4567
  %232 = load ptr, ptr %4, align 8, !dbg !4568
  call void @_Z33maybe_replace_powerup_with_energyP6object(ptr noundef %232), !dbg !4569
  %233 = load ptr, ptr %4, align 8, !dbg !4570
  %234 = call noundef i32 @_Z17object_create_eggP6object(ptr noundef %233), !dbg !4571
  br label %235, !dbg !4572

235:                                              ; preds = %210, %201
  br label %236, !dbg !4573

236:                                              ; preds = %235, %191
  %237 = load ptr, ptr %7, align 8, !dbg !4574
  %238 = getelementptr inbounds nuw %struct.robot_info, ptr %237, i32 0, i32 40, !dbg !4576
  %239 = load i8, ptr %238, align 4, !dbg !4576
  %240 = icmp ne i8 %239, 0, !dbg !4574
  br i1 %240, label %241, label %243, !dbg !4574

241:                                              ; preds = %236
  %242 = load ptr, ptr %4, align 8, !dbg !4577
  call void @_Z17drop_stolen_itemsP6object(ptr noundef %242), !dbg !4578
  br label %243, !dbg !4578

243:                                              ; preds = %241, %236
  %244 = load ptr, ptr %7, align 8, !dbg !4579
  %245 = getelementptr inbounds nuw %struct.robot_info, ptr %244, i32 0, i32 37, !dbg !4581
  %246 = load i8, ptr %245, align 1, !dbg !4581
  %247 = icmp ne i8 %246, 0, !dbg !4579
  br i1 %247, label %248, label %250, !dbg !4579

248:                                              ; preds = %243
  %249 = load ptr, ptr %4, align 8, !dbg !4582
  call void @_Z15DropBuddyMarkerP6object(ptr noundef %249), !dbg !4584
  br label %250, !dbg !4585

250:                                              ; preds = %248, %243
  br label %251, !dbg !4586

251:                                              ; preds = %250, %187, %181
  br label %252

252:                                              ; preds = %251, %178
  %253 = load ptr, ptr %4, align 8, !dbg !4587
  %254 = getelementptr inbounds nuw %struct.object, ptr %253, i32 0, i32 2, !dbg !4589
  %255 = load i8, ptr %254, align 1, !dbg !4589
  %256 = zext i8 %255 to i64, !dbg !4590
  %257 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %256, !dbg !4590
  %258 = getelementptr inbounds nuw %struct.robot_info, ptr %257, i32 0, i32 6, !dbg !4591
  %259 = load i16, ptr %258, align 2, !dbg !4591
  %260 = sext i16 %259 to i32, !dbg !4590
  %261 = icmp sgt i32 %260, -1, !dbg !4592
  br i1 %261, label %262, label %276, !dbg !4592

262:                                              ; preds = %252
  %263 = load ptr, ptr %4, align 8, !dbg !4593
  %264 = getelementptr inbounds nuw %struct.object, ptr %263, i32 0, i32 2, !dbg !4594
  %265 = load i8, ptr %264, align 1, !dbg !4594
  %266 = zext i8 %265 to i64, !dbg !4595
  %267 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %266, !dbg !4595
  %268 = getelementptr inbounds nuw %struct.robot_info, ptr %267, i32 0, i32 6, !dbg !4596
  %269 = load i16, ptr %268, align 2, !dbg !4596
  %270 = sext i16 %269 to i32, !dbg !4595
  %271 = load ptr, ptr %4, align 8, !dbg !4597
  %272 = getelementptr inbounds nuw %struct.object, ptr %271, i32 0, i32 9, !dbg !4598
  %273 = load i16, ptr %272, align 2, !dbg !4598
  %274 = load ptr, ptr %6, align 8, !dbg !4599
  %275 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %270, i16 noundef signext %273, i16 noundef signext 0, ptr noundef %274, i32 noundef 0, i32 noundef 65536), !dbg !4600
  br label %276, !dbg !4600

276:                                              ; preds = %262, %252
  %277 = load ptr, ptr %2, align 8, !dbg !4601
  %278 = getelementptr inbounds nuw %struct.object, ptr %277, i32 0, i32 22, !dbg !4602
  %279 = getelementptr inbounds nuw %struct.explosion_info, ptr %278, i32 0, i32 0, !dbg !4603
  store i32 -1, ptr %279, align 4, !dbg !4604
  %280 = load ptr, ptr %4, align 8, !dbg !4605
  %281 = getelementptr inbounds nuw %struct.object, ptr %280, i32 0, i32 7, !dbg !4607
  %282 = load i8, ptr %281, align 4, !dbg !4607
  %283 = zext i8 %282 to i32, !dbg !4605
  %284 = icmp eq i32 %283, 1, !dbg !4608
  br i1 %284, label %285, label %287, !dbg !4608

285:                                              ; preds = %276
  %286 = load ptr, ptr %4, align 8, !dbg !4609
  call void @_Z13explode_modelP6object(ptr noundef %286), !dbg !4610
  br label %287, !dbg !4610

287:                                              ; preds = %285, %276
  %288 = load ptr, ptr %3, align 8, !dbg !4611
  %289 = icmp ne ptr %288, null, !dbg !4611
  br i1 %289, label %290, label %327, !dbg !4611

290:                                              ; preds = %287
  %291 = load ptr, ptr %4, align 8, !dbg !4613
  %292 = getelementptr inbounds nuw %struct.object, ptr %291, i32 0, i32 6, !dbg !4616
  %293 = load i8, ptr %292, align 1, !dbg !4616
  %294 = zext i8 %293 to i32, !dbg !4613
  %295 = icmp eq i32 %294, 1, !dbg !4617
  br i1 %295, label %296, label %303, !dbg !4617

296:                                              ; preds = %290
  %297 = load ptr, ptr %3, align 8, !dbg !4618
  %298 = getelementptr inbounds nuw %struct.object, ptr %297, i32 0, i32 6, !dbg !4620
  store i8 1, ptr %298, align 1, !dbg !4621
  %299 = load ptr, ptr %4, align 8, !dbg !4622
  %300 = getelementptr inbounds nuw %struct.object, ptr %299, i32 0, i32 21, !dbg !4623
  %301 = load ptr, ptr %3, align 8, !dbg !4624
  %302 = getelementptr inbounds nuw %struct.object, ptr %301, i32 0, i32 21, !dbg !4625
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %302, ptr align 4 %300, i64 64, i1 false), !dbg !4626
  br label %303, !dbg !4627

303:                                              ; preds = %296, %290
  %304 = load ptr, ptr %3, align 8, !dbg !4628
  %305 = getelementptr inbounds nuw %struct.object, ptr %304, i32 0, i32 20, !dbg !4629
  %306 = load i32, ptr %305, align 4, !dbg !4629
  %307 = sdiv i32 %306, 2, !dbg !4630
  %308 = load ptr, ptr %3, align 8, !dbg !4631
  %309 = getelementptr inbounds nuw %struct.object, ptr %308, i32 0, i32 22, !dbg !4632
  %310 = getelementptr inbounds nuw %struct.explosion_info, ptr %309, i32 0, i32 1, !dbg !4633
  store i32 %307, ptr %310, align 4, !dbg !4634
  %311 = load ptr, ptr %4, align 8, !dbg !4635
  %312 = ptrtoint ptr %311 to i64, !dbg !4636
  %313 = sub i64 %312, ptrtoint (ptr @Objects to i64), !dbg !4636
  %314 = sdiv exact i64 %313, 268, !dbg !4636
  %315 = trunc i64 %314 to i16, !dbg !4635
  %316 = load ptr, ptr %3, align 8, !dbg !4637
  %317 = getelementptr inbounds nuw %struct.object, ptr %316, i32 0, i32 22, !dbg !4638
  %318 = getelementptr inbounds nuw %struct.explosion_info, ptr %317, i32 0, i32 2, !dbg !4639
  store i16 %315, ptr %318, align 4, !dbg !4640
  %319 = load ptr, ptr %2, align 8, !dbg !4641
  %320 = getelementptr inbounds nuw %struct.object, ptr %319, i32 0, i32 22, !dbg !4643
  %321 = getelementptr inbounds nuw %struct.explosion_info, ptr %320, i32 0, i32 2, !dbg !4644
  %322 = load i16, ptr %321, align 4, !dbg !4644
  %323 = sext i16 %322 to i32, !dbg !4641
  %324 = icmp slt i32 %323, 0, !dbg !4645
  br i1 %324, label %325, label %326, !dbg !4645

325:                                              ; preds = %303
  call void @_Z4Int3v(), !dbg !4646
  br label %326, !dbg !4646

326:                                              ; preds = %325, %303
  br label %329, !dbg !4647

327:                                              ; preds = %287
  %328 = load ptr, ptr %4, align 8, !dbg !4648
  call void @_Z19maybe_delete_objectP6object(ptr noundef %328), !dbg !4650
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.28), !dbg !4651
  br label %329

329:                                              ; preds = %327, %326
  br label %330, !dbg !4652

330:                                              ; preds = %329, %28
  %331 = load ptr, ptr %2, align 8, !dbg !4653
  %332 = getelementptr inbounds nuw %struct.object, ptr %331, i32 0, i32 20, !dbg !4655
  %333 = load i32, ptr %332, align 4, !dbg !4655
  %334 = load ptr, ptr %2, align 8, !dbg !4656
  %335 = getelementptr inbounds nuw %struct.object, ptr %334, i32 0, i32 22, !dbg !4657
  %336 = getelementptr inbounds nuw %struct.explosion_info, ptr %335, i32 0, i32 1, !dbg !4658
  %337 = load i32, ptr %336, align 4, !dbg !4658
  %338 = icmp sle i32 %333, %337, !dbg !4659
  br i1 %338, label %339, label %350, !dbg !4659

339:                                              ; preds = %330
    #dbg_declare(ptr %8, !4660, !DIExpression(), !4662)
  %340 = load ptr, ptr %2, align 8, !dbg !4663
  %341 = getelementptr inbounds nuw %struct.object, ptr %340, i32 0, i32 22, !dbg !4664
  %342 = getelementptr inbounds nuw %struct.explosion_info, ptr %341, i32 0, i32 2, !dbg !4665
  %343 = load i16, ptr %342, align 4, !dbg !4665
  %344 = sext i16 %343 to i64, !dbg !4666
  %345 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %344, !dbg !4666
  store ptr %345, ptr %8, align 8, !dbg !4662
  %346 = load ptr, ptr %2, align 8, !dbg !4667
  %347 = getelementptr inbounds nuw %struct.object, ptr %346, i32 0, i32 22, !dbg !4668
  %348 = getelementptr inbounds nuw %struct.explosion_info, ptr %347, i32 0, i32 1, !dbg !4669
  store i32 -1, ptr %348, align 4, !dbg !4670
  %349 = load ptr, ptr %8, align 8, !dbg !4671
  call void @_Z19maybe_delete_objectP6object(ptr noundef %349), !dbg !4672
  br label %350, !dbg !4673

350:                                              ; preds = %52, %91, %339, %330
  ret void, !dbg !4674
}

declare void @_Z17drop_stolen_itemsP6object(ptr noundef) #1

declare void @_Z15DropBuddyMarkerP6object(ptr noundef) #1

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z20init_exploding_wallsv() #2 !dbg !4675 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4676, !DIExpression(), !4677)
  store i32 0, ptr %1, align 4, !dbg !4678
  br label %2, !dbg !4680

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !4681
  %4 = icmp slt i32 %3, 10, !dbg !4683
  br i1 %4, label %5, label %13, !dbg !4684

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !4685
  %7 = sext i32 %6 to i64, !dbg !4686
  %8 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %7, !dbg !4686
  %9 = getelementptr inbounds nuw %struct.expl_wall, ptr %8, i32 0, i32 0, !dbg !4687
  store i32 -1, ptr %9, align 4, !dbg !4688
  br label %10, !dbg !4686

10:                                               ; preds = %5
  %11 = load i32, ptr %1, align 4, !dbg !4689
  %12 = add nsw i32 %11, 1, !dbg !4689
  store i32 %12, ptr %1, align 4, !dbg !4689
  br label %2, !dbg !4690, !llvm.loop !4691

13:                                               ; preds = %2
  ret void, !dbg !4693
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12explode_wallii(i32 noundef %0, i32 noundef %1) #0 !dbg !4694 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.vms_vector, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !4697, !DIExpression(), !4698)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4699, !DIExpression(), !4700)
    #dbg_declare(ptr %5, !4701, !DIExpression(), !4702)
    #dbg_declare(ptr %6, !4703, !DIExpression(), !4704)
  store i32 0, ptr %5, align 4, !dbg !4705
  br label %7, !dbg !4707

7:                                                ; preds = %20, %2
  %8 = load i32, ptr %5, align 4, !dbg !4708
  %9 = icmp slt i32 %8, 10, !dbg !4710
  br i1 %9, label %10, label %17, !dbg !4711

10:                                               ; preds = %7
  %11 = load i32, ptr %5, align 4, !dbg !4712
  %12 = sext i32 %11 to i64, !dbg !4713
  %13 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %12, !dbg !4713
  %14 = getelementptr inbounds nuw %struct.expl_wall, ptr %13, i32 0, i32 0, !dbg !4714
  %15 = load i32, ptr %14, align 4, !dbg !4714
  %16 = icmp ne i32 %15, -1, !dbg !4715
  br label %17

17:                                               ; preds = %10, %7
  %18 = phi i1 [ false, %7 ], [ %16, %10 ], !dbg !4716
  br i1 %18, label %19, label %23, !dbg !4717

19:                                               ; preds = %17
  br label %20, !dbg !4717

20:                                               ; preds = %19
  %21 = load i32, ptr %5, align 4, !dbg !4718
  %22 = add nsw i32 %21, 1, !dbg !4718
  store i32 %22, ptr %5, align 4, !dbg !4718
  br label %7, !dbg !4719, !llvm.loop !4720

23:                                               ; preds = %17
  %24 = load i32, ptr %5, align 4, !dbg !4722
  %25 = icmp eq i32 %24, 10, !dbg !4724
  br i1 %25, label %26, label %27, !dbg !4724

26:                                               ; preds = %23
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.29), !dbg !4725
  call void @_Z4Int3v(), !dbg !4727
  br label %51, !dbg !4728

27:                                               ; preds = %23
  %28 = load i32, ptr %3, align 4, !dbg !4729
  %29 = load i32, ptr %5, align 4, !dbg !4730
  %30 = sext i32 %29 to i64, !dbg !4731
  %31 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %30, !dbg !4731
  %32 = getelementptr inbounds nuw %struct.expl_wall, ptr %31, i32 0, i32 0, !dbg !4732
  store i32 %28, ptr %32, align 4, !dbg !4733
  %33 = load i32, ptr %4, align 4, !dbg !4734
  %34 = load i32, ptr %5, align 4, !dbg !4735
  %35 = sext i32 %34 to i64, !dbg !4736
  %36 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %35, !dbg !4736
  %37 = getelementptr inbounds nuw %struct.expl_wall, ptr %36, i32 0, i32 1, !dbg !4737
  store i32 %33, ptr %37, align 4, !dbg !4738
  %38 = load i32, ptr %5, align 4, !dbg !4739
  %39 = sext i32 %38 to i64, !dbg !4740
  %40 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %39, !dbg !4740
  %41 = getelementptr inbounds nuw %struct.expl_wall, ptr %40, i32 0, i32 2, !dbg !4741
  store i32 0, ptr %41, align 4, !dbg !4742
  %42 = load i32, ptr %3, align 4, !dbg !4743
  %43 = sext i32 %42 to i64, !dbg !4744
  %44 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %43, !dbg !4744
  %45 = load i32, ptr %4, align 4, !dbg !4745
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %6, ptr noundef %44, i32 noundef %45), !dbg !4746
  %46 = load i32, ptr %3, align 4, !dbg !4747
  %47 = trunc i32 %46 to i16, !dbg !4747
  %48 = load i32, ptr %4, align 4, !dbg !4748
  %49 = trunc i32 %48 to i16, !dbg !4748
  %50 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 31, i16 noundef signext %47, i16 noundef signext %49, ptr noundef %6, i32 noundef 0, i32 noundef 65536), !dbg !4749
  br label %51, !dbg !4750

51:                                               ; preds = %27, %26
  ret void, !dbg !4750
}

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23do_exploding_wall_framev() #0 !dbg !4751 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [4 x i16], align 2
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca %struct.vms_vector, align 4
  %19 = alloca %struct.vms_vector, align 4
  %20 = alloca %struct.vms_vector, align 4
  %21 = alloca i32, align 4
    #dbg_declare(ptr %1, !4752, !DIExpression(), !4753)
  store i32 0, ptr %1, align 4, !dbg !4754
  br label %22, !dbg !4756

22:                                               ; preds = %250, %0
  %23 = load i32, ptr %1, align 4, !dbg !4757
  %24 = icmp slt i32 %23, 10, !dbg !4759
  br i1 %24, label %25, label %253, !dbg !4760

25:                                               ; preds = %22
    #dbg_declare(ptr %2, !4761, !DIExpression(), !4763)
  %26 = load i32, ptr %1, align 4, !dbg !4764
  %27 = sext i32 %26 to i64, !dbg !4765
  %28 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %27, !dbg !4765
  %29 = getelementptr inbounds nuw %struct.expl_wall, ptr %28, i32 0, i32 0, !dbg !4766
  %30 = load i32, ptr %29, align 4, !dbg !4766
  store i32 %30, ptr %2, align 4, !dbg !4763
  %31 = load i32, ptr %2, align 4, !dbg !4767
  %32 = icmp ne i32 %31, -1, !dbg !4769
  br i1 %32, label %33, label %249, !dbg !4769

33:                                               ; preds = %25
    #dbg_declare(ptr %3, !4770, !DIExpression(), !4772)
  %34 = load i32, ptr %1, align 4, !dbg !4773
  %35 = sext i32 %34 to i64, !dbg !4774
  %36 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %35, !dbg !4774
  %37 = getelementptr inbounds nuw %struct.expl_wall, ptr %36, i32 0, i32 1, !dbg !4775
  %38 = load i32, ptr %37, align 4, !dbg !4775
  store i32 %38, ptr %3, align 4, !dbg !4772
    #dbg_declare(ptr %4, !4776, !DIExpression(), !4777)
    #dbg_declare(ptr %5, !4778, !DIExpression(), !4779)
    #dbg_declare(ptr %6, !4780, !DIExpression(), !4781)
    #dbg_declare(ptr %7, !4782, !DIExpression(), !4783)
    #dbg_declare(ptr %8, !4784, !DIExpression(), !4785)
  %39 = load i32, ptr %1, align 4, !dbg !4786
  %40 = sext i32 %39 to i64, !dbg !4787
  %41 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %40, !dbg !4787
  %42 = getelementptr inbounds nuw %struct.expl_wall, ptr %41, i32 0, i32 2, !dbg !4788
  %43 = load i32, ptr %42, align 4, !dbg !4788
  %44 = call noundef i32 @_Z6fixdivii(i32 noundef %43, i32 noundef 65536), !dbg !4789
  store i32 %44, ptr %4, align 4, !dbg !4790
  %45 = load i32, ptr @FrameTime, align 4, !dbg !4791
  %46 = load i32, ptr %1, align 4, !dbg !4792
  %47 = sext i32 %46 to i64, !dbg !4793
  %48 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %47, !dbg !4793
  %49 = getelementptr inbounds nuw %struct.expl_wall, ptr %48, i32 0, i32 2, !dbg !4794
  %50 = load i32, ptr %49, align 4, !dbg !4795
  %51 = add nsw i32 %50, %45, !dbg !4795
  store i32 %51, ptr %49, align 4, !dbg !4795
  %52 = load i32, ptr %1, align 4, !dbg !4796
  %53 = sext i32 %52 to i64, !dbg !4798
  %54 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %53, !dbg !4798
  %55 = getelementptr inbounds nuw %struct.expl_wall, ptr %54, i32 0, i32 2, !dbg !4799
  %56 = load i32, ptr %55, align 4, !dbg !4799
  %57 = icmp sgt i32 %56, 65536, !dbg !4800
  br i1 %57, label %58, label %63, !dbg !4800

58:                                               ; preds = %33
  %59 = load i32, ptr %1, align 4, !dbg !4801
  %60 = sext i32 %59 to i64, !dbg !4802
  %61 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %60, !dbg !4802
  %62 = getelementptr inbounds nuw %struct.expl_wall, ptr %61, i32 0, i32 2, !dbg !4803
  store i32 65536, ptr %62, align 4, !dbg !4804
  br label %63, !dbg !4802

63:                                               ; preds = %58, %33
  %64 = load i32, ptr %1, align 4, !dbg !4805
  %65 = sext i32 %64 to i64, !dbg !4807
  %66 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %65, !dbg !4807
  %67 = getelementptr inbounds nuw %struct.expl_wall, ptr %66, i32 0, i32 2, !dbg !4808
  %68 = load i32, ptr %67, align 4, !dbg !4808
  %69 = icmp sgt i32 %68, 49152, !dbg !4809
  br i1 %69, label %70, label %138, !dbg !4809

70:                                               ; preds = %63
    #dbg_declare(ptr %9, !4810, !DIExpression(), !4812)
    #dbg_declare(ptr %10, !4813, !DIExpression(), !4814)
    #dbg_declare(ptr %11, !4815, !DIExpression(), !4816)
    #dbg_declare(ptr %12, !4817, !DIExpression(), !4818)
    #dbg_declare(ptr %13, !4819, !DIExpression(), !4820)
  %71 = load i32, ptr %2, align 4, !dbg !4821
  %72 = sext i32 %71 to i64, !dbg !4822
  %73 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %72, !dbg !4822
  store ptr %73, ptr %9, align 8, !dbg !4823
  %74 = load ptr, ptr %9, align 8, !dbg !4824
  %75 = getelementptr inbounds nuw %struct.segment, ptr %74, i32 0, i32 0, !dbg !4825
  %76 = load i32, ptr %3, align 4, !dbg !4826
  %77 = sext i32 %76 to i64, !dbg !4824
  %78 = getelementptr inbounds [6 x %struct.side], ptr %75, i64 0, i64 %77, !dbg !4824
  %79 = getelementptr inbounds nuw %struct.side, ptr %78, i32 0, i32 2, !dbg !4827
  %80 = load i16, ptr %79, align 2, !dbg !4827
  %81 = sext i16 %80 to i64, !dbg !4828
  %82 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %81, !dbg !4828
  %83 = getelementptr inbounds nuw %struct.wall, ptr %82, i32 0, i32 8, !dbg !4829
  %84 = load i8, ptr %83, align 4, !dbg !4829
  %85 = sext i8 %84 to i32, !dbg !4828
  store i32 %85, ptr %12, align 4, !dbg !4830
  %86 = load i32, ptr %12, align 4, !dbg !4831
  %87 = sext i32 %86 to i64, !dbg !4832
  %88 = getelementptr inbounds [60 x %struct.wclip], ptr @WallAnims, i64 0, i64 %87, !dbg !4832
  %89 = getelementptr inbounds nuw %struct.wclip, ptr %88, i32 0, i32 1, !dbg !4833
  %90 = load i16, ptr %89, align 4, !dbg !4833
  %91 = sext i16 %90 to i32, !dbg !4832
  store i32 %91, ptr %13, align 4, !dbg !4834
  %92 = load ptr, ptr %9, align 8, !dbg !4835
  %93 = getelementptr inbounds nuw %struct.segment, ptr %92, i32 0, i32 1, !dbg !4836
  %94 = load i32, ptr %3, align 4, !dbg !4837
  %95 = sext i32 %94 to i64, !dbg !4835
  %96 = getelementptr inbounds [6 x i16], ptr %93, i64 0, i64 %95, !dbg !4835
  %97 = load i16, ptr %96, align 2, !dbg !4835
  %98 = sext i16 %97 to i64, !dbg !4838
  %99 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %98, !dbg !4838
  store ptr %99, ptr %10, align 8, !dbg !4839
  %100 = load ptr, ptr %9, align 8, !dbg !4840
  %101 = load ptr, ptr %10, align 8, !dbg !4841
  %102 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %100, ptr noundef %101), !dbg !4842
  store i32 %102, ptr %11, align 4, !dbg !4843
  %103 = load ptr, ptr %9, align 8, !dbg !4844
  %104 = load i32, ptr %3, align 4, !dbg !4845
  %105 = load ptr, ptr %10, align 8, !dbg !4846
  %106 = load i32, ptr %11, align 4, !dbg !4847
  %107 = load i32, ptr %12, align 4, !dbg !4848
  %108 = load i32, ptr %13, align 4, !dbg !4849
  %109 = sub nsw i32 %108, 1, !dbg !4850
  call void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef %103, i32 noundef %104, ptr noundef %105, i32 noundef %106, i32 noundef %107, i32 noundef %109), !dbg !4851
  %110 = load ptr, ptr %9, align 8, !dbg !4852
  %111 = getelementptr inbounds nuw %struct.segment, ptr %110, i32 0, i32 0, !dbg !4853
  %112 = load i32, ptr %3, align 4, !dbg !4854
  %113 = sext i32 %112 to i64, !dbg !4852
  %114 = getelementptr inbounds [6 x %struct.side], ptr %111, i64 0, i64 %113, !dbg !4852
  %115 = getelementptr inbounds nuw %struct.side, ptr %114, i32 0, i32 2, !dbg !4855
  %116 = load i16, ptr %115, align 2, !dbg !4855
  %117 = sext i16 %116 to i64, !dbg !4856
  %118 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %117, !dbg !4856
  %119 = getelementptr inbounds nuw %struct.wall, ptr %118, i32 0, i32 5, !dbg !4857
  %120 = load i8, ptr %119, align 1, !dbg !4858
  %121 = zext i8 %120 to i32, !dbg !4858
  %122 = or i32 %121, 1, !dbg !4858
  %123 = trunc i32 %122 to i8, !dbg !4858
  store i8 %123, ptr %119, align 1, !dbg !4858
  %124 = load ptr, ptr %10, align 8, !dbg !4859
  %125 = getelementptr inbounds nuw %struct.segment, ptr %124, i32 0, i32 0, !dbg !4860
  %126 = load i32, ptr %11, align 4, !dbg !4861
  %127 = sext i32 %126 to i64, !dbg !4859
  %128 = getelementptr inbounds [6 x %struct.side], ptr %125, i64 0, i64 %127, !dbg !4859
  %129 = getelementptr inbounds nuw %struct.side, ptr %128, i32 0, i32 2, !dbg !4862
  %130 = load i16, ptr %129, align 2, !dbg !4862
  %131 = sext i16 %130 to i64, !dbg !4863
  %132 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %131, !dbg !4863
  %133 = getelementptr inbounds nuw %struct.wall, ptr %132, i32 0, i32 5, !dbg !4864
  %134 = load i8, ptr %133, align 1, !dbg !4865
  %135 = zext i8 %134 to i32, !dbg !4865
  %136 = or i32 %135, 1, !dbg !4865
  %137 = trunc i32 %136 to i8, !dbg !4865
  store i8 %137, ptr %133, align 1, !dbg !4865
  br label %138, !dbg !4866

138:                                              ; preds = %70, %63
  %139 = load i32, ptr %1, align 4, !dbg !4867
  %140 = sext i32 %139 to i64, !dbg !4868
  %141 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %140, !dbg !4868
  %142 = getelementptr inbounds nuw %struct.expl_wall, ptr %141, i32 0, i32 2, !dbg !4869
  %143 = load i32, ptr %142, align 4, !dbg !4869
  %144 = call noundef i32 @_Z6fixdivii(i32 noundef %143, i32 noundef 65536), !dbg !4870
  store i32 %144, ptr %5, align 4, !dbg !4871
  %145 = load i32, ptr %4, align 4, !dbg !4872
  %146 = load i32, ptr %4, align 4, !dbg !4873
  %147 = call noundef i32 @_Z6fixmulii(i32 noundef %145, i32 noundef %146), !dbg !4874
  %148 = mul nsw i32 32, %147, !dbg !4875
  %149 = call noundef i32 @_Z3f2ii(i32 noundef %148), !dbg !4876
  store i32 %149, ptr %6, align 4, !dbg !4877
  %150 = load i32, ptr %5, align 4, !dbg !4878
  %151 = load i32, ptr %5, align 4, !dbg !4879
  %152 = call noundef i32 @_Z6fixmulii(i32 noundef %150, i32 noundef %151), !dbg !4880
  %153 = mul nsw i32 32, %152, !dbg !4881
  %154 = call noundef i32 @_Z3f2ii(i32 noundef %153), !dbg !4882
  store i32 %154, ptr %7, align 4, !dbg !4883
  %155 = load i32, ptr %6, align 4, !dbg !4884
  store i32 %155, ptr %8, align 4, !dbg !4886
  br label %156, !dbg !4887

156:                                              ; preds = %233, %138
  %157 = load i32, ptr %8, align 4, !dbg !4888
  %158 = load i32, ptr %7, align 4, !dbg !4890
  %159 = icmp slt i32 %157, %158, !dbg !4891
  br i1 %159, label %160, label %236, !dbg !4892

160:                                              ; preds = %156
    #dbg_declare(ptr %14, !4893, !DIExpression(), !4896)
    #dbg_declare(ptr %15, !4897, !DIExpression(), !4898)
    #dbg_declare(ptr %16, !4899, !DIExpression(), !4900)
    #dbg_declare(ptr %17, !4901, !DIExpression(), !4902)
    #dbg_declare(ptr %18, !4903, !DIExpression(), !4904)
    #dbg_declare(ptr %19, !4905, !DIExpression(), !4906)
    #dbg_declare(ptr %20, !4907, !DIExpression(), !4908)
    #dbg_declare(ptr %21, !4909, !DIExpression(), !4910)
  %161 = getelementptr inbounds [4 x i16], ptr %14, i64 0, i64 0, !dbg !4911
  %162 = load i32, ptr %2, align 4, !dbg !4912
  %163 = load i32, ptr %3, align 4, !dbg !4913
  call void @_Z14get_side_vertsPsii(ptr noundef %161, i32 noundef %162, i32 noundef %163), !dbg !4914
  %164 = getelementptr inbounds [4 x i16], ptr %14, i64 0, i64 0, !dbg !4915
  %165 = load i16, ptr %164, align 2, !dbg !4915
  %166 = sext i16 %165 to i64, !dbg !4916
  %167 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %166, !dbg !4916
  store ptr %167, ptr %15, align 8, !dbg !4917
  %168 = getelementptr inbounds [4 x i16], ptr %14, i64 0, i64 1, !dbg !4918
  %169 = load i16, ptr %168, align 2, !dbg !4918
  %170 = sext i16 %169 to i64, !dbg !4919
  %171 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %170, !dbg !4919
  store ptr %171, ptr %16, align 8, !dbg !4920
  %172 = getelementptr inbounds [4 x i16], ptr %14, i64 0, i64 2, !dbg !4921
  %173 = load i16, ptr %172, align 2, !dbg !4921
  %174 = sext i16 %173 to i64, !dbg !4922
  %175 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %174, !dbg !4922
  store ptr %175, ptr %17, align 8, !dbg !4923
  %176 = load ptr, ptr %15, align 8, !dbg !4924
  %177 = load ptr, ptr %16, align 8, !dbg !4925
  %178 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %18, ptr noundef %176, ptr noundef %177), !dbg !4926
  %179 = load ptr, ptr %17, align 8, !dbg !4927
  %180 = load ptr, ptr %16, align 8, !dbg !4928
  %181 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %19, ptr noundef %179, ptr noundef %180), !dbg !4929
  %182 = load ptr, ptr %16, align 8, !dbg !4930
  %183 = call noundef i32 @_Z6P_Randv(), !dbg !4931
  %184 = mul nsw i32 %183, 2, !dbg !4932
  %185 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %20, ptr noundef %182, ptr noundef %18, i32 noundef %184), !dbg !4933
  %186 = call noundef i32 @_Z6P_Randv(), !dbg !4934
  %187 = mul nsw i32 %186, 2, !dbg !4935
  %188 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %20, ptr noundef %19, i32 noundef %187), !dbg !4936
  %189 = load i32, ptr %8, align 4, !dbg !4937
  %190 = mul nsw i32 353894, %189, !dbg !4938
  %191 = sdiv i32 %190, 32, !dbg !4939
  %192 = add nsw i32 176947, %191, !dbg !4940
  store i32 %192, ptr %21, align 4, !dbg !4941
  %193 = load i32, ptr %2, align 4, !dbg !4942
  %194 = sext i32 %193 to i64, !dbg !4943
  %195 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %194, !dbg !4943
  %196 = getelementptr inbounds nuw %struct.segment, ptr %195, i32 0, i32 0, !dbg !4944
  %197 = load i32, ptr %3, align 4, !dbg !4945
  %198 = sext i32 %197 to i64, !dbg !4943
  %199 = getelementptr inbounds [6 x %struct.side], ptr %196, i64 0, i64 %198, !dbg !4943
  %200 = getelementptr inbounds nuw %struct.side, ptr %199, i32 0, i32 6, !dbg !4946
  %201 = getelementptr inbounds [2 x %struct.vms_vector], ptr %200, i64 0, i64 0, !dbg !4943
  %202 = load i32, ptr %21, align 4, !dbg !4947
  %203 = load i32, ptr %8, align 4, !dbg !4948
  %204 = sub nsw i32 32, %203, !dbg !4949
  %205 = mul nsw i32 %202, %204, !dbg !4950
  %206 = sdiv i32 %205, 32, !dbg !4951
  %207 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %20, ptr noundef %201, i32 noundef %206), !dbg !4952
  %208 = load i32, ptr %8, align 4, !dbg !4953
  %209 = and i32 %208, 3, !dbg !4955
  %210 = icmp ne i32 %209, 0, !dbg !4953
  br i1 %210, label %211, label %220, !dbg !4953

211:                                              ; preds = %160
  %212 = load i32, ptr %1, align 4, !dbg !4956
  %213 = sext i32 %212 to i64, !dbg !4957
  %214 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %213, !dbg !4957
  %215 = getelementptr inbounds nuw %struct.expl_wall, ptr %214, i32 0, i32 0, !dbg !4958
  %216 = load i32, ptr %215, align 4, !dbg !4958
  %217 = trunc i32 %216 to i16, !dbg !4957
  %218 = load i32, ptr %21, align 4, !dbg !4959
  %219 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %217, ptr noundef %20, i32 noundef %218, i32 noundef 2), !dbg !4960
  br label %232, !dbg !4960

220:                                              ; preds = %160
  %221 = load i32, ptr %1, align 4, !dbg !4961
  %222 = sext i32 %221 to i64, !dbg !4962
  %223 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %222, !dbg !4962
  %224 = getelementptr inbounds nuw %struct.expl_wall, ptr %223, i32 0, i32 0, !dbg !4963
  %225 = load i32, ptr %224, align 4, !dbg !4963
  %226 = trunc i32 %225 to i16, !dbg !4962
  %227 = load i32, ptr %21, align 4, !dbg !4964
  %228 = call noundef i32 @_Z3i2fi(i32 noundef 4), !dbg !4965
  %229 = call noundef i32 @_Z3i2fi(i32 noundef 20), !dbg !4966
  %230 = call noundef i32 @_Z3i2fi(i32 noundef 50), !dbg !4967
  %231 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef null, i16 noundef signext %226, ptr noundef %20, i32 noundef %227, i32 noundef 2, i32 noundef %228, i32 noundef %229, i32 noundef %230, i32 noundef -1), !dbg !4968
  br label %232

232:                                              ; preds = %220, %211
  br label %233, !dbg !4969

233:                                              ; preds = %232
  %234 = load i32, ptr %8, align 4, !dbg !4970
  %235 = add nsw i32 %234, 1, !dbg !4970
  store i32 %235, ptr %8, align 4, !dbg !4970
  br label %156, !dbg !4971, !llvm.loop !4972

236:                                              ; preds = %156
  %237 = load i32, ptr %1, align 4, !dbg !4974
  %238 = sext i32 %237 to i64, !dbg !4976
  %239 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %238, !dbg !4976
  %240 = getelementptr inbounds nuw %struct.expl_wall, ptr %239, i32 0, i32 2, !dbg !4977
  %241 = load i32, ptr %240, align 4, !dbg !4977
  %242 = icmp sge i32 %241, 65536, !dbg !4978
  br i1 %242, label %243, label %248, !dbg !4978

243:                                              ; preds = %236
  %244 = load i32, ptr %1, align 4, !dbg !4979
  %245 = sext i32 %244 to i64, !dbg !4980
  %246 = getelementptr inbounds [10 x %struct.expl_wall], ptr @expl_wall_list, i64 0, i64 %245, !dbg !4980
  %247 = getelementptr inbounds nuw %struct.expl_wall, ptr %246, i32 0, i32 0, !dbg !4981
  store i32 -1, ptr %247, align 4, !dbg !4982
  br label %248, !dbg !4980

248:                                              ; preds = %243, %236
  br label %249, !dbg !4983

249:                                              ; preds = %248, %25
  br label %250, !dbg !4984

250:                                              ; preds = %249
  %251 = load i32, ptr %1, align 4, !dbg !4985
  %252 = add nsw i32 %251, 1, !dbg !4985
  store i32 %252, ptr %1, align 4, !dbg !4985
  br label %22, !dbg !4986, !llvm.loop !4987

253:                                              ; preds = %22
  ret void, !dbg !4989
}

declare noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef, ptr noundef) #1

declare void @_Z17wall_set_tmap_numP7segmentiS0_iii(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z14get_side_vertsPsii(ptr noundef, i32 noundef, i32 noundef) #1

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22drop_afterburner_blobsP6objectiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !4990 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !4993, !DIExpression(), !4994)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !4995, !DIExpression(), !4996)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !4997, !DIExpression(), !4998)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !4999, !DIExpression(), !5000)
    #dbg_declare(ptr %9, !5001, !DIExpression(), !5002)
    #dbg_declare(ptr %10, !5003, !DIExpression(), !5004)
    #dbg_declare(ptr %11, !5005, !DIExpression(), !5006)
  %13 = load ptr, ptr %5, align 8, !dbg !5007
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 11, !dbg !5008
  %15 = load ptr, ptr %5, align 8, !dbg !5009
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 12, !dbg !5010
  %17 = getelementptr inbounds nuw %struct.vms_matrix, ptr %16, i32 0, i32 2, !dbg !5011
  %18 = load ptr, ptr %5, align 8, !dbg !5012
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 13, !dbg !5013
  %20 = load i32, ptr %19, align 4, !dbg !5013
  %21 = sub nsw i32 0, %20, !dbg !5014
  %22 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %9, ptr noundef %14, ptr noundef %17, i32 noundef %21), !dbg !5015
  %23 = load ptr, ptr %5, align 8, !dbg !5016
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 12, !dbg !5017
  %25 = getelementptr inbounds nuw %struct.vms_matrix, ptr %24, i32 0, i32 0, !dbg !5018
  %26 = load ptr, ptr %5, align 8, !dbg !5019
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 13, !dbg !5020
  %28 = load i32, ptr %27, align 4, !dbg !5020
  %29 = sub nsw i32 0, %28, !dbg !5021
  %30 = sdiv i32 %29, 4, !dbg !5022
  %31 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %9, ptr noundef %25, i32 noundef %30), !dbg !5023
  %32 = load ptr, ptr %5, align 8, !dbg !5024
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 12, !dbg !5025
  %34 = getelementptr inbounds nuw %struct.vms_matrix, ptr %33, i32 0, i32 0, !dbg !5026
  %35 = load ptr, ptr %5, align 8, !dbg !5027
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 13, !dbg !5028
  %37 = load i32, ptr %36, align 4, !dbg !5028
  %38 = sdiv i32 %37, 2, !dbg !5029
  %39 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %10, ptr noundef %9, ptr noundef %34, i32 noundef %38), !dbg !5030
  %40 = load i32, ptr %6, align 4, !dbg !5031
  %41 = icmp eq i32 %40, 1, !dbg !5033
  br i1 %41, label %42, label %44, !dbg !5033

42:                                               ; preds = %4
  %43 = call noundef ptr @_Z10vm_vec_avgP10vms_vectorS0_S0_(ptr noundef %9, ptr noundef %9, ptr noundef %10), !dbg !5034
  br label %44, !dbg !5034

44:                                               ; preds = %42, %4
  %45 = load ptr, ptr %5, align 8, !dbg !5035
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 9, !dbg !5036
  %47 = load i16, ptr %46, align 2, !dbg !5036
  %48 = sext i16 %47 to i32, !dbg !5035
  %49 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %9, i32 noundef %48), !dbg !5037
  store i32 %49, ptr %11, align 4, !dbg !5038
  %50 = load i32, ptr %11, align 4, !dbg !5039
  %51 = icmp ne i32 %50, -1, !dbg !5041
  br i1 %51, label %52, label %57, !dbg !5041

52:                                               ; preds = %44
  %53 = load i32, ptr %11, align 4, !dbg !5042
  %54 = trunc i32 %53 to i16, !dbg !5042
  %55 = load i32, ptr %7, align 4, !dbg !5043
  %56 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %54, ptr noundef %9, i32 noundef %55, i32 noundef 95), !dbg !5044
  br label %57, !dbg !5044

57:                                               ; preds = %52, %44
  %58 = load i32, ptr %6, align 4, !dbg !5045
  %59 = icmp sgt i32 %58, 1, !dbg !5047
  br i1 %59, label %60, label %81, !dbg !5047

60:                                               ; preds = %57
  %61 = load ptr, ptr %5, align 8, !dbg !5048
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 9, !dbg !5050
  %63 = load i16, ptr %62, align 2, !dbg !5050
  %64 = sext i16 %63 to i32, !dbg !5048
  %65 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %10, i32 noundef %64), !dbg !5051
  store i32 %65, ptr %11, align 4, !dbg !5052
  %66 = load i32, ptr %11, align 4, !dbg !5053
  %67 = icmp ne i32 %66, -1, !dbg !5055
  br i1 %67, label %68, label %80, !dbg !5055

68:                                               ; preds = %60
    #dbg_declare(ptr %12, !5056, !DIExpression(), !5058)
  %69 = load i32, ptr %11, align 4, !dbg !5059
  %70 = trunc i32 %69 to i16, !dbg !5059
  %71 = load i32, ptr %7, align 4, !dbg !5060
  %72 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %70, ptr noundef %10, i32 noundef %71, i32 noundef 95), !dbg !5061
  store ptr %72, ptr %12, align 8, !dbg !5062
  %73 = load i32, ptr %8, align 4, !dbg !5063
  %74 = icmp ne i32 %73, -1, !dbg !5065
  br i1 %74, label %75, label %79, !dbg !5065

75:                                               ; preds = %68
  %76 = load i32, ptr %8, align 4, !dbg !5066
  %77 = load ptr, ptr %12, align 8, !dbg !5067
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 20, !dbg !5068
  store i32 %76, ptr %78, align 4, !dbg !5069
  br label %79, !dbg !5067

79:                                               ; preds = %75, %68
  br label %80, !dbg !5070

80:                                               ; preds = %79, %60
  br label %81, !dbg !5071

81:                                               ; preds = %80, %57
  ret void, !dbg !5072
}

declare noundef ptr @_Z10vm_vec_avgP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !5073 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5083, !DIExpression(), !5084)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5085, !DIExpression(), !5086)
    #dbg_declare(ptr %3, !5087, !DIExpression(), !5088)
  %6 = load ptr, ptr %5, align 8, !dbg !5089
  %7 = load ptr, ptr %4, align 8, !dbg !5090
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !5091
  br i1 %8, label %9, label %11, !dbg !5091

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !5092
  br label %13, !dbg !5091

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !5093
  br label %13, !dbg !5091

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !5091
  ret ptr %14, !dbg !5094
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #2 !dbg !5095 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5103, !DIExpression(), !5105)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5106, !DIExpression(), !5107)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !5108, !DIExpression(), !5109)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !5110
  %9 = load i32, ptr %8, align 4, !dbg !5110
  %10 = load ptr, ptr %6, align 8, !dbg !5111
  %11 = load i32, ptr %10, align 4, !dbg !5111
  %12 = icmp slt i32 %9, %11, !dbg !5112
  ret i1 %12, !dbg !5113
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!1423, !1424, !1425, !1426, !1427, !1428, !1429}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1430}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Flash_effect", scope: !2, file: !24, line: 57, type: !14, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !21, imports: !171, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/fireball.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "38b828dcc53b3e3e5175310c6cb34d03")
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
!21 = !{!0, !22, !25, !27, !34, !39, !44, !49, !54, !59, !64, !69, !74, !79, !84, !89, !91, !93, !98, !103, !108, !113, !118, !123, !125, !130, !132, !137, !142, !144, !149, !151, !153, !163, !168}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "PK1", scope: !2, file: !24, line: 60, type: !7, isLocal: false, isDefinition: true)
!24 = !DIFile(filename: "main_d2/fireball.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "38b828dcc53b3e3e5175310c6cb34d03")
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "PK2", scope: !2, file: !24, line: 60, type: !7, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !24, line: 72, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 424, elements: !32)
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !{!33}
!33 = !DISubrange(count: 53)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(scope: null, file: !24, line: 190, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 56, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 7)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(scope: null, file: !24, line: 222, type: !41, isLocal: true, isDefinition: true)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 208, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 26)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(scope: null, file: !24, line: 297, type: !46, isLocal: true, isDefinition: true)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 144, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 18)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(scope: null, file: !24, line: 297, type: !51, isLocal: true, isDefinition: true)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 464, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 58)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(scope: null, file: !24, line: 345, type: !56, isLocal: true, isDefinition: true)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 480, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 60)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(scope: null, file: !24, line: 352, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 368, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 46)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !24, line: 360, type: !66, isLocal: true, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 16)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !24, line: 517, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 296, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 37)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !24, line: 537, type: !76, isLocal: true, isDefinition: true)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 168, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 21)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(scope: null, file: !24, line: 570, type: !81, isLocal: true, isDefinition: true)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 32, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 4)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(scope: null, file: !24, line: 577, type: !86, isLocal: true, isDefinition: true)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 16, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 2)
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(scope: null, file: !24, line: 583, type: !86, isLocal: true, isDefinition: true)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(scope: null, file: !24, line: 594, type: !86, isLocal: true, isDefinition: true)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(scope: null, file: !24, line: 603, type: !95, isLocal: true, isDefinition: true)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 80, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 10)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(scope: null, file: !24, line: 606, type: !100, isLocal: true, isDefinition: true)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 552, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 69)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression())
!104 = distinct !DIGlobalVariable(scope: null, file: !24, line: 723, type: !105, isLocal: true, isDefinition: true)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 448, elements: !106)
!106 = !{!107}
!107 = !DISubrange(count: 56)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(scope: null, file: !24, line: 776, type: !110, isLocal: true, isDefinition: true)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 584, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 73)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(scope: null, file: !24, line: 840, type: !115, isLocal: true, isDefinition: true)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 432, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 54)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(scope: null, file: !24, line: 916, type: !120, isLocal: true, isDefinition: true)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 496, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 62)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(scope: null, file: !24, line: 964, type: !61, isLocal: true, isDefinition: true)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(scope: null, file: !24, line: 982, type: !127, isLocal: true, isDefinition: true)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 176, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 22)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(scope: null, file: !24, line: 994, type: !127, isLocal: true, isDefinition: true)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1073, type: !134, isLocal: true, isDefinition: true)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 248, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 31)
!137 = !DIGlobalVariableExpression(var: !138, expr: !DIExpression())
!138 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1122, type: !139, isLocal: true, isDefinition: true)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 376, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 47)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1178, type: !134, isLocal: true, isDefinition: true)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1190, type: !146, isLocal: true, isDefinition: true)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 272, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 34)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1207, type: !139, isLocal: true, isDefinition: true)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1288, type: !51, isLocal: true, isDefinition: true)
!153 = !DIGlobalVariableExpression(var: !154, expr: !DIExpression())
!154 = distinct !DIGlobalVariable(name: "expl_wall_list", scope: !2, file: !24, line: 1307, type: !155, isLocal: false, isDefinition: true)
!155 = !DICompositeType(tag: DW_TAG_array_type, baseType: !156, size: 960, elements: !96)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "expl_wall", file: !157, line: 26, baseType: !158)
!157 = !DIFile(filename: "main_d2/fireball.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "9584ecc0c1760441442311437f63115b")
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "expl_wall", file: !157, line: 22, size: 96, flags: DIFlagTypePassByValue, elements: !159, identifier: "_ZTS9expl_wall")
!159 = !{!160, !161, !162}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !158, file: !157, line: 24, baseType: !7, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "sidenum", scope: !158, file: !157, line: 24, baseType: !7, size: 32, offset: 32)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !158, file: !157, line: 25, baseType: !14, size: 32, offset: 64)
!163 = !DIGlobalVariableExpression(var: !164, expr: !DIExpression())
!164 = distinct !DIGlobalVariable(scope: null, file: !24, line: 1328, type: !165, isLocal: true, isDefinition: true)
!165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 360, elements: !166)
!166 = !{!167}
!167 = !DISubrange(count: 45)
!168 = !DIGlobalVariableExpression(var: !169, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!169 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !15, line: 18, type: !170, isLocal: true, isDefinition: true)
!170 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!171 = !{!172, !179, !183, !184, !185, !189, !193, !197, !201, !204, !206, !208, !210, !212, !214, !216, !218, !220, !222, !224, !226, !228, !230, !232, !234, !240, !244, !247, !250, !255, !261, !263, !265, !267, !269, !271, !273, !275, !277, !279, !281, !283, !285, !287, !292, !297, !302, !307, !309, !312, !314, !316, !318, !320, !322, !324, !326, !328, !330, !334, !339, !343, !345, !349, !353, !366, !382, !383, !438, !447, !449, !457, !463, !467, !471, !473, !477, !481, !485, !489, !493, !497, !499, !501, !505, !511, !516, !520, !524, !528, !532, !536, !540, !544, !546, !548, !552, !554, !558, !562, !567, !569, !571, !573, !577, !581, !585, !587, !591, !593, !595, !597, !599, !605, !609, !611, !617, !622, !626, !630, !635, !640, !644, !648, !652, !656, !658, !660, !668, !670, !674, !678, !680, !682, !686, !690, !694, !696, !700, !705, !709, !713, !715, !717, !719, !721, !723, !725, !729, !733, !741, !743, !745, !747, !753, !755, !756, !757, !758, !761, !763, !768, !772, !774, !776, !780, !782, !784, !786, !788, !790, !792, !794, !799, !803, !805, !807, !808, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !849, !851, !853, !855, !859, !861, !865, !867, !869, !871, !873, !877, !879, !883, !887, !889, !891, !895, !897, !901, !903, !905, !909, !911, !913, !915, !917, !919, !921, !925, !927, !929, !931, !933, !935, !937, !939, !943, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !977, !979, !981, !983, !985, !989, !991, !993, !995, !999, !1001, !1005, !1007, !1009, !1011, !1013, !1017, !1019, !1023, !1025, !1027, !1029, !1031, !1035, !1037, !1039, !1043, !1045, !1047, !1049, !1054, !1059, !1063, !1064, !1068, !1072, !1077, !1082, !1086, !1092, !1096, !1098, !1102, !1110, !1116, !1122, !1124, !1128, !1132, !1136, !1141, !1145, !1149, !1153, !1157, !1161, !1165, !1169, !1173, !1178, !1182, !1186, !1190, !1195, !1200, !1204, !1206, !1210, !1212, !1219, !1223, !1224, !1228, !1232, !1236, !1240, !1242, !1246, !1250, !1254, !1258, !1262, !1264, !1266, !1268, !1270, !1271, !1275, !1277, !1281, !1285, !1289, !1291, !1295, !1299, !1303, !1309, !1311, !1315, !1319, !1323, !1325, !1329, !1333, !1337, !1339, !1341, !1343, !1347, !1351, !1356, !1360, !1366, !1370, !1374, !1376, !1378, !1380, !1384, !1388, !1392, !1394, !1396, !1400, !1404, !1406, !1410, !1414, !1417, !1419, !1421}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !175, file: !178, line: 158)
!173 = !DINamespace(name: "__1", scope: !174, exportSymbols: true)
!174 = !DINamespace(name: "std", scope: null)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !176, line: 30, baseType: !177)
!176 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!177 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!178 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !180, file: !178, line: 159)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !181, line: 30, baseType: !182)
!181 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!182 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !16, file: !178, line: 160)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !18, file: !178, line: 161)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !186, file: !178, line: 163)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !187, line: 31, baseType: !188)
!187 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!188 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !190, file: !178, line: 164)
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !191, line: 31, baseType: !192)
!191 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!192 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !194, file: !178, line: 165)
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !195, line: 31, baseType: !196)
!195 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!196 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !198, file: !178, line: 166)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !199, line: 31, baseType: !200)
!199 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!200 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !202, file: !178, line: 168)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !203, line: 29, baseType: !175)
!203 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !205, file: !178, line: 169)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !203, line: 30, baseType: !180)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !207, file: !178, line: 170)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !203, line: 31, baseType: !16)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !209, file: !178, line: 171)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !203, line: 32, baseType: !18)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !211, file: !178, line: 173)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !203, line: 33, baseType: !186)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !213, file: !178, line: 174)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !203, line: 34, baseType: !190)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !215, file: !178, line: 175)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !203, line: 35, baseType: !194)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !217, file: !178, line: 176)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !203, line: 36, baseType: !198)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !219, file: !178, line: 178)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !203, line: 40, baseType: !175)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !221, file: !178, line: 179)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !203, line: 41, baseType: !180)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !223, file: !178, line: 180)
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !203, line: 42, baseType: !16)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !225, file: !178, line: 181)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !203, line: 43, baseType: !18)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !227, file: !178, line: 183)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !203, line: 44, baseType: !186)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !229, file: !178, line: 184)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !203, line: 45, baseType: !190)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !231, file: !178, line: 185)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !203, line: 46, baseType: !194)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !233, file: !178, line: 186)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !203, line: 47, baseType: !198)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !235, file: !178, line: 188)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !236, line: 32, baseType: !237)
!236 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !238, line: 40, baseType: !239)
!238 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!239 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !241, file: !178, line: 189)
!241 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !242, line: 34, baseType: !243)
!242 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!243 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !245, file: !178, line: 191)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !246, line: 32, baseType: !239)
!246 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !248, file: !178, line: 192)
!248 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !249, line: 32, baseType: !243)
!249 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !251, file: !254, line: 22)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !252, line: 16, baseType: !253)
!252 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!253 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!254 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !256, file: !260, line: 113)
!256 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !257, file: !257, line: 217, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!258 = !DISubroutineType(types: !259)
!259 = !{!7, !7}
!260 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !262, file: !260, line: 114)
!262 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !257, file: !257, line: 223, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !264, file: !260, line: 115)
!264 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !257, file: !257, line: 229, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !266, file: !260, line: 116)
!266 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !257, file: !257, line: 235, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !268, file: !260, line: 117)
!268 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !257, file: !257, line: 242, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !270, file: !260, line: 118)
!270 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !257, file: !257, line: 248, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !272, file: !260, line: 119)
!272 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !257, file: !257, line: 254, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !274, file: !260, line: 120)
!274 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !257, file: !257, line: 260, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !276, file: !260, line: 121)
!276 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !257, file: !257, line: 266, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !278, file: !260, line: 122)
!278 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !257, file: !257, line: 272, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !280, file: !260, line: 123)
!280 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !257, file: !257, line: 278, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !282, file: !260, line: 124)
!282 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !257, file: !257, line: 285, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !284, file: !260, line: 125)
!284 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !257, file: !257, line: 297, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !286, file: !260, line: 126)
!286 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !257, file: !257, line: 303, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !288, file: !291, line: 75)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !289, line: 32, baseType: !290)
!289 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !238, line: 111, baseType: !7)
!291 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !293, file: !291, line: 76)
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !294, line: 32, baseType: !295)
!294 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !296, line: 44, baseType: !7)
!296 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !298, file: !291, line: 77)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !299, line: 32, baseType: !300)
!299 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !296, line: 46, baseType: !301)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !238, line: 36, baseType: !196)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !303, file: !291, line: 78)
!303 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !304, file: !304, line: 84, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!305 = !DISubroutineType(types: !306)
!306 = !{!7, !288}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !308, file: !291, line: 79)
!308 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !304, file: !304, line: 90, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !310, file: !291, line: 80)
!310 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !311, file: !311, line: 53, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!311 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !313, file: !291, line: 81)
!313 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !304, file: !304, line: 96, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !315, file: !291, line: 82)
!315 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !304, file: !304, line: 108, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !317, file: !291, line: 83)
!317 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !304, file: !304, line: 114, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !319, file: !291, line: 84)
!319 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !304, file: !304, line: 120, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !321, file: !291, line: 85)
!321 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !304, file: !304, line: 126, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !323, file: !291, line: 86)
!323 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !304, file: !304, line: 132, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !325, file: !291, line: 87)
!325 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !304, file: !304, line: 138, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !327, file: !291, line: 88)
!327 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !304, file: !304, line: 144, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !329, file: !291, line: 89)
!329 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !304, file: !304, line: 150, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !331, file: !291, line: 90)
!331 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !304, file: !304, line: 102, type: !332, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DISubroutineType(types: !333)
!333 = !{!7, !288, !298}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !335, file: !291, line: 91)
!335 = !DISubprogram(name: "wctype", scope: !304, file: !304, line: 190, type: !336, flags: DIFlagPrototyped, spFlags: 0)
!336 = !DISubroutineType(types: !337)
!337 = !{!298, !338}
!338 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !340, file: !291, line: 92)
!340 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !304, file: !304, line: 156, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DISubroutineType(types: !342)
!342 = !{!288, !288}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !344, file: !291, line: 93)
!344 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !304, file: !304, line: 162, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !346, file: !291, line: 94)
!346 = !DISubprogram(name: "towctrans", scope: !311, file: !311, line: 124, type: !347, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DISubroutineType(types: !348)
!348 = !{!288, !288, !293}
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !350, file: !291, line: 95)
!350 = !DISubprogram(name: "wctrans", scope: !311, file: !311, line: 126, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{!293, !338}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !354, file: !365, line: 133)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !355, line: 32, baseType: !356)
!355 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !238, line: 72, baseType: !357)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !238, line: 70, baseType: !358)
!358 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !238, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !359, identifier: "_ZTS11__mbstate_t")
!359 = !{!360, !364}
!360 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !358, file: !238, line: 68, baseType: !361, size: 1024)
!361 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 1024, elements: !362)
!362 = !{!363}
!363 = !DISubrange(count: 128)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !358, file: !238, line: 69, baseType: !20, size: 64)
!365 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !367, file: !365, line: 134)
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !368, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !369, identifier: "_ZTS2tm")
!368 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!369 = !{!370, !371, !372, !373, !374, !375, !376, !377, !378, !379, !380}
!370 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !367, file: !368, line: 79, baseType: !7, size: 32)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !367, file: !368, line: 80, baseType: !7, size: 32, offset: 32)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !367, file: !368, line: 81, baseType: !7, size: 32, offset: 64)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !367, file: !368, line: 82, baseType: !7, size: 32, offset: 96)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !367, file: !368, line: 83, baseType: !7, size: 32, offset: 128)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !367, file: !368, line: 84, baseType: !7, size: 32, offset: 160)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !367, file: !368, line: 85, baseType: !7, size: 32, offset: 192)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !367, file: !368, line: 86, baseType: !7, size: 32, offset: 224)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !367, file: !368, line: 87, baseType: !7, size: 32, offset: 256)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !367, file: !368, line: 88, baseType: !239, size: 64, offset: 320)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !367, file: !368, line: 89, baseType: !381, size: 64, offset: 384)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !288, file: !365, line: 135)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !384, file: !365, line: 136)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !385, line: 162, baseType: !386)
!385 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!386 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !385, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !387, identifier: "_ZTS7__sFILE")
!387 = !{!388, !390, !391, !392, !393, !394, !399, !400, !402, !406, !410, !418, !422, !423, !426, !427, !431, !435, !436, !437}
!388 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !386, file: !385, line: 132, baseType: !389, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !386, file: !385, line: 133, baseType: !7, size: 32, offset: 64)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !386, file: !385, line: 134, baseType: !7, size: 32, offset: 96)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !386, file: !385, line: 135, baseType: !182, size: 16, offset: 128)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !386, file: !385, line: 136, baseType: !182, size: 16, offset: 144)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !386, file: !385, line: 137, baseType: !395, size: 128, offset: 192)
!395 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !385, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !396, identifier: "_ZTS6__sbuf")
!396 = !{!397, !398}
!397 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !395, file: !385, line: 98, baseType: !389, size: 64)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !395, file: !385, line: 99, baseType: !7, size: 32, offset: 64)
!399 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !386, file: !385, line: 138, baseType: !7, size: 32, offset: 320)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !386, file: !385, line: 141, baseType: !401, size: 64, offset: 384)
!401 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !386, file: !385, line: 142, baseType: !403, size: 64, offset: 448)
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64)
!404 = !DISubroutineType(types: !405)
!405 = !{!7, !401}
!406 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !386, file: !385, line: 143, baseType: !407, size: 64, offset: 512)
!407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !408, size: 64)
!408 = !DISubroutineType(types: !409)
!409 = !{!7, !401, !381, !7}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !386, file: !385, line: 144, baseType: !411, size: 64, offset: 576)
!411 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !412, size: 64)
!412 = !DISubroutineType(types: !413)
!413 = !{!414, !401, !414, !7}
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !385, line: 86, baseType: !415)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !416, line: 83, baseType: !417)
!416 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !238, line: 37, baseType: !20)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !386, file: !385, line: 145, baseType: !419, size: 64, offset: 640)
!419 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !420, size: 64)
!420 = !DISubroutineType(types: !421)
!421 = !{!7, !401, !338, !7}
!422 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !386, file: !385, line: 148, baseType: !395, size: 128, offset: 704)
!423 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !386, file: !385, line: 149, baseType: !424, size: 64, offset: 832)
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !425, size: 64)
!425 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !385, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!426 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !386, file: !385, line: 150, baseType: !7, size: 32, offset: 896)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !386, file: !385, line: 153, baseType: !428, size: 24, offset: 928)
!428 = !DICompositeType(tag: DW_TAG_array_type, baseType: !188, size: 24, elements: !429)
!429 = !{!430}
!430 = !DISubrange(count: 3)
!431 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !386, file: !385, line: 154, baseType: !432, size: 8, offset: 952)
!432 = !DICompositeType(tag: DW_TAG_array_type, baseType: !188, size: 8, elements: !433)
!433 = !{!434}
!434 = !DISubrange(count: 1)
!435 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !386, file: !385, line: 157, baseType: !395, size: 128, offset: 960)
!436 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !386, file: !385, line: 160, baseType: !7, size: 32, offset: 1088)
!437 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !386, file: !385, line: 161, baseType: !414, size: 64, offset: 1152)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !439, file: !365, line: 137)
!439 = !DISubprogram(name: "fwprintf", scope: !440, file: !440, line: 107, type: !441, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!441 = !DISubroutineType(types: !442)
!442 = !{!7, !443, !444, null}
!443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!445 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !446)
!446 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !448, file: !365, line: 138)
!448 = !DISubprogram(name: "fwscanf", scope: !440, file: !440, line: 108, type: !441, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !450, file: !365, line: 139)
!450 = !DISubprogram(name: "swprintf", scope: !440, file: !440, line: 120, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{!7, !453, !454, !444, null}
!453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !446, size: 64)
!454 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !455, line: 50, baseType: !456)
!455 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!456 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !238, line: 87, baseType: !243)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !458, file: !365, line: 140)
!458 = !DISubprogram(name: "vfwprintf", scope: !440, file: !440, line: 124, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{!7, !443, !444, !461}
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !238, line: 95, baseType: !462)
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !24, baseType: !381)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !464, file: !365, line: 141)
!464 = !DISubprogram(name: "vswprintf", scope: !440, file: !440, line: 126, type: !465, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DISubroutineType(types: !466)
!466 = !{!7, !453, !454, !444, !461}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !468, file: !365, line: 142)
!468 = !DISubprogram(name: "swscanf", scope: !440, file: !440, line: 122, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!7, !444, !444, null}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !472, file: !365, line: 143)
!472 = !DISubprogram(name: "vfwscanf", scope: !440, file: !440, line: 195, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !474, file: !365, line: 144)
!474 = !DISubprogram(name: "vswscanf", scope: !440, file: !440, line: 197, type: !475, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DISubroutineType(types: !476)
!476 = !{!7, !444, !444, !461}
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !478, file: !365, line: 145)
!478 = !DISubprogram(name: "fgetwc", scope: !440, file: !440, line: 100, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DISubroutineType(types: !480)
!480 = !{!288, !443}
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !482, file: !365, line: 146)
!482 = !DISubprogram(name: "fgetws", scope: !440, file: !440, line: 102, type: !483, flags: DIFlagPrototyped, spFlags: 0)
!483 = !DISubroutineType(types: !484)
!484 = !{!453, !453, !7, !443}
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !486, file: !365, line: 147)
!486 = !DISubprogram(name: "fputwc", scope: !440, file: !440, line: 104, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{!288, !446, !443}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !490, file: !365, line: 148)
!490 = !DISubprogram(name: "fputws", scope: !440, file: !440, line: 105, type: !491, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DISubroutineType(types: !492)
!492 = !{!7, !444, !443}
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !494, file: !365, line: 149)
!494 = !DISubprogram(name: "fwide", scope: !440, file: !440, line: 106, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!495 = !DISubroutineType(types: !496)
!496 = !{!7, !443, !7}
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !498, file: !365, line: 150)
!498 = !DISubprogram(name: "getwc", scope: !440, file: !440, line: 109, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !500, file: !365, line: 151)
!500 = !DISubprogram(name: "putwc", scope: !440, file: !440, line: 118, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !502, file: !365, line: 152)
!502 = !DISubprogram(name: "ungetwc", scope: !440, file: !440, line: 123, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!288, !288, !443}
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !506, file: !365, line: 153)
!506 = !DISubprogram(name: "wcstod", scope: !440, file: !440, line: 160, type: !507, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DISubroutineType(types: !508)
!508 = !{!509, !444, !510}
!509 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !453, size: 64)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !512, file: !365, line: 154)
!512 = !DISubprogram(name: "wcstof", scope: !440, file: !440, line: 200, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DISubroutineType(types: !514)
!514 = !{!515, !444, !510}
!515 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !517, file: !365, line: 155)
!517 = !DISubprogram(name: "wcstold", scope: !440, file: !440, line: 202, type: !518, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DISubroutineType(types: !519)
!519 = !{!253, !444, !510}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !521, file: !365, line: 156)
!521 = !DISubprogram(name: "wcstol", scope: !440, file: !440, line: 164, type: !522, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DISubroutineType(types: !523)
!523 = !{!239, !444, !510, !7}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !525, file: !365, line: 157)
!525 = !DISubprogram(name: "wcstoll", scope: !440, file: !440, line: 205, type: !526, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DISubroutineType(types: !527)
!527 = !{!20, !444, !510, !7}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !529, file: !365, line: 158)
!529 = !DISubprogram(name: "wcstoul", scope: !440, file: !440, line: 167, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DISubroutineType(types: !531)
!531 = !{!243, !444, !510, !7}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !533, file: !365, line: 159)
!533 = !DISubprogram(name: "wcstoull", scope: !440, file: !440, line: 207, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{!200, !444, !510, !7}
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !537, file: !365, line: 160)
!537 = !DISubprogram(name: "wcscpy", scope: !440, file: !440, line: 134, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DISubroutineType(types: !539)
!539 = !{!453, !453, !444}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !541, file: !365, line: 161)
!541 = !DISubprogram(name: "wcsncpy", scope: !440, file: !440, line: 148, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DISubroutineType(types: !543)
!543 = !{!453, !453, !444, !454}
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !545, file: !365, line: 162)
!545 = !DISubprogram(name: "wcscat", scope: !440, file: !440, line: 130, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !547, file: !365, line: 163)
!547 = !DISubprogram(name: "wcsncat", scope: !440, file: !440, line: 142, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !549, file: !365, line: 164)
!549 = !DISubprogram(name: "wcscmp", scope: !440, file: !440, line: 132, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!7, !444, !444}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !553, file: !365, line: 165)
!553 = !DISubprogram(name: "wcscoll", scope: !440, file: !440, line: 133, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !555, file: !365, line: 166)
!555 = !DISubprogram(name: "wcsncmp", scope: !440, file: !440, line: 145, type: !556, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DISubroutineType(types: !557)
!557 = !{!7, !444, !444, !454}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !559, file: !365, line: 167)
!559 = !DISubprogram(name: "wcsxfrm", scope: !440, file: !440, line: 157, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!560 = !DISubroutineType(types: !561)
!561 = !{!454, !453, !444, !454}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !563, file: !365, line: 168)
!563 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !564, file: !564, line: 147, type: !565, flags: DIFlagPrototyped, spFlags: 0)
!564 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!565 = !DISubroutineType(types: !566)
!566 = !{!453, !453, !446}
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !568, file: !365, line: 169)
!568 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !564, file: !564, line: 158, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !570, file: !365, line: 170)
!570 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !564, file: !564, line: 168, type: !565, flags: DIFlagPrototyped, spFlags: 0)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !572, file: !365, line: 171)
!572 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !564, file: !564, line: 179, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !574, file: !365, line: 172)
!574 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !564, file: !564, line: 190, type: !575, flags: DIFlagPrototyped, spFlags: 0)
!575 = !DISubroutineType(types: !576)
!576 = !{!453, !453, !446, !454}
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !578, file: !365, line: 173)
!578 = !DISubprogram(name: "wcscspn", scope: !440, file: !440, line: 136, type: !579, flags: DIFlagPrototyped, spFlags: 0)
!579 = !DISubroutineType(types: !580)
!580 = !{!454, !444, !444}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !582, file: !365, line: 174)
!582 = !DISubprogram(name: "wcslen", scope: !440, file: !440, line: 140, type: !583, flags: DIFlagPrototyped, spFlags: 0)
!583 = !DISubroutineType(types: !584)
!584 = !{!454, !444}
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !586, file: !365, line: 175)
!586 = !DISubprogram(name: "wcsspn", scope: !440, file: !440, line: 155, type: !579, flags: DIFlagPrototyped, spFlags: 0)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !588, file: !365, line: 176)
!588 = !DISubprogram(name: "wcstok", scope: !440, file: !440, line: 162, type: !589, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!453, !453, !444, !510}
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !592, file: !365, line: 177)
!592 = !DISubprogram(name: "wmemcmp", scope: !440, file: !440, line: 170, type: !556, flags: DIFlagPrototyped, spFlags: 0)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !594, file: !365, line: 178)
!594 = !DISubprogram(name: "wmemcpy", scope: !440, file: !440, line: 173, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !596, file: !365, line: 179)
!596 = !DISubprogram(name: "wmemmove", scope: !440, file: !440, line: 176, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !598, file: !365, line: 180)
!598 = !DISubprogram(name: "wmemset", scope: !440, file: !440, line: 179, type: !575, flags: DIFlagPrototyped, spFlags: 0)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !600, file: !365, line: 181)
!600 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !440, file: !440, line: 137, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!454, !453, !454, !444, !603}
!603 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !604, size: 64)
!604 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !367)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !606, file: !365, line: 182)
!606 = !DISubprogram(name: "btowc", scope: !440, file: !440, line: 99, type: !607, flags: DIFlagPrototyped, spFlags: 0)
!607 = !DISubroutineType(types: !608)
!608 = !{!288, !7}
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !610, file: !365, line: 183)
!610 = !DISubprogram(name: "wctob", scope: !440, file: !440, line: 159, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !612, file: !365, line: 184)
!612 = !DISubprogram(name: "mbsinit", scope: !440, file: !440, line: 115, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!7, !615}
!615 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !616, size: 64)
!616 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !354)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !618, file: !365, line: 185)
!618 = !DISubprogram(name: "mbrlen", scope: !440, file: !440, line: 111, type: !619, flags: DIFlagPrototyped, spFlags: 0)
!619 = !DISubroutineType(types: !620)
!620 = !{!454, !338, !454, !621}
!621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !623, file: !365, line: 186)
!623 = !DISubprogram(name: "mbrtowc", scope: !440, file: !440, line: 113, type: !624, flags: DIFlagPrototyped, spFlags: 0)
!624 = !DISubroutineType(types: !625)
!625 = !{!454, !453, !338, !454, !621}
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !627, file: !365, line: 187)
!627 = !DISubprogram(name: "wcrtomb", scope: !440, file: !440, line: 129, type: !628, flags: DIFlagPrototyped, spFlags: 0)
!628 = !DISubroutineType(types: !629)
!629 = !{!454, !381, !446, !621}
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !631, file: !365, line: 188)
!631 = !DISubprogram(name: "mbsrtowcs", scope: !440, file: !440, line: 116, type: !632, flags: DIFlagPrototyped, spFlags: 0)
!632 = !DISubroutineType(types: !633)
!633 = !{!454, !453, !634, !454, !621}
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !636, file: !365, line: 189)
!636 = !DISubprogram(name: "wcsrtombs", scope: !440, file: !440, line: 153, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DISubroutineType(types: !638)
!638 = !{!454, !381, !639, !454, !621}
!639 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !444, size: 64)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !641, file: !365, line: 191)
!641 = !DISubprogram(name: "getwchar", scope: !440, file: !440, line: 110, type: !642, flags: DIFlagPrototyped, spFlags: 0)
!642 = !DISubroutineType(types: !643)
!643 = !{!288}
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !645, file: !365, line: 192)
!645 = !DISubprogram(name: "vwscanf", scope: !440, file: !440, line: 199, type: !646, flags: DIFlagPrototyped, spFlags: 0)
!646 = !DISubroutineType(types: !647)
!647 = !{!7, !444, !461}
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !649, file: !365, line: 193)
!649 = !DISubprogram(name: "wscanf", scope: !440, file: !440, line: 181, type: !650, flags: DIFlagPrototyped, spFlags: 0)
!650 = !DISubroutineType(types: !651)
!651 = !{!7, !444, null}
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !653, file: !365, line: 195)
!653 = !DISubprogram(name: "putwchar", scope: !440, file: !440, line: 119, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!654 = !DISubroutineType(types: !655)
!655 = !{!288, !446}
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !657, file: !365, line: 196)
!657 = !DISubprogram(name: "vwprintf", scope: !440, file: !440, line: 128, type: !646, flags: DIFlagPrototyped, spFlags: 0)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !659, file: !365, line: 197)
!659 = !DISubprogram(name: "wprintf", scope: !440, file: !440, line: 180, type: !650, flags: DIFlagPrototyped, spFlags: 0)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !661, file: !667, line: 82)
!661 = !DISubprogram(name: "memcpy", scope: !662, file: !662, line: 78, type: !663, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!663 = !DISubroutineType(types: !664)
!664 = !{!401, !401, !665, !454}
!665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !666, size: 64)
!666 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!667 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !669, file: !667, line: 83)
!669 = !DISubprogram(name: "memmove", scope: !662, file: !662, line: 81, type: !663, flags: DIFlagPrototyped, spFlags: 0)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !671, file: !667, line: 84)
!671 = !DISubprogram(name: "strcpy", scope: !662, file: !662, line: 92, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DISubroutineType(types: !673)
!673 = !{!381, !381, !338}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !675, file: !667, line: 85)
!675 = !DISubprogram(name: "strncpy", scope: !662, file: !662, line: 104, type: !676, flags: DIFlagPrototyped, spFlags: 0)
!676 = !DISubroutineType(types: !677)
!677 = !{!381, !381, !338, !454}
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !679, file: !667, line: 86)
!679 = !DISubprogram(name: "strcat", scope: !662, file: !662, line: 86, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !681, file: !667, line: 87)
!681 = !DISubprogram(name: "strncat", scope: !662, file: !662, line: 98, type: !676, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !683, file: !667, line: 88)
!683 = !DISubprogram(name: "memcmp", scope: !662, file: !662, line: 75, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!7, !665, !665, !454}
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !687, file: !667, line: 89)
!687 = !DISubprogram(name: "strcmp", scope: !662, file: !662, line: 89, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!7, !338, !338}
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !691, file: !667, line: 90)
!691 = !DISubprogram(name: "strncmp", scope: !662, file: !662, line: 101, type: !692, flags: DIFlagPrototyped, spFlags: 0)
!692 = !DISubroutineType(types: !693)
!693 = !{!7, !338, !338, !454}
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !695, file: !667, line: 91)
!695 = !DISubprogram(name: "strcoll", scope: !662, file: !662, line: 90, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !697, file: !667, line: 92)
!697 = !DISubprogram(name: "strxfrm", scope: !662, file: !662, line: 112, type: !698, flags: DIFlagPrototyped, spFlags: 0)
!698 = !DISubroutineType(types: !699)
!699 = !{!454, !381, !338, !454}
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !701, file: !667, line: 93)
!701 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !702, file: !702, line: 101, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!703 = !DISubroutineType(types: !704)
!704 = !{!401, !401, !7, !454}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !706, file: !667, line: 94)
!706 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !702, file: !702, line: 80, type: !707, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DISubroutineType(types: !708)
!708 = !{!381, !381, !7}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !710, file: !667, line: 95)
!710 = !DISubprogram(name: "strcspn", scope: !662, file: !662, line: 94, type: !711, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DISubroutineType(types: !712)
!712 = !{!454, !338, !338}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !714, file: !667, line: 96)
!714 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !702, file: !702, line: 87, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !716, file: !667, line: 97)
!716 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !702, file: !702, line: 94, type: !707, flags: DIFlagPrototyped, spFlags: 0)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !718, file: !667, line: 98)
!718 = !DISubprogram(name: "strspn", scope: !662, file: !662, line: 109, type: !711, flags: DIFlagPrototyped, spFlags: 0)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !720, file: !667, line: 99)
!720 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !702, file: !702, line: 108, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !722, file: !667, line: 100)
!722 = !DISubprogram(name: "strtok", scope: !662, file: !662, line: 111, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !724, file: !667, line: 101)
!724 = !DISubprogram(name: "memset", scope: !662, file: !662, line: 84, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !726, file: !667, line: 102)
!726 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !662, file: !662, line: 95, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!381, !7}
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !730, file: !667, line: 103)
!730 = !DISubprogram(name: "strlen", scope: !662, file: !662, line: 96, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DISubroutineType(types: !732)
!732 = !{!454, !338}
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !734, file: !740, line: 422)
!734 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !736, file: !735, line: 79, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!736 = !DINamespace(name: "__math", scope: !173)
!737 = !DISubroutineType(types: !738)
!738 = !{!739, !253}
!739 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!740 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !742, file: !740, line: 425)
!742 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !736, file: !735, line: 103, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !744, file: !740, line: 429)
!744 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !736, file: !735, line: 127, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !746, file: !740, line: 430)
!746 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !736, file: !735, line: 146, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !748, file: !740, line: 485)
!748 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !736, file: !749, line: 55, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!750 = !DISubroutineType(types: !751)
!751 = !{!253, !253, !752}
!752 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !734, file: !754, line: 352)
!754 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !742, file: !754, line: 353)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !744, file: !754, line: 354)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !746, file: !754, line: 355)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !759, file: !754, line: 364)
!759 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !760, line: 50, baseType: !515)
!760 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !762, file: !754, line: 365)
!762 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !760, line: 51, baseType: !509)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !764, file: !754, line: 367)
!764 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !765, file: !765, line: 123, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!766 = !DISubroutineType(types: !767)
!767 = !{!253, !253}
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !769, file: !754, line: 370)
!769 = !DISubprogram(name: "acosf", scope: !760, file: !760, line: 314, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!770 = !DISubroutineType(types: !771)
!771 = !{!515, !515}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !773, file: !754, line: 372)
!773 = !DISubprogram(name: "asinf", scope: !760, file: !760, line: 318, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !775, file: !754, line: 374)
!775 = !DISubprogram(name: "atanf", scope: !760, file: !760, line: 322, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !777, file: !754, line: 376)
!777 = !DISubprogram(name: "atan2f", scope: !760, file: !760, line: 326, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!778 = !DISubroutineType(types: !779)
!779 = !{!515, !515, !515}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !781, file: !754, line: 378)
!781 = !DISubprogram(name: "ceilf", scope: !760, file: !760, line: 461, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !783, file: !754, line: 380)
!783 = !DISubprogram(name: "cosf", scope: !760, file: !760, line: 330, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !785, file: !754, line: 382)
!785 = !DISubprogram(name: "coshf", scope: !760, file: !760, line: 354, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !787, file: !754, line: 385)
!787 = !DISubprogram(name: "expf", scope: !760, file: !760, line: 366, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !789, file: !754, line: 388)
!789 = !DISubprogram(name: "fabsf", scope: !760, file: !760, line: 422, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !791, file: !754, line: 390)
!791 = !DISubprogram(name: "floorf", scope: !760, file: !760, line: 465, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !793, file: !754, line: 393)
!793 = !DISubprogram(name: "fmodf", scope: !760, file: !760, line: 505, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !795, file: !754, line: 396)
!795 = !DISubprogram(name: "frexpf", scope: !760, file: !760, line: 406, type: !796, flags: DIFlagPrototyped, spFlags: 0)
!796 = !DISubroutineType(types: !797)
!797 = !{!515, !515, !798}
!798 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !800, file: !754, line: 398)
!800 = !DISubprogram(name: "ldexpf", scope: !760, file: !760, line: 402, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DISubroutineType(types: !802)
!802 = !{!515, !515, !7}
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !804, file: !754, line: 401)
!804 = !DISubprogram(name: "logf", scope: !760, file: !760, line: 378, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !806, file: !754, line: 404)
!806 = !DISubprogram(name: "log10f", scope: !760, file: !760, line: 382, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !748, file: !754, line: 405)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !809, file: !754, line: 406)
!809 = !DISubprogram(name: "modff", scope: !760, file: !760, line: 398, type: !810, flags: DIFlagPrototyped, spFlags: 0)
!810 = !DISubroutineType(types: !811)
!811 = !{!515, !515, !812}
!812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !515, size: 64)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !814, file: !754, line: 409)
!814 = !DISubprogram(name: "powf", scope: !760, file: !760, line: 434, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !816, file: !754, line: 412)
!816 = !DISubprogram(name: "sinf", scope: !760, file: !760, line: 334, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !818, file: !754, line: 414)
!818 = !DISubprogram(name: "sinhf", scope: !760, file: !760, line: 358, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !820, file: !754, line: 417)
!820 = !DISubprogram(name: "sqrtf", scope: !760, file: !760, line: 438, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !822, file: !754, line: 419)
!822 = !DISubprogram(name: "tanf", scope: !760, file: !760, line: 338, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !824, file: !754, line: 422)
!824 = !DISubprogram(name: "tanhf", scope: !760, file: !760, line: 362, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !826, file: !754, line: 425)
!826 = !DISubprogram(name: "acoshf", scope: !760, file: !760, line: 342, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !828, file: !754, line: 427)
!828 = !DISubprogram(name: "asinhf", scope: !760, file: !760, line: 346, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !830, file: !754, line: 429)
!830 = !DISubprogram(name: "atanhf", scope: !760, file: !760, line: 350, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !832, file: !754, line: 431)
!832 = !DISubprogram(name: "cbrtf", scope: !760, file: !760, line: 426, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !834, file: !754, line: 434)
!834 = !DISubprogram(name: "copysignf", scope: !760, file: !760, line: 517, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !836, file: !754, line: 437)
!836 = !DISubprogram(name: "erff", scope: !760, file: !760, line: 442, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !838, file: !754, line: 439)
!838 = !DISubprogram(name: "erfcf", scope: !760, file: !760, line: 446, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !840, file: !754, line: 441)
!840 = !DISubprogram(name: "exp2f", scope: !760, file: !760, line: 370, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !842, file: !754, line: 443)
!842 = !DISubprogram(name: "expm1f", scope: !760, file: !760, line: 374, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !844, file: !754, line: 445)
!844 = !DISubprogram(name: "fdimf", scope: !760, file: !760, line: 533, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !846, file: !754, line: 446)
!846 = !DISubprogram(name: "fmaf", scope: !760, file: !760, line: 545, type: !847, flags: DIFlagPrototyped, spFlags: 0)
!847 = !DISubroutineType(types: !848)
!848 = !{!515, !515, !515, !515}
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !850, file: !754, line: 449)
!850 = !DISubprogram(name: "fmaxf", scope: !760, file: !760, line: 537, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !852, file: !754, line: 451)
!852 = !DISubprogram(name: "fminf", scope: !760, file: !760, line: 541, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !854, file: !754, line: 453)
!854 = !DISubprogram(name: "hypotf", scope: !760, file: !760, line: 430, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !856, file: !754, line: 455)
!856 = !DISubprogram(name: "ilogbf", scope: !760, file: !760, line: 410, type: !857, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DISubroutineType(types: !858)
!858 = !{!7, !515}
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !860, file: !754, line: 457)
!860 = !DISubprogram(name: "lgammaf", scope: !760, file: !760, line: 453, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !862, file: !754, line: 459)
!862 = !DISubprogram(name: "llrintf", scope: !760, file: !760, line: 492, type: !863, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DISubroutineType(types: !864)
!864 = !{!20, !515}
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !866, file: !754, line: 461)
!866 = !DISubprogram(name: "llroundf", scope: !760, file: !760, line: 496, type: !863, flags: DIFlagPrototyped, spFlags: 0)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !868, file: !754, line: 463)
!868 = !DISubprogram(name: "log1pf", scope: !760, file: !760, line: 390, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !870, file: !754, line: 465)
!870 = !DISubprogram(name: "log2f", scope: !760, file: !760, line: 386, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !872, file: !754, line: 467)
!872 = !DISubprogram(name: "logbf", scope: !760, file: !760, line: 394, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !874, file: !754, line: 469)
!874 = !DISubprogram(name: "lrintf", scope: !760, file: !760, line: 477, type: !875, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DISubroutineType(types: !876)
!876 = !{!239, !515}
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !878, file: !754, line: 471)
!878 = !DISubprogram(name: "lroundf", scope: !760, file: !760, line: 485, type: !875, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !880, file: !754, line: 473)
!880 = !DISubprogram(name: "nan", scope: !760, file: !760, line: 522, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DISubroutineType(types: !882)
!882 = !{!509, !338}
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !884, file: !754, line: 474)
!884 = !DISubprogram(name: "nanf", scope: !760, file: !760, line: 521, type: !885, flags: DIFlagPrototyped, spFlags: 0)
!885 = !DISubroutineType(types: !886)
!886 = !{!515, !338}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !888, file: !754, line: 477)
!888 = !DISubprogram(name: "nearbyintf", scope: !760, file: !760, line: 469, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !890, file: !754, line: 479)
!890 = !DISubprogram(name: "nextafterf", scope: !760, file: !760, line: 525, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !892, file: !754, line: 481)
!892 = !DISubprogram(name: "nexttowardf", scope: !760, file: !760, line: 530, type: !893, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DISubroutineType(types: !894)
!894 = !{!515, !515, !253}
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !896, file: !754, line: 483)
!896 = !DISubprogram(name: "remainderf", scope: !760, file: !760, line: 509, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !898, file: !754, line: 485)
!898 = !DISubprogram(name: "remquof", scope: !760, file: !760, line: 513, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DISubroutineType(types: !900)
!900 = !{!515, !515, !515, !798}
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !902, file: !754, line: 487)
!902 = !DISubprogram(name: "rintf", scope: !760, file: !760, line: 473, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !904, file: !754, line: 489)
!904 = !DISubprogram(name: "roundf", scope: !760, file: !760, line: 481, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !906, file: !754, line: 491)
!906 = !DISubprogram(name: "scalblnf", scope: !760, file: !760, line: 418, type: !907, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DISubroutineType(types: !908)
!908 = !{!515, !515, !239}
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !910, file: !754, line: 493)
!910 = !DISubprogram(name: "scalbnf", scope: !760, file: !760, line: 414, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !912, file: !754, line: 495)
!912 = !DISubprogram(name: "tgammaf", scope: !760, file: !760, line: 457, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !914, file: !754, line: 497)
!914 = !DISubprogram(name: "truncf", scope: !760, file: !760, line: 501, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !916, file: !754, line: 499)
!916 = !DISubprogram(name: "acosl", scope: !760, file: !760, line: 316, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !918, file: !754, line: 500)
!918 = !DISubprogram(name: "asinl", scope: !760, file: !760, line: 320, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !920, file: !754, line: 501)
!920 = !DISubprogram(name: "atanl", scope: !760, file: !760, line: 324, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !922, file: !754, line: 502)
!922 = !DISubprogram(name: "atan2l", scope: !760, file: !760, line: 328, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DISubroutineType(types: !924)
!924 = !{!253, !253, !253}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !926, file: !754, line: 503)
!926 = !DISubprogram(name: "ceill", scope: !760, file: !760, line: 463, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !928, file: !754, line: 504)
!928 = !DISubprogram(name: "cosl", scope: !760, file: !760, line: 332, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !930, file: !754, line: 505)
!930 = !DISubprogram(name: "coshl", scope: !760, file: !760, line: 356, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !932, file: !754, line: 506)
!932 = !DISubprogram(name: "expl", scope: !760, file: !760, line: 368, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !934, file: !754, line: 507)
!934 = !DISubprogram(name: "fabsl", scope: !760, file: !760, line: 424, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !936, file: !754, line: 508)
!936 = !DISubprogram(name: "floorl", scope: !760, file: !760, line: 467, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !938, file: !754, line: 509)
!938 = !DISubprogram(name: "fmodl", scope: !760, file: !760, line: 507, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !940, file: !754, line: 510)
!940 = !DISubprogram(name: "frexpl", scope: !760, file: !760, line: 408, type: !941, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DISubroutineType(types: !942)
!942 = !{!253, !253, !798}
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !944, file: !754, line: 511)
!944 = !DISubprogram(name: "ldexpl", scope: !760, file: !760, line: 404, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DISubroutineType(types: !946)
!946 = !{!253, !253, !7}
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !948, file: !754, line: 512)
!948 = !DISubprogram(name: "logl", scope: !760, file: !760, line: 380, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !950, file: !754, line: 513)
!950 = !DISubprogram(name: "log10l", scope: !760, file: !760, line: 384, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !952, file: !754, line: 514)
!952 = !DISubprogram(name: "modfl", scope: !760, file: !760, line: 400, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !954, file: !754, line: 515)
!954 = !DISubprogram(name: "powl", scope: !760, file: !760, line: 436, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !956, file: !754, line: 516)
!956 = !DISubprogram(name: "sinl", scope: !760, file: !760, line: 336, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !958, file: !754, line: 517)
!958 = !DISubprogram(name: "sinhl", scope: !760, file: !760, line: 360, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !960, file: !754, line: 518)
!960 = !DISubprogram(name: "sqrtl", scope: !760, file: !760, line: 440, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !962, file: !754, line: 519)
!962 = !DISubprogram(name: "tanl", scope: !760, file: !760, line: 340, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !964, file: !754, line: 521)
!964 = !DISubprogram(name: "tanhl", scope: !760, file: !760, line: 364, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !966, file: !754, line: 522)
!966 = !DISubprogram(name: "acoshl", scope: !760, file: !760, line: 344, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !968, file: !754, line: 523)
!968 = !DISubprogram(name: "asinhl", scope: !760, file: !760, line: 348, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !970, file: !754, line: 524)
!970 = !DISubprogram(name: "atanhl", scope: !760, file: !760, line: 352, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !972, file: !754, line: 525)
!972 = !DISubprogram(name: "cbrtl", scope: !760, file: !760, line: 428, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !974, file: !754, line: 527)
!974 = !DISubprogram(name: "copysignl", scope: !760, file: !760, line: 519, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !976, file: !754, line: 529)
!976 = !DISubprogram(name: "erfl", scope: !760, file: !760, line: 444, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !978, file: !754, line: 530)
!978 = !DISubprogram(name: "erfcl", scope: !760, file: !760, line: 448, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !980, file: !754, line: 531)
!980 = !DISubprogram(name: "exp2l", scope: !760, file: !760, line: 372, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !982, file: !754, line: 532)
!982 = !DISubprogram(name: "expm1l", scope: !760, file: !760, line: 376, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !984, file: !754, line: 533)
!984 = !DISubprogram(name: "fdiml", scope: !760, file: !760, line: 535, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !986, file: !754, line: 534)
!986 = !DISubprogram(name: "fmal", scope: !760, file: !760, line: 547, type: !987, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DISubroutineType(types: !988)
!988 = !{!253, !253, !253, !253}
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !990, file: !754, line: 535)
!990 = !DISubprogram(name: "fmaxl", scope: !760, file: !760, line: 539, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !992, file: !754, line: 536)
!992 = !DISubprogram(name: "fminl", scope: !760, file: !760, line: 543, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !994, file: !754, line: 537)
!994 = !DISubprogram(name: "hypotl", scope: !760, file: !760, line: 432, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !996, file: !754, line: 538)
!996 = !DISubprogram(name: "ilogbl", scope: !760, file: !760, line: 412, type: !997, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DISubroutineType(types: !998)
!998 = !{!7, !253}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1000, file: !754, line: 539)
!1000 = !DISubprogram(name: "lgammal", scope: !760, file: !760, line: 455, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1002, file: !754, line: 540)
!1002 = !DISubprogram(name: "llrintl", scope: !760, file: !760, line: 494, type: !1003, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!20, !253}
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1006, file: !754, line: 541)
!1006 = !DISubprogram(name: "llroundl", scope: !760, file: !760, line: 498, type: !1003, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1008, file: !754, line: 542)
!1008 = !DISubprogram(name: "log1pl", scope: !760, file: !760, line: 392, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1010, file: !754, line: 543)
!1010 = !DISubprogram(name: "log2l", scope: !760, file: !760, line: 388, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1012, file: !754, line: 544)
!1012 = !DISubprogram(name: "logbl", scope: !760, file: !760, line: 396, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1014, file: !754, line: 545)
!1014 = !DISubprogram(name: "lrintl", scope: !760, file: !760, line: 479, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!239, !253}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1018, file: !754, line: 546)
!1018 = !DISubprogram(name: "lroundl", scope: !760, file: !760, line: 487, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1020, file: !754, line: 547)
!1020 = !DISubprogram(name: "nanl", scope: !760, file: !760, line: 523, type: !1021, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!253, !338}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1024, file: !754, line: 548)
!1024 = !DISubprogram(name: "nearbyintl", scope: !760, file: !760, line: 471, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1026, file: !754, line: 549)
!1026 = !DISubprogram(name: "nextafterl", scope: !760, file: !760, line: 527, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1028, file: !754, line: 550)
!1028 = !DISubprogram(name: "nexttowardl", scope: !760, file: !760, line: 531, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1030, file: !754, line: 551)
!1030 = !DISubprogram(name: "remainderl", scope: !760, file: !760, line: 511, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1032, file: !754, line: 552)
!1032 = !DISubprogram(name: "remquol", scope: !760, file: !760, line: 515, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!253, !253, !253, !798}
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1036, file: !754, line: 553)
!1036 = !DISubprogram(name: "rintl", scope: !760, file: !760, line: 475, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1038, file: !754, line: 554)
!1038 = !DISubprogram(name: "roundl", scope: !760, file: !760, line: 483, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1040, file: !754, line: 555)
!1040 = !DISubprogram(name: "scalblnl", scope: !760, file: !760, line: 420, type: !1041, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!253, !253, !239}
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1044, file: !754, line: 556)
!1044 = !DISubprogram(name: "scalbnl", scope: !760, file: !760, line: 416, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1046, file: !754, line: 557)
!1046 = !DISubprogram(name: "tgammal", scope: !760, file: !760, line: 459, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1048, file: !754, line: 558)
!1048 = !DISubprogram(name: "truncl", scope: !760, file: !760, line: 503, type: !766, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1050, entity: !1051, file: !1053, line: 536)
!1050 = !DINamespace(name: "chrono", scope: !173)
!1051 = !DINamespace(name: "chrono_literals", scope: !1052, exportSymbols: true)
!1052 = !DINamespace(name: "literals", scope: !173, exportSymbols: true)
!1053 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1055, file: !1058, line: 68)
!1055 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1056, line: 31, baseType: !1057)
!1056 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1057 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !238, line: 116, baseType: !243)
!1058 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1060, file: !1058, line: 69)
!1060 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1061, line: 31, baseType: !1062)
!1061 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1062 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !238, line: 119, baseType: !239)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !367, file: !1058, line: 70)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1065, file: !1058, line: 74)
!1065 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !368, file: !368, line: 112, type: !1066, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DISubroutineType(types: !1067)
!1067 = !{!1055}
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1069, file: !1058, line: 75)
!1069 = !DISubprogram(name: "difftime", scope: !368, file: !368, line: 114, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{!509, !1060, !1060}
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1073, file: !1058, line: 76)
!1073 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !368, file: !368, line: 118, type: !1074, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!1060, !1076}
!1076 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !367, size: 64)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1078, file: !1058, line: 77)
!1078 = !DISubprogram(name: "time", scope: !368, file: !368, line: 121, type: !1079, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!1060, !1081}
!1081 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1060, size: 64)
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1083, file: !1058, line: 78)
!1083 = !DISubprogram(name: "asctime", scope: !368, file: !368, line: 111, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!381, !603}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1087, file: !1058, line: 79)
!1087 = !DISubprogram(name: "ctime", scope: !368, file: !368, line: 113, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!381, !1090}
!1090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1091, size: 64)
!1091 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1060)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1093, file: !1058, line: 80)
!1093 = !DISubprogram(name: "gmtime", scope: !368, file: !368, line: 116, type: !1094, flags: DIFlagPrototyped, spFlags: 0)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{!1076, !1090}
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1097, file: !1058, line: 81)
!1097 = !DISubprogram(name: "localtime", scope: !368, file: !368, line: 117, type: !1094, flags: DIFlagPrototyped, spFlags: 0)
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1099, file: !1058, line: 82)
!1099 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !368, file: !368, line: 119, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!454, !381, !454, !338, !603}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1103, file: !1109, line: 106)
!1103 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1104, line: 105, baseType: !1105)
!1104 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!1105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1104, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !1106, identifier: "_ZTS5div_t")
!1106 = !{!1107, !1108}
!1107 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1105, file: !1104, line: 103, baseType: !7, size: 32)
!1108 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1105, file: !1104, line: 104, baseType: !7, size: 32, offset: 32)
!1109 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1111, file: !1109, line: 107)
!1111 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1104, line: 110, baseType: !1112)
!1112 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1104, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !1113, identifier: "_ZTS6ldiv_t")
!1113 = !{!1114, !1115}
!1114 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1112, file: !1104, line: 108, baseType: !239, size: 64)
!1115 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1112, file: !1104, line: 109, baseType: !239, size: 64, offset: 64)
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1117, file: !1109, line: 108)
!1117 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1104, line: 116, baseType: !1118)
!1118 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1104, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !1119, identifier: "_ZTS7lldiv_t")
!1119 = !{!1120, !1121}
!1120 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1118, file: !1104, line: 114, baseType: !20, size: 64)
!1121 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1118, file: !1104, line: 115, baseType: !20, size: 64, offset: 64)
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1123, file: !1109, line: 109)
!1123 = !DISubprogram(name: "atof", scope: !1104, file: !1104, line: 149, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1125, file: !1109, line: 110)
!1125 = !DISubprogram(name: "atoi", scope: !1104, file: !1104, line: 150, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!7, !338}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1129, file: !1109, line: 111)
!1129 = !DISubprogram(name: "atol", scope: !1104, file: !1104, line: 151, type: !1130, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!239, !338}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1133, file: !1109, line: 112)
!1133 = !DISubprogram(name: "atoll", scope: !1104, file: !1104, line: 154, type: !1134, flags: DIFlagPrototyped, spFlags: 0)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!20, !338}
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1137, file: !1109, line: 113)
!1137 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !1104, file: !1104, line: 184, type: !1138, flags: DIFlagPrototyped, spFlags: 0)
!1138 = !DISubroutineType(types: !1139)
!1139 = !{!509, !338, !1140}
!1140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !381, size: 64)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1142, file: !1109, line: 114)
!1142 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !1104, file: !1104, line: 185, type: !1143, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DISubroutineType(types: !1144)
!1144 = !{!515, !338, !1140}
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1146, file: !1109, line: 115)
!1146 = !DISubprogram(name: "strtold", scope: !1104, file: !1104, line: 188, type: !1147, flags: DIFlagPrototyped, spFlags: 0)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!253, !338, !1140}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1150, file: !1109, line: 116)
!1150 = !DISubprogram(name: "strtol", scope: !1104, file: !1104, line: 186, type: !1151, flags: DIFlagPrototyped, spFlags: 0)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{!239, !338, !1140, !7}
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1154, file: !1109, line: 117)
!1154 = !DISubprogram(name: "strtoll", scope: !1104, file: !1104, line: 191, type: !1155, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!20, !338, !1140, !7}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1158, file: !1109, line: 118)
!1158 = !DISubprogram(name: "strtoul", scope: !1104, file: !1104, line: 194, type: !1159, flags: DIFlagPrototyped, spFlags: 0)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!243, !338, !1140, !7}
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1162, file: !1109, line: 119)
!1162 = !DISubprogram(name: "strtoull", scope: !1104, file: !1104, line: 197, type: !1163, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!200, !338, !1140, !7}
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1166, file: !1109, line: 120)
!1166 = !DISubprogram(name: "rand", scope: !1104, file: !1104, line: 181, type: !1167, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!7}
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1170, file: !1109, line: 121)
!1170 = !DISubprogram(name: "srand", scope: !1104, file: !1104, line: 183, type: !1171, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{null, !196}
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1174, file: !1109, line: 122)
!1174 = !DISubprogram(name: "calloc", scope: !1175, file: !1175, line: 55, type: !1176, flags: DIFlagPrototyped, spFlags: 0)
!1175 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!401, !454, !454}
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1179, file: !1109, line: 123)
!1179 = !DISubprogram(name: "free", scope: !1175, file: !1175, line: 56, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{null, !401}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1183, file: !1109, line: 124)
!1183 = !DISubprogram(name: "malloc", scope: !1175, file: !1175, line: 54, type: !1184, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DISubroutineType(types: !1185)
!1185 = !{!401, !454}
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1187, file: !1109, line: 125)
!1187 = !DISubprogram(name: "realloc", scope: !1175, file: !1175, line: 57, type: !1188, flags: DIFlagPrototyped, spFlags: 0)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!401, !401, !454}
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1191, file: !1109, line: 126)
!1191 = !DISubprogram(name: "abort", scope: !1192, file: !1192, line: 33, type: !1193, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1192 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!1193 = !DISubroutineType(types: !1194)
!1194 = !{null}
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1196, file: !1109, line: 127)
!1196 = !DISubprogram(name: "atexit", scope: !1104, file: !1104, line: 144, type: !1197, flags: DIFlagPrototyped, spFlags: 0)
!1197 = !DISubroutineType(types: !1198)
!1198 = !{!7, !1199}
!1199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1193, size: 64)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1201, file: !1109, line: 128)
!1201 = !DISubprogram(name: "exit", scope: !1104, file: !1104, line: 160, type: !1202, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{null, !7}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1205, file: !1109, line: 129)
!1205 = !DISubprogram(name: "_Exit", scope: !1104, file: !1104, line: 210, type: !1202, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1207, file: !1109, line: 130)
!1207 = !DISubprogram(name: "getenv", scope: !1104, file: !1104, line: 162, type: !1208, flags: DIFlagPrototyped, spFlags: 0)
!1208 = !DISubroutineType(types: !1209)
!1209 = !{!381, !338}
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1211, file: !1109, line: 131)
!1211 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !1104, file: !1104, line: 203, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1213, file: !1109, line: 132)
!1213 = !DISubprogram(name: "bsearch", scope: !1104, file: !1104, line: 156, type: !1214, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DISubroutineType(types: !1215)
!1215 = !{!401, !665, !665, !454, !454, !1216}
!1216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1217, size: 64)
!1217 = !DISubroutineType(types: !1218)
!1218 = !{!7, !665, !665}
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1220, file: !1109, line: 133)
!1220 = !DISubprogram(name: "qsort", scope: !1104, file: !1104, line: 175, type: !1221, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DISubroutineType(types: !1222)
!1222 = !{null, !401, !454, !454, !1216}
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !764, file: !1109, line: 134)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1225, file: !1109, line: 135)
!1225 = !DISubprogram(name: "labs", scope: !1104, file: !1104, line: 163, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1226 = !DISubroutineType(types: !1227)
!1227 = !{!239, !239}
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1229, file: !1109, line: 136)
!1229 = !DISubprogram(name: "llabs", scope: !1104, file: !1104, line: 167, type: !1230, flags: DIFlagPrototyped, spFlags: 0)
!1230 = !DISubroutineType(types: !1231)
!1231 = !{!20, !20}
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1233, file: !1109, line: 137)
!1233 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !765, file: !765, line: 143, type: !1234, flags: DIFlagPrototyped, spFlags: 0)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!1117, !20, !20}
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1237, file: !1109, line: 138)
!1237 = !DISubprogram(name: "ldiv", scope: !1104, file: !1104, line: 164, type: !1238, flags: DIFlagPrototyped, spFlags: 0)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!1111, !239, !239}
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1241, file: !1109, line: 139)
!1241 = !DISubprogram(name: "lldiv", scope: !1104, file: !1104, line: 168, type: !1234, flags: DIFlagPrototyped, spFlags: 0)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1243, file: !1109, line: 140)
!1243 = !DISubprogram(name: "mblen", scope: !1104, file: !1104, line: 171, type: !1244, flags: DIFlagPrototyped, spFlags: 0)
!1244 = !DISubroutineType(types: !1245)
!1245 = !{!7, !338, !454}
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1247, file: !1109, line: 142)
!1247 = !DISubprogram(name: "mbtowc", scope: !1104, file: !1104, line: 173, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1248 = !DISubroutineType(types: !1249)
!1249 = !{!7, !453, !338, !454}
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1251, file: !1109, line: 143)
!1251 = !DISubprogram(name: "wctomb", scope: !1104, file: !1104, line: 207, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!7, !381, !446}
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1255, file: !1109, line: 144)
!1255 = !DISubprogram(name: "mbstowcs", scope: !1104, file: !1104, line: 172, type: !1256, flags: DIFlagPrototyped, spFlags: 0)
!1256 = !DISubroutineType(types: !1257)
!1257 = !{!454, !453, !338, !454}
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1259, file: !1109, line: 145)
!1259 = !DISubprogram(name: "wcstombs", scope: !1104, file: !1104, line: 206, type: !1260, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!454, !381, !444, !454}
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1263, file: !1109, line: 148)
!1263 = !DISubprogram(name: "at_quick_exit", scope: !1104, file: !1104, line: 147, type: !1197, flags: DIFlagPrototyped, spFlags: 0)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1265, file: !1109, line: 149)
!1265 = !DISubprogram(name: "quick_exit", scope: !1104, file: !1104, line: 179, type: !1202, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !354, file: !1267, line: 25)
!1267 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !384, file: !1269, line: 120)
!1269 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !414, file: !1269, line: 121)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1272, file: !1269, line: 123)
!1272 = !DISubprogram(name: "fclose", scope: !385, file: !385, line: 233, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!7, !443}
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1276, file: !1269, line: 124)
!1276 = !DISubprogram(name: "fflush", scope: !385, file: !385, line: 236, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1278, file: !1269, line: 125)
!1278 = !DISubprogram(name: "setbuf", scope: !385, file: !385, line: 272, type: !1279, flags: DIFlagPrototyped, spFlags: 0)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{null, !443, !381}
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1282, file: !1269, line: 126)
!1282 = !DISubprogram(name: "setvbuf", scope: !385, file: !385, line: 273, type: !1283, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!7, !443, !381, !7, !454}
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1286, file: !1269, line: 127)
!1286 = !DISubprogram(name: "fprintf", scope: !385, file: !385, line: 245, type: !1287, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DISubroutineType(types: !1288)
!1288 = !{!7, !443, !338, null}
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1290, file: !1269, line: 128)
!1290 = !DISubprogram(name: "fscanf", scope: !385, file: !385, line: 251, type: !1287, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1292, file: !1269, line: 129)
!1292 = !DISubprogram(name: "snprintf", scope: !385, file: !385, line: 435, type: !1293, flags: DIFlagPrototyped, spFlags: 0)
!1293 = !DISubroutineType(types: !1294)
!1294 = !{!7, !381, !454, !338, null}
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1296, file: !1269, line: 130)
!1296 = !DISubprogram(name: "sprintf", scope: !385, file: !385, line: 280, type: !1297, flags: DIFlagPrototyped, spFlags: 0)
!1297 = !DISubroutineType(types: !1298)
!1298 = !{!7, !381, !338, null}
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1300, file: !1269, line: 131)
!1300 = !DISubprogram(name: "sscanf", scope: !385, file: !385, line: 282, type: !1301, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{!7, !338, !338, null}
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1304, file: !1269, line: 132)
!1304 = !DISubprogram(name: "vfprintf", scope: !385, file: !385, line: 292, type: !1305, flags: DIFlagPrototyped, spFlags: 0)
!1305 = !DISubroutineType(types: !1306)
!1306 = !{!7, !443, !338, !1307}
!1307 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1308, line: 44, baseType: !461)
!1308 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1310, file: !1269, line: 133)
!1310 = !DISubprogram(name: "vfscanf", scope: !385, file: !385, line: 436, type: !1305, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1312, file: !1269, line: 134)
!1312 = !DISubprogram(name: "vsscanf", scope: !385, file: !385, line: 439, type: !1313, flags: DIFlagPrototyped, spFlags: 0)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!7, !338, !338, !1307}
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1316, file: !1269, line: 135)
!1316 = !DISubprogram(name: "vsnprintf", scope: !385, file: !385, line: 438, type: !1317, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DISubroutineType(types: !1318)
!1318 = !{!7, !381, !454, !338, !1307}
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1320, file: !1269, line: 136)
!1320 = !DISubprogram(name: "vsprintf", scope: !385, file: !385, line: 300, type: !1321, flags: DIFlagPrototyped, spFlags: 0)
!1321 = !DISubroutineType(types: !1322)
!1322 = !{!7, !381, !338, !1307}
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1324, file: !1269, line: 137)
!1324 = !DISubprogram(name: "fgetc", scope: !385, file: !385, line: 237, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1326, file: !1269, line: 138)
!1326 = !DISubprogram(name: "fgets", scope: !385, file: !385, line: 239, type: !1327, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{!381, !381, !7, !443}
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1330, file: !1269, line: 139)
!1330 = !DISubprogram(name: "fputc", scope: !385, file: !385, line: 246, type: !1331, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!7, !7, !443}
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1334, file: !1269, line: 140)
!1334 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !385, file: !385, line: 247, type: !1335, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DISubroutineType(types: !1336)
!1336 = !{!7, !338, !443}
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1338, file: !1269, line: 141)
!1338 = !DISubprogram(name: "getc", scope: !385, file: !385, line: 256, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1340, file: !1269, line: 142)
!1340 = !DISubprogram(name: "putc", scope: !385, file: !385, line: 265, type: !1331, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1342, file: !1269, line: 143)
!1342 = !DISubprogram(name: "ungetc", scope: !385, file: !385, line: 291, type: !1331, flags: DIFlagPrototyped, spFlags: 0)
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1344, file: !1269, line: 144)
!1344 = !DISubprogram(name: "fread", scope: !385, file: !385, line: 248, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!454, !401, !454, !454, !443}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1348, file: !1269, line: 145)
!1348 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !385, file: !385, line: 255, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!454, !665, !454, !454, !443}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1352, file: !1269, line: 146)
!1352 = !DISubprogram(name: "fgetpos", scope: !385, file: !385, line: 238, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!7, !443, !1355}
!1355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !414, size: 64)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1357, file: !1269, line: 147)
!1357 = !DISubprogram(name: "fseek", scope: !385, file: !385, line: 252, type: !1358, flags: DIFlagPrototyped, spFlags: 0)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!7, !443, !239, !7}
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1361, file: !1269, line: 148)
!1361 = !DISubprogram(name: "fsetpos", scope: !385, file: !385, line: 253, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{!7, !443, !1364}
!1364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1365, size: 64)
!1365 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !414)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1367, file: !1269, line: 149)
!1367 = !DISubprogram(name: "ftell", scope: !385, file: !385, line: 254, type: !1368, flags: DIFlagPrototyped, spFlags: 0)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!239, !443}
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1371, file: !1269, line: 150)
!1371 = !DISubprogram(name: "rewind", scope: !385, file: !385, line: 270, type: !1372, flags: DIFlagPrototyped, spFlags: 0)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{null, !443}
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1375, file: !1269, line: 151)
!1375 = !DISubprogram(name: "clearerr", scope: !385, file: !385, line: 232, type: !1372, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1377, file: !1269, line: 152)
!1377 = !DISubprogram(name: "feof", scope: !385, file: !385, line: 234, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1379, file: !1269, line: 153)
!1379 = !DISubprogram(name: "ferror", scope: !385, file: !385, line: 235, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1381, file: !1269, line: 154)
!1381 = !DISubprogram(name: "perror", scope: !385, file: !385, line: 264, type: !1382, flags: DIFlagPrototyped, spFlags: 0)
!1382 = !DISubroutineType(types: !1383)
!1383 = !{null, !338}
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1385, file: !1269, line: 156)
!1385 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !385, file: !385, line: 243, type: !1386, flags: DIFlagPrototyped, spFlags: 0)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!443, !338, !338}
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1389, file: !1269, line: 157)
!1389 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !385, file: !385, line: 249, type: !1390, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DISubroutineType(types: !1391)
!1391 = !{!443, !338, !338, !443}
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1393, file: !1269, line: 158)
!1393 = !DISubprogram(name: "remove", scope: !385, file: !385, line: 268, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1395, file: !1269, line: 159)
!1395 = !DISubprogram(name: "rename", scope: !385, file: !385, line: 269, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1397, file: !1269, line: 160)
!1397 = !DISubprogram(name: "tmpfile", scope: !385, file: !385, line: 283, type: !1398, flags: DIFlagPrototyped, spFlags: 0)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!443}
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1401, file: !1269, line: 161)
!1401 = !DISubprogram(name: "tmpnam", scope: !385, file: !385, line: 289, type: !1402, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DISubroutineType(types: !1403)
!1403 = !{!381, !381}
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1405, file: !1269, line: 163)
!1405 = !DISubprogram(name: "getchar", scope: !385, file: !385, line: 257, type: !1167, flags: DIFlagPrototyped, spFlags: 0)
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1407, file: !1269, line: 167)
!1407 = !DISubprogram(name: "scanf", scope: !385, file: !385, line: 271, type: !1408, flags: DIFlagPrototyped, spFlags: 0)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!7, !338, null}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1411, file: !1269, line: 168)
!1411 = !DISubprogram(name: "vscanf", scope: !385, file: !385, line: 437, type: !1412, flags: DIFlagPrototyped, spFlags: 0)
!1412 = !DISubroutineType(types: !1413)
!1413 = !{!7, !338, !1307}
!1414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1415, file: !1269, line: 170)
!1415 = !DISubprogram(name: "printf", scope: !1416, file: !1416, line: 34, type: !1408, flags: DIFlagPrototyped, spFlags: 0)
!1416 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1418, file: !1269, line: 171)
!1418 = !DISubprogram(name: "putchar", scope: !385, file: !385, line: 266, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1420, file: !1269, line: 172)
!1420 = !DISubprogram(name: "puts", scope: !385, file: !385, line: 267, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !173, entity: !1422, file: !1269, line: 173)
!1422 = !DISubprogram(name: "vprintf", scope: !385, file: !385, line: 293, type: !1412, flags: DIFlagPrototyped, spFlags: 0)
!1423 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1424 = !{i32 7, !"Dwarf Version", i32 5}
!1425 = !{i32 2, !"Debug Info Version", i32 3}
!1426 = !{i32 1, !"wchar_size", i32 4}
!1427 = !{i32 8, !"PIC Level", i32 2}
!1428 = !{i32 7, !"uwtable", i32 1}
!1429 = !{i32 7, !"frame-pointer", i32 1}
!1430 = !{!"Homebrew clang version 20.1.8"}
!1431 = distinct !DISubprogram(name: "object_create_explosion_sub", linkageName: "_Z27object_create_explosion_subP6objectsP10vms_vectoriiiiii", scope: !24, file: !24, line: 62, type: !1432, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!1432 = !DISubroutineType(types: !1433)
!1433 = !{!1434, !1434, !182, !1571, !14, !7, !14, !14, !14, !7}
!1434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1435, size: 64)
!1435 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !1436, line: 259, baseType: !1437)
!1436 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!1437 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !1436, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !1438, identifier: "_ZTS6object")
!1438 = !{!1439, !1440, !1441, !1442, !1443, !1444, !1445, !1446, !1447, !1448, !1449, !1450, !1458, !1465, !1466, !1467, !1468, !1469, !1470, !1471, !1472, !1473, !1491, !1545}
!1439 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !1437, file: !1436, line: 212, baseType: !7, size: 32)
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1437, file: !1436, line: 213, baseType: !186, size: 8, offset: 32)
!1441 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !1437, file: !1436, line: 214, baseType: !186, size: 8, offset: 40)
!1442 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !1437, file: !1436, line: 215, baseType: !182, size: 16, offset: 48)
!1443 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !1437, file: !1436, line: 215, baseType: !182, size: 16, offset: 64)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !1437, file: !1436, line: 216, baseType: !186, size: 8, offset: 80)
!1445 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !1437, file: !1436, line: 217, baseType: !186, size: 8, offset: 88)
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !1437, file: !1436, line: 218, baseType: !186, size: 8, offset: 96)
!1447 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1437, file: !1436, line: 219, baseType: !186, size: 8, offset: 104)
!1448 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1437, file: !1436, line: 220, baseType: !182, size: 16, offset: 112)
!1449 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !1437, file: !1436, line: 221, baseType: !182, size: 16, offset: 128)
!1450 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1437, file: !1436, line: 222, baseType: !1451, size: 96, offset: 160)
!1451 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !1452, line: 22, baseType: !1453)
!1452 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!1453 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !1452, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !1454, identifier: "_ZTS10vms_vector")
!1454 = !{!1455, !1456, !1457}
!1455 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1453, file: !1452, line: 21, baseType: !14, size: 32)
!1456 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1453, file: !1452, line: 21, baseType: !14, size: 32, offset: 32)
!1457 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1453, file: !1452, line: 21, baseType: !14, size: 32, offset: 64)
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !1437, file: !1436, line: 223, baseType: !1459, size: 288, offset: 256)
!1459 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !1452, line: 47, baseType: !1460)
!1460 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !1452, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !1461, identifier: "_ZTS10vms_matrix")
!1461 = !{!1462, !1463, !1464}
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !1460, file: !1452, line: 46, baseType: !1451, size: 96)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !1460, file: !1452, line: 46, baseType: !1451, size: 96, offset: 96)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !1460, file: !1452, line: 46, baseType: !1451, size: 96, offset: 192)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1437, file: !1436, line: 224, baseType: !14, size: 32, offset: 544)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !1437, file: !1436, line: 225, baseType: !14, size: 32, offset: 576)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !1437, file: !1436, line: 226, baseType: !1451, size: 96, offset: 608)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !1437, file: !1436, line: 227, baseType: !175, size: 8, offset: 704)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !1437, file: !1436, line: 228, baseType: !175, size: 8, offset: 712)
!1470 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !1437, file: !1436, line: 229, baseType: !175, size: 8, offset: 720)
!1471 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !1437, file: !1436, line: 230, baseType: !175, size: 8, offset: 728)
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !1437, file: !1436, line: 231, baseType: !14, size: 32, offset: 736)
!1473 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !1437, file: !1436, line: 240, baseType: !1474, size: 512, offset: 768)
!1474 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1437, file: !1436, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !1475, identifier: "_ZTSN6objectUt_E")
!1475 = !{!1476, !1490}
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !1474, file: !1436, line: 238, baseType: !1477, size: 512)
!1477 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !1436, line: 153, baseType: !1478)
!1478 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !1436, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !1479, identifier: "_ZTS12physics_info")
!1479 = !{!1480, !1481, !1482, !1483, !1484, !1485, !1486, !1487, !1489}
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !1478, file: !1436, line: 144, baseType: !1451, size: 96)
!1481 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !1478, file: !1436, line: 145, baseType: !1451, size: 96, offset: 96)
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !1478, file: !1436, line: 146, baseType: !14, size: 32, offset: 192)
!1483 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !1478, file: !1436, line: 147, baseType: !14, size: 32, offset: 224)
!1484 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !1478, file: !1436, line: 148, baseType: !14, size: 32, offset: 256)
!1485 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !1478, file: !1436, line: 149, baseType: !1451, size: 96, offset: 288)
!1486 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !1478, file: !1436, line: 150, baseType: !1451, size: 96, offset: 384)
!1487 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !1478, file: !1436, line: 151, baseType: !1488, size: 16, offset: 480)
!1488 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !15, line: 21, baseType: !182)
!1489 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1478, file: !1436, line: 152, baseType: !190, size: 16, offset: 496)
!1490 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !1474, file: !1436, line: 239, baseType: !1451, size: 96)
!1491 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !1437, file: !1436, line: 250, baseType: !1492, size: 256, offset: 1280)
!1492 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1437, file: !1436, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !1493, identifier: "_ZTSN6objectUt0_E")
!1493 = !{!1494, !1505, !1515, !1533, !1538}
!1494 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !1492, file: !1436, line: 245, baseType: !1495, size: 160)
!1495 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !1436, line: 166, baseType: !1496)
!1496 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !1436, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !1497, identifier: "_ZTS12laser_info_s")
!1497 = !{!1498, !1499, !1500, !1501, !1502, !1503, !1504}
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !1496, file: !1436, line: 159, baseType: !182, size: 16)
!1499 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !1496, file: !1436, line: 160, baseType: !182, size: 16, offset: 16)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !1496, file: !1436, line: 161, baseType: !7, size: 32, offset: 32)
!1501 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1496, file: !1436, line: 162, baseType: !14, size: 32, offset: 64)
!1502 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !1496, file: !1436, line: 163, baseType: !182, size: 16, offset: 96)
!1503 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !1496, file: !1436, line: 164, baseType: !182, size: 16, offset: 112)
!1504 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !1496, file: !1436, line: 165, baseType: !14, size: 32, offset: 128)
!1505 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !1492, file: !1436, line: 246, baseType: !1506, size: 128)
!1506 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !1436, line: 176, baseType: !1507)
!1507 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !1436, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !1508, identifier: "_ZTS14explosion_info")
!1508 = !{!1509, !1510, !1511, !1512, !1513, !1514}
!1509 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !1507, file: !1436, line: 170, baseType: !14, size: 32)
!1510 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !1507, file: !1436, line: 171, baseType: !14, size: 32, offset: 32)
!1511 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !1507, file: !1436, line: 172, baseType: !182, size: 16, offset: 64)
!1512 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !1507, file: !1436, line: 173, baseType: !182, size: 16, offset: 80)
!1513 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !1507, file: !1436, line: 174, baseType: !182, size: 16, offset: 96)
!1514 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !1507, file: !1436, line: 175, baseType: !182, size: 16, offset: 112)
!1515 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !1492, file: !1436, line: 247, baseType: !1516, size: 256)
!1516 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !1517, line: 144, baseType: !1518)
!1517 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!1518 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !1517, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !1519, identifier: "_ZTS9ai_static")
!1519 = !{!1520, !1521, !1525, !1526, !1527, !1528, !1529, !1530, !1531, !1532}
!1520 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !1518, file: !1517, line: 128, baseType: !186, size: 8)
!1521 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1518, file: !1517, line: 129, baseType: !1522, size: 88, offset: 8)
!1522 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 88, elements: !1523)
!1523 = !{!1524}
!1524 = !DISubrange(count: 11)
!1525 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !1518, file: !1517, line: 130, baseType: !182, size: 16, offset: 96)
!1526 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !1518, file: !1517, line: 131, baseType: !182, size: 16, offset: 112)
!1527 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !1518, file: !1517, line: 132, baseType: !182, size: 16, offset: 128)
!1528 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !1518, file: !1517, line: 133, baseType: !175, size: 8, offset: 144)
!1529 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !1518, file: !1517, line: 134, baseType: !175, size: 8, offset: 152)
!1530 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !1518, file: !1517, line: 139, baseType: !182, size: 16, offset: 160)
!1531 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !1518, file: !1517, line: 140, baseType: !7, size: 32, offset: 192)
!1532 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !1518, file: !1517, line: 141, baseType: !14, size: 32, offset: 224)
!1533 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !1492, file: !1436, line: 248, baseType: !1534, size: 32)
!1534 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !1436, line: 181, baseType: !1535)
!1535 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !1436, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !1536, identifier: "_ZTS12light_info_s")
!1536 = !{!1537}
!1537 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !1535, file: !1436, line: 180, baseType: !14, size: 32)
!1538 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !1492, file: !1436, line: 249, baseType: !1539, size: 96)
!1539 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !1436, line: 190, baseType: !1540)
!1540 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !1436, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !1541, identifier: "_ZTS14powerup_info_s")
!1541 = !{!1542, !1543, !1544}
!1542 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !1540, file: !1436, line: 187, baseType: !7, size: 32)
!1543 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1540, file: !1436, line: 188, baseType: !14, size: 32, offset: 32)
!1544 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1540, file: !1436, line: 189, baseType: !7, size: 32, offset: 64)
!1545 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !1437, file: !1436, line: 257, baseType: !1546, size: 608, offset: 1536)
!1546 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1437, file: !1436, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !1547, identifier: "_ZTSN6objectUt1_E")
!1547 = !{!1548, !1564}
!1548 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !1546, file: !1436, line: 255, baseType: !1549, size: 608)
!1549 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !1436, line: 208, baseType: !1550)
!1550 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !1436, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !1551, identifier: "_ZTS12polyobj_info")
!1551 = !{!1552, !1553, !1561, !1562, !1563}
!1552 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !1550, file: !1436, line: 203, baseType: !7, size: 32)
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !1550, file: !1436, line: 204, baseType: !1554, size: 480, offset: 32)
!1554 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1555, size: 480, elements: !96)
!1555 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !1452, line: 40, baseType: !1556)
!1556 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !1452, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !1557, identifier: "_ZTS10vms_angvec")
!1557 = !{!1558, !1559, !1560}
!1558 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1556, file: !1452, line: 39, baseType: !1488, size: 16)
!1559 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !1556, file: !1452, line: 39, baseType: !1488, size: 16, offset: 16)
!1560 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !1556, file: !1452, line: 39, baseType: !1488, size: 16, offset: 32)
!1561 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !1550, file: !1436, line: 205, baseType: !7, size: 32, offset: 512)
!1562 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !1550, file: !1436, line: 206, baseType: !7, size: 32, offset: 544)
!1563 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !1550, file: !1436, line: 207, baseType: !7, size: 32, offset: 576)
!1564 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !1546, file: !1436, line: 256, baseType: !1565, size: 96)
!1565 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !1436, line: 197, baseType: !1566)
!1566 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !1436, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !1567, identifier: "_ZTS12vclip_info_s")
!1567 = !{!1568, !1569, !1570}
!1568 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !1566, file: !1436, line: 194, baseType: !7, size: 32)
!1569 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !1566, file: !1436, line: 195, baseType: !14, size: 32, offset: 32)
!1570 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !1566, file: !1436, line: 196, baseType: !175, size: 8, offset: 64)
!1571 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1451, size: 64)
!1572 = !{}
!1573 = !DILocalVariable(name: "objp", arg: 1, scope: !1431, file: !24, line: 62, type: !1434)
!1574 = !DILocation(line: 62, column: 45, scope: !1431)
!1575 = !DILocalVariable(name: "segnum", arg: 2, scope: !1431, file: !24, line: 62, type: !182)
!1576 = !DILocation(line: 62, column: 57, scope: !1431)
!1577 = !DILocalVariable(name: "position", arg: 3, scope: !1431, file: !24, line: 62, type: !1571)
!1578 = !DILocation(line: 62, column: 78, scope: !1431)
!1579 = !DILocalVariable(name: "size", arg: 4, scope: !1431, file: !24, line: 62, type: !14)
!1580 = !DILocation(line: 62, column: 92, scope: !1431)
!1581 = !DILocalVariable(name: "vclip_type", arg: 5, scope: !1431, file: !24, line: 62, type: !7)
!1582 = !DILocation(line: 62, column: 102, scope: !1431)
!1583 = !DILocalVariable(name: "maxdamage", arg: 6, scope: !1431, file: !24, line: 62, type: !14)
!1584 = !DILocation(line: 62, column: 118, scope: !1431)
!1585 = !DILocalVariable(name: "maxdistance", arg: 7, scope: !1431, file: !24, line: 62, type: !14)
!1586 = !DILocation(line: 62, column: 133, scope: !1431)
!1587 = !DILocalVariable(name: "maxforce", arg: 8, scope: !1431, file: !24, line: 62, type: !14)
!1588 = !DILocation(line: 62, column: 150, scope: !1431)
!1589 = !DILocalVariable(name: "parent", arg: 9, scope: !1431, file: !24, line: 62, type: !7)
!1590 = !DILocation(line: 62, column: 164, scope: !1431)
!1591 = !DILocalVariable(name: "objnum", scope: !1431, file: !24, line: 64, type: !7)
!1592 = !DILocation(line: 64, column: 6, scope: !1431)
!1593 = !DILocalVariable(name: "obj", scope: !1431, file: !24, line: 65, type: !1434)
!1594 = !DILocation(line: 65, column: 10, scope: !1431)
!1595 = !DILocation(line: 67, column: 36, scope: !1431)
!1596 = !DILocation(line: 67, column: 47, scope: !1431)
!1597 = !DILocation(line: 67, column: 54, scope: !1431)
!1598 = !DILocation(line: 67, column: 84, scope: !1431)
!1599 = !DILocation(line: 67, column: 11, scope: !1431)
!1600 = !DILocation(line: 67, column: 9, scope: !1431)
!1601 = !DILocation(line: 70, column: 6, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1431, file: !24, line: 70, column: 6)
!1603 = !DILocation(line: 70, column: 13, scope: !1602)
!1604 = !DILocation(line: 72, column: 3, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1602, file: !24, line: 71, column: 2)
!1606 = !DILocation(line: 73, column: 3, scope: !1605)
!1607 = !DILocation(line: 76, column: 17, scope: !1431)
!1608 = !DILocation(line: 76, column: 9, scope: !1431)
!1609 = !DILocation(line: 76, column: 6, scope: !1431)
!1610 = !DILocation(line: 82, column: 24, scope: !1431)
!1611 = !DILocation(line: 82, column: 18, scope: !1431)
!1612 = !DILocation(line: 82, column: 37, scope: !1431)
!1613 = !DILocation(line: 82, column: 2, scope: !1431)
!1614 = !DILocation(line: 82, column: 7, scope: !1431)
!1615 = !DILocation(line: 82, column: 16, scope: !1431)
!1616 = !DILocation(line: 83, column: 2, scope: !1431)
!1617 = !DILocation(line: 83, column: 7, scope: !1431)
!1618 = !DILocation(line: 83, column: 23, scope: !1431)
!1619 = !DILocation(line: 83, column: 34, scope: !1431)
!1620 = !DILocation(line: 84, column: 2, scope: !1431)
!1621 = !DILocation(line: 84, column: 7, scope: !1431)
!1622 = !DILocation(line: 84, column: 23, scope: !1431)
!1623 = !DILocation(line: 84, column: 37, scope: !1431)
!1624 = !DILocation(line: 85, column: 2, scope: !1431)
!1625 = !DILocation(line: 85, column: 7, scope: !1431)
!1626 = !DILocation(line: 85, column: 23, scope: !1431)
!1627 = !DILocation(line: 85, column: 35, scope: !1431)
!1628 = !DILocation(line: 87, column: 6, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1431, file: !24, line: 87, column: 6)
!1630 = !DILocation(line: 87, column: 16, scope: !1629)
!1631 = !DILocalVariable(name: "dist", scope: !1632, file: !24, line: 89, type: !14)
!1632 = distinct !DILexicalBlock(scope: !1629, file: !24, line: 88, column: 2)
!1633 = !DILocation(line: 89, column: 7, scope: !1632)
!1634 = !DILocalVariable(name: "force", scope: !1632, file: !24, line: 89, type: !14)
!1635 = !DILocation(line: 89, column: 13, scope: !1632)
!1636 = !DILocalVariable(name: "pos_hit", scope: !1632, file: !24, line: 90, type: !1451)
!1637 = !DILocation(line: 90, column: 14, scope: !1632)
!1638 = !DILocalVariable(name: "vforce", scope: !1632, file: !24, line: 90, type: !1451)
!1639 = !DILocation(line: 90, column: 23, scope: !1632)
!1640 = !DILocalVariable(name: "damage", scope: !1632, file: !24, line: 91, type: !14)
!1641 = !DILocation(line: 91, column: 7, scope: !1632)
!1642 = !DILocalVariable(name: "i", scope: !1632, file: !24, line: 92, type: !7)
!1643 = !DILocation(line: 92, column: 7, scope: !1632)
!1644 = !DILocalVariable(name: "obj0p", scope: !1632, file: !24, line: 93, type: !1434)
!1645 = !DILocation(line: 93, column: 12, scope: !1632)
!1646 = !DILocation(line: 97, column: 9, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1632, file: !24, line: 97, column: 3)
!1648 = !DILocation(line: 97, column: 8, scope: !1647)
!1649 = !DILocation(line: 97, column: 13, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1647, file: !24, line: 97, column: 3)
!1651 = !DILocation(line: 97, column: 16, scope: !1650)
!1652 = !DILocation(line: 97, column: 14, scope: !1650)
!1653 = !DILocation(line: 97, column: 3, scope: !1647)
!1654 = !DILocation(line: 102, column: 10, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1656, file: !24, line: 102, column: 9)
!1656 = distinct !DILexicalBlock(scope: !1650, file: !24, line: 98, column: 3)
!1657 = !DILocation(line: 102, column: 17, scope: !1655)
!1658 = !DILocation(line: 102, column: 15, scope: !1655)
!1659 = !DILocation(line: 102, column: 23, scope: !1655)
!1660 = !DILocation(line: 102, column: 28, scope: !1655)
!1661 = !DILocation(line: 102, column: 35, scope: !1655)
!1662 = !DILocation(line: 102, column: 40, scope: !1655)
!1663 = !DILocation(line: 102, column: 27, scope: !1655)
!1664 = !DILocation(line: 102, column: 60, scope: !1655)
!1665 = !DILocation(line: 102, column: 65, scope: !1655)
!1666 = !DILocation(line: 102, column: 72, scope: !1655)
!1667 = !DILocation(line: 102, column: 76, scope: !1655)
!1668 = !DILocation(line: 102, column: 89, scope: !1655)
!1669 = !DILocation(line: 102, column: 93, scope: !1655)
!1670 = !DILocation(line: 102, column: 100, scope: !1655)
!1671 = !DILocation(line: 102, column: 102, scope: !1655)
!1672 = !DILocation(line: 102, column: 117, scope: !1655)
!1673 = !DILocation(line: 102, column: 120, scope: !1655)
!1674 = !DILocation(line: 102, column: 127, scope: !1655)
!1675 = !DILocation(line: 102, column: 129, scope: !1655)
!1676 = !DILocation(line: 102, column: 144, scope: !1655)
!1677 = !DILocation(line: 102, column: 147, scope: !1655)
!1678 = !DILocation(line: 102, column: 154, scope: !1655)
!1679 = !DILocation(line: 102, column: 156, scope: !1655)
!1680 = !DILocation(line: 102, column: 169, scope: !1655)
!1681 = !DILocation(line: 102, column: 173, scope: !1655)
!1682 = !DILocation(line: 102, column: 180, scope: !1655)
!1683 = !DILocation(line: 102, column: 185, scope: !1655)
!1684 = !DILocation(line: 102, column: 202, scope: !1655)
!1685 = !DILocation(line: 102, column: 206, scope: !1655)
!1686 = !DILocation(line: 102, column: 213, scope: !1655)
!1687 = !DILocation(line: 102, column: 217, scope: !1655)
!1688 = !DILocation(line: 102, column: 231, scope: !1655)
!1689 = !DILocation(line: 102, column: 236, scope: !1655)
!1690 = !DILocation(line: 102, column: 243, scope: !1655)
!1691 = !DILocation(line: 102, column: 247, scope: !1655)
!1692 = !DILocation(line: 102, column: 260, scope: !1655)
!1693 = !DILocation(line: 102, column: 273, scope: !1655)
!1694 = !DILocation(line: 102, column: 265, scope: !1655)
!1695 = !DILocation(line: 102, column: 281, scope: !1655)
!1696 = !DILocation(line: 102, column: 286, scope: !1655)
!1697 = !DILocation(line: 102, column: 300, scope: !1655)
!1698 = !DILocation(line: 102, column: 312, scope: !1655)
!1699 = !DILocation(line: 102, column: 304, scope: !1655)
!1700 = !DILocation(line: 102, column: 320, scope: !1655)
!1701 = !DILocation(line: 102, column: 326, scope: !1655)
!1702 = !DILocation(line: 102, column: 333, scope: !1655)
!1703 = !DILocation(line: 102, column: 323, scope: !1655)
!1704 = !DILocation(line: 103, column: 32, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1655, file: !24, line: 102, column: 341)
!1706 = !DILocation(line: 103, column: 39, scope: !1705)
!1707 = !DILocation(line: 103, column: 45, scope: !1705)
!1708 = !DILocation(line: 103, column: 50, scope: !1705)
!1709 = !DILocation(line: 103, column: 12, scope: !1705)
!1710 = !DILocation(line: 103, column: 10, scope: !1705)
!1711 = !DILocation(line: 105, column: 10, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1705, file: !24, line: 105, column: 10)
!1713 = !DILocation(line: 105, column: 17, scope: !1712)
!1714 = !DILocation(line: 105, column: 15, scope: !1712)
!1715 = !DILocation(line: 107, column: 38, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1717, file: !24, line: 107, column: 10)
!1717 = distinct !DILexicalBlock(scope: !1712, file: !24, line: 106, column: 5)
!1718 = !DILocation(line: 107, column: 43, scope: !1716)
!1719 = !DILocation(line: 107, column: 10, scope: !1716)
!1720 = !DILocation(line: 109, column: 16, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1716, file: !24, line: 108, column: 6)
!1722 = !DILocation(line: 109, column: 39, scope: !1721)
!1723 = !DILocation(line: 109, column: 45, scope: !1721)
!1724 = !DILocation(line: 109, column: 56, scope: !1721)
!1725 = !DILocation(line: 109, column: 28, scope: !1721)
!1726 = !DILocation(line: 109, column: 26, scope: !1721)
!1727 = !DILocation(line: 109, column: 14, scope: !1721)
!1728 = !DILocation(line: 110, column: 15, scope: !1721)
!1729 = !DILocation(line: 110, column: 37, scope: !1721)
!1730 = !DILocation(line: 110, column: 43, scope: !1721)
!1731 = !DILocation(line: 110, column: 53, scope: !1721)
!1732 = !DILocation(line: 110, column: 26, scope: !1721)
!1733 = !DILocation(line: 110, column: 24, scope: !1721)
!1734 = !DILocation(line: 110, column: 13, scope: !1721)
!1735 = !DILocation(line: 113, column: 46, scope: !1721)
!1736 = !DILocation(line: 113, column: 53, scope: !1721)
!1737 = !DILocation(line: 113, column: 59, scope: !1721)
!1738 = !DILocation(line: 113, column: 64, scope: !1721)
!1739 = !DILocation(line: 113, column: 7, scope: !1721)
!1740 = !DILocation(line: 114, column: 29, scope: !1721)
!1741 = !DILocation(line: 114, column: 7, scope: !1721)
!1742 = !DILocation(line: 117, column: 42, scope: !1721)
!1743 = !DILocation(line: 117, column: 47, scope: !1721)
!1744 = !DILocation(line: 117, column: 53, scope: !1721)
!1745 = !DILocation(line: 117, column: 60, scope: !1721)
!1746 = !DILocation(line: 117, column: 20, scope: !1721)
!1747 = !DILocation(line: 117, column: 73, scope: !1721)
!1748 = !DILocation(line: 117, column: 80, scope: !1721)
!1749 = !DILocation(line: 117, column: 86, scope: !1721)
!1750 = !DILocation(line: 117, column: 93, scope: !1721)
!1751 = !DILocation(line: 117, column: 100, scope: !1721)
!1752 = !DILocation(line: 117, column: 98, scope: !1721)
!1753 = !DILocation(line: 117, column: 66, scope: !1721)
!1754 = !DILocation(line: 117, column: 7, scope: !1721)
!1755 = !DILocation(line: 119, column: 16, scope: !1721)
!1756 = !DILocation(line: 119, column: 23, scope: !1721)
!1757 = !DILocation(line: 119, column: 7, scope: !1721)
!1758 = !DILocation(line: 122, column: 26, scope: !1759)
!1759 = distinct !DILexicalBlock(scope: !1721, file: !24, line: 120, column: 7)
!1760 = !DILocation(line: 122, column: 9, scope: !1759)
!1761 = !DILocation(line: 124, column: 13, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1759, file: !24, line: 124, column: 13)
!1763 = !DILocation(line: 124, column: 20, scope: !1762)
!1764 = !DILocation(line: 124, column: 23, scope: !1762)
!1765 = !DILocation(line: 124, column: 39, scope: !1762)
!1766 = !DILocation(line: 124, column: 42, scope: !1762)
!1767 = !DILocation(line: 124, column: 49, scope: !1762)
!1768 = !DILocation(line: 124, column: 52, scope: !1762)
!1769 = !DILocation(line: 126, column: 21, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1771, file: !24, line: 126, column: 14)
!1771 = distinct !DILexicalBlock(scope: !1762, file: !24, line: 125, column: 9)
!1772 = !DILocation(line: 126, column: 26, scope: !1770)
!1773 = !DILocation(line: 126, column: 14, scope: !1770)
!1774 = !DILocation(line: 126, column: 35, scope: !1770)
!1775 = !DILocation(line: 126, column: 33, scope: !1770)
!1776 = !DILocation(line: 128, column: 11, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1770, file: !24, line: 127, column: 10)
!1778 = !DILocation(line: 128, column: 18, scope: !1777)
!1779 = !DILocation(line: 128, column: 24, scope: !1777)
!1780 = !DILocation(line: 129, column: 33, scope: !1777)
!1781 = !DILocation(line: 129, column: 40, scope: !1777)
!1782 = !DILocation(line: 129, column: 47, scope: !1777)
!1783 = !DILocation(line: 129, column: 11, scope: !1777)
!1784 = !DILocation(line: 130, column: 10, scope: !1777)
!1785 = !DILocation(line: 131, column: 9, scope: !1771)
!1786 = !DILocation(line: 132, column: 9, scope: !1759)
!1787 = !DILocation(line: 136, column: 26, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1759, file: !24, line: 135, column: 9)
!1789 = !DILocation(line: 136, column: 9, scope: !1788)
!1790 = !DILocation(line: 139, column: 14, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1788, file: !24, line: 139, column: 13)
!1792 = !DILocation(line: 139, column: 19, scope: !1791)
!1793 = !DILocation(line: 139, column: 28, scope: !1791)
!1794 = !DILocation(line: 139, column: 44, scope: !1791)
!1795 = !DILocation(line: 139, column: 51, scope: !1791)
!1796 = !DILocation(line: 139, column: 33, scope: !1791)
!1797 = !DILocation(line: 139, column: 55, scope: !1791)
!1798 = !DILocation(line: 139, column: 66, scope: !1791)
!1799 = !DILocation(line: 139, column: 82, scope: !1791)
!1800 = !DILocation(line: 139, column: 88, scope: !1791)
!1801 = !DILocation(line: 139, column: 70, scope: !1791)
!1802 = !DILocation(line: 139, column: 92, scope: !1791)
!1803 = !DILocation(line: 139, column: 69, scope: !1791)
!1804 = !DILocalVariable(name: "aip", scope: !1805, file: !24, line: 141, type: !1806)
!1805 = distinct !DILexicalBlock(scope: !1791, file: !24, line: 140, column: 9)
!1806 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1516, size: 64)
!1807 = !DILocation(line: 141, column: 21, scope: !1805)
!1808 = !DILocation(line: 141, column: 28, scope: !1805)
!1809 = !DILocation(line: 141, column: 35, scope: !1805)
!1810 = !DILocalVariable(name: "force_val", scope: !1805, file: !24, line: 142, type: !7)
!1811 = !DILocation(line: 142, column: 16, scope: !1805)
!1812 = !DILocation(line: 142, column: 39, scope: !1805)
!1813 = !DILocation(line: 142, column: 79, scope: !1805)
!1814 = !DILocation(line: 142, column: 85, scope: !1805)
!1815 = !DILocation(line: 142, column: 67, scope: !1805)
!1816 = !DILocation(line: 142, column: 89, scope: !1805)
!1817 = !DILocation(line: 142, column: 65, scope: !1805)
!1818 = !DILocation(line: 142, column: 96, scope: !1805)
!1819 = !DILocation(line: 142, column: 32, scope: !1805)
!1820 = !DILocation(line: 142, column: 106, scope: !1805)
!1821 = !DILocation(line: 142, column: 28, scope: !1805)
!1822 = !DILocation(line: 142, column: 112, scope: !1805)
!1823 = !DILocation(line: 144, column: 14, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1805, file: !24, line: 144, column: 14)
!1825 = !DILocation(line: 144, column: 19, scope: !1824)
!1826 = !DILocation(line: 144, column: 33, scope: !1824)
!1827 = !DILocation(line: 144, column: 49, scope: !1824)
!1828 = !DILocation(line: 144, column: 47, scope: !1824)
!1829 = !DILocation(line: 144, column: 59, scope: !1824)
!1830 = !DILocation(line: 146, column: 33, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1824, file: !24, line: 145, column: 10)
!1832 = !DILocation(line: 146, column: 11, scope: !1831)
!1833 = !DILocation(line: 146, column: 16, scope: !1831)
!1834 = !DILocation(line: 146, column: 30, scope: !1831)
!1835 = !DILocation(line: 147, column: 50, scope: !1831)
!1836 = !DILocation(line: 147, column: 59, scope: !1831)
!1837 = !DILocation(line: 147, column: 70, scope: !1831)
!1838 = !DILocation(line: 147, column: 68, scope: !1831)
!1839 = !DILocation(line: 147, column: 80, scope: !1831)
!1840 = !DILocation(line: 147, column: 11, scope: !1831)
!1841 = !DILocation(line: 147, column: 18, scope: !1831)
!1842 = !DILocation(line: 147, column: 34, scope: !1831)
!1843 = !DILocation(line: 147, column: 44, scope: !1831)
!1844 = !DILocation(line: 147, column: 46, scope: !1831)
!1845 = !DILocation(line: 148, column: 50, scope: !1831)
!1846 = !DILocation(line: 148, column: 59, scope: !1831)
!1847 = !DILocation(line: 148, column: 70, scope: !1831)
!1848 = !DILocation(line: 148, column: 68, scope: !1831)
!1849 = !DILocation(line: 148, column: 80, scope: !1831)
!1850 = !DILocation(line: 148, column: 11, scope: !1831)
!1851 = !DILocation(line: 148, column: 18, scope: !1831)
!1852 = !DILocation(line: 148, column: 34, scope: !1831)
!1853 = !DILocation(line: 148, column: 44, scope: !1831)
!1854 = !DILocation(line: 148, column: 46, scope: !1831)
!1855 = !DILocation(line: 149, column: 50, scope: !1831)
!1856 = !DILocation(line: 149, column: 59, scope: !1831)
!1857 = !DILocation(line: 149, column: 70, scope: !1831)
!1858 = !DILocation(line: 149, column: 68, scope: !1831)
!1859 = !DILocation(line: 149, column: 80, scope: !1831)
!1860 = !DILocation(line: 149, column: 11, scope: !1831)
!1861 = !DILocation(line: 149, column: 18, scope: !1831)
!1862 = !DILocation(line: 149, column: 34, scope: !1831)
!1863 = !DILocation(line: 149, column: 44, scope: !1831)
!1864 = !DILocation(line: 149, column: 46, scope: !1831)
!1865 = !DILocation(line: 150, column: 11, scope: !1831)
!1866 = !DILocation(line: 150, column: 18, scope: !1831)
!1867 = !DILocation(line: 150, column: 34, scope: !1831)
!1868 = !DILocation(line: 150, column: 40, scope: !1831)
!1869 = !DILocation(line: 154, column: 10, scope: !1831)
!1870 = !DILocation(line: 155, column: 11, scope: !1824)
!1871 = !DILocation(line: 155, column: 16, scope: !1824)
!1872 = !DILocation(line: 155, column: 29, scope: !1824)
!1873 = !DILocation(line: 157, column: 9, scope: !1805)
!1874 = !DILocalVariable(name: "neg_vforce", scope: !1875, file: !24, line: 161, type: !1451)
!1875 = distinct !DILexicalBlock(scope: !1788, file: !24, line: 160, column: 9)
!1876 = !DILocation(line: 161, column: 21, scope: !1875)
!1877 = !DILocation(line: 162, column: 32, scope: !1875)
!1878 = !DILocation(line: 162, column: 34, scope: !1875)
!1879 = !DILocation(line: 162, column: 46, scope: !1875)
!1880 = !DILocation(line: 162, column: 44, scope: !1875)
!1881 = !DILocation(line: 162, column: 39, scope: !1875)
!1882 = !DILocation(line: 162, column: 63, scope: !1875)
!1883 = !DILocation(line: 162, column: 21, scope: !1875)
!1884 = !DILocation(line: 162, column: 23, scope: !1875)
!1885 = !DILocation(line: 163, column: 32, scope: !1875)
!1886 = !DILocation(line: 163, column: 34, scope: !1875)
!1887 = !DILocation(line: 163, column: 46, scope: !1875)
!1888 = !DILocation(line: 163, column: 44, scope: !1875)
!1889 = !DILocation(line: 163, column: 39, scope: !1875)
!1890 = !DILocation(line: 163, column: 63, scope: !1875)
!1891 = !DILocation(line: 163, column: 21, scope: !1875)
!1892 = !DILocation(line: 163, column: 23, scope: !1875)
!1893 = !DILocation(line: 164, column: 32, scope: !1875)
!1894 = !DILocation(line: 164, column: 34, scope: !1875)
!1895 = !DILocation(line: 164, column: 46, scope: !1875)
!1896 = !DILocation(line: 164, column: 44, scope: !1875)
!1897 = !DILocation(line: 164, column: 39, scope: !1875)
!1898 = !DILocation(line: 164, column: 63, scope: !1875)
!1899 = !DILocation(line: 164, column: 21, scope: !1875)
!1900 = !DILocation(line: 164, column: 23, scope: !1875)
!1901 = !DILocation(line: 165, column: 25, scope: !1875)
!1902 = !DILocation(line: 165, column: 10, scope: !1875)
!1903 = !DILocation(line: 167, column: 14, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1788, file: !24, line: 167, column: 14)
!1905 = !DILocation(line: 167, column: 21, scope: !1904)
!1906 = !DILocation(line: 167, column: 29, scope: !1904)
!1907 = !DILocation(line: 169, column: 25, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1909, file: !24, line: 169, column: 14)
!1909 = distinct !DILexicalBlock(scope: !1904, file: !24, line: 168, column: 9)
!1910 = !DILocation(line: 169, column: 32, scope: !1908)
!1911 = !DILocation(line: 169, column: 14, scope: !1908)
!1912 = !DILocation(line: 169, column: 36, scope: !1908)
!1913 = !DILocation(line: 170, column: 51, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1908, file: !24, line: 170, column: 15)
!1915 = !DILocation(line: 170, column: 58, scope: !1914)
!1916 = !DILocation(line: 170, column: 40, scope: !1914)
!1917 = !DILocation(line: 170, column: 62, scope: !1914)
!1918 = !DILocation(line: 170, column: 71, scope: !1914)
!1919 = !DILocation(line: 170, column: 15, scope: !1914)
!1920 = !DILocation(line: 171, column: 19, scope: !1914)
!1921 = !DILocation(line: 171, column: 12, scope: !1914)
!1922 = !DILocation(line: 170, column: 79, scope: !1914)
!1923 = !DILocation(line: 173, column: 36, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1909, file: !24, line: 173, column: 14)
!1925 = !DILocation(line: 173, column: 43, scope: !1924)
!1926 = !DILocation(line: 173, column: 51, scope: !1924)
!1927 = !DILocation(line: 173, column: 14, scope: !1924)
!1928 = !DILocation(line: 174, column: 16, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1924, file: !24, line: 174, column: 15)
!1930 = !DILocation(line: 174, column: 21, scope: !1929)
!1931 = !DILocation(line: 174, column: 30, scope: !1929)
!1932 = !DILocation(line: 174, column: 34, scope: !1929)
!1933 = !DILocation(line: 174, column: 52, scope: !1929)
!1934 = !DILocation(line: 174, column: 44, scope: !1929)
!1935 = !DILocation(line: 174, column: 64, scope: !1929)
!1936 = !DILocation(line: 174, column: 41, scope: !1929)
!1937 = !DILocation(line: 175, column: 43, scope: !1929)
!1938 = !DILocation(line: 175, column: 50, scope: !1929)
!1939 = !DILocation(line: 175, column: 32, scope: !1929)
!1940 = !DILocation(line: 175, column: 54, scope: !1929)
!1941 = !DILocation(line: 175, column: 12, scope: !1929)
!1942 = !DILocation(line: 174, column: 70, scope: !1929)
!1943 = !DILocation(line: 176, column: 9, scope: !1909)
!1944 = !DILocation(line: 178, column: 14, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1788, file: !24, line: 178, column: 13)
!1946 = !DILocation(line: 178, column: 19, scope: !1945)
!1947 = !DILocation(line: 178, column: 28, scope: !1945)
!1948 = !DILocation(line: 178, column: 43, scope: !1945)
!1949 = !DILocation(line: 178, column: 50, scope: !1945)
!1950 = !DILocation(line: 178, column: 32, scope: !1945)
!1951 = !DILocation(line: 178, column: 54, scope: !1945)
!1952 = !DILocation(line: 178, column: 31, scope: !1945)
!1953 = !DILocation(line: 178, column: 65, scope: !1945)
!1954 = !DILocation(line: 178, column: 82, scope: !1945)
!1955 = !DILocation(line: 178, column: 88, scope: !1945)
!1956 = !DILocation(line: 178, column: 70, scope: !1945)
!1957 = !DILocation(line: 178, column: 92, scope: !1945)
!1958 = !DILocalVariable(name: "i", scope: !1959, file: !24, line: 180, type: !7)
!1959 = distinct !DILexicalBlock(scope: !1945, file: !24, line: 179, column: 9)
!1960 = !DILocation(line: 180, column: 14, scope: !1959)
!1961 = !DILocalVariable(name: "count", scope: !1959, file: !24, line: 180, type: !7)
!1962 = !DILocation(line: 180, column: 17, scope: !1959)
!1963 = !DILocalVariable(name: "ouch_str", scope: !1959, file: !24, line: 181, type: !1964)
!1964 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 208, elements: !42)
!1965 = !DILocation(line: 181, column: 15, scope: !1959)
!1966 = !DILocation(line: 183, column: 22, scope: !1959)
!1967 = !DILocation(line: 183, column: 28, scope: !1959)
!1968 = !DILocation(line: 183, column: 18, scope: !1959)
!1969 = !DILocation(line: 183, column: 16, scope: !1959)
!1970 = !DILocation(line: 184, column: 14, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1959, file: !24, line: 184, column: 14)
!1972 = !DILocation(line: 184, column: 20, scope: !1971)
!1973 = !DILocation(line: 185, column: 17, scope: !1971)
!1974 = !DILocation(line: 185, column: 11, scope: !1971)
!1975 = !DILocation(line: 186, column: 19, scope: !1976)
!1976 = distinct !DILexicalBlock(scope: !1971, file: !24, line: 186, column: 19)
!1977 = !DILocation(line: 186, column: 25, scope: !1976)
!1978 = !DILocation(line: 187, column: 17, scope: !1976)
!1979 = !DILocation(line: 187, column: 11, scope: !1976)
!1980 = !DILocation(line: 188, column: 10, scope: !1959)
!1981 = !DILocation(line: 188, column: 22, scope: !1959)
!1982 = !DILocation(line: 189, column: 16, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1959, file: !24, line: 189, column: 10)
!1984 = !DILocation(line: 189, column: 15, scope: !1983)
!1985 = !DILocation(line: 189, column: 20, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1983, file: !24, line: 189, column: 10)
!1987 = !DILocation(line: 189, column: 22, scope: !1986)
!1988 = !DILocation(line: 189, column: 21, scope: !1986)
!1989 = !DILocation(line: 189, column: 10, scope: !1983)
!1990 = !DILocation(line: 190, column: 18, scope: !1986)
!1991 = !DILocation(line: 190, column: 11, scope: !1986)
!1992 = !DILocation(line: 189, column: 30, scope: !1986)
!1993 = !DILocation(line: 189, column: 10, scope: !1986)
!1994 = distinct !{!1994, !1989, !1995, !1996}
!1995 = !DILocation(line: 190, column: 36, scope: !1983)
!1996 = !{!"llvm.loop.mustprogress"}
!1997 = !DILocation(line: 192, column: 24, scope: !1959)
!1998 = !DILocation(line: 192, column: 10, scope: !1959)
!1999 = !DILocation(line: 193, column: 9, scope: !1959)
!2000 = !DILocation(line: 194, column: 9, scope: !1788)
!2001 = !DILocation(line: 197, column: 14, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1759, file: !24, line: 197, column: 14)
!2003 = !DILocation(line: 197, column: 21, scope: !2002)
!2004 = !DILocation(line: 197, column: 29, scope: !2002)
!2005 = !DILocation(line: 199, column: 37, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !2002, file: !24, line: 198, column: 9)
!2007 = !DILocation(line: 199, column: 44, scope: !2006)
!2008 = !DILocation(line: 199, column: 52, scope: !2006)
!2009 = !DILocation(line: 199, column: 10, scope: !2006)
!2010 = !DILocation(line: 200, column: 9, scope: !2006)
!2011 = !DILocation(line: 201, column: 9, scope: !1759)
!2012 = !DILocalVariable(name: "killer", scope: !2013, file: !24, line: 204, type: !1434)
!2013 = distinct !DILexicalBlock(scope: !1759, file: !24, line: 203, column: 8)
!2014 = !DILocation(line: 204, column: 18, scope: !2013)
!2015 = !DILocalVariable(name: "vforce2", scope: !2013, file: !24, line: 205, type: !1451)
!2016 = !DILocation(line: 205, column: 20, scope: !2013)
!2017 = !DILocation(line: 208, column: 14, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2013, file: !24, line: 208, column: 13)
!2019 = !DILocation(line: 208, column: 19, scope: !2018)
!2020 = !DILocation(line: 208, column: 28, scope: !2018)
!2021 = !DILocation(line: 208, column: 43, scope: !2018)
!2022 = !DILocation(line: 208, column: 49, scope: !2018)
!2023 = !DILocation(line: 208, column: 31, scope: !2018)
!2024 = !DILocation(line: 208, column: 53, scope: !2018)
!2025 = !DILocation(line: 208, column: 59, scope: !2018)
!2026 = !DILocation(line: 208, column: 62, scope: !2018)
!2027 = !DILocation(line: 208, column: 69, scope: !2018)
!2028 = !DILocation(line: 208, column: 73, scope: !2018)
!2029 = !DILocation(line: 208, column: 71, scope: !2018)
!2030 = !DILocalVariable(name: "fe", scope: !2031, file: !24, line: 210, type: !7)
!2031 = distinct !DILexicalBlock(scope: !2018, file: !24, line: 209, column: 9)
!2032 = !DILocation(line: 210, column: 14, scope: !2031)
!2033 = !DILocation(line: 212, column: 24, scope: !2031)
!2034 = !DILocation(line: 212, column: 38, scope: !2031)
!2035 = !DILocation(line: 212, column: 56, scope: !2031)
!2036 = !DILocation(line: 212, column: 62, scope: !2031)
!2037 = !DILocation(line: 212, column: 44, scope: !2031)
!2038 = !DILocation(line: 212, column: 66, scope: !2031)
!2039 = !DILocation(line: 212, column: 43, scope: !2031)
!2040 = !DILocation(line: 212, column: 71, scope: !2031)
!2041 = !DILocation(line: 212, column: 32, scope: !2031)
!2042 = !DILocation(line: 212, column: 15, scope: !2031)
!2043 = !DILocation(line: 212, column: 13, scope: !2031)
!2044 = !DILocation(line: 214, column: 14, scope: !2045)
!2045 = distinct !DILexicalBlock(scope: !2031, file: !24, line: 214, column: 14)
!2046 = !DILocation(line: 214, column: 20, scope: !2045)
!2047 = !DILocation(line: 214, column: 37, scope: !2045)
!2048 = !DILocation(line: 214, column: 57, scope: !2045)
!2049 = !DILocation(line: 214, column: 72, scope: !2045)
!2050 = !DILocation(line: 214, column: 54, scope: !2045)
!2051 = !DILocation(line: 216, column: 14, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2045, file: !24, line: 215, column: 10)
!2053 = !DILocation(line: 217, column: 17, scope: !2052)
!2054 = !DILocation(line: 218, column: 10, scope: !2052)
!2055 = !DILocation(line: 219, column: 14, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2031, file: !24, line: 219, column: 14)
!2057 = !DILocation(line: 219, column: 20, scope: !2056)
!2058 = !DILocation(line: 220, column: 26, scope: !2059)
!2059 = distinct !DILexicalBlock(scope: !2056, file: !24, line: 219, column: 28)
!2060 = !DILocation(line: 220, column: 24, scope: !2059)
!2061 = !DILocation(line: 221, column: 29, scope: !2059)
!2062 = !DILocation(line: 221, column: 39, scope: !2059)
!2063 = !DILocation(line: 221, column: 43, scope: !2059)
!2064 = !DILocation(line: 221, column: 42, scope: !2059)
!2065 = !DILocation(line: 221, column: 35, scope: !2059)
!2066 = !DILocation(line: 221, column: 33, scope: !2059)
!2067 = !DILocation(line: 221, column: 51, scope: !2059)
!2068 = !DILocation(line: 221, column: 61, scope: !2059)
!2069 = !DILocation(line: 221, column: 65, scope: !2059)
!2070 = !DILocation(line: 221, column: 64, scope: !2059)
!2071 = !DILocation(line: 221, column: 57, scope: !2059)
!2072 = !DILocation(line: 221, column: 55, scope: !2059)
!2073 = !DILocation(line: 221, column: 73, scope: !2059)
!2074 = !DILocation(line: 221, column: 83, scope: !2059)
!2075 = !DILocation(line: 221, column: 87, scope: !2059)
!2076 = !DILocation(line: 221, column: 86, scope: !2059)
!2077 = !DILocation(line: 221, column: 79, scope: !2059)
!2078 = !DILocation(line: 221, column: 77, scope: !2059)
!2079 = !DILocation(line: 221, column: 11, scope: !2059)
!2080 = !DILocation(line: 222, column: 11, scope: !2059)
!2081 = !DILocation(line: 223, column: 10, scope: !2059)
!2082 = !DILocation(line: 224, column: 9, scope: !2031)
!2083 = !DILocation(line: 226, column: 14, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2013, file: !24, line: 226, column: 13)
!2085 = !DILocation(line: 226, column: 19, scope: !2084)
!2086 = !DILocation(line: 226, column: 28, scope: !2084)
!2087 = !DILocation(line: 226, column: 32, scope: !2084)
!2088 = !DILocation(line: 226, column: 42, scope: !2084)
!2089 = !DILocation(line: 226, column: 31, scope: !2084)
!2090 = !DILocation(line: 226, column: 54, scope: !2084)
!2091 = !DILocation(line: 226, column: 58, scope: !2084)
!2092 = !DILocation(line: 226, column: 64, scope: !2084)
!2093 = !DILocation(line: 226, column: 69, scope: !2084)
!2094 = !DILocation(line: 227, column: 19, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2084, file: !24, line: 226, column: 85)
!2096 = !DILocation(line: 227, column: 17, scope: !2095)
!2097 = !DILocation(line: 228, column: 9, scope: !2095)
!2098 = !DILocation(line: 229, column: 17, scope: !2013)
!2099 = !DILocation(line: 230, column: 13, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2013, file: !24, line: 230, column: 13)
!2101 = !DILocation(line: 230, column: 20, scope: !2100)
!2102 = !DILocation(line: 231, column: 28, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2100, file: !24, line: 230, column: 27)
!2104 = !DILocation(line: 231, column: 20, scope: !2103)
!2105 = !DILocation(line: 231, column: 17, scope: !2103)
!2106 = !DILocation(line: 232, column: 14, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2103, file: !24, line: 232, column: 14)
!2108 = !DILocation(line: 232, column: 24, scope: !2107)
!2109 = !DILocation(line: 232, column: 21, scope: !2107)
!2110 = !DILocation(line: 233, column: 19, scope: !2107)
!2111 = !DILocation(line: 233, column: 21, scope: !2107)
!2112 = !DILocation(line: 233, column: 11, scope: !2107)
!2113 = !DILocation(line: 233, column: 35, scope: !2103)
!2114 = !DILocation(line: 233, column: 37, scope: !2103)
!2115 = !DILocation(line: 233, column: 51, scope: !2103)
!2116 = !DILocation(line: 233, column: 53, scope: !2103)
!2117 = !DILocation(line: 234, column: 9, scope: !2103)
!2118 = !DILocation(line: 235, column: 17, scope: !2013)
!2119 = !DILocation(line: 235, column: 19, scope: !2013)
!2120 = !DILocation(line: 235, column: 33, scope: !2013)
!2121 = !DILocation(line: 235, column: 35, scope: !2013)
!2122 = !DILocation(line: 235, column: 49, scope: !2013)
!2123 = !DILocation(line: 235, column: 51, scope: !2013)
!2124 = !DILocation(line: 237, column: 26, scope: !2013)
!2125 = !DILocation(line: 237, column: 9, scope: !2013)
!2126 = !DILocation(line: 238, column: 24, scope: !2013)
!2127 = !DILocation(line: 238, column: 9, scope: !2013)
!2128 = !DILocation(line: 239, column: 13, scope: !2129)
!2129 = distinct !DILexicalBlock(scope: !2013, file: !24, line: 239, column: 13)
!2130 = !DILocation(line: 239, column: 30, scope: !2129)
!2131 = !DILocation(line: 240, column: 17, scope: !2129)
!2132 = !DILocation(line: 240, column: 10, scope: !2129)
!2133 = !DILocation(line: 241, column: 14, scope: !2134)
!2134 = distinct !DILexicalBlock(scope: !2013, file: !24, line: 241, column: 14)
!2135 = !DILocation(line: 241, column: 21, scope: !2134)
!2136 = !DILocation(line: 241, column: 29, scope: !2134)
!2137 = !DILocation(line: 242, column: 33, scope: !2134)
!2138 = !DILocation(line: 242, column: 40, scope: !2134)
!2139 = !DILocation(line: 242, column: 48, scope: !2134)
!2140 = !DILocation(line: 242, column: 10, scope: !2134)
!2141 = !DILocation(line: 244, column: 9, scope: !1759)
!2142 = !DILocation(line: 247, column: 9, scope: !1759)
!2143 = !DILocation(line: 248, column: 7, scope: !1759)
!2144 = !DILocation(line: 249, column: 6, scope: !1721)
!2145 = !DILocation(line: 252, column: 5, scope: !1717)
!2146 = !DILocation(line: 253, column: 4, scope: !1705)
!2147 = !DILocation(line: 254, column: 9, scope: !1656)
!2148 = !DILocation(line: 255, column: 3, scope: !1656)
!2149 = !DILocation(line: 97, column: 39, scope: !1650)
!2150 = !DILocation(line: 97, column: 3, scope: !1650)
!2151 = distinct !{!2151, !1653, !2152, !1996}
!2152 = !DILocation(line: 255, column: 3, scope: !1647)
!2153 = !DILocation(line: 256, column: 2, scope: !1632)
!2154 = !DILocation(line: 260, column: 9, scope: !1431)
!2155 = !DILocation(line: 260, column: 2, scope: !1431)
!2156 = !DILocation(line: 262, column: 1, scope: !1431)
!2157 = distinct !DISubprogram(name: "fixmuldiv", linkageName: "_Z9fixmuldiviii", scope: !15, file: !15, line: 98, type: !2158, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2158 = !DISubroutineType(types: !2159)
!2159 = !{!14, !14, !14, !14}
!2160 = !DILocalVariable(name: "a", arg: 1, scope: !2157, file: !15, line: 98, type: !14)
!2161 = !DILocation(line: 98, column: 29, scope: !2157)
!2162 = !DILocalVariable(name: "b", arg: 2, scope: !2157, file: !15, line: 98, type: !14)
!2163 = !DILocation(line: 98, column: 36, scope: !2157)
!2164 = !DILocalVariable(name: "c", arg: 3, scope: !2157, file: !15, line: 98, type: !14)
!2165 = !DILocation(line: 98, column: 43, scope: !2157)
!2166 = !DILocation(line: 100, column: 6, scope: !2167)
!2167 = distinct !DILexicalBlock(scope: !2157, file: !15, line: 100, column: 6)
!2168 = !DILocation(line: 100, column: 8, scope: !2167)
!2169 = !DILocation(line: 100, column: 14, scope: !2167)
!2170 = !DILocation(line: 102, column: 24, scope: !2157)
!2171 = !DILocation(line: 102, column: 37, scope: !2157)
!2172 = !DILocation(line: 102, column: 26, scope: !2157)
!2173 = !DILocation(line: 102, column: 41, scope: !2157)
!2174 = !DILocation(line: 102, column: 39, scope: !2157)
!2175 = !DILocation(line: 102, column: 14, scope: !2157)
!2176 = !DILocation(line: 102, column: 2, scope: !2157)
!2177 = !DILocation(line: 103, column: 1, scope: !2157)
!2178 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !15, file: !15, line: 89, type: !2179, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2179 = !DISubroutineType(types: !2180)
!2180 = !{!14, !14, !14}
!2181 = !DILocalVariable(name: "a", arg: 1, scope: !2178, file: !15, line: 89, type: !14)
!2182 = !DILocation(line: 89, column: 26, scope: !2178)
!2183 = !DILocalVariable(name: "b", arg: 2, scope: !2178, file: !15, line: 89, type: !14)
!2184 = !DILocation(line: 89, column: 33, scope: !2178)
!2185 = !DILocation(line: 92, column: 6, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2178, file: !15, line: 92, column: 6)
!2187 = !DILocation(line: 92, column: 8, scope: !2186)
!2188 = !DILocation(line: 92, column: 14, scope: !2186)
!2189 = !DILocation(line: 94, column: 25, scope: !2178)
!2190 = !DILocation(line: 94, column: 27, scope: !2178)
!2191 = !DILocation(line: 94, column: 36, scope: !2178)
!2192 = !DILocation(line: 94, column: 34, scope: !2178)
!2193 = !DILocation(line: 94, column: 14, scope: !2178)
!2194 = !DILocation(line: 94, column: 2, scope: !2178)
!2195 = !DILocation(line: 95, column: 1, scope: !2178)
!2196 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !15, file: !15, line: 83, type: !2179, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2197 = !DILocalVariable(name: "a", arg: 1, scope: !2196, file: !15, line: 83, type: !14)
!2198 = !DILocation(line: 83, column: 26, scope: !2196)
!2199 = !DILocalVariable(name: "b", arg: 2, scope: !2196, file: !15, line: 83, type: !14)
!2200 = !DILocation(line: 83, column: 33, scope: !2196)
!2201 = !DILocation(line: 85, column: 19, scope: !2196)
!2202 = !DILocation(line: 85, column: 32, scope: !2196)
!2203 = !DILocation(line: 85, column: 21, scope: !2196)
!2204 = !DILocation(line: 85, column: 35, scope: !2196)
!2205 = !DILocation(line: 85, column: 9, scope: !2196)
!2206 = !DILocation(line: 85, column: 2, scope: !2196)
!2207 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !15, file: !15, line: 49, type: !2208, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2208 = !DISubroutineType(types: !2209)
!2209 = !{!14, !7}
!2210 = !DILocalVariable(name: "i", arg: 1, scope: !2207, file: !15, line: 49, type: !7)
!2211 = !DILocation(line: 49, column: 23, scope: !2207)
!2212 = !DILocation(line: 51, column: 9, scope: !2207)
!2213 = !DILocation(line: 51, column: 11, scope: !2207)
!2214 = !DILocation(line: 51, column: 2, scope: !2207)
!2215 = distinct !DISubprogram(name: "explode_badass_weapon", linkageName: "_Z21explode_badass_weaponP6objectP10vms_vector", scope: !24, file: !24, line: 293, type: !2216, scopeLine: 294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2216 = !DISubroutineType(types: !2217)
!2217 = !{!1434, !1434, !1571}
!2218 = !DILocalVariable(name: "obj", arg: 1, scope: !2215, file: !24, line: 293, type: !1434)
!2219 = !DILocation(line: 293, column: 39, scope: !2215)
!2220 = !DILocalVariable(name: "pos", arg: 2, scope: !2215, file: !24, line: 293, type: !1571)
!2221 = !DILocation(line: 293, column: 55, scope: !2215)
!2222 = !DILocalVariable(name: "wi", scope: !2215, file: !24, line: 295, type: !2223)
!2223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2224, size: 64)
!2224 = !DIDerivedType(tag: DW_TAG_typedef, name: "weapon_info", file: !2225, line: 80, baseType: !2226)
!2225 = !DIFile(filename: "main_d2/weapon.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a9e4f8b8f865fefc0854f8f4cf993ef2")
!2226 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "weapon_info", file: !2225, line: 24, size: 1024, flags: DIFlagTypePassByValue, elements: !2227, identifier: "_ZTS11weapon_info")
!2227 = !{!2228, !2229, !2230, !2231, !2232, !2233, !2234, !2235, !2236, !2237, !2238, !2239, !2240, !2241, !2242, !2243, !2244, !2245, !2246, !2247, !2248, !2249, !2250, !2251, !2252, !2253, !2259, !2260, !2261, !2262, !2266, !2267, !2268, !2269, !2270, !2271, !2272, !2273, !2274, !2275}
!2228 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !2226, file: !2225, line: 26, baseType: !175, size: 8)
!2229 = !DIDerivedType(tag: DW_TAG_member, name: "persistent", scope: !2226, file: !2225, line: 27, baseType: !175, size: 8, offset: 8)
!2230 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !2226, file: !2225, line: 28, baseType: !182, size: 16, offset: 16)
!2231 = !DIDerivedType(tag: DW_TAG_member, name: "model_num_inner", scope: !2226, file: !2225, line: 29, baseType: !182, size: 16, offset: 32)
!2232 = !DIDerivedType(tag: DW_TAG_member, name: "flash_vclip", scope: !2226, file: !2225, line: 31, baseType: !175, size: 8, offset: 48)
!2233 = !DIDerivedType(tag: DW_TAG_member, name: "robot_hit_vclip", scope: !2226, file: !2225, line: 32, baseType: !175, size: 8, offset: 56)
!2234 = !DIDerivedType(tag: DW_TAG_member, name: "flash_sound", scope: !2226, file: !2225, line: 33, baseType: !182, size: 16, offset: 64)
!2235 = !DIDerivedType(tag: DW_TAG_member, name: "wall_hit_vclip", scope: !2226, file: !2225, line: 35, baseType: !175, size: 8, offset: 80)
!2236 = !DIDerivedType(tag: DW_TAG_member, name: "fire_count", scope: !2226, file: !2225, line: 36, baseType: !175, size: 8, offset: 88)
!2237 = !DIDerivedType(tag: DW_TAG_member, name: "robot_hit_sound", scope: !2226, file: !2225, line: 37, baseType: !182, size: 16, offset: 96)
!2238 = !DIDerivedType(tag: DW_TAG_member, name: "ammo_usage", scope: !2226, file: !2225, line: 39, baseType: !175, size: 8, offset: 112)
!2239 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_vclip", scope: !2226, file: !2225, line: 40, baseType: !175, size: 8, offset: 120)
!2240 = !DIDerivedType(tag: DW_TAG_member, name: "wall_hit_sound", scope: !2226, file: !2225, line: 41, baseType: !182, size: 16, offset: 128)
!2241 = !DIDerivedType(tag: DW_TAG_member, name: "destroyable", scope: !2226, file: !2225, line: 43, baseType: !175, size: 8, offset: 144)
!2242 = !DIDerivedType(tag: DW_TAG_member, name: "matter", scope: !2226, file: !2225, line: 44, baseType: !175, size: 8, offset: 152)
!2243 = !DIDerivedType(tag: DW_TAG_member, name: "bounce", scope: !2226, file: !2225, line: 45, baseType: !175, size: 8, offset: 160)
!2244 = !DIDerivedType(tag: DW_TAG_member, name: "homing_flag", scope: !2226, file: !2225, line: 46, baseType: !175, size: 8, offset: 168)
!2245 = !DIDerivedType(tag: DW_TAG_member, name: "speedvar", scope: !2226, file: !2225, line: 48, baseType: !186, size: 8, offset: 176)
!2246 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2226, file: !2225, line: 50, baseType: !186, size: 8, offset: 184)
!2247 = !DIDerivedType(tag: DW_TAG_member, name: "flash", scope: !2226, file: !2225, line: 52, baseType: !175, size: 8, offset: 192)
!2248 = !DIDerivedType(tag: DW_TAG_member, name: "afterburner_size", scope: !2226, file: !2225, line: 53, baseType: !175, size: 8, offset: 200)
!2249 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !2226, file: !2225, line: 55, baseType: !175, size: 8, offset: 208)
!2250 = !DIDerivedType(tag: DW_TAG_member, name: "energy_usage", scope: !2226, file: !2225, line: 57, baseType: !14, size: 32, offset: 224)
!2251 = !DIDerivedType(tag: DW_TAG_member, name: "fire_wait", scope: !2226, file: !2225, line: 58, baseType: !14, size: 32, offset: 256)
!2252 = !DIDerivedType(tag: DW_TAG_member, name: "multi_damage_scale", scope: !2226, file: !2225, line: 60, baseType: !14, size: 32, offset: 288)
!2253 = !DIDerivedType(tag: DW_TAG_member, name: "bitmap", scope: !2226, file: !2225, line: 62, baseType: !2254, size: 16, offset: 320)
!2254 = !DIDerivedType(tag: DW_TAG_typedef, name: "bitmap_index", file: !2255, line: 40, baseType: !2256)
!2255 = !DIFile(filename: "./main_shared/piggy.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "5d74a9a5fcd56b04e1df3c49c8d4c571")
!2256 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bitmap_index", file: !2255, line: 37, size: 16, flags: DIFlagTypePassByValue, elements: !2257, identifier: "_ZTS12bitmap_index")
!2257 = !{!2258}
!2258 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !2256, file: !2255, line: 39, baseType: !190, size: 16)
!2259 = !DIDerivedType(tag: DW_TAG_member, name: "blob_size", scope: !2226, file: !2225, line: 64, baseType: !14, size: 32, offset: 352)
!2260 = !DIDerivedType(tag: DW_TAG_member, name: "flash_size", scope: !2226, file: !2225, line: 65, baseType: !14, size: 32, offset: 384)
!2261 = !DIDerivedType(tag: DW_TAG_member, name: "impact_size", scope: !2226, file: !2225, line: 66, baseType: !14, size: 32, offset: 416)
!2262 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !2226, file: !2225, line: 67, baseType: !2263, size: 160, offset: 448)
!2263 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !2264)
!2264 = !{!2265}
!2265 = !DISubrange(count: 5)
!2266 = !DIDerivedType(tag: DW_TAG_member, name: "speed", scope: !2226, file: !2225, line: 68, baseType: !2263, size: 160, offset: 608)
!2267 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !2226, file: !2225, line: 69, baseType: !14, size: 32, offset: 768)
!2268 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !2226, file: !2225, line: 70, baseType: !14, size: 32, offset: 800)
!2269 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !2226, file: !2225, line: 71, baseType: !14, size: 32, offset: 832)
!2270 = !DIDerivedType(tag: DW_TAG_member, name: "po_len_to_width_ratio", scope: !2226, file: !2225, line: 72, baseType: !14, size: 32, offset: 864)
!2271 = !DIDerivedType(tag: DW_TAG_member, name: "light", scope: !2226, file: !2225, line: 73, baseType: !14, size: 32, offset: 896)
!2272 = !DIDerivedType(tag: DW_TAG_member, name: "lifetime", scope: !2226, file: !2225, line: 74, baseType: !14, size: 32, offset: 928)
!2273 = !DIDerivedType(tag: DW_TAG_member, name: "damage_radius", scope: !2226, file: !2225, line: 75, baseType: !14, size: 32, offset: 960)
!2274 = !DIDerivedType(tag: DW_TAG_member, name: "picture", scope: !2226, file: !2225, line: 78, baseType: !2254, size: 16, offset: 992)
!2275 = !DIDerivedType(tag: DW_TAG_member, name: "hires_picture", scope: !2226, file: !2225, line: 79, baseType: !2254, size: 16, offset: 1008)
!2276 = !DILocation(line: 295, column: 15, scope: !2215)
!2277 = !DILocation(line: 295, column: 33, scope: !2215)
!2278 = !DILocation(line: 295, column: 38, scope: !2215)
!2279 = !DILocation(line: 295, column: 21, scope: !2215)
!2280 = !DILocation(line: 297, column: 2, scope: !2215)
!2281 = !DILocation(line: 299, column: 7, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2215, file: !24, line: 299, column: 6)
!2283 = !DILocation(line: 299, column: 12, scope: !2282)
!2284 = !DILocation(line: 299, column: 15, scope: !2282)
!2285 = !DILocation(line: 299, column: 34, scope: !2282)
!2286 = !DILocation(line: 299, column: 38, scope: !2282)
!2287 = !DILocation(line: 299, column: 43, scope: !2282)
!2288 = !DILocation(line: 299, column: 46, scope: !2282)
!2289 = !DILocation(line: 300, column: 3, scope: !2282)
!2290 = !DILocation(line: 302, column: 52, scope: !2215)
!2291 = !DILocation(line: 302, column: 55, scope: !2215)
!2292 = !DILocation(line: 302, column: 2, scope: !2215)
!2293 = !DILocation(line: 304, column: 41, scope: !2215)
!2294 = !DILocation(line: 304, column: 46, scope: !2215)
!2295 = !DILocation(line: 304, column: 51, scope: !2215)
!2296 = !DILocation(line: 304, column: 59, scope: !2215)
!2297 = !DILocation(line: 305, column: 6, scope: !2215)
!2298 = !DILocation(line: 305, column: 10, scope: !2215)
!2299 = !DILocation(line: 306, column: 6, scope: !2215)
!2300 = !DILocation(line: 306, column: 10, scope: !2215)
!2301 = !DILocation(line: 307, column: 6, scope: !2215)
!2302 = !DILocation(line: 307, column: 10, scope: !2215)
!2303 = !DILocation(line: 307, column: 19, scope: !2215)
!2304 = !DILocation(line: 308, column: 6, scope: !2215)
!2305 = !DILocation(line: 308, column: 10, scope: !2215)
!2306 = !DILocation(line: 308, column: 24, scope: !2215)
!2307 = !DILocation(line: 308, column: 28, scope: !2215)
!2308 = !DILocation(line: 308, column: 37, scope: !2215)
!2309 = !DILocation(line: 309, column: 6, scope: !2215)
!2310 = !DILocation(line: 309, column: 11, scope: !2215)
!2311 = !DILocation(line: 309, column: 28, scope: !2215)
!2312 = !DILocation(line: 304, column: 9, scope: !2215)
!2313 = !DILocation(line: 304, column: 2, scope: !2215)
!2314 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !15, file: !15, line: 55, type: !2315, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2315 = !DISubroutineType(types: !2316)
!2316 = !{!7, !14}
!2317 = !DILocalVariable(name: "f", arg: 1, scope: !2314, file: !15, line: 55, type: !14)
!2318 = !DILocation(line: 55, column: 23, scope: !2314)
!2319 = !DILocation(line: 57, column: 9, scope: !2314)
!2320 = !DILocation(line: 57, column: 11, scope: !2314)
!2321 = !DILocation(line: 57, column: 2, scope: !2314)
!2322 = distinct !DISubprogram(name: "min<int>", linkageName: "_ZNSt3__13minB8ne200100IiEERKT_S3_S3_", scope: !173, file: !2323, line: 35, type: !2324, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2327, retainedNodes: !1572)
!2323 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/min.h", directory: "")
!2324 = !DISubroutineType(types: !2325)
!2325 = !{!2326, !2326, !2326}
!2326 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !170, size: 64)
!2327 = !{!2328}
!2328 = !DITemplateTypeParameter(name: "_Tp", type: !7)
!2329 = !DILocalVariable(name: "__a", arg: 1, scope: !2322, file: !2323, line: 35, type: !2326)
!2330 = !DILocation(line: 35, column: 38, scope: !2322)
!2331 = !DILocalVariable(name: "__b", arg: 2, scope: !2322, file: !2323, line: 35, type: !2326)
!2332 = !DILocation(line: 35, column: 76, scope: !2322)
!2333 = !DILocation(line: 36, column: 19, scope: !2322)
!2334 = !DILocation(line: 36, column: 24, scope: !2322)
!2335 = !DILocation(line: 36, column: 10, scope: !2322)
!2336 = !DILocation(line: 36, column: 3, scope: !2322)
!2337 = distinct !DISubprogram(name: "f2fl", linkageName: "_Z4f2fli", scope: !15, file: !15, line: 72, type: !2338, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2338 = !DISubroutineType(types: !2339)
!2339 = !{!515, !14}
!2340 = !DILocalVariable(name: "f", arg: 1, scope: !2337, file: !15, line: 72, type: !14)
!2341 = !DILocation(line: 72, column: 26, scope: !2337)
!2342 = !DILocation(line: 74, column: 9, scope: !2337)
!2343 = !DILocation(line: 74, column: 11, scope: !2337)
!2344 = !DILocation(line: 74, column: 2, scope: !2337)
!2345 = distinct !DISubprogram(name: "object_create_muzzle_flash", linkageName: "_Z26object_create_muzzle_flashsP10vms_vectorii", scope: !24, file: !24, line: 265, type: !2346, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2346 = !DISubroutineType(types: !2347)
!2347 = !{!1434, !182, !1571, !14, !7}
!2348 = !DILocalVariable(name: "segnum", arg: 1, scope: !2345, file: !24, line: 265, type: !182)
!2349 = !DILocation(line: 265, column: 42, scope: !2345)
!2350 = !DILocalVariable(name: "position", arg: 2, scope: !2345, file: !24, line: 265, type: !1571)
!2351 = !DILocation(line: 265, column: 63, scope: !2345)
!2352 = !DILocalVariable(name: "size", arg: 3, scope: !2345, file: !24, line: 265, type: !14)
!2353 = !DILocation(line: 265, column: 77, scope: !2345)
!2354 = !DILocalVariable(name: "vclip_type", arg: 4, scope: !2345, file: !24, line: 265, type: !7)
!2355 = !DILocation(line: 265, column: 87, scope: !2345)
!2356 = !DILocation(line: 267, column: 43, scope: !2345)
!2357 = !DILocation(line: 267, column: 51, scope: !2345)
!2358 = !DILocation(line: 267, column: 61, scope: !2345)
!2359 = !DILocation(line: 267, column: 67, scope: !2345)
!2360 = !DILocation(line: 267, column: 9, scope: !2345)
!2361 = !DILocation(line: 267, column: 2, scope: !2345)
!2362 = distinct !DISubprogram(name: "object_create_explosion", linkageName: "_Z23object_create_explosionsP10vms_vectorii", scope: !24, file: !24, line: 270, type: !2346, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2363 = !DILocalVariable(name: "segnum", arg: 1, scope: !2362, file: !24, line: 270, type: !182)
!2364 = !DILocation(line: 270, column: 39, scope: !2362)
!2365 = !DILocalVariable(name: "position", arg: 2, scope: !2362, file: !24, line: 270, type: !1571)
!2366 = !DILocation(line: 270, column: 60, scope: !2362)
!2367 = !DILocalVariable(name: "size", arg: 3, scope: !2362, file: !24, line: 270, type: !14)
!2368 = !DILocation(line: 270, column: 74, scope: !2362)
!2369 = !DILocalVariable(name: "vclip_type", arg: 4, scope: !2362, file: !24, line: 270, type: !7)
!2370 = !DILocation(line: 270, column: 84, scope: !2362)
!2371 = !DILocation(line: 272, column: 43, scope: !2362)
!2372 = !DILocation(line: 272, column: 51, scope: !2362)
!2373 = !DILocation(line: 272, column: 61, scope: !2362)
!2374 = !DILocation(line: 272, column: 67, scope: !2362)
!2375 = !DILocation(line: 272, column: 9, scope: !2362)
!2376 = !DILocation(line: 272, column: 2, scope: !2362)
!2377 = distinct !DISubprogram(name: "object_create_badass_explosion", linkageName: "_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii", scope: !24, file: !24, line: 275, type: !1432, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2378 = !DILocalVariable(name: "objp", arg: 1, scope: !2377, file: !24, line: 275, type: !1434)
!2379 = !DILocation(line: 275, column: 48, scope: !2377)
!2380 = !DILocalVariable(name: "segnum", arg: 2, scope: !2377, file: !24, line: 275, type: !182)
!2381 = !DILocation(line: 275, column: 60, scope: !2377)
!2382 = !DILocalVariable(name: "position", arg: 3, scope: !2377, file: !24, line: 275, type: !1571)
!2383 = !DILocation(line: 275, column: 81, scope: !2377)
!2384 = !DILocalVariable(name: "size", arg: 4, scope: !2377, file: !24, line: 275, type: !14)
!2385 = !DILocation(line: 275, column: 95, scope: !2377)
!2386 = !DILocalVariable(name: "vclip_type", arg: 5, scope: !2377, file: !24, line: 275, type: !7)
!2387 = !DILocation(line: 275, column: 105, scope: !2377)
!2388 = !DILocalVariable(name: "maxdamage", arg: 6, scope: !2377, file: !24, line: 275, type: !14)
!2389 = !DILocation(line: 275, column: 121, scope: !2377)
!2390 = !DILocalVariable(name: "maxdistance", arg: 7, scope: !2377, file: !24, line: 275, type: !14)
!2391 = !DILocation(line: 275, column: 136, scope: !2377)
!2392 = !DILocalVariable(name: "maxforce", arg: 8, scope: !2377, file: !24, line: 275, type: !14)
!2393 = !DILocation(line: 275, column: 153, scope: !2377)
!2394 = !DILocalVariable(name: "parent", arg: 9, scope: !2377, file: !24, line: 275, type: !7)
!2395 = !DILocation(line: 275, column: 167, scope: !2377)
!2396 = !DILocalVariable(name: "rval", scope: !2377, file: !24, line: 277, type: !1434)
!2397 = !DILocation(line: 277, column: 10, scope: !2377)
!2398 = !DILocation(line: 279, column: 37, scope: !2377)
!2399 = !DILocation(line: 279, column: 43, scope: !2377)
!2400 = !DILocation(line: 279, column: 51, scope: !2377)
!2401 = !DILocation(line: 279, column: 61, scope: !2377)
!2402 = !DILocation(line: 279, column: 67, scope: !2377)
!2403 = !DILocation(line: 279, column: 79, scope: !2377)
!2404 = !DILocation(line: 279, column: 90, scope: !2377)
!2405 = !DILocation(line: 279, column: 103, scope: !2377)
!2406 = !DILocation(line: 279, column: 113, scope: !2377)
!2407 = !DILocation(line: 279, column: 9, scope: !2377)
!2408 = !DILocation(line: 279, column: 7, scope: !2377)
!2409 = !DILocation(line: 281, column: 7, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2377, file: !24, line: 281, column: 6)
!2411 = !DILocation(line: 281, column: 12, scope: !2410)
!2412 = !DILocation(line: 281, column: 21, scope: !2410)
!2413 = !DILocation(line: 281, column: 25, scope: !2410)
!2414 = !DILocation(line: 281, column: 31, scope: !2410)
!2415 = !DILocation(line: 281, column: 36, scope: !2410)
!2416 = !DILocation(line: 282, column: 25, scope: !2410)
!2417 = !DILocation(line: 282, column: 3, scope: !2410)
!2418 = !DILocation(line: 288, column: 9, scope: !2377)
!2419 = !DILocation(line: 288, column: 2, scope: !2377)
!2420 = distinct !DISubprogram(name: "explode_badass_object", linkageName: "_Z21explode_badass_objectP6objectiii", scope: !24, file: !24, line: 313, type: !2421, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2421 = !DISubroutineType(types: !2422)
!2422 = !{!1434, !1434, !14, !14, !14}
!2423 = !DILocalVariable(name: "objp", arg: 1, scope: !2420, file: !24, line: 313, type: !1434)
!2424 = !DILocation(line: 313, column: 39, scope: !2420)
!2425 = !DILocalVariable(name: "damage", arg: 2, scope: !2420, file: !24, line: 313, type: !14)
!2426 = !DILocation(line: 313, column: 49, scope: !2420)
!2427 = !DILocalVariable(name: "distance", arg: 3, scope: !2420, file: !24, line: 313, type: !14)
!2428 = !DILocation(line: 313, column: 61, scope: !2420)
!2429 = !DILocalVariable(name: "force", arg: 4, scope: !2420, file: !24, line: 313, type: !14)
!2430 = !DILocation(line: 313, column: 75, scope: !2420)
!2431 = !DILocalVariable(name: "rval", scope: !2420, file: !24, line: 316, type: !1434)
!2432 = !DILocation(line: 316, column: 11, scope: !2420)
!2433 = !DILocation(line: 318, column: 40, scope: !2420)
!2434 = !DILocation(line: 318, column: 46, scope: !2420)
!2435 = !DILocation(line: 318, column: 52, scope: !2420)
!2436 = !DILocation(line: 318, column: 61, scope: !2420)
!2437 = !DILocation(line: 318, column: 67, scope: !2420)
!2438 = !DILocation(line: 318, column: 72, scope: !2420)
!2439 = !DILocation(line: 318, column: 78, scope: !2420)
!2440 = !DILocation(line: 319, column: 26, scope: !2420)
!2441 = !DILocation(line: 319, column: 6, scope: !2420)
!2442 = !DILocation(line: 320, column: 6, scope: !2420)
!2443 = !DILocation(line: 320, column: 14, scope: !2420)
!2444 = !DILocation(line: 320, column: 24, scope: !2420)
!2445 = !DILocation(line: 321, column: 6, scope: !2420)
!2446 = !DILocation(line: 321, column: 10, scope: !2420)
!2447 = !DILocation(line: 318, column: 9, scope: !2420)
!2448 = !DILocation(line: 318, column: 7, scope: !2420)
!2449 = !DILocation(line: 322, column: 6, scope: !2450)
!2450 = distinct !DILexicalBlock(scope: !2420, file: !24, line: 322, column: 6)
!2451 = !DILocation(line: 323, column: 53, scope: !2450)
!2452 = !DILocation(line: 323, column: 57, scope: !2450)
!2453 = !DILocation(line: 323, column: 3, scope: !2450)
!2454 = !DILocation(line: 325, column: 10, scope: !2420)
!2455 = !DILocation(line: 325, column: 2, scope: !2420)
!2456 = distinct !DISubprogram(name: "get_explosion_vclip", linkageName: "_Z19get_explosion_vclipP6objecti", scope: !24, file: !24, line: 1046, type: !2457, scopeLine: 1047, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2457 = !DISubroutineType(types: !2458)
!2458 = !{!7, !1434, !7}
!2459 = !DILocalVariable(name: "obj", arg: 1, scope: !2456, file: !24, line: 1046, type: !1434)
!2460 = !DILocation(line: 1046, column: 33, scope: !2456)
!2461 = !DILocalVariable(name: "stage", arg: 2, scope: !2456, file: !24, line: 1046, type: !7)
!2462 = !DILocation(line: 1046, column: 41, scope: !2456)
!2463 = !DILocation(line: 1055, column: 6, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2456, file: !24, line: 1055, column: 6)
!2465 = !DILocation(line: 1055, column: 11, scope: !2464)
!2466 = !DILocation(line: 1055, column: 15, scope: !2464)
!2467 = !DILocation(line: 1057, column: 7, scope: !2468)
!2468 = distinct !DILexicalBlock(scope: !2469, file: !24, line: 1057, column: 7)
!2469 = distinct !DILexicalBlock(scope: !2464, file: !24, line: 1055, column: 28)
!2470 = !DILocation(line: 1057, column: 12, scope: !2468)
!2471 = !DILocation(line: 1057, column: 16, scope: !2468)
!2472 = !DILocation(line: 1057, column: 30, scope: !2468)
!2473 = !DILocation(line: 1057, column: 35, scope: !2468)
!2474 = !DILocation(line: 1057, column: 19, scope: !2468)
!2475 = !DILocation(line: 1057, column: 39, scope: !2468)
!2476 = !DILocation(line: 1057, column: 53, scope: !2468)
!2477 = !DILocation(line: 1058, column: 23, scope: !2468)
!2478 = !DILocation(line: 1058, column: 28, scope: !2468)
!2479 = !DILocation(line: 1058, column: 12, scope: !2468)
!2480 = !DILocation(line: 1058, column: 32, scope: !2468)
!2481 = !DILocation(line: 1058, column: 5, scope: !2468)
!2482 = !DILocation(line: 1059, column: 12, scope: !2483)
!2483 = distinct !DILexicalBlock(scope: !2468, file: !24, line: 1059, column: 12)
!2484 = !DILocation(line: 1059, column: 17, scope: !2483)
!2485 = !DILocation(line: 1059, column: 21, scope: !2483)
!2486 = !DILocation(line: 1059, column: 35, scope: !2483)
!2487 = !DILocation(line: 1059, column: 40, scope: !2483)
!2488 = !DILocation(line: 1059, column: 24, scope: !2483)
!2489 = !DILocation(line: 1059, column: 44, scope: !2483)
!2490 = !DILocation(line: 1059, column: 58, scope: !2483)
!2491 = !DILocation(line: 1060, column: 23, scope: !2483)
!2492 = !DILocation(line: 1060, column: 28, scope: !2483)
!2493 = !DILocation(line: 1060, column: 12, scope: !2483)
!2494 = !DILocation(line: 1060, column: 32, scope: !2483)
!2495 = !DILocation(line: 1060, column: 5, scope: !2483)
!2496 = !DILocation(line: 1062, column: 2, scope: !2469)
!2497 = !DILocation(line: 1063, column: 11, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2464, file: !24, line: 1063, column: 11)
!2499 = !DILocation(line: 1063, column: 16, scope: !2498)
!2500 = !DILocation(line: 1063, column: 20, scope: !2498)
!2501 = !DILocation(line: 1063, column: 33, scope: !2498)
!2502 = !DILocation(line: 1063, column: 36, scope: !2498)
!2503 = !DILocation(line: 1063, column: 49, scope: !2498)
!2504 = !DILocation(line: 1063, column: 63, scope: !2498)
!2505 = !DILocation(line: 1064, column: 11, scope: !2498)
!2506 = !DILocation(line: 1064, column: 24, scope: !2498)
!2507 = !DILocation(line: 1064, column: 4, scope: !2498)
!2508 = !DILocation(line: 1066, column: 2, scope: !2456)
!2509 = !DILocation(line: 1068, column: 1, scope: !2456)
!2510 = distinct !DISubprogram(name: "explode_badass_player", linkageName: "_Z21explode_badass_playerP6object", scope: !24, file: !24, line: 331, type: !2511, scopeLine: 332, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2511 = !DISubroutineType(types: !2512)
!2512 = !{!1434, !1434}
!2513 = !DILocalVariable(name: "objp", arg: 1, scope: !2510, file: !24, line: 331, type: !1434)
!2514 = !DILocation(line: 331, column: 39, scope: !2510)
!2515 = !DILocation(line: 333, column: 31, scope: !2510)
!2516 = !DILocation(line: 333, column: 9, scope: !2510)
!2517 = !DILocation(line: 333, column: 2, scope: !2510)
!2518 = distinct !DISubprogram(name: "object_create_debris", linkageName: "_Z20object_create_debrisP6objecti", scope: !24, file: !24, line: 339, type: !2519, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2519 = !DISubroutineType(types: !2520)
!2520 = !{!1434, !1434, !7}
!2521 = !DILocalVariable(name: "parent", arg: 1, scope: !2518, file: !24, line: 339, type: !1434)
!2522 = !DILocation(line: 339, column: 38, scope: !2518)
!2523 = !DILocalVariable(name: "subobj_num", arg: 2, scope: !2518, file: !24, line: 339, type: !7)
!2524 = !DILocation(line: 339, column: 50, scope: !2518)
!2525 = !DILocalVariable(name: "objnum", scope: !2518, file: !24, line: 341, type: !7)
!2526 = !DILocation(line: 341, column: 6, scope: !2518)
!2527 = !DILocalVariable(name: "obj", scope: !2518, file: !24, line: 342, type: !1434)
!2528 = !DILocation(line: 342, column: 10, scope: !2518)
!2529 = !DILocalVariable(name: "po", scope: !2518, file: !24, line: 343, type: !2530)
!2530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2531, size: 64)
!2531 = !DIDerivedType(tag: DW_TAG_typedef, name: "polymodel", file: !2532, line: 47, baseType: !2533)
!2532 = !DIFile(filename: "main_d2/polyobj.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "fc2424d85655305b90ac5cadd553f2e5")
!2533 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polymodel", file: !2532, line: 28, size: 5952, flags: DIFlagTypePassByValue, elements: !2534, identifier: "_ZTS9polymodel")
!2534 = !{!2535, !2536, !2537, !2539, !2541, !2543, !2544, !2545, !2547, !2549, !2550, !2551, !2552, !2553, !2554, !2555, !2556}
!2535 = !DIDerivedType(tag: DW_TAG_member, name: "n_models", scope: !2533, file: !2532, line: 30, baseType: !7, size: 32)
!2536 = !DIDerivedType(tag: DW_TAG_member, name: "model_data_size", scope: !2533, file: !2532, line: 31, baseType: !7, size: 32, offset: 32)
!2537 = !DIDerivedType(tag: DW_TAG_member, name: "model_data", scope: !2533, file: !2532, line: 32, baseType: !2538, size: 64, offset: 64)
!2538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!2539 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_ptrs", scope: !2533, file: !2532, line: 33, baseType: !2540, size: 320, offset: 128)
!2540 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !96)
!2541 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_offsets", scope: !2533, file: !2532, line: 34, baseType: !2542, size: 960, offset: 448)
!2542 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1451, size: 960, elements: !96)
!2543 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_norms", scope: !2533, file: !2532, line: 35, baseType: !2542, size: 960, offset: 1408)
!2544 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_pnts", scope: !2533, file: !2532, line: 36, baseType: !2542, size: 960, offset: 2368)
!2545 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_rads", scope: !2533, file: !2532, line: 37, baseType: !2546, size: 320, offset: 3328)
!2546 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !96)
!2547 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_parents", scope: !2533, file: !2532, line: 38, baseType: !2548, size: 80, offset: 3648)
!2548 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 80, elements: !96)
!2549 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_mins", scope: !2533, file: !2532, line: 39, baseType: !2542, size: 960, offset: 3744)
!2550 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_maxs", scope: !2533, file: !2532, line: 40, baseType: !2542, size: 960, offset: 4704)
!2551 = !DIDerivedType(tag: DW_TAG_member, name: "mins", scope: !2533, file: !2532, line: 41, baseType: !1451, size: 96, offset: 5664)
!2552 = !DIDerivedType(tag: DW_TAG_member, name: "maxs", scope: !2533, file: !2532, line: 41, baseType: !1451, size: 96, offset: 5760)
!2553 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !2533, file: !2532, line: 42, baseType: !14, size: 32, offset: 5856)
!2554 = !DIDerivedType(tag: DW_TAG_member, name: "n_textures", scope: !2533, file: !2532, line: 43, baseType: !186, size: 8, offset: 5888)
!2555 = !DIDerivedType(tag: DW_TAG_member, name: "first_texture", scope: !2533, file: !2532, line: 44, baseType: !190, size: 16, offset: 5904)
!2556 = !DIDerivedType(tag: DW_TAG_member, name: "simpler_model", scope: !2533, file: !2532, line: 45, baseType: !186, size: 8, offset: 5920)
!2557 = !DILocation(line: 343, column: 13, scope: !2518)
!2558 = !DILocation(line: 345, column: 2, scope: !2518)
!2559 = !DILocation(line: 347, column: 35, scope: !2518)
!2560 = !DILocation(line: 347, column: 43, scope: !2518)
!2561 = !DILocation(line: 347, column: 51, scope: !2518)
!2562 = !DILocation(line: 347, column: 59, scope: !2518)
!2563 = !DILocation(line: 348, column: 6, scope: !2518)
!2564 = !DILocation(line: 348, column: 14, scope: !2518)
!2565 = !DILocation(line: 348, column: 36, scope: !2518)
!2566 = !DILocation(line: 348, column: 44, scope: !2518)
!2567 = !DILocation(line: 348, column: 60, scope: !2518)
!2568 = !DILocation(line: 348, column: 21, scope: !2518)
!2569 = !DILocation(line: 348, column: 71, scope: !2518)
!2570 = !DILocation(line: 348, column: 85, scope: !2518)
!2571 = !DILocation(line: 347, column: 11, scope: !2518)
!2572 = !DILocation(line: 347, column: 9, scope: !2518)
!2573 = !DILocation(line: 351, column: 7, scope: !2574)
!2574 = distinct !DILexicalBlock(scope: !2518, file: !24, line: 351, column: 6)
!2575 = !DILocation(line: 351, column: 14, scope: !2574)
!2576 = !DILocation(line: 351, column: 20, scope: !2574)
!2577 = !DILocation(line: 351, column: 24, scope: !2574)
!2578 = !DILocation(line: 351, column: 45, scope: !2574)
!2579 = !DILocation(line: 352, column: 3, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2574, file: !24, line: 351, column: 64)
!2581 = !DILocation(line: 353, column: 3, scope: !2580)
!2582 = !DILocation(line: 354, column: 3, scope: !2580)
!2583 = !DILocation(line: 356, column: 7, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2518, file: !24, line: 356, column: 7)
!2585 = !DILocation(line: 356, column: 14, scope: !2584)
!2586 = !DILocation(line: 357, column: 3, scope: !2584)
!2587 = !DILocation(line: 358, column: 17, scope: !2518)
!2588 = !DILocation(line: 358, column: 9, scope: !2518)
!2589 = !DILocation(line: 358, column: 6, scope: !2518)
!2590 = !DILocation(line: 360, column: 2, scope: !2518)
!2591 = !DILocation(line: 364, column: 35, scope: !2518)
!2592 = !DILocation(line: 364, column: 43, scope: !2518)
!2593 = !DILocation(line: 364, column: 59, scope: !2518)
!2594 = !DILocation(line: 364, column: 2, scope: !2518)
!2595 = !DILocation(line: 364, column: 7, scope: !2518)
!2596 = !DILocation(line: 364, column: 23, scope: !2518)
!2597 = !DILocation(line: 364, column: 33, scope: !2518)
!2598 = !DILocation(line: 365, column: 41, scope: !2518)
!2599 = !DILocation(line: 365, column: 39, scope: !2518)
!2600 = !DILocation(line: 365, column: 2, scope: !2518)
!2601 = !DILocation(line: 365, column: 7, scope: !2518)
!2602 = !DILocation(line: 365, column: 23, scope: !2518)
!2603 = !DILocation(line: 365, column: 36, scope: !2518)
!2604 = !DILocation(line: 366, column: 39, scope: !2518)
!2605 = !DILocation(line: 366, column: 47, scope: !2518)
!2606 = !DILocation(line: 366, column: 63, scope: !2518)
!2607 = !DILocation(line: 366, column: 2, scope: !2518)
!2608 = !DILocation(line: 366, column: 7, scope: !2518)
!2609 = !DILocation(line: 366, column: 23, scope: !2518)
!2610 = !DILocation(line: 366, column: 37, scope: !2518)
!2611 = !DILocation(line: 370, column: 23, scope: !2518)
!2612 = !DILocation(line: 370, column: 28, scope: !2518)
!2613 = !DILocation(line: 370, column: 44, scope: !2518)
!2614 = !DILocation(line: 370, column: 8, scope: !2518)
!2615 = !DILocation(line: 370, column: 5, scope: !2518)
!2616 = !DILocation(line: 372, column: 50, scope: !2518)
!2617 = !DILocation(line: 372, column: 48, scope: !2518)
!2618 = !DILocation(line: 372, column: 2, scope: !2518)
!2619 = !DILocation(line: 372, column: 7, scope: !2518)
!2620 = !DILocation(line: 372, column: 23, scope: !2518)
!2621 = !DILocation(line: 372, column: 32, scope: !2518)
!2622 = !DILocation(line: 372, column: 34, scope: !2518)
!2623 = !DILocation(line: 373, column: 50, scope: !2518)
!2624 = !DILocation(line: 373, column: 48, scope: !2518)
!2625 = !DILocation(line: 373, column: 2, scope: !2518)
!2626 = !DILocation(line: 373, column: 7, scope: !2518)
!2627 = !DILocation(line: 373, column: 23, scope: !2518)
!2628 = !DILocation(line: 373, column: 32, scope: !2518)
!2629 = !DILocation(line: 373, column: 34, scope: !2518)
!2630 = !DILocation(line: 374, column: 50, scope: !2518)
!2631 = !DILocation(line: 374, column: 48, scope: !2518)
!2632 = !DILocation(line: 374, column: 2, scope: !2518)
!2633 = !DILocation(line: 374, column: 7, scope: !2518)
!2634 = !DILocation(line: 374, column: 23, scope: !2518)
!2635 = !DILocation(line: 374, column: 32, scope: !2518)
!2636 = !DILocation(line: 374, column: 34, scope: !2518)
!2637 = !DILocation(line: 375, column: 26, scope: !2518)
!2638 = !DILocation(line: 375, column: 31, scope: !2518)
!2639 = !DILocation(line: 375, column: 47, scope: !2518)
!2640 = !DILocation(line: 375, column: 2, scope: !2518)
!2641 = !DILocation(line: 376, column: 16, scope: !2518)
!2642 = !DILocation(line: 376, column: 21, scope: !2518)
!2643 = !DILocation(line: 376, column: 37, scope: !2518)
!2644 = !DILocation(line: 376, column: 61, scope: !2518)
!2645 = !DILocation(line: 376, column: 59, scope: !2518)
!2646 = !DILocation(line: 376, column: 70, scope: !2518)
!2647 = !DILocation(line: 376, column: 53, scope: !2518)
!2648 = !DILocation(line: 376, column: 46, scope: !2518)
!2649 = !DILocation(line: 376, column: 2, scope: !2518)
!2650 = !DILocation(line: 378, column: 15, scope: !2518)
!2651 = !DILocation(line: 378, column: 20, scope: !2518)
!2652 = !DILocation(line: 378, column: 36, scope: !2518)
!2653 = !DILocation(line: 378, column: 46, scope: !2518)
!2654 = !DILocation(line: 378, column: 54, scope: !2518)
!2655 = !DILocation(line: 378, column: 70, scope: !2518)
!2656 = !DILocation(line: 378, column: 2, scope: !2518)
!2657 = !DILocation(line: 381, column: 15, scope: !2518)
!2658 = !DILocation(line: 381, column: 20, scope: !2518)
!2659 = !DILocation(line: 381, column: 36, scope: !2518)
!2660 = !DILocation(line: 381, column: 44, scope: !2518)
!2661 = !DILocation(line: 381, column: 53, scope: !2518)
!2662 = !DILocation(line: 381, column: 63, scope: !2518)
!2663 = !DILocation(line: 381, column: 71, scope: !2518)
!2664 = !DILocation(line: 381, column: 74, scope: !2518)
!2665 = !DILocation(line: 381, column: 84, scope: !2518)
!2666 = !DILocation(line: 381, column: 92, scope: !2518)
!2667 = !DILocation(line: 381, column: 95, scope: !2518)
!2668 = !DILocation(line: 381, column: 2, scope: !2518)
!2669 = !DILocation(line: 382, column: 2, scope: !2518)
!2670 = !DILocation(line: 384, column: 43, scope: !2518)
!2671 = !DILocation(line: 384, column: 36, scope: !2518)
!2672 = !DILocation(line: 384, column: 34, scope: !2518)
!2673 = !DILocation(line: 384, column: 2, scope: !2518)
!2674 = !DILocation(line: 384, column: 7, scope: !2518)
!2675 = !DILocation(line: 384, column: 16, scope: !2518)
!2676 = !DILocation(line: 386, column: 40, scope: !2518)
!2677 = !DILocation(line: 386, column: 48, scope: !2518)
!2678 = !DILocation(line: 386, column: 64, scope: !2518)
!2679 = !DILocation(line: 386, column: 69, scope: !2518)
!2680 = !DILocation(line: 386, column: 74, scope: !2518)
!2681 = !DILocation(line: 386, column: 79, scope: !2518)
!2682 = !DILocation(line: 386, column: 87, scope: !2518)
!2683 = !DILocation(line: 386, column: 30, scope: !2518)
!2684 = !DILocation(line: 386, column: 2, scope: !2518)
!2685 = !DILocation(line: 386, column: 7, scope: !2518)
!2686 = !DILocation(line: 386, column: 23, scope: !2518)
!2687 = !DILocation(line: 386, column: 28, scope: !2518)
!2688 = !DILocation(line: 387, column: 2, scope: !2518)
!2689 = !DILocation(line: 387, column: 7, scope: !2518)
!2690 = !DILocation(line: 387, column: 23, scope: !2518)
!2691 = !DILocation(line: 387, column: 28, scope: !2518)
!2692 = !DILocation(line: 389, column: 9, scope: !2518)
!2693 = !DILocation(line: 389, column: 2, scope: !2518)
!2694 = !DILocation(line: 391, column: 1, scope: !2518)
!2695 = distinct !DISubprogram(name: "draw_fireball", linkageName: "_Z13draw_fireballP6object", scope: !24, file: !24, line: 393, type: !2696, scopeLine: 394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2696 = !DISubroutineType(types: !2697)
!2697 = !{null, !1434}
!2698 = !DILocalVariable(name: "obj", arg: 1, scope: !2695, file: !24, line: 393, type: !1434)
!2699 = !DILocation(line: 393, column: 28, scope: !2695)
!2700 = !DILocation(line: 397, column: 7, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2695, file: !24, line: 397, column: 7)
!2702 = !DILocation(line: 397, column: 12, scope: !2701)
!2703 = !DILocation(line: 397, column: 21, scope: !2701)
!2704 = !DILocation(line: 398, column: 21, scope: !2701)
!2705 = !DILocation(line: 398, column: 25, scope: !2701)
!2706 = !DILocation(line: 398, column: 30, scope: !2701)
!2707 = !DILocation(line: 398, column: 42, scope: !2701)
!2708 = !DILocation(line: 398, column: 47, scope: !2701)
!2709 = !DILocation(line: 398, column: 3, scope: !2701)
!2710 = !DILocation(line: 400, column: 1, scope: !2695)
!2711 = distinct !DISubprogram(name: "door_is_openable_by_player", linkageName: "_Z26door_is_openable_by_playerP7segmenti", scope: !24, file: !24, line: 405, type: !2712, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2712 = !DISubroutineType(types: !2713)
!2713 = !{!7, !2714, !7}
!2714 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2715, size: 64)
!2715 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !2716, line: 123, baseType: !2717)
!2716 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!2717 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !2716, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !2718, identifier: "_ZTS7segment")
!2718 = !{!2719, !2741, !2743, !2747}
!2719 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !2717, file: !2716, line: 105, baseType: !2720, size: 3840)
!2720 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2721, size: 3840, elements: !2739)
!2721 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !2716, line: 91, baseType: !2722)
!2722 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !2716, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !2723, identifier: "_ZTS4side")
!2723 = !{!2724, !2725, !2726, !2727, !2728, !2729, !2737}
!2724 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2722, file: !2716, line: 84, baseType: !175, size: 8)
!2725 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !2722, file: !2716, line: 85, baseType: !186, size: 8, offset: 8)
!2726 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !2722, file: !2716, line: 86, baseType: !182, size: 16, offset: 16)
!2727 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !2722, file: !2716, line: 87, baseType: !182, size: 16, offset: 32)
!2728 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !2722, file: !2716, line: 88, baseType: !182, size: 16, offset: 48)
!2729 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !2722, file: !2716, line: 89, baseType: !2730, size: 384, offset: 64)
!2730 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2731, size: 384, elements: !82)
!2731 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !2716, line: 67, baseType: !2732)
!2732 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !2716, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !2733, identifier: "_ZTS3uvl")
!2733 = !{!2734, !2735, !2736}
!2734 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !2732, file: !2716, line: 66, baseType: !14, size: 32)
!2735 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !2732, file: !2716, line: 66, baseType: !14, size: 32, offset: 32)
!2736 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !2732, file: !2716, line: 66, baseType: !14, size: 32, offset: 64)
!2737 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !2722, file: !2716, line: 90, baseType: !2738, size: 192, offset: 448)
!2738 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1451, size: 192, elements: !87)
!2739 = !{!2740}
!2740 = !DISubrange(count: 6)
!2741 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !2717, file: !2716, line: 106, baseType: !2742, size: 96, offset: 3840)
!2742 = !DICompositeType(tag: DW_TAG_array_type, baseType: !182, size: 96, elements: !2739)
!2743 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !2717, file: !2716, line: 107, baseType: !2744, size: 128, offset: 3936)
!2744 = !DICompositeType(tag: DW_TAG_array_type, baseType: !182, size: 128, elements: !2745)
!2745 = !{!2746}
!2746 = !DISubrange(count: 8)
!2747 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !2717, file: !2716, line: 112, baseType: !7, size: 32, offset: 4064)
!2748 = !DILocalVariable(name: "segp", arg: 1, scope: !2711, file: !24, line: 405, type: !2714)
!2749 = !DILocation(line: 405, column: 41, scope: !2711)
!2750 = !DILocalVariable(name: "sidenum", arg: 2, scope: !2711, file: !24, line: 405, type: !7)
!2751 = !DILocation(line: 405, column: 51, scope: !2711)
!2752 = !DILocalVariable(name: "wall_num", scope: !2711, file: !24, line: 407, type: !7)
!2753 = !DILocation(line: 407, column: 6, scope: !2711)
!2754 = !DILocalVariable(name: "wall_type", scope: !2711, file: !24, line: 407, type: !7)
!2755 = !DILocation(line: 407, column: 16, scope: !2711)
!2756 = !DILocation(line: 409, column: 13, scope: !2711)
!2757 = !DILocation(line: 409, column: 19, scope: !2711)
!2758 = !DILocation(line: 409, column: 25, scope: !2711)
!2759 = !DILocation(line: 409, column: 34, scope: !2711)
!2760 = !DILocation(line: 409, column: 11, scope: !2711)
!2761 = !DILocation(line: 410, column: 20, scope: !2711)
!2762 = !DILocation(line: 410, column: 14, scope: !2711)
!2763 = !DILocation(line: 410, column: 30, scope: !2711)
!2764 = !DILocation(line: 410, column: 12, scope: !2711)
!2765 = !DILocation(line: 412, column: 6, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2711, file: !24, line: 412, column: 6)
!2767 = !DILocation(line: 412, column: 15, scope: !2766)
!2768 = !DILocation(line: 413, column: 3, scope: !2766)
!2769 = !DILocation(line: 416, column: 8, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2711, file: !24, line: 416, column: 6)
!2771 = !DILocation(line: 416, column: 18, scope: !2770)
!2772 = !DILocation(line: 416, column: 32, scope: !2770)
!2773 = !DILocation(line: 416, column: 42, scope: !2770)
!2774 = !DILocation(line: 416, column: 36, scope: !2770)
!2775 = !DILocation(line: 416, column: 52, scope: !2770)
!2776 = !DILocation(line: 416, column: 58, scope: !2770)
!2777 = !DILocation(line: 416, column: 35, scope: !2770)
!2778 = !DILocation(line: 416, column: 79, scope: !2770)
!2779 = !DILocation(line: 416, column: 83, scope: !2770)
!2780 = !DILocation(line: 416, column: 93, scope: !2770)
!2781 = !DILocation(line: 417, column: 3, scope: !2770)
!2782 = !DILocation(line: 419, column: 2, scope: !2711)
!2783 = !DILocation(line: 421, column: 1, scope: !2711)
!2784 = distinct !DISubprogram(name: "pick_connected_segment", linkageName: "_Z22pick_connected_segmentP6objecti", scope: !24, file: !24, line: 428, type: !2457, scopeLine: 429, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!2785 = !DILocalVariable(name: "objp", arg: 1, scope: !2784, file: !24, line: 428, type: !1434)
!2786 = !DILocation(line: 428, column: 36, scope: !2784)
!2787 = !DILocalVariable(name: "max_depth", arg: 2, scope: !2784, file: !24, line: 428, type: !7)
!2788 = !DILocation(line: 428, column: 46, scope: !2784)
!2789 = !DILocalVariable(name: "i", scope: !2784, file: !24, line: 430, type: !7)
!2790 = !DILocation(line: 430, column: 7, scope: !2784)
!2791 = !DILocalVariable(name: "cur_depth", scope: !2784, file: !24, line: 431, type: !7)
!2792 = !DILocation(line: 431, column: 7, scope: !2784)
!2793 = !DILocalVariable(name: "start_seg", scope: !2784, file: !24, line: 432, type: !7)
!2794 = !DILocation(line: 432, column: 7, scope: !2784)
!2795 = !DILocalVariable(name: "head", scope: !2784, file: !24, line: 433, type: !7)
!2796 = !DILocation(line: 433, column: 7, scope: !2784)
!2797 = !DILocalVariable(name: "tail", scope: !2784, file: !24, line: 433, type: !7)
!2798 = !DILocation(line: 433, column: 13, scope: !2784)
!2799 = !DILocalVariable(name: "seg_queue", scope: !2784, file: !24, line: 434, type: !2800)
!2800 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4096, elements: !362)
!2801 = !DILocation(line: 434, column: 7, scope: !2784)
!2802 = !DILocalVariable(name: "visited", scope: !2784, file: !24, line: 435, type: !2803)
!2803 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 7200, elements: !2804)
!2804 = !{!2805}
!2805 = !DISubrange(count: 900)
!2806 = !DILocation(line: 435, column: 10, scope: !2784)
!2807 = !DILocalVariable(name: "depth", scope: !2784, file: !24, line: 436, type: !2803)
!2808 = !DILocation(line: 436, column: 10, scope: !2784)
!2809 = !DILocalVariable(name: "side_rand", scope: !2784, file: !24, line: 437, type: !2810)
!2810 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 48, elements: !2739)
!2811 = !DILocation(line: 437, column: 10, scope: !2784)
!2812 = !DILocation(line: 441, column: 14, scope: !2784)
!2813 = !DILocation(line: 441, column: 20, scope: !2784)
!2814 = !DILocation(line: 441, column: 12, scope: !2784)
!2815 = !DILocation(line: 442, column: 7, scope: !2784)
!2816 = !DILocation(line: 443, column: 7, scope: !2784)
!2817 = !DILocation(line: 444, column: 22, scope: !2784)
!2818 = !DILocation(line: 444, column: 16, scope: !2784)
!2819 = !DILocation(line: 444, column: 2, scope: !2784)
!2820 = !DILocation(line: 444, column: 20, scope: !2784)
!2821 = !DILocation(line: 446, column: 2, scope: !2784)
!2822 = !DILocation(line: 446, column: 21, scope: !2784)
!2823 = !DILocation(line: 446, column: 42, scope: !2784)
!2824 = !DILocation(line: 447, column: 2, scope: !2784)
!2825 = !DILocation(line: 447, column: 19, scope: !2784)
!2826 = !DILocation(line: 447, column: 40, scope: !2784)
!2827 = !DILocation(line: 448, column: 12, scope: !2784)
!2828 = !DILocation(line: 450, column: 8, scope: !2829)
!2829 = distinct !DILexicalBlock(scope: !2784, file: !24, line: 450, column: 2)
!2830 = !DILocation(line: 450, column: 7, scope: !2829)
!2831 = !DILocation(line: 450, column: 12, scope: !2832)
!2832 = distinct !DILexicalBlock(scope: !2829, file: !24, line: 450, column: 2)
!2833 = !DILocation(line: 450, column: 13, scope: !2832)
!2834 = !DILocation(line: 450, column: 2, scope: !2829)
!2835 = !DILocation(line: 451, column: 18, scope: !2832)
!2836 = !DILocation(line: 451, column: 13, scope: !2832)
!2837 = !DILocation(line: 451, column: 3, scope: !2832)
!2838 = !DILocation(line: 451, column: 16, scope: !2832)
!2839 = !DILocation(line: 450, column: 38, scope: !2832)
!2840 = !DILocation(line: 450, column: 2, scope: !2832)
!2841 = distinct !{!2841, !2834, !2842, !1996}
!2842 = !DILocation(line: 451, column: 18, scope: !2829)
!2843 = !DILocation(line: 454, column: 8, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2784, file: !24, line: 454, column: 2)
!2845 = !DILocation(line: 454, column: 7, scope: !2844)
!2846 = !DILocation(line: 454, column: 12, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2844, file: !24, line: 454, column: 2)
!2848 = !DILocation(line: 454, column: 13, scope: !2847)
!2849 = !DILocation(line: 454, column: 2, scope: !2844)
!2850 = !DILocalVariable(name: "ind1", scope: !2851, file: !24, line: 455, type: !7)
!2851 = distinct !DILexicalBlock(scope: !2847, file: !24, line: 454, column: 22)
!2852 = !DILocation(line: 455, column: 7, scope: !2851)
!2853 = !DILocalVariable(name: "temp", scope: !2851, file: !24, line: 455, type: !7)
!2854 = !DILocation(line: 455, column: 13, scope: !2851)
!2855 = !DILocation(line: 457, column: 11, scope: !2851)
!2856 = !DILocation(line: 457, column: 20, scope: !2851)
!2857 = !DILocation(line: 457, column: 45, scope: !2851)
!2858 = !DILocation(line: 457, column: 8, scope: !2851)
!2859 = !DILocation(line: 458, column: 20, scope: !2851)
!2860 = !DILocation(line: 458, column: 10, scope: !2851)
!2861 = !DILocation(line: 458, column: 8, scope: !2851)
!2862 = !DILocation(line: 459, column: 31, scope: !2851)
!2863 = !DILocation(line: 459, column: 21, scope: !2851)
!2864 = !DILocation(line: 459, column: 13, scope: !2851)
!2865 = !DILocation(line: 459, column: 3, scope: !2851)
!2866 = !DILocation(line: 459, column: 19, scope: !2851)
!2867 = !DILocation(line: 460, column: 18, scope: !2851)
!2868 = !DILocation(line: 460, column: 13, scope: !2851)
!2869 = !DILocation(line: 460, column: 3, scope: !2851)
!2870 = !DILocation(line: 460, column: 16, scope: !2851)
!2871 = !DILocation(line: 461, column: 2, scope: !2851)
!2872 = !DILocation(line: 454, column: 18, scope: !2847)
!2873 = !DILocation(line: 454, column: 2, scope: !2847)
!2874 = distinct !{!2874, !2849, !2875, !1996}
!2875 = !DILocation(line: 461, column: 2, scope: !2844)
!2876 = !DILocation(line: 464, column: 2, scope: !2784)
!2877 = !DILocation(line: 464, column: 9, scope: !2784)
!2878 = !DILocation(line: 464, column: 17, scope: !2784)
!2879 = !DILocation(line: 464, column: 14, scope: !2784)
!2880 = !DILocalVariable(name: "sidenum", scope: !2881, file: !24, line: 465, type: !7)
!2881 = distinct !DILexicalBlock(scope: !2784, file: !24, line: 464, column: 23)
!2882 = !DILocation(line: 465, column: 8, scope: !2881)
!2883 = !DILocalVariable(name: "count", scope: !2881, file: !24, line: 465, type: !7)
!2884 = !DILocation(line: 465, column: 17, scope: !2881)
!2885 = !DILocalVariable(name: "segp", scope: !2881, file: !24, line: 466, type: !2714)
!2886 = !DILocation(line: 466, column: 12, scope: !2881)
!2887 = !DILocalVariable(name: "ind1", scope: !2881, file: !24, line: 467, type: !7)
!2888 = !DILocation(line: 467, column: 8, scope: !2881)
!2889 = !DILocalVariable(name: "ind2", scope: !2881, file: !24, line: 467, type: !7)
!2890 = !DILocation(line: 467, column: 14, scope: !2881)
!2891 = !DILocalVariable(name: "temp", scope: !2881, file: !24, line: 467, type: !7)
!2892 = !DILocation(line: 467, column: 20, scope: !2881)
!2893 = !DILocation(line: 469, column: 7, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2881, file: !24, line: 469, column: 7)
!2895 = !DILocation(line: 469, column: 20, scope: !2894)
!2896 = !DILocation(line: 469, column: 17, scope: !2894)
!2897 = !DILocation(line: 471, column: 21, scope: !2898)
!2898 = distinct !DILexicalBlock(scope: !2894, file: !24, line: 469, column: 31)
!2899 = !DILocation(line: 471, column: 11, scope: !2898)
!2900 = !DILocation(line: 471, column: 4, scope: !2898)
!2901 = !DILocation(line: 474, column: 34, scope: !2881)
!2902 = !DILocation(line: 474, column: 20, scope: !2881)
!2903 = !DILocation(line: 474, column: 11, scope: !2881)
!2904 = !DILocation(line: 474, column: 8, scope: !2881)
!2905 = !DILocation(line: 475, column: 8, scope: !2881)
!2906 = !DILocation(line: 478, column: 11, scope: !2881)
!2907 = !DILocation(line: 478, column: 20, scope: !2881)
!2908 = !DILocation(line: 478, column: 45, scope: !2881)
!2909 = !DILocation(line: 478, column: 8, scope: !2881)
!2910 = !DILocation(line: 479, column: 11, scope: !2881)
!2911 = !DILocation(line: 479, column: 20, scope: !2881)
!2912 = !DILocation(line: 479, column: 45, scope: !2881)
!2913 = !DILocation(line: 479, column: 8, scope: !2881)
!2914 = !DILocation(line: 480, column: 20, scope: !2881)
!2915 = !DILocation(line: 480, column: 10, scope: !2881)
!2916 = !DILocation(line: 480, column: 8, scope: !2881)
!2917 = !DILocation(line: 481, column: 31, scope: !2881)
!2918 = !DILocation(line: 481, column: 21, scope: !2881)
!2919 = !DILocation(line: 481, column: 13, scope: !2881)
!2920 = !DILocation(line: 481, column: 3, scope: !2881)
!2921 = !DILocation(line: 481, column: 19, scope: !2881)
!2922 = !DILocation(line: 482, column: 21, scope: !2881)
!2923 = !DILocation(line: 482, column: 13, scope: !2881)
!2924 = !DILocation(line: 482, column: 3, scope: !2881)
!2925 = !DILocation(line: 482, column: 19, scope: !2881)
!2926 = !DILocation(line: 484, column: 9, scope: !2881)
!2927 = !DILocation(line: 485, column: 16, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2881, file: !24, line: 485, column: 3)
!2929 = !DILocation(line: 485, column: 15, scope: !2928)
!2930 = !DILocation(line: 485, column: 8, scope: !2928)
!2931 = !DILocation(line: 485, column: 22, scope: !2932)
!2932 = distinct !DILexicalBlock(scope: !2928, file: !24, line: 485, column: 3)
!2933 = !DILocation(line: 485, column: 27, scope: !2932)
!2934 = !DILocation(line: 485, column: 3, scope: !2928)
!2935 = !DILocalVariable(name: "snrand", scope: !2936, file: !24, line: 486, type: !7)
!2936 = distinct !DILexicalBlock(scope: !2932, file: !24, line: 485, column: 60)
!2937 = !DILocation(line: 486, column: 8, scope: !2936)
!2938 = !DILocalVariable(name: "wall_num", scope: !2936, file: !24, line: 486, type: !7)
!2939 = !DILocation(line: 486, column: 16, scope: !2936)
!2940 = !DILocation(line: 488, column: 8, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2936, file: !24, line: 488, column: 8)
!2942 = !DILocation(line: 488, column: 16, scope: !2941)
!2943 = !DILocation(line: 489, column: 13, scope: !2941)
!2944 = !DILocation(line: 489, column: 5, scope: !2941)
!2945 = !DILocation(line: 491, column: 23, scope: !2936)
!2946 = !DILocation(line: 491, column: 13, scope: !2936)
!2947 = !DILocation(line: 491, column: 11, scope: !2936)
!2948 = !DILocation(line: 492, column: 15, scope: !2936)
!2949 = !DILocation(line: 492, column: 21, scope: !2936)
!2950 = !DILocation(line: 492, column: 27, scope: !2936)
!2951 = !DILocation(line: 492, column: 35, scope: !2936)
!2952 = !DILocation(line: 492, column: 13, scope: !2936)
!2953 = !DILocation(line: 493, column: 11, scope: !2936)
!2954 = !DILocation(line: 495, column: 10, scope: !2955)
!2955 = distinct !DILexicalBlock(scope: !2936, file: !24, line: 495, column: 8)
!2956 = !DILocation(line: 495, column: 19, scope: !2955)
!2957 = !DILocation(line: 495, column: 26, scope: !2955)
!2958 = !DILocation(line: 495, column: 30, scope: !2955)
!2959 = !DILocation(line: 495, column: 36, scope: !2955)
!2960 = !DILocation(line: 495, column: 45, scope: !2955)
!2961 = !DILocation(line: 495, column: 53, scope: !2955)
!2962 = !DILocation(line: 495, column: 60, scope: !2955)
!2963 = !DILocation(line: 495, column: 90, scope: !2955)
!2964 = !DILocation(line: 495, column: 96, scope: !2955)
!2965 = !DILocation(line: 495, column: 63, scope: !2955)
!2966 = !DILocation(line: 496, column: 17, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2968, file: !24, line: 496, column: 9)
!2968 = distinct !DILexicalBlock(scope: !2955, file: !24, line: 495, column: 105)
!2969 = !DILocation(line: 496, column: 23, scope: !2967)
!2970 = !DILocation(line: 496, column: 32, scope: !2967)
!2971 = !DILocation(line: 496, column: 9, scope: !2967)
!2972 = !DILocation(line: 496, column: 41, scope: !2967)
!2973 = !DILocation(line: 497, column: 26, scope: !2974)
!2974 = distinct !DILexicalBlock(scope: !2967, file: !24, line: 496, column: 47)
!2975 = !DILocation(line: 497, column: 32, scope: !2974)
!2976 = !DILocation(line: 497, column: 41, scope: !2974)
!2977 = !DILocation(line: 497, column: 20, scope: !2974)
!2978 = !DILocation(line: 497, column: 6, scope: !2974)
!2979 = !DILocation(line: 497, column: 24, scope: !2974)
!2980 = !DILocation(line: 498, column: 14, scope: !2974)
!2981 = !DILocation(line: 498, column: 20, scope: !2974)
!2982 = !DILocation(line: 498, column: 29, scope: !2974)
!2983 = !DILocation(line: 498, column: 6, scope: !2974)
!2984 = !DILocation(line: 498, column: 38, scope: !2974)
!2985 = !DILocation(line: 499, column: 38, scope: !2974)
!2986 = !DILocation(line: 499, column: 47, scope: !2974)
!2987 = !DILocation(line: 499, column: 12, scope: !2974)
!2988 = !DILocation(line: 499, column: 18, scope: !2974)
!2989 = !DILocation(line: 499, column: 27, scope: !2974)
!2990 = !DILocation(line: 499, column: 6, scope: !2974)
!2991 = !DILocation(line: 499, column: 36, scope: !2974)
!2992 = !DILocation(line: 500, column: 11, scope: !2974)
!2993 = !DILocation(line: 501, column: 10, scope: !2994)
!2994 = distinct !DILexicalBlock(scope: !2974, file: !24, line: 501, column: 10)
!2995 = !DILocation(line: 501, column: 17, scope: !2994)
!2996 = !DILocation(line: 501, column: 15, scope: !2994)
!2997 = !DILocation(line: 502, column: 11, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2999, file: !24, line: 502, column: 11)
!2999 = distinct !DILexicalBlock(scope: !2994, file: !24, line: 501, column: 23)
!3000 = !DILocation(line: 502, column: 19, scope: !2998)
!3001 = !DILocation(line: 502, column: 24, scope: !2998)
!3002 = !DILocation(line: 502, column: 36, scope: !2998)
!3003 = !DILocation(line: 502, column: 16, scope: !2998)
!3004 = !DILocation(line: 503, column: 8, scope: !2998)
!3005 = !DILocation(line: 504, column: 6, scope: !2999)
!3006 = !DILocation(line: 505, column: 11, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2994, file: !24, line: 505, column: 11)
!3008 = !DILocation(line: 505, column: 15, scope: !3007)
!3009 = !DILocation(line: 505, column: 30, scope: !3007)
!3010 = !DILocation(line: 505, column: 35, scope: !3007)
!3011 = !DILocation(line: 505, column: 47, scope: !3007)
!3012 = !DILocation(line: 505, column: 27, scope: !3007)
!3013 = !DILocation(line: 506, column: 8, scope: !3007)
!3014 = !DILocation(line: 507, column: 5, scope: !2974)
!3015 = !DILocation(line: 508, column: 4, scope: !2968)
!3016 = !DILocation(line: 509, column: 3, scope: !2936)
!3017 = !DILocation(line: 485, column: 56, scope: !2932)
!3018 = !DILocation(line: 485, column: 3, scope: !2932)
!3019 = distinct !{!3019, !2934, !3020, !1996}
!3020 = !DILocation(line: 509, column: 3, scope: !2928)
!3021 = !DILocation(line: 510, column: 18, scope: !3022)
!3022 = distinct !DILexicalBlock(scope: !2881, file: !24, line: 510, column: 7)
!3023 = !DILocation(line: 510, column: 8, scope: !3022)
!3024 = !DILocation(line: 510, column: 24, scope: !3022)
!3025 = !DILocation(line: 510, column: 29, scope: !3022)
!3026 = !DILocation(line: 510, column: 43, scope: !3022)
!3027 = !DILocation(line: 510, column: 33, scope: !3022)
!3028 = !DILocation(line: 510, column: 51, scope: !3022)
!3029 = !DILocation(line: 510, column: 49, scope: !3022)
!3030 = !DILocation(line: 512, column: 4, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3022, file: !24, line: 510, column: 75)
!3032 = !DILocation(line: 514, column: 31, scope: !2881)
!3033 = !DILocation(line: 514, column: 21, scope: !2881)
!3034 = !DILocation(line: 514, column: 15, scope: !2881)
!3035 = !DILocation(line: 514, column: 13, scope: !2881)
!3036 = distinct !{!3036, !2876, !3037, !1996}
!3037 = !DILocation(line: 515, column: 2, scope: !2784)
!3038 = !DILocation(line: 517, column: 2, scope: !2784)
!3039 = !DILocation(line: 518, column: 2, scope: !2784)
!3040 = !DILocation(line: 519, column: 1, scope: !2784)
!3041 = distinct !DISubprogram(name: "choose_drop_segment", linkageName: "_Z19choose_drop_segmentv", scope: !24, file: !24, line: 528, type: !1167, scopeLine: 529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3042 = !DILocalVariable(name: "pnum", scope: !3041, file: !24, line: 530, type: !7)
!3043 = !DILocation(line: 530, column: 6, scope: !3041)
!3044 = !DILocalVariable(name: "segnum", scope: !3041, file: !24, line: 531, type: !7)
!3045 = !DILocation(line: 531, column: 6, scope: !3041)
!3046 = !DILocalVariable(name: "cur_drop_depth", scope: !3041, file: !24, line: 532, type: !7)
!3047 = !DILocation(line: 532, column: 6, scope: !3041)
!3048 = !DILocalVariable(name: "count", scope: !3041, file: !24, line: 533, type: !7)
!3049 = !DILocation(line: 533, column: 6, scope: !3041)
!3050 = !DILocalVariable(name: "player_seg", scope: !3041, file: !24, line: 534, type: !7)
!3051 = !DILocation(line: 534, column: 6, scope: !3041)
!3052 = !DILocalVariable(name: "tempv", scope: !3041, file: !24, line: 535, type: !1451)
!3053 = !DILocation(line: 535, column: 13, scope: !3041)
!3054 = !DILocalVariable(name: "player_pos", scope: !3041, file: !24, line: 535, type: !1571)
!3055 = !DILocation(line: 535, column: 20, scope: !3041)
!3056 = !DILocation(line: 537, column: 2, scope: !3041)
!3057 = !DILocation(line: 539, column: 10, scope: !3041)
!3058 = !DILocation(line: 539, column: 2, scope: !3041)
!3059 = !DILocation(line: 541, column: 43, scope: !3041)
!3060 = !DILocation(line: 541, column: 52, scope: !3041)
!3061 = !DILocation(line: 541, column: 73, scope: !3041)
!3062 = !DILocation(line: 541, column: 77, scope: !3041)
!3063 = !DILocation(line: 541, column: 39, scope: !3041)
!3064 = !DILocation(line: 541, column: 17, scope: !3041)
!3065 = !DILocation(line: 543, column: 32, scope: !3041)
!3066 = !DILocation(line: 543, column: 24, scope: !3041)
!3067 = !DILocation(line: 543, column: 44, scope: !3041)
!3068 = !DILocation(line: 543, column: 16, scope: !3041)
!3069 = !DILocation(line: 543, column: 52, scope: !3041)
!3070 = !DILocation(line: 543, column: 13, scope: !3041)
!3071 = !DILocation(line: 544, column: 31, scope: !3041)
!3072 = !DILocation(line: 544, column: 23, scope: !3041)
!3073 = !DILocation(line: 544, column: 43, scope: !3041)
!3074 = !DILocation(line: 544, column: 15, scope: !3041)
!3075 = !DILocation(line: 544, column: 51, scope: !3041)
!3076 = !DILocation(line: 544, column: 13, scope: !3041)
!3077 = !DILocation(line: 546, column: 2, scope: !3041)
!3078 = !DILocation(line: 546, column: 10, scope: !3041)
!3079 = !DILocation(line: 546, column: 17, scope: !3041)
!3080 = !DILocation(line: 546, column: 24, scope: !3041)
!3081 = !DILocation(line: 546, column: 28, scope: !3041)
!3082 = !DILocation(line: 546, column: 43, scope: !3041)
!3083 = !DILocation(line: 0, scope: !3041)
!3084 = !DILocation(line: 548, column: 11, scope: !3085)
!3085 = distinct !DILexicalBlock(scope: !3041, file: !24, line: 547, column: 2)
!3086 = !DILocation(line: 548, column: 22, scope: !3085)
!3087 = !DILocation(line: 548, column: 20, scope: !3085)
!3088 = !DILocation(line: 548, column: 33, scope: !3085)
!3089 = !DILocation(line: 548, column: 8, scope: !3085)
!3090 = !DILocation(line: 549, column: 9, scope: !3085)
!3091 = !DILocation(line: 550, column: 3, scope: !3085)
!3092 = !DILocation(line: 550, column: 11, scope: !3085)
!3093 = !DILocation(line: 550, column: 19, scope: !3085)
!3094 = !DILocation(line: 550, column: 17, scope: !3085)
!3095 = !DILocation(line: 550, column: 30, scope: !3085)
!3096 = !DILocation(line: 550, column: 43, scope: !3085)
!3097 = !DILocation(line: 550, column: 35, scope: !3085)
!3098 = !DILocation(line: 550, column: 49, scope: !3085)
!3099 = !DILocation(line: 550, column: 59, scope: !3085)
!3100 = !DILocation(line: 550, column: 65, scope: !3085)
!3101 = !DILocation(line: 550, column: 69, scope: !3085)
!3102 = !DILocation(line: 550, column: 75, scope: !3085)
!3103 = !DILocation(line: 550, column: 73, scope: !3085)
!3104 = !DILocation(line: 0, scope: !3085)
!3105 = !DILocation(line: 556, column: 12, scope: !3106)
!3106 = distinct !DILexicalBlock(scope: !3085, file: !24, line: 555, column: 3)
!3107 = !DILocation(line: 556, column: 16, scope: !3106)
!3108 = !DILocation(line: 556, column: 20, scope: !3106)
!3109 = !DILocation(line: 556, column: 19, scope: !3106)
!3110 = !DILocation(line: 556, column: 9, scope: !3106)
!3111 = !DILocation(line: 557, column: 9, scope: !3106)
!3112 = distinct !{!3112, !3091, !3113, !1996}
!3113 = !DILocation(line: 558, column: 3, scope: !3085)
!3114 = !DILocation(line: 560, column: 7, scope: !3115)
!3115 = distinct !DILexicalBlock(scope: !3085, file: !24, line: 560, column: 7)
!3116 = !DILocation(line: 560, column: 16, scope: !3115)
!3117 = !DILocation(line: 560, column: 13, scope: !3115)
!3118 = !DILocation(line: 563, column: 11, scope: !3119)
!3119 = distinct !DILexicalBlock(scope: !3115, file: !24, line: 561, column: 3)
!3120 = !DILocation(line: 563, column: 9, scope: !3119)
!3121 = !DILocation(line: 567, column: 3, scope: !3119)
!3122 = !DILocation(line: 569, column: 52, scope: !3085)
!3123 = !DILocation(line: 569, column: 44, scope: !3085)
!3124 = !DILocation(line: 569, column: 58, scope: !3085)
!3125 = !DILocation(line: 569, column: 36, scope: !3085)
!3126 = !DILocation(line: 569, column: 67, scope: !3085)
!3127 = !DILocation(line: 569, column: 12, scope: !3085)
!3128 = !DILocation(line: 569, column: 10, scope: !3085)
!3129 = !DILocation(line: 570, column: 3, scope: !3085)
!3130 = !DILocation(line: 571, column: 7, scope: !3131)
!3131 = distinct !DILexicalBlock(scope: !3085, file: !24, line: 571, column: 7)
!3132 = !DILocation(line: 571, column: 14, scope: !3131)
!3133 = !DILocation(line: 573, column: 18, scope: !3134)
!3134 = distinct !DILexicalBlock(scope: !3131, file: !24, line: 572, column: 3)
!3135 = !DILocation(line: 574, column: 4, scope: !3134)
!3136 = distinct !{!3136, !3077, !3137, !1996}
!3137 = !DILocation(line: 600, column: 2, scope: !3041)
!3138 = !DILocation(line: 576, column: 17, scope: !3139)
!3139 = distinct !DILexicalBlock(scope: !3085, file: !24, line: 576, column: 7)
!3140 = !DILocation(line: 576, column: 7, scope: !3139)
!3141 = !DILocation(line: 576, column: 25, scope: !3139)
!3142 = !DILocation(line: 576, column: 33, scope: !3139)
!3143 = !DILocation(line: 577, column: 12, scope: !3144)
!3144 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 577, column: 4)
!3145 = !DILocation(line: 577, column: 18, scope: !3144)
!3146 = !DILocation(line: 577, column: 36, scope: !3144)
!3147 = !DILocalVariable(name: "i", scope: !3148, file: !24, line: 579, type: !7)
!3148 = distinct !DILexicalBlock(scope: !3139, file: !24, line: 578, column: 8)
!3149 = !DILocation(line: 579, column: 8, scope: !3148)
!3150 = !DILocation(line: 580, column: 10, scope: !3151)
!3151 = distinct !DILexicalBlock(scope: !3148, file: !24, line: 580, column: 4)
!3152 = !DILocation(line: 580, column: 9, scope: !3151)
!3153 = !DILocation(line: 580, column: 13, scope: !3154)
!3154 = distinct !DILexicalBlock(scope: !3151, file: !24, line: 580, column: 4)
!3155 = !DILocation(line: 580, column: 14, scope: !3154)
!3156 = !DILocation(line: 580, column: 4, scope: !3151)
!3157 = !DILocalVariable(name: "ch", scope: !3158, file: !24, line: 581, type: !7)
!3158 = distinct !DILexicalBlock(scope: !3154, file: !24, line: 580, column: 22)
!3159 = !DILocation(line: 581, column: 9, scope: !3158)
!3160 = !DILocation(line: 581, column: 23, scope: !3158)
!3161 = !DILocation(line: 581, column: 14, scope: !3158)
!3162 = !DILocation(line: 581, column: 31, scope: !3158)
!3163 = !DILocation(line: 581, column: 40, scope: !3158)
!3164 = !DILocation(line: 582, column: 9, scope: !3165)
!3165 = distinct !DILexicalBlock(scope: !3158, file: !24, line: 582, column: 9)
!3166 = !DILocation(line: 582, column: 22, scope: !3165)
!3167 = !DILocation(line: 582, column: 35, scope: !3165)
!3168 = !DILocation(line: 582, column: 25, scope: !3165)
!3169 = !DILocation(line: 582, column: 39, scope: !3165)
!3170 = !DILocation(line: 582, column: 47, scope: !3165)
!3171 = !DILocation(line: 583, column: 6, scope: !3172)
!3172 = distinct !DILexicalBlock(scope: !3165, file: !24, line: 582, column: 73)
!3173 = !DILocation(line: 584, column: 13, scope: !3172)
!3174 = !DILocation(line: 585, column: 6, scope: !3172)
!3175 = !DILocation(line: 587, column: 4, scope: !3158)
!3176 = !DILocation(line: 580, column: 18, scope: !3154)
!3177 = !DILocation(line: 580, column: 4, scope: !3154)
!3178 = distinct !{!3178, !3156, !3179, !1996}
!3179 = !DILocation(line: 587, column: 4, scope: !3151)
!3180 = !DILocation(line: 591, column: 7, scope: !3181)
!3181 = distinct !DILexicalBlock(scope: !3085, file: !24, line: 591, column: 7)
!3182 = !DILocation(line: 591, column: 14, scope: !3181)
!3183 = !DILocation(line: 592, column: 45, scope: !3184)
!3184 = distinct !DILexicalBlock(scope: !3181, file: !24, line: 591, column: 21)
!3185 = !DILocation(line: 592, column: 36, scope: !3184)
!3186 = !DILocation(line: 592, column: 4, scope: !3184)
!3187 = !DILocation(line: 593, column: 32, scope: !3188)
!3188 = distinct !DILexicalBlock(scope: !3184, file: !24, line: 593, column: 8)
!3189 = !DILocation(line: 593, column: 43, scope: !3188)
!3190 = !DILocation(line: 593, column: 61, scope: !3188)
!3191 = !DILocation(line: 593, column: 8, scope: !3188)
!3192 = !DILocation(line: 593, column: 87, scope: !3188)
!3193 = !DILocation(line: 593, column: 95, scope: !3188)
!3194 = !DILocation(line: 593, column: 94, scope: !3188)
!3195 = !DILocation(line: 593, column: 85, scope: !3188)
!3196 = !DILocation(line: 594, column: 5, scope: !3197)
!3197 = distinct !DILexicalBlock(scope: !3188, file: !24, line: 593, column: 111)
!3198 = !DILocation(line: 595, column: 12, scope: !3197)
!3199 = !DILocation(line: 596, column: 4, scope: !3197)
!3200 = !DILocation(line: 597, column: 3, scope: !3184)
!3201 = !DILocation(line: 599, column: 17, scope: !3085)
!3202 = !DILocation(line: 602, column: 6, scope: !3203)
!3203 = distinct !DILexicalBlock(scope: !3041, file: !24, line: 602, column: 6)
!3204 = !DILocation(line: 602, column: 13, scope: !3203)
!3205 = !DILocation(line: 603, column: 3, scope: !3203)
!3206 = !DILocation(line: 605, column: 6, scope: !3207)
!3207 = distinct !DILexicalBlock(scope: !3041, file: !24, line: 605, column: 6)
!3208 = !DILocation(line: 605, column: 13, scope: !3207)
!3209 = !DILocation(line: 606, column: 3, scope: !3210)
!3210 = distinct !DILexicalBlock(scope: !3207, file: !24, line: 605, column: 20)
!3211 = !DILocation(line: 607, column: 11, scope: !3210)
!3212 = !DILocation(line: 607, column: 22, scope: !3210)
!3213 = !DILocation(line: 607, column: 20, scope: !3210)
!3214 = !DILocation(line: 607, column: 45, scope: !3210)
!3215 = !DILocation(line: 607, column: 3, scope: !3210)
!3216 = !DILocation(line: 609, column: 10, scope: !3207)
!3217 = !DILocation(line: 609, column: 3, scope: !3207)
!3218 = !DILocation(line: 611, column: 1, scope: !3041)
!3219 = distinct !DISubprogram(name: "segment_contains_object", linkageName: "_Z23segment_contains_objectiii", scope: !24, file: !24, line: 665, type: !3220, scopeLine: 666, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3220 = !DISubroutineType(types: !3221)
!3221 = !{!7, !7, !7, !7}
!3222 = !DILocalVariable(name: "obj_type", arg: 1, scope: !3219, file: !24, line: 665, type: !7)
!3223 = !DILocation(line: 665, column: 33, scope: !3219)
!3224 = !DILocalVariable(name: "obj_id", arg: 2, scope: !3219, file: !24, line: 665, type: !7)
!3225 = !DILocation(line: 665, column: 47, scope: !3219)
!3226 = !DILocalVariable(name: "segnum", arg: 3, scope: !3219, file: !24, line: 665, type: !7)
!3227 = !DILocation(line: 665, column: 59, scope: !3219)
!3228 = !DILocalVariable(name: "objnum", scope: !3219, file: !24, line: 667, type: !7)
!3229 = !DILocation(line: 667, column: 6, scope: !3219)
!3230 = !DILocation(line: 669, column: 6, scope: !3231)
!3231 = distinct !DILexicalBlock(scope: !3219, file: !24, line: 669, column: 6)
!3232 = !DILocation(line: 669, column: 13, scope: !3231)
!3233 = !DILocation(line: 670, column: 3, scope: !3231)
!3234 = !DILocation(line: 672, column: 20, scope: !3219)
!3235 = !DILocation(line: 672, column: 11, scope: !3219)
!3236 = !DILocation(line: 672, column: 28, scope: !3219)
!3237 = !DILocation(line: 672, column: 9, scope: !3219)
!3238 = !DILocation(line: 674, column: 2, scope: !3219)
!3239 = !DILocation(line: 674, column: 9, scope: !3219)
!3240 = !DILocation(line: 674, column: 16, scope: !3219)
!3241 = !DILocation(line: 675, column: 16, scope: !3242)
!3242 = distinct !DILexicalBlock(scope: !3219, file: !24, line: 675, column: 7)
!3243 = !DILocation(line: 675, column: 8, scope: !3242)
!3244 = !DILocation(line: 675, column: 24, scope: !3242)
!3245 = !DILocation(line: 675, column: 32, scope: !3242)
!3246 = !DILocation(line: 675, column: 29, scope: !3242)
!3247 = !DILocation(line: 675, column: 42, scope: !3242)
!3248 = !DILocation(line: 675, column: 54, scope: !3242)
!3249 = !DILocation(line: 675, column: 46, scope: !3242)
!3250 = !DILocation(line: 675, column: 62, scope: !3242)
!3251 = !DILocation(line: 675, column: 68, scope: !3242)
!3252 = !DILocation(line: 675, column: 65, scope: !3242)
!3253 = !DILocation(line: 676, column: 4, scope: !3242)
!3254 = !DILocation(line: 678, column: 21, scope: !3242)
!3255 = !DILocation(line: 678, column: 13, scope: !3242)
!3256 = !DILocation(line: 678, column: 29, scope: !3242)
!3257 = !DILocation(line: 678, column: 11, scope: !3242)
!3258 = distinct !{!3258, !3238, !3259, !1996}
!3259 = !DILocation(line: 678, column: 29, scope: !3219)
!3260 = !DILocation(line: 680, column: 2, scope: !3219)
!3261 = !DILocation(line: 681, column: 1, scope: !3219)
!3262 = distinct !DISubprogram(name: "object_nearby_aux", linkageName: "_Z17object_nearby_auxiiii", scope: !24, file: !24, line: 684, type: !3263, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3263 = !DISubroutineType(types: !3264)
!3264 = !{!7, !7, !7, !7, !7}
!3265 = !DILocalVariable(name: "segnum", arg: 1, scope: !3262, file: !24, line: 684, type: !7)
!3266 = !DILocation(line: 684, column: 27, scope: !3262)
!3267 = !DILocalVariable(name: "object_type", arg: 2, scope: !3262, file: !24, line: 684, type: !7)
!3268 = !DILocation(line: 684, column: 39, scope: !3262)
!3269 = !DILocalVariable(name: "object_id", arg: 3, scope: !3262, file: !24, line: 684, type: !7)
!3270 = !DILocation(line: 684, column: 56, scope: !3262)
!3271 = !DILocalVariable(name: "depth", arg: 4, scope: !3262, file: !24, line: 684, type: !7)
!3272 = !DILocation(line: 684, column: 71, scope: !3262)
!3273 = !DILocalVariable(name: "i", scope: !3262, file: !24, line: 686, type: !7)
!3274 = !DILocation(line: 686, column: 6, scope: !3262)
!3275 = !DILocation(line: 688, column: 6, scope: !3276)
!3276 = distinct !DILexicalBlock(scope: !3262, file: !24, line: 688, column: 6)
!3277 = !DILocation(line: 688, column: 12, scope: !3276)
!3278 = !DILocation(line: 689, column: 3, scope: !3276)
!3279 = !DILocation(line: 691, column: 30, scope: !3280)
!3280 = distinct !DILexicalBlock(scope: !3262, file: !24, line: 691, column: 6)
!3281 = !DILocation(line: 691, column: 43, scope: !3280)
!3282 = !DILocation(line: 691, column: 54, scope: !3280)
!3283 = !DILocation(line: 691, column: 6, scope: !3280)
!3284 = !DILocation(line: 692, column: 3, scope: !3280)
!3285 = !DILocation(line: 694, column: 8, scope: !3286)
!3286 = distinct !DILexicalBlock(scope: !3262, file: !24, line: 694, column: 2)
!3287 = !DILocation(line: 694, column: 7, scope: !3286)
!3288 = !DILocation(line: 694, column: 12, scope: !3289)
!3289 = distinct !DILexicalBlock(scope: !3286, file: !24, line: 694, column: 2)
!3290 = !DILocation(line: 694, column: 13, scope: !3289)
!3291 = !DILocation(line: 694, column: 2, scope: !3286)
!3292 = !DILocalVariable(name: "seg2", scope: !3293, file: !24, line: 695, type: !7)
!3293 = distinct !DILexicalBlock(scope: !3289, file: !24, line: 694, column: 42)
!3294 = !DILocation(line: 695, column: 7, scope: !3293)
!3295 = !DILocation(line: 695, column: 23, scope: !3293)
!3296 = !DILocation(line: 695, column: 14, scope: !3293)
!3297 = !DILocation(line: 695, column: 31, scope: !3293)
!3298 = !DILocation(line: 695, column: 40, scope: !3293)
!3299 = !DILocation(line: 697, column: 7, scope: !3300)
!3300 = distinct !DILexicalBlock(scope: !3293, file: !24, line: 697, column: 7)
!3301 = !DILocation(line: 697, column: 12, scope: !3300)
!3302 = !DILocation(line: 698, column: 26, scope: !3303)
!3303 = distinct !DILexicalBlock(scope: !3300, file: !24, line: 698, column: 8)
!3304 = !DILocation(line: 698, column: 32, scope: !3303)
!3305 = !DILocation(line: 698, column: 45, scope: !3303)
!3306 = !DILocation(line: 698, column: 56, scope: !3303)
!3307 = !DILocation(line: 698, column: 61, scope: !3303)
!3308 = !DILocation(line: 698, column: 8, scope: !3303)
!3309 = !DILocation(line: 699, column: 5, scope: !3303)
!3310 = !DILocation(line: 698, column: 63, scope: !3303)
!3311 = !DILocation(line: 700, column: 2, scope: !3293)
!3312 = !DILocation(line: 694, column: 38, scope: !3289)
!3313 = !DILocation(line: 694, column: 2, scope: !3289)
!3314 = distinct !{!3314, !3291, !3315, !1996}
!3315 = !DILocation(line: 700, column: 2, scope: !3286)
!3316 = !DILocation(line: 702, column: 2, scope: !3262)
!3317 = !DILocation(line: 703, column: 1, scope: !3262)
!3318 = distinct !DISubprogram(name: "weapon_nearby", linkageName: "_Z13weapon_nearbyP6objecti", scope: !24, file: !24, line: 708, type: !2457, scopeLine: 709, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3319 = !DILocalVariable(name: "objp", arg: 1, scope: !3318, file: !24, line: 708, type: !1434)
!3320 = !DILocation(line: 708, column: 27, scope: !3318)
!3321 = !DILocalVariable(name: "weapon_id", arg: 2, scope: !3318, file: !24, line: 708, type: !7)
!3322 = !DILocation(line: 708, column: 37, scope: !3318)
!3323 = !DILocation(line: 710, column: 27, scope: !3318)
!3324 = !DILocation(line: 710, column: 33, scope: !3318)
!3325 = !DILocation(line: 710, column: 54, scope: !3318)
!3326 = !DILocation(line: 710, column: 9, scope: !3318)
!3327 = !DILocation(line: 710, column: 2, scope: !3318)
!3328 = distinct !DISubprogram(name: "maybe_replace_powerup_with_energy", linkageName: "_Z33maybe_replace_powerup_with_energyP6object", scope: !24, file: !24, line: 714, type: !2696, scopeLine: 715, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3329 = !DILocalVariable(name: "del_obj", arg: 1, scope: !3328, file: !24, line: 714, type: !1434)
!3330 = !DILocation(line: 714, column: 48, scope: !3328)
!3331 = !DILocalVariable(name: "weapon_index", scope: !3328, file: !24, line: 716, type: !7)
!3332 = !DILocation(line: 716, column: 6, scope: !3328)
!3333 = !DILocation(line: 718, column: 6, scope: !3334)
!3334 = distinct !DILexicalBlock(scope: !3328, file: !24, line: 718, column: 6)
!3335 = !DILocation(line: 718, column: 15, scope: !3334)
!3336 = !DILocation(line: 718, column: 29, scope: !3334)
!3337 = !DILocation(line: 719, column: 3, scope: !3334)
!3338 = !DILocation(line: 721, column: 6, scope: !3339)
!3339 = distinct !DILexicalBlock(scope: !3328, file: !24, line: 721, column: 6)
!3340 = !DILocation(line: 721, column: 15, scope: !3339)
!3341 = !DILocation(line: 721, column: 27, scope: !3339)
!3342 = !DILocation(line: 722, column: 21, scope: !3343)
!3343 = distinct !DILexicalBlock(scope: !3344, file: !24, line: 722, column: 7)
!3344 = distinct !DILexicalBlock(scope: !3339, file: !24, line: 721, column: 41)
!3345 = !DILocation(line: 722, column: 30, scope: !3343)
!3346 = !DILocation(line: 722, column: 39, scope: !3343)
!3347 = !DILocation(line: 722, column: 7, scope: !3343)
!3348 = !DILocation(line: 723, column: 4, scope: !3349)
!3349 = distinct !DILexicalBlock(scope: !3343, file: !24, line: 722, column: 53)
!3350 = !DILocation(line: 724, column: 4, scope: !3349)
!3351 = !DILocation(line: 724, column: 13, scope: !3349)
!3352 = !DILocation(line: 724, column: 28, scope: !3349)
!3353 = !DILocation(line: 725, column: 3, scope: !3349)
!3354 = !DILocation(line: 726, column: 3, scope: !3344)
!3355 = !DILocation(line: 728, column: 10, scope: !3328)
!3356 = !DILocation(line: 728, column: 19, scope: !3328)
!3357 = !DILocation(line: 728, column: 2, scope: !3328)
!3358 = !DILocation(line: 729, column: 42, scope: !3359)
!3359 = distinct !DILexicalBlock(scope: !3328, file: !24, line: 728, column: 32)
!3360 = !DILocation(line: 729, column: 59, scope: !3359)
!3361 = !DILocation(line: 730, column: 41, scope: !3359)
!3362 = !DILocation(line: 730, column: 57, scope: !3359)
!3363 = !DILocation(line: 731, column: 44, scope: !3359)
!3364 = !DILocation(line: 731, column: 64, scope: !3359)
!3365 = !DILocation(line: 732, column: 42, scope: !3359)
!3366 = !DILocation(line: 732, column: 59, scope: !3359)
!3367 = !DILocation(line: 733, column: 42, scope: !3359)
!3368 = !DILocation(line: 733, column: 59, scope: !3359)
!3369 = !DILocation(line: 735, column: 41, scope: !3359)
!3370 = !DILocation(line: 735, column: 57, scope: !3359)
!3371 = !DILocation(line: 736, column: 42, scope: !3359)
!3372 = !DILocation(line: 736, column: 60, scope: !3359)
!3373 = !DILocation(line: 737, column: 41, scope: !3359)
!3374 = !DILocation(line: 737, column: 57, scope: !3359)
!3375 = !DILocation(line: 742, column: 8, scope: !3376)
!3376 = distinct !DILexicalBlock(scope: !3328, file: !24, line: 742, column: 6)
!3377 = !DILocation(line: 742, column: 21, scope: !3376)
!3378 = !DILocation(line: 742, column: 38, scope: !3376)
!3379 = !DILocation(line: 742, column: 42, scope: !3376)
!3380 = !DILocation(line: 742, column: 51, scope: !3376)
!3381 = !DILocation(line: 742, column: 63, scope: !3376)
!3382 = !DILocation(line: 742, column: 84, scope: !3376)
!3383 = !DILocation(line: 742, column: 96, scope: !3376)
!3384 = !DILocation(line: 742, column: 88, scope: !3376)
!3385 = !DILocation(line: 742, column: 108, scope: !3376)
!3386 = !DILocation(line: 742, column: 135, scope: !3376)
!3387 = !DILocation(line: 743, column: 3, scope: !3376)
!3388 = !DILocation(line: 743, column: 12, scope: !3376)
!3389 = !DILocation(line: 743, column: 27, scope: !3376)
!3390 = !DILocation(line: 744, column: 13, scope: !3391)
!3391 = distinct !DILexicalBlock(scope: !3376, file: !24, line: 744, column: 11)
!3392 = !DILocation(line: 744, column: 26, scope: !3391)
!3393 = !DILocation(line: 744, column: 42, scope: !3391)
!3394 = !DILocation(line: 744, column: 46, scope: !3391)
!3395 = !DILocation(line: 744, column: 55, scope: !3391)
!3396 = !DILocation(line: 744, column: 67, scope: !3391)
!3397 = !DILocation(line: 744, column: 88, scope: !3391)
!3398 = !DILocation(line: 744, column: 100, scope: !3391)
!3399 = !DILocation(line: 744, column: 92, scope: !3391)
!3400 = !DILocation(line: 744, column: 112, scope: !3391)
!3401 = !DILocation(line: 744, column: 139, scope: !3391)
!3402 = !DILocation(line: 745, column: 3, scope: !3391)
!3403 = !DILocation(line: 745, column: 12, scope: !3391)
!3404 = !DILocation(line: 745, column: 27, scope: !3391)
!3405 = !DILocation(line: 746, column: 11, scope: !3406)
!3406 = distinct !DILexicalBlock(scope: !3391, file: !24, line: 746, column: 11)
!3407 = !DILocation(line: 746, column: 24, scope: !3406)
!3408 = !DILocation(line: 747, column: 26, scope: !3409)
!3409 = distinct !DILexicalBlock(scope: !3410, file: !24, line: 747, column: 7)
!3410 = distinct !DILexicalBlock(scope: !3406, file: !24, line: 746, column: 31)
!3411 = !DILocation(line: 747, column: 8, scope: !3409)
!3412 = !DILocation(line: 747, column: 43, scope: !3409)
!3413 = !DILocation(line: 747, column: 7, scope: !3409)
!3414 = !DILocation(line: 747, column: 62, scope: !3409)
!3415 = !DILocation(line: 747, column: 79, scope: !3409)
!3416 = !DILocation(line: 747, column: 88, scope: !3409)
!3417 = !DILocation(line: 747, column: 97, scope: !3409)
!3418 = !DILocation(line: 747, column: 65, scope: !3409)
!3419 = !DILocation(line: 748, column: 8, scope: !3420)
!3420 = distinct !DILexicalBlock(scope: !3421, file: !24, line: 748, column: 8)
!3421 = distinct !DILexicalBlock(scope: !3409, file: !24, line: 747, column: 111)
!3422 = !DILocation(line: 748, column: 17, scope: !3420)
!3423 = !DILocation(line: 749, column: 5, scope: !3424)
!3424 = distinct !DILexicalBlock(scope: !3420, file: !24, line: 748, column: 26)
!3425 = !DILocation(line: 749, column: 14, scope: !3424)
!3426 = !DILocation(line: 749, column: 28, scope: !3424)
!3427 = !DILocation(line: 750, column: 9, scope: !3428)
!3428 = distinct !DILexicalBlock(scope: !3424, file: !24, line: 750, column: 9)
!3429 = !DILocation(line: 750, column: 22, scope: !3428)
!3430 = !DILocation(line: 751, column: 6, scope: !3431)
!3431 = distinct !DILexicalBlock(scope: !3428, file: !24, line: 750, column: 39)
!3432 = !DILocation(line: 751, column: 15, scope: !3431)
!3433 = !DILocation(line: 751, column: 27, scope: !3431)
!3434 = !DILocation(line: 752, column: 5, scope: !3431)
!3435 = !DILocation(line: 752, column: 16, scope: !3436)
!3436 = distinct !DILexicalBlock(scope: !3428, file: !24, line: 752, column: 16)
!3437 = !DILocation(line: 752, column: 29, scope: !3436)
!3438 = !DILocation(line: 753, column: 6, scope: !3439)
!3439 = distinct !DILexicalBlock(scope: !3436, file: !24, line: 752, column: 45)
!3440 = !DILocation(line: 753, column: 15, scope: !3439)
!3441 = !DILocation(line: 753, column: 27, scope: !3439)
!3442 = !DILocation(line: 754, column: 5, scope: !3439)
!3443 = !DILocation(line: 755, column: 6, scope: !3444)
!3444 = distinct !DILexicalBlock(scope: !3436, file: !24, line: 754, column: 12)
!3445 = !DILocation(line: 755, column: 15, scope: !3444)
!3446 = !DILocation(line: 755, column: 27, scope: !3444)
!3447 = !DILocation(line: 757, column: 4, scope: !3424)
!3448 = !DILocation(line: 758, column: 5, scope: !3449)
!3449 = distinct !DILexicalBlock(scope: !3420, file: !24, line: 757, column: 11)
!3450 = !DILocation(line: 758, column: 14, scope: !3449)
!3451 = !DILocation(line: 758, column: 28, scope: !3449)
!3452 = !DILocation(line: 759, column: 5, scope: !3449)
!3453 = !DILocation(line: 759, column: 14, scope: !3449)
!3454 = !DILocation(line: 759, column: 26, scope: !3449)
!3455 = !DILocation(line: 761, column: 3, scope: !3421)
!3456 = !DILocation(line: 762, column: 2, scope: !3410)
!3457 = !DILocation(line: 762, column: 13, scope: !3458)
!3458 = distinct !DILexicalBlock(scope: !3406, file: !24, line: 762, column: 13)
!3459 = !DILocation(line: 762, column: 22, scope: !3458)
!3460 = !DILocation(line: 762, column: 34, scope: !3458)
!3461 = !DILocation(line: 763, column: 16, scope: !3462)
!3462 = distinct !DILexicalBlock(scope: !3458, file: !24, line: 763, column: 7)
!3463 = !DILocation(line: 763, column: 8, scope: !3462)
!3464 = !DILocation(line: 763, column: 28, scope: !3462)
!3465 = !DILocation(line: 763, column: 34, scope: !3462)
!3466 = !DILocation(line: 763, column: 7, scope: !3462)
!3467 = !DILocation(line: 763, column: 62, scope: !3462)
!3468 = !DILocation(line: 763, column: 79, scope: !3462)
!3469 = !DILocation(line: 763, column: 88, scope: !3462)
!3470 = !DILocation(line: 763, column: 97, scope: !3462)
!3471 = !DILocation(line: 763, column: 65, scope: !3462)
!3472 = !DILocation(line: 764, column: 8, scope: !3473)
!3473 = distinct !DILexicalBlock(scope: !3474, file: !24, line: 764, column: 8)
!3474 = distinct !DILexicalBlock(scope: !3462, file: !24, line: 763, column: 111)
!3475 = !DILocation(line: 764, column: 17, scope: !3473)
!3476 = !DILocation(line: 765, column: 5, scope: !3477)
!3477 = distinct !DILexicalBlock(scope: !3473, file: !24, line: 764, column: 26)
!3478 = !DILocation(line: 765, column: 14, scope: !3477)
!3479 = !DILocation(line: 765, column: 28, scope: !3477)
!3480 = !DILocation(line: 766, column: 5, scope: !3477)
!3481 = !DILocation(line: 766, column: 14, scope: !3477)
!3482 = !DILocation(line: 766, column: 26, scope: !3477)
!3483 = !DILocation(line: 767, column: 4, scope: !3477)
!3484 = !DILocation(line: 768, column: 5, scope: !3485)
!3485 = distinct !DILexicalBlock(scope: !3473, file: !24, line: 767, column: 11)
!3486 = !DILocation(line: 768, column: 14, scope: !3485)
!3487 = !DILocation(line: 768, column: 28, scope: !3485)
!3488 = !DILocation(line: 769, column: 5, scope: !3485)
!3489 = !DILocation(line: 769, column: 14, scope: !3485)
!3490 = !DILocation(line: 769, column: 26, scope: !3485)
!3491 = !DILocation(line: 771, column: 3, scope: !3474)
!3492 = !DILocation(line: 763, column: 108, scope: !3462)
!3493 = !DILocation(line: 775, column: 8, scope: !3494)
!3494 = distinct !DILexicalBlock(scope: !3328, file: !24, line: 775, column: 7)
!3495 = !DILocation(line: 775, column: 17, scope: !3494)
!3496 = !DILocation(line: 775, column: 32, scope: !3494)
!3497 = !DILocation(line: 775, column: 57, scope: !3494)
!3498 = !DILocation(line: 775, column: 61, scope: !3494)
!3499 = !DILocation(line: 775, column: 70, scope: !3494)
!3500 = !DILocation(line: 775, column: 82, scope: !3494)
!3501 = !DILocation(line: 775, column: 97, scope: !3494)
!3502 = !DILocation(line: 775, column: 101, scope: !3494)
!3503 = !DILocation(line: 775, column: 110, scope: !3494)
!3504 = !DILocation(line: 775, column: 124, scope: !3494)
!3505 = !DILocation(line: 776, column: 3, scope: !3506)
!3506 = distinct !DILexicalBlock(scope: !3494, file: !24, line: 775, column: 142)
!3507 = !DILocation(line: 777, column: 3, scope: !3506)
!3508 = !DILocation(line: 777, column: 12, scope: !3506)
!3509 = !DILocation(line: 777, column: 27, scope: !3506)
!3510 = !DILocation(line: 778, column: 2, scope: !3506)
!3511 = !DILocation(line: 781, column: 7, scope: !3512)
!3512 = distinct !DILexicalBlock(scope: !3328, file: !24, line: 781, column: 6)
!3513 = !DILocation(line: 781, column: 17, scope: !3512)
!3514 = !DILocation(line: 781, column: 6, scope: !3512)
!3515 = !DILocation(line: 781, column: 29, scope: !3512)
!3516 = !DILocation(line: 781, column: 33, scope: !3512)
!3517 = !DILocation(line: 781, column: 42, scope: !3512)
!3518 = !DILocation(line: 781, column: 54, scope: !3512)
!3519 = !DILocation(line: 783, column: 3, scope: !3520)
!3520 = distinct !DILexicalBlock(scope: !3512, file: !24, line: 782, column: 2)
!3521 = !DILocation(line: 783, column: 12, scope: !3520)
!3522 = !DILocation(line: 783, column: 24, scope: !3520)
!3523 = !DILocation(line: 784, column: 2, scope: !3520)
!3524 = !DILocation(line: 785, column: 1, scope: !3328)
!3525 = distinct !DISubprogram(name: "drop_powerup", linkageName: "_Z12drop_powerupiiiP10vms_vectorS0_i", scope: !24, file: !24, line: 787, type: !3526, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3526 = !DISubroutineType(types: !3527)
!3527 = !{!7, !7, !7, !7, !1571, !1571, !7}
!3528 = !DILocalVariable(name: "type", arg: 1, scope: !3525, file: !24, line: 787, type: !7)
!3529 = !DILocation(line: 787, column: 22, scope: !3525)
!3530 = !DILocalVariable(name: "id", arg: 2, scope: !3525, file: !24, line: 787, type: !7)
!3531 = !DILocation(line: 787, column: 32, scope: !3525)
!3532 = !DILocalVariable(name: "num", arg: 3, scope: !3525, file: !24, line: 787, type: !7)
!3533 = !DILocation(line: 787, column: 40, scope: !3525)
!3534 = !DILocalVariable(name: "init_vel", arg: 4, scope: !3525, file: !24, line: 787, type: !1571)
!3535 = !DILocation(line: 787, column: 57, scope: !3525)
!3536 = !DILocalVariable(name: "pos", arg: 5, scope: !3525, file: !24, line: 787, type: !1571)
!3537 = !DILocation(line: 787, column: 79, scope: !3525)
!3538 = !DILocalVariable(name: "segnum", arg: 6, scope: !3525, file: !24, line: 787, type: !7)
!3539 = !DILocation(line: 787, column: 88, scope: !3525)
!3540 = !DILocalVariable(name: "objnum", scope: !3525, file: !24, line: 789, type: !7)
!3541 = !DILocation(line: 789, column: 7, scope: !3525)
!3542 = !DILocalVariable(name: "obj", scope: !3525, file: !24, line: 790, type: !1434)
!3543 = !DILocation(line: 790, column: 10, scope: !3525)
!3544 = !DILocalVariable(name: "new_velocity", scope: !3525, file: !24, line: 791, type: !1451)
!3545 = !DILocation(line: 791, column: 13, scope: !3525)
!3546 = !DILocalVariable(name: "new_pos", scope: !3525, file: !24, line: 791, type: !1451)
!3547 = !DILocation(line: 791, column: 27, scope: !3525)
!3548 = !DILocalVariable(name: "old_mag", scope: !3525, file: !24, line: 792, type: !14)
!3549 = !DILocation(line: 792, column: 7, scope: !3525)
!3550 = !DILocalVariable(name: "count", scope: !3525, file: !24, line: 793, type: !7)
!3551 = !DILocation(line: 793, column: 20, scope: !3525)
!3552 = !DILocation(line: 795, column: 10, scope: !3525)
!3553 = !DILocation(line: 795, column: 2, scope: !3525)
!3554 = !DILocation(line: 797, column: 14, scope: !3555)
!3555 = distinct !DILexicalBlock(scope: !3556, file: !24, line: 797, column: 4)
!3556 = distinct !DILexicalBlock(scope: !3525, file: !24, line: 795, column: 16)
!3557 = !DILocation(line: 797, column: 9, scope: !3555)
!3558 = !DILocation(line: 797, column: 18, scope: !3559)
!3559 = distinct !DILexicalBlock(scope: !3555, file: !24, line: 797, column: 4)
!3560 = !DILocation(line: 797, column: 24, scope: !3559)
!3561 = !DILocation(line: 797, column: 23, scope: !3559)
!3562 = !DILocation(line: 797, column: 4, scope: !3555)
!3563 = !DILocalVariable(name: "rand_scale", scope: !3564, file: !24, line: 798, type: !7)
!3564 = distinct !DILexicalBlock(scope: !3559, file: !24, line: 797, column: 38)
!3565 = !DILocation(line: 798, column: 9, scope: !3564)
!3566 = !DILocation(line: 799, column: 21, scope: !3564)
!3567 = !DILocation(line: 799, column: 18, scope: !3564)
!3568 = !DILocation(line: 800, column: 32, scope: !3564)
!3569 = !DILocation(line: 800, column: 15, scope: !3564)
!3570 = !DILocation(line: 800, column: 13, scope: !3564)
!3571 = !DILocation(line: 803, column: 10, scope: !3572)
!3572 = distinct !DILexicalBlock(scope: !3564, file: !24, line: 803, column: 9)
!3573 = !DILocation(line: 803, column: 20, scope: !3572)
!3574 = !DILocation(line: 803, column: 9, scope: !3572)
!3575 = !DILocation(line: 803, column: 32, scope: !3572)
!3576 = !DILocation(line: 803, column: 37, scope: !3572)
!3577 = !DILocation(line: 803, column: 47, scope: !3572)
!3578 = !DILocation(line: 803, column: 36, scope: !3572)
!3579 = !DILocation(line: 804, column: 17, scope: !3580)
!3580 = distinct !DILexicalBlock(scope: !3572, file: !24, line: 803, column: 67)
!3581 = !DILocation(line: 806, column: 10, scope: !3582)
!3582 = distinct !DILexicalBlock(scope: !3580, file: !24, line: 806, column: 10)
!3583 = !DILocation(line: 806, column: 13, scope: !3582)
!3584 = !DILocation(line: 807, column: 10, scope: !3582)
!3585 = !DILocation(line: 807, column: 7, scope: !3582)
!3586 = !DILocation(line: 808, column: 5, scope: !3580)
!3587 = !DILocation(line: 809, column: 17, scope: !3572)
!3588 = !DILocation(line: 811, column: 30, scope: !3564)
!3589 = !DILocation(line: 811, column: 37, scope: !3564)
!3590 = !DILocation(line: 811, column: 47, scope: !3564)
!3591 = !DILocation(line: 811, column: 56, scope: !3564)
!3592 = !DILocation(line: 811, column: 55, scope: !3564)
!3593 = !DILocation(line: 811, column: 75, scope: !3564)
!3594 = !DILocation(line: 811, column: 74, scope: !3564)
!3595 = !DILocation(line: 811, column: 67, scope: !3564)
!3596 = !DILocation(line: 811, column: 23, scope: !3564)
!3597 = !DILocation(line: 811, column: 18, scope: !3564)
!3598 = !DILocation(line: 811, column: 20, scope: !3564)
!3599 = !DILocation(line: 812, column: 30, scope: !3564)
!3600 = !DILocation(line: 812, column: 37, scope: !3564)
!3601 = !DILocation(line: 812, column: 47, scope: !3564)
!3602 = !DILocation(line: 812, column: 56, scope: !3564)
!3603 = !DILocation(line: 812, column: 55, scope: !3564)
!3604 = !DILocation(line: 812, column: 75, scope: !3564)
!3605 = !DILocation(line: 812, column: 74, scope: !3564)
!3606 = !DILocation(line: 812, column: 67, scope: !3564)
!3607 = !DILocation(line: 812, column: 23, scope: !3564)
!3608 = !DILocation(line: 812, column: 18, scope: !3564)
!3609 = !DILocation(line: 812, column: 20, scope: !3564)
!3610 = !DILocation(line: 813, column: 30, scope: !3564)
!3611 = !DILocation(line: 813, column: 37, scope: !3564)
!3612 = !DILocation(line: 813, column: 47, scope: !3564)
!3613 = !DILocation(line: 813, column: 56, scope: !3564)
!3614 = !DILocation(line: 813, column: 55, scope: !3564)
!3615 = !DILocation(line: 813, column: 75, scope: !3564)
!3616 = !DILocation(line: 813, column: 74, scope: !3564)
!3617 = !DILocation(line: 813, column: 67, scope: !3564)
!3618 = !DILocation(line: 813, column: 23, scope: !3564)
!3619 = !DILocation(line: 813, column: 18, scope: !3564)
!3620 = !DILocation(line: 813, column: 20, scope: !3564)
!3621 = !DILocation(line: 817, column: 10, scope: !3622)
!3622 = distinct !DILexicalBlock(scope: !3564, file: !24, line: 817, column: 9)
!3623 = !DILocation(line: 817, column: 20, scope: !3622)
!3624 = !DILocation(line: 817, column: 9, scope: !3622)
!3625 = !DILocation(line: 817, column: 32, scope: !3622)
!3626 = !DILocation(line: 817, column: 36, scope: !3622)
!3627 = !DILocation(line: 817, column: 39, scope: !3622)
!3628 = !DILocation(line: 817, column: 56, scope: !3622)
!3629 = !DILocation(line: 817, column: 60, scope: !3622)
!3630 = !DILocation(line: 817, column: 63, scope: !3622)
!3631 = !DILocation(line: 818, column: 6, scope: !3622)
!3632 = !DILocation(line: 820, column: 16, scope: !3564)
!3633 = !DILocation(line: 820, column: 13, scope: !3564)
!3634 = !DILocation(line: 836, column: 26, scope: !3564)
!3635 = !DILocation(line: 836, column: 32, scope: !3564)
!3636 = !DILocation(line: 836, column: 36, scope: !3564)
!3637 = !DILocation(line: 836, column: 89, scope: !3564)
!3638 = !DILocation(line: 836, column: 76, scope: !3564)
!3639 = !DILocation(line: 836, column: 93, scope: !3564)
!3640 = !DILocation(line: 836, column: 14, scope: !3564)
!3641 = !DILocation(line: 836, column: 12, scope: !3564)
!3642 = !DILocation(line: 838, column: 9, scope: !3643)
!3643 = distinct !DILexicalBlock(scope: !3564, file: !24, line: 838, column: 9)
!3644 = !DILocation(line: 838, column: 16, scope: !3643)
!3645 = !DILocation(line: 840, column: 6, scope: !3646)
!3646 = distinct !DILexicalBlock(scope: !3643, file: !24, line: 839, column: 5)
!3647 = !DILocation(line: 841, column: 6, scope: !3646)
!3648 = !DILocation(line: 842, column: 13, scope: !3646)
!3649 = !DILocation(line: 842, column: 6, scope: !3646)
!3650 = !DILocation(line: 852, column: 20, scope: !3564)
!3651 = !DILocation(line: 852, column: 12, scope: !3564)
!3652 = !DILocation(line: 852, column: 9, scope: !3564)
!3653 = !DILocation(line: 854, column: 5, scope: !3564)
!3654 = !DILocation(line: 854, column: 10, scope: !3564)
!3655 = !DILocation(line: 854, column: 26, scope: !3564)
!3656 = !DILocation(line: 854, column: 35, scope: !3564)
!3657 = !DILocation(line: 859, column: 5, scope: !3564)
!3658 = !DILocation(line: 859, column: 10, scope: !3564)
!3659 = !DILocation(line: 859, column: 26, scope: !3564)
!3660 = !DILocation(line: 859, column: 31, scope: !3564)
!3661 = !DILocation(line: 860, column: 5, scope: !3564)
!3662 = !DILocation(line: 860, column: 10, scope: !3564)
!3663 = !DILocation(line: 860, column: 26, scope: !3564)
!3664 = !DILocation(line: 860, column: 31, scope: !3564)
!3665 = !DILocation(line: 862, column: 5, scope: !3564)
!3666 = !DILocation(line: 862, column: 10, scope: !3564)
!3667 = !DILocation(line: 862, column: 26, scope: !3564)
!3668 = !DILocation(line: 862, column: 32, scope: !3564)
!3669 = !DILocation(line: 864, column: 52, scope: !3564)
!3670 = !DILocation(line: 864, column: 57, scope: !3564)
!3671 = !DILocation(line: 864, column: 39, scope: !3564)
!3672 = !DILocation(line: 864, column: 61, scope: !3564)
!3673 = !DILocation(line: 864, column: 5, scope: !3564)
!3674 = !DILocation(line: 864, column: 10, scope: !3564)
!3675 = !DILocation(line: 864, column: 27, scope: !3564)
!3676 = !DILocation(line: 864, column: 37, scope: !3564)
!3677 = !DILocation(line: 865, column: 45, scope: !3564)
!3678 = !DILocation(line: 865, column: 50, scope: !3564)
!3679 = !DILocation(line: 865, column: 67, scope: !3564)
!3680 = !DILocation(line: 865, column: 39, scope: !3564)
!3681 = !DILocation(line: 865, column: 78, scope: !3564)
!3682 = !DILocation(line: 865, column: 5, scope: !3564)
!3683 = !DILocation(line: 865, column: 10, scope: !3564)
!3684 = !DILocation(line: 865, column: 27, scope: !3564)
!3685 = !DILocation(line: 865, column: 37, scope: !3564)
!3686 = !DILocation(line: 866, column: 5, scope: !3564)
!3687 = !DILocation(line: 866, column: 10, scope: !3564)
!3688 = !DILocation(line: 866, column: 27, scope: !3564)
!3689 = !DILocation(line: 866, column: 36, scope: !3564)
!3690 = !DILocation(line: 868, column: 13, scope: !3564)
!3691 = !DILocation(line: 868, column: 18, scope: !3564)
!3692 = !DILocation(line: 868, column: 5, scope: !3564)
!3693 = !DILocation(line: 874, column: 24, scope: !3694)
!3694 = distinct !DILexicalBlock(scope: !3564, file: !24, line: 869, column: 5)
!3695 = !DILocation(line: 874, column: 33, scope: !3694)
!3696 = !DILocation(line: 874, column: 43, scope: !3694)
!3697 = !DILocation(line: 874, column: 7, scope: !3694)
!3698 = !DILocation(line: 874, column: 12, scope: !3694)
!3699 = !DILocation(line: 874, column: 21, scope: !3694)
!3700 = !DILocation(line: 875, column: 11, scope: !3701)
!3701 = distinct !DILexicalBlock(scope: !3694, file: !24, line: 875, column: 11)
!3702 = !DILocation(line: 875, column: 21, scope: !3701)
!3703 = !DILocation(line: 876, column: 8, scope: !3701)
!3704 = !DILocation(line: 876, column: 13, scope: !3701)
!3705 = !DILocation(line: 876, column: 22, scope: !3701)
!3706 = !DILocation(line: 877, column: 7, scope: !3694)
!3707 = !DILocation(line: 881, column: 7, scope: !3694)
!3708 = !DILocation(line: 883, column: 4, scope: !3564)
!3709 = !DILocation(line: 797, column: 34, scope: !3559)
!3710 = !DILocation(line: 797, column: 4, scope: !3559)
!3711 = distinct !{!3711, !3562, !3712, !1996}
!3712 = !DILocation(line: 883, column: 4, scope: !3555)
!3713 = !DILocation(line: 884, column: 4, scope: !3556)
!3714 = !DILocation(line: 887, column: 14, scope: !3715)
!3715 = distinct !DILexicalBlock(scope: !3556, file: !24, line: 887, column: 4)
!3716 = !DILocation(line: 887, column: 9, scope: !3715)
!3717 = !DILocation(line: 887, column: 18, scope: !3718)
!3718 = distinct !DILexicalBlock(scope: !3715, file: !24, line: 887, column: 4)
!3719 = !DILocation(line: 887, column: 24, scope: !3718)
!3720 = !DILocation(line: 887, column: 23, scope: !3718)
!3721 = !DILocation(line: 887, column: 4, scope: !3715)
!3722 = !DILocalVariable(name: "rand_scale", scope: !3723, file: !24, line: 889, type: !7)
!3723 = distinct !DILexicalBlock(scope: !3718, file: !24, line: 888, column: 4)
!3724 = !DILocation(line: 889, column: 9, scope: !3723)
!3725 = !DILocation(line: 890, column: 21, scope: !3723)
!3726 = !DILocation(line: 890, column: 18, scope: !3723)
!3727 = !DILocation(line: 891, column: 32, scope: !3723)
!3728 = !DILocation(line: 891, column: 15, scope: !3723)
!3729 = !DILocation(line: 891, column: 13, scope: !3723)
!3730 = !DILocation(line: 893, column: 5, scope: !3723)
!3731 = !DILocation(line: 899, column: 17, scope: !3723)
!3732 = !DILocation(line: 901, column: 24, scope: !3723)
!3733 = !DILocation(line: 901, column: 32, scope: !3723)
!3734 = !DILocation(line: 901, column: 39, scope: !3723)
!3735 = !DILocation(line: 901, column: 18, scope: !3723)
!3736 = !DILocation(line: 901, column: 20, scope: !3723)
!3737 = !DILocation(line: 902, column: 24, scope: !3723)
!3738 = !DILocation(line: 902, column: 32, scope: !3723)
!3739 = !DILocation(line: 902, column: 39, scope: !3723)
!3740 = !DILocation(line: 902, column: 18, scope: !3723)
!3741 = !DILocation(line: 902, column: 20, scope: !3723)
!3742 = !DILocation(line: 903, column: 24, scope: !3723)
!3743 = !DILocation(line: 903, column: 32, scope: !3723)
!3744 = !DILocation(line: 903, column: 39, scope: !3723)
!3745 = !DILocation(line: 903, column: 18, scope: !3723)
!3746 = !DILocation(line: 903, column: 20, scope: !3723)
!3747 = !DILocation(line: 905, column: 5, scope: !3723)
!3748 = !DILocation(line: 906, column: 44, scope: !3723)
!3749 = !DILocation(line: 906, column: 42, scope: !3723)
!3750 = !DILocation(line: 906, column: 55, scope: !3723)
!3751 = !DILocation(line: 906, column: 53, scope: !3723)
!3752 = !DILocation(line: 906, column: 5, scope: !3723)
!3753 = !DILocation(line: 907, column: 16, scope: !3723)
!3754 = !DILocation(line: 907, column: 13, scope: !3723)
!3755 = !DILocation(line: 913, column: 36, scope: !3723)
!3756 = !DILocation(line: 913, column: 40, scope: !3723)
!3757 = !DILocation(line: 913, column: 106, scope: !3723)
!3758 = !DILocation(line: 913, column: 95, scope: !3723)
!3759 = !DILocation(line: 913, column: 110, scope: !3723)
!3760 = !DILocation(line: 913, column: 80, scope: !3723)
!3761 = !DILocation(line: 913, column: 121, scope: !3723)
!3762 = !DILocation(line: 913, column: 14, scope: !3723)
!3763 = !DILocation(line: 913, column: 12, scope: !3723)
!3764 = !DILocation(line: 915, column: 10, scope: !3765)
!3765 = distinct !DILexicalBlock(scope: !3723, file: !24, line: 915, column: 10)
!3766 = !DILocation(line: 915, column: 17, scope: !3765)
!3767 = !DILocation(line: 916, column: 6, scope: !3768)
!3768 = distinct !DILexicalBlock(scope: !3765, file: !24, line: 915, column: 23)
!3769 = !DILocation(line: 917, column: 6, scope: !3768)
!3770 = !DILocation(line: 918, column: 13, scope: !3768)
!3771 = !DILocation(line: 918, column: 6, scope: !3768)
!3772 = !DILocation(line: 928, column: 20, scope: !3723)
!3773 = !DILocation(line: 928, column: 12, scope: !3723)
!3774 = !DILocation(line: 928, column: 9, scope: !3723)
!3775 = !DILocation(line: 930, column: 20, scope: !3776)
!3776 = distinct !DILexicalBlock(scope: !3723, file: !24, line: 930, column: 9)
!3777 = !DILocation(line: 930, column: 25, scope: !3776)
!3778 = !DILocation(line: 930, column: 9, scope: !3776)
!3779 = !DILocation(line: 930, column: 29, scope: !3776)
!3780 = !DILocation(line: 930, column: 35, scope: !3776)
!3781 = !DILocation(line: 930, column: 52, scope: !3776)
!3782 = !DILocation(line: 930, column: 55, scope: !3776)
!3783 = !DILocation(line: 930, column: 75, scope: !3776)
!3784 = !DILocation(line: 931, column: 19, scope: !3776)
!3785 = !DILocation(line: 931, column: 24, scope: !3776)
!3786 = !DILocation(line: 931, column: 28, scope: !3776)
!3787 = !DILocation(line: 931, column: 31, scope: !3776)
!3788 = !DILocation(line: 931, column: 6, scope: !3776)
!3789 = !DILocation(line: 931, column: 11, scope: !3776)
!3790 = !DILocation(line: 931, column: 16, scope: !3776)
!3791 = !DILocation(line: 935, column: 49, scope: !3723)
!3792 = !DILocation(line: 935, column: 54, scope: !3723)
!3793 = !DILocation(line: 935, column: 38, scope: !3723)
!3794 = !DILocation(line: 935, column: 58, scope: !3723)
!3795 = !DILocation(line: 935, column: 5, scope: !3723)
!3796 = !DILocation(line: 935, column: 10, scope: !3723)
!3797 = !DILocation(line: 935, column: 26, scope: !3723)
!3798 = !DILocation(line: 935, column: 36, scope: !3723)
!3799 = !DILocation(line: 936, column: 5, scope: !3723)
!3800 = !DILocation(line: 936, column: 10, scope: !3723)
!3801 = !DILocation(line: 936, column: 26, scope: !3723)
!3802 = !DILocation(line: 936, column: 39, scope: !3723)
!3803 = !DILocation(line: 940, column: 5, scope: !3723)
!3804 = !DILocation(line: 940, column: 10, scope: !3723)
!3805 = !DILocation(line: 940, column: 26, scope: !3723)
!3806 = !DILocation(line: 940, column: 35, scope: !3723)
!3807 = !DILocation(line: 942, column: 44, scope: !3723)
!3808 = !DILocation(line: 942, column: 49, scope: !3723)
!3809 = !DILocation(line: 942, column: 33, scope: !3723)
!3810 = !DILocation(line: 942, column: 53, scope: !3723)
!3811 = !DILocation(line: 942, column: 5, scope: !3723)
!3812 = !DILocation(line: 942, column: 10, scope: !3723)
!3813 = !DILocation(line: 942, column: 26, scope: !3723)
!3814 = !DILocation(line: 942, column: 31, scope: !3723)
!3815 = !DILocation(line: 943, column: 44, scope: !3723)
!3816 = !DILocation(line: 943, column: 49, scope: !3723)
!3817 = !DILocation(line: 943, column: 33, scope: !3723)
!3818 = !DILocation(line: 943, column: 53, scope: !3723)
!3819 = !DILocation(line: 943, column: 5, scope: !3723)
!3820 = !DILocation(line: 943, column: 10, scope: !3723)
!3821 = !DILocation(line: 943, column: 26, scope: !3723)
!3822 = !DILocation(line: 943, column: 31, scope: !3723)
!3823 = !DILocation(line: 945, column: 5, scope: !3723)
!3824 = !DILocation(line: 945, column: 10, scope: !3723)
!3825 = !DILocation(line: 945, column: 26, scope: !3723)
!3826 = !DILocation(line: 945, column: 32, scope: !3723)
!3827 = !DILocation(line: 947, column: 31, scope: !3723)
!3828 = !DILocation(line: 947, column: 36, scope: !3723)
!3829 = !DILocation(line: 947, column: 20, scope: !3723)
!3830 = !DILocation(line: 947, column: 40, scope: !3723)
!3831 = !DILocation(line: 947, column: 5, scope: !3723)
!3832 = !DILocation(line: 947, column: 10, scope: !3723)
!3833 = !DILocation(line: 947, column: 18, scope: !3723)
!3834 = !DILocation(line: 949, column: 5, scope: !3723)
!3835 = !DILocation(line: 949, column: 10, scope: !3723)
!3836 = !DILocation(line: 949, column: 24, scope: !3723)
!3837 = !DILocation(line: 949, column: 33, scope: !3723)
!3838 = !DILocation(line: 950, column: 19, scope: !3723)
!3839 = !DILocation(line: 950, column: 22, scope: !3723)
!3840 = !DILocation(line: 950, column: 5, scope: !3723)
!3841 = !DILocation(line: 950, column: 32, scope: !3723)
!3842 = !DILocation(line: 950, column: 54, scope: !3723)
!3843 = !DILocation(line: 951, column: 19, scope: !3723)
!3844 = !DILocation(line: 951, column: 22, scope: !3723)
!3845 = !DILocation(line: 951, column: 5, scope: !3723)
!3846 = !DILocation(line: 951, column: 32, scope: !3723)
!3847 = !DILocation(line: 951, column: 54, scope: !3723)
!3848 = !DILocation(line: 952, column: 5, scope: !3723)
!3849 = !DILocation(line: 952, column: 10, scope: !3723)
!3850 = !DILocation(line: 952, column: 24, scope: !3723)
!3851 = !DILocation(line: 952, column: 38, scope: !3723)
!3852 = !DILocation(line: 953, column: 5, scope: !3723)
!3853 = !DILocation(line: 953, column: 10, scope: !3723)
!3854 = !DILocation(line: 953, column: 24, scope: !3723)
!3855 = !DILocation(line: 953, column: 35, scope: !3723)
!3856 = !DILocation(line: 954, column: 5, scope: !3723)
!3857 = !DILocation(line: 954, column: 10, scope: !3723)
!3858 = !DILocation(line: 954, column: 24, scope: !3723)
!3859 = !DILocation(line: 954, column: 37, scope: !3723)
!3860 = !DILocation(line: 955, column: 4, scope: !3723)
!3861 = !DILocation(line: 887, column: 34, scope: !3718)
!3862 = !DILocation(line: 887, column: 4, scope: !3718)
!3863 = distinct !{!3863, !3721, !3864, !1996}
!3864 = !DILocation(line: 955, column: 4, scope: !3715)
!3865 = !DILocation(line: 958, column: 8, scope: !3866)
!3866 = distinct !DILexicalBlock(scope: !3556, file: !24, line: 958, column: 8)
!3867 = !DILocation(line: 958, column: 17, scope: !3866)
!3868 = !DILocation(line: 958, column: 25, scope: !3866)
!3869 = !DILocation(line: 958, column: 28, scope: !3866)
!3870 = !DILocation(line: 958, column: 48, scope: !3866)
!3871 = !DILocation(line: 959, column: 52, scope: !3866)
!3872 = !DILocation(line: 959, column: 62, scope: !3866)
!3873 = !DILocation(line: 959, column: 67, scope: !3866)
!3874 = !DILocation(line: 959, column: 5, scope: !3866)
!3875 = !DILocation(line: 961, column: 4, scope: !3556)
!3876 = !DILocation(line: 964, column: 60, scope: !3556)
!3877 = !DILocation(line: 964, column: 4, scope: !3556)
!3878 = !DILocation(line: 965, column: 2, scope: !3556)
!3879 = !DILocation(line: 967, column: 9, scope: !3525)
!3880 = !DILocation(line: 967, column: 2, scope: !3525)
!3881 = !DILocation(line: 968, column: 1, scope: !3525)
!3882 = distinct !DISubprogram(name: "object_create_egg", linkageName: "_Z17object_create_eggP6object", scope: !24, file: !24, line: 973, type: !3883, scopeLine: 974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!3883 = !DISubroutineType(types: !3884)
!3884 = !{!7, !1434}
!3885 = !DILocalVariable(name: "objp", arg: 1, scope: !3882, file: !24, line: 973, type: !1434)
!3886 = !DILocation(line: 973, column: 31, scope: !3882)
!3887 = !DILocalVariable(name: "rval", scope: !3882, file: !24, line: 975, type: !7)
!3888 = !DILocation(line: 975, column: 6, scope: !3882)
!3889 = !DILocation(line: 977, column: 8, scope: !3890)
!3890 = distinct !DILexicalBlock(scope: !3882, file: !24, line: 977, column: 6)
!3891 = !DILocation(line: 977, column: 18, scope: !3890)
!3892 = !DILocation(line: 977, column: 7, scope: !3890)
!3893 = !DILocation(line: 977, column: 6, scope: !3890)
!3894 = !DILocation(line: 977, column: 33, scope: !3890)
!3895 = !DILocation(line: 977, column: 39, scope: !3890)
!3896 = !DILocation(line: 977, column: 44, scope: !3890)
!3897 = !DILocation(line: 977, column: 32, scope: !3890)
!3898 = !DILocation(line: 977, column: 30, scope: !3890)
!3899 = !DILocation(line: 978, column: 7, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3890, file: !24, line: 978, column: 7)
!3901 = !DILocation(line: 978, column: 13, scope: !3900)
!3902 = !DILocation(line: 978, column: 27, scope: !3900)
!3903 = !DILocation(line: 979, column: 8, scope: !3904)
!3904 = distinct !DILexicalBlock(scope: !3900, file: !24, line: 979, column: 8)
!3905 = !DILocation(line: 979, column: 14, scope: !3904)
!3906 = !DILocation(line: 979, column: 26, scope: !3904)
!3907 = !DILocation(line: 980, column: 17, scope: !3908)
!3908 = distinct !DILexicalBlock(scope: !3909, file: !24, line: 980, column: 9)
!3909 = distinct !DILexicalBlock(scope: !3904, file: !24, line: 979, column: 47)
!3910 = !DILocation(line: 980, column: 9, scope: !3908)
!3911 = !DILocation(line: 980, column: 29, scope: !3908)
!3912 = !DILocation(line: 980, column: 40, scope: !3908)
!3913 = !DILocation(line: 980, column: 37, scope: !3908)
!3914 = !DILocation(line: 981, column: 10, scope: !3915)
!3915 = distinct !DILexicalBlock(scope: !3916, file: !24, line: 981, column: 10)
!3916 = distinct !DILexicalBlock(scope: !3908, file: !24, line: 980, column: 50)
!3917 = !DILocation(line: 981, column: 19, scope: !3915)
!3918 = !DILocation(line: 982, column: 7, scope: !3919)
!3919 = distinct !DILexicalBlock(scope: !3915, file: !24, line: 981, column: 28)
!3920 = !DILocation(line: 983, column: 7, scope: !3919)
!3921 = !DILocation(line: 985, column: 5, scope: !3916)
!3922 = !DILocation(line: 985, column: 25, scope: !3923)
!3923 = distinct !DILexicalBlock(scope: !3908, file: !24, line: 985, column: 17)
!3924 = !DILocation(line: 985, column: 17, scope: !3923)
!3925 = !DILocation(line: 985, column: 37, scope: !3923)
!3926 = !DILocation(line: 985, column: 48, scope: !3923)
!3927 = !DILocation(line: 985, column: 45, scope: !3923)
!3928 = !DILocation(line: 986, column: 10, scope: !3929)
!3929 = distinct !DILexicalBlock(scope: !3930, file: !24, line: 986, column: 10)
!3930 = distinct !DILexicalBlock(scope: !3923, file: !24, line: 985, column: 58)
!3931 = !DILocation(line: 986, column: 19, scope: !3929)
!3932 = !DILocation(line: 987, column: 7, scope: !3933)
!3933 = distinct !DILexicalBlock(scope: !3929, file: !24, line: 986, column: 27)
!3934 = !DILocation(line: 988, column: 7, scope: !3933)
!3935 = !DILocation(line: 990, column: 5, scope: !3930)
!3936 = !DILocation(line: 991, column: 4, scope: !3909)
!3937 = !DILocation(line: 991, column: 15, scope: !3938)
!3938 = distinct !DILexicalBlock(scope: !3904, file: !24, line: 991, column: 15)
!3939 = !DILocation(line: 991, column: 21, scope: !3938)
!3940 = !DILocation(line: 991, column: 33, scope: !3938)
!3941 = !DILocation(line: 992, column: 17, scope: !3942)
!3942 = distinct !DILexicalBlock(scope: !3943, file: !24, line: 992, column: 9)
!3943 = distinct !DILexicalBlock(scope: !3938, file: !24, line: 991, column: 48)
!3944 = !DILocation(line: 992, column: 9, scope: !3942)
!3945 = !DILocation(line: 992, column: 29, scope: !3942)
!3946 = !DILocation(line: 992, column: 39, scope: !3942)
!3947 = !DILocation(line: 992, column: 36, scope: !3942)
!3948 = !DILocation(line: 993, column: 10, scope: !3949)
!3949 = distinct !DILexicalBlock(scope: !3950, file: !24, line: 993, column: 10)
!3950 = distinct !DILexicalBlock(scope: !3942, file: !24, line: 992, column: 49)
!3951 = !DILocation(line: 993, column: 19, scope: !3949)
!3952 = !DILocation(line: 994, column: 7, scope: !3953)
!3953 = distinct !DILexicalBlock(scope: !3949, file: !24, line: 993, column: 28)
!3954 = !DILocation(line: 995, column: 7, scope: !3953)
!3955 = !DILocation(line: 997, column: 5, scope: !3950)
!3956 = !DILocation(line: 997, column: 25, scope: !3957)
!3957 = distinct !DILexicalBlock(scope: !3942, file: !24, line: 997, column: 17)
!3958 = !DILocation(line: 997, column: 17, scope: !3957)
!3959 = !DILocation(line: 997, column: 37, scope: !3957)
!3960 = !DILocation(line: 997, column: 47, scope: !3957)
!3961 = !DILocation(line: 997, column: 44, scope: !3957)
!3962 = !DILocation(line: 998, column: 10, scope: !3963)
!3963 = distinct !DILexicalBlock(scope: !3964, file: !24, line: 998, column: 10)
!3964 = distinct !DILexicalBlock(scope: !3957, file: !24, line: 997, column: 57)
!3965 = !DILocation(line: 998, column: 19, scope: !3963)
!3966 = !DILocation(line: 999, column: 7, scope: !3967)
!3967 = distinct !DILexicalBlock(scope: !3963, file: !24, line: 998, column: 27)
!3968 = !DILocation(line: 1000, column: 7, scope: !3967)
!3969 = !DILocation(line: 1002, column: 5, scope: !3964)
!3970 = !DILocation(line: 1003, column: 4, scope: !3943)
!3971 = !DILocation(line: 979, column: 29, scope: !3904)
!3972 = !DILocation(line: 978, column: 30, scope: !3900)
!3973 = !DILocation(line: 1005, column: 22, scope: !3882)
!3974 = !DILocation(line: 1005, column: 28, scope: !3882)
!3975 = !DILocation(line: 1005, column: 43, scope: !3882)
!3976 = !DILocation(line: 1005, column: 49, scope: !3882)
!3977 = !DILocation(line: 1005, column: 62, scope: !3882)
!3978 = !DILocation(line: 1005, column: 68, scope: !3882)
!3979 = !DILocation(line: 1005, column: 85, scope: !3882)
!3980 = !DILocation(line: 1005, column: 91, scope: !3882)
!3981 = !DILocation(line: 1005, column: 107, scope: !3882)
!3982 = !DILocation(line: 1005, column: 118, scope: !3882)
!3983 = !DILocation(line: 1005, column: 124, scope: !3882)
!3984 = !DILocation(line: 1005, column: 129, scope: !3882)
!3985 = !DILocation(line: 1005, column: 135, scope: !3882)
!3986 = !DILocation(line: 1005, column: 9, scope: !3882)
!3987 = !DILocation(line: 1005, column: 7, scope: !3882)
!3988 = !DILocation(line: 1007, column: 6, scope: !3989)
!3989 = distinct !DILexicalBlock(scope: !3882, file: !24, line: 1007, column: 6)
!3990 = !DILocation(line: 1007, column: 11, scope: !3989)
!3991 = !DILocation(line: 1009, column: 8, scope: !3992)
!3992 = distinct !DILexicalBlock(scope: !3993, file: !24, line: 1009, column: 7)
!3993 = distinct !DILexicalBlock(scope: !3989, file: !24, line: 1008, column: 5)
!3994 = !DILocation(line: 1009, column: 14, scope: !3992)
!3995 = !DILocation(line: 1009, column: 19, scope: !3992)
!3996 = !DILocation(line: 1009, column: 34, scope: !3992)
!3997 = !DILocation(line: 1009, column: 38, scope: !3992)
!3998 = !DILocation(line: 1009, column: 44, scope: !3992)
!3999 = !DILocation(line: 1009, column: 50, scope: !3992)
!4000 = !DILocation(line: 1009, column: 47, scope: !3992)
!4001 = !DILocation(line: 1010, column: 12, scope: !3992)
!4002 = !DILocation(line: 1010, column: 4, scope: !3992)
!4003 = !DILocation(line: 1010, column: 18, scope: !3992)
!4004 = !DILocation(line: 1010, column: 24, scope: !3992)
!4005 = !DILocation(line: 1012, column: 9, scope: !4006)
!4006 = distinct !DILexicalBlock(scope: !3993, file: !24, line: 1012, column: 9)
!4007 = !DILocation(line: 1012, column: 15, scope: !4006)
!4008 = !DILocation(line: 1012, column: 20, scope: !4006)
!4009 = !DILocation(line: 1012, column: 33, scope: !4006)
!4010 = !DILocation(line: 1012, column: 36, scope: !4006)
!4011 = !DILocation(line: 1012, column: 42, scope: !4006)
!4012 = !DILocation(line: 1012, column: 55, scope: !4006)
!4013 = !DILocation(line: 1013, column: 8, scope: !4014)
!4014 = distinct !DILexicalBlock(scope: !4006, file: !24, line: 1013, column: 8)
!4015 = !DILocation(line: 1013, column: 14, scope: !4014)
!4016 = !DILocation(line: 1013, column: 25, scope: !4014)
!4017 = !DILocation(line: 1013, column: 45, scope: !4014)
!4018 = !DILocation(line: 1013, column: 48, scope: !4014)
!4019 = !DILocation(line: 1013, column: 54, scope: !4014)
!4020 = !DILocation(line: 1013, column: 65, scope: !4014)
!4021 = !DILocation(line: 1014, column: 13, scope: !4014)
!4022 = !DILocation(line: 1014, column: 5, scope: !4014)
!4023 = !DILocation(line: 1014, column: 19, scope: !4014)
!4024 = !DILocation(line: 1014, column: 38, scope: !4014)
!4025 = !DILocation(line: 1014, column: 44, scope: !4014)
!4026 = !DILocation(line: 1015, column: 13, scope: !4027)
!4027 = distinct !DILexicalBlock(scope: !4014, file: !24, line: 1015, column: 13)
!4028 = !DILocation(line: 1015, column: 19, scope: !4027)
!4029 = !DILocation(line: 1015, column: 30, scope: !4027)
!4030 = !DILocation(line: 1016, column: 13, scope: !4027)
!4031 = !DILocation(line: 1016, column: 5, scope: !4027)
!4032 = !DILocation(line: 1016, column: 19, scope: !4027)
!4033 = !DILocation(line: 1016, column: 38, scope: !4027)
!4034 = !DILocation(line: 1016, column: 44, scope: !4027)
!4035 = !DILocation(line: 1013, column: 67, scope: !4014)
!4036 = !DILocation(line: 1017, column: 3, scope: !3993)
!4037 = !DILocation(line: 1019, column: 9, scope: !3882)
!4038 = !DILocation(line: 1019, column: 2, scope: !3882)
!4039 = !DILocation(line: 1020, column: 1, scope: !3882)
!4040 = distinct !DISubprogram(name: "call_object_create_egg", linkageName: "_Z22call_object_create_eggP6objectiii", scope: !24, file: !24, line: 1027, type: !4041, scopeLine: 1028, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4041 = !DISubroutineType(types: !4042)
!4042 = !{!7, !1434, !7, !7, !7}
!4043 = !DILocalVariable(name: "objp", arg: 1, scope: !4040, file: !24, line: 1027, type: !1434)
!4044 = !DILocation(line: 1027, column: 36, scope: !4040)
!4045 = !DILocalVariable(name: "count", arg: 2, scope: !4040, file: !24, line: 1027, type: !7)
!4046 = !DILocation(line: 1027, column: 46, scope: !4040)
!4047 = !DILocalVariable(name: "type", arg: 3, scope: !4040, file: !24, line: 1027, type: !7)
!4048 = !DILocation(line: 1027, column: 57, scope: !4040)
!4049 = !DILocalVariable(name: "id", arg: 4, scope: !4040, file: !24, line: 1027, type: !7)
!4050 = !DILocation(line: 1027, column: 67, scope: !4040)
!4051 = !DILocation(line: 1035, column: 6, scope: !4052)
!4052 = distinct !DILexicalBlock(scope: !4040, file: !24, line: 1035, column: 6)
!4053 = !DILocation(line: 1035, column: 12, scope: !4052)
!4054 = !DILocation(line: 1036, column: 26, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4052, file: !24, line: 1035, column: 17)
!4056 = !DILocation(line: 1036, column: 3, scope: !4055)
!4057 = !DILocation(line: 1036, column: 9, scope: !4055)
!4058 = !DILocation(line: 1036, column: 24, scope: !4055)
!4059 = !DILocation(line: 1037, column: 25, scope: !4055)
!4060 = !DILocation(line: 1037, column: 3, scope: !4055)
!4061 = !DILocation(line: 1037, column: 9, scope: !4055)
!4062 = !DILocation(line: 1037, column: 23, scope: !4055)
!4063 = !DILocation(line: 1038, column: 23, scope: !4055)
!4064 = !DILocation(line: 1038, column: 3, scope: !4055)
!4065 = !DILocation(line: 1038, column: 9, scope: !4055)
!4066 = !DILocation(line: 1038, column: 21, scope: !4055)
!4067 = !DILocation(line: 1039, column: 28, scope: !4055)
!4068 = !DILocation(line: 1039, column: 10, scope: !4055)
!4069 = !DILocation(line: 1039, column: 3, scope: !4055)
!4070 = !DILocation(line: 1042, column: 2, scope: !4040)
!4071 = !DILocation(line: 1043, column: 1, scope: !4040)
!4072 = distinct !DISubprogram(name: "explode_model", linkageName: "_Z13explode_modelP6object", scope: !24, file: !24, line: 1071, type: !2696, scopeLine: 1072, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4073 = !DILocalVariable(name: "obj", arg: 1, scope: !4072, file: !24, line: 1071, type: !1434)
!4074 = !DILocation(line: 1071, column: 28, scope: !4072)
!4075 = !DILocation(line: 1073, column: 2, scope: !4072)
!4076 = !DILocation(line: 1075, column: 22, scope: !4077)
!4077 = distinct !DILexicalBlock(scope: !4072, file: !24, line: 1075, column: 6)
!4078 = !DILocation(line: 1075, column: 27, scope: !4077)
!4079 = !DILocation(line: 1075, column: 43, scope: !4077)
!4080 = !DILocation(line: 1075, column: 6, scope: !4077)
!4081 = !DILocation(line: 1075, column: 54, scope: !4077)
!4082 = !DILocation(line: 1076, column: 52, scope: !4077)
!4083 = !DILocation(line: 1076, column: 57, scope: !4077)
!4084 = !DILocation(line: 1076, column: 73, scope: !4077)
!4085 = !DILocation(line: 1076, column: 36, scope: !4077)
!4086 = !DILocation(line: 1076, column: 3, scope: !4077)
!4087 = !DILocation(line: 1076, column: 8, scope: !4077)
!4088 = !DILocation(line: 1076, column: 24, scope: !4077)
!4089 = !DILocation(line: 1076, column: 34, scope: !4077)
!4090 = !DILocation(line: 1078, column: 21, scope: !4091)
!4091 = distinct !DILexicalBlock(scope: !4072, file: !24, line: 1078, column: 6)
!4092 = !DILocation(line: 1078, column: 26, scope: !4091)
!4093 = !DILocation(line: 1078, column: 42, scope: !4091)
!4094 = !DILocation(line: 1078, column: 6, scope: !4091)
!4095 = !DILocation(line: 1078, column: 53, scope: !4091)
!4096 = !DILocation(line: 1078, column: 62, scope: !4091)
!4097 = !DILocalVariable(name: "i", scope: !4098, file: !24, line: 1079, type: !7)
!4098 = distinct !DILexicalBlock(scope: !4091, file: !24, line: 1078, column: 67)
!4099 = !DILocation(line: 1079, column: 7, scope: !4098)
!4100 = !DILocation(line: 1081, column: 9, scope: !4101)
!4101 = distinct !DILexicalBlock(scope: !4098, file: !24, line: 1081, column: 3)
!4102 = !DILocation(line: 1081, column: 8, scope: !4101)
!4103 = !DILocation(line: 1081, column: 12, scope: !4104)
!4104 = distinct !DILexicalBlock(scope: !4101, file: !24, line: 1081, column: 3)
!4105 = !DILocation(line: 1081, column: 29, scope: !4104)
!4106 = !DILocation(line: 1081, column: 34, scope: !4104)
!4107 = !DILocation(line: 1081, column: 50, scope: !4104)
!4108 = !DILocation(line: 1081, column: 14, scope: !4104)
!4109 = !DILocation(line: 1081, column: 61, scope: !4104)
!4110 = !DILocation(line: 1081, column: 13, scope: !4104)
!4111 = !DILocation(line: 1081, column: 3, scope: !4101)
!4112 = !DILocation(line: 1082, column: 10, scope: !4113)
!4113 = distinct !DILexicalBlock(scope: !4104, file: !24, line: 1082, column: 8)
!4114 = !DILocation(line: 1082, column: 15, scope: !4113)
!4115 = !DILocation(line: 1082, column: 20, scope: !4113)
!4116 = !DILocation(line: 1082, column: 33, scope: !4113)
!4117 = !DILocation(line: 1082, column: 36, scope: !4113)
!4118 = !DILocation(line: 1082, column: 41, scope: !4113)
!4119 = !DILocation(line: 1082, column: 44, scope: !4113)
!4120 = !DILocation(line: 1082, column: 50, scope: !4113)
!4121 = !DILocation(line: 1082, column: 53, scope: !4113)
!4122 = !DILocation(line: 1082, column: 55, scope: !4113)
!4123 = !DILocation(line: 1082, column: 8, scope: !4113)
!4124 = !DILocation(line: 1083, column: 26, scope: !4113)
!4125 = !DILocation(line: 1083, column: 30, scope: !4113)
!4126 = !DILocation(line: 1083, column: 5, scope: !4113)
!4127 = !DILocation(line: 1082, column: 59, scope: !4113)
!4128 = !DILocation(line: 1081, column: 71, scope: !4104)
!4129 = !DILocation(line: 1081, column: 3, scope: !4104)
!4130 = distinct !{!4130, !4111, !4131, !1996}
!4131 = !DILocation(line: 1083, column: 31, scope: !4101)
!4132 = !DILocation(line: 1086, column: 3, scope: !4098)
!4133 = !DILocation(line: 1086, column: 8, scope: !4098)
!4134 = !DILocation(line: 1086, column: 24, scope: !4098)
!4135 = !DILocation(line: 1086, column: 36, scope: !4098)
!4136 = !DILocation(line: 1087, column: 2, scope: !4098)
!4137 = !DILocation(line: 1088, column: 1, scope: !4072)
!4138 = distinct !DISubprogram(name: "maybe_delete_object", linkageName: "_Z19maybe_delete_objectP6object", scope: !24, file: !24, line: 1091, type: !2696, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4139 = !DILocalVariable(name: "del_obj", arg: 1, scope: !4138, file: !24, line: 1091, type: !1434)
!4140 = !DILocation(line: 1091, column: 34, scope: !4138)
!4141 = !DILocation(line: 1093, column: 21, scope: !4142)
!4142 = distinct !DILexicalBlock(scope: !4138, file: !24, line: 1093, column: 6)
!4143 = !DILocation(line: 1093, column: 30, scope: !4142)
!4144 = !DILocation(line: 1093, column: 46, scope: !4142)
!4145 = !DILocation(line: 1093, column: 6, scope: !4142)
!4146 = !DILocation(line: 1093, column: 57, scope: !4142)
!4147 = !DILocation(line: 1094, column: 55, scope: !4148)
!4148 = distinct !DILexicalBlock(scope: !4142, file: !24, line: 1093, column: 64)
!4149 = !DILocation(line: 1094, column: 64, scope: !4148)
!4150 = !DILocation(line: 1094, column: 80, scope: !4148)
!4151 = !DILocation(line: 1094, column: 40, scope: !4148)
!4152 = !DILocation(line: 1094, column: 3, scope: !4148)
!4153 = !DILocation(line: 1094, column: 12, scope: !4148)
!4154 = !DILocation(line: 1094, column: 28, scope: !4148)
!4155 = !DILocation(line: 1094, column: 38, scope: !4148)
!4156 = !DILocation(line: 1095, column: 3, scope: !4148)
!4157 = !DILocation(line: 1095, column: 12, scope: !4148)
!4158 = !DILocation(line: 1095, column: 18, scope: !4148)
!4159 = !DILocation(line: 1096, column: 2, scope: !4148)
!4160 = !DILocation(line: 1098, column: 7, scope: !4161)
!4161 = distinct !DILexicalBlock(scope: !4162, file: !24, line: 1098, column: 7)
!4162 = distinct !DILexicalBlock(scope: !4142, file: !24, line: 1097, column: 7)
!4163 = !DILocation(line: 1098, column: 16, scope: !4161)
!4164 = !DILocation(line: 1098, column: 21, scope: !4161)
!4165 = !DILocation(line: 1099, column: 4, scope: !4161)
!4166 = !DILocation(line: 1099, column: 13, scope: !4161)
!4167 = !DILocation(line: 1099, column: 25, scope: !4161)
!4168 = !DILocation(line: 1101, column: 4, scope: !4161)
!4169 = !DILocation(line: 1101, column: 13, scope: !4161)
!4170 = !DILocation(line: 1101, column: 19, scope: !4161)
!4171 = !DILocation(line: 1103, column: 1, scope: !4138)
!4172 = distinct !DISubprogram(name: "explode_object", linkageName: "_Z14explode_objectP6objecti", scope: !24, file: !24, line: 1107, type: !4173, scopeLine: 1108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4173 = !DISubroutineType(types: !4174)
!4174 = !{null, !1434, !14}
!4175 = !DILocalVariable(name: "hitobj", arg: 1, scope: !4172, file: !24, line: 1107, type: !1434)
!4176 = !DILocation(line: 1107, column: 29, scope: !4172)
!4177 = !DILocalVariable(name: "delay_time", arg: 2, scope: !4172, file: !24, line: 1107, type: !14)
!4178 = !DILocation(line: 1107, column: 40, scope: !4172)
!4179 = !DILocation(line: 1109, column: 6, scope: !4180)
!4180 = distinct !DILexicalBlock(scope: !4172, file: !24, line: 1109, column: 6)
!4181 = !DILocation(line: 1109, column: 14, scope: !4180)
!4182 = !DILocation(line: 1109, column: 20, scope: !4180)
!4183 = !DILocation(line: 1109, column: 36, scope: !4180)
!4184 = !DILocation(line: 1111, column: 6, scope: !4185)
!4185 = distinct !DILexicalBlock(scope: !4172, file: !24, line: 1111, column: 6)
!4186 = !DILocalVariable(name: "objnum", scope: !4187, file: !24, line: 1112, type: !7)
!4187 = distinct !DILexicalBlock(scope: !4185, file: !24, line: 1111, column: 18)
!4188 = !DILocation(line: 1112, column: 7, scope: !4187)
!4189 = !DILocalVariable(name: "obj", scope: !4187, file: !24, line: 1113, type: !1434)
!4190 = !DILocation(line: 1113, column: 11, scope: !4187)
!4191 = !DILocation(line: 1117, column: 40, scope: !4187)
!4192 = !DILocation(line: 1117, column: 48, scope: !4187)
!4193 = !DILocation(line: 1117, column: 56, scope: !4187)
!4194 = !DILocation(line: 1117, column: 64, scope: !4187)
!4195 = !DILocation(line: 1117, column: 12, scope: !4187)
!4196 = !DILocation(line: 1117, column: 10, scope: !4187)
!4197 = !DILocation(line: 1120, column: 7, scope: !4198)
!4198 = distinct !DILexicalBlock(scope: !4187, file: !24, line: 1120, column: 7)
!4199 = !DILocation(line: 1120, column: 14, scope: !4198)
!4200 = !DILocation(line: 1121, column: 24, scope: !4201)
!4201 = distinct !DILexicalBlock(scope: !4198, file: !24, line: 1120, column: 20)
!4202 = !DILocation(line: 1121, column: 4, scope: !4201)
!4203 = !DILocation(line: 1122, column: 4, scope: !4201)
!4204 = !DILocation(line: 1123, column: 4, scope: !4201)
!4205 = !DILocation(line: 1124, column: 4, scope: !4201)
!4206 = !DILocation(line: 1127, column: 18, scope: !4187)
!4207 = !DILocation(line: 1127, column: 10, scope: !4187)
!4208 = !DILocation(line: 1127, column: 7, scope: !4187)
!4209 = !DILocation(line: 1131, column: 19, scope: !4187)
!4210 = !DILocation(line: 1131, column: 3, scope: !4187)
!4211 = !DILocation(line: 1131, column: 8, scope: !4187)
!4212 = !DILocation(line: 1131, column: 17, scope: !4187)
!4213 = !DILocation(line: 1132, column: 40, scope: !4187)
!4214 = !DILocation(line: 1132, column: 46, scope: !4187)
!4215 = !DILocation(line: 1132, column: 3, scope: !4187)
!4216 = !DILocation(line: 1132, column: 8, scope: !4187)
!4217 = !DILocation(line: 1132, column: 24, scope: !4187)
!4218 = !DILocation(line: 1132, column: 38, scope: !4187)
!4219 = !DILocation(line: 1134, column: 7, scope: !4220)
!4220 = distinct !DILexicalBlock(scope: !4187, file: !24, line: 1134, column: 7)
!4221 = !DILocation(line: 1134, column: 12, scope: !4220)
!4222 = !DILocation(line: 1134, column: 28, scope: !4220)
!4223 = !DILocation(line: 1134, column: 42, scope: !4220)
!4224 = !DILocation(line: 1135, column: 4, scope: !4220)
!4225 = !DILocation(line: 1137, column: 3, scope: !4187)
!4226 = !DILocation(line: 1137, column: 8, scope: !4187)
!4227 = !DILocation(line: 1137, column: 24, scope: !4187)
!4228 = !DILocation(line: 1137, column: 36, scope: !4187)
!4229 = !DILocation(line: 1138, column: 3, scope: !4187)
!4230 = !DILocation(line: 1138, column: 8, scope: !4187)
!4231 = !DILocation(line: 1138, column: 24, scope: !4187)
!4232 = !DILocation(line: 1138, column: 35, scope: !4187)
!4233 = !DILocation(line: 1140, column: 2, scope: !4187)
!4234 = !DILocalVariable(name: "expl_obj", scope: !4235, file: !24, line: 1142, type: !1434)
!4235 = distinct !DILexicalBlock(scope: !4185, file: !24, line: 1141, column: 7)
!4236 = !DILocation(line: 1142, column: 11, scope: !4235)
!4237 = !DILocalVariable(name: "vclip_num", scope: !4235, file: !24, line: 1143, type: !7)
!4238 = !DILocation(line: 1143, column: 7, scope: !4235)
!4239 = !DILocation(line: 1145, column: 35, scope: !4235)
!4240 = !DILocation(line: 1145, column: 15, scope: !4235)
!4241 = !DILocation(line: 1145, column: 13, scope: !4235)
!4242 = !DILocation(line: 1147, column: 38, scope: !4235)
!4243 = !DILocation(line: 1147, column: 46, scope: !4235)
!4244 = !DILocation(line: 1147, column: 55, scope: !4235)
!4245 = !DILocation(line: 1147, column: 63, scope: !4235)
!4246 = !DILocation(line: 1147, column: 75, scope: !4235)
!4247 = !DILocation(line: 1147, column: 83, scope: !4235)
!4248 = !DILocation(line: 1147, column: 68, scope: !4235)
!4249 = !DILocation(line: 1147, column: 106, scope: !4235)
!4250 = !DILocation(line: 1147, column: 14, scope: !4235)
!4251 = !DILocation(line: 1147, column: 12, scope: !4235)
!4252 = !DILocation(line: 1149, column: 9, scope: !4253)
!4253 = distinct !DILexicalBlock(scope: !4235, file: !24, line: 1149, column: 7)
!4254 = !DILocation(line: 1149, column: 7, scope: !4253)
!4255 = !DILocation(line: 1150, column: 24, scope: !4256)
!4256 = distinct !DILexicalBlock(scope: !4253, file: !24, line: 1149, column: 19)
!4257 = !DILocation(line: 1150, column: 4, scope: !4256)
!4258 = !DILocation(line: 1151, column: 4, scope: !4256)
!4259 = !DILocation(line: 1152, column: 4, scope: !4256)
!4260 = !DILocation(line: 1158, column: 7, scope: !4261)
!4261 = distinct !DILexicalBlock(scope: !4235, file: !24, line: 1158, column: 7)
!4262 = !DILocation(line: 1158, column: 15, scope: !4261)
!4263 = !DILocation(line: 1158, column: 19, scope: !4261)
!4264 = !DILocation(line: 1158, column: 32, scope: !4261)
!4265 = !DILocation(line: 1158, column: 35, scope: !4261)
!4266 = !DILocation(line: 1158, column: 43, scope: !4261)
!4267 = !DILocation(line: 1158, column: 56, scope: !4261)
!4268 = !DILocation(line: 1159, column: 4, scope: !4269)
!4269 = distinct !DILexicalBlock(scope: !4261, file: !24, line: 1158, column: 70)
!4270 = !DILocation(line: 1159, column: 14, scope: !4269)
!4271 = !DILocation(line: 1159, column: 28, scope: !4269)
!4272 = !DILocation(line: 1160, column: 32, scope: !4269)
!4273 = !DILocation(line: 1160, column: 40, scope: !4269)
!4274 = !DILocation(line: 1160, column: 4, scope: !4269)
!4275 = !DILocation(line: 1160, column: 14, scope: !4269)
!4276 = !DILocation(line: 1160, column: 30, scope: !4269)
!4277 = !DILocation(line: 1161, column: 3, scope: !4269)
!4278 = !DILocation(line: 1163, column: 7, scope: !4279)
!4279 = distinct !DILexicalBlock(scope: !4235, file: !24, line: 1163, column: 7)
!4280 = !DILocation(line: 1163, column: 15, scope: !4279)
!4281 = !DILocation(line: 1163, column: 26, scope: !4279)
!4282 = !DILocation(line: 1163, column: 39, scope: !4279)
!4283 = !DILocation(line: 1163, column: 42, scope: !4279)
!4284 = !DILocation(line: 1163, column: 50, scope: !4279)
!4285 = !DILocation(line: 1163, column: 54, scope: !4279)
!4286 = !DILocation(line: 1164, column: 18, scope: !4279)
!4287 = !DILocation(line: 1164, column: 4, scope: !4279)
!4288 = !DILocation(line: 1166, column: 23, scope: !4235)
!4289 = !DILocation(line: 1166, column: 3, scope: !4235)
!4290 = !DILocation(line: 1169, column: 2, scope: !4172)
!4291 = !DILocation(line: 1169, column: 10, scope: !4172)
!4292 = !DILocation(line: 1169, column: 16, scope: !4172)
!4293 = !DILocation(line: 1170, column: 2, scope: !4172)
!4294 = !DILocation(line: 1170, column: 10, scope: !4172)
!4295 = !DILocation(line: 1170, column: 23, scope: !4172)
!4296 = !DILocation(line: 1172, column: 1, scope: !4172)
!4297 = distinct !DISubprogram(name: "do_debris_frame", linkageName: "_Z15do_debris_frameP6object", scope: !24, file: !24, line: 1176, type: !2696, scopeLine: 1177, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4298 = !DILocalVariable(name: "obj", arg: 1, scope: !4297, file: !24, line: 1176, type: !1434)
!4299 = !DILocation(line: 1176, column: 30, scope: !4297)
!4300 = !DILocation(line: 1178, column: 2, scope: !4297)
!4301 = !DILocation(line: 1180, column: 6, scope: !4302)
!4302 = distinct !DILexicalBlock(scope: !4297, file: !24, line: 1180, column: 6)
!4303 = !DILocation(line: 1180, column: 11, scope: !4302)
!4304 = !DILocation(line: 1180, column: 20, scope: !4302)
!4305 = !DILocation(line: 1181, column: 18, scope: !4302)
!4306 = !DILocation(line: 1181, column: 3, scope: !4302)
!4307 = !DILocation(line: 1183, column: 1, scope: !4297)
!4308 = distinct !DISubprogram(name: "do_explosion_sequence", linkageName: "_Z21do_explosion_sequenceP6object", scope: !24, file: !24, line: 1188, type: !2696, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4309 = !DILocalVariable(name: "obj", arg: 1, scope: !4308, file: !24, line: 1188, type: !1434)
!4310 = !DILocation(line: 1188, column: 36, scope: !4308)
!4311 = !DILocation(line: 1190, column: 2, scope: !4308)
!4312 = !DILocation(line: 1195, column: 6, scope: !4313)
!4313 = distinct !DILexicalBlock(scope: !4308, file: !24, line: 1195, column: 6)
!4314 = !DILocation(line: 1195, column: 11, scope: !4313)
!4315 = !DILocation(line: 1195, column: 20, scope: !4313)
!4316 = !DILocation(line: 1196, column: 3, scope: !4317)
!4317 = distinct !DILexicalBlock(scope: !4313, file: !24, line: 1195, column: 28)
!4318 = !DILocation(line: 1196, column: 8, scope: !4317)
!4319 = !DILocation(line: 1196, column: 14, scope: !4317)
!4320 = !DILocation(line: 1197, column: 3, scope: !4317)
!4321 = !DILocation(line: 1197, column: 8, scope: !4317)
!4322 = !DILocation(line: 1197, column: 17, scope: !4317)
!4323 = !DILocation(line: 1198, column: 2, scope: !4317)
!4324 = !DILocation(line: 1201, column: 6, scope: !4325)
!4325 = distinct !DILexicalBlock(scope: !4308, file: !24, line: 1201, column: 6)
!4326 = !DILocation(line: 1201, column: 11, scope: !4325)
!4327 = !DILocation(line: 1201, column: 23, scope: !4325)
!4328 = !DILocation(line: 1201, column: 28, scope: !4325)
!4329 = !DILocation(line: 1201, column: 44, scope: !4325)
!4330 = !DILocation(line: 1201, column: 20, scope: !4325)
!4331 = !DILocalVariable(name: "expl_obj", scope: !4332, file: !24, line: 1202, type: !1434)
!4332 = distinct !DILexicalBlock(scope: !4325, file: !24, line: 1201, column: 56)
!4333 = !DILocation(line: 1202, column: 11, scope: !4332)
!4334 = !DILocalVariable(name: "del_obj", scope: !4332, file: !24, line: 1202, type: !1434)
!4335 = !DILocation(line: 1202, column: 21, scope: !4332)
!4336 = !DILocalVariable(name: "vclip_num", scope: !4332, file: !24, line: 1203, type: !7)
!4337 = !DILocation(line: 1203, column: 7, scope: !4332)
!4338 = !DILocalVariable(name: "spawn_pos", scope: !4332, file: !24, line: 1204, type: !1571)
!4339 = !DILocation(line: 1204, column: 15, scope: !4332)
!4340 = !DILocation(line: 1206, column: 8, scope: !4341)
!4341 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1206, column: 7)
!4342 = !DILocation(line: 1206, column: 13, scope: !4341)
!4343 = !DILocation(line: 1206, column: 29, scope: !4341)
!4344 = !DILocation(line: 1206, column: 43, scope: !4341)
!4345 = !DILocation(line: 1206, column: 48, scope: !4341)
!4346 = !DILocation(line: 1206, column: 52, scope: !4341)
!4347 = !DILocation(line: 1206, column: 57, scope: !4341)
!4348 = !DILocation(line: 1206, column: 73, scope: !4341)
!4349 = !DILocation(line: 1206, column: 89, scope: !4341)
!4350 = !DILocation(line: 1206, column: 87, scope: !4341)
!4351 = !DILocation(line: 1207, column: 4, scope: !4352)
!4352 = distinct !DILexicalBlock(scope: !4341, file: !24, line: 1206, column: 112)
!4353 = !DILocation(line: 1208, column: 4, scope: !4352)
!4354 = !DILocation(line: 1209, column: 4, scope: !4352)
!4355 = !DILocation(line: 1212, column: 22, scope: !4332)
!4356 = !DILocation(line: 1212, column: 27, scope: !4332)
!4357 = !DILocation(line: 1212, column: 43, scope: !4332)
!4358 = !DILocation(line: 1212, column: 14, scope: !4332)
!4359 = !DILocation(line: 1212, column: 11, scope: !4332)
!4360 = !DILocation(line: 1214, column: 16, scope: !4332)
!4361 = !DILocation(line: 1214, column: 25, scope: !4332)
!4362 = !DILocation(line: 1214, column: 13, scope: !4332)
!4363 = !DILocation(line: 1216, column: 10, scope: !4364)
!4364 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1216, column: 7)
!4365 = !DILocation(line: 1216, column: 19, scope: !4364)
!4366 = !DILocation(line: 1216, column: 23, scope: !4364)
!4367 = !DILocation(line: 1216, column: 35, scope: !4364)
!4368 = !DILocation(line: 1216, column: 38, scope: !4364)
!4369 = !DILocation(line: 1216, column: 47, scope: !4364)
!4370 = !DILocation(line: 1216, column: 51, scope: !4364)
!4371 = !DILocation(line: 1216, column: 65, scope: !4364)
!4372 = !DILocation(line: 1216, column: 68, scope: !4364)
!4373 = !DILocation(line: 1216, column: 77, scope: !4364)
!4374 = !DILocation(line: 1216, column: 81, scope: !4364)
!4375 = !DILocation(line: 1216, column: 96, scope: !4364)
!4376 = !DILocation(line: 1216, column: 99, scope: !4364)
!4377 = !DILocation(line: 1216, column: 108, scope: !4364)
!4378 = !DILocation(line: 1216, column: 113, scope: !4364)
!4379 = !DILocation(line: 1216, column: 128, scope: !4364)
!4380 = !DILocation(line: 1216, column: 132, scope: !4364)
!4381 = !DILocation(line: 1216, column: 141, scope: !4364)
!4382 = !DILocation(line: 1216, column: 148, scope: !4364)
!4383 = !DILocation(line: 1216, column: 7, scope: !4364)
!4384 = !DILocation(line: 1217, column: 4, scope: !4385)
!4385 = distinct !DILexicalBlock(scope: !4364, file: !24, line: 1216, column: 157)
!4386 = !DILocation(line: 1218, column: 4, scope: !4385)
!4387 = !DILocation(line: 1221, column: 35, scope: !4332)
!4388 = !DILocation(line: 1221, column: 15, scope: !4332)
!4389 = !DILocation(line: 1221, column: 13, scope: !4332)
!4390 = !DILocation(line: 1223, column: 7, scope: !4391)
!4391 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1223, column: 7)
!4392 = !DILocation(line: 1223, column: 16, scope: !4391)
!4393 = !DILocation(line: 1223, column: 21, scope: !4391)
!4394 = !DILocation(line: 1223, column: 34, scope: !4391)
!4395 = !DILocation(line: 1223, column: 48, scope: !4391)
!4396 = !DILocation(line: 1223, column: 57, scope: !4391)
!4397 = !DILocation(line: 1223, column: 37, scope: !4391)
!4398 = !DILocation(line: 1223, column: 61, scope: !4391)
!4399 = !DILocation(line: 1224, column: 53, scope: !4391)
!4400 = !DILocation(line: 1224, column: 62, scope: !4391)
!4401 = !DILocation(line: 1224, column: 70, scope: !4391)
!4402 = !DILocation(line: 1224, column: 88, scope: !4391)
!4403 = !DILocation(line: 1224, column: 97, scope: !4391)
!4404 = !DILocation(line: 1224, column: 81, scope: !4391)
!4405 = !DILocation(line: 1224, column: 121, scope: !4391)
!4406 = !DILocation(line: 1224, column: 148, scope: !4391)
!4407 = !DILocation(line: 1224, column: 157, scope: !4391)
!4408 = !DILocation(line: 1224, column: 137, scope: !4391)
!4409 = !DILocation(line: 1224, column: 161, scope: !4391)
!4410 = !DILocation(line: 1224, column: 136, scope: !4391)
!4411 = !DILocation(line: 1224, column: 169, scope: !4391)
!4412 = !DILocation(line: 1224, column: 187, scope: !4391)
!4413 = !DILocation(line: 1224, column: 196, scope: !4391)
!4414 = !DILocation(line: 1224, column: 176, scope: !4391)
!4415 = !DILocation(line: 1224, column: 200, scope: !4391)
!4416 = !DILocation(line: 1224, column: 175, scope: !4391)
!4417 = !DILocation(line: 1224, column: 208, scope: !4391)
!4418 = !DILocation(line: 1224, column: 227, scope: !4391)
!4419 = !DILocation(line: 1224, column: 236, scope: !4391)
!4420 = !DILocation(line: 1224, column: 216, scope: !4391)
!4421 = !DILocation(line: 1224, column: 240, scope: !4391)
!4422 = !DILocation(line: 1224, column: 215, scope: !4391)
!4423 = !DILocation(line: 1224, column: 15, scope: !4391)
!4424 = !DILocation(line: 1224, column: 13, scope: !4391)
!4425 = !DILocation(line: 1224, column: 4, scope: !4391)
!4426 = !DILocation(line: 1226, column: 40, scope: !4391)
!4427 = !DILocation(line: 1226, column: 49, scope: !4391)
!4428 = !DILocation(line: 1226, column: 57, scope: !4391)
!4429 = !DILocation(line: 1226, column: 75, scope: !4391)
!4430 = !DILocation(line: 1226, column: 84, scope: !4391)
!4431 = !DILocation(line: 1226, column: 68, scope: !4391)
!4432 = !DILocation(line: 1226, column: 108, scope: !4391)
!4433 = !DILocation(line: 1226, column: 15, scope: !4391)
!4434 = !DILocation(line: 1226, column: 13, scope: !4391)
!4435 = !DILocation(line: 1228, column: 8, scope: !4436)
!4436 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1228, column: 7)
!4437 = !DILocation(line: 1228, column: 17, scope: !4436)
!4438 = !DILocation(line: 1228, column: 32, scope: !4436)
!4439 = !DILocation(line: 1228, column: 37, scope: !4436)
!4440 = !DILocation(line: 1228, column: 42, scope: !4436)
!4441 = !DILocation(line: 1228, column: 52, scope: !4436)
!4442 = !DILocation(line: 1228, column: 41, scope: !4436)
!4443 = !DILocation(line: 1230, column: 8, scope: !4444)
!4444 = distinct !DILexicalBlock(scope: !4445, file: !24, line: 1230, column: 8)
!4445 = distinct !DILexicalBlock(scope: !4436, file: !24, line: 1228, column: 65)
!4446 = !DILocation(line: 1230, column: 17, scope: !4444)
!4447 = !DILocation(line: 1230, column: 31, scope: !4444)
!4448 = !DILocation(line: 1231, column: 39, scope: !4444)
!4449 = !DILocation(line: 1231, column: 5, scope: !4444)
!4450 = !DILocation(line: 1232, column: 22, scope: !4445)
!4451 = !DILocation(line: 1232, column: 4, scope: !4445)
!4452 = !DILocation(line: 1233, column: 3, scope: !4445)
!4453 = !DILocation(line: 1233, column: 15, scope: !4454)
!4454 = distinct !DILexicalBlock(scope: !4436, file: !24, line: 1233, column: 14)
!4455 = !DILocation(line: 1233, column: 24, scope: !4454)
!4456 = !DILocation(line: 1233, column: 29, scope: !4454)
!4457 = !DILocation(line: 1233, column: 43, scope: !4454)
!4458 = !DILocation(line: 1233, column: 48, scope: !4454)
!4459 = !DILocation(line: 1233, column: 58, scope: !4454)
!4460 = !DILocation(line: 1233, column: 47, scope: !4454)
!4461 = !DILocalVariable(name: "robptr", scope: !4462, file: !24, line: 1234, type: !4463)
!4462 = distinct !DILexicalBlock(scope: !4454, file: !24, line: 1233, column: 71)
!4463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4464, size: 64)
!4464 = !DIDerivedType(tag: DW_TAG_typedef, name: "robot_info", file: !4465, line: 128, baseType: !4466)
!4465 = !DIFile(filename: "main_d2/robot.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "7821ab73cbe058734a84802231002e5e")
!4466 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "robot_info", file: !4465, line: 53, size: 3840, flags: DIFlagTypePassByValue, elements: !4467, identifier: "_ZTS10robot_info")
!4467 = !{!4468, !4469, !4471, !4473, !4474, !4475, !4476, !4477, !4478, !4479, !4480, !4481, !4482, !4483, !4484, !4485, !4486, !4487, !4488, !4489, !4490, !4491, !4492, !4493, !4494, !4495, !4496, !4497, !4498, !4500, !4501, !4502, !4503, !4504, !4505, !4506, !4507, !4508, !4509, !4510, !4511, !4512, !4513, !4514, !4515, !4516, !4518, !4519, !4520, !4521, !4522, !4531}
!4468 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !4466, file: !4465, line: 55, baseType: !7, size: 32)
!4469 = !DIDerivedType(tag: DW_TAG_member, name: "gun_points", scope: !4466, file: !4465, line: 56, baseType: !4470, size: 768, offset: 32)
!4470 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1451, size: 768, elements: !2745)
!4471 = !DIDerivedType(tag: DW_TAG_member, name: "gun_submodels", scope: !4466, file: !4465, line: 57, baseType: !4472, size: 64, offset: 800)
!4472 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 64, elements: !2745)
!4473 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_vclip_num", scope: !4466, file: !4465, line: 59, baseType: !182, size: 16, offset: 864)
!4474 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_sound_num", scope: !4466, file: !4465, line: 60, baseType: !182, size: 16, offset: 880)
!4475 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_vclip_num", scope: !4466, file: !4465, line: 62, baseType: !182, size: 16, offset: 896)
!4476 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_sound_num", scope: !4466, file: !4465, line: 63, baseType: !182, size: 16, offset: 912)
!4477 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type", scope: !4466, file: !4465, line: 65, baseType: !175, size: 8, offset: 928)
!4478 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type2", scope: !4466, file: !4465, line: 66, baseType: !175, size: 8, offset: 936)
!4479 = !DIDerivedType(tag: DW_TAG_member, name: "n_guns", scope: !4466, file: !4465, line: 67, baseType: !175, size: 8, offset: 944)
!4480 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !4466, file: !4465, line: 68, baseType: !175, size: 8, offset: 952)
!4481 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !4466, file: !4465, line: 70, baseType: !175, size: 8, offset: 960)
!4482 = !DIDerivedType(tag: DW_TAG_member, name: "contains_prob", scope: !4466, file: !4465, line: 71, baseType: !175, size: 8, offset: 968)
!4483 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !4466, file: !4465, line: 72, baseType: !175, size: 8, offset: 976)
!4484 = !DIDerivedType(tag: DW_TAG_member, name: "kamikaze", scope: !4466, file: !4465, line: 73, baseType: !175, size: 8, offset: 984)
!4485 = !DIDerivedType(tag: DW_TAG_member, name: "score_value", scope: !4466, file: !4465, line: 75, baseType: !182, size: 16, offset: 992)
!4486 = !DIDerivedType(tag: DW_TAG_member, name: "badass", scope: !4466, file: !4465, line: 76, baseType: !175, size: 8, offset: 1008)
!4487 = !DIDerivedType(tag: DW_TAG_member, name: "energy_drain", scope: !4466, file: !4465, line: 77, baseType: !175, size: 8, offset: 1016)
!4488 = !DIDerivedType(tag: DW_TAG_member, name: "lighting", scope: !4466, file: !4465, line: 79, baseType: !14, size: 32, offset: 1024)
!4489 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !4466, file: !4465, line: 80, baseType: !14, size: 32, offset: 1056)
!4490 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !4466, file: !4465, line: 82, baseType: !14, size: 32, offset: 1088)
!4491 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !4466, file: !4465, line: 83, baseType: !14, size: 32, offset: 1120)
!4492 = !DIDerivedType(tag: DW_TAG_member, name: "field_of_view", scope: !4466, file: !4465, line: 85, baseType: !2263, size: 160, offset: 1152)
!4493 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait", scope: !4466, file: !4465, line: 86, baseType: !2263, size: 160, offset: 1312)
!4494 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait2", scope: !4466, file: !4465, line: 87, baseType: !2263, size: 160, offset: 1472)
!4495 = !DIDerivedType(tag: DW_TAG_member, name: "turn_time", scope: !4466, file: !4465, line: 88, baseType: !2263, size: 160, offset: 1632)
!4496 = !DIDerivedType(tag: DW_TAG_member, name: "max_speed", scope: !4466, file: !4465, line: 91, baseType: !2263, size: 160, offset: 1792)
!4497 = !DIDerivedType(tag: DW_TAG_member, name: "circle_distance", scope: !4466, file: !4465, line: 92, baseType: !2263, size: 160, offset: 1952)
!4498 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !4466, file: !4465, line: 94, baseType: !4499, size: 40, offset: 2112)
!4499 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 40, elements: !2264)
!4500 = !DIDerivedType(tag: DW_TAG_member, name: "evade_speed", scope: !4466, file: !4465, line: 95, baseType: !4499, size: 40, offset: 2152)
!4501 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_type", scope: !4466, file: !4465, line: 96, baseType: !175, size: 8, offset: 2192)
!4502 = !DIDerivedType(tag: DW_TAG_member, name: "attack_type", scope: !4466, file: !4465, line: 97, baseType: !175, size: 8, offset: 2200)
!4503 = !DIDerivedType(tag: DW_TAG_member, name: "see_sound", scope: !4466, file: !4465, line: 99, baseType: !186, size: 8, offset: 2208)
!4504 = !DIDerivedType(tag: DW_TAG_member, name: "attack_sound", scope: !4466, file: !4465, line: 100, baseType: !186, size: 8, offset: 2216)
!4505 = !DIDerivedType(tag: DW_TAG_member, name: "claw_sound", scope: !4466, file: !4465, line: 101, baseType: !186, size: 8, offset: 2224)
!4506 = !DIDerivedType(tag: DW_TAG_member, name: "taunt_sound", scope: !4466, file: !4465, line: 102, baseType: !186, size: 8, offset: 2232)
!4507 = !DIDerivedType(tag: DW_TAG_member, name: "boss_flag", scope: !4466, file: !4465, line: 104, baseType: !175, size: 8, offset: 2240)
!4508 = !DIDerivedType(tag: DW_TAG_member, name: "companion", scope: !4466, file: !4465, line: 105, baseType: !175, size: 8, offset: 2248)
!4509 = !DIDerivedType(tag: DW_TAG_member, name: "smart_blobs", scope: !4466, file: !4465, line: 106, baseType: !175, size: 8, offset: 2256)
!4510 = !DIDerivedType(tag: DW_TAG_member, name: "energy_blobs", scope: !4466, file: !4465, line: 107, baseType: !175, size: 8, offset: 2264)
!4511 = !DIDerivedType(tag: DW_TAG_member, name: "thief", scope: !4466, file: !4465, line: 109, baseType: !175, size: 8, offset: 2272)
!4512 = !DIDerivedType(tag: DW_TAG_member, name: "pursuit", scope: !4466, file: !4465, line: 110, baseType: !175, size: 8, offset: 2280)
!4513 = !DIDerivedType(tag: DW_TAG_member, name: "lightcast", scope: !4466, file: !4465, line: 111, baseType: !175, size: 8, offset: 2288)
!4514 = !DIDerivedType(tag: DW_TAG_member, name: "death_roll", scope: !4466, file: !4465, line: 112, baseType: !175, size: 8, offset: 2296)
!4515 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !4466, file: !4465, line: 115, baseType: !186, size: 8, offset: 2304)
!4516 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !4466, file: !4465, line: 116, baseType: !4517, size: 24, offset: 2312)
!4517 = !DICompositeType(tag: DW_TAG_array_type, baseType: !186, size: 24, elements: !429)
!4518 = !DIDerivedType(tag: DW_TAG_member, name: "deathroll_sound", scope: !4466, file: !4465, line: 118, baseType: !186, size: 8, offset: 2336)
!4519 = !DIDerivedType(tag: DW_TAG_member, name: "glow", scope: !4466, file: !4465, line: 119, baseType: !186, size: 8, offset: 2344)
!4520 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !4466, file: !4465, line: 120, baseType: !186, size: 8, offset: 2352)
!4521 = !DIDerivedType(tag: DW_TAG_member, name: "aim", scope: !4466, file: !4465, line: 121, baseType: !186, size: 8, offset: 2360)
!4522 = !DIDerivedType(tag: DW_TAG_member, name: "anim_states", scope: !4466, file: !4465, line: 124, baseType: !4523, size: 1440, offset: 2368)
!4523 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4524, size: 1440, elements: !4529)
!4524 = !DIDerivedType(tag: DW_TAG_typedef, name: "jointlist", file: !4465, line: 46, baseType: !4525)
!4525 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "jointlist", file: !4465, line: 42, size: 32, flags: DIFlagTypePassByValue, elements: !4526, identifier: "_ZTS9jointlist")
!4526 = !{!4527, !4528}
!4527 = !DIDerivedType(tag: DW_TAG_member, name: "n_joints", scope: !4525, file: !4465, line: 44, baseType: !182, size: 16)
!4528 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !4525, file: !4465, line: 45, baseType: !182, size: 16, offset: 16)
!4529 = !{!4530, !2265}
!4530 = !DISubrange(count: 9)
!4531 = !DIDerivedType(tag: DW_TAG_member, name: "always_0xabcd", scope: !4466, file: !4465, line: 126, baseType: !7, size: 32, offset: 3808)
!4532 = !DILocation(line: 1234, column: 16, scope: !4462)
!4533 = !DILocation(line: 1234, column: 37, scope: !4462)
!4534 = !DILocation(line: 1234, column: 46, scope: !4462)
!4535 = !DILocation(line: 1234, column: 26, scope: !4462)
!4536 = !DILocation(line: 1235, column: 8, scope: !4537)
!4537 = distinct !DILexicalBlock(scope: !4462, file: !24, line: 1235, column: 8)
!4538 = !DILocation(line: 1235, column: 16, scope: !4537)
!4539 = !DILocation(line: 1236, column: 11, scope: !4540)
!4540 = distinct !DILexicalBlock(scope: !4541, file: !24, line: 1236, column: 9)
!4541 = distinct !DILexicalBlock(scope: !4537, file: !24, line: 1235, column: 32)
!4542 = !DILocation(line: 1236, column: 20, scope: !4540)
!4543 = !DILocation(line: 1236, column: 26, scope: !4540)
!4544 = !DILocation(line: 1236, column: 35, scope: !4540)
!4545 = !DILocation(line: 1236, column: 43, scope: !4540)
!4546 = !DILocation(line: 1236, column: 33, scope: !4540)
!4547 = !DILocation(line: 1237, column: 34, scope: !4548)
!4548 = distinct !DILexicalBlock(scope: !4540, file: !24, line: 1236, column: 58)
!4549 = !DILocation(line: 1237, column: 45, scope: !4548)
!4550 = !DILocation(line: 1237, column: 53, scope: !4548)
!4551 = !DILocation(line: 1237, column: 43, scope: !4548)
!4552 = !DILocation(line: 1237, column: 69, scope: !4548)
!4553 = !DILocation(line: 1237, column: 76, scope: !4548)
!4554 = !DILocation(line: 1237, column: 32, scope: !4548)
!4555 = !DILocation(line: 1237, column: 6, scope: !4548)
!4556 = !DILocation(line: 1237, column: 15, scope: !4548)
!4557 = !DILocation(line: 1237, column: 30, scope: !4548)
!4558 = !DILocation(line: 1238, column: 31, scope: !4548)
!4559 = !DILocation(line: 1238, column: 39, scope: !4548)
!4560 = !DILocation(line: 1238, column: 6, scope: !4548)
!4561 = !DILocation(line: 1238, column: 15, scope: !4548)
!4562 = !DILocation(line: 1238, column: 29, scope: !4548)
!4563 = !DILocation(line: 1239, column: 29, scope: !4548)
!4564 = !DILocation(line: 1239, column: 37, scope: !4548)
!4565 = !DILocation(line: 1239, column: 6, scope: !4548)
!4566 = !DILocation(line: 1239, column: 15, scope: !4548)
!4567 = !DILocation(line: 1239, column: 27, scope: !4548)
!4568 = !DILocation(line: 1240, column: 40, scope: !4548)
!4569 = !DILocation(line: 1240, column: 6, scope: !4548)
!4570 = !DILocation(line: 1241, column: 24, scope: !4548)
!4571 = !DILocation(line: 1241, column: 6, scope: !4548)
!4572 = !DILocation(line: 1242, column: 5, scope: !4548)
!4573 = !DILocation(line: 1243, column: 4, scope: !4541)
!4574 = !DILocation(line: 1245, column: 8, scope: !4575)
!4575 = distinct !DILexicalBlock(scope: !4462, file: !24, line: 1245, column: 8)
!4576 = !DILocation(line: 1245, column: 16, scope: !4575)
!4577 = !DILocation(line: 1246, column: 23, scope: !4575)
!4578 = !DILocation(line: 1246, column: 5, scope: !4575)
!4579 = !DILocation(line: 1248, column: 8, scope: !4580)
!4580 = distinct !DILexicalBlock(scope: !4462, file: !24, line: 1248, column: 8)
!4581 = !DILocation(line: 1248, column: 16, scope: !4580)
!4582 = !DILocation(line: 1249, column: 21, scope: !4583)
!4583 = distinct !DILexicalBlock(scope: !4580, file: !24, line: 1248, column: 27)
!4584 = !DILocation(line: 1249, column: 5, scope: !4583)
!4585 = !DILocation(line: 1250, column: 4, scope: !4583)
!4586 = !DILocation(line: 1251, column: 3, scope: !4462)
!4587 = !DILocation(line: 1253, column: 19, scope: !4588)
!4588 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1253, column: 8)
!4589 = !DILocation(line: 1253, column: 28, scope: !4588)
!4590 = !DILocation(line: 1253, column: 8, scope: !4588)
!4591 = !DILocation(line: 1253, column: 32, scope: !4588)
!4592 = !DILocation(line: 1253, column: 47, scope: !4588)
!4593 = !DILocation(line: 1254, column: 39, scope: !4588)
!4594 = !DILocation(line: 1254, column: 48, scope: !4588)
!4595 = !DILocation(line: 1254, column: 28, scope: !4588)
!4596 = !DILocation(line: 1254, column: 52, scope: !4588)
!4597 = !DILocation(line: 1254, column: 68, scope: !4588)
!4598 = !DILocation(line: 1254, column: 77, scope: !4588)
!4599 = !DILocation(line: 1254, column: 88, scope: !4588)
!4600 = !DILocation(line: 1254, column: 4, scope: !4588)
!4601 = !DILocation(line: 1264, column: 3, scope: !4332)
!4602 = !DILocation(line: 1264, column: 8, scope: !4332)
!4603 = !DILocation(line: 1264, column: 24, scope: !4332)
!4604 = !DILocation(line: 1264, column: 35, scope: !4332)
!4605 = !DILocation(line: 1267, column: 7, scope: !4606)
!4606 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1267, column: 7)
!4607 = !DILocation(line: 1267, column: 16, scope: !4606)
!4608 = !DILocation(line: 1267, column: 27, scope: !4606)
!4609 = !DILocation(line: 1268, column: 18, scope: !4606)
!4610 = !DILocation(line: 1268, column: 4, scope: !4606)
!4611 = !DILocation(line: 1271, column: 7, scope: !4612)
!4612 = distinct !DILexicalBlock(scope: !4332, file: !24, line: 1271, column: 7)
!4613 = !DILocation(line: 1273, column: 8, scope: !4614)
!4614 = distinct !DILexicalBlock(scope: !4615, file: !24, line: 1273, column: 8)
!4615 = distinct !DILexicalBlock(scope: !4612, file: !24, line: 1271, column: 17)
!4616 = !DILocation(line: 1273, column: 17, scope: !4614)
!4617 = !DILocation(line: 1273, column: 31, scope: !4614)
!4618 = !DILocation(line: 1274, column: 5, scope: !4619)
!4619 = distinct !DILexicalBlock(scope: !4614, file: !24, line: 1273, column: 46)
!4620 = !DILocation(line: 1274, column: 15, scope: !4619)
!4621 = !DILocation(line: 1274, column: 29, scope: !4619)
!4622 = !DILocation(line: 1275, column: 33, scope: !4619)
!4623 = !DILocation(line: 1275, column: 42, scope: !4619)
!4624 = !DILocation(line: 1275, column: 5, scope: !4619)
!4625 = !DILocation(line: 1275, column: 15, scope: !4619)
!4626 = !DILocation(line: 1275, column: 31, scope: !4619)
!4627 = !DILocation(line: 1276, column: 4, scope: !4619)
!4628 = !DILocation(line: 1278, column: 44, scope: !4615)
!4629 = !DILocation(line: 1278, column: 54, scope: !4615)
!4630 = !DILocation(line: 1278, column: 62, scope: !4615)
!4631 = !DILocation(line: 1278, column: 4, scope: !4615)
!4632 = !DILocation(line: 1278, column: 14, scope: !4615)
!4633 = !DILocation(line: 1278, column: 30, scope: !4615)
!4634 = !DILocation(line: 1278, column: 42, scope: !4615)
!4635 = !DILocation(line: 1279, column: 46, scope: !4615)
!4636 = !DILocation(line: 1279, column: 53, scope: !4615)
!4637 = !DILocation(line: 1279, column: 4, scope: !4615)
!4638 = !DILocation(line: 1279, column: 14, scope: !4615)
!4639 = !DILocation(line: 1279, column: 30, scope: !4615)
!4640 = !DILocation(line: 1279, column: 44, scope: !4615)
!4641 = !DILocation(line: 1281, column: 8, scope: !4642)
!4642 = distinct !DILexicalBlock(scope: !4615, file: !24, line: 1281, column: 8)
!4643 = !DILocation(line: 1281, column: 13, scope: !4642)
!4644 = !DILocation(line: 1281, column: 29, scope: !4642)
!4645 = !DILocation(line: 1281, column: 43, scope: !4642)
!4646 = !DILocation(line: 1282, column: 7, scope: !4642)
!4647 = !DILocation(line: 1285, column: 3, scope: !4615)
!4648 = !DILocation(line: 1287, column: 24, scope: !4649)
!4649 = distinct !DILexicalBlock(scope: !4612, file: !24, line: 1286, column: 8)
!4650 = !DILocation(line: 1287, column: 4, scope: !4649)
!4651 = !DILocation(line: 1288, column: 4, scope: !4649)
!4652 = !DILocation(line: 1291, column: 2, scope: !4332)
!4653 = !DILocation(line: 1294, column: 6, scope: !4654)
!4654 = distinct !DILexicalBlock(scope: !4308, file: !24, line: 1294, column: 6)
!4655 = !DILocation(line: 1294, column: 11, scope: !4654)
!4656 = !DILocation(line: 1294, column: 23, scope: !4654)
!4657 = !DILocation(line: 1294, column: 28, scope: !4654)
!4658 = !DILocation(line: 1294, column: 44, scope: !4654)
!4659 = !DILocation(line: 1294, column: 20, scope: !4654)
!4660 = !DILocalVariable(name: "del_obj", scope: !4661, file: !24, line: 1295, type: !1434)
!4661 = distinct !DILexicalBlock(scope: !4654, file: !24, line: 1294, column: 57)
!4662 = !DILocation(line: 1295, column: 11, scope: !4661)
!4663 = !DILocation(line: 1295, column: 30, scope: !4661)
!4664 = !DILocation(line: 1295, column: 35, scope: !4661)
!4665 = !DILocation(line: 1295, column: 51, scope: !4661)
!4666 = !DILocation(line: 1295, column: 22, scope: !4661)
!4667 = !DILocation(line: 1297, column: 3, scope: !4661)
!4668 = !DILocation(line: 1297, column: 8, scope: !4661)
!4669 = !DILocation(line: 1297, column: 24, scope: !4661)
!4670 = !DILocation(line: 1297, column: 36, scope: !4661)
!4671 = !DILocation(line: 1299, column: 23, scope: !4661)
!4672 = !DILocation(line: 1299, column: 3, scope: !4661)
!4673 = !DILocation(line: 1300, column: 2, scope: !4661)
!4674 = !DILocation(line: 1301, column: 1, scope: !4308)
!4675 = distinct !DISubprogram(name: "init_exploding_walls", linkageName: "_Z20init_exploding_wallsv", scope: !24, file: !24, line: 1309, type: !1193, scopeLine: 1310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4676 = !DILocalVariable(name: "i", scope: !4675, file: !24, line: 1311, type: !7)
!4677 = !DILocation(line: 1311, column: 6, scope: !4675)
!4678 = !DILocation(line: 1313, column: 8, scope: !4679)
!4679 = distinct !DILexicalBlock(scope: !4675, file: !24, line: 1313, column: 2)
!4680 = !DILocation(line: 1313, column: 7, scope: !4679)
!4681 = !DILocation(line: 1313, column: 11, scope: !4682)
!4682 = distinct !DILexicalBlock(scope: !4679, file: !24, line: 1313, column: 2)
!4683 = !DILocation(line: 1313, column: 12, scope: !4682)
!4684 = !DILocation(line: 1313, column: 2, scope: !4679)
!4685 = !DILocation(line: 1314, column: 18, scope: !4682)
!4686 = !DILocation(line: 1314, column: 3, scope: !4682)
!4687 = !DILocation(line: 1314, column: 21, scope: !4682)
!4688 = !DILocation(line: 1314, column: 28, scope: !4682)
!4689 = !DILocation(line: 1313, column: 34, scope: !4682)
!4690 = !DILocation(line: 1313, column: 2, scope: !4682)
!4691 = distinct !{!4691, !4684, !4692, !1996}
!4692 = !DILocation(line: 1314, column: 31, scope: !4679)
!4693 = !DILocation(line: 1315, column: 1, scope: !4675)
!4694 = distinct !DISubprogram(name: "explode_wall", linkageName: "_Z12explode_wallii", scope: !24, file: !24, line: 1318, type: !4695, scopeLine: 1319, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4695 = !DISubroutineType(types: !4696)
!4696 = !{null, !7, !7}
!4697 = !DILocalVariable(name: "segnum", arg: 1, scope: !4694, file: !24, line: 1318, type: !7)
!4698 = !DILocation(line: 1318, column: 23, scope: !4694)
!4699 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4694, file: !24, line: 1318, type: !7)
!4700 = !DILocation(line: 1318, column: 34, scope: !4694)
!4701 = !DILocalVariable(name: "i", scope: !4694, file: !24, line: 1320, type: !7)
!4702 = !DILocation(line: 1320, column: 6, scope: !4694)
!4703 = !DILocalVariable(name: "pos", scope: !4694, file: !24, line: 1321, type: !1451)
!4704 = !DILocation(line: 1321, column: 13, scope: !4694)
!4705 = !DILocation(line: 1325, column: 8, scope: !4706)
!4706 = distinct !DILexicalBlock(scope: !4694, file: !24, line: 1325, column: 2)
!4707 = !DILocation(line: 1325, column: 7, scope: !4706)
!4708 = !DILocation(line: 1325, column: 11, scope: !4709)
!4709 = distinct !DILexicalBlock(scope: !4706, file: !24, line: 1325, column: 2)
!4710 = !DILocation(line: 1325, column: 12, scope: !4709)
!4711 = !DILocation(line: 1325, column: 33, scope: !4709)
!4712 = !DILocation(line: 1325, column: 51, scope: !4709)
!4713 = !DILocation(line: 1325, column: 36, scope: !4709)
!4714 = !DILocation(line: 1325, column: 54, scope: !4709)
!4715 = !DILocation(line: 1325, column: 61, scope: !4709)
!4716 = !DILocation(line: 0, scope: !4709)
!4717 = !DILocation(line: 1325, column: 2, scope: !4706)
!4718 = !DILocation(line: 1325, column: 68, scope: !4709)
!4719 = !DILocation(line: 1325, column: 2, scope: !4709)
!4720 = distinct !{!4720, !4717, !4721, !1996}
!4721 = !DILocation(line: 1325, column: 71, scope: !4706)
!4722 = !DILocation(line: 1327, column: 6, scope: !4723)
!4723 = distinct !DILexicalBlock(scope: !4694, file: !24, line: 1327, column: 6)
!4724 = !DILocation(line: 1327, column: 7, scope: !4723)
!4725 = !DILocation(line: 1328, column: 3, scope: !4726)
!4726 = distinct !DILexicalBlock(scope: !4723, file: !24, line: 1327, column: 30)
!4727 = !DILocation(line: 1329, column: 3, scope: !4726)
!4728 = !DILocation(line: 1330, column: 3, scope: !4726)
!4729 = !DILocation(line: 1333, column: 29, scope: !4694)
!4730 = !DILocation(line: 1333, column: 17, scope: !4694)
!4731 = !DILocation(line: 1333, column: 2, scope: !4694)
!4732 = !DILocation(line: 1333, column: 20, scope: !4694)
!4733 = !DILocation(line: 1333, column: 27, scope: !4694)
!4734 = !DILocation(line: 1334, column: 30, scope: !4694)
!4735 = !DILocation(line: 1334, column: 17, scope: !4694)
!4736 = !DILocation(line: 1334, column: 2, scope: !4694)
!4737 = !DILocation(line: 1334, column: 20, scope: !4694)
!4738 = !DILocation(line: 1334, column: 28, scope: !4694)
!4739 = !DILocation(line: 1335, column: 17, scope: !4694)
!4740 = !DILocation(line: 1335, column: 2, scope: !4694)
!4741 = !DILocation(line: 1335, column: 20, scope: !4694)
!4742 = !DILocation(line: 1335, column: 26, scope: !4694)
!4743 = !DILocation(line: 1338, column: 46, scope: !4694)
!4744 = !DILocation(line: 1338, column: 37, scope: !4694)
!4745 = !DILocation(line: 1338, column: 54, scope: !4694)
!4746 = !DILocation(line: 1338, column: 2, scope: !4694)
!4747 = !DILocation(line: 1339, column: 47, scope: !4694)
!4748 = !DILocation(line: 1339, column: 55, scope: !4694)
!4749 = !DILocation(line: 1339, column: 2, scope: !4694)
!4750 = !DILocation(line: 1341, column: 1, scope: !4694)
!4751 = distinct !DISubprogram(name: "do_exploding_wall_frame", linkageName: "_Z23do_exploding_wall_framev", scope: !24, file: !24, line: 1345, type: !1193, scopeLine: 1346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4752 = !DILocalVariable(name: "i", scope: !4751, file: !24, line: 1347, type: !7)
!4753 = !DILocation(line: 1347, column: 6, scope: !4751)
!4754 = !DILocation(line: 1349, column: 8, scope: !4755)
!4755 = distinct !DILexicalBlock(scope: !4751, file: !24, line: 1349, column: 2)
!4756 = !DILocation(line: 1349, column: 7, scope: !4755)
!4757 = !DILocation(line: 1349, column: 11, scope: !4758)
!4758 = distinct !DILexicalBlock(scope: !4755, file: !24, line: 1349, column: 2)
!4759 = !DILocation(line: 1349, column: 12, scope: !4758)
!4760 = !DILocation(line: 1349, column: 2, scope: !4755)
!4761 = !DILocalVariable(name: "segnum", scope: !4762, file: !24, line: 1350, type: !7)
!4762 = distinct !DILexicalBlock(scope: !4758, file: !24, line: 1349, column: 38)
!4763 = !DILocation(line: 1350, column: 7, scope: !4762)
!4764 = !DILocation(line: 1350, column: 31, scope: !4762)
!4765 = !DILocation(line: 1350, column: 16, scope: !4762)
!4766 = !DILocation(line: 1350, column: 34, scope: !4762)
!4767 = !DILocation(line: 1352, column: 7, scope: !4768)
!4768 = distinct !DILexicalBlock(scope: !4762, file: !24, line: 1352, column: 7)
!4769 = !DILocation(line: 1352, column: 14, scope: !4768)
!4770 = !DILocalVariable(name: "sidenum", scope: !4771, file: !24, line: 1353, type: !7)
!4771 = distinct !DILexicalBlock(scope: !4768, file: !24, line: 1352, column: 21)
!4772 = !DILocation(line: 1353, column: 8, scope: !4771)
!4773 = !DILocation(line: 1353, column: 33, scope: !4771)
!4774 = !DILocation(line: 1353, column: 18, scope: !4771)
!4775 = !DILocation(line: 1353, column: 36, scope: !4771)
!4776 = !DILocalVariable(name: "oldfrac", scope: !4771, file: !24, line: 1354, type: !14)
!4777 = !DILocation(line: 1354, column: 8, scope: !4771)
!4778 = !DILocalVariable(name: "newfrac", scope: !4771, file: !24, line: 1354, type: !14)
!4779 = !DILocation(line: 1354, column: 16, scope: !4771)
!4780 = !DILocalVariable(name: "old_count", scope: !4771, file: !24, line: 1355, type: !7)
!4781 = !DILocation(line: 1355, column: 8, scope: !4771)
!4782 = !DILocalVariable(name: "new_count", scope: !4771, file: !24, line: 1355, type: !7)
!4783 = !DILocation(line: 1355, column: 18, scope: !4771)
!4784 = !DILocalVariable(name: "e", scope: !4771, file: !24, line: 1355, type: !7)
!4785 = !DILocation(line: 1355, column: 28, scope: !4771)
!4786 = !DILocation(line: 1357, column: 36, scope: !4771)
!4787 = !DILocation(line: 1357, column: 21, scope: !4771)
!4788 = !DILocation(line: 1357, column: 39, scope: !4771)
!4789 = !DILocation(line: 1357, column: 14, scope: !4771)
!4790 = !DILocation(line: 1357, column: 12, scope: !4771)
!4791 = !DILocation(line: 1359, column: 30, scope: !4771)
!4792 = !DILocation(line: 1359, column: 19, scope: !4771)
!4793 = !DILocation(line: 1359, column: 4, scope: !4771)
!4794 = !DILocation(line: 1359, column: 22, scope: !4771)
!4795 = !DILocation(line: 1359, column: 27, scope: !4771)
!4796 = !DILocation(line: 1360, column: 23, scope: !4797)
!4797 = distinct !DILexicalBlock(scope: !4771, file: !24, line: 1360, column: 8)
!4798 = !DILocation(line: 1360, column: 8, scope: !4797)
!4799 = !DILocation(line: 1360, column: 26, scope: !4797)
!4800 = !DILocation(line: 1360, column: 31, scope: !4797)
!4801 = !DILocation(line: 1361, column: 20, scope: !4797)
!4802 = !DILocation(line: 1361, column: 5, scope: !4797)
!4803 = !DILocation(line: 1361, column: 23, scope: !4797)
!4804 = !DILocation(line: 1361, column: 28, scope: !4797)
!4805 = !DILocation(line: 1363, column: 23, scope: !4806)
!4806 = distinct !DILexicalBlock(scope: !4771, file: !24, line: 1363, column: 8)
!4807 = !DILocation(line: 1363, column: 8, scope: !4806)
!4808 = !DILocation(line: 1363, column: 26, scope: !4806)
!4809 = !DILocation(line: 1363, column: 30, scope: !4806)
!4810 = !DILocalVariable(name: "seg", scope: !4811, file: !24, line: 1364, type: !2714)
!4811 = distinct !DILexicalBlock(scope: !4806, file: !24, line: 1363, column: 53)
!4812 = !DILocation(line: 1364, column: 14, scope: !4811)
!4813 = !DILocalVariable(name: "csegp", scope: !4811, file: !24, line: 1364, type: !2714)
!4814 = !DILocation(line: 1364, column: 19, scope: !4811)
!4815 = !DILocalVariable(name: "cside", scope: !4811, file: !24, line: 1365, type: !7)
!4816 = !DILocation(line: 1365, column: 9, scope: !4811)
!4817 = !DILocalVariable(name: "a", scope: !4811, file: !24, line: 1365, type: !7)
!4818 = !DILocation(line: 1365, column: 15, scope: !4811)
!4819 = !DILocalVariable(name: "n", scope: !4811, file: !24, line: 1365, type: !7)
!4820 = !DILocation(line: 1365, column: 17, scope: !4811)
!4821 = !DILocation(line: 1367, column: 21, scope: !4811)
!4822 = !DILocation(line: 1367, column: 12, scope: !4811)
!4823 = !DILocation(line: 1367, column: 9, scope: !4811)
!4824 = !DILocation(line: 1369, column: 15, scope: !4811)
!4825 = !DILocation(line: 1369, column: 20, scope: !4811)
!4826 = !DILocation(line: 1369, column: 26, scope: !4811)
!4827 = !DILocation(line: 1369, column: 35, scope: !4811)
!4828 = !DILocation(line: 1369, column: 9, scope: !4811)
!4829 = !DILocation(line: 1369, column: 45, scope: !4811)
!4830 = !DILocation(line: 1369, column: 7, scope: !4811)
!4831 = !DILocation(line: 1370, column: 19, scope: !4811)
!4832 = !DILocation(line: 1370, column: 9, scope: !4811)
!4833 = !DILocation(line: 1370, column: 22, scope: !4811)
!4834 = !DILocation(line: 1370, column: 7, scope: !4811)
!4835 = !DILocation(line: 1372, column: 23, scope: !4811)
!4836 = !DILocation(line: 1372, column: 28, scope: !4811)
!4837 = !DILocation(line: 1372, column: 37, scope: !4811)
!4838 = !DILocation(line: 1372, column: 14, scope: !4811)
!4839 = !DILocation(line: 1372, column: 11, scope: !4811)
!4840 = !DILocation(line: 1373, column: 31, scope: !4811)
!4841 = !DILocation(line: 1373, column: 36, scope: !4811)
!4842 = !DILocation(line: 1373, column: 13, scope: !4811)
!4843 = !DILocation(line: 1373, column: 11, scope: !4811)
!4844 = !DILocation(line: 1375, column: 23, scope: !4811)
!4845 = !DILocation(line: 1375, column: 27, scope: !4811)
!4846 = !DILocation(line: 1375, column: 35, scope: !4811)
!4847 = !DILocation(line: 1375, column: 41, scope: !4811)
!4848 = !DILocation(line: 1375, column: 47, scope: !4811)
!4849 = !DILocation(line: 1375, column: 49, scope: !4811)
!4850 = !DILocation(line: 1375, column: 50, scope: !4811)
!4851 = !DILocation(line: 1375, column: 5, scope: !4811)
!4852 = !DILocation(line: 1377, column: 11, scope: !4811)
!4853 = !DILocation(line: 1377, column: 16, scope: !4811)
!4854 = !DILocation(line: 1377, column: 22, scope: !4811)
!4855 = !DILocation(line: 1377, column: 31, scope: !4811)
!4856 = !DILocation(line: 1377, column: 5, scope: !4811)
!4857 = !DILocation(line: 1377, column: 41, scope: !4811)
!4858 = !DILocation(line: 1377, column: 47, scope: !4811)
!4859 = !DILocation(line: 1378, column: 11, scope: !4811)
!4860 = !DILocation(line: 1378, column: 18, scope: !4811)
!4861 = !DILocation(line: 1378, column: 24, scope: !4811)
!4862 = !DILocation(line: 1378, column: 31, scope: !4811)
!4863 = !DILocation(line: 1378, column: 5, scope: !4811)
!4864 = !DILocation(line: 1378, column: 41, scope: !4811)
!4865 = !DILocation(line: 1378, column: 47, scope: !4811)
!4866 = !DILocation(line: 1380, column: 4, scope: !4811)
!4867 = !DILocation(line: 1382, column: 36, scope: !4771)
!4868 = !DILocation(line: 1382, column: 21, scope: !4771)
!4869 = !DILocation(line: 1382, column: 39, scope: !4771)
!4870 = !DILocation(line: 1382, column: 14, scope: !4771)
!4871 = !DILocation(line: 1382, column: 12, scope: !4771)
!4872 = !DILocation(line: 1384, column: 55, scope: !4771)
!4873 = !DILocation(line: 1384, column: 63, scope: !4771)
!4874 = !DILocation(line: 1384, column: 48, scope: !4771)
!4875 = !DILocation(line: 1384, column: 46, scope: !4771)
!4876 = !DILocation(line: 1384, column: 16, scope: !4771)
!4877 = !DILocation(line: 1384, column: 14, scope: !4771)
!4878 = !DILocation(line: 1385, column: 55, scope: !4771)
!4879 = !DILocation(line: 1385, column: 63, scope: !4771)
!4880 = !DILocation(line: 1385, column: 48, scope: !4771)
!4881 = !DILocation(line: 1385, column: 46, scope: !4771)
!4882 = !DILocation(line: 1385, column: 16, scope: !4771)
!4883 = !DILocation(line: 1385, column: 14, scope: !4771)
!4884 = !DILocation(line: 1393, column: 11, scope: !4885)
!4885 = distinct !DILexicalBlock(scope: !4771, file: !24, line: 1393, column: 4)
!4886 = !DILocation(line: 1393, column: 10, scope: !4885)
!4887 = !DILocation(line: 1393, column: 9, scope: !4885)
!4888 = !DILocation(line: 1393, column: 21, scope: !4889)
!4889 = distinct !DILexicalBlock(scope: !4885, file: !24, line: 1393, column: 4)
!4890 = !DILocation(line: 1393, column: 23, scope: !4889)
!4891 = !DILocation(line: 1393, column: 22, scope: !4889)
!4892 = !DILocation(line: 1393, column: 4, scope: !4885)
!4893 = !DILocalVariable(name: "vertnum_list", scope: !4894, file: !24, line: 1394, type: !4895)
!4894 = distinct !DILexicalBlock(scope: !4889, file: !24, line: 1393, column: 38)
!4895 = !DICompositeType(tag: DW_TAG_array_type, baseType: !182, size: 64, elements: !82)
!4896 = !DILocation(line: 1394, column: 13, scope: !4894)
!4897 = !DILocalVariable(name: "v0", scope: !4894, file: !24, line: 1395, type: !1571)
!4898 = !DILocation(line: 1395, column: 17, scope: !4894)
!4899 = !DILocalVariable(name: "v1", scope: !4894, file: !24, line: 1395, type: !1571)
!4900 = !DILocation(line: 1395, column: 21, scope: !4894)
!4901 = !DILocalVariable(name: "v2", scope: !4894, file: !24, line: 1395, type: !1571)
!4902 = !DILocation(line: 1395, column: 25, scope: !4894)
!4903 = !DILocalVariable(name: "vv0", scope: !4894, file: !24, line: 1396, type: !1451)
!4904 = !DILocation(line: 1396, column: 16, scope: !4894)
!4905 = !DILocalVariable(name: "vv1", scope: !4894, file: !24, line: 1396, type: !1451)
!4906 = !DILocation(line: 1396, column: 20, scope: !4894)
!4907 = !DILocalVariable(name: "pos", scope: !4894, file: !24, line: 1396, type: !1451)
!4908 = !DILocation(line: 1396, column: 24, scope: !4894)
!4909 = !DILocalVariable(name: "size", scope: !4894, file: !24, line: 1397, type: !14)
!4910 = !DILocation(line: 1397, column: 11, scope: !4894)
!4911 = !DILocation(line: 1401, column: 20, scope: !4894)
!4912 = !DILocation(line: 1401, column: 33, scope: !4894)
!4913 = !DILocation(line: 1401, column: 40, scope: !4894)
!4914 = !DILocation(line: 1401, column: 5, scope: !4894)
!4915 = !DILocation(line: 1403, column: 20, scope: !4894)
!4916 = !DILocation(line: 1403, column: 11, scope: !4894)
!4917 = !DILocation(line: 1403, column: 8, scope: !4894)
!4918 = !DILocation(line: 1404, column: 20, scope: !4894)
!4919 = !DILocation(line: 1404, column: 11, scope: !4894)
!4920 = !DILocation(line: 1404, column: 8, scope: !4894)
!4921 = !DILocation(line: 1405, column: 20, scope: !4894)
!4922 = !DILocation(line: 1405, column: 11, scope: !4894)
!4923 = !DILocation(line: 1405, column: 8, scope: !4894)
!4924 = !DILocation(line: 1407, column: 21, scope: !4894)
!4925 = !DILocation(line: 1407, column: 24, scope: !4894)
!4926 = !DILocation(line: 1407, column: 5, scope: !4894)
!4927 = !DILocation(line: 1408, column: 21, scope: !4894)
!4928 = !DILocation(line: 1408, column: 24, scope: !4894)
!4929 = !DILocation(line: 1408, column: 5, scope: !4894)
!4930 = !DILocation(line: 1410, column: 27, scope: !4894)
!4931 = !DILocation(line: 1410, column: 35, scope: !4894)
!4932 = !DILocation(line: 1410, column: 43, scope: !4894)
!4933 = !DILocation(line: 1410, column: 5, scope: !4894)
!4934 = !DILocation(line: 1411, column: 33, scope: !4894)
!4935 = !DILocation(line: 1411, column: 41, scope: !4894)
!4936 = !DILocation(line: 1411, column: 5, scope: !4894)
!4937 = !DILocation(line: 1413, column: 67, scope: !4894)
!4938 = !DILocation(line: 1413, column: 65, scope: !4894)
!4939 = !DILocation(line: 1413, column: 69, scope: !4894)
!4940 = !DILocation(line: 1413, column: 36, scope: !4894)
!4941 = !DILocation(line: 1413, column: 10, scope: !4894)
!4942 = !DILocation(line: 1423, column: 39, scope: !4894)
!4943 = !DILocation(line: 1423, column: 30, scope: !4894)
!4944 = !DILocation(line: 1423, column: 47, scope: !4894)
!4945 = !DILocation(line: 1423, column: 53, scope: !4894)
!4946 = !DILocation(line: 1423, column: 62, scope: !4894)
!4947 = !DILocation(line: 1423, column: 73, scope: !4894)
!4948 = !DILocation(line: 1423, column: 105, scope: !4894)
!4949 = !DILocation(line: 1423, column: 104, scope: !4894)
!4950 = !DILocation(line: 1423, column: 77, scope: !4894)
!4951 = !DILocation(line: 1423, column: 107, scope: !4894)
!4952 = !DILocation(line: 1423, column: 6, scope: !4894)
!4953 = !DILocation(line: 1426, column: 9, scope: !4954)
!4954 = distinct !DILexicalBlock(scope: !4894, file: !24, line: 1426, column: 9)
!4955 = !DILocation(line: 1426, column: 11, scope: !4954)
!4956 = !DILocation(line: 1427, column: 45, scope: !4954)
!4957 = !DILocation(line: 1427, column: 30, scope: !4954)
!4958 = !DILocation(line: 1427, column: 48, scope: !4954)
!4959 = !DILocation(line: 1427, column: 60, scope: !4954)
!4960 = !DILocation(line: 1427, column: 6, scope: !4954)
!4961 = !DILocation(line: 1429, column: 59, scope: !4954)
!4962 = !DILocation(line: 1429, column: 44, scope: !4954)
!4963 = !DILocation(line: 1429, column: 62, scope: !4954)
!4964 = !DILocation(line: 1430, column: 6, scope: !4954)
!4965 = !DILocation(line: 1432, column: 6, scope: !4954)
!4966 = !DILocation(line: 1433, column: 6, scope: !4954)
!4967 = !DILocation(line: 1434, column: 6, scope: !4954)
!4968 = !DILocation(line: 1429, column: 6, scope: !4954)
!4969 = !DILocation(line: 1439, column: 4, scope: !4894)
!4970 = !DILocation(line: 1393, column: 34, scope: !4889)
!4971 = !DILocation(line: 1393, column: 4, scope: !4889)
!4972 = distinct !{!4972, !4892, !4973, !1996}
!4973 = !DILocation(line: 1439, column: 4, scope: !4885)
!4974 = !DILocation(line: 1441, column: 23, scope: !4975)
!4975 = distinct !DILexicalBlock(scope: !4771, file: !24, line: 1441, column: 8)
!4976 = !DILocation(line: 1441, column: 8, scope: !4975)
!4977 = !DILocation(line: 1441, column: 26, scope: !4975)
!4978 = !DILocation(line: 1441, column: 31, scope: !4975)
!4979 = !DILocation(line: 1442, column: 20, scope: !4975)
!4980 = !DILocation(line: 1442, column: 5, scope: !4975)
!4981 = !DILocation(line: 1442, column: 23, scope: !4975)
!4982 = !DILocation(line: 1442, column: 30, scope: !4975)
!4983 = !DILocation(line: 1444, column: 3, scope: !4771)
!4984 = !DILocation(line: 1445, column: 2, scope: !4762)
!4985 = !DILocation(line: 1349, column: 34, scope: !4758)
!4986 = !DILocation(line: 1349, column: 2, scope: !4758)
!4987 = distinct !{!4987, !4760, !4988, !1996}
!4988 = !DILocation(line: 1445, column: 2, scope: !4755)
!4989 = !DILocation(line: 1447, column: 1, scope: !4751)
!4990 = distinct !DISubprogram(name: "drop_afterburner_blobs", linkageName: "_Z22drop_afterburner_blobsP6objectiii", scope: !24, file: !24, line: 1451, type: !4991, scopeLine: 1452, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1572)
!4991 = !DISubroutineType(types: !4992)
!4992 = !{null, !1434, !7, !14, !14}
!4993 = !DILocalVariable(name: "obj", arg: 1, scope: !4990, file: !24, line: 1451, type: !1434)
!4994 = !DILocation(line: 1451, column: 37, scope: !4990)
!4995 = !DILocalVariable(name: "count", arg: 2, scope: !4990, file: !24, line: 1451, type: !7)
!4996 = !DILocation(line: 1451, column: 46, scope: !4990)
!4997 = !DILocalVariable(name: "size_scale", arg: 3, scope: !4990, file: !24, line: 1451, type: !14)
!4998 = !DILocation(line: 1451, column: 57, scope: !4990)
!4999 = !DILocalVariable(name: "lifetime", arg: 4, scope: !4990, file: !24, line: 1451, type: !14)
!5000 = !DILocation(line: 1451, column: 73, scope: !4990)
!5001 = !DILocalVariable(name: "pos_left", scope: !4990, file: !24, line: 1453, type: !1451)
!5002 = !DILocation(line: 1453, column: 13, scope: !4990)
!5003 = !DILocalVariable(name: "pos_right", scope: !4990, file: !24, line: 1453, type: !1451)
!5004 = !DILocation(line: 1453, column: 22, scope: !4990)
!5005 = !DILocalVariable(name: "segnum", scope: !4990, file: !24, line: 1454, type: !7)
!5006 = !DILocation(line: 1454, column: 6, scope: !4990)
!5007 = !DILocation(line: 1456, column: 31, scope: !4990)
!5008 = !DILocation(line: 1456, column: 36, scope: !4990)
!5009 = !DILocation(line: 1456, column: 42, scope: !4990)
!5010 = !DILocation(line: 1456, column: 47, scope: !4990)
!5011 = !DILocation(line: 1456, column: 54, scope: !4990)
!5012 = !DILocation(line: 1456, column: 61, scope: !4990)
!5013 = !DILocation(line: 1456, column: 66, scope: !4990)
!5014 = !DILocation(line: 1456, column: 60, scope: !4990)
!5015 = !DILocation(line: 1456, column: 2, scope: !4990)
!5016 = !DILocation(line: 1457, column: 32, scope: !4990)
!5017 = !DILocation(line: 1457, column: 37, scope: !4990)
!5018 = !DILocation(line: 1457, column: 44, scope: !4990)
!5019 = !DILocation(line: 1457, column: 51, scope: !4990)
!5020 = !DILocation(line: 1457, column: 56, scope: !4990)
!5021 = !DILocation(line: 1457, column: 50, scope: !4990)
!5022 = !DILocation(line: 1457, column: 60, scope: !4990)
!5023 = !DILocation(line: 1457, column: 2, scope: !4990)
!5024 = !DILocation(line: 1458, column: 43, scope: !4990)
!5025 = !DILocation(line: 1458, column: 48, scope: !4990)
!5026 = !DILocation(line: 1458, column: 55, scope: !4990)
!5027 = !DILocation(line: 1458, column: 61, scope: !4990)
!5028 = !DILocation(line: 1458, column: 66, scope: !4990)
!5029 = !DILocation(line: 1458, column: 70, scope: !4990)
!5030 = !DILocation(line: 1458, column: 2, scope: !4990)
!5031 = !DILocation(line: 1460, column: 6, scope: !5032)
!5032 = distinct !DILexicalBlock(scope: !4990, file: !24, line: 1460, column: 6)
!5033 = !DILocation(line: 1460, column: 12, scope: !5032)
!5034 = !DILocation(line: 1461, column: 3, scope: !5032)
!5035 = !DILocation(line: 1463, column: 37, scope: !4990)
!5036 = !DILocation(line: 1463, column: 42, scope: !4990)
!5037 = !DILocation(line: 1463, column: 11, scope: !4990)
!5038 = !DILocation(line: 1463, column: 9, scope: !4990)
!5039 = !DILocation(line: 1464, column: 6, scope: !5040)
!5040 = distinct !DILexicalBlock(scope: !4990, file: !24, line: 1464, column: 6)
!5041 = !DILocation(line: 1464, column: 13, scope: !5040)
!5042 = !DILocation(line: 1465, column: 27, scope: !5040)
!5043 = !DILocation(line: 1465, column: 46, scope: !5040)
!5044 = !DILocation(line: 1465, column: 3, scope: !5040)
!5045 = !DILocation(line: 1467, column: 6, scope: !5046)
!5046 = distinct !DILexicalBlock(scope: !4990, file: !24, line: 1467, column: 6)
!5047 = !DILocation(line: 1467, column: 12, scope: !5046)
!5048 = !DILocation(line: 1468, column: 39, scope: !5049)
!5049 = distinct !DILexicalBlock(scope: !5046, file: !24, line: 1467, column: 17)
!5050 = !DILocation(line: 1468, column: 44, scope: !5049)
!5051 = !DILocation(line: 1468, column: 12, scope: !5049)
!5052 = !DILocation(line: 1468, column: 10, scope: !5049)
!5053 = !DILocation(line: 1469, column: 7, scope: !5054)
!5054 = distinct !DILexicalBlock(scope: !5049, file: !24, line: 1469, column: 7)
!5055 = !DILocation(line: 1469, column: 14, scope: !5054)
!5056 = !DILocalVariable(name: "blob_obj", scope: !5057, file: !24, line: 1470, type: !1434)
!5057 = distinct !DILexicalBlock(scope: !5054, file: !24, line: 1469, column: 21)
!5058 = !DILocation(line: 1470, column: 12, scope: !5057)
!5059 = !DILocation(line: 1471, column: 39, scope: !5057)
!5060 = !DILocation(line: 1471, column: 59, scope: !5057)
!5061 = !DILocation(line: 1471, column: 15, scope: !5057)
!5062 = !DILocation(line: 1471, column: 13, scope: !5057)
!5063 = !DILocation(line: 1472, column: 8, scope: !5064)
!5064 = distinct !DILexicalBlock(scope: !5057, file: !24, line: 1472, column: 8)
!5065 = !DILocation(line: 1472, column: 17, scope: !5064)
!5066 = !DILocation(line: 1473, column: 26, scope: !5064)
!5067 = !DILocation(line: 1473, column: 5, scope: !5064)
!5068 = !DILocation(line: 1473, column: 15, scope: !5064)
!5069 = !DILocation(line: 1473, column: 24, scope: !5064)
!5070 = !DILocation(line: 1474, column: 3, scope: !5057)
!5071 = !DILocation(line: 1475, column: 2, scope: !5049)
!5072 = !DILocation(line: 1476, column: 1, scope: !4990)
!5073 = distinct !DISubprogram(name: "min<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !173, file: !2323, line: 29, type: !5074, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !5081, retainedNodes: !1572)
!5074 = !DISubroutineType(types: !5075)
!5075 = !{!2326, !2326, !2326, !5076}
!5076 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__less<void, void>", scope: !173, file: !5077, line: 38, size: 8, flags: DIFlagTypePassByValue, elements: !1572, templateParams: !5078, identifier: "_ZTSNSt3__16__lessIvvEE")
!5077 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/comp.h", directory: "")
!5078 = !{!5079, !5080}
!5079 = !DITemplateTypeParameter(name: "_T1", type: null, defaulted: true)
!5080 = !DITemplateTypeParameter(name: "_T2", type: null, defaulted: true)
!5081 = !{!2328, !5082}
!5082 = !DITemplateTypeParameter(name: "_Compare", type: !5076)
!5083 = !DILocalVariable(name: "__a", arg: 1, scope: !5073, file: !2323, line: 29, type: !2326)
!5084 = !DILocation(line: 29, column: 38, scope: !5073)
!5085 = !DILocalVariable(name: "__b", arg: 2, scope: !5073, file: !2323, line: 29, type: !2326)
!5086 = !DILocation(line: 29, column: 76, scope: !5073)
!5087 = !DILocalVariable(name: "__comp", arg: 3, scope: !5073, file: !2323, line: 29, type: !5076)
!5088 = !DILocation(line: 29, column: 90, scope: !5073)
!5089 = !DILocation(line: 30, column: 17, scope: !5073)
!5090 = !DILocation(line: 30, column: 22, scope: !5073)
!5091 = !DILocation(line: 30, column: 10, scope: !5073)
!5092 = !DILocation(line: 30, column: 29, scope: !5073)
!5093 = !DILocation(line: 30, column: 35, scope: !5073)
!5094 = !DILocation(line: 30, column: 3, scope: !5073)
!5095 = distinct !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !5076, file: !5077, line: 40, type: !5096, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !5101, declaration: !5100, retainedNodes: !1572)
!5096 = !DISubroutineType(types: !5097)
!5097 = !{!739, !5098, !2326, !2326}
!5098 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5099, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!5099 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5076)
!5100 = !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !5076, file: !5077, line: 40, type: !5096, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !5101)
!5101 = !{!2328, !5102}
!5102 = !DITemplateTypeParameter(name: "_Up", type: !7)
!5103 = !DILocalVariable(name: "this", arg: 1, scope: !5095, type: !5104, flags: DIFlagArtificial | DIFlagObjectPointer)
!5104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5099, size: 64)
!5105 = !DILocation(line: 0, scope: !5095)
!5106 = !DILocalVariable(name: "__lhs", arg: 2, scope: !5095, file: !5077, line: 40, type: !2326)
!5107 = !DILocation(line: 40, column: 82, scope: !5095)
!5108 = !DILocalVariable(name: "__rhs", arg: 3, scope: !5095, file: !5077, line: 40, type: !2326)
!5109 = !DILocation(line: 40, column: 100, scope: !5095)
!5110 = !DILocation(line: 41, column: 12, scope: !5095)
!5111 = !DILocation(line: 41, column: 20, scope: !5095)
!5112 = !DILocation(line: 41, column: 18, scope: !5095)
!5113 = !DILocation(line: 41, column: 5, scope: !5095)
