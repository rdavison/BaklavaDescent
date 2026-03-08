; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/collide.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/collide.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%struct.vms_vector = type { i32, i32, i32 }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.wall = type { i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.tmap_info = type { i8, [3 x i8], i32, i32, i16, i16, i16, i16 }
%struct.eclip = type { %struct.vclip, i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.bitmap_index = type { i16 }
%struct._grs_bitmap = type { i16, i16, i16, i16, i8, i8, i16, ptr, i16, i8, i8 }
%struct.weapon_info = type { i8, i8, i16, i16, i8, i8, i16, i8, i8, i16, i8, i8, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32, %struct.bitmap_index, i32, i32, i32, [5 x i32], [5 x i32], i32, i32, i32, i32, i32, i32, i32, %struct.bitmap_index, %struct.bitmap_index }
%struct.polymodel = type { i32, i32, ptr, [10 x i32], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x i32], [10 x i8], [10 x %struct.vms_vector], [10 x %struct.vms_vector], %struct.vms_vector, %struct.vms_vector, i32, i8, i16, i8 }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }
%"struct.std::__1::__less" = type { i8 }
%struct.powerup_info_s = type { i32, i32, i32 }

@Ai_local_info = external global [350 x %struct.ai_local], align 4
@Objects = external global [0 x %struct.object], align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@Segments = external global [0 x %struct.segment], align 4
@Walls = external global [254 x %struct.wall], align 4
@Escort_special_goal = external global i32, align 4
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Monster_mode = global i8 0, align 1, !dbg !0
@ConsoleObject = external global ptr, align 8
@FrameTime = external global i32, align 4
@Difficulty_level = external global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"t->movement_type == MT_PHYSICS\00", align 1, !dbg !23
@.str.1 = private unnamed_addr constant [57 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/collide.cpp\00", align 1, !dbg !31
@force_force = global i32 3276800, align 4, !dbg !36
@TmapInfo = external global [1200 x %struct.tmap_info], align 4
@Last_volatile_scrape_sound_time = global i32 0, align 4, !dbg !38
@.str.2 = private unnamed_addr constant [24 x i8] c"obj->type == OBJ_PLAYER\00", align 1, !dbg !40
@GameTime = external global i32, align 4
@Effects = external global [110 x %struct.eclip], align 4
@GameBitmaps = external global [2620 x %struct._grs_bitmap], align 8
@Textures = external global [1200 x %struct.bitmap_index], align 2
@Newdemo_state = external global i32, align 4
@Vclip = external global [110 x %struct.vclip], align 4
@.str.3 = private unnamed_addr constant [13 x i8] c"bm_num = %d\0A\00", align 1, !dbg !45
@.str.4 = private unnamed_addr constant [47 x i8] c"bm_num != 0 && seg->sides[side].tmap_num2 != 0\00", align 1, !dbg !50
@.str.5 = private unnamed_addr constant [43 x i8] c"db != 0 && seg->sides[side].tmap_num2 != 0\00", align 1, !dbg !55
@Game_mode = external global i32, align 4
@.str.6 = private unnamed_addr constant [62 x i8] c"Parent of omega blob not consistent with object information.\0A\00", align 1, !dbg !60
@.str.7 = private unnamed_addr constant [28 x i8] c"Guided missile dot = %7.3f\0A\00", align 1, !dbg !65
@.str.8 = private unnamed_addr constant [34 x i8] c"Guided missile loses bounciness.\0A\00", align 1, !dbg !70
@Weapon_info = external global [0 x %struct.weapon_info], align 4
@keyd_pressed = external global [0 x i8], align 1
@.str.9 = private unnamed_addr constant [55 x i8] c"Your laser hit at segment = %i, side = %i, level = %i\0A\00", align 1, !dbg !75
@Current_level_num = external global i32, align 4
@.str.10 = private unnamed_addr constant [43 x i8] c"Hit at segment = %i, side = %i, level = %i\00", align 1, !dbg !80
@Last_thief_hit_time = global i32 0, align 4, !dbg !82
@CurrentLogicVersion = external global i32, align 4
@Control_center_destroyed = external global i32, align 4
@Highest_object_index = external global i32, align 4
@.str.11 = private unnamed_addr constant [64 x i8] c"Damage to control center by object of type %i prevented by MK!\0A\00", align 1, !dbg !84
@Control_center_been_hit = external global i32, align 4
@.str.12 = private unnamed_addr constant [26 x i8] c"Collided with marker %d!\0A\00", align 1, !dbg !89
@.str.13 = private unnamed_addr constant [14 x i8] c"MARKER %s: %s\00", align 1, !dbg !94
@MarkerMessage = external global [16 x [40 x i8]], align 1
@.str.14 = private unnamed_addr constant [14 x i8] c"MARKER %d: %s\00", align 1, !dbg !99
@.str.15 = private unnamed_addr constant [10 x i8] c"MARKER %d\00", align 1, !dbg !101
@Final_boss_is_dead = global i32 0, align 4, !dbg !106
@Final_boss_countdown_time = global i32 0, align 4, !dbg !108
@gr_palette = external global [768 x i8], align 1
@Player_is_dead = external global i32, align 4
@.str.16 = private unnamed_addr constant [14 x i8] c"Nice job, %s!\00", align 1, !dbg !110
@Boss_hit_time = external global i32, align 4
@Current_mission_num = external global i32, align 4
@Last_level = external global i32, align 4
@Stolen_items = external global [10 x i8], align 1
@Boss_invulnerable_dot = global i32 0, align 4, !dbg !112
@Buddy_gave_hint_count = global i32 5, align 4, !dbg !114
@Last_time_buddy_gave_hint = global i32 0, align 4, !dbg !116
@.str.17 = private unnamed_addr constant [56 x i8] c"(d2_boss_index >= 0) && (d2_boss_index < NUM_D2_BOSSES)\00", align 1, !dbg !118
@Boss_spews_bots_matter = external global [8 x i8], align 1
@Boss_spews_bots_energy = external global [8 x i8], align 1
@Boss_spew_more = external global [8 x i8], align 1
@Gate_interval = external global i32, align 4
@Last_gate_time = external global i32, align 4
@Boss_invulnerable_spot = external global [8 x i8], align 1
@.str.18 = private unnamed_addr constant [26 x i8] c"Boss hit vec dot = %7.3f\0A\00", align 1, !dbg !123
@.str.19 = private unnamed_addr constant [21 x i8] c"Hit him in the back!\00", align 1, !dbg !125
@.str.20 = private unnamed_addr constant [25 x i8] c"He's invulnerable there!\00", align 1, !dbg !130
@.str.21 = private unnamed_addr constant [25 x i8] c"Get behind him and fire!\00", align 1, !dbg !135
@.str.22 = private unnamed_addr constant [22 x i8] c"Hit the glowing spot!\00", align 1, !dbg !137
@Polygon_models = external global [0 x %struct.polymodel], align 8
@Boss_invulnerable_matter = external global [8 x i8], align 1
@Boss_invulnerable_energy = external global [8 x i8], align 1
@Robots_kill_robots_cheat = external global i32, align 4
@Weapon_is_energy = external global [70 x i8], align 1
@Primary_weapon_to_powerup = external global [10 x i8], align 1
@Secondary_weapon_to_powerup = external global [10 x i8], align 1
@.str.23 = private unnamed_addr constant [30 x i8] c"HOARD MODE: Dropping %d orbs\0A\00", align 1, !dbg !142
@Omega_charge = external global i32, align 4
@.str.24 = private unnamed_addr constant [47 x i8] c"Surprising amount of vulcan ammo: %i bullets.\0A\00", align 1, !dbg !147
@Endlevel_sequence = external global i32, align 4
@Buddy_objnum = external global i32, align 4
@Buddy_sorry_time = external global i32, align 4
@CollisionResult = external global [16 x [16 x i8]], align 1
@.str.25 = private unnamed_addr constant [35 x i8] c"A object of type NONE hit a wall!\0A\00", align 1, !dbg !149
@.str.26 = private unnamed_addr constant [45 x i8] c"Unhandled object type hit wall in collide.c\0A\00", align 1, !dbg !154

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22collide_robot_and_wallP6objectissP10vms_vector(ptr noundef %0, i32 noundef %1, i16 noundef signext %2, i16 noundef signext %3, ptr noundef %4) #0 !dbg !1464 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !1606, !DIExpression(), !1607)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !1608, !DIExpression(), !1609)
  store i16 %2, ptr %8, align 2
    #dbg_declare(ptr %8, !1610, !DIExpression(), !1611)
  store i16 %3, ptr %9, align 2
    #dbg_declare(ptr %9, !1612, !DIExpression(), !1613)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !1614, !DIExpression(), !1615)
    #dbg_declare(ptr %11, !1616, !DIExpression(), !1641)
  %13 = load ptr, ptr %6, align 8, !dbg !1642
  %14 = ptrtoint ptr %13 to i64, !dbg !1643
  %15 = sub i64 %14, ptrtoint (ptr @Objects to i64), !dbg !1643
  %16 = sdiv exact i64 %15, 268, !dbg !1643
  %17 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %16, !dbg !1644
  store ptr %17, ptr %11, align 8, !dbg !1641
  %18 = load ptr, ptr %6, align 8, !dbg !1645
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !1647
  %20 = load i8, ptr %19, align 1, !dbg !1647
  %21 = zext i8 %20 to i32, !dbg !1645
  %22 = icmp eq i32 %21, 7, !dbg !1648
  br i1 %22, label %47, label %23, !dbg !1649

23:                                               ; preds = %5
  %24 = load ptr, ptr %6, align 8, !dbg !1650
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 22, !dbg !1651
  %26 = getelementptr inbounds nuw %struct.ai_static, ptr %25, i32 0, i32 0, !dbg !1652
  %27 = load i8, ptr %26, align 4, !dbg !1652
  %28 = zext i8 %27 to i32, !dbg !1650
  %29 = icmp eq i32 %28, 131, !dbg !1653
  br i1 %29, label %47, label %30, !dbg !1654

30:                                               ; preds = %23
  %31 = load ptr, ptr %6, align 8, !dbg !1655
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 2, !dbg !1656
  %33 = load i8, ptr %32, align 1, !dbg !1656
  %34 = zext i8 %33 to i64, !dbg !1657
  %35 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %34, !dbg !1657
  %36 = getelementptr inbounds nuw %struct.robot_info, ptr %35, i32 0, i32 37, !dbg !1658
  %37 = load i8, ptr %36, align 1, !dbg !1658
  %38 = sext i8 %37 to i32, !dbg !1657
  %39 = icmp eq i32 %38, 1, !dbg !1659
  br i1 %39, label %47, label %40, !dbg !1660

40:                                               ; preds = %30
  %41 = load ptr, ptr %6, align 8, !dbg !1661
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 22, !dbg !1662
  %43 = getelementptr inbounds nuw %struct.ai_static, ptr %42, i32 0, i32 0, !dbg !1663
  %44 = load i8, ptr %43, align 4, !dbg !1663
  %45 = zext i8 %44 to i32, !dbg !1661
  %46 = icmp eq i32 %45, 132, !dbg !1664
  br i1 %46, label %47, label %215, !dbg !1660

47:                                               ; preds = %40, %30, %23, %5
    #dbg_declare(ptr %12, !1665, !DIExpression(), !1667)
  %48 = load i16, ptr %8, align 2, !dbg !1668
  %49 = sext i16 %48 to i64, !dbg !1669
  %50 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %49, !dbg !1669
  %51 = getelementptr inbounds nuw %struct.segment, ptr %50, i32 0, i32 0, !dbg !1670
  %52 = load i16, ptr %9, align 2, !dbg !1671
  %53 = sext i16 %52 to i64, !dbg !1669
  %54 = getelementptr inbounds [6 x %struct.side], ptr %51, i64 0, i64 %53, !dbg !1669
  %55 = getelementptr inbounds nuw %struct.side, ptr %54, i32 0, i32 2, !dbg !1672
  %56 = load i16, ptr %55, align 2, !dbg !1672
  %57 = sext i16 %56 to i32, !dbg !1669
  store i32 %57, ptr %12, align 4, !dbg !1667
  %58 = load i32, ptr %12, align 4, !dbg !1673
  %59 = icmp ne i32 %58, -1, !dbg !1675
  br i1 %59, label %60, label %214, !dbg !1675

60:                                               ; preds = %47
  %61 = load i32, ptr %12, align 4, !dbg !1676
  %62 = sext i32 %61 to i64, !dbg !1679
  %63 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %62, !dbg !1679
  %64 = getelementptr inbounds nuw %struct.wall, ptr %63, i32 0, i32 4, !dbg !1680
  %65 = load i8, ptr %64, align 4, !dbg !1680
  %66 = zext i8 %65 to i32, !dbg !1679
  %67 = icmp eq i32 %66, 2, !dbg !1681
  br i1 %67, label %68, label %99, !dbg !1682

68:                                               ; preds = %60
  %69 = load i32, ptr %12, align 4, !dbg !1683
  %70 = sext i32 %69 to i64, !dbg !1684
  %71 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %70, !dbg !1684
  %72 = getelementptr inbounds nuw %struct.wall, ptr %71, i32 0, i32 9, !dbg !1685
  %73 = load i8, ptr %72, align 1, !dbg !1685
  %74 = zext i8 %73 to i32, !dbg !1684
  %75 = icmp eq i32 %74, 1, !dbg !1686
  br i1 %75, label %76, label %99, !dbg !1687

76:                                               ; preds = %68
  %77 = load i32, ptr %12, align 4, !dbg !1688
  %78 = sext i32 %77 to i64, !dbg !1689
  %79 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %78, !dbg !1689
  %80 = getelementptr inbounds nuw %struct.wall, ptr %79, i32 0, i32 6, !dbg !1690
  %81 = load i8, ptr %80, align 2, !dbg !1690
  %82 = zext i8 %81 to i32, !dbg !1689
  %83 = icmp eq i32 %82, 0, !dbg !1691
  br i1 %83, label %84, label %99, !dbg !1692

84:                                               ; preds = %76
  %85 = load i32, ptr %12, align 4, !dbg !1693
  %86 = sext i32 %85 to i64, !dbg !1694
  %87 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %86, !dbg !1694
  %88 = getelementptr inbounds nuw %struct.wall, ptr %87, i32 0, i32 5, !dbg !1695
  %89 = load i8, ptr %88, align 1, !dbg !1695
  %90 = zext i8 %89 to i32, !dbg !1694
  %91 = and i32 %90, 8, !dbg !1696
  %92 = icmp ne i32 %91, 0, !dbg !1697
  br i1 %92, label %99, label %93, !dbg !1692

93:                                               ; preds = %84
  %94 = load i16, ptr %8, align 2, !dbg !1698
  %95 = sext i16 %94 to i64, !dbg !1700
  %96 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %95, !dbg !1700
  %97 = load i16, ptr %9, align 2, !dbg !1701
  %98 = sext i16 %97 to i32, !dbg !1701
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %96, i32 noundef %98), !dbg !1702
  br label %213, !dbg !1703

99:                                               ; preds = %84, %76, %68, %60
  %100 = load ptr, ptr %6, align 8, !dbg !1704
  %101 = getelementptr inbounds nuw %struct.object, ptr %100, i32 0, i32 2, !dbg !1706
  %102 = load i8, ptr %101, align 1, !dbg !1706
  %103 = zext i8 %102 to i64, !dbg !1707
  %104 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %103, !dbg !1707
  %105 = getelementptr inbounds nuw %struct.robot_info, ptr %104, i32 0, i32 37, !dbg !1708
  %106 = load i8, ptr %105, align 1, !dbg !1708
  %107 = sext i8 %106 to i32, !dbg !1707
  %108 = icmp eq i32 %107, 1, !dbg !1709
  br i1 %108, label %109, label %172, !dbg !1710

109:                                              ; preds = %99
  %110 = load i32, ptr %12, align 4, !dbg !1711
  %111 = sext i32 %110 to i64, !dbg !1712
  %112 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %111, !dbg !1712
  %113 = getelementptr inbounds nuw %struct.wall, ptr %112, i32 0, i32 4, !dbg !1713
  %114 = load i8, ptr %113, align 4, !dbg !1713
  %115 = zext i8 %114 to i32, !dbg !1712
  %116 = icmp eq i32 %115, 2, !dbg !1714
  br i1 %116, label %117, label %172, !dbg !1710

117:                                              ; preds = %109
  %118 = load ptr, ptr %11, align 8, !dbg !1715
  %119 = getelementptr inbounds nuw %struct.ai_local, ptr %118, i32 0, i32 3, !dbg !1718
  %120 = load i32, ptr %119, align 4, !dbg !1718
  %121 = icmp eq i32 %120, 8, !dbg !1719
  br i1 %121, label %125, label %122, !dbg !1720

122:                                              ; preds = %117
  %123 = load i32, ptr @Escort_special_goal, align 4, !dbg !1721
  %124 = icmp eq i32 %123, 13, !dbg !1722
  br i1 %124, label %125, label %171, !dbg !1720

125:                                              ; preds = %122, %117
  %126 = load i32, ptr %12, align 4, !dbg !1723
  %127 = sext i32 %126 to i64, !dbg !1726
  %128 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %127, !dbg !1726
  %129 = getelementptr inbounds nuw %struct.wall, ptr %128, i32 0, i32 9, !dbg !1727
  %130 = load i8, ptr %129, align 1, !dbg !1727
  %131 = zext i8 %130 to i32, !dbg !1726
  %132 = icmp ne i32 %131, 1, !dbg !1728
  br i1 %132, label %133, label %154, !dbg !1728

133:                                              ; preds = %125
  %134 = load i32, ptr %12, align 4, !dbg !1729
  %135 = sext i32 %134 to i64, !dbg !1732
  %136 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %135, !dbg !1732
  %137 = getelementptr inbounds nuw %struct.wall, ptr %136, i32 0, i32 9, !dbg !1733
  %138 = load i8, ptr %137, align 1, !dbg !1733
  %139 = zext i8 %138 to i32, !dbg !1732
  %140 = load i32, ptr @Player_num, align 4, !dbg !1734
  %141 = sext i32 %140 to i64, !dbg !1735
  %142 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %141, !dbg !1735
  %143 = getelementptr inbounds nuw %struct.player, ptr %142, i32 0, i32 7, !dbg !1736
  %144 = load i32, ptr %143, align 4, !dbg !1736
  %145 = and i32 %139, %144, !dbg !1737
  %146 = icmp ne i32 %145, 0, !dbg !1732
  br i1 %146, label %147, label %153, !dbg !1732

147:                                              ; preds = %133
  %148 = load i16, ptr %8, align 2, !dbg !1738
  %149 = sext i16 %148 to i64, !dbg !1739
  %150 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %149, !dbg !1739
  %151 = load i16, ptr %9, align 2, !dbg !1740
  %152 = sext i16 %151 to i32, !dbg !1740
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %150, i32 noundef %152), !dbg !1741
  br label %153, !dbg !1741

153:                                              ; preds = %147, %133
  br label %170, !dbg !1742

154:                                              ; preds = %125
  %155 = load i32, ptr %12, align 4, !dbg !1743
  %156 = sext i32 %155 to i64, !dbg !1745
  %157 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %156, !dbg !1745
  %158 = getelementptr inbounds nuw %struct.wall, ptr %157, i32 0, i32 5, !dbg !1746
  %159 = load i8, ptr %158, align 1, !dbg !1746
  %160 = zext i8 %159 to i32, !dbg !1745
  %161 = and i32 %160, 8, !dbg !1747
  %162 = icmp ne i32 %161, 0, !dbg !1748
  br i1 %162, label %169, label %163, !dbg !1749

163:                                              ; preds = %154
  %164 = load i16, ptr %8, align 2, !dbg !1750
  %165 = sext i16 %164 to i64, !dbg !1751
  %166 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %165, !dbg !1751
  %167 = load i16, ptr %9, align 2, !dbg !1752
  %168 = sext i16 %167 to i32, !dbg !1752
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %166, i32 noundef %168), !dbg !1753
  br label %169, !dbg !1753

169:                                              ; preds = %163, %154
  br label %170

170:                                              ; preds = %169, %153
  br label %171, !dbg !1754

171:                                              ; preds = %170, %122
  br label %212, !dbg !1755

172:                                              ; preds = %109, %99
  %173 = load ptr, ptr %6, align 8, !dbg !1756
  %174 = getelementptr inbounds nuw %struct.object, ptr %173, i32 0, i32 2, !dbg !1758
  %175 = load i8, ptr %174, align 1, !dbg !1758
  %176 = zext i8 %175 to i64, !dbg !1759
  %177 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %176, !dbg !1759
  %178 = getelementptr inbounds nuw %struct.robot_info, ptr %177, i32 0, i32 40, !dbg !1760
  %179 = load i8, ptr %178, align 4, !dbg !1760
  %180 = icmp ne i8 %179, 0, !dbg !1759
  br i1 %180, label %181, label %211, !dbg !1759

181:                                              ; preds = %172
  %182 = load i32, ptr %12, align 4, !dbg !1761
  %183 = sext i32 %182 to i64, !dbg !1764
  %184 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %183, !dbg !1764
  %185 = getelementptr inbounds nuw %struct.wall, ptr %184, i32 0, i32 9, !dbg !1765
  %186 = load i8, ptr %185, align 1, !dbg !1765
  %187 = zext i8 %186 to i32, !dbg !1764
  %188 = icmp ne i32 %187, 1, !dbg !1766
  br i1 %188, label %189, label %210, !dbg !1766

189:                                              ; preds = %181
  %190 = load i32, ptr %12, align 4, !dbg !1767
  %191 = sext i32 %190 to i64, !dbg !1769
  %192 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %191, !dbg !1769
  %193 = getelementptr inbounds nuw %struct.wall, ptr %192, i32 0, i32 9, !dbg !1770
  %194 = load i8, ptr %193, align 1, !dbg !1770
  %195 = zext i8 %194 to i32, !dbg !1769
  %196 = load i32, ptr @Player_num, align 4, !dbg !1771
  %197 = sext i32 %196 to i64, !dbg !1772
  %198 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %197, !dbg !1772
  %199 = getelementptr inbounds nuw %struct.player, ptr %198, i32 0, i32 7, !dbg !1773
  %200 = load i32, ptr %199, align 4, !dbg !1773
  %201 = and i32 %195, %200, !dbg !1774
  %202 = icmp ne i32 %201, 0, !dbg !1769
  br i1 %202, label %203, label %209, !dbg !1769

203:                                              ; preds = %189
  %204 = load i16, ptr %8, align 2, !dbg !1775
  %205 = sext i16 %204 to i64, !dbg !1776
  %206 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %205, !dbg !1776
  %207 = load i16, ptr %9, align 2, !dbg !1777
  %208 = sext i16 %207 to i32, !dbg !1777
  call void @_Z14wall_open_doorP7segmenti(ptr noundef %206, i32 noundef %208), !dbg !1778
  br label %209, !dbg !1778

209:                                              ; preds = %203, %189
  br label %210, !dbg !1773

210:                                              ; preds = %209, %181
  br label %211, !dbg !1779

211:                                              ; preds = %210, %172
  br label %212

212:                                              ; preds = %211, %171
  br label %213

213:                                              ; preds = %212, %93
  br label %214, !dbg !1780

214:                                              ; preds = %213, %47
  br label %215, !dbg !1781

215:                                              ; preds = %214, %40
  ret void, !dbg !1782
}

declare void @_Z14wall_open_doorP7segmenti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z23apply_damage_to_clutterP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !1783 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1786, !DIExpression(), !1787)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1788, !DIExpression(), !1789)
  %6 = load ptr, ptr %4, align 8, !dbg !1790
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 8, !dbg !1792
  %8 = load i8, ptr %7, align 1, !dbg !1792
  %9 = zext i8 %8 to i32, !dbg !1790
  %10 = and i32 %9, 1, !dbg !1793
  %11 = icmp ne i32 %10, 0, !dbg !1790
  br i1 %11, label %12, label %13, !dbg !1790

12:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !1794
  br label %32, !dbg !1794

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8, !dbg !1795
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 14, !dbg !1797
  %16 = load i32, ptr %15, align 4, !dbg !1797
  %17 = icmp slt i32 %16, 0, !dbg !1798
  br i1 %17, label %18, label %19, !dbg !1798

18:                                               ; preds = %13
  store i32 0, ptr %3, align 4, !dbg !1799
  br label %32, !dbg !1799

19:                                               ; preds = %13
  %20 = load i32, ptr %5, align 4, !dbg !1800
  %21 = load ptr, ptr %4, align 8, !dbg !1801
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 14, !dbg !1802
  %23 = load i32, ptr %22, align 4, !dbg !1803
  %24 = sub nsw i32 %23, %20, !dbg !1803
  store i32 %24, ptr %22, align 4, !dbg !1803
  %25 = load ptr, ptr %4, align 8, !dbg !1804
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 14, !dbg !1806
  %27 = load i32, ptr %26, align 4, !dbg !1806
  %28 = icmp slt i32 %27, 0, !dbg !1807
  br i1 %28, label %29, label %31, !dbg !1807

29:                                               ; preds = %19
  %30 = load ptr, ptr %4, align 8, !dbg !1808
  call void @_Z14explode_objectP6objecti(ptr noundef %30, i32 noundef 0), !dbg !1810
  store i32 1, ptr %3, align 4, !dbg !1811
  br label %32, !dbg !1811

31:                                               ; preds = %19
  store i32 0, ptr %3, align 4, !dbg !1812
  br label %32, !dbg !1812

32:                                               ; preds = %31, %29, %18, %12
  %33 = load i32, ptr %3, align 4, !dbg !1813
  ret i32 %33, !dbg !1813
}

declare void @_Z14explode_objectP6objecti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18apply_force_damageP6objectiS0_(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 !dbg !1814 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1817, !DIExpression(), !1818)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1819, !DIExpression(), !1820)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !1821, !DIExpression(), !1822)
    #dbg_declare(ptr %7, !1823, !DIExpression(), !1824)
    #dbg_declare(ptr %8, !1825, !DIExpression(), !1826)
  %9 = load ptr, ptr %4, align 8, !dbg !1827
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 8, !dbg !1829
  %11 = load i8, ptr %10, align 1, !dbg !1829
  %12 = zext i8 %11 to i32, !dbg !1827
  %13 = and i32 %12, 3, !dbg !1830
  %14 = icmp ne i32 %13, 0, !dbg !1827
  br i1 %14, label %15, label %16, !dbg !1827

15:                                               ; preds = %3
  br label %168, !dbg !1831

16:                                               ; preds = %3
  %17 = load i32, ptr %5, align 4, !dbg !1832
  %18 = load ptr, ptr %4, align 8, !dbg !1833
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 21, !dbg !1834
  %20 = getelementptr inbounds nuw %struct.physics_info, ptr %19, i32 0, i32 2, !dbg !1835
  %21 = load i32, ptr %20, align 4, !dbg !1835
  %22 = call noundef i32 @_Z6fixdivii(i32 noundef %17, i32 noundef %21), !dbg !1836
  %23 = sdiv i32 %22, 8, !dbg !1837
  store i32 %23, ptr %8, align 4, !dbg !1838
  %24 = load ptr, ptr %6, align 8, !dbg !1839
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 1, !dbg !1841
  %26 = load i8, ptr %25, align 4, !dbg !1841
  %27 = zext i8 %26 to i32, !dbg !1839
  %28 = icmp eq i32 %27, 4, !dbg !1842
  br i1 %28, label %29, label %33, !dbg !1843

29:                                               ; preds = %16
  %30 = load i8, ptr @Monster_mode, align 1, !dbg !1844
  %31 = icmp ne i8 %30, 0, !dbg !1844
  br i1 %31, label %32, label %33, !dbg !1843

32:                                               ; preds = %29
  store i32 2147483647, ptr %8, align 4, !dbg !1845
  br label %33, !dbg !1846

33:                                               ; preds = %32, %29, %16
  %34 = load ptr, ptr %4, align 8, !dbg !1847
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 1, !dbg !1848
  %36 = load i8, ptr %35, align 4, !dbg !1848
  %37 = zext i8 %36 to i32, !dbg !1847
  switch i32 %37, label %167 [
    i32 2, label %38
    i32 4, label %124
    i32 11, label %154
    i32 9, label %158
    i32 5, label %166
  ], !dbg !1849

38:                                               ; preds = %33
  %39 = load ptr, ptr %4, align 8, !dbg !1850
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 2, !dbg !1853
  %41 = load i8, ptr %40, align 1, !dbg !1853
  %42 = zext i8 %41 to i64, !dbg !1854
  %43 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %42, !dbg !1854
  %44 = getelementptr inbounds nuw %struct.robot_info, ptr %43, i32 0, i32 31, !dbg !1855
  %45 = load i8, ptr %44, align 1, !dbg !1855
  %46 = sext i8 %45 to i32, !dbg !1854
  %47 = icmp eq i32 %46, 1, !dbg !1856
  br i1 %47, label %48, label %75, !dbg !1856

48:                                               ; preds = %38
  %49 = load ptr, ptr %6, align 8, !dbg !1857
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 1, !dbg !1860
  %51 = load i8, ptr %50, align 4, !dbg !1860
  %52 = zext i8 %51 to i32, !dbg !1857
  %53 = icmp eq i32 %52, 5, !dbg !1861
  br i1 %53, label %54, label %64, !dbg !1861

54:                                               ; preds = %48
  %55 = load ptr, ptr %4, align 8, !dbg !1862
  %56 = load i32, ptr %8, align 4, !dbg !1863
  %57 = sdiv i32 %56, 4, !dbg !1864
  %58 = load ptr, ptr %6, align 8, !dbg !1865
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 22, !dbg !1866
  %60 = getelementptr inbounds nuw %struct.laser_info_s, ptr %59, i32 0, i32 1, !dbg !1867
  %61 = load i16, ptr %60, align 2, !dbg !1867
  %62 = sext i16 %61 to i32, !dbg !1865
  %63 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %55, i32 noundef %57, i32 noundef %62), !dbg !1868
  store i32 %63, ptr %7, align 4, !dbg !1869
  br label %74, !dbg !1870

64:                                               ; preds = %48
  %65 = load ptr, ptr %4, align 8, !dbg !1871
  %66 = load i32, ptr %8, align 4, !dbg !1872
  %67 = sdiv i32 %66, 4, !dbg !1873
  %68 = load ptr, ptr %6, align 8, !dbg !1874
  %69 = ptrtoint ptr %68 to i64, !dbg !1875
  %70 = sub i64 %69, ptrtoint (ptr @Objects to i64), !dbg !1875
  %71 = sdiv exact i64 %70, 268, !dbg !1875
  %72 = trunc i64 %71 to i32, !dbg !1874
  %73 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %65, i32 noundef %67, i32 noundef %72), !dbg !1876
  store i32 %73, ptr %7, align 4, !dbg !1877
  br label %74

74:                                               ; preds = %64, %54
  br label %102, !dbg !1878

75:                                               ; preds = %38
  %76 = load ptr, ptr %6, align 8, !dbg !1879
  %77 = getelementptr inbounds nuw %struct.object, ptr %76, i32 0, i32 1, !dbg !1882
  %78 = load i8, ptr %77, align 4, !dbg !1882
  %79 = zext i8 %78 to i32, !dbg !1879
  %80 = icmp eq i32 %79, 5, !dbg !1883
  br i1 %80, label %81, label %91, !dbg !1883

81:                                               ; preds = %75
  %82 = load ptr, ptr %4, align 8, !dbg !1884
  %83 = load i32, ptr %8, align 4, !dbg !1885
  %84 = sdiv i32 %83, 2, !dbg !1886
  %85 = load ptr, ptr %6, align 8, !dbg !1887
  %86 = getelementptr inbounds nuw %struct.object, ptr %85, i32 0, i32 22, !dbg !1888
  %87 = getelementptr inbounds nuw %struct.laser_info_s, ptr %86, i32 0, i32 1, !dbg !1889
  %88 = load i16, ptr %87, align 2, !dbg !1889
  %89 = sext i16 %88 to i32, !dbg !1887
  %90 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %82, i32 noundef %84, i32 noundef %89), !dbg !1890
  store i32 %90, ptr %7, align 4, !dbg !1891
  br label %101, !dbg !1892

91:                                               ; preds = %75
  %92 = load ptr, ptr %4, align 8, !dbg !1893
  %93 = load i32, ptr %8, align 4, !dbg !1894
  %94 = sdiv i32 %93, 2, !dbg !1895
  %95 = load ptr, ptr %6, align 8, !dbg !1896
  %96 = ptrtoint ptr %95 to i64, !dbg !1897
  %97 = sub i64 %96, ptrtoint (ptr @Objects to i64), !dbg !1897
  %98 = sdiv exact i64 %97, 268, !dbg !1897
  %99 = trunc i64 %98 to i32, !dbg !1896
  %100 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %92, i32 noundef %94, i32 noundef %99), !dbg !1898
  store i32 %100, ptr %7, align 4, !dbg !1899
  br label %101

101:                                              ; preds = %91, %81
  br label %102

102:                                              ; preds = %101, %74
  %103 = load i32, ptr %7, align 4, !dbg !1900
  %104 = icmp ne i32 %103, 0, !dbg !1900
  br i1 %104, label %105, label %123, !dbg !1902

105:                                              ; preds = %102
  %106 = load ptr, ptr %6, align 8, !dbg !1903
  %107 = getelementptr inbounds nuw %struct.object, ptr %106, i32 0, i32 22, !dbg !1904
  %108 = getelementptr inbounds nuw %struct.laser_info_s, ptr %107, i32 0, i32 2, !dbg !1905
  %109 = load i32, ptr %108, align 4, !dbg !1905
  %110 = load ptr, ptr @ConsoleObject, align 8, !dbg !1906
  %111 = getelementptr inbounds nuw %struct.object, ptr %110, i32 0, i32 0, !dbg !1907
  %112 = load i32, ptr %111, align 4, !dbg !1907
  %113 = icmp eq i32 %109, %112, !dbg !1908
  br i1 %113, label %114, label %123, !dbg !1902

114:                                              ; preds = %105
  %115 = load ptr, ptr %4, align 8, !dbg !1909
  %116 = getelementptr inbounds nuw %struct.object, ptr %115, i32 0, i32 2, !dbg !1910
  %117 = load i8, ptr %116, align 1, !dbg !1910
  %118 = zext i8 %117 to i64, !dbg !1911
  %119 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %118, !dbg !1911
  %120 = getelementptr inbounds nuw %struct.robot_info, ptr %119, i32 0, i32 15, !dbg !1912
  %121 = load i16, ptr %120, align 4, !dbg !1912
  %122 = sext i16 %121 to i32, !dbg !1911
  call void @_Z19add_points_to_scorei(i32 noundef %122), !dbg !1913
  br label %123, !dbg !1913

123:                                              ; preds = %114, %105, %102
  br label %168, !dbg !1914

124:                                              ; preds = %33
  %125 = load ptr, ptr %6, align 8, !dbg !1915
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 1, !dbg !1917
  %127 = load i8, ptr %126, align 4, !dbg !1917
  %128 = zext i8 %127 to i32, !dbg !1915
  %129 = icmp eq i32 %128, 2, !dbg !1918
  br i1 %129, label %130, label %144, !dbg !1919

130:                                              ; preds = %124
  %131 = load ptr, ptr %6, align 8, !dbg !1920
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 2, !dbg !1921
  %133 = load i8, ptr %132, align 1, !dbg !1921
  %134 = zext i8 %133 to i64, !dbg !1922
  %135 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %134, !dbg !1922
  %136 = getelementptr inbounds nuw %struct.robot_info, ptr %135, i32 0, i32 31, !dbg !1923
  %137 = load i8, ptr %136, align 1, !dbg !1923
  %138 = icmp ne i8 %137, 0, !dbg !1924
  br i1 %138, label %139, label %144, !dbg !1919

139:                                              ; preds = %130
  %140 = load i32, ptr %8, align 4, !dbg !1925
  %141 = load i32, ptr @FrameTime, align 4, !dbg !1926
  %142 = mul nsw i32 %141, 2, !dbg !1927
  %143 = call noundef i32 @_Z6fixmulii(i32 noundef %140, i32 noundef %142), !dbg !1928
  store i32 %143, ptr %8, align 4, !dbg !1929
  br label %144, !dbg !1930

144:                                              ; preds = %139, %130, %124
  %145 = load i32, ptr @Difficulty_level, align 4, !dbg !1931
  %146 = icmp eq i32 %145, 0, !dbg !1933
  br i1 %146, label %147, label %150, !dbg !1933

147:                                              ; preds = %144
  %148 = load i32, ptr %8, align 4, !dbg !1934
  %149 = sdiv i32 %148, 2, !dbg !1934
  store i32 %149, ptr %8, align 4, !dbg !1934
  br label %150, !dbg !1935

150:                                              ; preds = %147, %144
  %151 = load ptr, ptr %4, align 8, !dbg !1936
  %152 = load ptr, ptr %6, align 8, !dbg !1937
  %153 = load i32, ptr %8, align 4, !dbg !1938
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %151, ptr noundef %152, i32 noundef %153), !dbg !1939
  br label %168, !dbg !1940

154:                                              ; preds = %33
  %155 = load ptr, ptr %4, align 8, !dbg !1941
  %156 = load i32, ptr %8, align 4, !dbg !1942
  %157 = call noundef i32 @_Z23apply_damage_to_clutterP6objecti(ptr noundef %155, i32 noundef %156), !dbg !1943
  br label %168, !dbg !1944

158:                                              ; preds = %33
  %159 = load ptr, ptr %4, align 8, !dbg !1945
  %160 = load i32, ptr %8, align 4, !dbg !1946
  %161 = load ptr, ptr %6, align 8, !dbg !1947
  %162 = ptrtoint ptr %161 to i64, !dbg !1948
  %163 = sub i64 %162, ptrtoint (ptr @Objects to i64), !dbg !1948
  %164 = sdiv exact i64 %163, 268, !dbg !1948
  %165 = trunc i64 %164 to i16, !dbg !1947
  call void @_Z26apply_damage_to_controlcenP6objectis(ptr noundef %159, i32 noundef %160, i16 noundef signext %165), !dbg !1949
  br label %168, !dbg !1950

166:                                              ; preds = %33
  br label %168, !dbg !1951

167:                                              ; preds = %33
  call void @_Z4Int3v(), !dbg !1952
  br label %168, !dbg !1953

168:                                              ; preds = %15, %167, %166, %158, %154, %150, %123
  ret void, !dbg !1954
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #2 !dbg !1955 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !1958, !DIExpression(), !1959)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1960, !DIExpression(), !1961)
  %6 = load i32, ptr %5, align 4, !dbg !1962
  %7 = icmp eq i32 %6, 0, !dbg !1964
  br i1 %7, label %8, label %9, !dbg !1964

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !1965
  br label %17, !dbg !1965

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !1966
  %11 = sext i32 %10 to i64, !dbg !1966
  %12 = shl i64 %11, 16, !dbg !1967
  %13 = load i32, ptr %5, align 4, !dbg !1968
  %14 = sext i32 %13 to i64, !dbg !1968
  %15 = sdiv i64 %12, %14, !dbg !1969
  %16 = trunc i64 %15 to i32, !dbg !1970
  store i32 %16, ptr %3, align 4, !dbg !1971
  br label %17, !dbg !1971

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !1972
  ret i32 %18, !dbg !1972
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1973 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca [10 x i8], align 1
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1976, !DIExpression(), !1977)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !1978, !DIExpression(), !1979)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1980, !DIExpression(), !1981)
    #dbg_declare(ptr %8, !1982, !DIExpression(), !1983)
    #dbg_declare(ptr %9, !1984, !DIExpression(), !1985)
    #dbg_declare(ptr %10, !1986, !DIExpression(), !1988)
  %11 = load ptr, ptr %5, align 8, !dbg !1989
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 8, !dbg !1991
  %13 = load i8, ptr %12, align 1, !dbg !1991
  %14 = zext i8 %13 to i32, !dbg !1989
  %15 = and i32 %14, 1, !dbg !1992
  %16 = icmp ne i32 %15, 0, !dbg !1989
  br i1 %16, label %17, label %18, !dbg !1989

17:                                               ; preds = %3
  store i32 0, ptr %4, align 4, !dbg !1993
  br label %201, !dbg !1993

18:                                               ; preds = %3
  %19 = load ptr, ptr %5, align 8, !dbg !1994
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 14, !dbg !1996
  %21 = load i32, ptr %20, align 4, !dbg !1996
  %22 = icmp slt i32 %21, 0, !dbg !1997
  br i1 %22, label %23, label %24, !dbg !1997

23:                                               ; preds = %18
  store i32 0, ptr %4, align 4, !dbg !1998
  br label %201, !dbg !1998

24:                                               ; preds = %18
  %25 = load ptr, ptr %5, align 8, !dbg !1999
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 2, !dbg !2001
  %27 = load i8, ptr %26, align 1, !dbg !2001
  %28 = zext i8 %27 to i64, !dbg !2002
  %29 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %28, !dbg !2002
  %30 = getelementptr inbounds nuw %struct.robot_info, ptr %29, i32 0, i32 36, !dbg !2003
  %31 = load i8, ptr %30, align 4, !dbg !2003
  %32 = icmp ne i8 %31, 0, !dbg !2002
  br i1 %32, label %33, label %35, !dbg !2002

33:                                               ; preds = %24
  %34 = load i32, ptr @GameTime, align 4, !dbg !2004
  store i32 %34, ptr @Boss_hit_time, align 4, !dbg !2005
  br label %35, !dbg !2006

35:                                               ; preds = %33, %24
  %36 = load ptr, ptr %5, align 8, !dbg !2007
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 2, !dbg !2009
  %38 = load i8, ptr %37, align 1, !dbg !2009
  %39 = zext i8 %38 to i64, !dbg !2010
  %40 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %39, !dbg !2010
  %41 = getelementptr inbounds nuw %struct.robot_info, ptr %40, i32 0, i32 37, !dbg !2011
  %42 = load i8, ptr %41, align 1, !dbg !2011
  %43 = icmp ne i8 %42, 0, !dbg !2010
  br i1 %43, label %44, label %53, !dbg !2010

44:                                               ; preds = %35
  %45 = load i32, ptr @Current_mission_num, align 4, !dbg !2012
  %46 = icmp eq i32 %45, 0, !dbg !2014
  br i1 %46, label %47, label %52, !dbg !2015

47:                                               ; preds = %44
  %48 = load i32, ptr @Current_level_num, align 4, !dbg !2016
  %49 = load i32, ptr @Last_level, align 4, !dbg !2017
  %50 = icmp eq i32 %48, %49, !dbg !2018
  br i1 %50, label %51, label %52, !dbg !2019

51:                                               ; preds = %47
  store i32 0, ptr %4, align 4, !dbg !2020
  br label %201, !dbg !2020

52:                                               ; preds = %47, %44
  br label %53, !dbg !2021

53:                                               ; preds = %52, %35
  %54 = load i32, ptr %6, align 4, !dbg !2022
  %55 = load ptr, ptr %5, align 8, !dbg !2023
  %56 = getelementptr inbounds nuw %struct.object, ptr %55, i32 0, i32 14, !dbg !2024
  %57 = load i32, ptr %56, align 4, !dbg !2025
  %58 = sub nsw i32 %57, %54, !dbg !2025
  store i32 %58, ptr %56, align 4, !dbg !2025
  %59 = load ptr, ptr %5, align 8, !dbg !2026
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 2, !dbg !2028
  %61 = load i8, ptr %60, align 1, !dbg !2028
  %62 = zext i8 %61 to i64, !dbg !2029
  %63 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %62, !dbg !2029
  %64 = getelementptr inbounds nuw %struct.robot_info, ptr %63, i32 0, i32 36, !dbg !2030
  %65 = load i8, ptr %64, align 4, !dbg !2030
  %66 = icmp ne i8 %65, 0, !dbg !2029
  br i1 %66, label %67, label %102, !dbg !2029

67:                                               ; preds = %53
  %68 = load i32, ptr @Current_mission_num, align 4, !dbg !2031
  %69 = icmp eq i32 %68, 0, !dbg !2033
  br i1 %69, label %70, label %101, !dbg !2034

70:                                               ; preds = %67
  %71 = load i32, ptr @Current_level_num, align 4, !dbg !2035
  %72 = load i32, ptr @Last_level, align 4, !dbg !2036
  %73 = icmp eq i32 %71, %72, !dbg !2037
  br i1 %73, label %74, label %101, !dbg !2034

74:                                               ; preds = %70
  %75 = load ptr, ptr %5, align 8, !dbg !2038
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 14, !dbg !2040
  %77 = load i32, ptr %76, align 4, !dbg !2040
  %78 = icmp slt i32 %77, 0, !dbg !2041
  br i1 %78, label %79, label %100, !dbg !2041

79:                                               ; preds = %74
  %80 = load i32, ptr @Game_mode, align 4, !dbg !2042
  %81 = and i32 %80, 38, !dbg !2045
  %82 = icmp ne i32 %81, 0, !dbg !2042
  br i1 %82, label %83, label %84, !dbg !2042

83:                                               ; preds = %79
  br label %99, !dbg !2046

84:                                               ; preds = %79
  %85 = load i32, ptr @Player_num, align 4, !dbg !2048
  %86 = sext i32 %85 to i64, !dbg !2051
  %87 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %86, !dbg !2051
  %88 = getelementptr inbounds nuw %struct.player, ptr %87, i32 0, i32 9, !dbg !2052
  %89 = load i32, ptr %88, align 4, !dbg !2052
  %90 = icmp slt i32 %89, 0, !dbg !2053
  br i1 %90, label %94, label %91, !dbg !2054

91:                                               ; preds = %84
  %92 = load i32, ptr @Player_is_dead, align 4, !dbg !2055
  %93 = icmp ne i32 %92, 0, !dbg !2055
  br i1 %93, label %94, label %97, !dbg !2054

94:                                               ; preds = %91, %84
  %95 = load ptr, ptr %5, align 8, !dbg !2056
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 14, !dbg !2057
  store i32 1, ptr %96, align 4, !dbg !2058
  br label %98, !dbg !2056

97:                                               ; preds = %91
  call void @_Z19do_final_boss_hacksv(), !dbg !2059
  br label %98

98:                                               ; preds = %97, %94
  br label %99

99:                                               ; preds = %98, %83
  br label %100, !dbg !2060

100:                                              ; preds = %99, %74
  br label %101, !dbg !2061

101:                                              ; preds = %100, %70, %67
  br label %102, !dbg !2036

102:                                              ; preds = %101, %53
  %103 = load ptr, ptr %5, align 8, !dbg !2062
  %104 = getelementptr inbounds nuw %struct.object, ptr %103, i32 0, i32 14, !dbg !2064
  %105 = load i32, ptr %104, align 4, !dbg !2064
  %106 = icmp slt i32 %105, 0, !dbg !2065
  br i1 %106, label %107, label %200, !dbg !2065

107:                                              ; preds = %102
  %108 = load i32, ptr @Game_mode, align 4, !dbg !2066
  %109 = and i32 %108, 38, !dbg !2069
  %110 = icmp ne i32 %109, 0, !dbg !2066
  br i1 %110, label %111, label %143, !dbg !2066

111:                                              ; preds = %107
  %112 = load ptr, ptr %5, align 8, !dbg !2070
  %113 = getelementptr inbounds nuw %struct.object, ptr %112, i32 0, i32 2, !dbg !2073
  %114 = load i8, ptr %113, align 1, !dbg !2073
  %115 = zext i8 %114 to i64, !dbg !2074
  %116 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %115, !dbg !2074
  %117 = getelementptr inbounds nuw %struct.robot_info, ptr %116, i32 0, i32 40, !dbg !2075
  %118 = load i8, ptr %117, align 4, !dbg !2075
  %119 = icmp ne i8 %118, 0, !dbg !2074
  br i1 %119, label %120, label %121, !dbg !2074

120:                                              ; preds = %111
  store i8 1, ptr %8, align 1, !dbg !2076
  br label %122, !dbg !2077

121:                                              ; preds = %111
  store i8 0, ptr %8, align 1, !dbg !2078
  br label %122

122:                                              ; preds = %121, %120
  %123 = load i8, ptr %8, align 1, !dbg !2079
  %124 = icmp ne i8 %123, 0, !dbg !2079
  br i1 %124, label %125, label %142, !dbg !2079

125:                                              ; preds = %122
  store i8 0, ptr %9, align 1, !dbg !2081
  br label %126, !dbg !2083

126:                                              ; preds = %138, %125
  %127 = load i8, ptr %9, align 1, !dbg !2084
  %128 = sext i8 %127 to i32, !dbg !2084
  %129 = icmp slt i32 %128, 10, !dbg !2086
  br i1 %129, label %130, label %141, !dbg !2087

130:                                              ; preds = %126
  %131 = load i8, ptr %9, align 1, !dbg !2088
  %132 = sext i8 %131 to i64, !dbg !2089
  %133 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %132, !dbg !2089
  %134 = load i8, ptr %133, align 1, !dbg !2089
  %135 = load i8, ptr %9, align 1, !dbg !2090
  %136 = sext i8 %135 to i64, !dbg !2091
  %137 = getelementptr inbounds [10 x i8], ptr %10, i64 0, i64 %136, !dbg !2091
  store i8 %134, ptr %137, align 1, !dbg !2092
  br label %138, !dbg !2091

138:                                              ; preds = %130
  %139 = load i8, ptr %9, align 1, !dbg !2093
  %140 = add i8 %139, 1, !dbg !2093
  store i8 %140, ptr %9, align 1, !dbg !2093
  br label %126, !dbg !2094, !llvm.loop !2095

141:                                              ; preds = %126
  br label %142, !dbg !2096

142:                                              ; preds = %141, %122
  br label %143, !dbg !2098

143:                                              ; preds = %142, %107
  %144 = load i32, ptr @Player_num, align 4, !dbg !2099
  %145 = sext i32 %144 to i64, !dbg !2100
  %146 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %145, !dbg !2100
  %147 = getelementptr inbounds nuw %struct.player, ptr %146, i32 0, i32 29, !dbg !2101
  %148 = load i16, ptr %147, align 2, !dbg !2102
  %149 = add i16 %148, 1, !dbg !2102
  store i16 %149, ptr %147, align 2, !dbg !2102
  %150 = load i32, ptr @Player_num, align 4, !dbg !2103
  %151 = sext i32 %150 to i64, !dbg !2104
  %152 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %151, !dbg !2104
  %153 = getelementptr inbounds nuw %struct.player, ptr %152, i32 0, i32 30, !dbg !2105
  %154 = load i16, ptr %153, align 4, !dbg !2106
  %155 = add i16 %154, 1, !dbg !2106
  store i16 %155, ptr %153, align 4, !dbg !2106
  %156 = load ptr, ptr %5, align 8, !dbg !2107
  %157 = getelementptr inbounds nuw %struct.object, ptr %156, i32 0, i32 2, !dbg !2109
  %158 = load i8, ptr %157, align 1, !dbg !2109
  %159 = zext i8 %158 to i64, !dbg !2110
  %160 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %159, !dbg !2110
  %161 = getelementptr inbounds nuw %struct.robot_info, ptr %160, i32 0, i32 36, !dbg !2111
  %162 = load i8, ptr %161, align 4, !dbg !2111
  %163 = icmp ne i8 %162, 0, !dbg !2110
  br i1 %163, label %164, label %166, !dbg !2110

164:                                              ; preds = %143
  %165 = load ptr, ptr %5, align 8, !dbg !2112
  call void @_Z25start_boss_death_sequenceP6object(ptr noundef %165), !dbg !2114
  br label %199, !dbg !2115

166:                                              ; preds = %143
  %167 = load ptr, ptr %5, align 8, !dbg !2116
  %168 = getelementptr inbounds nuw %struct.object, ptr %167, i32 0, i32 2, !dbg !2118
  %169 = load i8, ptr %168, align 1, !dbg !2118
  %170 = zext i8 %169 to i64, !dbg !2119
  %171 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %170, !dbg !2119
  %172 = getelementptr inbounds nuw %struct.robot_info, ptr %171, i32 0, i32 43, !dbg !2120
  %173 = load i8, ptr %172, align 1, !dbg !2120
  %174 = icmp ne i8 %173, 0, !dbg !2119
  br i1 %174, label %175, label %177, !dbg !2119

175:                                              ; preds = %166
  %176 = load ptr, ptr %5, align 8, !dbg !2121
  call void @_Z26start_robot_death_sequenceP6object(ptr noundef %176), !dbg !2123
  br label %198, !dbg !2124

177:                                              ; preds = %166
  %178 = load ptr, ptr %5, align 8, !dbg !2125
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 2, !dbg !2128
  %180 = load i8, ptr %179, align 1, !dbg !2128
  %181 = zext i8 %180 to i32, !dbg !2125
  %182 = icmp eq i32 %181, 65, !dbg !2129
  br i1 %182, label %183, label %184, !dbg !2129

183:                                              ; preds = %177
  call void @_Z21special_reactor_stuffv(), !dbg !2130
  br label %184, !dbg !2130

184:                                              ; preds = %183, %177
  %185 = load ptr, ptr %5, align 8, !dbg !2131
  %186 = getelementptr inbounds nuw %struct.object, ptr %185, i32 0, i32 2, !dbg !2133
  %187 = load i8, ptr %186, align 1, !dbg !2133
  %188 = zext i8 %187 to i64, !dbg !2134
  %189 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %188, !dbg !2134
  %190 = getelementptr inbounds nuw %struct.robot_info, ptr %189, i32 0, i32 14, !dbg !2135
  %191 = load i8, ptr %190, align 1, !dbg !2135
  %192 = icmp ne i8 %191, 0, !dbg !2134
  br i1 %192, label %193, label %195, !dbg !2134

193:                                              ; preds = %184
  %194 = load ptr, ptr %5, align 8, !dbg !2136
  call void @_Z14explode_objectP6objecti(ptr noundef %194, i32 noundef 1), !dbg !2137
  br label %197, !dbg !2137

195:                                              ; preds = %184
  %196 = load ptr, ptr %5, align 8, !dbg !2138
  call void @_Z14explode_objectP6objecti(ptr noundef %196, i32 noundef 16384), !dbg !2139
  br label %197

197:                                              ; preds = %195, %193
  br label %198

198:                                              ; preds = %197, %175
  br label %199

199:                                              ; preds = %198, %164
  store i32 1, ptr %4, align 4, !dbg !2140
  br label %201, !dbg !2140

200:                                              ; preds = %102
  store i32 0, ptr %4, align 4, !dbg !2141
  br label %201, !dbg !2141

201:                                              ; preds = %200, %199, %51, %23, %17
  %202 = load i32, ptr %4, align 4, !dbg !2142
  ret i32 %202, !dbg !2142
}

declare void @_Z19add_points_to_scorei(i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #2 !dbg !2143 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2144, !DIExpression(), !2145)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2146, !DIExpression(), !2147)
  %5 = load i32, ptr %3, align 4, !dbg !2148
  %6 = sext i32 %5 to i64, !dbg !2148
  %7 = load i32, ptr %4, align 4, !dbg !2149
  %8 = sext i32 %7 to i64, !dbg !2149
  %9 = mul nsw i64 %6, %8, !dbg !2150
  %10 = ashr i64 %9, 16, !dbg !2151
  %11 = trunc i64 %10 to i32, !dbg !2152
  ret i32 %11, !dbg !2153
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2154 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2157, !DIExpression(), !2158)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2159, !DIExpression(), !2160)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2161, !DIExpression(), !2162)
  %7 = load i32, ptr @Player_is_dead, align 4, !dbg !2163
  %8 = icmp ne i32 %7, 0, !dbg !2163
  br i1 %8, label %9, label %10, !dbg !2163

9:                                                ; preds = %3
  br label %103, !dbg !2165

10:                                               ; preds = %3
  %11 = load i32, ptr @Player_num, align 4, !dbg !2166
  %12 = sext i32 %11 to i64, !dbg !2168
  %13 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %12, !dbg !2168
  %14 = getelementptr inbounds nuw %struct.player, ptr %13, i32 0, i32 7, !dbg !2169
  %15 = load i32, ptr %14, align 4, !dbg !2169
  %16 = and i32 %15, 1, !dbg !2170
  %17 = icmp ne i32 %16, 0, !dbg !2168
  br i1 %17, label %18, label %19, !dbg !2168

18:                                               ; preds = %10
  br label %103, !dbg !2171

19:                                               ; preds = %10
  %20 = load i32, ptr @Endlevel_sequence, align 4, !dbg !2172
  %21 = icmp ne i32 %20, 0, !dbg !2172
  br i1 %21, label %22, label %23, !dbg !2172

22:                                               ; preds = %19
  br label %103, !dbg !2174

23:                                               ; preds = %19
  %24 = load ptr, ptr %4, align 8, !dbg !2175
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 2, !dbg !2177
  %26 = load i8, ptr %25, align 1, !dbg !2177
  %27 = zext i8 %26 to i32, !dbg !2175
  %28 = load i32, ptr @Player_num, align 4, !dbg !2178
  %29 = icmp eq i32 %27, %28, !dbg !2179
  br i1 %29, label %30, label %103, !dbg !2179

30:                                               ; preds = %23
  %31 = load i32, ptr %6, align 4, !dbg !2180
  %32 = load i32, ptr @Player_num, align 4, !dbg !2182
  %33 = sext i32 %32 to i64, !dbg !2183
  %34 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %33, !dbg !2183
  %35 = getelementptr inbounds nuw %struct.player, ptr %34, i32 0, i32 9, !dbg !2184
  %36 = load i32, ptr %35, align 4, !dbg !2185
  %37 = sub nsw i32 %36, %31, !dbg !2185
  store i32 %37, ptr %35, align 4, !dbg !2185
  %38 = load i32, ptr %6, align 4, !dbg !2186
  %39 = call noundef i32 @_Z3f2ii(i32 noundef %38), !dbg !2187
  %40 = mul nsw i32 %39, 4, !dbg !2188
  %41 = load i32, ptr %6, align 4, !dbg !2189
  %42 = sdiv i32 %41, 2, !dbg !2190
  %43 = call noundef i32 @_Z3f2ii(i32 noundef %42), !dbg !2191
  %44 = sub nsw i32 0, %43, !dbg !2192
  %45 = load i32, ptr %6, align 4, !dbg !2193
  %46 = sdiv i32 %45, 2, !dbg !2194
  %47 = call noundef i32 @_Z3f2ii(i32 noundef %46), !dbg !2195
  %48 = sub nsw i32 0, %47, !dbg !2196
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef %40, i32 noundef %44, i32 noundef %48), !dbg !2197
  %49 = load i32, ptr @Player_num, align 4, !dbg !2198
  %50 = sext i32 %49 to i64, !dbg !2200
  %51 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %50, !dbg !2200
  %52 = getelementptr inbounds nuw %struct.player, ptr %51, i32 0, i32 9, !dbg !2201
  %53 = load i32, ptr %52, align 4, !dbg !2201
  %54 = icmp slt i32 %53, 0, !dbg !2202
  br i1 %54, label %55, label %95, !dbg !2202

55:                                               ; preds = %30
  %56 = load ptr, ptr %5, align 8, !dbg !2203
  %57 = ptrtoint ptr %56 to i64, !dbg !2205
  %58 = sub i64 %57, ptrtoint (ptr @Objects to i64), !dbg !2205
  %59 = sdiv exact i64 %58, 268, !dbg !2205
  %60 = trunc i64 %59 to i16, !dbg !2203
  %61 = load i32, ptr @Player_num, align 4, !dbg !2206
  %62 = sext i32 %61 to i64, !dbg !2207
  %63 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %62, !dbg !2207
  %64 = getelementptr inbounds nuw %struct.player, ptr %63, i32 0, i32 14, !dbg !2208
  store i16 %60, ptr %64, align 4, !dbg !2209
  %65 = load ptr, ptr %4, align 8, !dbg !2210
  %66 = getelementptr inbounds nuw %struct.object, ptr %65, i32 0, i32 8, !dbg !2211
  %67 = load i8, ptr %66, align 1, !dbg !2212
  %68 = zext i8 %67 to i32, !dbg !2212
  %69 = or i32 %68, 2, !dbg !2212
  %70 = trunc i32 %69 to i8, !dbg !2212
  store i8 %70, ptr %66, align 1, !dbg !2212
  %71 = load i32, ptr @Buddy_objnum, align 4, !dbg !2213
  %72 = icmp ne i32 %71, -1, !dbg !2215
  br i1 %72, label %73, label %94, !dbg !2215

73:                                               ; preds = %55
  %74 = load ptr, ptr %5, align 8, !dbg !2216
  %75 = icmp ne ptr %74, null, !dbg !2216
  br i1 %75, label %76, label %93, !dbg !2218

76:                                               ; preds = %73
  %77 = load ptr, ptr %5, align 8, !dbg !2219
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 1, !dbg !2220
  %79 = load i8, ptr %78, align 4, !dbg !2220
  %80 = zext i8 %79 to i32, !dbg !2219
  %81 = icmp eq i32 %80, 2, !dbg !2221
  br i1 %81, label %82, label %93, !dbg !2222

82:                                               ; preds = %76
  %83 = load ptr, ptr %5, align 8, !dbg !2223
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 2, !dbg !2224
  %85 = load i8, ptr %84, align 1, !dbg !2224
  %86 = zext i8 %85 to i64, !dbg !2225
  %87 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %86, !dbg !2225
  %88 = getelementptr inbounds nuw %struct.robot_info, ptr %87, i32 0, i32 37, !dbg !2226
  %89 = load i8, ptr %88, align 1, !dbg !2226
  %90 = icmp ne i8 %89, 0, !dbg !2227
  br i1 %90, label %91, label %93, !dbg !2222

91:                                               ; preds = %82
  %92 = load i32, ptr @GameTime, align 4, !dbg !2228
  store i32 %92, ptr @Buddy_sorry_time, align 4, !dbg !2229
  br label %93, !dbg !2230

93:                                               ; preds = %91, %82, %76, %73
  br label %94, !dbg !2231

94:                                               ; preds = %93, %55
  br label %95, !dbg !2232

95:                                               ; preds = %94, %30
  %96 = load i32, ptr @Player_num, align 4, !dbg !2233
  %97 = sext i32 %96 to i64, !dbg !2234
  %98 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %97, !dbg !2234
  %99 = getelementptr inbounds nuw %struct.player, ptr %98, i32 0, i32 9, !dbg !2235
  %100 = load i32, ptr %99, align 4, !dbg !2235
  %101 = load ptr, ptr %4, align 8, !dbg !2236
  %102 = getelementptr inbounds nuw %struct.object, ptr %101, i32 0, i32 14, !dbg !2237
  store i32 %100, ptr %102, align 4, !dbg !2238
  br label %103, !dbg !2239

103:                                              ; preds = %9, %18, %22, %95, %23
  ret void, !dbg !2240
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26apply_damage_to_controlcenP6objectis(ptr noundef %0, i32 noundef %1, i16 noundef signext %2) #0 !dbg !2241 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2244, !DIExpression(), !2245)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2246, !DIExpression(), !2247)
  store i16 %2, ptr %6, align 2
    #dbg_declare(ptr %6, !2248, !DIExpression(), !2249)
    #dbg_declare(ptr %7, !2250, !DIExpression(), !2251)
  %9 = load i16, ptr %6, align 2, !dbg !2252
  %10 = sext i16 %9 to i32, !dbg !2252
  %11 = icmp slt i32 %10, 0, !dbg !2254
  br i1 %11, label %17, label %12, !dbg !2255

12:                                               ; preds = %3
  %13 = load i16, ptr %6, align 2, !dbg !2256
  %14 = sext i16 %13 to i32, !dbg !2256
  %15 = load i32, ptr @Highest_object_index, align 4, !dbg !2257
  %16 = icmp sgt i32 %14, %15, !dbg !2258
  br i1 %16, label %17, label %18, !dbg !2255

17:                                               ; preds = %12, %3
  br label %76, !dbg !2259

18:                                               ; preds = %12
  %19 = load i16, ptr %6, align 2, !dbg !2260
  %20 = sext i16 %19 to i64, !dbg !2261
  %21 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %20, !dbg !2261
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 1, !dbg !2262
  %23 = load i8, ptr %22, align 4, !dbg !2262
  %24 = zext i8 %23 to i32, !dbg !2261
  store i32 %24, ptr %7, align 4, !dbg !2263
  %25 = load i32, ptr %7, align 4, !dbg !2264
  %26 = icmp ne i32 %25, 4, !dbg !2266
  br i1 %26, label %27, label %29, !dbg !2266

27:                                               ; preds = %18
  %28 = load i32, ptr %7, align 4, !dbg !2267
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11, i32 noundef %28), !dbg !2267
  br label %76, !dbg !2269

29:                                               ; preds = %18
  %30 = load i16, ptr %6, align 2, !dbg !2270
  %31 = sext i16 %30 to i64, !dbg !2272
  %32 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %31, !dbg !2272
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 2, !dbg !2273
  %34 = load i8, ptr %33, align 1, !dbg !2273
  %35 = zext i8 %34 to i32, !dbg !2272
  %36 = load i32, ptr @Player_num, align 4, !dbg !2274
  %37 = icmp eq i32 %35, %36, !dbg !2275
  br i1 %37, label %38, label %39, !dbg !2275

38:                                               ; preds = %29
  store i32 1, ptr @Control_center_been_hit, align 4, !dbg !2276
  call void @_Z17ai_do_cloak_stuffv(), !dbg !2278
  br label %39, !dbg !2279

39:                                               ; preds = %38, %29
  %40 = load ptr, ptr %4, align 8, !dbg !2280
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 14, !dbg !2282
  %42 = load i32, ptr %41, align 4, !dbg !2282
  %43 = icmp sge i32 %42, 0, !dbg !2283
  br i1 %43, label %44, label %50, !dbg !2283

44:                                               ; preds = %39
  %45 = load i32, ptr %5, align 4, !dbg !2284
  %46 = load ptr, ptr %4, align 8, !dbg !2285
  %47 = getelementptr inbounds nuw %struct.object, ptr %46, i32 0, i32 14, !dbg !2286
  %48 = load i32, ptr %47, align 4, !dbg !2287
  %49 = sub nsw i32 %48, %45, !dbg !2287
  store i32 %49, ptr %47, align 4, !dbg !2287
  br label %50, !dbg !2285

50:                                               ; preds = %44, %39
  %51 = load ptr, ptr %4, align 8, !dbg !2288
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 14, !dbg !2290
  %53 = load i32, ptr %52, align 4, !dbg !2290
  %54 = icmp slt i32 %53, 0, !dbg !2291
  br i1 %54, label %55, label %76, !dbg !2292

55:                                               ; preds = %50
  %56 = load ptr, ptr %4, align 8, !dbg !2293
  %57 = getelementptr inbounds nuw %struct.object, ptr %56, i32 0, i32 8, !dbg !2294
  %58 = load i8, ptr %57, align 1, !dbg !2294
  %59 = zext i8 %58 to i32, !dbg !2293
  %60 = and i32 %59, 5, !dbg !2295
  %61 = icmp ne i32 %60, 0, !dbg !2296
  br i1 %61, label %76, label %62, !dbg !2292

62:                                               ; preds = %55
    #dbg_declare(ptr %8, !2297, !DIExpression(), !2299)
  %63 = load ptr, ptr %4, align 8, !dbg !2300
  call void @_Z29do_controlcen_destroyed_stuffP6object(ptr noundef %63), !dbg !2301
  %64 = load i32, ptr @Game_mode, align 4, !dbg !2302
  %65 = and i32 %64, 38, !dbg !2304
  %66 = icmp ne i32 %65, 0, !dbg !2305
  br i1 %66, label %68, label %67, !dbg !2306

67:                                               ; preds = %62
  call void @_Z19add_points_to_scorei(i32 noundef 5000), !dbg !2307
  br label %68, !dbg !2307

68:                                               ; preds = %67, %62
  %69 = load ptr, ptr %4, align 8, !dbg !2308
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 9, !dbg !2309
  %71 = load i16, ptr %70, align 2, !dbg !2309
  %72 = load ptr, ptr %4, align 8, !dbg !2310
  %73 = getelementptr inbounds nuw %struct.object, ptr %72, i32 0, i32 11, !dbg !2311
  %74 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 31, i16 noundef signext %71, i16 noundef signext 0, ptr noundef %73, i32 noundef 0, i32 noundef 65536), !dbg !2312
  %75 = load ptr, ptr %4, align 8, !dbg !2313
  call void @_Z14explode_objectP6objecti(ptr noundef %75, i32 noundef 0), !dbg !2314
  br label %76, !dbg !2315

76:                                               ; preds = %17, %27, %68, %55, %50
  ret void, !dbg !2316
}

declare void @_Z4Int3v() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16bump_this_objectP6objectS0_P10vms_vectori(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 !dbg !2317 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2320, !DIExpression(), !2321)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2322, !DIExpression(), !2323)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !2324, !DIExpression(), !2325)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2326, !DIExpression(), !2327)
    #dbg_declare(ptr %9, !2328, !DIExpression(), !2329)
  %12 = load ptr, ptr %5, align 8, !dbg !2330
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 21, !dbg !2332
  %14 = getelementptr inbounds nuw %struct.physics_info, ptr %13, i32 0, i32 8, !dbg !2333
  %15 = load i16, ptr %14, align 2, !dbg !2333
  %16 = zext i16 %15 to i32, !dbg !2330
  %17 = and i32 %16, 32, !dbg !2334
  %18 = icmp ne i32 %17, 0, !dbg !2335
  br i1 %18, label %129, label %19, !dbg !2336

19:                                               ; preds = %4
  %20 = load ptr, ptr %5, align 8, !dbg !2337
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 1, !dbg !2339
  %22 = load i8, ptr %21, align 4, !dbg !2339
  %23 = zext i8 %22 to i32, !dbg !2337
  %24 = icmp eq i32 %23, 4, !dbg !2340
  br i1 %24, label %25, label %65, !dbg !2340

25:                                               ; preds = %19
    #dbg_declare(ptr %10, !2341, !DIExpression(), !2343)
  %26 = load ptr, ptr %7, align 8, !dbg !2344
  %27 = getelementptr inbounds nuw %struct.vms_vector, ptr %26, i32 0, i32 0, !dbg !2345
  %28 = load i32, ptr %27, align 4, !dbg !2345
  %29 = sdiv i32 %28, 4, !dbg !2346
  %30 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !2347
  store i32 %29, ptr %30, align 4, !dbg !2348
  %31 = load ptr, ptr %7, align 8, !dbg !2349
  %32 = getelementptr inbounds nuw %struct.vms_vector, ptr %31, i32 0, i32 1, !dbg !2350
  %33 = load i32, ptr %32, align 4, !dbg !2350
  %34 = sdiv i32 %33, 4, !dbg !2351
  %35 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !2352
  store i32 %34, ptr %35, align 4, !dbg !2353
  %36 = load ptr, ptr %7, align 8, !dbg !2354
  %37 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !2355
  %38 = load i32, ptr %37, align 4, !dbg !2355
  %39 = sdiv i32 %38, 4, !dbg !2356
  %40 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !2357
  store i32 %39, ptr %40, align 4, !dbg !2358
  %41 = load ptr, ptr %5, align 8, !dbg !2359
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %41, ptr noundef %10), !dbg !2360
  %42 = load i32, ptr %8, align 4, !dbg !2361
  %43 = icmp ne i32 %42, 0, !dbg !2361
  br i1 %43, label %44, label %64, !dbg !2363

44:                                               ; preds = %25
  %45 = load ptr, ptr %6, align 8, !dbg !2364
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 1, !dbg !2365
  %47 = load i8, ptr %46, align 4, !dbg !2365
  %48 = zext i8 %47 to i32, !dbg !2364
  %49 = icmp ne i32 %48, 2, !dbg !2366
  br i1 %49, label %59, label %50, !dbg !2367

50:                                               ; preds = %44
  %51 = load ptr, ptr %6, align 8, !dbg !2368
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 2, !dbg !2369
  %53 = load i8, ptr %52, align 1, !dbg !2369
  %54 = zext i8 %53 to i64, !dbg !2370
  %55 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %54, !dbg !2370
  %56 = getelementptr inbounds nuw %struct.robot_info, ptr %55, i32 0, i32 37, !dbg !2371
  %57 = load i8, ptr %56, align 1, !dbg !2371
  %58 = icmp ne i8 %57, 0, !dbg !2370
  br i1 %58, label %64, label %59, !dbg !2363

59:                                               ; preds = %50, %44
  %60 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %10), !dbg !2372
  store i32 %60, ptr %9, align 4, !dbg !2374
  %61 = load ptr, ptr %5, align 8, !dbg !2375
  %62 = load i32, ptr %9, align 4, !dbg !2376
  %63 = load ptr, ptr %6, align 8, !dbg !2377
  call void @_Z18apply_force_damageP6objectiS0_(ptr noundef %61, i32 noundef %62, ptr noundef %63), !dbg !2378
  br label %64, !dbg !2379

64:                                               ; preds = %59, %50, %25
  br label %128, !dbg !2380

65:                                               ; preds = %19
  %66 = load ptr, ptr %5, align 8, !dbg !2381
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 1, !dbg !2383
  %68 = load i8, ptr %67, align 4, !dbg !2383
  %69 = zext i8 %68 to i32, !dbg !2381
  %70 = icmp eq i32 %69, 2, !dbg !2384
  br i1 %70, label %83, label %71, !dbg !2385

71:                                               ; preds = %65
  %72 = load ptr, ptr %5, align 8, !dbg !2386
  %73 = getelementptr inbounds nuw %struct.object, ptr %72, i32 0, i32 1, !dbg !2387
  %74 = load i8, ptr %73, align 4, !dbg !2387
  %75 = zext i8 %74 to i32, !dbg !2386
  %76 = icmp eq i32 %75, 11, !dbg !2388
  br i1 %76, label %83, label %77, !dbg !2389

77:                                               ; preds = %71
  %78 = load ptr, ptr %5, align 8, !dbg !2390
  %79 = getelementptr inbounds nuw %struct.object, ptr %78, i32 0, i32 1, !dbg !2391
  %80 = load i8, ptr %79, align 4, !dbg !2391
  %81 = zext i8 %80 to i32, !dbg !2390
  %82 = icmp eq i32 %81, 9, !dbg !2392
  br i1 %82, label %83, label %127, !dbg !2389

83:                                               ; preds = %77, %71, %65
  %84 = load ptr, ptr %5, align 8, !dbg !2393
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 2, !dbg !2396
  %86 = load i8, ptr %85, align 1, !dbg !2396
  %87 = zext i8 %86 to i64, !dbg !2397
  %88 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %87, !dbg !2397
  %89 = getelementptr inbounds nuw %struct.robot_info, ptr %88, i32 0, i32 36, !dbg !2398
  %90 = load i8, ptr %89, align 4, !dbg !2398
  %91 = icmp ne i8 %90, 0, !dbg !2397
  br i1 %91, label %126, label %92, !dbg !2399

92:                                               ; preds = %83
    #dbg_declare(ptr %11, !2400, !DIExpression(), !2402)
  %93 = load ptr, ptr %7, align 8, !dbg !2403
  %94 = getelementptr inbounds nuw %struct.vms_vector, ptr %93, i32 0, i32 0, !dbg !2404
  %95 = load i32, ptr %94, align 4, !dbg !2404
  %96 = load i32, ptr @Difficulty_level, align 4, !dbg !2405
  %97 = add nsw i32 4, %96, !dbg !2406
  %98 = sdiv i32 %95, %97, !dbg !2407
  %99 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !2408
  store i32 %98, ptr %99, align 4, !dbg !2409
  %100 = load ptr, ptr %7, align 8, !dbg !2410
  %101 = getelementptr inbounds nuw %struct.vms_vector, ptr %100, i32 0, i32 1, !dbg !2411
  %102 = load i32, ptr %101, align 4, !dbg !2411
  %103 = load i32, ptr @Difficulty_level, align 4, !dbg !2412
  %104 = add nsw i32 4, %103, !dbg !2413
  %105 = sdiv i32 %102, %104, !dbg !2414
  %106 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 1, !dbg !2415
  store i32 %105, ptr %106, align 4, !dbg !2416
  %107 = load ptr, ptr %7, align 8, !dbg !2417
  %108 = getelementptr inbounds nuw %struct.vms_vector, ptr %107, i32 0, i32 2, !dbg !2418
  %109 = load i32, ptr %108, align 4, !dbg !2418
  %110 = load i32, ptr @Difficulty_level, align 4, !dbg !2419
  %111 = add nsw i32 4, %110, !dbg !2420
  %112 = sdiv i32 %109, %111, !dbg !2421
  %113 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 2, !dbg !2422
  store i32 %112, ptr %113, align 4, !dbg !2423
  %114 = load ptr, ptr %5, align 8, !dbg !2424
  %115 = load ptr, ptr %7, align 8, !dbg !2425
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %114, ptr noundef %115), !dbg !2426
  %116 = load ptr, ptr %5, align 8, !dbg !2427
  call void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %116, ptr noundef %11), !dbg !2428
  %117 = load i32, ptr %8, align 4, !dbg !2429
  %118 = icmp ne i32 %117, 0, !dbg !2429
  br i1 %118, label %119, label %125, !dbg !2429

119:                                              ; preds = %92
  %120 = load ptr, ptr %7, align 8, !dbg !2431
  %121 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %120), !dbg !2433
  store i32 %121, ptr %9, align 4, !dbg !2434
  %122 = load ptr, ptr %5, align 8, !dbg !2435
  %123 = load i32, ptr %9, align 4, !dbg !2436
  %124 = load ptr, ptr %6, align 8, !dbg !2437
  call void @_Z18apply_force_damageP6objectiS0_(ptr noundef %122, i32 noundef %123, ptr noundef %124), !dbg !2438
  br label %125, !dbg !2439

125:                                              ; preds = %119, %92
  br label %126, !dbg !2440

126:                                              ; preds = %125, %83
  br label %127, !dbg !2441

127:                                              ; preds = %126, %77
  br label %128

128:                                              ; preds = %127, %64
  br label %129, !dbg !2442

129:                                              ; preds = %128, %4
  ret void, !dbg !2443
}

declare void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef) #1

declare void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2444 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.vms_vector, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2447, !DIExpression(), !2448)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2449, !DIExpression(), !2450)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2451, !DIExpression(), !2452)
    #dbg_declare(ptr %7, !2453, !DIExpression(), !2454)
    #dbg_declare(ptr %8, !2455, !DIExpression(), !2456)
    #dbg_declare(ptr %9, !2457, !DIExpression(), !2458)
  store ptr null, ptr %9, align 8, !dbg !2458
  %10 = load ptr, ptr %4, align 8, !dbg !2459
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 6, !dbg !2461
  %12 = load i8, ptr %11, align 1, !dbg !2461
  %13 = zext i8 %12 to i32, !dbg !2459
  %14 = icmp ne i32 %13, 1, !dbg !2462
  br i1 %14, label %15, label %17, !dbg !2462

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8, !dbg !2463
  store ptr %16, ptr %9, align 8, !dbg !2464
  br label %26, !dbg !2465

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8, !dbg !2466
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 6, !dbg !2468
  %20 = load i8, ptr %19, align 1, !dbg !2468
  %21 = zext i8 %20 to i32, !dbg !2466
  %22 = icmp ne i32 %21, 1, !dbg !2469
  br i1 %22, label %23, label %25, !dbg !2469

23:                                               ; preds = %17
  %24 = load ptr, ptr %4, align 8, !dbg !2470
  store ptr %24, ptr %9, align 8, !dbg !2471
  br label %25, !dbg !2472

25:                                               ; preds = %23, %17
  br label %26

26:                                               ; preds = %25, %15
  %27 = load ptr, ptr %9, align 8, !dbg !2473
  %28 = icmp ne ptr %27, null, !dbg !2473
  br i1 %28, label %29, label %46, !dbg !2473

29:                                               ; preds = %26
  %30 = load ptr, ptr %9, align 8, !dbg !2475
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 6, !dbg !2475
  %32 = load i8, ptr %31, align 1, !dbg !2475
  %33 = zext i8 %32 to i32, !dbg !2475
  %34 = icmp eq i32 %33, 1, !dbg !2475
  %35 = zext i1 %34 to i32, !dbg !2475
  call void @_Z7_AssertiPKcS0_i(i32 noundef %35, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 289), !dbg !2475
  %36 = load ptr, ptr %9, align 8, !dbg !2477
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 21, !dbg !2478
  %38 = getelementptr inbounds nuw %struct.physics_info, ptr %37, i32 0, i32 0, !dbg !2479
  %39 = load ptr, ptr %9, align 8, !dbg !2480
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 21, !dbg !2481
  %41 = getelementptr inbounds nuw %struct.physics_info, ptr %40, i32 0, i32 2, !dbg !2482
  %42 = load i32, ptr %41, align 4, !dbg !2482
  %43 = sub nsw i32 0, %42, !dbg !2483
  %44 = call noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef %8, ptr noundef %38, i32 noundef %43), !dbg !2484
  %45 = load ptr, ptr %9, align 8, !dbg !2485
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %45, ptr noundef %8), !dbg !2486
  br label %94, !dbg !2487

46:                                               ; preds = %26
  %47 = load ptr, ptr %4, align 8, !dbg !2488
  %48 = getelementptr inbounds nuw %struct.object, ptr %47, i32 0, i32 21, !dbg !2489
  %49 = getelementptr inbounds nuw %struct.physics_info, ptr %48, i32 0, i32 0, !dbg !2490
  %50 = load ptr, ptr %5, align 8, !dbg !2491
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 21, !dbg !2492
  %52 = getelementptr inbounds nuw %struct.physics_info, ptr %51, i32 0, i32 0, !dbg !2493
  %53 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %49, ptr noundef %52), !dbg !2494
  %54 = load ptr, ptr %4, align 8, !dbg !2495
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 21, !dbg !2496
  %56 = getelementptr inbounds nuw %struct.physics_info, ptr %55, i32 0, i32 2, !dbg !2497
  %57 = load i32, ptr %56, align 4, !dbg !2497
  %58 = load ptr, ptr %5, align 8, !dbg !2498
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 21, !dbg !2499
  %60 = getelementptr inbounds nuw %struct.physics_info, ptr %59, i32 0, i32 2, !dbg !2500
  %61 = load i32, ptr %60, align 4, !dbg !2500
  %62 = call noundef i32 @_Z6fixmulii(i32 noundef %57, i32 noundef %61), !dbg !2501
  %63 = mul nsw i32 2, %62, !dbg !2502
  %64 = load ptr, ptr %4, align 8, !dbg !2503
  %65 = getelementptr inbounds nuw %struct.object, ptr %64, i32 0, i32 21, !dbg !2504
  %66 = getelementptr inbounds nuw %struct.physics_info, ptr %65, i32 0, i32 2, !dbg !2505
  %67 = load i32, ptr %66, align 4, !dbg !2505
  %68 = load ptr, ptr %5, align 8, !dbg !2506
  %69 = getelementptr inbounds nuw %struct.object, ptr %68, i32 0, i32 21, !dbg !2507
  %70 = getelementptr inbounds nuw %struct.physics_info, ptr %69, i32 0, i32 2, !dbg !2508
  %71 = load i32, ptr %70, align 4, !dbg !2508
  %72 = add nsw i32 %67, %71, !dbg !2509
  %73 = call noundef ptr @_Z13vm_vec_scale2P10vms_vectorii(ptr noundef %8, i32 noundef %63, i32 noundef %72), !dbg !2510
  %74 = load ptr, ptr %5, align 8, !dbg !2511
  %75 = load ptr, ptr %4, align 8, !dbg !2512
  %76 = load i32, ptr %6, align 4, !dbg !2513
  call void @_Z16bump_this_objectP6objectS0_P10vms_vectori(ptr noundef %74, ptr noundef %75, ptr noundef %8, i32 noundef %76), !dbg !2514
  br label %77, !dbg !2515

77:                                               ; preds = %46
  %78 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 0, !dbg !2516
  %79 = load i32, ptr %78, align 4, !dbg !2516
  %80 = sub nsw i32 0, %79, !dbg !2516
  %81 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 0, !dbg !2516
  store i32 %80, ptr %81, align 4, !dbg !2516
  %82 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !2516
  %83 = load i32, ptr %82, align 4, !dbg !2516
  %84 = sub nsw i32 0, %83, !dbg !2516
  %85 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !2516
  store i32 %84, ptr %85, align 4, !dbg !2516
  %86 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 2, !dbg !2516
  %87 = load i32, ptr %86, align 4, !dbg !2516
  %88 = sub nsw i32 0, %87, !dbg !2516
  %89 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 2, !dbg !2516
  store i32 %88, ptr %89, align 4, !dbg !2516
  br label %90, !dbg !2516

90:                                               ; preds = %77
  %91 = load ptr, ptr %4, align 8, !dbg !2518
  %92 = load ptr, ptr %5, align 8, !dbg !2519
  %93 = load i32, ptr %6, align 4, !dbg !2520
  call void @_Z16bump_this_objectP6objectS0_P10vms_vectori(ptr noundef %91, ptr noundef %92, ptr noundef %8, i32 noundef %93), !dbg !2521
  br label %94, !dbg !2522

94:                                               ; preds = %90, %29
  ret void, !dbg !2522
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z17vm_vec_copy_scaleP10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z13vm_vec_scale2P10vms_vectorii(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15bump_one_objectP6objectP10vms_vectori(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2523 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2526, !DIExpression(), !2527)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2528, !DIExpression(), !2529)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2530, !DIExpression(), !2531)
    #dbg_declare(ptr %7, !2532, !DIExpression(), !2533)
  %8 = load ptr, ptr %5, align 8, !dbg !2534
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %7, ptr align 4 %8, i64 12, i1 false), !dbg !2535
  %9 = load i32, ptr %6, align 4, !dbg !2536
  %10 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %7, i32 noundef %9), !dbg !2537
  %11 = load ptr, ptr %4, align 8, !dbg !2538
  call void @_Z16phys_apply_forceP6objectP10vms_vector(ptr noundef %11, ptr noundef %7), !dbg !2539
  ret void, !dbg !2540
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23collide_player_and_wallP6objectissP10vms_vector(ptr noundef %0, i32 noundef %1, i16 noundef signext %2, i16 noundef signext %3, ptr noundef %4) #0 !dbg !2541 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8, align 1
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.vms_vector, align 4
  %16 = alloca %struct.vms_vector, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !2542, !DIExpression(), !2543)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !2544, !DIExpression(), !2545)
  store i16 %2, ptr %8, align 2
    #dbg_declare(ptr %8, !2546, !DIExpression(), !2547)
  store i16 %3, ptr %9, align 2
    #dbg_declare(ptr %9, !2548, !DIExpression(), !2549)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !2550, !DIExpression(), !2551)
    #dbg_declare(ptr %11, !2552, !DIExpression(), !2553)
    #dbg_declare(ptr %12, !2554, !DIExpression(), !2555)
  store i8 0, ptr %12, align 1, !dbg !2555
    #dbg_declare(ptr %13, !2556, !DIExpression(), !2557)
    #dbg_declare(ptr %14, !2558, !DIExpression(), !2559)
  %18 = load ptr, ptr %6, align 8, !dbg !2560
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !2562
  %20 = load i8, ptr %19, align 1, !dbg !2562
  %21 = zext i8 %20 to i32, !dbg !2560
  %22 = load i32, ptr @Player_num, align 4, !dbg !2563
  %23 = icmp ne i32 %21, %22, !dbg !2564
  br i1 %23, label %24, label %25, !dbg !2564

24:                                               ; preds = %5
  br label %168, !dbg !2565

25:                                               ; preds = %5
  %26 = load i16, ptr %8, align 2, !dbg !2566
  %27 = sext i16 %26 to i64, !dbg !2567
  %28 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %27, !dbg !2567
  %29 = getelementptr inbounds nuw %struct.segment, ptr %28, i32 0, i32 0, !dbg !2568
  %30 = load i16, ptr %9, align 2, !dbg !2569
  %31 = sext i16 %30 to i64, !dbg !2567
  %32 = getelementptr inbounds [6 x %struct.side], ptr %29, i64 0, i64 %31, !dbg !2567
  %33 = getelementptr inbounds nuw %struct.side, ptr %32, i32 0, i32 3, !dbg !2570
  %34 = load i16, ptr %33, align 4, !dbg !2570
  %35 = sext i16 %34 to i32, !dbg !2567
  store i32 %35, ptr %13, align 4, !dbg !2571
  %36 = load i32, ptr %13, align 4, !dbg !2572
  %37 = sext i32 %36 to i64, !dbg !2574
  %38 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %37, !dbg !2574
  %39 = getelementptr inbounds nuw %struct.tmap_info, ptr %38, i32 0, i32 3, !dbg !2575
  %40 = load i32, ptr %39, align 4, !dbg !2575
  %41 = icmp sgt i32 %40, 0, !dbg !2576
  br i1 %41, label %42, label %43, !dbg !2576

42:                                               ; preds = %25
  br label %168, !dbg !2577

43:                                               ; preds = %25
  %44 = load i32, ptr %13, align 4, !dbg !2578
  %45 = sext i32 %44 to i64, !dbg !2580
  %46 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %45, !dbg !2580
  %47 = getelementptr inbounds nuw %struct.tmap_info, ptr %46, i32 0, i32 0, !dbg !2581
  %48 = load i8, ptr %47, align 4, !dbg !2581
  %49 = zext i8 %48 to i32, !dbg !2580
  %50 = and i32 %49, 4, !dbg !2582
  %51 = icmp ne i32 %50, 0, !dbg !2580
  br i1 %51, label %52, label %69, !dbg !2580

52:                                               ; preds = %43
    #dbg_declare(ptr %15, !2583, !DIExpression(), !2585)
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef 0, i32 noundef 0, i32 noundef 60), !dbg !2586
  %53 = call noundef i32 @_Z6P_Randv(), !dbg !2587
  %54 = sub nsw i32 %53, 16384, !dbg !2588
  %55 = mul nsw i32 40, %54, !dbg !2589
  %56 = getelementptr inbounds nuw %struct.vms_vector, ptr %15, i32 0, i32 0, !dbg !2590
  store i32 %55, ptr %56, align 4, !dbg !2591
  %57 = call noundef i32 @_Z6P_Randv(), !dbg !2592
  %58 = sub nsw i32 %57, 16384, !dbg !2593
  %59 = mul nsw i32 40, %58, !dbg !2594
  %60 = getelementptr inbounds nuw %struct.vms_vector, ptr %15, i32 0, i32 1, !dbg !2595
  store i32 %59, ptr %60, align 4, !dbg !2596
  %61 = call noundef i32 @_Z6P_Randv(), !dbg !2597
  %62 = sub nsw i32 %61, 16384, !dbg !2598
  %63 = mul nsw i32 40, %62, !dbg !2599
  %64 = getelementptr inbounds nuw %struct.vms_vector, ptr %15, i32 0, i32 2, !dbg !2600
  store i32 %63, ptr %64, align 4, !dbg !2601
  %65 = load ptr, ptr %6, align 8, !dbg !2602
  call void @_Z14phys_apply_rotP6objectP10vms_vector(ptr noundef %65, ptr noundef %15), !dbg !2603
  %66 = load i16, ptr %8, align 2, !dbg !2604
  %67 = load ptr, ptr %10, align 8, !dbg !2605
  %68 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 40, i16 noundef signext %66, i16 noundef signext 0, ptr noundef %67, i32 noundef 0, i32 noundef 65536), !dbg !2606
  store i8 1, ptr %12, align 1, !dbg !2607
  br label %81, !dbg !2608

69:                                               ; preds = %43
    #dbg_declare(ptr %16, !2609, !DIExpression(), !2611)
  %70 = load i16, ptr %8, align 2, !dbg !2612
  %71 = sext i16 %70 to i64, !dbg !2613
  %72 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %71, !dbg !2613
  %73 = load i16, ptr %9, align 2, !dbg !2614
  %74 = sext i16 %73 to i32, !dbg !2614
  %75 = load ptr, ptr %6, align 8, !dbg !2615
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 2, !dbg !2616
  %77 = load i8, ptr %76, align 1, !dbg !2616
  %78 = zext i8 %77 to i32, !dbg !2615
  %79 = load ptr, ptr %6, align 8, !dbg !2617
  %80 = call noundef i32 @_Z16wall_hit_processP7segmentiiiP6object(ptr noundef %72, i32 noundef %74, i32 noundef 20, i32 noundef %78, ptr noundef %79), !dbg !2618
  br label %81

81:                                               ; preds = %69, %52
  %82 = load i32, ptr %7, align 4, !dbg !2619
  %83 = sdiv i32 %82, 128, !dbg !2620
  %84 = load i8, ptr %12, align 1, !dbg !2621
  %85 = sext i8 %84 to i32, !dbg !2621
  %86 = mul nsw i32 %85, 8, !dbg !2622
  %87 = add nsw i32 %86, 1, !dbg !2623
  %88 = mul nsw i32 %83, %87, !dbg !2624
  store i32 %88, ptr %11, align 4, !dbg !2625
  %89 = load i16, ptr %8, align 2, !dbg !2626
  %90 = sext i16 %89 to i64, !dbg !2627
  %91 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %90, !dbg !2627
  %92 = getelementptr inbounds nuw %struct.segment, ptr %91, i32 0, i32 0, !dbg !2628
  %93 = load i16, ptr %9, align 2, !dbg !2629
  %94 = sext i16 %93 to i64, !dbg !2627
  %95 = getelementptr inbounds [6 x %struct.side], ptr %92, i64 0, i64 %94, !dbg !2627
  %96 = getelementptr inbounds nuw %struct.side, ptr %95, i32 0, i32 4, !dbg !2630
  %97 = load i16, ptr %96, align 2, !dbg !2630
  %98 = sext i16 %97 to i32, !dbg !2627
  store i32 %98, ptr %14, align 4, !dbg !2631
  %99 = load i32, ptr %13, align 4, !dbg !2632
  %100 = sext i32 %99 to i64, !dbg !2634
  %101 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %100, !dbg !2634
  %102 = getelementptr inbounds nuw %struct.tmap_info, ptr %101, i32 0, i32 0, !dbg !2635
  %103 = load i8, ptr %102, align 4, !dbg !2635
  %104 = zext i8 %103 to i32, !dbg !2634
  %105 = and i32 %104, 3, !dbg !2636
  %106 = icmp ne i32 %105, 0, !dbg !2637
  br i1 %106, label %120, label %107, !dbg !2638

107:                                              ; preds = %81
  %108 = load i32, ptr %14, align 4, !dbg !2639
  %109 = icmp ne i32 %108, 0, !dbg !2639
  br i1 %109, label %110, label %121, !dbg !2640

110:                                              ; preds = %107
  %111 = load i32, ptr %14, align 4, !dbg !2641
  %112 = and i32 %111, 16383, !dbg !2642
  %113 = sext i32 %112 to i64, !dbg !2643
  %114 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %113, !dbg !2643
  %115 = getelementptr inbounds nuw %struct.tmap_info, ptr %114, i32 0, i32 0, !dbg !2644
  %116 = load i8, ptr %115, align 4, !dbg !2644
  %117 = zext i8 %116 to i32, !dbg !2643
  %118 = and i32 %117, 3, !dbg !2645
  %119 = icmp ne i32 %118, 0, !dbg !2646
  br i1 %119, label %120, label %121, !dbg !2638

120:                                              ; preds = %110, %81
  store i32 0, ptr %11, align 4, !dbg !2647
  br label %121, !dbg !2648

121:                                              ; preds = %120, %110, %107
  %122 = load i32, ptr %11, align 4, !dbg !2649
  %123 = icmp sge i32 %122, 21845, !dbg !2651
  br i1 %123, label %124, label %167, !dbg !2651

124:                                              ; preds = %121
    #dbg_declare(ptr %17, !2652, !DIExpression(), !2654)
  %125 = load i32, ptr %7, align 4, !dbg !2655
  %126 = sub nsw i32 %125, 2796160, !dbg !2656
  %127 = sdiv i32 %126, 20, !dbg !2657
  store i32 %127, ptr %17, align 4, !dbg !2658
  %128 = load ptr, ptr %6, align 8, !dbg !2659
  call void @_Z22create_awareness_eventP6objecti(ptr noundef %128, i32 noundef 2), !dbg !2660
  %129 = load i32, ptr %17, align 4, !dbg !2661
  %130 = icmp sgt i32 %129, 65536, !dbg !2663
  br i1 %130, label %131, label %132, !dbg !2663

131:                                              ; preds = %124
  store i32 65536, ptr %17, align 4, !dbg !2664
  br label %132, !dbg !2665

132:                                              ; preds = %131, %124
  %133 = load i32, ptr %17, align 4, !dbg !2666
  %134 = icmp sgt i32 %133, 0, !dbg !2668
  br i1 %134, label %135, label %143, !dbg !2669

135:                                              ; preds = %132
  %136 = load i8, ptr %12, align 1, !dbg !2670
  %137 = icmp ne i8 %136, 0, !dbg !2670
  br i1 %137, label %143, label %138, !dbg !2669

138:                                              ; preds = %135
  %139 = load i16, ptr %8, align 2, !dbg !2671
  %140 = load ptr, ptr %10, align 8, !dbg !2673
  %141 = load i32, ptr %17, align 4, !dbg !2674
  %142 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 70, i16 noundef signext %139, i16 noundef signext 0, ptr noundef %140, i32 noundef 0, i32 noundef %141), !dbg !2675
  br label %143, !dbg !2676

143:                                              ; preds = %138, %135, %132
  %144 = load i32, ptr @Player_num, align 4, !dbg !2677
  %145 = sext i32 %144 to i64, !dbg !2679
  %146 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %145, !dbg !2679
  %147 = getelementptr inbounds nuw %struct.player, ptr %146, i32 0, i32 7, !dbg !2680
  %148 = load i32, ptr %147, align 4, !dbg !2680
  %149 = and i32 %148, 1, !dbg !2681
  %150 = icmp ne i32 %149, 0, !dbg !2682
  br i1 %150, label %166, label %151, !dbg !2683

151:                                              ; preds = %143
  %152 = load i32, ptr @Player_num, align 4, !dbg !2684
  %153 = sext i32 %152 to i64, !dbg !2686
  %154 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %153, !dbg !2686
  %155 = getelementptr inbounds nuw %struct.player, ptr %154, i32 0, i32 9, !dbg !2687
  %156 = load i32, ptr %155, align 4, !dbg !2687
  %157 = icmp sgt i32 %156, 655360, !dbg !2688
  br i1 %157, label %161, label %158, !dbg !2689

158:                                              ; preds = %151
  %159 = load i8, ptr %12, align 1, !dbg !2690
  %160 = icmp ne i8 %159, 0, !dbg !2690
  br i1 %160, label %161, label %165, !dbg !2689

161:                                              ; preds = %158, %151
  %162 = load ptr, ptr %6, align 8, !dbg !2691
  %163 = load ptr, ptr %6, align 8, !dbg !2692
  %164 = load i32, ptr %11, align 4, !dbg !2693
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %162, ptr noundef %163, i32 noundef %164), !dbg !2694
  br label %165, !dbg !2694

165:                                              ; preds = %161, %158
  br label %166, !dbg !2690

166:                                              ; preds = %165, %143
  br label %167, !dbg !2695

167:                                              ; preds = %166, %121
  br label %168, !dbg !2696

168:                                              ; preds = %167, %42, %24
  ret void, !dbg !2697
}

declare void @_Z17PALETTE_FLASH_ADDiii(i32 noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z6P_Randv() #1

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z16wall_hit_processP7segmentiiiP6object(ptr noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #1

declare void @_Z22create_awareness_eventP6objecti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19check_volatile_wallP6objectiiP10vms_vector(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !2698 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !2701, !DIExpression(), !2702)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !2703, !DIExpression(), !2704)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !2705, !DIExpression(), !2706)
  store ptr %3, ptr %9, align 8
    #dbg_declare(ptr %9, !2707, !DIExpression(), !2708)
    #dbg_declare(ptr %10, !2709, !DIExpression(), !2710)
    #dbg_declare(ptr %11, !2711, !DIExpression(), !2712)
    #dbg_declare(ptr %12, !2713, !DIExpression(), !2714)
  %14 = load ptr, ptr %6, align 8, !dbg !2715
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 1, !dbg !2715
  %16 = load i8, ptr %15, align 4, !dbg !2715
  %17 = zext i8 %16 to i32, !dbg !2715
  %18 = icmp eq i32 %17, 4, !dbg !2715
  %19 = zext i1 %18 to i32, !dbg !2715
  call void @_Z7_AssertiPKcS0_i(i32 noundef %19, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 434), !dbg !2715
  %20 = load i32, ptr %7, align 4, !dbg !2716
  %21 = sext i32 %20 to i64, !dbg !2717
  %22 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %21, !dbg !2717
  %23 = getelementptr inbounds nuw %struct.segment, ptr %22, i32 0, i32 0, !dbg !2718
  %24 = load i32, ptr %8, align 4, !dbg !2719
  %25 = sext i32 %24 to i64, !dbg !2717
  %26 = getelementptr inbounds [6 x %struct.side], ptr %23, i64 0, i64 %25, !dbg !2717
  %27 = getelementptr inbounds nuw %struct.side, ptr %26, i32 0, i32 3, !dbg !2720
  %28 = load i16, ptr %27, align 4, !dbg !2720
  %29 = sext i16 %28 to i32, !dbg !2717
  store i32 %29, ptr %10, align 4, !dbg !2721
  %30 = load i32, ptr %10, align 4, !dbg !2722
  %31 = sext i32 %30 to i64, !dbg !2723
  %32 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %31, !dbg !2723
  %33 = getelementptr inbounds nuw %struct.tmap_info, ptr %32, i32 0, i32 3, !dbg !2724
  %34 = load i32, ptr %33, align 4, !dbg !2724
  store i32 %34, ptr %11, align 4, !dbg !2725
  %35 = load i32, ptr %10, align 4, !dbg !2726
  %36 = sext i32 %35 to i64, !dbg !2727
  %37 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %36, !dbg !2727
  %38 = getelementptr inbounds nuw %struct.tmap_info, ptr %37, i32 0, i32 0, !dbg !2728
  %39 = load i8, ptr %38, align 4, !dbg !2728
  %40 = zext i8 %39 to i32, !dbg !2727
  %41 = and i32 %40, 2, !dbg !2729
  store i32 %41, ptr %12, align 4, !dbg !2730
  %42 = load i32, ptr %11, align 4, !dbg !2731
  %43 = icmp sgt i32 %42, 0, !dbg !2733
  br i1 %43, label %47, label %44, !dbg !2734

44:                                               ; preds = %4
  %45 = load i32, ptr %12, align 4, !dbg !2735
  %46 = icmp ne i32 %45, 0, !dbg !2735
  br i1 %46, label %47, label %102, !dbg !2734

47:                                               ; preds = %44, %4
  %48 = load ptr, ptr %6, align 8, !dbg !2736
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 2, !dbg !2739
  %50 = load i8, ptr %49, align 1, !dbg !2739
  %51 = zext i8 %50 to i32, !dbg !2736
  %52 = load i32, ptr @Player_num, align 4, !dbg !2740
  %53 = icmp eq i32 %51, %52, !dbg !2741
  br i1 %53, label %54, label %97, !dbg !2741

54:                                               ; preds = %47
  %55 = load i32, ptr %11, align 4, !dbg !2742
  %56 = icmp sgt i32 %55, 0, !dbg !2745
  br i1 %56, label %57, label %82, !dbg !2745

57:                                               ; preds = %54
    #dbg_declare(ptr %13, !2746, !DIExpression(), !2748)
  %58 = load i32, ptr %11, align 4, !dbg !2749
  %59 = load i32, ptr @FrameTime, align 4, !dbg !2750
  %60 = call noundef i32 @_Z6fixmulii(i32 noundef %58, i32 noundef %59), !dbg !2751
  store i32 %60, ptr %13, align 4, !dbg !2748
  %61 = load i32, ptr @Difficulty_level, align 4, !dbg !2752
  %62 = icmp eq i32 %61, 0, !dbg !2754
  br i1 %62, label %63, label %66, !dbg !2754

63:                                               ; preds = %57
  %64 = load i32, ptr %13, align 4, !dbg !2755
  %65 = sdiv i32 %64, 2, !dbg !2755
  store i32 %65, ptr %13, align 4, !dbg !2755
  br label %66, !dbg !2756

66:                                               ; preds = %63, %57
  %67 = load i32, ptr @Player_num, align 4, !dbg !2757
  %68 = sext i32 %67 to i64, !dbg !2759
  %69 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %68, !dbg !2759
  %70 = getelementptr inbounds nuw %struct.player, ptr %69, i32 0, i32 7, !dbg !2760
  %71 = load i32, ptr %70, align 4, !dbg !2760
  %72 = and i32 %71, 1, !dbg !2761
  %73 = icmp ne i32 %72, 0, !dbg !2762
  br i1 %73, label %78, label %74, !dbg !2763

74:                                               ; preds = %66
  %75 = load ptr, ptr %6, align 8, !dbg !2764
  %76 = load ptr, ptr %6, align 8, !dbg !2765
  %77 = load i32, ptr %13, align 4, !dbg !2766
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %75, ptr noundef %76, i32 noundef %77), !dbg !2767
  br label %78, !dbg !2767

78:                                               ; preds = %74, %66
  %79 = load i32, ptr %13, align 4, !dbg !2768
  %80 = mul nsw i32 %79, 4, !dbg !2769
  %81 = call noundef i32 @_Z3f2ii(i32 noundef %80), !dbg !2770
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef %81, i32 noundef 0, i32 noundef 0), !dbg !2771
  br label %82, !dbg !2772

82:                                               ; preds = %78, %54
  %83 = call noundef i32 @_Z6P_Randv(), !dbg !2773
  %84 = sub nsw i32 %83, 16384, !dbg !2774
  %85 = sdiv i32 %84, 2, !dbg !2775
  %86 = load ptr, ptr %6, align 8, !dbg !2776
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 21, !dbg !2777
  %88 = getelementptr inbounds nuw %struct.physics_info, ptr %87, i32 0, i32 5, !dbg !2778
  %89 = getelementptr inbounds nuw %struct.vms_vector, ptr %88, i32 0, i32 0, !dbg !2779
  store i32 %85, ptr %89, align 4, !dbg !2780
  %90 = call noundef i32 @_Z6P_Randv(), !dbg !2781
  %91 = sub nsw i32 %90, 16384, !dbg !2782
  %92 = sdiv i32 %91, 2, !dbg !2783
  %93 = load ptr, ptr %6, align 8, !dbg !2784
  %94 = getelementptr inbounds nuw %struct.object, ptr %93, i32 0, i32 21, !dbg !2785
  %95 = getelementptr inbounds nuw %struct.physics_info, ptr %94, i32 0, i32 5, !dbg !2786
  %96 = getelementptr inbounds nuw %struct.vms_vector, ptr %95, i32 0, i32 2, !dbg !2787
  store i32 %92, ptr %96, align 4, !dbg !2788
  br label %97, !dbg !2789

97:                                               ; preds = %82, %47
  %98 = load i32, ptr %11, align 4, !dbg !2790
  %99 = icmp sgt i32 %98, 0, !dbg !2791
  %100 = zext i1 %99 to i64, !dbg !2792
  %101 = select i1 %99, i32 1, i32 2, !dbg !2792
  store i32 %101, ptr %5, align 4, !dbg !2793
  br label %103, !dbg !2793

102:                                              ; preds = %44
  store i32 0, ptr %5, align 4, !dbg !2794
  br label %103, !dbg !2794

103:                                              ; preds = %102, %97
  %104 = load i32, ptr %5, align 4, !dbg !2796
  ret i32 %104, !dbg !2796
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #2 !dbg !2797 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2800, !DIExpression(), !2801)
  %3 = load i32, ptr %2, align 4, !dbg !2802
  %4 = ashr i32 %3, 16, !dbg !2803
  ret i32 %4, !dbg !2804
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21scrape_object_on_wallP6objectssP10vms_vector(ptr noundef %0, i16 noundef signext %1, i16 noundef signext %2, ptr noundef %3) #0 !dbg !2805 {
  %5 = alloca ptr, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2808, !DIExpression(), !2809)
  store i16 %1, ptr %6, align 2
    #dbg_declare(ptr %6, !2810, !DIExpression(), !2811)
  store i16 %2, ptr %7, align 2
    #dbg_declare(ptr %7, !2812, !DIExpression(), !2813)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !2814, !DIExpression(), !2815)
  %13 = load ptr, ptr %5, align 8, !dbg !2816
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 1, !dbg !2817
  %15 = load i8, ptr %14, align 4, !dbg !2817
  %16 = zext i8 %15 to i32, !dbg !2816
  switch i32 %16, label %77 [
    i32 4, label %17
    i32 5, label %67
    i32 8, label %72
  ], !dbg !2818

17:                                               ; preds = %4
  %18 = load ptr, ptr %5, align 8, !dbg !2819
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !2822
  %20 = load i8, ptr %19, align 1, !dbg !2822
  %21 = zext i8 %20 to i32, !dbg !2819
  %22 = load i32, ptr @Player_num, align 4, !dbg !2823
  %23 = icmp eq i32 %21, %22, !dbg !2824
  br i1 %23, label %24, label %66, !dbg !2824

24:                                               ; preds = %17
    #dbg_declare(ptr %9, !2825, !DIExpression(), !2827)
  %25 = load ptr, ptr %5, align 8, !dbg !2828
  %26 = load i16, ptr %6, align 2, !dbg !2830
  %27 = sext i16 %26 to i32, !dbg !2830
  %28 = load i16, ptr %7, align 2, !dbg !2831
  %29 = sext i16 %28 to i32, !dbg !2831
  %30 = load ptr, ptr %8, align 8, !dbg !2832
  %31 = call noundef i32 @_Z19check_volatile_wallP6objectiiP10vms_vector(ptr noundef %25, i32 noundef %27, i32 noundef %29, ptr noundef %30), !dbg !2833
  store i32 %31, ptr %9, align 4, !dbg !2834
  %32 = icmp ne i32 %31, 0, !dbg !2835
  br i1 %32, label %33, label %65, !dbg !2835

33:                                               ; preds = %24
    #dbg_declare(ptr %10, !2836, !DIExpression(), !2838)
    #dbg_declare(ptr %11, !2839, !DIExpression(), !2840)
  %34 = load i32, ptr @GameTime, align 4, !dbg !2841
  %35 = load i32, ptr @Last_volatile_scrape_sound_time, align 4, !dbg !2843
  %36 = add nsw i32 %35, 16384, !dbg !2844
  %37 = icmp sgt i32 %34, %36, !dbg !2845
  br i1 %37, label %42, label %38, !dbg !2846

38:                                               ; preds = %33
  %39 = load i32, ptr @GameTime, align 4, !dbg !2847
  %40 = load i32, ptr @Last_volatile_scrape_sound_time, align 4, !dbg !2848
  %41 = icmp slt i32 %39, %40, !dbg !2849
  br i1 %41, label %42, label %52, !dbg !2846

42:                                               ; preds = %38, %33
    #dbg_declare(ptr %12, !2850, !DIExpression(), !2852)
  %43 = load i32, ptr %9, align 4, !dbg !2853
  %44 = icmp eq i32 %43, 1, !dbg !2854
  %45 = zext i1 %44 to i64, !dbg !2855
  %46 = select i1 %44, i32 151, i32 152, !dbg !2855
  store i32 %46, ptr %12, align 4, !dbg !2852
  %47 = load i32, ptr @GameTime, align 4, !dbg !2856
  store i32 %47, ptr @Last_volatile_scrape_sound_time, align 4, !dbg !2857
  %48 = load i32, ptr %12, align 4, !dbg !2858
  %49 = load i16, ptr %6, align 2, !dbg !2859
  %50 = load ptr, ptr %8, align 8, !dbg !2860
  %51 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %48, i16 noundef signext %49, i16 noundef signext 0, ptr noundef %50, i32 noundef 0, i32 noundef 65536), !dbg !2861
  br label %52, !dbg !2862

52:                                               ; preds = %42, %38
  %53 = load i16, ptr %6, align 2, !dbg !2863
  %54 = sext i16 %53 to i64, !dbg !2864
  %55 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %54, !dbg !2864
  %56 = getelementptr inbounds nuw %struct.segment, ptr %55, i32 0, i32 0, !dbg !2865
  %57 = load i16, ptr %7, align 2, !dbg !2866
  %58 = sext i16 %57 to i64, !dbg !2864
  %59 = getelementptr inbounds [6 x %struct.side], ptr %56, i64 0, i64 %58, !dbg !2864
  %60 = getelementptr inbounds nuw %struct.side, ptr %59, i32 0, i32 6, !dbg !2867
  %61 = getelementptr inbounds [2 x %struct.vms_vector], ptr %60, i64 0, i64 0, !dbg !2864
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 %61, i64 12, i1 false), !dbg !2868
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %11), !dbg !2869
  %62 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %10, ptr noundef %11, i32 noundef 8192), !dbg !2870
  %63 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %10), !dbg !2871
  %64 = load ptr, ptr %5, align 8, !dbg !2872
  call void @_Z15bump_one_objectP6objectP10vms_vectori(ptr noundef %64, ptr noundef %10, i32 noundef 524288), !dbg !2873
  br label %65, !dbg !2874

65:                                               ; preds = %52, %24
  br label %66, !dbg !2875

66:                                               ; preds = %65, %17
  br label %77, !dbg !2876

67:                                               ; preds = %4
  %68 = load ptr, ptr %5, align 8, !dbg !2877
  %69 = load i16, ptr %6, align 2, !dbg !2878
  %70 = load i16, ptr %7, align 2, !dbg !2879
  %71 = load ptr, ptr %8, align 8, !dbg !2880
  call void @_Z23collide_weapon_and_wallP6objectissP10vms_vector(ptr noundef %68, i32 noundef 0, i16 noundef signext %69, i16 noundef signext %70, ptr noundef %71), !dbg !2881
  br label %77, !dbg !2882

72:                                               ; preds = %4
  %73 = load ptr, ptr %5, align 8, !dbg !2883
  %74 = load i16, ptr %6, align 2, !dbg !2884
  %75 = load i16, ptr %7, align 2, !dbg !2885
  %76 = load ptr, ptr %8, align 8, !dbg !2886
  call void @_Z23collide_debris_and_wallP6objectissP10vms_vector(ptr noundef %73, i32 noundef 0, i16 noundef signext %74, i16 noundef signext %75, ptr noundef %76), !dbg !2887
  br label %77, !dbg !2888

77:                                               ; preds = %4, %72, %67, %66
  ret void, !dbg !2889
}

declare void @_Z18make_random_vectorP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23collide_weapon_and_wallP6objectissP10vms_vector(ptr noundef %0, i32 noundef %1, i16 noundef signext %2, i16 noundef signext %3, ptr noundef %4) #0 !dbg !2890 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !2891, !DIExpression(), !2892)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !2893, !DIExpression(), !2894)
  store i16 %2, ptr %8, align 2
    #dbg_declare(ptr %8, !2895, !DIExpression(), !2896)
  store i16 %3, ptr %9, align 2
    #dbg_declare(ptr %9, !2897, !DIExpression(), !2898)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !2899, !DIExpression(), !2900)
    #dbg_declare(ptr %11, !2901, !DIExpression(), !2940)
  %20 = load i16, ptr %8, align 2, !dbg !2941
  %21 = sext i16 %20 to i64, !dbg !2942
  %22 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %21, !dbg !2942
  store ptr %22, ptr %11, align 8, !dbg !2940
    #dbg_declare(ptr %12, !2943, !DIExpression(), !2944)
    #dbg_declare(ptr %13, !2945, !DIExpression(), !2946)
    #dbg_declare(ptr %14, !2947, !DIExpression(), !2948)
    #dbg_declare(ptr %15, !2949, !DIExpression(), !2950)
  %23 = load ptr, ptr %6, align 8, !dbg !2951
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 2, !dbg !2953
  %25 = load i8, ptr %24, align 1, !dbg !2953
  %26 = zext i8 %25 to i32, !dbg !2951
  %27 = icmp eq i32 %26, 35, !dbg !2954
  br i1 %27, label %28, label %34, !dbg !2954

28:                                               ; preds = %5
  %29 = load ptr, ptr %6, align 8, !dbg !2955
  %30 = call noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %29), !dbg !2957
  %31 = icmp ne i32 %30, 0, !dbg !2957
  br i1 %31, label %33, label %32, !dbg !2958

32:                                               ; preds = %28
  br label %802, !dbg !2959

33:                                               ; preds = %28
  br label %34, !dbg !2960

34:                                               ; preds = %33, %5
  %35 = load ptr, ptr %6, align 8, !dbg !2961
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 2, !dbg !2963
  %37 = load i8, ptr %36, align 1, !dbg !2963
  %38 = zext i8 %37 to i32, !dbg !2961
  %39 = icmp eq i32 %38, 37, !dbg !2964
  br i1 %39, label %40, label %68, !dbg !2964

40:                                               ; preds = %34
    #dbg_declare(ptr %16, !2965, !DIExpression(), !2967)
  %41 = load ptr, ptr %6, align 8, !dbg !2968
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 12, !dbg !2968
  %43 = getelementptr inbounds nuw %struct.vms_matrix, ptr %42, i32 0, i32 2, !dbg !2968
  %44 = load i16, ptr %8, align 2, !dbg !2968
  %45 = sext i16 %44 to i64, !dbg !2968
  %46 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %45, !dbg !2968
  %47 = getelementptr inbounds nuw %struct.segment, ptr %46, i32 0, i32 0, !dbg !2968
  %48 = load i16, ptr %9, align 2, !dbg !2968
  %49 = sext i16 %48 to i64, !dbg !2968
  %50 = getelementptr inbounds [6 x %struct.side], ptr %47, i64 0, i64 %49, !dbg !2968
  %51 = getelementptr inbounds nuw %struct.side, ptr %50, i32 0, i32 6, !dbg !2968
  %52 = getelementptr inbounds [2 x %struct.vms_vector], ptr %51, i64 0, i64 0, !dbg !2968
  %53 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %43, ptr noundef %52), !dbg !2968
  store i32 %53, ptr %16, align 4, !dbg !2969
  %54 = load i32, ptr %16, align 4, !dbg !2970
  %55 = call noundef float @_Z4f2fli(i32 noundef %54), !dbg !2970
  %56 = fpext float %55 to double, !dbg !2970
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.7, double noundef %56), !dbg !2970
  %57 = load i32, ptr %16, align 4, !dbg !2971
  %58 = icmp slt i32 %57, -10922, !dbg !2973
  br i1 %58, label %59, label %67, !dbg !2973

59:                                               ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.8), !dbg !2974
  %60 = load ptr, ptr %6, align 8, !dbg !2976
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 21, !dbg !2977
  %62 = getelementptr inbounds nuw %struct.physics_info, ptr %61, i32 0, i32 8, !dbg !2978
  %63 = load i16, ptr %62, align 2, !dbg !2979
  %64 = zext i16 %63 to i32, !dbg !2979
  %65 = and i32 %64, -5, !dbg !2979
  %66 = trunc i32 %65 to i16, !dbg !2979
  store i16 %66, ptr %62, align 2, !dbg !2979
  br label %67, !dbg !2980

67:                                               ; preds = %59, %40
  br label %68, !dbg !2981

68:                                               ; preds = %67, %34
  %69 = load ptr, ptr %11, align 8, !dbg !2982
  %70 = getelementptr inbounds nuw %struct.segment, ptr %69, i32 0, i32 0, !dbg !2984
  %71 = load i16, ptr %9, align 2, !dbg !2985
  %72 = sext i16 %71 to i64, !dbg !2982
  %73 = getelementptr inbounds [6 x %struct.side], ptr %70, i64 0, i64 %72, !dbg !2982
  %74 = getelementptr inbounds nuw %struct.side, ptr %73, i32 0, i32 3, !dbg !2986
  %75 = load i16, ptr %74, align 4, !dbg !2986
  %76 = sext i16 %75 to i64, !dbg !2987
  %77 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %76, !dbg !2987
  %78 = getelementptr inbounds nuw %struct.tmap_info, ptr %77, i32 0, i32 0, !dbg !2988
  %79 = load i8, ptr %78, align 4, !dbg !2988
  %80 = zext i8 %79 to i32, !dbg !2987
  %81 = and i32 %80, 4, !dbg !2989
  %82 = icmp ne i32 %81, 0, !dbg !2990
  br i1 %82, label %83, label %102, !dbg !2991

83:                                               ; preds = %68
  %84 = load ptr, ptr %6, align 8, !dbg !2992
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 1, !dbg !2993
  %86 = load i8, ptr %85, align 4, !dbg !2993
  %87 = zext i8 %86 to i32, !dbg !2992
  %88 = icmp eq i32 %87, 5, !dbg !2994
  br i1 %88, label %89, label %98, !dbg !2995

89:                                               ; preds = %83
  %90 = load ptr, ptr %6, align 8, !dbg !2996
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 2, !dbg !2997
  %92 = load i8, ptr %91, align 1, !dbg !2997
  %93 = zext i8 %92 to i64, !dbg !2998
  %94 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %93, !dbg !2998
  %95 = getelementptr inbounds nuw %struct.weapon_info, ptr %94, i32 0, i32 22, !dbg !2999
  %96 = load i32, ptr %95, align 4, !dbg !2999
  %97 = icmp eq i32 %96, 0, !dbg !3000
  br i1 %97, label %102, label %98, !dbg !2991

98:                                               ; preds = %89, %83
  %99 = load i16, ptr %8, align 2, !dbg !3001
  %100 = load ptr, ptr %10, align 8, !dbg !3003
  %101 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 41, i16 noundef signext %99, i16 noundef signext 0, ptr noundef %100, i32 noundef 0, i32 noundef 65536), !dbg !3004
  br label %802, !dbg !3005

102:                                              ; preds = %89, %68
  %103 = load i8, ptr getelementptr inbounds ([0 x i8], ptr @keyd_pressed, i64 0, i64 41), align 1, !dbg !3006
  %104 = icmp ne i8 %103, 0, !dbg !3006
  br i1 %104, label %105, label %155, !dbg !3006

105:                                              ; preds = %102
  %106 = load ptr, ptr %6, align 8, !dbg !3008
  %107 = getelementptr inbounds nuw %struct.object, ptr %106, i32 0, i32 22, !dbg !3010
  %108 = getelementptr inbounds nuw %struct.laser_info_s, ptr %107, i32 0, i32 1, !dbg !3011
  %109 = load i16, ptr %108, align 2, !dbg !3011
  %110 = sext i16 %109 to i32, !dbg !3008
  %111 = load i32, ptr @Player_num, align 4, !dbg !3012
  %112 = sext i32 %111 to i64, !dbg !3013
  %113 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %112, !dbg !3013
  %114 = getelementptr inbounds nuw %struct.player, ptr %113, i32 0, i32 4, !dbg !3014
  %115 = load i32, ptr %114, align 4, !dbg !3014
  %116 = icmp eq i32 %110, %115, !dbg !3015
  br i1 %116, label %117, label %154, !dbg !3015

117:                                              ; preds = %105
  %118 = load i16, ptr %8, align 2, !dbg !3016
  %119 = sext i16 %118 to i32, !dbg !3016
  %120 = load i16, ptr %9, align 2, !dbg !3016
  %121 = sext i16 %120 to i32, !dbg !3016
  %122 = load i32, ptr @Current_level_num, align 4, !dbg !3016
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.9, i32 noundef %119, i32 noundef %121, i32 noundef %122), !dbg !3016
  %123 = load i16, ptr %8, align 2, !dbg !3018
  %124 = sext i16 %123 to i32, !dbg !3018
  %125 = load i16, ptr %9, align 2, !dbg !3019
  %126 = sext i16 %125 to i32, !dbg !3019
  %127 = load i32, ptr @Current_level_num, align 4, !dbg !3020
  %128 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.10, i32 noundef %124, i32 noundef %126, i32 noundef %127), !dbg !3021
  %129 = load ptr, ptr %6, align 8, !dbg !3022
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 2, !dbg !3024
  %131 = load i8, ptr %130, align 1, !dbg !3024
  %132 = zext i8 %131 to i32, !dbg !3022
  %133 = icmp slt i32 %132, 4, !dbg !3025
  br i1 %133, label %134, label %140, !dbg !3025

134:                                              ; preds = %117
  %135 = load i16, ptr %8, align 2, !dbg !3026
  %136 = sext i16 %135 to i32, !dbg !3026
  %137 = load i16, ptr %9, align 2, !dbg !3027
  %138 = sext i16 %137 to i32, !dbg !3027
  %139 = call noundef i32 @_Z14subtract_lightii(i32 noundef %136, i32 noundef %138), !dbg !3028
  br label %153, !dbg !3028

140:                                              ; preds = %117
  %141 = load ptr, ptr %6, align 8, !dbg !3029
  %142 = getelementptr inbounds nuw %struct.object, ptr %141, i32 0, i32 2, !dbg !3031
  %143 = load i8, ptr %142, align 1, !dbg !3031
  %144 = zext i8 %143 to i32, !dbg !3029
  %145 = icmp eq i32 %144, 9, !dbg !3032
  br i1 %145, label %146, label %152, !dbg !3032

146:                                              ; preds = %140
  %147 = load i16, ptr %8, align 2, !dbg !3033
  %148 = sext i16 %147 to i32, !dbg !3033
  %149 = load i16, ptr %9, align 2, !dbg !3034
  %150 = sext i16 %149 to i32, !dbg !3034
  %151 = call noundef i32 @_Z9add_lightii(i32 noundef %148, i32 noundef %150), !dbg !3035
  br label %152, !dbg !3035

152:                                              ; preds = %146, %140
  br label %153

153:                                              ; preds = %152, %134
  br label %154, !dbg !3036

154:                                              ; preds = %153, %105
  br label %155, !dbg !3014

155:                                              ; preds = %154, %102
  %156 = load ptr, ptr %6, align 8, !dbg !3037
  %157 = getelementptr inbounds nuw %struct.object, ptr %156, i32 0, i32 21, !dbg !3039
  %158 = getelementptr inbounds nuw %struct.physics_info, ptr %157, i32 0, i32 0, !dbg !3040
  %159 = getelementptr inbounds nuw %struct.vms_vector, ptr %158, i32 0, i32 0, !dbg !3041
  %160 = load i32, ptr %159, align 4, !dbg !3041
  %161 = icmp eq i32 %160, 0, !dbg !3042
  br i1 %161, label %162, label %177, !dbg !3043

162:                                              ; preds = %155
  %163 = load ptr, ptr %6, align 8, !dbg !3044
  %164 = getelementptr inbounds nuw %struct.object, ptr %163, i32 0, i32 21, !dbg !3045
  %165 = getelementptr inbounds nuw %struct.physics_info, ptr %164, i32 0, i32 0, !dbg !3046
  %166 = getelementptr inbounds nuw %struct.vms_vector, ptr %165, i32 0, i32 1, !dbg !3047
  %167 = load i32, ptr %166, align 4, !dbg !3047
  %168 = icmp eq i32 %167, 0, !dbg !3048
  br i1 %168, label %169, label %177, !dbg !3049

169:                                              ; preds = %162
  %170 = load ptr, ptr %6, align 8, !dbg !3050
  %171 = getelementptr inbounds nuw %struct.object, ptr %170, i32 0, i32 21, !dbg !3051
  %172 = getelementptr inbounds nuw %struct.physics_info, ptr %171, i32 0, i32 0, !dbg !3052
  %173 = getelementptr inbounds nuw %struct.vms_vector, ptr %172, i32 0, i32 2, !dbg !3053
  %174 = load i32, ptr %173, align 4, !dbg !3053
  %175 = icmp eq i32 %174, 0, !dbg !3054
  br i1 %175, label %176, label %177, !dbg !3049

176:                                              ; preds = %169
  call void @_Z4Int3v(), !dbg !3055
  br label %802, !dbg !3057

177:                                              ; preds = %169, %162, %155
  %178 = load ptr, ptr %11, align 8, !dbg !3058
  %179 = load i16, ptr %9, align 2, !dbg !3059
  %180 = sext i16 %179 to i32, !dbg !3059
  %181 = load ptr, ptr %10, align 8, !dbg !3060
  %182 = load ptr, ptr %6, align 8, !dbg !3061
  %183 = call noundef i32 @_Z19check_effect_blowupP7segmentiP10vms_vectorP6objecti(ptr noundef %178, i32 noundef %180, ptr noundef %181, ptr noundef %182, i32 noundef 0), !dbg !3062
  store i32 %183, ptr %12, align 4, !dbg !3063
  %184 = load ptr, ptr %6, align 8, !dbg !3064
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 22, !dbg !3066
  %186 = getelementptr inbounds nuw %struct.laser_info_s, ptr %185, i32 0, i32 0, !dbg !3067
  %187 = load i16, ptr %186, align 4, !dbg !3067
  %188 = sext i16 %187 to i32, !dbg !3064
  %189 = icmp eq i32 %188, 2, !dbg !3068
  br i1 %189, label %190, label %212, !dbg !3069

190:                                              ; preds = %177
  %191 = load ptr, ptr %6, align 8, !dbg !3070
  %192 = getelementptr inbounds nuw %struct.object, ptr %191, i32 0, i32 22, !dbg !3071
  %193 = getelementptr inbounds nuw %struct.laser_info_s, ptr %192, i32 0, i32 1, !dbg !3072
  %194 = load i16, ptr %193, align 2, !dbg !3072
  %195 = sext i16 %194 to i64, !dbg !3073
  %196 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %195, !dbg !3073
  %197 = getelementptr inbounds nuw %struct.object, ptr %196, i32 0, i32 2, !dbg !3074
  %198 = load i8, ptr %197, align 1, !dbg !3074
  %199 = zext i8 %198 to i64, !dbg !3075
  %200 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %199, !dbg !3075
  %201 = getelementptr inbounds nuw %struct.robot_info, ptr %200, i32 0, i32 37, !dbg !3076
  %202 = load i8, ptr %201, align 1, !dbg !3076
  %203 = sext i8 %202 to i32, !dbg !3075
  %204 = icmp eq i32 %203, 1, !dbg !3077
  br i1 %204, label %205, label %212, !dbg !3069

205:                                              ; preds = %190
  store i32 1, ptr %15, align 4, !dbg !3078
  %206 = load i32, ptr @Game_mode, align 4, !dbg !3080
  %207 = and i32 %206, 38, !dbg !3082
  %208 = icmp ne i32 %207, 0, !dbg !3080
  br i1 %208, label %209, label %210, !dbg !3080

209:                                              ; preds = %205
  call void @_Z4Int3v(), !dbg !3083
  br label %802, !dbg !3085

210:                                              ; preds = %205
  %211 = load i32, ptr @Player_num, align 4, !dbg !3086
  store i32 %211, ptr %14, align 4, !dbg !3087
  br label %235, !dbg !3088

212:                                              ; preds = %190, %177
  store i32 0, ptr %15, align 4, !dbg !3089
  %213 = load ptr, ptr %6, align 8, !dbg !3091
  %214 = getelementptr inbounds nuw %struct.object, ptr %213, i32 0, i32 22, !dbg !3093
  %215 = getelementptr inbounds nuw %struct.laser_info_s, ptr %214, i32 0, i32 1, !dbg !3094
  %216 = load i16, ptr %215, align 2, !dbg !3094
  %217 = sext i16 %216 to i64, !dbg !3095
  %218 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %217, !dbg !3095
  %219 = getelementptr inbounds nuw %struct.object, ptr %218, i32 0, i32 1, !dbg !3096
  %220 = load i8, ptr %219, align 4, !dbg !3096
  %221 = zext i8 %220 to i32, !dbg !3095
  %222 = icmp eq i32 %221, 4, !dbg !3097
  br i1 %222, label %223, label %233, !dbg !3097

223:                                              ; preds = %212
  %224 = load ptr, ptr %6, align 8, !dbg !3098
  %225 = getelementptr inbounds nuw %struct.object, ptr %224, i32 0, i32 22, !dbg !3099
  %226 = getelementptr inbounds nuw %struct.laser_info_s, ptr %225, i32 0, i32 1, !dbg !3100
  %227 = load i16, ptr %226, align 2, !dbg !3100
  %228 = sext i16 %227 to i64, !dbg !3101
  %229 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %228, !dbg !3101
  %230 = getelementptr inbounds nuw %struct.object, ptr %229, i32 0, i32 2, !dbg !3102
  %231 = load i8, ptr %230, align 1, !dbg !3102
  %232 = zext i8 %231 to i32, !dbg !3101
  store i32 %232, ptr %14, align 4, !dbg !3103
  br label %234, !dbg !3104

233:                                              ; preds = %212
  store i32 -1, ptr %14, align 4, !dbg !3105
  br label %234

234:                                              ; preds = %233, %223
  br label %235

235:                                              ; preds = %234, %210
  %236 = load i32, ptr %12, align 4, !dbg !3106
  %237 = icmp ne i32 %236, 0, !dbg !3106
  br i1 %237, label %238, label %245, !dbg !3106

238:                                              ; preds = %235
  %239 = load ptr, ptr %11, align 8, !dbg !3108
  %240 = load i16, ptr %9, align 2, !dbg !3110
  %241 = load ptr, ptr %6, align 8, !dbg !3111
  %242 = getelementptr inbounds nuw %struct.object, ptr %241, i32 0, i32 22, !dbg !3112
  %243 = getelementptr inbounds nuw %struct.laser_info_s, ptr %242, i32 0, i32 1, !dbg !3113
  %244 = load i16, ptr %243, align 2, !dbg !3113
  call void @_Z13check_triggerP7segmentssi(ptr noundef %239, i16 noundef signext %240, i16 noundef signext %244, i32 noundef 1), !dbg !3114
  br label %245, !dbg !3115

245:                                              ; preds = %238, %235
  %246 = load ptr, ptr %6, align 8, !dbg !3116
  %247 = getelementptr inbounds nuw %struct.object, ptr %246, i32 0, i32 2, !dbg !3118
  %248 = load i8, ptr %247, align 1, !dbg !3118
  %249 = zext i8 %248 to i32, !dbg !3116
  %250 = icmp eq i32 %249, 40, !dbg !3119
  br i1 %250, label %251, label %252, !dbg !3119

251:                                              ; preds = %245
  call void @_Z16smega_rock_stuffv(), !dbg !3120
  br label %252, !dbg !3120

252:                                              ; preds = %251, %245
  %253 = load ptr, ptr %11, align 8, !dbg !3121
  %254 = load i16, ptr %9, align 2, !dbg !3122
  %255 = sext i16 %254 to i32, !dbg !3122
  %256 = load ptr, ptr %6, align 8, !dbg !3123
  %257 = getelementptr inbounds nuw %struct.object, ptr %256, i32 0, i32 14, !dbg !3124
  %258 = load i32, ptr %257, align 4, !dbg !3124
  %259 = load i32, ptr %14, align 4, !dbg !3125
  %260 = load ptr, ptr %6, align 8, !dbg !3126
  %261 = call noundef i32 @_Z16wall_hit_processP7segmentiiiP6object(ptr noundef %253, i32 noundef %255, i32 noundef %258, i32 noundef %259, ptr noundef %260), !dbg !3127
  store i32 %261, ptr %13, align 4, !dbg !3128
  %262 = load ptr, ptr %11, align 8, !dbg !3129
  %263 = getelementptr inbounds nuw %struct.segment, ptr %262, i32 0, i32 0, !dbg !3131
  %264 = load i16, ptr %9, align 2, !dbg !3132
  %265 = sext i16 %264 to i64, !dbg !3129
  %266 = getelementptr inbounds [6 x %struct.side], ptr %263, i64 0, i64 %265, !dbg !3129
  %267 = getelementptr inbounds nuw %struct.side, ptr %266, i32 0, i32 3, !dbg !3133
  %268 = load i16, ptr %267, align 4, !dbg !3133
  %269 = sext i16 %268 to i64, !dbg !3134
  %270 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %269, !dbg !3134
  %271 = getelementptr inbounds nuw %struct.tmap_info, ptr %270, i32 0, i32 0, !dbg !3135
  %272 = load i8, ptr %271, align 4, !dbg !3135
  %273 = zext i8 %272 to i32, !dbg !3134
  %274 = and i32 %273, 1, !dbg !3136
  %275 = icmp ne i32 %274, 0, !dbg !3137
  br i1 %275, label %302, label %276, !dbg !3138

276:                                              ; preds = %252
  %277 = load ptr, ptr %11, align 8, !dbg !3139
  %278 = getelementptr inbounds nuw %struct.segment, ptr %277, i32 0, i32 0, !dbg !3140
  %279 = load i16, ptr %9, align 2, !dbg !3141
  %280 = sext i16 %279 to i64, !dbg !3139
  %281 = getelementptr inbounds [6 x %struct.side], ptr %278, i64 0, i64 %280, !dbg !3139
  %282 = getelementptr inbounds nuw %struct.side, ptr %281, i32 0, i32 4, !dbg !3142
  %283 = load i16, ptr %282, align 2, !dbg !3142
  %284 = icmp ne i16 %283, 0, !dbg !3139
  br i1 %284, label %285, label %384, !dbg !3143

285:                                              ; preds = %276
  %286 = load ptr, ptr %11, align 8, !dbg !3144
  %287 = getelementptr inbounds nuw %struct.segment, ptr %286, i32 0, i32 0, !dbg !3145
  %288 = load i16, ptr %9, align 2, !dbg !3146
  %289 = sext i16 %288 to i64, !dbg !3144
  %290 = getelementptr inbounds [6 x %struct.side], ptr %287, i64 0, i64 %289, !dbg !3144
  %291 = getelementptr inbounds nuw %struct.side, ptr %290, i32 0, i32 4, !dbg !3147
  %292 = load i16, ptr %291, align 2, !dbg !3147
  %293 = sext i16 %292 to i32, !dbg !3144
  %294 = and i32 %293, 16383, !dbg !3148
  %295 = sext i32 %294 to i64, !dbg !3149
  %296 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %295, !dbg !3149
  %297 = getelementptr inbounds nuw %struct.tmap_info, ptr %296, i32 0, i32 0, !dbg !3150
  %298 = load i8, ptr %297, align 4, !dbg !3150
  %299 = zext i8 %298 to i32, !dbg !3149
  %300 = and i32 %299, 1, !dbg !3151
  %301 = icmp ne i32 %300, 0, !dbg !3152
  br i1 %301, label %302, label %384, !dbg !3138

302:                                              ; preds = %285, %252
    #dbg_declare(ptr %17, !3153, !DIExpression(), !3208)
  %303 = load ptr, ptr %6, align 8, !dbg !3209
  %304 = getelementptr inbounds nuw %struct.object, ptr %303, i32 0, i32 2, !dbg !3210
  %305 = load i8, ptr %304, align 1, !dbg !3210
  %306 = zext i8 %305 to i64, !dbg !3211
  %307 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %306, !dbg !3211
  store ptr %307, ptr %17, align 8, !dbg !3208
    #dbg_declare(ptr %18, !3212, !DIExpression(), !3213)
  %308 = load i16, ptr %8, align 2, !dbg !3214
  %309 = load ptr, ptr %10, align 8, !dbg !3215
  %310 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 21, i16 noundef signext %308, i16 noundef signext 0, ptr noundef %309, i32 noundef 0, i32 noundef 65536), !dbg !3216
  %311 = load ptr, ptr %6, align 8, !dbg !3217
  %312 = getelementptr inbounds nuw %struct.object, ptr %311, i32 0, i32 2, !dbg !3218
  %313 = load i8, ptr %312, align 1, !dbg !3218
  %314 = zext i8 %313 to i32, !dbg !3217
  %315 = icmp eq i32 %314, 18, !dbg !3219
  br i1 %315, label %316, label %325, !dbg !3220

316:                                              ; preds = %302
  %317 = load ptr, ptr %6, align 8, !dbg !3221
  %318 = getelementptr inbounds nuw %struct.object, ptr %317, i32 0, i32 2, !dbg !3222
  %319 = load i8, ptr %318, align 1, !dbg !3222
  %320 = zext i8 %319 to i64, !dbg !3223
  %321 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %320, !dbg !3223
  %322 = getelementptr inbounds nuw %struct.weapon_info, ptr %321, i32 0, i32 5, !dbg !3224
  %323 = load i8, ptr %322, align 1, !dbg !3224
  %324 = sext i8 %323 to i32, !dbg !3223
  br label %326, !dbg !3220

325:                                              ; preds = %302
  br label %326, !dbg !3220

326:                                              ; preds = %325, %316
  %327 = phi i32 [ %324, %316 ], [ 5, %325 ], !dbg !3220
  store i32 %327, ptr %18, align 4, !dbg !3225
  %328 = load ptr, ptr %17, align 8, !dbg !3226
  %329 = getelementptr inbounds nuw %struct.weapon_info, ptr %328, i32 0, i32 37, !dbg !3228
  %330 = load i32, ptr %329, align 4, !dbg !3228
  %331 = call noundef i32 @_Z3i2fi(i32 noundef 30), !dbg !3229
  %332 = sdiv i32 %331, 2, !dbg !3230
  %333 = icmp sge i32 %330, %332, !dbg !3231
  br i1 %333, label %334, label %338, !dbg !3231

334:                                              ; preds = %326
  %335 = load ptr, ptr %6, align 8, !dbg !3232
  %336 = load ptr, ptr %10, align 8, !dbg !3234
  %337 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %335, ptr noundef %336), !dbg !3235
  br label %377, !dbg !3236

338:                                              ; preds = %326
  %339 = load ptr, ptr %6, align 8, !dbg !3237
  %340 = load i16, ptr %8, align 2, !dbg !3239
  %341 = load ptr, ptr %10, align 8, !dbg !3240
  %342 = load ptr, ptr %17, align 8, !dbg !3241
  %343 = getelementptr inbounds nuw %struct.weapon_info, ptr %342, i32 0, i32 28, !dbg !3242
  %344 = load i32, ptr %343, align 4, !dbg !3242
  %345 = call noundef i32 @_Z3i2fi(i32 noundef 3), !dbg !3243
  %346 = add nsw i32 %344, %345, !dbg !3244
  %347 = load i32, ptr %18, align 4, !dbg !3245
  %348 = load ptr, ptr %17, align 8, !dbg !3246
  %349 = getelementptr inbounds nuw %struct.weapon_info, ptr %348, i32 0, i32 29, !dbg !3247
  %350 = load i32, ptr @Difficulty_level, align 4, !dbg !3248
  %351 = sext i32 %350 to i64, !dbg !3246
  %352 = getelementptr inbounds [5 x i32], ptr %349, i64 0, i64 %351, !dbg !3246
  %353 = load i32, ptr %352, align 4, !dbg !3246
  %354 = sdiv i32 %353, 4, !dbg !3249
  %355 = call noundef i32 @_Z3i2fi(i32 noundef 10), !dbg !3250
  %356 = add nsw i32 %354, %355, !dbg !3251
  %357 = load ptr, ptr %17, align 8, !dbg !3252
  %358 = getelementptr inbounds nuw %struct.weapon_info, ptr %357, i32 0, i32 37, !dbg !3253
  %359 = load i32, ptr %358, align 4, !dbg !3253
  %360 = call noundef i32 @_Z3i2fi(i32 noundef 30), !dbg !3254
  %361 = add nsw i32 %359, %360, !dbg !3255
  %362 = load ptr, ptr %17, align 8, !dbg !3256
  %363 = getelementptr inbounds nuw %struct.weapon_info, ptr %362, i32 0, i32 29, !dbg !3257
  %364 = load i32, ptr @Difficulty_level, align 4, !dbg !3258
  %365 = sext i32 %364 to i64, !dbg !3256
  %366 = getelementptr inbounds [5 x i32], ptr %363, i64 0, i64 %365, !dbg !3256
  %367 = load i32, ptr %366, align 4, !dbg !3256
  %368 = sdiv i32 %367, 2, !dbg !3259
  %369 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !3260
  %370 = add nsw i32 %368, %369, !dbg !3261
  %371 = load ptr, ptr %6, align 8, !dbg !3262
  %372 = getelementptr inbounds nuw %struct.object, ptr %371, i32 0, i32 22, !dbg !3263
  %373 = getelementptr inbounds nuw %struct.laser_info_s, ptr %372, i32 0, i32 1, !dbg !3264
  %374 = load i16, ptr %373, align 2, !dbg !3264
  %375 = sext i16 %374 to i32, !dbg !3262
  %376 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef %339, i16 noundef signext %340, ptr noundef %341, i32 noundef %346, i32 noundef %347, i32 noundef %356, i32 noundef %361, i32 noundef %370, i32 noundef %375), !dbg !3265
  br label %377

377:                                              ; preds = %338, %334
  %378 = load ptr, ptr %6, align 8, !dbg !3266
  %379 = getelementptr inbounds nuw %struct.object, ptr %378, i32 0, i32 8, !dbg !3267
  %380 = load i8, ptr %379, align 1, !dbg !3268
  %381 = zext i8 %380 to i32, !dbg !3268
  %382 = or i32 %381, 2, !dbg !3268
  %383 = trunc i32 %382 to i8, !dbg !3268
  store i8 %383, ptr %379, align 1, !dbg !3268
  br label %653, !dbg !3269

384:                                              ; preds = %285, %276
  %385 = load ptr, ptr %11, align 8, !dbg !3270
  %386 = getelementptr inbounds nuw %struct.segment, ptr %385, i32 0, i32 0, !dbg !3272
  %387 = load i16, ptr %9, align 2, !dbg !3273
  %388 = sext i16 %387 to i64, !dbg !3270
  %389 = getelementptr inbounds [6 x %struct.side], ptr %386, i64 0, i64 %388, !dbg !3270
  %390 = getelementptr inbounds nuw %struct.side, ptr %389, i32 0, i32 3, !dbg !3274
  %391 = load i16, ptr %390, align 4, !dbg !3274
  %392 = sext i16 %391 to i64, !dbg !3275
  %393 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %392, !dbg !3275
  %394 = getelementptr inbounds nuw %struct.tmap_info, ptr %393, i32 0, i32 0, !dbg !3276
  %395 = load i8, ptr %394, align 4, !dbg !3276
  %396 = zext i8 %395 to i32, !dbg !3275
  %397 = and i32 %396, 2, !dbg !3277
  %398 = icmp ne i32 %397, 0, !dbg !3278
  br i1 %398, label %425, label %399, !dbg !3279

399:                                              ; preds = %384
  %400 = load ptr, ptr %11, align 8, !dbg !3280
  %401 = getelementptr inbounds nuw %struct.segment, ptr %400, i32 0, i32 0, !dbg !3281
  %402 = load i16, ptr %9, align 2, !dbg !3282
  %403 = sext i16 %402 to i64, !dbg !3280
  %404 = getelementptr inbounds [6 x %struct.side], ptr %401, i64 0, i64 %403, !dbg !3280
  %405 = getelementptr inbounds nuw %struct.side, ptr %404, i32 0, i32 4, !dbg !3283
  %406 = load i16, ptr %405, align 2, !dbg !3283
  %407 = icmp ne i16 %406, 0, !dbg !3280
  br i1 %407, label %408, label %539, !dbg !3284

408:                                              ; preds = %399
  %409 = load ptr, ptr %11, align 8, !dbg !3285
  %410 = getelementptr inbounds nuw %struct.segment, ptr %409, i32 0, i32 0, !dbg !3286
  %411 = load i16, ptr %9, align 2, !dbg !3287
  %412 = sext i16 %411 to i64, !dbg !3285
  %413 = getelementptr inbounds [6 x %struct.side], ptr %410, i64 0, i64 %412, !dbg !3285
  %414 = getelementptr inbounds nuw %struct.side, ptr %413, i32 0, i32 4, !dbg !3288
  %415 = load i16, ptr %414, align 2, !dbg !3288
  %416 = sext i16 %415 to i32, !dbg !3285
  %417 = and i32 %416, 16383, !dbg !3289
  %418 = sext i32 %417 to i64, !dbg !3290
  %419 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %418, !dbg !3290
  %420 = getelementptr inbounds nuw %struct.tmap_info, ptr %419, i32 0, i32 0, !dbg !3291
  %421 = load i8, ptr %420, align 4, !dbg !3291
  %422 = zext i8 %421 to i32, !dbg !3290
  %423 = and i32 %422, 2, !dbg !3292
  %424 = icmp ne i32 %423, 0, !dbg !3293
  br i1 %424, label %425, label %539, !dbg !3279

425:                                              ; preds = %408, %384
    #dbg_declare(ptr %19, !3294, !DIExpression(), !3296)
  %426 = load ptr, ptr %6, align 8, !dbg !3297
  %427 = getelementptr inbounds nuw %struct.object, ptr %426, i32 0, i32 2, !dbg !3298
  %428 = load i8, ptr %427, align 1, !dbg !3298
  %429 = zext i8 %428 to i64, !dbg !3299
  %430 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %429, !dbg !3299
  store ptr %430, ptr %19, align 8, !dbg !3296
  %431 = load ptr, ptr %6, align 8, !dbg !3300
  %432 = getelementptr inbounds nuw %struct.object, ptr %431, i32 0, i32 2, !dbg !3302
  %433 = load i8, ptr %432, align 1, !dbg !3302
  %434 = zext i8 %433 to i64, !dbg !3303
  %435 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %434, !dbg !3303
  %436 = getelementptr inbounds nuw %struct.weapon_info, ptr %435, i32 0, i32 14, !dbg !3304
  %437 = load i8, ptr %436, align 1, !dbg !3304
  %438 = icmp ne i8 %437, 0, !dbg !3303
  br i1 %438, label %439, label %515, !dbg !3303

439:                                              ; preds = %425
  %440 = load i16, ptr %8, align 2, !dbg !3305
  %441 = load ptr, ptr %10, align 8, !dbg !3307
  %442 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 233, i16 noundef signext %440, i16 noundef signext 0, ptr noundef %441, i32 noundef 0, i32 noundef 65536), !dbg !3308
  %443 = load ptr, ptr %6, align 8, !dbg !3309
  %444 = getelementptr inbounds nuw %struct.object, ptr %443, i32 0, i32 2, !dbg !3311
  %445 = load i8, ptr %444, align 1, !dbg !3311
  %446 = zext i8 %445 to i64, !dbg !3312
  %447 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %446, !dbg !3312
  %448 = getelementptr inbounds nuw %struct.weapon_info, ptr %447, i32 0, i32 37, !dbg !3313
  %449 = load i32, ptr %448, align 4, !dbg !3313
  %450 = icmp ne i32 %449, 0, !dbg !3312
  br i1 %450, label %451, label %492, !dbg !3312

451:                                              ; preds = %439
  %452 = load ptr, ptr %6, align 8, !dbg !3314
  %453 = ptrtoint ptr %452 to i64, !dbg !3316
  %454 = sub i64 %453, ptrtoint (ptr @Objects to i64), !dbg !3316
  %455 = sdiv exact i64 %454, 268, !dbg !3316
  %456 = trunc i64 %455 to i16, !dbg !3314
  %457 = call noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef 11, i16 noundef signext %456, i32 noundef 0, i32 noundef 65536), !dbg !3317
  %458 = load ptr, ptr %6, align 8, !dbg !3318
  %459 = load i16, ptr %8, align 2, !dbg !3319
  %460 = load ptr, ptr %10, align 8, !dbg !3320
  %461 = load ptr, ptr %19, align 8, !dbg !3321
  %462 = getelementptr inbounds nuw %struct.weapon_info, ptr %461, i32 0, i32 28, !dbg !3322
  %463 = load i32, ptr %462, align 4, !dbg !3322
  %464 = sdiv i32 %463, 2, !dbg !3323
  %465 = load ptr, ptr %19, align 8, !dbg !3324
  %466 = getelementptr inbounds nuw %struct.weapon_info, ptr %465, i32 0, i32 5, !dbg !3325
  %467 = load i8, ptr %466, align 1, !dbg !3325
  %468 = sext i8 %467 to i32, !dbg !3324
  %469 = load ptr, ptr %19, align 8, !dbg !3326
  %470 = getelementptr inbounds nuw %struct.weapon_info, ptr %469, i32 0, i32 29, !dbg !3327
  %471 = load i32, ptr @Difficulty_level, align 4, !dbg !3328
  %472 = sext i32 %471 to i64, !dbg !3326
  %473 = getelementptr inbounds [5 x i32], ptr %470, i64 0, i64 %472, !dbg !3326
  %474 = load i32, ptr %473, align 4, !dbg !3326
  %475 = sdiv i32 %474, 4, !dbg !3329
  %476 = load ptr, ptr %19, align 8, !dbg !3330
  %477 = getelementptr inbounds nuw %struct.weapon_info, ptr %476, i32 0, i32 37, !dbg !3331
  %478 = load i32, ptr %477, align 4, !dbg !3331
  %479 = load ptr, ptr %19, align 8, !dbg !3332
  %480 = getelementptr inbounds nuw %struct.weapon_info, ptr %479, i32 0, i32 29, !dbg !3333
  %481 = load i32, ptr @Difficulty_level, align 4, !dbg !3334
  %482 = sext i32 %481 to i64, !dbg !3332
  %483 = getelementptr inbounds [5 x i32], ptr %480, i64 0, i64 %482, !dbg !3332
  %484 = load i32, ptr %483, align 4, !dbg !3332
  %485 = sdiv i32 %484, 2, !dbg !3335
  %486 = load ptr, ptr %6, align 8, !dbg !3336
  %487 = getelementptr inbounds nuw %struct.object, ptr %486, i32 0, i32 22, !dbg !3337
  %488 = getelementptr inbounds nuw %struct.laser_info_s, ptr %487, i32 0, i32 1, !dbg !3338
  %489 = load i16, ptr %488, align 2, !dbg !3338
  %490 = sext i16 %489 to i32, !dbg !3336
  %491 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef %458, i16 noundef signext %459, ptr noundef %460, i32 noundef %464, i32 noundef %468, i32 noundef %475, i32 noundef %478, i32 noundef %485, i32 noundef %490), !dbg !3339
  br label %514, !dbg !3340

492:                                              ; preds = %439
  %493 = load ptr, ptr %6, align 8, !dbg !3341
  %494 = getelementptr inbounds nuw %struct.object, ptr %493, i32 0, i32 9, !dbg !3342
  %495 = load i16, ptr %494, align 2, !dbg !3342
  %496 = load ptr, ptr %6, align 8, !dbg !3343
  %497 = getelementptr inbounds nuw %struct.object, ptr %496, i32 0, i32 11, !dbg !3344
  %498 = load ptr, ptr %6, align 8, !dbg !3345
  %499 = getelementptr inbounds nuw %struct.object, ptr %498, i32 0, i32 2, !dbg !3346
  %500 = load i8, ptr %499, align 1, !dbg !3346
  %501 = zext i8 %500 to i64, !dbg !3347
  %502 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %501, !dbg !3347
  %503 = getelementptr inbounds nuw %struct.weapon_info, ptr %502, i32 0, i32 28, !dbg !3348
  %504 = load i32, ptr %503, align 4, !dbg !3348
  %505 = load ptr, ptr %6, align 8, !dbg !3349
  %506 = getelementptr inbounds nuw %struct.object, ptr %505, i32 0, i32 2, !dbg !3350
  %507 = load i8, ptr %506, align 1, !dbg !3350
  %508 = zext i8 %507 to i64, !dbg !3351
  %509 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %508, !dbg !3351
  %510 = getelementptr inbounds nuw %struct.weapon_info, ptr %509, i32 0, i32 7, !dbg !3352
  %511 = load i8, ptr %510, align 2, !dbg !3352
  %512 = sext i8 %511 to i32, !dbg !3351
  %513 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %495, ptr noundef %497, i32 noundef %504, i32 noundef %512), !dbg !3353
  br label %514

514:                                              ; preds = %492, %451
  br label %532, !dbg !3354

515:                                              ; preds = %425
  %516 = load i16, ptr %8, align 2, !dbg !3355
  %517 = load ptr, ptr %10, align 8, !dbg !3357
  %518 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 232, i16 noundef signext %516, i16 noundef signext 0, ptr noundef %517, i32 noundef 0, i32 noundef 65536), !dbg !3358
  %519 = load ptr, ptr %6, align 8, !dbg !3359
  %520 = getelementptr inbounds nuw %struct.object, ptr %519, i32 0, i32 9, !dbg !3360
  %521 = load i16, ptr %520, align 2, !dbg !3360
  %522 = load ptr, ptr %6, align 8, !dbg !3361
  %523 = getelementptr inbounds nuw %struct.object, ptr %522, i32 0, i32 11, !dbg !3362
  %524 = load ptr, ptr %6, align 8, !dbg !3363
  %525 = getelementptr inbounds nuw %struct.object, ptr %524, i32 0, i32 2, !dbg !3364
  %526 = load i8, ptr %525, align 1, !dbg !3364
  %527 = zext i8 %526 to i64, !dbg !3365
  %528 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %527, !dbg !3365
  %529 = getelementptr inbounds nuw %struct.weapon_info, ptr %528, i32 0, i32 28, !dbg !3366
  %530 = load i32, ptr %529, align 4, !dbg !3366
  %531 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %521, ptr noundef %523, i32 noundef %530, i32 noundef 84), !dbg !3367
  br label %532

532:                                              ; preds = %515, %514
  %533 = load ptr, ptr %6, align 8, !dbg !3368
  %534 = getelementptr inbounds nuw %struct.object, ptr %533, i32 0, i32 8, !dbg !3369
  %535 = load i8, ptr %534, align 1, !dbg !3370
  %536 = zext i8 %535 to i32, !dbg !3370
  %537 = or i32 %536, 2, !dbg !3370
  %538 = trunc i32 %537 to i8, !dbg !3370
  store i8 %538, ptr %534, align 1, !dbg !3370
  br label %652, !dbg !3371

539:                                              ; preds = %408, %399
  %540 = load ptr, ptr %6, align 8, !dbg !3372
  %541 = getelementptr inbounds nuw %struct.object, ptr %540, i32 0, i32 21, !dbg !3375
  %542 = getelementptr inbounds nuw %struct.physics_info, ptr %541, i32 0, i32 8, !dbg !3376
  %543 = load i16, ptr %542, align 2, !dbg !3376
  %544 = zext i16 %543 to i32, !dbg !3372
  %545 = and i32 %544, 4, !dbg !3377
  %546 = icmp ne i32 %545, 0, !dbg !3372
  br i1 %546, label %547, label %548, !dbg !3372

547:                                              ; preds = %539
  br label %651, !dbg !3378

548:                                              ; preds = %539
  %549 = load ptr, ptr %6, align 8, !dbg !3380
  %550 = getelementptr inbounds nuw %struct.object, ptr %549, i32 0, i32 22, !dbg !3383
  %551 = getelementptr inbounds nuw %struct.laser_info_s, ptr %550, i32 0, i32 0, !dbg !3384
  %552 = load i16, ptr %551, align 4, !dbg !3384
  %553 = sext i16 %552 to i32, !dbg !3380
  %554 = icmp ne i32 %553, 4, !dbg !3385
  br i1 %554, label %571, label %555, !dbg !3386

555:                                              ; preds = %548
  %556 = load ptr, ptr %11, align 8, !dbg !3387
  %557 = getelementptr inbounds nuw %struct.segment, ptr %556, i32 0, i32 0, !dbg !3388
  %558 = load i16, ptr %9, align 2, !dbg !3389
  %559 = sext i16 %558 to i64, !dbg !3387
  %560 = getelementptr inbounds [6 x %struct.side], ptr %557, i64 0, i64 %559, !dbg !3387
  %561 = getelementptr inbounds nuw %struct.side, ptr %560, i32 0, i32 2, !dbg !3390
  %562 = load i16, ptr %561, align 2, !dbg !3390
  %563 = sext i16 %562 to i32, !dbg !3387
  %564 = icmp eq i32 %563, -1, !dbg !3391
  br i1 %564, label %568, label %565, !dbg !3392

565:                                              ; preds = %555
  %566 = load i32, ptr %13, align 4, !dbg !3393
  %567 = icmp eq i32 %566, 0, !dbg !3394
  br i1 %567, label %568, label %604, !dbg !3395

568:                                              ; preds = %565, %555
  %569 = load i32, ptr %12, align 4, !dbg !3396
  %570 = icmp ne i32 %569, 0, !dbg !3396
  br i1 %570, label %604, label %571, !dbg !3386

571:                                              ; preds = %568, %548
  %572 = load ptr, ptr %6, align 8, !dbg !3397
  %573 = getelementptr inbounds nuw %struct.object, ptr %572, i32 0, i32 2, !dbg !3399
  %574 = load i8, ptr %573, align 1, !dbg !3399
  %575 = zext i8 %574 to i64, !dbg !3400
  %576 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %575, !dbg !3400
  %577 = getelementptr inbounds nuw %struct.weapon_info, ptr %576, i32 0, i32 12, !dbg !3401
  %578 = load i16, ptr %577, align 4, !dbg !3401
  %579 = sext i16 %578 to i32, !dbg !3400
  %580 = icmp sgt i32 %579, -1, !dbg !3402
  br i1 %580, label %581, label %603, !dbg !3403

581:                                              ; preds = %571
  %582 = load ptr, ptr %6, align 8, !dbg !3404
  %583 = getelementptr inbounds nuw %struct.object, ptr %582, i32 0, i32 8, !dbg !3405
  %584 = load i8, ptr %583, align 1, !dbg !3405
  %585 = zext i8 %584 to i32, !dbg !3404
  %586 = and i32 %585, 8, !dbg !3406
  %587 = icmp ne i32 %586, 0, !dbg !3407
  br i1 %587, label %603, label %588, !dbg !3403

588:                                              ; preds = %581
  %589 = load ptr, ptr %6, align 8, !dbg !3408
  %590 = getelementptr inbounds nuw %struct.object, ptr %589, i32 0, i32 2, !dbg !3409
  %591 = load i8, ptr %590, align 1, !dbg !3409
  %592 = zext i8 %591 to i64, !dbg !3410
  %593 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %592, !dbg !3410
  %594 = getelementptr inbounds nuw %struct.weapon_info, ptr %593, i32 0, i32 12, !dbg !3411
  %595 = load i16, ptr %594, align 4, !dbg !3411
  %596 = sext i16 %595 to i32, !dbg !3410
  %597 = load ptr, ptr %6, align 8, !dbg !3412
  %598 = getelementptr inbounds nuw %struct.object, ptr %597, i32 0, i32 9, !dbg !3413
  %599 = load i16, ptr %598, align 2, !dbg !3413
  %600 = load ptr, ptr %6, align 8, !dbg !3414
  %601 = getelementptr inbounds nuw %struct.object, ptr %600, i32 0, i32 11, !dbg !3415
  %602 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %596, i16 noundef signext %599, i16 noundef signext 0, ptr noundef %601, i32 noundef 0, i32 noundef 65536), !dbg !3416
  br label %603, !dbg !3416

603:                                              ; preds = %588, %581, %571
  br label %604, !dbg !3417

604:                                              ; preds = %603, %568, %565
  %605 = load ptr, ptr %6, align 8, !dbg !3418
  %606 = getelementptr inbounds nuw %struct.object, ptr %605, i32 0, i32 2, !dbg !3420
  %607 = load i8, ptr %606, align 1, !dbg !3420
  %608 = zext i8 %607 to i64, !dbg !3421
  %609 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %608, !dbg !3421
  %610 = getelementptr inbounds nuw %struct.weapon_info, ptr %609, i32 0, i32 7, !dbg !3422
  %611 = load i8, ptr %610, align 2, !dbg !3422
  %612 = sext i8 %611 to i32, !dbg !3421
  %613 = icmp sgt i32 %612, -1, !dbg !3423
  br i1 %613, label %614, label %650, !dbg !3423

614:                                              ; preds = %604
  %615 = load ptr, ptr %6, align 8, !dbg !3424
  %616 = getelementptr inbounds nuw %struct.object, ptr %615, i32 0, i32 2, !dbg !3427
  %617 = load i8, ptr %616, align 1, !dbg !3427
  %618 = zext i8 %617 to i64, !dbg !3428
  %619 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %618, !dbg !3428
  %620 = getelementptr inbounds nuw %struct.weapon_info, ptr %619, i32 0, i32 37, !dbg !3429
  %621 = load i32, ptr %620, align 4, !dbg !3429
  %622 = icmp ne i32 %621, 0, !dbg !3428
  br i1 %622, label %623, label %627, !dbg !3428

623:                                              ; preds = %614
  %624 = load ptr, ptr %6, align 8, !dbg !3430
  %625 = load ptr, ptr %10, align 8, !dbg !3431
  %626 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %624, ptr noundef %625), !dbg !3432
  br label %649, !dbg !3432

627:                                              ; preds = %614
  %628 = load ptr, ptr %6, align 8, !dbg !3433
  %629 = getelementptr inbounds nuw %struct.object, ptr %628, i32 0, i32 9, !dbg !3434
  %630 = load i16, ptr %629, align 2, !dbg !3434
  %631 = load ptr, ptr %6, align 8, !dbg !3435
  %632 = getelementptr inbounds nuw %struct.object, ptr %631, i32 0, i32 11, !dbg !3436
  %633 = load ptr, ptr %6, align 8, !dbg !3437
  %634 = getelementptr inbounds nuw %struct.object, ptr %633, i32 0, i32 2, !dbg !3438
  %635 = load i8, ptr %634, align 1, !dbg !3438
  %636 = zext i8 %635 to i64, !dbg !3439
  %637 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %636, !dbg !3439
  %638 = getelementptr inbounds nuw %struct.weapon_info, ptr %637, i32 0, i32 28, !dbg !3440
  %639 = load i32, ptr %638, align 4, !dbg !3440
  %640 = load ptr, ptr %6, align 8, !dbg !3441
  %641 = getelementptr inbounds nuw %struct.object, ptr %640, i32 0, i32 2, !dbg !3442
  %642 = load i8, ptr %641, align 1, !dbg !3442
  %643 = zext i8 %642 to i64, !dbg !3443
  %644 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %643, !dbg !3443
  %645 = getelementptr inbounds nuw %struct.weapon_info, ptr %644, i32 0, i32 7, !dbg !3444
  %646 = load i8, ptr %645, align 2, !dbg !3444
  %647 = sext i8 %646 to i32, !dbg !3443
  %648 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %630, ptr noundef %632, i32 noundef %639, i32 noundef %647), !dbg !3445
  br label %649

649:                                              ; preds = %627, %623
  br label %650, !dbg !3446

650:                                              ; preds = %649, %604
  br label %651

651:                                              ; preds = %650, %547
  br label %652

652:                                              ; preds = %651, %532
  br label %653

653:                                              ; preds = %652, %377
  %654 = load ptr, ptr %6, align 8, !dbg !3447
  %655 = getelementptr inbounds nuw %struct.object, ptr %654, i32 0, i32 22, !dbg !3449
  %656 = getelementptr inbounds nuw %struct.laser_info_s, ptr %655, i32 0, i32 0, !dbg !3450
  %657 = load i16, ptr %656, align 4, !dbg !3450
  %658 = sext i16 %657 to i32, !dbg !3447
  %659 = icmp eq i32 %658, 4, !dbg !3451
  br i1 %659, label %663, label %660, !dbg !3452

660:                                              ; preds = %653
  %661 = load i32, ptr %15, align 4, !dbg !3453
  %662 = icmp ne i32 %661, 0, !dbg !3453
  br i1 %662, label %663, label %785, !dbg !3452

663:                                              ; preds = %660, %653
  %664 = load ptr, ptr %6, align 8, !dbg !3454
  %665 = getelementptr inbounds nuw %struct.object, ptr %664, i32 0, i32 8, !dbg !3457
  %666 = load i8, ptr %665, align 1, !dbg !3457
  %667 = zext i8 %666 to i32, !dbg !3454
  %668 = and i32 %667, 8, !dbg !3458
  %669 = icmp ne i32 %668, 0, !dbg !3459
  br i1 %669, label %684, label %670, !dbg !3460

670:                                              ; preds = %663
  %671 = load ptr, ptr %6, align 8, !dbg !3461
  %672 = getelementptr inbounds nuw %struct.object, ptr %671, i32 0, i32 22, !dbg !3462
  %673 = getelementptr inbounds nuw %struct.laser_info_s, ptr %672, i32 0, i32 1, !dbg !3463
  %674 = load i16, ptr %673, align 2, !dbg !3463
  %675 = sext i16 %674 to i32, !dbg !3461
  %676 = load i32, ptr @Player_num, align 4, !dbg !3464
  %677 = sext i32 %676 to i64, !dbg !3465
  %678 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %677, !dbg !3465
  %679 = getelementptr inbounds nuw %struct.player, ptr %678, i32 0, i32 4, !dbg !3466
  %680 = load i32, ptr %679, align 4, !dbg !3466
  %681 = icmp eq i32 %675, %680, !dbg !3467
  br i1 %681, label %682, label %684, !dbg !3460

682:                                              ; preds = %670
  %683 = load ptr, ptr %6, align 8, !dbg !3468
  call void @_Z22create_awareness_eventP6objecti(ptr noundef %683, i32 noundef 2), !dbg !3469
  br label %684, !dbg !3469

684:                                              ; preds = %682, %670, %663
  %685 = load ptr, ptr %6, align 8, !dbg !3470
  %686 = getelementptr inbounds nuw %struct.object, ptr %685, i32 0, i32 2, !dbg !3473
  %687 = load i8, ptr %686, align 1, !dbg !3473
  %688 = zext i8 %687 to i32, !dbg !3470
  %689 = icmp ne i32 %688, 9, !dbg !3474
  br i1 %689, label %697, label %690, !dbg !3475

690:                                              ; preds = %684
  %691 = load ptr, ptr %6, align 8, !dbg !3476
  %692 = getelementptr inbounds nuw %struct.object, ptr %691, i32 0, i32 22, !dbg !3477
  %693 = getelementptr inbounds nuw %struct.laser_info_s, ptr %692, i32 0, i32 0, !dbg !3478
  %694 = load i16, ptr %693, align 4, !dbg !3478
  %695 = sext i16 %694 to i32, !dbg !3476
  %696 = icmp ne i32 %695, 4, !dbg !3479
  br i1 %696, label %697, label %712, !dbg !3480

697:                                              ; preds = %690, %684
  %698 = load ptr, ptr %6, align 8, !dbg !3481
  %699 = getelementptr inbounds nuw %struct.object, ptr %698, i32 0, i32 21, !dbg !3482
  %700 = getelementptr inbounds nuw %struct.physics_info, ptr %699, i32 0, i32 8, !dbg !3483
  %701 = load i16, ptr %700, align 2, !dbg !3483
  %702 = zext i16 %701 to i32, !dbg !3481
  %703 = and i32 %702, 4, !dbg !3484
  %704 = icmp ne i32 %703, 0, !dbg !3485
  br i1 %704, label %712, label %705, !dbg !3480

705:                                              ; preds = %697
  %706 = load ptr, ptr %6, align 8, !dbg !3486
  %707 = getelementptr inbounds nuw %struct.object, ptr %706, i32 0, i32 8, !dbg !3487
  %708 = load i8, ptr %707, align 1, !dbg !3488
  %709 = zext i8 %708 to i32, !dbg !3488
  %710 = or i32 %709, 2, !dbg !3488
  %711 = trunc i32 %710 to i8, !dbg !3488
  store i8 %711, ptr %707, align 1, !dbg !3488
  br label %712, !dbg !3486

712:                                              ; preds = %705, %697, %690
  %713 = load ptr, ptr %6, align 8, !dbg !3489
  %714 = getelementptr inbounds nuw %struct.object, ptr %713, i32 0, i32 2, !dbg !3491
  %715 = load i8, ptr %714, align 1, !dbg !3491
  %716 = zext i8 %715 to i32, !dbg !3489
  %717 = icmp eq i32 %716, 9, !dbg !3492
  br i1 %717, label %718, label %740, !dbg !3493

718:                                              ; preds = %712
  %719 = load ptr, ptr %11, align 8, !dbg !3494
  %720 = getelementptr inbounds nuw %struct.segment, ptr %719, i32 0, i32 0, !dbg !3495
  %721 = load i16, ptr %9, align 2, !dbg !3496
  %722 = sext i16 %721 to i64, !dbg !3494
  %723 = getelementptr inbounds [6 x %struct.side], ptr %720, i64 0, i64 %722, !dbg !3494
  %724 = getelementptr inbounds nuw %struct.side, ptr %723, i32 0, i32 3, !dbg !3497
  %725 = load i16, ptr %724, align 4, !dbg !3497
  %726 = sext i16 %725 to i64, !dbg !3498
  %727 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %726, !dbg !3498
  %728 = getelementptr inbounds nuw %struct.tmap_info, ptr %727, i32 0, i32 0, !dbg !3499
  %729 = load i8, ptr %728, align 4, !dbg !3499
  %730 = zext i8 %729 to i32, !dbg !3498
  %731 = and i32 %730, 4, !dbg !3500
  %732 = icmp ne i32 %731, 0, !dbg !3501
  br i1 %732, label %733, label %740, !dbg !3493

733:                                              ; preds = %718
  %734 = load ptr, ptr %6, align 8, !dbg !3502
  %735 = getelementptr inbounds nuw %struct.object, ptr %734, i32 0, i32 8, !dbg !3503
  %736 = load i8, ptr %735, align 1, !dbg !3504
  %737 = zext i8 %736 to i32, !dbg !3504
  %738 = or i32 %737, 2, !dbg !3504
  %739 = trunc i32 %738 to i8, !dbg !3504
  store i8 %739, ptr %735, align 1, !dbg !3504
  br label %740, !dbg !3502

740:                                              ; preds = %733, %718, %712
  %741 = load ptr, ptr %6, align 8, !dbg !3505
  %742 = getelementptr inbounds nuw %struct.object, ptr %741, i32 0, i32 8, !dbg !3507
  %743 = load i8, ptr %742, align 1, !dbg !3507
  %744 = zext i8 %743 to i32, !dbg !3505
  %745 = and i32 %744, 8, !dbg !3508
  %746 = icmp ne i32 %745, 0, !dbg !3509
  br i1 %746, label %784, label %747, !dbg !3510

747:                                              ; preds = %740
  %748 = load i32, ptr %13, align 4, !dbg !3511
  switch i32 %748, label %783 [
    i32 0, label %749
    i32 1, label %750
    i32 2, label %757
    i32 3, label %782
  ], !dbg !3513

749:                                              ; preds = %747
  br label %783, !dbg !3514

750:                                              ; preds = %747
  %751 = load ptr, ptr %6, align 8, !dbg !3516
  %752 = getelementptr inbounds nuw %struct.object, ptr %751, i32 0, i32 9, !dbg !3517
  %753 = load i16, ptr %752, align 2, !dbg !3517
  %754 = load ptr, ptr %6, align 8, !dbg !3518
  %755 = getelementptr inbounds nuw %struct.object, ptr %754, i32 0, i32 11, !dbg !3519
  %756 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 27, i16 noundef signext %753, i16 noundef signext 0, ptr noundef %755, i32 noundef 0, i32 noundef 65536), !dbg !3520
  br label %783, !dbg !3521

757:                                              ; preds = %747
  %758 = load ptr, ptr %6, align 8, !dbg !3522
  %759 = getelementptr inbounds nuw %struct.object, ptr %758, i32 0, i32 2, !dbg !3524
  %760 = load i8, ptr %759, align 1, !dbg !3524
  %761 = zext i8 %760 to i64, !dbg !3525
  %762 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %761, !dbg !3525
  %763 = getelementptr inbounds nuw %struct.weapon_info, ptr %762, i32 0, i32 12, !dbg !3526
  %764 = load i16, ptr %763, align 4, !dbg !3526
  %765 = sext i16 %764 to i32, !dbg !3525
  %766 = icmp sgt i32 %765, -1, !dbg !3527
  br i1 %766, label %767, label %781, !dbg !3528

767:                                              ; preds = %757
  %768 = load ptr, ptr %6, align 8, !dbg !3529
  %769 = getelementptr inbounds nuw %struct.object, ptr %768, i32 0, i32 8, !dbg !3530
  %770 = load i8, ptr %769, align 1, !dbg !3530
  %771 = zext i8 %770 to i32, !dbg !3529
  %772 = and i32 %771, 8, !dbg !3531
  %773 = icmp ne i32 %772, 0, !dbg !3532
  br i1 %773, label %781, label %774, !dbg !3528

774:                                              ; preds = %767
  %775 = load ptr, ptr %6, align 8, !dbg !3533
  %776 = getelementptr inbounds nuw %struct.object, ptr %775, i32 0, i32 9, !dbg !3534
  %777 = load i16, ptr %776, align 2, !dbg !3534
  %778 = load ptr, ptr %6, align 8, !dbg !3535
  %779 = getelementptr inbounds nuw %struct.object, ptr %778, i32 0, i32 11, !dbg !3536
  %780 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 11, i16 noundef signext %777, i16 noundef signext 0, ptr noundef %779, i32 noundef 0, i32 noundef 65536), !dbg !3537
  br label %781, !dbg !3537

781:                                              ; preds = %774, %767, %757
  br label %783, !dbg !3538

782:                                              ; preds = %747
  br label %783, !dbg !3539

783:                                              ; preds = %747, %782, %781, %750, %749
  br label %784, !dbg !3540

784:                                              ; preds = %783, %740
  br label %801, !dbg !3541

785:                                              ; preds = %660
  %786 = load ptr, ptr %6, align 8, !dbg !3542
  %787 = getelementptr inbounds nuw %struct.object, ptr %786, i32 0, i32 21, !dbg !3545
  %788 = getelementptr inbounds nuw %struct.physics_info, ptr %787, i32 0, i32 8, !dbg !3546
  %789 = load i16, ptr %788, align 2, !dbg !3546
  %790 = zext i16 %789 to i32, !dbg !3542
  %791 = and i32 %790, 4, !dbg !3547
  %792 = icmp ne i32 %791, 0, !dbg !3548
  br i1 %792, label %800, label %793, !dbg !3549

793:                                              ; preds = %785
  %794 = load ptr, ptr %6, align 8, !dbg !3550
  %795 = getelementptr inbounds nuw %struct.object, ptr %794, i32 0, i32 8, !dbg !3551
  %796 = load i8, ptr %795, align 1, !dbg !3552
  %797 = zext i8 %796 to i32, !dbg !3552
  %798 = or i32 %797, 2, !dbg !3552
  %799 = trunc i32 %798 to i8, !dbg !3552
  store i8 %799, ptr %795, align 1, !dbg !3552
  br label %800, !dbg !3550

800:                                              ; preds = %793, %785
  br label %801

801:                                              ; preds = %800, %784
  br label %802, !dbg !3553

802:                                              ; preds = %801, %209, %176, %98, %32
  ret void, !dbg !3554
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23collide_debris_and_wallP6objectissP10vms_vector(ptr noundef %0, i32 noundef %1, i16 noundef signext %2, i16 noundef signext %3, ptr noundef %4) #0 !dbg !3555 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !3556, !DIExpression(), !3557)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !3558, !DIExpression(), !3559)
  store i16 %2, ptr %8, align 2
    #dbg_declare(ptr %8, !3560, !DIExpression(), !3561)
  store i16 %3, ptr %9, align 2
    #dbg_declare(ptr %9, !3562, !DIExpression(), !3563)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !3564, !DIExpression(), !3565)
  %11 = load ptr, ptr %6, align 8, !dbg !3566
  call void @_Z14explode_objectP6objecti(ptr noundef %11, i32 noundef 0), !dbg !3567
  ret void, !dbg !3568
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19check_effect_blowupP7segmentiP10vms_vectorP6objecti(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4) #0 !dbg !3569 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
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
  %24 = alloca i32, align 4
  %25 = alloca %struct.bitmap_index, align 2
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !3572, !DIExpression(), !3573)
  store i32 %1, ptr %8, align 4
    #dbg_declare(ptr %8, !3574, !DIExpression(), !3575)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !3576, !DIExpression(), !3577)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !3578, !DIExpression(), !3579)
  store i32 %4, ptr %11, align 4
    #dbg_declare(ptr %11, !3580, !DIExpression(), !3581)
    #dbg_declare(ptr %12, !3582, !DIExpression(), !3583)
    #dbg_declare(ptr %13, !3584, !DIExpression(), !3585)
    #dbg_declare(ptr %14, !3586, !DIExpression(), !3587)
    #dbg_declare(ptr %15, !3588, !DIExpression(), !3589)
    #dbg_declare(ptr %16, !3590, !DIExpression(), !3592)
  store i32 0, ptr %16, align 4, !dbg !3592
  %31 = load ptr, ptr %10, align 8, !dbg !3593
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 22, !dbg !3595
  %33 = getelementptr inbounds nuw %struct.laser_info_s, ptr %32, i32 0, i32 0, !dbg !3596
  %34 = load i16, ptr %33, align 4, !dbg !3596
  %35 = sext i16 %34 to i32, !dbg !3593
  %36 = icmp eq i32 %35, 2, !dbg !3597
  br i1 %36, label %37, label %53, !dbg !3597

37:                                               ; preds = %5
  %38 = load ptr, ptr %10, align 8, !dbg !3598
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 22, !dbg !3600
  %40 = getelementptr inbounds nuw %struct.laser_info_s, ptr %39, i32 0, i32 1, !dbg !3601
  %41 = load i16, ptr %40, align 2, !dbg !3601
  %42 = sext i16 %41 to i64, !dbg !3602
  %43 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %42, !dbg !3602
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 2, !dbg !3603
  %45 = load i8, ptr %44, align 1, !dbg !3603
  %46 = zext i8 %45 to i64, !dbg !3604
  %47 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %46, !dbg !3604
  %48 = getelementptr inbounds nuw %struct.robot_info, ptr %47, i32 0, i32 37, !dbg !3605
  %49 = load i8, ptr %48, align 1, !dbg !3605
  %50 = icmp ne i8 %49, 0, !dbg !3604
  br i1 %50, label %51, label %52, !dbg !3604

51:                                               ; preds = %37
  store i32 1, ptr %16, align 4, !dbg !3606
  br label %52, !dbg !3607

52:                                               ; preds = %51, %37
  br label %53, !dbg !3605

53:                                               ; preds = %52, %5
  %54 = load i32, ptr %16, align 4, !dbg !3608
  %55 = icmp ne i32 %54, 0, !dbg !3608
  br i1 %55, label %86, label %56, !dbg !3610

56:                                               ; preds = %53
  %57 = load ptr, ptr %10, align 8, !dbg !3611
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 22, !dbg !3612
  %59 = getelementptr inbounds nuw %struct.laser_info_s, ptr %58, i32 0, i32 0, !dbg !3613
  %60 = load i16, ptr %59, align 4, !dbg !3613
  %61 = sext i16 %60 to i32, !dbg !3611
  %62 = icmp eq i32 %61, 4, !dbg !3614
  br i1 %62, label %86, label %63, !dbg !3615

63:                                               ; preds = %56
    #dbg_declare(ptr %17, !3616, !DIExpression(), !3618)
    #dbg_declare(ptr %18, !3619, !DIExpression(), !3620)
  %64 = load ptr, ptr %7, align 8, !dbg !3621
  %65 = getelementptr inbounds nuw %struct.segment, ptr %64, i32 0, i32 0, !dbg !3622
  %66 = load i32, ptr %8, align 4, !dbg !3623
  %67 = sext i32 %66 to i64, !dbg !3621
  %68 = getelementptr inbounds [6 x %struct.side], ptr %65, i64 0, i64 %67, !dbg !3621
  %69 = getelementptr inbounds nuw %struct.side, ptr %68, i32 0, i32 2, !dbg !3624
  %70 = load i16, ptr %69, align 2, !dbg !3624
  %71 = sext i16 %70 to i32, !dbg !3621
  store i32 %71, ptr %18, align 4, !dbg !3625
  %72 = load i32, ptr %18, align 4, !dbg !3626
  %73 = icmp ne i32 %72, -1, !dbg !3628
  br i1 %73, label %74, label %85, !dbg !3628

74:                                               ; preds = %63
  %75 = load i32, ptr %18, align 4, !dbg !3629
  %76 = sext i32 %75 to i64, !dbg !3631
  %77 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %76, !dbg !3631
  %78 = getelementptr inbounds nuw %struct.wall, ptr %77, i32 0, i32 7, !dbg !3632
  %79 = load i8, ptr %78, align 1, !dbg !3632
  %80 = sext i8 %79 to i32, !dbg !3631
  store i32 %80, ptr %17, align 4, !dbg !3633
  %81 = load i32, ptr %17, align 4, !dbg !3634
  %82 = icmp ne i32 %81, -1, !dbg !3636
  br i1 %82, label %83, label %84, !dbg !3636

83:                                               ; preds = %74
  store i32 0, ptr %6, align 4, !dbg !3637
  br label %490, !dbg !3637

84:                                               ; preds = %74
  br label %85, !dbg !3638

85:                                               ; preds = %84, %63
  br label %86, !dbg !3639

86:                                               ; preds = %85, %56, %53
  %87 = load ptr, ptr %7, align 8, !dbg !3640
  %88 = getelementptr inbounds nuw %struct.segment, ptr %87, i32 0, i32 0, !dbg !3642
  %89 = load i32, ptr %8, align 4, !dbg !3643
  %90 = sext i32 %89 to i64, !dbg !3640
  %91 = getelementptr inbounds [6 x %struct.side], ptr %88, i64 0, i64 %90, !dbg !3640
  %92 = getelementptr inbounds nuw %struct.side, ptr %91, i32 0, i32 4, !dbg !3644
  %93 = load i16, ptr %92, align 2, !dbg !3644
  %94 = sext i16 %93 to i32, !dbg !3640
  store i32 %94, ptr %12, align 4, !dbg !3645
  %95 = icmp ne i32 %94, 0, !dbg !3646
  br i1 %95, label %96, label %489, !dbg !3646

96:                                               ; preds = %86
  %97 = load i32, ptr %12, align 4, !dbg !3647
  %98 = and i32 %97, 49152, !dbg !3649
  store i32 %98, ptr %13, align 4, !dbg !3650
  %99 = load i32, ptr %12, align 4, !dbg !3651
  %100 = and i32 %99, 16383, !dbg !3651
  store i32 %100, ptr %12, align 4, !dbg !3651
  %101 = load i32, ptr %12, align 4, !dbg !3652
  %102 = sext i32 %101 to i64, !dbg !3654
  %103 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %102, !dbg !3654
  %104 = getelementptr inbounds nuw %struct.tmap_info, ptr %103, i32 0, i32 4, !dbg !3655
  %105 = load i16, ptr %104, align 4, !dbg !3655
  %106 = sext i16 %105 to i32, !dbg !3654
  store i32 %106, ptr %14, align 4, !dbg !3656
  %107 = icmp ne i32 %106, -1, !dbg !3657
  br i1 %107, label %108, label %123, !dbg !3658

108:                                              ; preds = %96
  %109 = load i32, ptr %14, align 4, !dbg !3659
  %110 = sext i32 %109 to i64, !dbg !3660
  %111 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %110, !dbg !3660
  %112 = getelementptr inbounds nuw %struct.eclip, ptr %111, i32 0, i32 7, !dbg !3661
  %113 = load i32, ptr %112, align 4, !dbg !3661
  store i32 %113, ptr %15, align 4, !dbg !3662
  %114 = icmp ne i32 %113, -1, !dbg !3663
  br i1 %114, label %115, label %123, !dbg !3664

115:                                              ; preds = %108
  %116 = load i32, ptr %14, align 4, !dbg !3665
  %117 = sext i32 %116 to i64, !dbg !3666
  %118 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %117, !dbg !3666
  %119 = getelementptr inbounds nuw %struct.eclip, ptr %118, i32 0, i32 5, !dbg !3667
  %120 = load i32, ptr %119, align 4, !dbg !3667
  %121 = and i32 %120, 2, !dbg !3668
  %122 = icmp ne i32 %121, 0, !dbg !3669
  br i1 %122, label %123, label %134, !dbg !3670

123:                                              ; preds = %115, %108, %96
  %124 = load i32, ptr %14, align 4, !dbg !3671
  %125 = icmp eq i32 %124, -1, !dbg !3672
  br i1 %125, label %126, label %488, !dbg !3673

126:                                              ; preds = %123
  %127 = load i32, ptr %12, align 4, !dbg !3674
  %128 = sext i32 %127 to i64, !dbg !3675
  %129 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %128, !dbg !3675
  %130 = getelementptr inbounds nuw %struct.tmap_info, ptr %129, i32 0, i32 5, !dbg !3676
  %131 = load i16, ptr %130, align 2, !dbg !3676
  %132 = sext i16 %131 to i32, !dbg !3675
  %133 = icmp ne i32 %132, -1, !dbg !3677
  br i1 %133, label %134, label %488, !dbg !3670

134:                                              ; preds = %126, %115
    #dbg_declare(ptr %19, !3678, !DIExpression(), !3680)
    #dbg_declare(ptr %20, !3681, !DIExpression(), !3682)
    #dbg_declare(ptr %21, !3683, !DIExpression(), !3700)
  %135 = load i32, ptr %12, align 4, !dbg !3701
  %136 = sext i32 %135 to i64, !dbg !3702
  %137 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %136, !dbg !3702
  %138 = getelementptr inbounds nuw %struct.bitmap_index, ptr %137, i32 0, i32 0, !dbg !3703
  %139 = load i16, ptr %138, align 2, !dbg !3703
  %140 = zext i16 %139 to i64, !dbg !3704
  %141 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %140, !dbg !3704
  store ptr %141, ptr %21, align 8, !dbg !3700
    #dbg_declare(ptr %22, !3705, !DIExpression(), !3706)
    #dbg_declare(ptr %23, !3707, !DIExpression(), !3708)
    #dbg_declare(ptr %24, !3709, !DIExpression(), !3710)
  br label %142, !dbg !3711

142:                                              ; preds = %134
  %143 = load i32, ptr %12, align 4, !dbg !3712
  %144 = sext i32 %143 to i64, !dbg !3712
  %145 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %144, !dbg !3712
  %146 = getelementptr inbounds nuw %struct.bitmap_index, ptr %145, i32 0, i32 0, !dbg !3712
  %147 = load i16, ptr %146, align 2, !dbg !3712
  %148 = zext i16 %147 to i64, !dbg !3712
  %149 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %148, !dbg !3712
  %150 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %149, i32 0, i32 5, !dbg !3712
  %151 = load i8, ptr %150, align 1, !dbg !3712
  %152 = sext i8 %151 to i32, !dbg !3712
  %153 = and i32 %152, 16, !dbg !3712
  %154 = icmp ne i32 %153, 0, !dbg !3712
  br i1 %154, label %155, label %162, !dbg !3712

155:                                              ; preds = %142
  %156 = load i32, ptr %12, align 4, !dbg !3715
  %157 = sext i32 %156 to i64, !dbg !3715
  %158 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %157, !dbg !3715
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %25, ptr align 2 %158, i64 2, i1 false), !dbg !3715
  %159 = getelementptr inbounds nuw %struct.bitmap_index, ptr %25, i32 0, i32 0, !dbg !3715
  %160 = load i16, ptr %159, align 2, !dbg !3715
  %161 = zext i16 %160 to i64, !dbg !3715
  call void @_Z20piggy_bitmap_page_in12bitmap_index(i64 %161), !dbg !3715
  br label %162, !dbg !3715

162:                                              ; preds = %155, %142
  br label %163, !dbg !3717

163:                                              ; preds = %162
  %164 = load i32, ptr %11, align 4, !dbg !3718
  %165 = icmp ne i32 %164, 0, !dbg !3718
  br i1 %165, label %242, label %166, !dbg !3720

166:                                              ; preds = %163
  %167 = load ptr, ptr %9, align 8, !dbg !3721
  %168 = load ptr, ptr %7, align 8, !dbg !3723
  %169 = load i32, ptr %8, align 4, !dbg !3724
  call void @_Z16find_hitpoint_uvPiS_S_P10vms_vectorP7segmentii(ptr noundef %19, ptr noundef %20, ptr noundef null, ptr noundef %167, ptr noundef %168, i32 noundef %169, i32 noundef 0), !dbg !3725
  %170 = load i32, ptr %19, align 4, !dbg !3726
  %171 = load ptr, ptr %21, align 8, !dbg !3727
  %172 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %171, i32 0, i32 2, !dbg !3728
  %173 = load i16, ptr %172, align 4, !dbg !3728
  %174 = sext i16 %173 to i32, !dbg !3727
  %175 = mul nsw i32 %170, %174, !dbg !3729
  %176 = call noundef i32 @_Z3f2ii(i32 noundef %175), !dbg !3730
  %177 = load ptr, ptr %21, align 8, !dbg !3731
  %178 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %177, i32 0, i32 2, !dbg !3732
  %179 = load i16, ptr %178, align 4, !dbg !3732
  %180 = sext i16 %179 to i32, !dbg !3731
  %181 = urem i32 %176, %180, !dbg !3733
  store i32 %181, ptr %22, align 4, !dbg !3734
  %182 = load i32, ptr %20, align 4, !dbg !3735
  %183 = load ptr, ptr %21, align 8, !dbg !3736
  %184 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %183, i32 0, i32 3, !dbg !3737
  %185 = load i16, ptr %184, align 2, !dbg !3737
  %186 = sext i16 %185 to i32, !dbg !3736
  %187 = mul nsw i32 %182, %186, !dbg !3738
  %188 = call noundef i32 @_Z3f2ii(i32 noundef %187), !dbg !3739
  %189 = load ptr, ptr %21, align 8, !dbg !3740
  %190 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %189, i32 0, i32 3, !dbg !3741
  %191 = load i16, ptr %190, align 2, !dbg !3741
  %192 = sext i16 %191 to i32, !dbg !3740
  %193 = urem i32 %188, %192, !dbg !3742
  store i32 %193, ptr %23, align 4, !dbg !3743
  %194 = load i32, ptr %13, align 4, !dbg !3744
  switch i32 %194, label %231 [
    i32 0, label %195
    i32 16384, label %196
    i32 32768, label %206
    i32 49152, label %221
  ], !dbg !3745

195:                                              ; preds = %166
  br label %231, !dbg !3746

196:                                              ; preds = %166
  %197 = load i32, ptr %23, align 4, !dbg !3748
  store i32 %197, ptr %24, align 4, !dbg !3749
  %198 = load i32, ptr %22, align 4, !dbg !3750
  store i32 %198, ptr %23, align 4, !dbg !3751
  %199 = load ptr, ptr %21, align 8, !dbg !3752
  %200 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %199, i32 0, i32 2, !dbg !3753
  %201 = load i16, ptr %200, align 4, !dbg !3753
  %202 = sext i16 %201 to i32, !dbg !3752
  %203 = load i32, ptr %24, align 4, !dbg !3754
  %204 = sub nsw i32 %202, %203, !dbg !3755
  %205 = sub nsw i32 %204, 1, !dbg !3756
  store i32 %205, ptr %22, align 4, !dbg !3757
  br label %231, !dbg !3758

206:                                              ; preds = %166
  %207 = load ptr, ptr %21, align 8, !dbg !3759
  %208 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %207, i32 0, i32 3, !dbg !3760
  %209 = load i16, ptr %208, align 2, !dbg !3760
  %210 = sext i16 %209 to i32, !dbg !3759
  %211 = load i32, ptr %23, align 4, !dbg !3761
  %212 = sub nsw i32 %210, %211, !dbg !3762
  %213 = sub nsw i32 %212, 1, !dbg !3763
  store i32 %213, ptr %23, align 4, !dbg !3764
  %214 = load ptr, ptr %21, align 8, !dbg !3765
  %215 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %214, i32 0, i32 2, !dbg !3766
  %216 = load i16, ptr %215, align 4, !dbg !3766
  %217 = sext i16 %216 to i32, !dbg !3765
  %218 = load i32, ptr %22, align 4, !dbg !3767
  %219 = sub nsw i32 %217, %218, !dbg !3768
  %220 = sub nsw i32 %219, 1, !dbg !3769
  store i32 %220, ptr %22, align 4, !dbg !3770
  br label %231, !dbg !3771

221:                                              ; preds = %166
  %222 = load i32, ptr %22, align 4, !dbg !3772
  store i32 %222, ptr %24, align 4, !dbg !3773
  %223 = load i32, ptr %23, align 4, !dbg !3774
  store i32 %223, ptr %22, align 4, !dbg !3775
  %224 = load ptr, ptr %21, align 8, !dbg !3776
  %225 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %224, i32 0, i32 3, !dbg !3777
  %226 = load i16, ptr %225, align 2, !dbg !3777
  %227 = sext i16 %226 to i32, !dbg !3776
  %228 = load i32, ptr %24, align 4, !dbg !3778
  %229 = sub nsw i32 %227, %228, !dbg !3779
  %230 = sub nsw i32 %229, 1, !dbg !3780
  store i32 %230, ptr %23, align 4, !dbg !3781
  br label %231, !dbg !3782

231:                                              ; preds = %166, %221, %206, %196, %195
  %232 = load ptr, ptr %21, align 8, !dbg !3783
  %233 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %232, i32 0, i32 5, !dbg !3785
  %234 = load i8, ptr %233, align 1, !dbg !3785
  %235 = sext i8 %234 to i32, !dbg !3783
  %236 = and i32 %235, 8, !dbg !3786
  %237 = icmp ne i32 %236, 0, !dbg !3783
  br i1 %237, label %238, label %241, !dbg !3783

238:                                              ; preds = %231
  %239 = load ptr, ptr %21, align 8, !dbg !3787
  %240 = call noundef ptr @_Z18rle_expand_textureP11_grs_bitmap(ptr noundef %239), !dbg !3788
  store ptr %240, ptr %21, align 8, !dbg !3789
  br label %241, !dbg !3790

241:                                              ; preds = %238, %231
  br label %242, !dbg !3791

242:                                              ; preds = %241, %163
  %243 = load i32, ptr %11, align 4, !dbg !3792
  %244 = icmp ne i32 %243, 0, !dbg !3792
  br i1 %244, label %262, label %245, !dbg !3794

245:                                              ; preds = %242
  %246 = load ptr, ptr %21, align 8, !dbg !3795
  %247 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %246, i32 0, i32 7, !dbg !3796
  %248 = load ptr, ptr %247, align 8, !dbg !3796
  %249 = load i32, ptr %23, align 4, !dbg !3797
  %250 = load ptr, ptr %21, align 8, !dbg !3798
  %251 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %250, i32 0, i32 2, !dbg !3799
  %252 = load i16, ptr %251, align 4, !dbg !3799
  %253 = sext i16 %252 to i32, !dbg !3798
  %254 = mul nsw i32 %249, %253, !dbg !3800
  %255 = load i32, ptr %22, align 4, !dbg !3801
  %256 = add nsw i32 %254, %255, !dbg !3802
  %257 = sext i32 %256 to i64, !dbg !3795
  %258 = getelementptr inbounds i8, ptr %248, i64 %257, !dbg !3795
  %259 = load i8, ptr %258, align 1, !dbg !3795
  %260 = zext i8 %259 to i32, !dbg !3795
  %261 = icmp ne i32 %260, 255, !dbg !3803
  br i1 %261, label %262, label %487, !dbg !3794

262:                                              ; preds = %245, %242
    #dbg_declare(ptr %26, !3804, !DIExpression(), !3806)
    #dbg_declare(ptr %27, !3807, !DIExpression(), !3808)
    #dbg_declare(ptr %28, !3809, !DIExpression(), !3810)
  %263 = load ptr, ptr %7, align 8, !dbg !3811
  %264 = ptrtoint ptr %263 to i64, !dbg !3812
  %265 = sub i64 %264, ptrtoint (ptr @Segments to i64), !dbg !3812
  %266 = sdiv exact i64 %265, 512, !dbg !3812
  %267 = trunc i64 %266 to i32, !dbg !3811
  %268 = load i32, ptr %8, align 4, !dbg !3813
  %269 = call noundef i32 @_Z14subtract_lightii(i32 noundef %267, i32 noundef %268), !dbg !3814
  %270 = load i32, ptr @Newdemo_state, align 4, !dbg !3815
  %271 = icmp eq i32 %270, 1, !dbg !3817
  br i1 %271, label %272, label %280, !dbg !3817

272:                                              ; preds = %262
  %273 = load ptr, ptr %7, align 8, !dbg !3818
  %274 = ptrtoint ptr %273 to i64, !dbg !3819
  %275 = sub i64 %274, ptrtoint (ptr @Segments to i64), !dbg !3819
  %276 = sdiv exact i64 %275, 512, !dbg !3819
  %277 = trunc i64 %276 to i16, !dbg !3818
  %278 = load i32, ptr %8, align 4, !dbg !3820
  %279 = load ptr, ptr %9, align 8, !dbg !3821
  call void @_Z28newdemo_record_effect_blowupsiP10vms_vector(i16 noundef signext %277, i32 noundef %278, ptr noundef %279), !dbg !3822
  br label %280, !dbg !3822

280:                                              ; preds = %272, %262
  %281 = load i32, ptr %14, align 4, !dbg !3823
  %282 = icmp ne i32 %281, -1, !dbg !3825
  br i1 %282, label %283, label %294, !dbg !3825

283:                                              ; preds = %280
  %284 = load i32, ptr %14, align 4, !dbg !3826
  %285 = sext i32 %284 to i64, !dbg !3828
  %286 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %285, !dbg !3828
  %287 = getelementptr inbounds nuw %struct.eclip, ptr %286, i32 0, i32 10, !dbg !3829
  %288 = load i32, ptr %287, align 4, !dbg !3829
  store i32 %288, ptr %28, align 4, !dbg !3830
  %289 = load i32, ptr %14, align 4, !dbg !3831
  %290 = sext i32 %289 to i64, !dbg !3832
  %291 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %290, !dbg !3832
  %292 = getelementptr inbounds nuw %struct.eclip, ptr %291, i32 0, i32 8, !dbg !3833
  %293 = load i32, ptr %292, align 4, !dbg !3833
  store i32 %293, ptr %26, align 4, !dbg !3834
  br label %296, !dbg !3835

294:                                              ; preds = %280
  %295 = call noundef i32 @_Z3i2fi(i32 noundef 20), !dbg !3836
  store i32 %295, ptr %28, align 4, !dbg !3838
  store i32 3, ptr %26, align 4, !dbg !3839
  br label %296

296:                                              ; preds = %294, %283
  %297 = load ptr, ptr %7, align 8, !dbg !3840
  %298 = ptrtoint ptr %297 to i64, !dbg !3841
  %299 = sub i64 %298, ptrtoint (ptr @Segments to i64), !dbg !3841
  %300 = sdiv exact i64 %299, 512, !dbg !3841
  %301 = trunc i64 %300 to i16, !dbg !3840
  %302 = load ptr, ptr %9, align 8, !dbg !3842
  %303 = load i32, ptr %28, align 4, !dbg !3843
  %304 = load i32, ptr %26, align 4, !dbg !3844
  %305 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %301, ptr noundef %302, i32 noundef %303, i32 noundef %304), !dbg !3845
  %306 = load i32, ptr %14, align 4, !dbg !3846
  %307 = icmp ne i32 %306, -1, !dbg !3848
  br i1 %307, label %308, label %463, !dbg !3849

308:                                              ; preds = %296
  %309 = load i32, ptr %15, align 4, !dbg !3850
  %310 = icmp ne i32 %309, -1, !dbg !3851
  br i1 %310, label %311, label %463, !dbg !3852

311:                                              ; preds = %308
  %312 = load i32, ptr %14, align 4, !dbg !3853
  %313 = sext i32 %312 to i64, !dbg !3854
  %314 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %313, !dbg !3854
  %315 = getelementptr inbounds nuw %struct.eclip, ptr %314, i32 0, i32 5, !dbg !3855
  %316 = load i32, ptr %315, align 4, !dbg !3855
  %317 = and i32 %316, 2, !dbg !3856
  %318 = icmp ne i32 %317, 0, !dbg !3857
  br i1 %318, label %463, label %319, !dbg !3852

319:                                              ; preds = %311
  %320 = load i32, ptr %26, align 4, !dbg !3858
  %321 = sext i32 %320 to i64, !dbg !3861
  %322 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %321, !dbg !3861
  %323 = getelementptr inbounds nuw %struct.vclip, ptr %322, i32 0, i32 4, !dbg !3862
  %324 = load i16, ptr %323, align 4, !dbg !3862
  %325 = sext i16 %324 to i32, !dbg !3861
  store i32 %325, ptr %27, align 4, !dbg !3863
  %326 = icmp ne i32 %325, -1, !dbg !3864
  br i1 %326, label %327, label %336, !dbg !3864

327:                                              ; preds = %319
  %328 = load i32, ptr %27, align 4, !dbg !3865
  %329 = load ptr, ptr %7, align 8, !dbg !3866
  %330 = ptrtoint ptr %329 to i64, !dbg !3867
  %331 = sub i64 %330, ptrtoint (ptr @Segments to i64), !dbg !3867
  %332 = sdiv exact i64 %331, 512, !dbg !3867
  %333 = trunc i64 %332 to i16, !dbg !3866
  %334 = load ptr, ptr %9, align 8, !dbg !3868
  %335 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %328, i16 noundef signext %333, i16 noundef signext 0, ptr noundef %334, i32 noundef 0, i32 noundef 65536), !dbg !3869
  br label %336, !dbg !3869

336:                                              ; preds = %327, %319
  %337 = load i32, ptr %14, align 4, !dbg !3870
  %338 = sext i32 %337 to i64, !dbg !3872
  %339 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %338, !dbg !3872
  %340 = getelementptr inbounds nuw %struct.eclip, ptr %339, i32 0, i32 11, !dbg !3873
  %341 = load i32, ptr %340, align 4, !dbg !3873
  store i32 %341, ptr %27, align 4, !dbg !3874
  %342 = icmp ne i32 %341, -1, !dbg !3875
  br i1 %342, label %343, label %351, !dbg !3875

343:                                              ; preds = %336
  %344 = load ptr, ptr %7, align 8, !dbg !3876
  %345 = ptrtoint ptr %344 to i64, !dbg !3877
  %346 = sub i64 %345, ptrtoint (ptr @Segments to i64), !dbg !3877
  %347 = sdiv exact i64 %346, 512, !dbg !3877
  %348 = trunc i64 %347 to i32, !dbg !3876
  %349 = load i32, ptr %8, align 4, !dbg !3878
  %350 = load i32, ptr %27, align 4, !dbg !3879
  call void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef %348, i32 noundef %349, i32 noundef %350), !dbg !3880
  br label %351, !dbg !3880

351:                                              ; preds = %343, %336
  %352 = load i32, ptr %14, align 4, !dbg !3881
  %353 = sext i32 %352 to i64, !dbg !3883
  %354 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %353, !dbg !3883
  %355 = getelementptr inbounds nuw %struct.eclip, ptr %354, i32 0, i32 9, !dbg !3884
  %356 = load i32, ptr %355, align 4, !dbg !3884
  %357 = icmp ne i32 %356, -1, !dbg !3885
  br i1 %357, label %358, label %436, !dbg !3886

358:                                              ; preds = %351
  %359 = load i32, ptr %14, align 4, !dbg !3887
  %360 = sext i32 %359 to i64, !dbg !3888
  %361 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %360, !dbg !3888
  %362 = getelementptr inbounds nuw %struct.eclip, ptr %361, i32 0, i32 9, !dbg !3889
  %363 = load i32, ptr %362, align 4, !dbg !3889
  %364 = sext i32 %363 to i64, !dbg !3890
  %365 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %364, !dbg !3890
  %366 = getelementptr inbounds nuw %struct.eclip, ptr %365, i32 0, i32 12, !dbg !3891
  %367 = load i32, ptr %366, align 4, !dbg !3891
  %368 = icmp eq i32 %367, -1, !dbg !3892
  br i1 %368, label %369, label %436, !dbg !3886

369:                                              ; preds = %358
    #dbg_declare(ptr %29, !3893, !DIExpression(), !3895)
    #dbg_declare(ptr %30, !3896, !DIExpression(), !3928)
  %370 = load i32, ptr %14, align 4, !dbg !3929
  %371 = sext i32 %370 to i64, !dbg !3930
  %372 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %371, !dbg !3930
  %373 = getelementptr inbounds nuw %struct.eclip, ptr %372, i32 0, i32 9, !dbg !3931
  %374 = load i32, ptr %373, align 4, !dbg !3931
  %375 = sext i32 %374 to i64, !dbg !3932
  %376 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %375, !dbg !3932
  store ptr %376, ptr %30, align 8, !dbg !3933
  %377 = load ptr, ptr %30, align 8, !dbg !3934
  %378 = getelementptr inbounds nuw %struct.eclip, ptr %377, i32 0, i32 3, !dbg !3935
  %379 = load i16, ptr %378, align 4, !dbg !3935
  %380 = sext i16 %379 to i32, !dbg !3934
  store i32 %380, ptr %29, align 4, !dbg !3936
  %381 = load i32, ptr %29, align 4, !dbg !3937
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.3, i32 noundef %381), !dbg !3937
  %382 = load ptr, ptr %30, align 8, !dbg !3938
  %383 = getelementptr inbounds nuw %struct.eclip, ptr %382, i32 0, i32 0, !dbg !3939
  %384 = getelementptr inbounds nuw %struct.vclip, ptr %383, i32 0, i32 2, !dbg !3940
  %385 = load i32, ptr %384, align 4, !dbg !3940
  %386 = load ptr, ptr %30, align 8, !dbg !3941
  %387 = getelementptr inbounds nuw %struct.eclip, ptr %386, i32 0, i32 1, !dbg !3942
  store i32 %385, ptr %387, align 4, !dbg !3943
  %388 = load ptr, ptr %30, align 8, !dbg !3944
  %389 = getelementptr inbounds nuw %struct.eclip, ptr %388, i32 0, i32 2, !dbg !3945
  store i32 0, ptr %389, align 4, !dbg !3946
  %390 = load ptr, ptr %7, align 8, !dbg !3947
  %391 = ptrtoint ptr %390 to i64, !dbg !3948
  %392 = sub i64 %391, ptrtoint (ptr @Segments to i64), !dbg !3948
  %393 = sdiv exact i64 %392, 512, !dbg !3948
  %394 = trunc i64 %393 to i32, !dbg !3947
  %395 = load ptr, ptr %30, align 8, !dbg !3949
  %396 = getelementptr inbounds nuw %struct.eclip, ptr %395, i32 0, i32 12, !dbg !3950
  store i32 %394, ptr %396, align 4, !dbg !3951
  %397 = load i32, ptr %8, align 4, !dbg !3952
  %398 = load ptr, ptr %30, align 8, !dbg !3953
  %399 = getelementptr inbounds nuw %struct.eclip, ptr %398, i32 0, i32 13, !dbg !3954
  store i32 %397, ptr %399, align 4, !dbg !3955
  %400 = load ptr, ptr %30, align 8, !dbg !3956
  %401 = getelementptr inbounds nuw %struct.eclip, ptr %400, i32 0, i32 5, !dbg !3957
  %402 = load i32, ptr %401, align 4, !dbg !3958
  %403 = or i32 %402, 2, !dbg !3958
  store i32 %403, ptr %401, align 4, !dbg !3958
  %404 = load i32, ptr %14, align 4, !dbg !3959
  %405 = sext i32 %404 to i64, !dbg !3960
  %406 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %405, !dbg !3960
  %407 = getelementptr inbounds nuw %struct.eclip, ptr %406, i32 0, i32 7, !dbg !3961
  %408 = load i32, ptr %407, align 4, !dbg !3961
  %409 = load ptr, ptr %30, align 8, !dbg !3962
  %410 = getelementptr inbounds nuw %struct.eclip, ptr %409, i32 0, i32 7, !dbg !3963
  store i32 %408, ptr %410, align 4, !dbg !3964
  %411 = load i32, ptr %29, align 4, !dbg !3965
  %412 = icmp ne i32 %411, 0, !dbg !3965
  br i1 %412, label %413, label %423, !dbg !3965

413:                                              ; preds = %369
  %414 = load ptr, ptr %7, align 8, !dbg !3965
  %415 = getelementptr inbounds nuw %struct.segment, ptr %414, i32 0, i32 0, !dbg !3965
  %416 = load i32, ptr %8, align 4, !dbg !3965
  %417 = sext i32 %416 to i64, !dbg !3965
  %418 = getelementptr inbounds [6 x %struct.side], ptr %415, i64 0, i64 %417, !dbg !3965
  %419 = getelementptr inbounds nuw %struct.side, ptr %418, i32 0, i32 4, !dbg !3965
  %420 = load i16, ptr %419, align 2, !dbg !3965
  %421 = sext i16 %420 to i32, !dbg !3965
  %422 = icmp ne i32 %421, 0, !dbg !3965
  br label %423

423:                                              ; preds = %413, %369
  %424 = phi i1 [ false, %369 ], [ %422, %413 ], !dbg !3966
  %425 = zext i1 %424 to i32, !dbg !3965
  call void @_Z7_AssertiPKcS0_i(i32 noundef %425, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 662), !dbg !3965
  %426 = load i32, ptr %29, align 4, !dbg !3967
  %427 = load i32, ptr %13, align 4, !dbg !3968
  %428 = or i32 %426, %427, !dbg !3969
  %429 = trunc i32 %428 to i16, !dbg !3967
  %430 = load ptr, ptr %7, align 8, !dbg !3970
  %431 = getelementptr inbounds nuw %struct.segment, ptr %430, i32 0, i32 0, !dbg !3971
  %432 = load i32, ptr %8, align 4, !dbg !3972
  %433 = sext i32 %432 to i64, !dbg !3970
  %434 = getelementptr inbounds [6 x %struct.side], ptr %431, i64 0, i64 %433, !dbg !3970
  %435 = getelementptr inbounds nuw %struct.side, ptr %434, i32 0, i32 4, !dbg !3973
  store i16 %429, ptr %435, align 2, !dbg !3974
  br label %462, !dbg !3975

436:                                              ; preds = %358, %351
  %437 = load i32, ptr %15, align 4, !dbg !3976
  %438 = icmp ne i32 %437, 0, !dbg !3976
  br i1 %438, label %439, label %449, !dbg !3976

439:                                              ; preds = %436
  %440 = load ptr, ptr %7, align 8, !dbg !3976
  %441 = getelementptr inbounds nuw %struct.segment, ptr %440, i32 0, i32 0, !dbg !3976
  %442 = load i32, ptr %8, align 4, !dbg !3976
  %443 = sext i32 %442 to i64, !dbg !3976
  %444 = getelementptr inbounds [6 x %struct.side], ptr %441, i64 0, i64 %443, !dbg !3976
  %445 = getelementptr inbounds nuw %struct.side, ptr %444, i32 0, i32 4, !dbg !3976
  %446 = load i16, ptr %445, align 2, !dbg !3976
  %447 = sext i16 %446 to i32, !dbg !3976
  %448 = icmp ne i32 %447, 0, !dbg !3976
  br label %449

449:                                              ; preds = %439, %436
  %450 = phi i1 [ false, %436 ], [ %448, %439 ], !dbg !3978
  %451 = zext i1 %450 to i32, !dbg !3976
  call void @_Z7_AssertiPKcS0_i(i32 noundef %451, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 667), !dbg !3976
  %452 = load i32, ptr %15, align 4, !dbg !3979
  %453 = load i32, ptr %13, align 4, !dbg !3980
  %454 = or i32 %452, %453, !dbg !3981
  %455 = trunc i32 %454 to i16, !dbg !3979
  %456 = load ptr, ptr %7, align 8, !dbg !3982
  %457 = getelementptr inbounds nuw %struct.segment, ptr %456, i32 0, i32 0, !dbg !3983
  %458 = load i32, ptr %8, align 4, !dbg !3984
  %459 = sext i32 %458 to i64, !dbg !3982
  %460 = getelementptr inbounds [6 x %struct.side], ptr %457, i64 0, i64 %459, !dbg !3982
  %461 = getelementptr inbounds nuw %struct.side, ptr %460, i32 0, i32 4, !dbg !3985
  store i16 %455, ptr %461, align 2, !dbg !3986
  br label %462

462:                                              ; preds = %449, %423
  br label %486, !dbg !3987

463:                                              ; preds = %311, %308, %296
  %464 = load i32, ptr %12, align 4, !dbg !3988
  %465 = sext i32 %464 to i64, !dbg !3990
  %466 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %465, !dbg !3990
  %467 = getelementptr inbounds nuw %struct.tmap_info, ptr %466, i32 0, i32 5, !dbg !3991
  %468 = load i16, ptr %467, align 2, !dbg !3991
  %469 = sext i16 %468 to i32, !dbg !3990
  %470 = load i32, ptr %13, align 4, !dbg !3992
  %471 = or i32 %469, %470, !dbg !3993
  %472 = trunc i32 %471 to i16, !dbg !3990
  %473 = load ptr, ptr %7, align 8, !dbg !3994
  %474 = getelementptr inbounds nuw %struct.segment, ptr %473, i32 0, i32 0, !dbg !3995
  %475 = load i32, ptr %8, align 4, !dbg !3996
  %476 = sext i32 %475 to i64, !dbg !3994
  %477 = getelementptr inbounds [6 x %struct.side], ptr %474, i64 0, i64 %476, !dbg !3994
  %478 = getelementptr inbounds nuw %struct.side, ptr %477, i32 0, i32 4, !dbg !3997
  store i16 %472, ptr %478, align 2, !dbg !3998
  %479 = load ptr, ptr %7, align 8, !dbg !3999
  %480 = ptrtoint ptr %479 to i64, !dbg !4000
  %481 = sub i64 %480, ptrtoint (ptr @Segments to i64), !dbg !4000
  %482 = sdiv exact i64 %481, 512, !dbg !4000
  %483 = trunc i64 %482 to i16, !dbg !3999
  %484 = load ptr, ptr %9, align 8, !dbg !4001
  %485 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 157, i16 noundef signext %483, i16 noundef signext 0, ptr noundef %484, i32 noundef 0, i32 noundef 65536), !dbg !4002
  br label %486

486:                                              ; preds = %463, %462
  store i32 1, ptr %6, align 4, !dbg !4003
  br label %490, !dbg !4003

487:                                              ; preds = %245
  br label %488, !dbg !4004

488:                                              ; preds = %487, %126, %123
  br label %489, !dbg !4005

489:                                              ; preds = %488, %86
  store i32 0, ptr %6, align 4, !dbg !4006
  br label %490, !dbg !4006

490:                                              ; preds = %489, %486, %83
  %491 = load i32, ptr %6, align 4, !dbg !4007
  ret i32 %491, !dbg !4007
}

declare void @_Z20piggy_bitmap_page_in12bitmap_index(i64) #1

declare void @_Z16find_hitpoint_uvPiS_S_P10vms_vectorP7segmentii(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef ptr @_Z18rle_expand_textureP11_grs_bitmap(ptr noundef) #1

declare noundef i32 @_Z14subtract_lightii(i32 noundef, i32 noundef) #1

declare void @_Z28newdemo_record_effect_blowupsiP10vms_vector(i16 noundef signext, i32 noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #2 !dbg !4008 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4011, !DIExpression(), !4012)
  %3 = load i32, ptr %2, align 4, !dbg !4013
  %4 = shl i32 %3, 16, !dbg !4014
  ret i32 %4, !dbg !4015
}

declare noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %0) #0 !dbg !4016 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4019, !DIExpression(), !4020)
    #dbg_declare(ptr %4, !4021, !DIExpression(), !4022)
  %7 = load ptr, ptr %3, align 8, !dbg !4023
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 22, !dbg !4024
  %9 = getelementptr inbounds nuw %struct.laser_info_s, ptr %8, i32 0, i32 2, !dbg !4025
  %10 = load i32, ptr %9, align 4, !dbg !4025
  store i32 %10, ptr %4, align 4, !dbg !4022
    #dbg_declare(ptr %5, !4026, !DIExpression(), !4027)
  %11 = load ptr, ptr %3, align 8, !dbg !4028
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 22, !dbg !4029
  %13 = getelementptr inbounds nuw %struct.laser_info_s, ptr %12, i32 0, i32 1, !dbg !4030
  %14 = load i16, ptr %13, align 2, !dbg !4030
  %15 = sext i16 %14 to i32, !dbg !4028
  store i32 %15, ptr %5, align 4, !dbg !4027
  %16 = load i32, ptr @Game_mode, align 4, !dbg !4031
  %17 = and i32 %16, 38, !dbg !4033
  %18 = icmp ne i32 %17, 0, !dbg !4034
  br i1 %18, label %20, label %19, !dbg !4035

19:                                               ; preds = %1
  store i32 1, ptr %2, align 4, !dbg !4036
  br label %43, !dbg !4036

20:                                               ; preds = %1
  %21 = load i32, ptr %5, align 4, !dbg !4037
  %22 = sext i32 %21 to i64, !dbg !4039
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !4039
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 0, !dbg !4040
  %25 = load i32, ptr %24, align 4, !dbg !4040
  %26 = load i32, ptr %4, align 4, !dbg !4041
  %27 = icmp ne i32 %25, %26, !dbg !4042
  br i1 %27, label %28, label %29, !dbg !4042

28:                                               ; preds = %20
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.6), !dbg !4043
  br label %42, !dbg !4043

29:                                               ; preds = %20
    #dbg_declare(ptr %6, !4044, !DIExpression(), !4046)
  %30 = load i32, ptr %5, align 4, !dbg !4047
  %31 = sext i32 %30 to i64, !dbg !4048
  %32 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %31, !dbg !4048
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 11, !dbg !4049
  %34 = load ptr, ptr %3, align 8, !dbg !4050
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 11, !dbg !4051
  %36 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %33, ptr noundef %35), !dbg !4052
  store i32 %36, ptr %6, align 4, !dbg !4046
  %37 = load i32, ptr %6, align 4, !dbg !4053
  %38 = icmp sgt i32 %37, 5242880, !dbg !4055
  br i1 %38, label %39, label %40, !dbg !4055

39:                                               ; preds = %29
  store i32 0, ptr %2, align 4, !dbg !4056
  br label %43, !dbg !4056

40:                                               ; preds = %29
  br label %41

41:                                               ; preds = %40
  br label %42

42:                                               ; preds = %41, %28
  store i32 1, ptr %2, align 4, !dbg !4058
  br label %43, !dbg !4058

43:                                               ; preds = %42, %39, %19
  %44 = load i32, ptr %2, align 4, !dbg !4059
  ret i32 %44, !dbg !4059
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef float @_Z4f2fli(i32 noundef %0) #2 !dbg !4060 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4063, !DIExpression(), !4064)
  %3 = load i32, ptr %2, align 4, !dbg !4065
  %4 = sitofp i32 %3 to float, !dbg !4065
  %5 = fdiv float %4, 6.553600e+04, !dbg !4066
  ret float %5, !dbg !4067
}

declare noundef i32 @_Z16HUD_init_messagePKcz(ptr noundef, ...) #1

declare noundef i32 @_Z9add_lightii(i32 noundef, i32 noundef) #1

declare void @_Z13check_triggerP7segmentssi(ptr noundef, i16 noundef signext, i16 noundef signext, i32 noundef) #1

declare void @_Z16smega_rock_stuffv() #1

declare noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef, i16 noundef signext, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23collide_robot_and_robotP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4068 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4071, !DIExpression(), !4072)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4073, !DIExpression(), !4074)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4075, !DIExpression(), !4076)
  %7 = load ptr, ptr %4, align 8, !dbg !4077
  %8 = load ptr, ptr %5, align 8, !dbg !4078
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %7, ptr noundef %8, i32 noundef 1), !dbg !4079
  ret void, !dbg !4080
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z28collide_robot_and_controlcenP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4081 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.vms_vector, align 4
  %8 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4082, !DIExpression(), !4083)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4084, !DIExpression(), !4085)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4086, !DIExpression(), !4087)
  %9 = load ptr, ptr %4, align 8, !dbg !4088
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 1, !dbg !4090
  %11 = load i8, ptr %10, align 4, !dbg !4090
  %12 = zext i8 %11 to i32, !dbg !4088
  %13 = icmp eq i32 %12, 2, !dbg !4091
  br i1 %13, label %14, label %22, !dbg !4091

14:                                               ; preds = %3
    #dbg_declare(ptr %7, !4092, !DIExpression(), !4094)
  %15 = load ptr, ptr %5, align 8, !dbg !4095
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 11, !dbg !4096
  %17 = load ptr, ptr %4, align 8, !dbg !4097
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 11, !dbg !4098
  %19 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %7, ptr noundef %16, ptr noundef %18), !dbg !4099
  %20 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %19), !dbg !4100
  %21 = load ptr, ptr %4, align 8, !dbg !4101
  call void @_Z15bump_one_objectP6objectP10vms_vectori(ptr noundef %21, ptr noundef %7, i32 noundef 0), !dbg !4102
  br label %30, !dbg !4103

22:                                               ; preds = %3
    #dbg_declare(ptr %8, !4104, !DIExpression(), !4106)
  %23 = load ptr, ptr %4, align 8, !dbg !4107
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 11, !dbg !4108
  %25 = load ptr, ptr %5, align 8, !dbg !4109
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 11, !dbg !4110
  %27 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %24, ptr noundef %26), !dbg !4111
  %28 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %27), !dbg !4112
  %29 = load ptr, ptr %5, align 8, !dbg !4113
  call void @_Z15bump_one_objectP6objectP10vms_vectori(ptr noundef %29, ptr noundef %8, i32 noundef 0), !dbg !4114
  br label %30

30:                                               ; preds = %22, %14
  ret void, !dbg !4115
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24collide_robot_and_playerP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4116 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4117, !DIExpression(), !4118)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4119, !DIExpression(), !4120)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4121, !DIExpression(), !4122)
    #dbg_declare(ptr %7, !4123, !DIExpression(), !4124)
  store i32 0, ptr %7, align 4, !dbg !4124
    #dbg_declare(ptr %8, !4125, !DIExpression(), !4126)
  %9 = load ptr, ptr %4, align 8, !dbg !4127
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 8, !dbg !4129
  %11 = load i8, ptr %10, align 1, !dbg !4129
  %12 = zext i8 %11 to i32, !dbg !4127
  %13 = and i32 %12, 1, !dbg !4130
  %14 = icmp ne i32 %13, 0, !dbg !4127
  br i1 %14, label %15, label %16, !dbg !4127

15:                                               ; preds = %3
  br label %151, !dbg !4131

16:                                               ; preds = %3
  %17 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4132
  %18 = icmp ne i32 %17, 0, !dbg !4134
  br i1 %18, label %19, label %37, !dbg !4134

19:                                               ; preds = %16
  %20 = load ptr, ptr %6, align 8, !dbg !4135
  %21 = load ptr, ptr %5, align 8, !dbg !4137
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 9, !dbg !4138
  %23 = load i16, ptr %22, align 2, !dbg !4138
  %24 = sext i16 %23 to i32, !dbg !4137
  %25 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %20, i32 noundef %24), !dbg !4139
  store i32 %25, ptr %8, align 4, !dbg !4140
  %26 = load i32, ptr %8, align 4, !dbg !4141
  %27 = icmp ne i32 %26, -1, !dbg !4143
  br i1 %27, label %28, label %36, !dbg !4143

28:                                               ; preds = %19
  %29 = load i32, ptr %8, align 4, !dbg !4144
  %30 = trunc i32 %29 to i16, !dbg !4144
  %31 = load ptr, ptr %6, align 8, !dbg !4145
  %32 = load i32, ptr getelementptr inbounds nuw (%struct.weapon_info, ptr @Weapon_info, i32 0, i32 28), align 4, !dbg !4146
  %33 = load i8, ptr getelementptr inbounds nuw (%struct.weapon_info, ptr @Weapon_info, i32 0, i32 7), align 2, !dbg !4147
  %34 = sext i8 %33 to i32, !dbg !4148
  %35 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %30, ptr noundef %31, i32 noundef %32, i32 noundef %34), !dbg !4149
  br label %36, !dbg !4149

36:                                               ; preds = %28, %19
  br label %37, !dbg !4150

37:                                               ; preds = %36, %16
  %38 = load ptr, ptr %5, align 8, !dbg !4151
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 2, !dbg !4153
  %40 = load i8, ptr %39, align 1, !dbg !4153
  %41 = zext i8 %40 to i32, !dbg !4151
  %42 = load i32, ptr @Player_num, align 4, !dbg !4154
  %43 = icmp eq i32 %41, %42, !dbg !4155
  br i1 %43, label %44, label %130, !dbg !4155

44:                                               ; preds = %37
  %45 = load ptr, ptr %4, align 8, !dbg !4156
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 2, !dbg !4159
  %47 = load i8, ptr %46, align 1, !dbg !4159
  %48 = zext i8 %47 to i64, !dbg !4160
  %49 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %48, !dbg !4160
  %50 = getelementptr inbounds nuw %struct.robot_info, ptr %49, i32 0, i32 37, !dbg !4161
  %51 = load i8, ptr %50, align 1, !dbg !4161
  %52 = icmp ne i8 %51, 0, !dbg !4160
  br i1 %52, label %53, label %54, !dbg !4160

53:                                               ; preds = %44
  br label %151, !dbg !4162

54:                                               ; preds = %44
  %55 = load ptr, ptr %4, align 8, !dbg !4163
  %56 = getelementptr inbounds nuw %struct.object, ptr %55, i32 0, i32 2, !dbg !4165
  %57 = load i8, ptr %56, align 1, !dbg !4165
  %58 = zext i8 %57 to i64, !dbg !4166
  %59 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %58, !dbg !4166
  %60 = getelementptr inbounds nuw %struct.robot_info, ptr %59, i32 0, i32 14, !dbg !4167
  %61 = load i8, ptr %60, align 1, !dbg !4167
  %62 = icmp ne i8 %61, 0, !dbg !4166
  br i1 %62, label %63, label %88, !dbg !4166

63:                                               ; preds = %54
  %64 = load ptr, ptr %4, align 8, !dbg !4168
  %65 = load ptr, ptr %4, align 8, !dbg !4170
  %66 = getelementptr inbounds nuw %struct.object, ptr %65, i32 0, i32 14, !dbg !4171
  %67 = load i32, ptr %66, align 4, !dbg !4171
  %68 = add nsw i32 %67, 1, !dbg !4172
  %69 = load ptr, ptr %5, align 8, !dbg !4173
  %70 = ptrtoint ptr %69 to i64, !dbg !4174
  %71 = sub i64 %70, ptrtoint (ptr @Objects to i64), !dbg !4174
  %72 = sdiv exact i64 %71, 268, !dbg !4174
  %73 = trunc i64 %72 to i32, !dbg !4173
  %74 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %64, i32 noundef %68, i32 noundef %73), !dbg !4175
  %75 = load ptr, ptr %5, align 8, !dbg !4176
  %76 = load ptr, ptr @ConsoleObject, align 8, !dbg !4178
  %77 = icmp eq ptr %75, %76, !dbg !4179
  br i1 %77, label %78, label %87, !dbg !4179

78:                                               ; preds = %63
  %79 = load ptr, ptr %4, align 8, !dbg !4180
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 2, !dbg !4181
  %81 = load i8, ptr %80, align 1, !dbg !4181
  %82 = zext i8 %81 to i64, !dbg !4182
  %83 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %82, !dbg !4182
  %84 = getelementptr inbounds nuw %struct.robot_info, ptr %83, i32 0, i32 15, !dbg !4183
  %85 = load i16, ptr %84, align 4, !dbg !4183
  %86 = sext i16 %85 to i32, !dbg !4182
  call void @_Z19add_points_to_scorei(i32 noundef %86), !dbg !4184
  br label %87, !dbg !4184

87:                                               ; preds = %78, %63
  br label %88, !dbg !4185

88:                                               ; preds = %87, %54
  %89 = load ptr, ptr %4, align 8, !dbg !4186
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 2, !dbg !4188
  %91 = load i8, ptr %90, align 1, !dbg !4188
  %92 = zext i8 %91 to i64, !dbg !4189
  %93 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %92, !dbg !4189
  %94 = getelementptr inbounds nuw %struct.robot_info, ptr %93, i32 0, i32 40, !dbg !4190
  %95 = load i8, ptr %94, align 4, !dbg !4190
  %96 = icmp ne i8 %95, 0, !dbg !4189
  br i1 %96, label %97, label %124, !dbg !4189

97:                                               ; preds = %88
  %98 = load ptr, ptr %4, align 8, !dbg !4191
  %99 = ptrtoint ptr %98 to i64, !dbg !4194
  %100 = sub i64 %99, ptrtoint (ptr @Objects to i64), !dbg !4194
  %101 = sdiv exact i64 %100, 268, !dbg !4194
  %102 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %101, !dbg !4195
  %103 = getelementptr inbounds nuw %struct.ai_local, ptr %102, i32 0, i32 3, !dbg !4196
  %104 = load i32, ptr %103, align 4, !dbg !4196
  %105 = icmp eq i32 %104, 15, !dbg !4197
  br i1 %105, label %106, label %114, !dbg !4197

106:                                              ; preds = %97
  %107 = load i32, ptr @GameTime, align 4, !dbg !4198
  store i32 %107, ptr @Last_thief_hit_time, align 4, !dbg !4200
  %108 = load ptr, ptr %4, align 8, !dbg !4201
  %109 = load ptr, ptr %5, align 8, !dbg !4202
  %110 = getelementptr inbounds nuw %struct.object, ptr %109, i32 0, i32 2, !dbg !4203
  %111 = load i8, ptr %110, align 1, !dbg !4203
  %112 = zext i8 %111 to i32, !dbg !4202
  %113 = call noundef i32 @_Z21attempt_to_steal_itemP6objecti(ptr noundef %108, i32 noundef %112), !dbg !4204
  store i32 1, ptr %7, align 4, !dbg !4205
  br label %123, !dbg !4206

114:                                              ; preds = %97
  %115 = load i32, ptr @GameTime, align 4, !dbg !4207
  %116 = load i32, ptr @Last_thief_hit_time, align 4, !dbg !4209
  %117 = sub nsw i32 %115, %116, !dbg !4210
  %118 = icmp slt i32 %117, 131072, !dbg !4211
  br i1 %118, label %119, label %120, !dbg !4211

119:                                              ; preds = %114
  br label %151, !dbg !4212

120:                                              ; preds = %114
  %121 = load i32, ptr @GameTime, align 4, !dbg !4213
  store i32 %121, ptr @Last_thief_hit_time, align 4, !dbg !4214
  br label %122

122:                                              ; preds = %120
  br label %123

123:                                              ; preds = %122, %106
  br label %124, !dbg !4215

124:                                              ; preds = %123, %88
  %125 = load ptr, ptr %5, align 8, !dbg !4216
  call void @_Z22create_awareness_eventP6objecti(ptr noundef %125, i32 noundef 3), !dbg !4217
  %126 = load ptr, ptr %4, align 8, !dbg !4218
  %127 = load ptr, ptr %5, align 8, !dbg !4219
  %128 = load ptr, ptr %6, align 8, !dbg !4220
  call void @_Z22do_ai_robot_hit_attackP6objectS0_P10vms_vector(ptr noundef %126, ptr noundef %127, ptr noundef %128), !dbg !4221
  %129 = load ptr, ptr %4, align 8, !dbg !4222
  call void @_Z15do_ai_robot_hitP6objecti(ptr noundef %129, i32 noundef 4), !dbg !4223
  br label %130, !dbg !4224

130:                                              ; preds = %124, %37
  %131 = load i32, ptr %7, align 4, !dbg !4225
  %132 = icmp ne i32 %131, 0, !dbg !4225
  br i1 %132, label %148, label %133, !dbg !4227

133:                                              ; preds = %130
  %134 = load ptr, ptr %4, align 8, !dbg !4228
  %135 = getelementptr inbounds nuw %struct.object, ptr %134, i32 0, i32 2, !dbg !4229
  %136 = load i8, ptr %135, align 1, !dbg !4229
  %137 = zext i8 %136 to i64, !dbg !4230
  %138 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %137, !dbg !4230
  %139 = getelementptr inbounds nuw %struct.robot_info, ptr %138, i32 0, i32 17, !dbg !4231
  %140 = load i8, ptr %139, align 1, !dbg !4231
  %141 = icmp ne i8 %140, 0, !dbg !4230
  br i1 %141, label %148, label %142, !dbg !4227

142:                                              ; preds = %133
  %143 = load ptr, ptr %5, align 8, !dbg !4232
  %144 = getelementptr inbounds nuw %struct.object, ptr %143, i32 0, i32 9, !dbg !4233
  %145 = load i16, ptr %144, align 2, !dbg !4233
  %146 = load ptr, ptr %6, align 8, !dbg !4234
  %147 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 17, i16 noundef signext %145, i16 noundef signext 0, ptr noundef %146, i32 noundef 0, i32 noundef 65536), !dbg !4235
  br label %148, !dbg !4235

148:                                              ; preds = %142, %133, %130
  %149 = load ptr, ptr %4, align 8, !dbg !4236
  %150 = load ptr, ptr %5, align 8, !dbg !4237
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %149, ptr noundef %150, i32 noundef 1), !dbg !4238
  br label %151, !dbg !4239

151:                                              ; preds = %148, %119, %53, %15
  ret void, !dbg !4240
}

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #1

declare noundef i32 @_Z21attempt_to_steal_itemP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z22do_ai_robot_hit_attackP6objectS0_P10vms_vector(ptr noundef, ptr noundef, ptr noundef) #1

declare void @_Z15do_ai_robot_hitP6objecti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22net_destroy_controlcenP6object(ptr noundef %0) #0 !dbg !4241 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4244, !DIExpression(), !4245)
  %4 = load i32, ptr @Control_center_destroyed, align 4, !dbg !4246
  %5 = icmp ne i32 %4, 1, !dbg !4248
  br i1 %5, label %6, label %26, !dbg !4248

6:                                                ; preds = %1
    #dbg_declare(ptr %3, !4249, !DIExpression(), !4251)
  %7 = load ptr, ptr %2, align 8, !dbg !4252
  call void @_Z29do_controlcen_destroyed_stuffP6object(ptr noundef %7), !dbg !4253
  %8 = load ptr, ptr %2, align 8, !dbg !4254
  %9 = icmp ne ptr %8, null, !dbg !4256
  br i1 %9, label %10, label %25, !dbg !4257

10:                                               ; preds = %6
  %11 = load ptr, ptr %2, align 8, !dbg !4258
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 8, !dbg !4259
  %13 = load i8, ptr %12, align 1, !dbg !4259
  %14 = zext i8 %13 to i32, !dbg !4258
  %15 = and i32 %14, 5, !dbg !4260
  %16 = icmp ne i32 %15, 0, !dbg !4261
  br i1 %16, label %25, label %17, !dbg !4257

17:                                               ; preds = %10
  %18 = load ptr, ptr %2, align 8, !dbg !4262
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 9, !dbg !4264
  %20 = load i16, ptr %19, align 2, !dbg !4264
  %21 = load ptr, ptr %2, align 8, !dbg !4265
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 11, !dbg !4266
  %23 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 31, i16 noundef signext %20, i16 noundef signext 0, ptr noundef %22, i32 noundef 0, i32 noundef 65536), !dbg !4267
  %24 = load ptr, ptr %2, align 8, !dbg !4268
  call void @_Z14explode_objectP6objecti(ptr noundef %24, i32 noundef 0), !dbg !4269
  br label %25, !dbg !4270

25:                                               ; preds = %17, %10, %6
  br label %26, !dbg !4271

26:                                               ; preds = %25, %1
  ret void, !dbg !4272
}

declare void @_Z29do_controlcen_destroyed_stuffP6object(ptr noundef) #1

declare void @_Z17ai_do_cloak_stuffv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z29collide_player_and_controlcenP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4273 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4274, !DIExpression(), !4275)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4276, !DIExpression(), !4277)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4278, !DIExpression(), !4279)
  %7 = load ptr, ptr %5, align 8, !dbg !4280
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 2, !dbg !4282
  %9 = load i8, ptr %8, align 1, !dbg !4282
  %10 = zext i8 %9 to i32, !dbg !4280
  %11 = load i32, ptr @Player_num, align 4, !dbg !4283
  %12 = icmp eq i32 %10, %11, !dbg !4284
  br i1 %12, label %13, label %14, !dbg !4284

13:                                               ; preds = %3
  store i32 1, ptr @Control_center_been_hit, align 4, !dbg !4285
  call void @_Z17ai_do_cloak_stuffv(), !dbg !4287
  br label %14, !dbg !4288

14:                                               ; preds = %13, %3
  %15 = load ptr, ptr %5, align 8, !dbg !4289
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 9, !dbg !4290
  %17 = load i16, ptr %16, align 2, !dbg !4290
  %18 = load ptr, ptr %6, align 8, !dbg !4291
  %19 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 17, i16 noundef signext %17, i16 noundef signext 0, ptr noundef %18, i32 noundef 0, i32 noundef 65536), !dbg !4292
  %20 = load ptr, ptr %4, align 8, !dbg !4293
  %21 = load ptr, ptr %5, align 8, !dbg !4294
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %20, ptr noundef %21, i32 noundef 1), !dbg !4295
  ret void, !dbg !4296
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25collide_player_and_markerP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4297 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4298, !DIExpression(), !4299)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4300, !DIExpression(), !4301)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4302, !DIExpression(), !4303)
  %8 = load ptr, ptr %4, align 8, !dbg !4304
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 2, !dbg !4304
  %10 = load i8, ptr %9, align 1, !dbg !4304
  %11 = zext i8 %10 to i32, !dbg !4304
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, i32 noundef %11), !dbg !4304
  %12 = load ptr, ptr %5, align 8, !dbg !4305
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 2, !dbg !4307
  %14 = load i8, ptr %13, align 1, !dbg !4307
  %15 = zext i8 %14 to i32, !dbg !4305
  %16 = load i32, ptr @Player_num, align 4, !dbg !4308
  %17 = icmp eq i32 %15, %16, !dbg !4309
  br i1 %17, label %18, label %79, !dbg !4309

18:                                               ; preds = %3
    #dbg_declare(ptr %7, !4310, !DIExpression(), !4312)
  %19 = load i32, ptr @Game_mode, align 4, !dbg !4313
  %20 = and i32 %19, 38, !dbg !4315
  %21 = icmp ne i32 %20, 0, !dbg !4313
  br i1 %21, label %22, label %39, !dbg !4313

22:                                               ; preds = %18
  %23 = load ptr, ptr %4, align 8, !dbg !4316
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 2, !dbg !4318
  %25 = load i8, ptr %24, align 1, !dbg !4318
  %26 = zext i8 %25 to i32, !dbg !4316
  %27 = sdiv i32 %26, 2, !dbg !4319
  %28 = sext i32 %27 to i64, !dbg !4320
  %29 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %28, !dbg !4320
  %30 = getelementptr inbounds nuw %struct.player, ptr %29, i32 0, i32 0, !dbg !4321
  %31 = getelementptr inbounds [9 x i8], ptr %30, i64 0, i64 0, !dbg !4320
  %32 = load ptr, ptr %4, align 8, !dbg !4322
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 2, !dbg !4323
  %34 = load i8, ptr %33, align 1, !dbg !4323
  %35 = zext i8 %34 to i64, !dbg !4324
  %36 = getelementptr inbounds nuw [16 x [40 x i8]], ptr @MarkerMessage, i64 0, i64 %35, !dbg !4324
  %37 = getelementptr inbounds [40 x i8], ptr %36, i64 0, i64 0, !dbg !4324
  %38 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.13, ptr noundef %31, ptr noundef %37), !dbg !4325
  store i32 %38, ptr %7, align 4, !dbg !4326
  br label %69, !dbg !4327

39:                                               ; preds = %18
  %40 = load ptr, ptr %4, align 8, !dbg !4328
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 2, !dbg !4331
  %42 = load i8, ptr %41, align 1, !dbg !4331
  %43 = zext i8 %42 to i64, !dbg !4332
  %44 = getelementptr inbounds nuw [16 x [40 x i8]], ptr @MarkerMessage, i64 0, i64 %43, !dbg !4332
  %45 = getelementptr inbounds [40 x i8], ptr %44, i64 0, i64 0, !dbg !4332
  %46 = load i8, ptr %45, align 1, !dbg !4332
  %47 = icmp ne i8 %46, 0, !dbg !4332
  br i1 %47, label %48, label %61, !dbg !4332

48:                                               ; preds = %39
  %49 = load ptr, ptr %4, align 8, !dbg !4333
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 2, !dbg !4334
  %51 = load i8, ptr %50, align 1, !dbg !4334
  %52 = zext i8 %51 to i32, !dbg !4333
  %53 = add nsw i32 %52, 1, !dbg !4335
  %54 = load ptr, ptr %4, align 8, !dbg !4336
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 2, !dbg !4337
  %56 = load i8, ptr %55, align 1, !dbg !4337
  %57 = zext i8 %56 to i64, !dbg !4338
  %58 = getelementptr inbounds nuw [16 x [40 x i8]], ptr @MarkerMessage, i64 0, i64 %57, !dbg !4338
  %59 = getelementptr inbounds [40 x i8], ptr %58, i64 0, i64 0, !dbg !4338
  %60 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.14, i32 noundef %53, ptr noundef %59), !dbg !4339
  store i32 %60, ptr %7, align 4, !dbg !4340
  br label %68, !dbg !4341

61:                                               ; preds = %39
  %62 = load ptr, ptr %4, align 8, !dbg !4342
  %63 = getelementptr inbounds nuw %struct.object, ptr %62, i32 0, i32 2, !dbg !4343
  %64 = load i8, ptr %63, align 1, !dbg !4343
  %65 = zext i8 %64 to i32, !dbg !4342
  %66 = add nsw i32 %65, 1, !dbg !4344
  %67 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.15, i32 noundef %66), !dbg !4345
  store i32 %67, ptr %7, align 4, !dbg !4346
  br label %68

68:                                               ; preds = %61, %48
  br label %69

69:                                               ; preds = %68, %22
  %70 = load i32, ptr %7, align 4, !dbg !4347
  %71 = icmp ne i32 %70, 0, !dbg !4347
  br i1 %71, label %72, label %73, !dbg !4347

72:                                               ; preds = %69
  call void @_Z16digi_play_sampleii(i32 noundef 50, i32 noundef 65536), !dbg !4349
  br label %73, !dbg !4349

73:                                               ; preds = %72, %69
  %74 = load ptr, ptr %4, align 8, !dbg !4350
  %75 = ptrtoint ptr %74 to i64, !dbg !4351
  %76 = sub i64 %75, ptrtoint (ptr @Objects to i64), !dbg !4351
  %77 = sdiv exact i64 %76, 268, !dbg !4351
  %78 = trunc i64 %77 to i32, !dbg !4350
  call void @_Z31detect_escort_goal_accomplishedi(i32 noundef %78), !dbg !4352
  br label %79, !dbg !4353

79:                                               ; preds = %73, %3
  ret void, !dbg !4354
}

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #1

declare void @_Z31detect_escort_goal_accomplishedi(i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %0, ptr noundef %1) #2 !dbg !4355 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4358, !DIExpression(), !4359)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !4360, !DIExpression(), !4361)
  %5 = load ptr, ptr %3, align 8, !dbg !4362
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 2, !dbg !4364
  %7 = load i8, ptr %6, align 1, !dbg !4364
  %8 = zext i8 %7 to i32, !dbg !4362
  %9 = icmp eq i32 %8, 16, !dbg !4365
  br i1 %9, label %22, label %10, !dbg !4366

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8, !dbg !4367
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 2, !dbg !4368
  %13 = load i8, ptr %12, align 1, !dbg !4368
  %14 = zext i8 %13 to i32, !dbg !4367
  %15 = icmp eq i32 %14, 38, !dbg !4369
  br i1 %15, label %22, label %16, !dbg !4370

16:                                               ; preds = %10
  %17 = load ptr, ptr %3, align 8, !dbg !4371
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 2, !dbg !4372
  %19 = load i8, ptr %18, align 1, !dbg !4372
  %20 = zext i8 %19 to i32, !dbg !4371
  %21 = icmp eq i32 %20, 51, !dbg !4373
  br i1 %21, label %22, label %29, !dbg !4370

22:                                               ; preds = %16, %10, %2
  %23 = load ptr, ptr %3, align 8, !dbg !4374
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 8, !dbg !4376
  %25 = load i8, ptr %24, align 1, !dbg !4377
  %26 = zext i8 %25 to i32, !dbg !4377
  %27 = or i32 %26, 2, !dbg !4377
  %28 = trunc i32 %27 to i8, !dbg !4377
  store i8 %28, ptr %24, align 1, !dbg !4377
  br label %101, !dbg !4378

29:                                               ; preds = %16
  %30 = load ptr, ptr %3, align 8, !dbg !4379
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 21, !dbg !4381
  %32 = getelementptr inbounds nuw %struct.physics_info, ptr %31, i32 0, i32 8, !dbg !4382
  %33 = load i16, ptr %32, align 2, !dbg !4382
  %34 = zext i16 %33 to i32, !dbg !4379
  %35 = and i32 %34, 32, !dbg !4383
  %36 = icmp ne i32 %35, 0, !dbg !4379
  br i1 %36, label %46, label %37, !dbg !4384

37:                                               ; preds = %29
  %38 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !4385
  %39 = icmp eq i32 %38, 0, !dbg !4386
  br i1 %39, label %40, label %94, !dbg !4387

40:                                               ; preds = %37
  %41 = load ptr, ptr %4, align 8, !dbg !4388
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 1, !dbg !4389
  %43 = load i8, ptr %42, align 4, !dbg !4389
  %44 = zext i8 %43 to i32, !dbg !4388
  %45 = icmp eq i32 %44, 5, !dbg !4390
  br i1 %45, label %46, label %94, !dbg !4384

46:                                               ; preds = %40, %29
  %47 = load ptr, ptr %3, align 8, !dbg !4391
  %48 = getelementptr inbounds nuw %struct.object, ptr %47, i32 0, i32 21, !dbg !4394
  %49 = getelementptr inbounds nuw %struct.physics_info, ptr %48, i32 0, i32 8, !dbg !4395
  %50 = load i16, ptr %49, align 2, !dbg !4395
  %51 = zext i16 %50 to i32, !dbg !4391
  %52 = and i32 %51, 32, !dbg !4396
  %53 = icmp ne i32 %52, 0, !dbg !4397
  br i1 %53, label %93, label %54, !dbg !4398

54:                                               ; preds = %46
  %55 = load ptr, ptr %4, align 8, !dbg !4399
  %56 = getelementptr inbounds nuw %struct.object, ptr %55, i32 0, i32 1, !dbg !4402
  %57 = load i8, ptr %56, align 4, !dbg !4402
  %58 = zext i8 %57 to i32, !dbg !4399
  %59 = icmp eq i32 %58, 5, !dbg !4403
  br i1 %59, label %60, label %69, !dbg !4403

60:                                               ; preds = %54
  %61 = load ptr, ptr %4, align 8, !dbg !4404
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 14, !dbg !4405
  %63 = load i32, ptr %62, align 4, !dbg !4405
  %64 = sdiv i32 %63, 2, !dbg !4406
  %65 = load ptr, ptr %3, align 8, !dbg !4407
  %66 = getelementptr inbounds nuw %struct.object, ptr %65, i32 0, i32 14, !dbg !4408
  %67 = load i32, ptr %66, align 4, !dbg !4409
  %68 = sub nsw i32 %67, %64, !dbg !4409
  store i32 %68, ptr %66, align 4, !dbg !4409
  br label %78, !dbg !4407

69:                                               ; preds = %54
  %70 = load ptr, ptr %4, align 8, !dbg !4410
  %71 = getelementptr inbounds nuw %struct.object, ptr %70, i32 0, i32 14, !dbg !4411
  %72 = load i32, ptr %71, align 4, !dbg !4411
  %73 = sdiv i32 %72, 4, !dbg !4412
  %74 = load ptr, ptr %3, align 8, !dbg !4413
  %75 = getelementptr inbounds nuw %struct.object, ptr %74, i32 0, i32 14, !dbg !4414
  %76 = load i32, ptr %75, align 4, !dbg !4415
  %77 = sub nsw i32 %76, %73, !dbg !4415
  store i32 %77, ptr %75, align 4, !dbg !4415
  br label %78

78:                                               ; preds = %69, %60
  %79 = load ptr, ptr %3, align 8, !dbg !4416
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 14, !dbg !4418
  %81 = load i32, ptr %80, align 4, !dbg !4418
  %82 = icmp sle i32 %81, 0, !dbg !4419
  br i1 %82, label %83, label %92, !dbg !4419

83:                                               ; preds = %78
  %84 = load ptr, ptr %3, align 8, !dbg !4420
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 14, !dbg !4422
  store i32 0, ptr %85, align 4, !dbg !4423
  %86 = load ptr, ptr %3, align 8, !dbg !4424
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 8, !dbg !4425
  %88 = load i8, ptr %87, align 1, !dbg !4426
  %89 = zext i8 %88 to i32, !dbg !4426
  %90 = or i32 %89, 2, !dbg !4426
  %91 = trunc i32 %90 to i8, !dbg !4426
  store i8 %91, ptr %87, align 1, !dbg !4426
  br label %92, !dbg !4427

92:                                               ; preds = %83, %78
  br label %93, !dbg !4428

93:                                               ; preds = %92, %46
  br label %101, !dbg !4429

94:                                               ; preds = %40, %37
  %95 = load ptr, ptr %3, align 8, !dbg !4430
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 8, !dbg !4431
  %97 = load i8, ptr %96, align 1, !dbg !4432
  %98 = zext i8 %97 to i32, !dbg !4432
  %99 = or i32 %98, 2, !dbg !4432
  %100 = trunc i32 %99 to i8, !dbg !4432
  store i8 %100, ptr %96, align 1, !dbg !4432
  br label %101

101:                                              ; preds = %22, %94, %93
  ret void, !dbg !4433
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z29collide_weapon_and_controlcenP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4434 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4435, !DIExpression(), !4436)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4437, !DIExpression(), !4438)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4439, !DIExpression(), !4440)
  %8 = load ptr, ptr %4, align 8, !dbg !4441
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 2, !dbg !4443
  %10 = load i8, ptr %9, align 1, !dbg !4443
  %11 = zext i8 %10 to i32, !dbg !4441
  %12 = icmp eq i32 %11, 35, !dbg !4444
  br i1 %12, label %13, label %19, !dbg !4444

13:                                               ; preds = %3
  %14 = load ptr, ptr %4, align 8, !dbg !4445
  %15 = call noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %14), !dbg !4447
  %16 = icmp ne i32 %15, 0, !dbg !4447
  br i1 %16, label %18, label %17, !dbg !4448

17:                                               ; preds = %13
  br label %99, !dbg !4449

18:                                               ; preds = %13
  br label %19, !dbg !4450

19:                                               ; preds = %18, %3
  %20 = load ptr, ptr %4, align 8, !dbg !4451
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 22, !dbg !4453
  %22 = getelementptr inbounds nuw %struct.laser_info_s, ptr %21, i32 0, i32 0, !dbg !4454
  %23 = load i16, ptr %22, align 4, !dbg !4454
  %24 = sext i16 %23 to i32, !dbg !4451
  %25 = icmp eq i32 %24, 4, !dbg !4455
  br i1 %25, label %26, label %86, !dbg !4455

26:                                               ; preds = %19
    #dbg_declare(ptr %7, !4456, !DIExpression(), !4458)
  %27 = load ptr, ptr %4, align 8, !dbg !4459
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 14, !dbg !4460
  %29 = load i32, ptr %28, align 4, !dbg !4460
  store i32 %29, ptr %7, align 4, !dbg !4458
  %30 = load ptr, ptr %4, align 8, !dbg !4461
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 22, !dbg !4463
  %32 = getelementptr inbounds nuw %struct.laser_info_s, ptr %31, i32 0, i32 1, !dbg !4464
  %33 = load i16, ptr %32, align 2, !dbg !4464
  %34 = sext i16 %33 to i64, !dbg !4465
  %35 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %34, !dbg !4465
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 2, !dbg !4466
  %37 = load i8, ptr %36, align 1, !dbg !4466
  %38 = zext i8 %37 to i32, !dbg !4465
  %39 = load i32, ptr @Player_num, align 4, !dbg !4467
  %40 = icmp eq i32 %38, %39, !dbg !4468
  br i1 %40, label %41, label %42, !dbg !4468

41:                                               ; preds = %26
  store i32 1, ptr @Control_center_been_hit, align 4, !dbg !4469
  br label %42, !dbg !4470

42:                                               ; preds = %41, %26
  %43 = load ptr, ptr %4, align 8, !dbg !4471
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 2, !dbg !4473
  %45 = load i8, ptr %44, align 1, !dbg !4473
  %46 = zext i8 %45 to i64, !dbg !4474
  %47 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %46, !dbg !4474
  %48 = getelementptr inbounds nuw %struct.weapon_info, ptr %47, i32 0, i32 37, !dbg !4475
  %49 = load i32, ptr %48, align 4, !dbg !4475
  %50 = icmp ne i32 %49, 0, !dbg !4474
  br i1 %50, label %51, label %55, !dbg !4474

51:                                               ; preds = %42
  %52 = load ptr, ptr %4, align 8, !dbg !4476
  %53 = load ptr, ptr %6, align 8, !dbg !4477
  %54 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %52, ptr noundef %53), !dbg !4478
  br label %66, !dbg !4478

55:                                               ; preds = %42
  %56 = load ptr, ptr %5, align 8, !dbg !4479
  %57 = getelementptr inbounds nuw %struct.object, ptr %56, i32 0, i32 9, !dbg !4480
  %58 = load i16, ptr %57, align 2, !dbg !4480
  %59 = load ptr, ptr %6, align 8, !dbg !4481
  %60 = load ptr, ptr %5, align 8, !dbg !4482
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 13, !dbg !4483
  %62 = load i32, ptr %61, align 4, !dbg !4483
  %63 = mul nsw i32 %62, 3, !dbg !4484
  %64 = sdiv i32 %63, 20, !dbg !4485
  %65 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %58, ptr noundef %59, i32 noundef %64, i32 noundef 2), !dbg !4486
  br label %66

66:                                               ; preds = %55, %51
  %67 = load ptr, ptr %5, align 8, !dbg !4487
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 9, !dbg !4488
  %69 = load i16, ptr %68, align 2, !dbg !4488
  %70 = load ptr, ptr %6, align 8, !dbg !4489
  %71 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 30, i16 noundef signext %69, i16 noundef signext 0, ptr noundef %70, i32 noundef 0, i32 noundef 65536), !dbg !4490
  %72 = load i32, ptr %7, align 4, !dbg !4491
  %73 = load ptr, ptr %4, align 8, !dbg !4492
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 22, !dbg !4493
  %75 = getelementptr inbounds nuw %struct.laser_info_s, ptr %74, i32 0, i32 6, !dbg !4494
  %76 = load i32, ptr %75, align 4, !dbg !4494
  %77 = call noundef i32 @_Z6fixmulii(i32 noundef %72, i32 noundef %76), !dbg !4495
  store i32 %77, ptr %7, align 4, !dbg !4496
  %78 = load ptr, ptr %5, align 8, !dbg !4497
  %79 = load i32, ptr %7, align 4, !dbg !4498
  %80 = load ptr, ptr %4, align 8, !dbg !4499
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 22, !dbg !4500
  %82 = getelementptr inbounds nuw %struct.laser_info_s, ptr %81, i32 0, i32 1, !dbg !4501
  %83 = load i16, ptr %82, align 2, !dbg !4501
  call void @_Z26apply_damage_to_controlcenP6objectis(ptr noundef %78, i32 noundef %79, i16 noundef signext %83), !dbg !4502
  %84 = load ptr, ptr %4, align 8, !dbg !4503
  %85 = load ptr, ptr %5, align 8, !dbg !4504
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %84, ptr noundef %85), !dbg !4505
  br label %99, !dbg !4506

86:                                               ; preds = %19
  %87 = load ptr, ptr %5, align 8, !dbg !4507
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 9, !dbg !4509
  %89 = load i16, ptr %88, align 2, !dbg !4509
  %90 = load ptr, ptr %6, align 8, !dbg !4510
  %91 = load ptr, ptr %5, align 8, !dbg !4511
  %92 = getelementptr inbounds nuw %struct.object, ptr %91, i32 0, i32 13, !dbg !4512
  %93 = load i32, ptr %92, align 4, !dbg !4512
  %94 = mul nsw i32 %93, 3, !dbg !4513
  %95 = sdiv i32 %94, 20, !dbg !4514
  %96 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %89, ptr noundef %90, i32 noundef %95, i32 noundef 2), !dbg !4515
  %97 = load ptr, ptr %4, align 8, !dbg !4516
  %98 = load ptr, ptr %5, align 8, !dbg !4517
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %97, ptr noundef %98), !dbg !4518
  br label %99

99:                                               ; preds = %17, %86, %66
  ret void, !dbg !4519
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26collide_weapon_and_clutterP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4520 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i16, align 2
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4521, !DIExpression(), !4522)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4523, !DIExpression(), !4524)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4525, !DIExpression(), !4526)
    #dbg_declare(ptr %7, !4527, !DIExpression(), !4528)
  store i16 2, ptr %7, align 2, !dbg !4528
  %8 = load ptr, ptr %5, align 8, !dbg !4529
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 14, !dbg !4531
  %10 = load i32, ptr %9, align 4, !dbg !4531
  %11 = icmp sge i32 %10, 0, !dbg !4532
  br i1 %11, label %12, label %20, !dbg !4532

12:                                               ; preds = %3
  %13 = load ptr, ptr %4, align 8, !dbg !4533
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 14, !dbg !4534
  %15 = load i32, ptr %14, align 4, !dbg !4534
  %16 = load ptr, ptr %5, align 8, !dbg !4535
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 14, !dbg !4536
  %18 = load i32, ptr %17, align 4, !dbg !4537
  %19 = sub nsw i32 %18, %15, !dbg !4537
  store i32 %19, ptr %17, align 4, !dbg !4537
  br label %20, !dbg !4535

20:                                               ; preds = %12, %3
  %21 = load ptr, ptr %4, align 8, !dbg !4538
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 9, !dbg !4539
  %23 = load i16, ptr %22, align 2, !dbg !4539
  %24 = load ptr, ptr %6, align 8, !dbg !4540
  %25 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 30, i16 noundef signext %23, i16 noundef signext 0, ptr noundef %24, i32 noundef 0, i32 noundef 65536), !dbg !4541
  %26 = load ptr, ptr %5, align 8, !dbg !4542
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 9, !dbg !4543
  %28 = load i16, ptr %27, align 2, !dbg !4543
  %29 = load ptr, ptr %6, align 8, !dbg !4544
  %30 = load ptr, ptr %5, align 8, !dbg !4545
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 13, !dbg !4546
  %32 = load i32, ptr %31, align 4, !dbg !4546
  %33 = sdiv i32 %32, 3, !dbg !4547
  %34 = mul nsw i32 %33, 3, !dbg !4548
  %35 = sdiv i32 %34, 4, !dbg !4549
  %36 = load i16, ptr %7, align 2, !dbg !4550
  %37 = sext i16 %36 to i32, !dbg !4550
  %38 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %28, ptr noundef %29, i32 noundef %35, i32 noundef %37), !dbg !4551
  %39 = load ptr, ptr %5, align 8, !dbg !4552
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 14, !dbg !4554
  %41 = load i32, ptr %40, align 4, !dbg !4554
  %42 = icmp slt i32 %41, 0, !dbg !4555
  br i1 %42, label %43, label %52, !dbg !4556

43:                                               ; preds = %20
  %44 = load ptr, ptr %5, align 8, !dbg !4557
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 8, !dbg !4558
  %46 = load i8, ptr %45, align 1, !dbg !4558
  %47 = zext i8 %46 to i32, !dbg !4557
  %48 = and i32 %47, 5, !dbg !4559
  %49 = icmp ne i32 %48, 0, !dbg !4560
  br i1 %49, label %52, label %50, !dbg !4556

50:                                               ; preds = %43
  %51 = load ptr, ptr %5, align 8, !dbg !4561
  call void @_Z14explode_objectP6objecti(ptr noundef %51, i32 noundef 16384), !dbg !4562
  br label %52, !dbg !4562

52:                                               ; preds = %50, %43, %20
  %53 = load ptr, ptr %4, align 8, !dbg !4563
  %54 = load ptr, ptr %5, align 8, !dbg !4564
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %53, ptr noundef %54), !dbg !4565
  ret void, !dbg !4566
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19do_final_boss_framev() #0 !dbg !4567 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4568, !DIExpression(), !4569)
  %2 = load i32, ptr @Final_boss_is_dead, align 4, !dbg !4570
  %3 = icmp ne i32 %2, 0, !dbg !4570
  br i1 %3, label %5, label %4, !dbg !4572

4:                                                ; preds = %0
  br label %22, !dbg !4573

5:                                                ; preds = %0
  %6 = load i32, ptr @Control_center_destroyed, align 4, !dbg !4574
  %7 = icmp ne i32 %6, 0, !dbg !4574
  br i1 %7, label %9, label %8, !dbg !4576

8:                                                ; preds = %5
  br label %22, !dbg !4577

9:                                                ; preds = %5
  %10 = load i32, ptr @Final_boss_countdown_time, align 4, !dbg !4578
  %11 = icmp eq i32 %10, 0, !dbg !4580
  br i1 %11, label %12, label %13, !dbg !4580

12:                                               ; preds = %9
  store i32 131072, ptr @Final_boss_countdown_time, align 4, !dbg !4581
  br label %13, !dbg !4582

13:                                               ; preds = %12, %9
  %14 = load i32, ptr @FrameTime, align 4, !dbg !4583
  %15 = load i32, ptr @Final_boss_countdown_time, align 4, !dbg !4584
  %16 = sub nsw i32 %15, %14, !dbg !4584
  store i32 %16, ptr @Final_boss_countdown_time, align 4, !dbg !4584
  %17 = load i32, ptr @Final_boss_countdown_time, align 4, !dbg !4585
  %18 = icmp sgt i32 %17, 0, !dbg !4587
  br i1 %18, label %19, label %20, !dbg !4587

19:                                               ; preds = %13
  br label %22, !dbg !4588

20:                                               ; preds = %13
  %21 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 256, i32 noundef 0), !dbg !4589
  call void @_Z23start_endlevel_sequencev(), !dbg !4590
  br label %22, !dbg !4591

22:                                               ; preds = %20, %19, %8, %4
  ret void, !dbg !4591
}

declare noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z23start_endlevel_sequencev() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19do_final_boss_hacksv() #0 !dbg !4592 {
  %1 = load i32, ptr @Player_is_dead, align 4, !dbg !4593
  %2 = icmp ne i32 %1, 0, !dbg !4593
  br i1 %2, label %3, label %4, !dbg !4593

3:                                                ; preds = %0
  call void @_Z4Int3v(), !dbg !4595
  store i32 0, ptr @Player_is_dead, align 4, !dbg !4597
  br label %4, !dbg !4598

4:                                                ; preds = %3, %0
  %5 = load i32, ptr @Player_num, align 4, !dbg !4599
  %6 = sext i32 %5 to i64, !dbg !4601
  %7 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %6, !dbg !4601
  %8 = getelementptr inbounds nuw %struct.player, ptr %7, i32 0, i32 9, !dbg !4602
  %9 = load i32, ptr %8, align 4, !dbg !4602
  %10 = icmp sle i32 %9, 0, !dbg !4603
  br i1 %10, label %11, label %16, !dbg !4603

11:                                               ; preds = %4
  %12 = load i32, ptr @Player_num, align 4, !dbg !4604
  %13 = sext i32 %12 to i64, !dbg !4605
  %14 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %13, !dbg !4605
  %15 = getelementptr inbounds nuw %struct.player, ptr %14, i32 0, i32 9, !dbg !4606
  store i32 1, ptr %15, align 4, !dbg !4607
  br label %16, !dbg !4605

16:                                               ; preds = %11, %4
  %17 = load i32, ptr @Player_num, align 4, !dbg !4608
  %18 = sext i32 %17 to i64, !dbg !4610
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !4610
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 7, !dbg !4611
  %21 = load i32, ptr %20, align 4, !dbg !4611
  %22 = and i32 %21, 1, !dbg !4612
  %23 = icmp ne i32 %22, 0, !dbg !4613
  br i1 %23, label %36, label %24, !dbg !4614

24:                                               ; preds = %16
  %25 = load i32, ptr @GameTime, align 4, !dbg !4615
  %26 = load i32, ptr @Player_num, align 4, !dbg !4617
  %27 = sext i32 %26 to i64, !dbg !4618
  %28 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %27, !dbg !4618
  %29 = getelementptr inbounds nuw %struct.player, ptr %28, i32 0, i32 25, !dbg !4619
  store i32 %25, ptr %29, align 4, !dbg !4620
  %30 = load i32, ptr @Player_num, align 4, !dbg !4621
  %31 = sext i32 %30 to i64, !dbg !4622
  %32 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %31, !dbg !4622
  %33 = getelementptr inbounds nuw %struct.player, ptr %32, i32 0, i32 7, !dbg !4623
  %34 = load i32, ptr %33, align 4, !dbg !4624
  %35 = or i32 %34, 1, !dbg !4624
  store i32 %35, ptr %33, align 4, !dbg !4624
  br label %36, !dbg !4625

36:                                               ; preds = %24, %16
  %37 = load i32, ptr @Game_mode, align 4, !dbg !4626
  %38 = and i32 %37, 38, !dbg !4628
  %39 = icmp ne i32 %38, 0, !dbg !4629
  br i1 %39, label %46, label %40, !dbg !4630

40:                                               ; preds = %36
  %41 = load i32, ptr @Player_num, align 4, !dbg !4631
  %42 = sext i32 %41 to i64, !dbg !4632
  %43 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %42, !dbg !4632
  %44 = getelementptr inbounds nuw %struct.player, ptr %43, i32 0, i32 0, !dbg !4633
  %45 = getelementptr inbounds [9 x i8], ptr %44, i64 0, i64 0, !dbg !4632
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.16, ptr noundef %45), !dbg !4634
  br label %46, !dbg !4634

46:                                               ; preds = %40, %36
  store i32 1, ptr @Final_boss_is_dead, align 4, !dbg !4635
  ret void, !dbg !4636
}

declare void @_Z13buddy_messagePKcz(ptr noundef, ...) #1

declare void @_Z25start_boss_death_sequenceP6object(ptr noundef) #1

declare void @_Z26start_robot_death_sequenceP6object(ptr noundef) #1

declare void @_Z21special_reactor_stuffv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z24do_boss_weapon_collisionP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4637 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca %struct.vms_vector, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4640, !DIExpression(), !4641)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4642, !DIExpression(), !4643)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4644, !DIExpression(), !4645)
    #dbg_declare(ptr %7, !4646, !DIExpression(), !4647)
    #dbg_declare(ptr %8, !4648, !DIExpression(), !4649)
  store i32 1, ptr %8, align 4, !dbg !4650
  %18 = load ptr, ptr %4, align 8, !dbg !4651
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !4652
  %20 = load i8, ptr %19, align 1, !dbg !4652
  %21 = zext i8 %20 to i64, !dbg !4653
  %22 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %21, !dbg !4653
  %23 = getelementptr inbounds nuw %struct.robot_info, ptr %22, i32 0, i32 36, !dbg !4654
  %24 = load i8, ptr %23, align 4, !dbg !4654
  %25 = sext i8 %24 to i32, !dbg !4653
  %26 = sub nsw i32 %25, 21, !dbg !4655
  store i32 %26, ptr %7, align 4, !dbg !4656
  %27 = load i32, ptr %7, align 4, !dbg !4657
  %28 = icmp sge i32 %27, 0, !dbg !4657
  br i1 %28, label %29, label %32, !dbg !4657

29:                                               ; preds = %3
  %30 = load i32, ptr %7, align 4, !dbg !4657
  %31 = icmp slt i32 %30, 8, !dbg !4657
  br label %32

32:                                               ; preds = %29, %3
  %33 = phi i1 [ false, %3 ], [ %31, %29 ], !dbg !4658
  %34 = zext i1 %33 to i32, !dbg !4657
  call void @_Z7_AssertiPKcS0_i(i32 noundef %34, ptr noundef @.str.17, ptr noundef @.str.1, i32 noundef 1702), !dbg !4657
  %35 = load ptr, ptr %5, align 8, !dbg !4659
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 22, !dbg !4661
  %37 = getelementptr inbounds nuw %struct.laser_info_s, ptr %36, i32 0, i32 0, !dbg !4662
  %38 = load i16, ptr %37, align 4, !dbg !4662
  %39 = sext i16 %38 to i32, !dbg !4659
  %40 = icmp eq i32 %39, 4, !dbg !4663
  br i1 %40, label %41, label %97, !dbg !4663

41:                                               ; preds = %32
  %42 = load ptr, ptr %5, align 8, !dbg !4664
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 2, !dbg !4666
  %44 = load i8, ptr %43, align 1, !dbg !4666
  %45 = zext i8 %44 to i64, !dbg !4667
  %46 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %45, !dbg !4667
  %47 = getelementptr inbounds nuw %struct.weapon_info, ptr %46, i32 0, i32 14, !dbg !4668
  %48 = load i8, ptr %47, align 1, !dbg !4668
  %49 = icmp ne i8 %48, 0, !dbg !4667
  br i1 %49, label %50, label %56, !dbg !4669

50:                                               ; preds = %41
  %51 = load i32, ptr %7, align 4, !dbg !4670
  %52 = sext i32 %51 to i64, !dbg !4671
  %53 = getelementptr inbounds [8 x i8], ptr @Boss_spews_bots_matter, i64 0, i64 %52, !dbg !4671
  %54 = load i8, ptr %53, align 1, !dbg !4671
  %55 = icmp ne i8 %54, 0, !dbg !4671
  br i1 %55, label %71, label %56, !dbg !4672

56:                                               ; preds = %50, %41
  %57 = load ptr, ptr %5, align 8, !dbg !4673
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 2, !dbg !4674
  %59 = load i8, ptr %58, align 1, !dbg !4674
  %60 = zext i8 %59 to i64, !dbg !4675
  %61 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %60, !dbg !4675
  %62 = getelementptr inbounds nuw %struct.weapon_info, ptr %61, i32 0, i32 14, !dbg !4676
  %63 = load i8, ptr %62, align 1, !dbg !4676
  %64 = icmp ne i8 %63, 0, !dbg !4675
  br i1 %64, label %96, label %65, !dbg !4677

65:                                               ; preds = %56
  %66 = load i32, ptr %7, align 4, !dbg !4678
  %67 = sext i32 %66 to i64, !dbg !4679
  %68 = getelementptr inbounds [8 x i8], ptr @Boss_spews_bots_energy, i64 0, i64 %67, !dbg !4679
  %69 = load i8, ptr %68, align 1, !dbg !4679
  %70 = icmp ne i8 %69, 0, !dbg !4679
  br i1 %70, label %71, label %96, !dbg !4672

71:                                               ; preds = %65, %50
  %72 = load i32, ptr %7, align 4, !dbg !4680
  %73 = sext i32 %72 to i64, !dbg !4683
  %74 = getelementptr inbounds [8 x i8], ptr @Boss_spew_more, i64 0, i64 %73, !dbg !4683
  %75 = load i8, ptr %74, align 1, !dbg !4683
  %76 = icmp ne i8 %75, 0, !dbg !4683
  br i1 %76, label %77, label %92, !dbg !4683

77:                                               ; preds = %71
  %78 = call noundef i32 @_Z6P_Randv(), !dbg !4684
  %79 = icmp sgt i32 %78, 16384, !dbg !4686
  br i1 %79, label %80, label %91, !dbg !4686

80:                                               ; preds = %77
  %81 = load ptr, ptr %4, align 8, !dbg !4687
  %82 = load ptr, ptr %6, align 8, !dbg !4690
  %83 = call noundef i32 @_Z15boss_spew_robotP6objectP10vms_vector(ptr noundef %81, ptr noundef %82), !dbg !4691
  %84 = icmp ne i32 %83, -1, !dbg !4692
  br i1 %84, label %85, label %90, !dbg !4692

85:                                               ; preds = %80
  %86 = load i32, ptr @GameTime, align 4, !dbg !4693
  %87 = load i32, ptr @Gate_interval, align 4, !dbg !4694
  %88 = sub nsw i32 %86, %87, !dbg !4695
  %89 = sub nsw i32 %88, 1, !dbg !4696
  store i32 %89, ptr @Last_gate_time, align 4, !dbg !4697
  br label %90, !dbg !4698

90:                                               ; preds = %85, %80
  br label %91, !dbg !4699

91:                                               ; preds = %90, %77
  br label %92, !dbg !4700

92:                                               ; preds = %91, %71
  %93 = load ptr, ptr %4, align 8, !dbg !4701
  %94 = load ptr, ptr %6, align 8, !dbg !4702
  %95 = call noundef i32 @_Z15boss_spew_robotP6objectP10vms_vector(ptr noundef %93, ptr noundef %94), !dbg !4703
  br label %96, !dbg !4704

96:                                               ; preds = %92, %65, %56
  br label %97, !dbg !4705

97:                                               ; preds = %96, %32
  %98 = load i32, ptr %7, align 4, !dbg !4706
  %99 = sext i32 %98 to i64, !dbg !4708
  %100 = getelementptr inbounds [8 x i8], ptr @Boss_invulnerable_spot, i64 0, i64 %99, !dbg !4708
  %101 = load i8, ptr %100, align 1, !dbg !4708
  %102 = icmp ne i8 %101, 0, !dbg !4708
  br i1 %102, label %103, label %308, !dbg !4708

103:                                              ; preds = %97
    #dbg_declare(ptr %9, !4709, !DIExpression(), !4711)
    #dbg_declare(ptr %10, !4712, !DIExpression(), !4713)
  %104 = load ptr, ptr %6, align 8, !dbg !4714
  %105 = load ptr, ptr %4, align 8, !dbg !4715
  %106 = getelementptr inbounds nuw %struct.object, ptr %105, i32 0, i32 11, !dbg !4716
  %107 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %10, ptr noundef %104, ptr noundef %106), !dbg !4717
  %108 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %10), !dbg !4718
  %109 = load ptr, ptr %4, align 8, !dbg !4719
  %110 = getelementptr inbounds nuw %struct.object, ptr %109, i32 0, i32 12, !dbg !4719
  %111 = getelementptr inbounds nuw %struct.vms_matrix, ptr %110, i32 0, i32 2, !dbg !4719
  %112 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %10, ptr noundef %111), !dbg !4719
  store i32 %112, ptr %9, align 4, !dbg !4720
  %113 = load i32, ptr %9, align 4, !dbg !4721
  %114 = call noundef float @_Z4f2fli(i32 noundef %113), !dbg !4721
  %115 = fpext float %114 to double, !dbg !4721
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18, double noundef %115), !dbg !4721
  %116 = load i32, ptr %9, align 4, !dbg !4722
  %117 = load i32, ptr @Boss_invulnerable_dot, align 4, !dbg !4724
  %118 = icmp sgt i32 %116, %117, !dbg !4725
  br i1 %118, label %119, label %307, !dbg !4725

119:                                              ; preds = %103
    #dbg_declare(ptr %11, !4726, !DIExpression(), !4728)
    #dbg_declare(ptr %12, !4729, !DIExpression(), !4730)
  %120 = load ptr, ptr %6, align 8, !dbg !4731
  %121 = load ptr, ptr %4, align 8, !dbg !4732
  %122 = getelementptr inbounds nuw %struct.object, ptr %121, i32 0, i32 9, !dbg !4733
  %123 = load i16, ptr %122, align 2, !dbg !4733
  %124 = sext i16 %123 to i32, !dbg !4732
  %125 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %120, i32 noundef %124), !dbg !4734
  store i32 %125, ptr %12, align 4, !dbg !4735
  %126 = load i32, ptr %12, align 4, !dbg !4736
  %127 = trunc i32 %126 to i16, !dbg !4736
  %128 = load ptr, ptr %6, align 8, !dbg !4737
  %129 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 27, i16 noundef signext %127, i16 noundef signext 0, ptr noundef %128, i32 noundef 0, i32 noundef 65536), !dbg !4738
  store i32 0, ptr %8, align 4, !dbg !4739
  %130 = load i32, ptr @Last_time_buddy_gave_hint, align 4, !dbg !4740
  %131 = icmp eq i32 %130, 0, !dbg !4742
  br i1 %131, label %132, label %136, !dbg !4742

132:                                              ; preds = %119
  %133 = call noundef i32 @_Z6P_Randv(), !dbg !4743
  %134 = mul nsw i32 %133, 32, !dbg !4744
  %135 = add nsw i32 %134, 1048576, !dbg !4745
  store i32 %135, ptr @Last_time_buddy_gave_hint, align 4, !dbg !4746
  br label %136, !dbg !4747

136:                                              ; preds = %132, %119
  %137 = load i32, ptr @Buddy_gave_hint_count, align 4, !dbg !4748
  %138 = icmp ne i32 %137, 0, !dbg !4748
  br i1 %138, label %139, label %159, !dbg !4748

139:                                              ; preds = %136
  %140 = load i32, ptr @Last_time_buddy_gave_hint, align 4, !dbg !4750
  %141 = add nsw i32 %140, 1310720, !dbg !4753
  %142 = load i32, ptr @GameTime, align 4, !dbg !4754
  %143 = icmp slt i32 %141, %142, !dbg !4755
  br i1 %143, label %144, label %158, !dbg !4755

144:                                              ; preds = %139
    #dbg_declare(ptr %13, !4756, !DIExpression(), !4758)
  %145 = load i32, ptr @Buddy_gave_hint_count, align 4, !dbg !4759
  %146 = add nsw i32 %145, -1, !dbg !4759
  store i32 %146, ptr @Buddy_gave_hint_count, align 4, !dbg !4759
  %147 = load i32, ptr @GameTime, align 4, !dbg !4760
  store i32 %147, ptr @Last_time_buddy_gave_hint, align 4, !dbg !4761
  %148 = call noundef i32 @_Z6P_Randv(), !dbg !4762
  %149 = mul nsw i32 %148, 4, !dbg !4763
  %150 = ashr i32 %149, 15, !dbg !4764
  store i32 %150, ptr %13, align 4, !dbg !4765
  %151 = load i32, ptr %13, align 4, !dbg !4766
  switch i32 %151, label %156 [
    i32 0, label %152
    i32 1, label %153
    i32 2, label %154
    i32 3, label %155
  ], !dbg !4767

152:                                              ; preds = %144
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.19), !dbg !4768
  br label %157, !dbg !4770

153:                                              ; preds = %144
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.20), !dbg !4771
  br label %157, !dbg !4772

154:                                              ; preds = %144
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.21), !dbg !4773
  br label %157, !dbg !4774

155:                                              ; preds = %144
  br label %156, !dbg !4775

156:                                              ; preds = %144, %155
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.22), !dbg !4776
  br label %157, !dbg !4777

157:                                              ; preds = %156, %154, %153, %152
  br label %158, !dbg !4778

158:                                              ; preds = %157, %139
  br label %159, !dbg !4779

159:                                              ; preds = %158, %136
  %160 = load ptr, ptr %5, align 8, !dbg !4780
  %161 = getelementptr inbounds nuw %struct.object, ptr %160, i32 0, i32 2, !dbg !4782
  %162 = load i8, ptr %161, align 1, !dbg !4782
  %163 = zext i8 %162 to i64, !dbg !4783
  %164 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %163, !dbg !4783
  %165 = getelementptr inbounds nuw %struct.weapon_info, ptr %164, i32 0, i32 14, !dbg !4784
  %166 = load i8, ptr %165, align 1, !dbg !4784
  %167 = icmp ne i8 %166, 0, !dbg !4783
  br i1 %167, label %306, label %168, !dbg !4785

168:                                              ; preds = %159
  %169 = load ptr, ptr %5, align 8, !dbg !4786
  %170 = getelementptr inbounds nuw %struct.object, ptr %169, i32 0, i32 1, !dbg !4788
  %171 = load i8, ptr %170, align 4, !dbg !4788
  %172 = load ptr, ptr %5, align 8, !dbg !4789
  %173 = getelementptr inbounds nuw %struct.object, ptr %172, i32 0, i32 2, !dbg !4790
  %174 = load i8, ptr %173, align 1, !dbg !4790
  %175 = load ptr, ptr %5, align 8, !dbg !4791
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 9, !dbg !4792
  %177 = load i16, ptr %176, align 2, !dbg !4792
  %178 = sext i16 %177 to i32, !dbg !4791
  %179 = load ptr, ptr %5, align 8, !dbg !4793
  %180 = getelementptr inbounds nuw %struct.object, ptr %179, i32 0, i32 11, !dbg !4794
  %181 = load ptr, ptr %5, align 8, !dbg !4795
  %182 = getelementptr inbounds nuw %struct.object, ptr %181, i32 0, i32 12, !dbg !4796
  %183 = load ptr, ptr %5, align 8, !dbg !4797
  %184 = getelementptr inbounds nuw %struct.object, ptr %183, i32 0, i32 13, !dbg !4798
  %185 = load i32, ptr %184, align 4, !dbg !4798
  %186 = load ptr, ptr %5, align 8, !dbg !4799
  %187 = getelementptr inbounds nuw %struct.object, ptr %186, i32 0, i32 5, !dbg !4800
  %188 = load i8, ptr %187, align 2, !dbg !4800
  %189 = load ptr, ptr %5, align 8, !dbg !4801
  %190 = getelementptr inbounds nuw %struct.object, ptr %189, i32 0, i32 6, !dbg !4802
  %191 = load i8, ptr %190, align 1, !dbg !4802
  %192 = load ptr, ptr %5, align 8, !dbg !4803
  %193 = getelementptr inbounds nuw %struct.object, ptr %192, i32 0, i32 7, !dbg !4804
  %194 = load i8, ptr %193, align 4, !dbg !4804
  %195 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext %171, i8 noundef zeroext %174, i32 noundef %178, ptr noundef %180, ptr noundef %182, i32 noundef %185, i8 noundef zeroext %188, i8 noundef zeroext %191, i8 noundef zeroext %194), !dbg !4805
  store i32 %195, ptr %11, align 4, !dbg !4806
  %196 = load i32, ptr %11, align 4, !dbg !4807
  %197 = icmp ne i32 %196, -1, !dbg !4809
  br i1 %197, label %198, label %305, !dbg !4809

198:                                              ; preds = %168
    #dbg_declare(ptr %14, !4810, !DIExpression(), !4812)
    #dbg_declare(ptr %15, !4813, !DIExpression(), !4814)
    #dbg_declare(ptr %16, !4815, !DIExpression(), !4816)
  %199 = load ptr, ptr %5, align 8, !dbg !4817
  %200 = getelementptr inbounds nuw %struct.object, ptr %199, i32 0, i32 7, !dbg !4819
  %201 = load i8, ptr %200, align 4, !dbg !4819
  %202 = zext i8 %201 to i32, !dbg !4817
  %203 = icmp eq i32 %202, 1, !dbg !4820
  br i1 %203, label %204, label %244, !dbg !4820

204:                                              ; preds = %198
  %205 = load i32, ptr %11, align 4, !dbg !4821
  %206 = sext i32 %205 to i64, !dbg !4823
  %207 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %206, !dbg !4823
  %208 = getelementptr inbounds nuw %struct.object, ptr %207, i32 0, i32 2, !dbg !4824
  %209 = load i8, ptr %208, align 1, !dbg !4824
  %210 = zext i8 %209 to i64, !dbg !4825
  %211 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %210, !dbg !4825
  %212 = getelementptr inbounds nuw %struct.weapon_info, ptr %211, i32 0, i32 2, !dbg !4826
  %213 = load i16, ptr %212, align 2, !dbg !4826
  %214 = sext i16 %213 to i32, !dbg !4825
  %215 = load i32, ptr %11, align 4, !dbg !4827
  %216 = sext i32 %215 to i64, !dbg !4828
  %217 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %216, !dbg !4828
  %218 = getelementptr inbounds nuw %struct.object, ptr %217, i32 0, i32 23, !dbg !4829
  %219 = getelementptr inbounds nuw %struct.polyobj_info, ptr %218, i32 0, i32 0, !dbg !4830
  store i32 %214, ptr %219, align 4, !dbg !4831
  %220 = load i32, ptr %11, align 4, !dbg !4832
  %221 = sext i32 %220 to i64, !dbg !4833
  %222 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %221, !dbg !4833
  %223 = getelementptr inbounds nuw %struct.object, ptr %222, i32 0, i32 23, !dbg !4834
  %224 = getelementptr inbounds nuw %struct.polyobj_info, ptr %223, i32 0, i32 0, !dbg !4835
  %225 = load i32, ptr %224, align 4, !dbg !4835
  %226 = sext i32 %225 to i64, !dbg !4836
  %227 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %226, !dbg !4836
  %228 = getelementptr inbounds nuw %struct.polymodel, ptr %227, i32 0, i32 13, !dbg !4837
  %229 = load i32, ptr %228, align 4, !dbg !4837
  %230 = load i32, ptr %11, align 4, !dbg !4838
  %231 = sext i32 %230 to i64, !dbg !4839
  %232 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %231, !dbg !4839
  %233 = getelementptr inbounds nuw %struct.object, ptr %232, i32 0, i32 2, !dbg !4840
  %234 = load i8, ptr %233, align 1, !dbg !4840
  %235 = zext i8 %234 to i64, !dbg !4841
  %236 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %235, !dbg !4841
  %237 = getelementptr inbounds nuw %struct.weapon_info, ptr %236, i32 0, i32 34, !dbg !4842
  %238 = load i32, ptr %237, align 4, !dbg !4842
  %239 = call noundef i32 @_Z6fixdivii(i32 noundef %229, i32 noundef %238), !dbg !4843
  %240 = load i32, ptr %11, align 4, !dbg !4844
  %241 = sext i32 %240 to i64, !dbg !4845
  %242 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %241, !dbg !4845
  %243 = getelementptr inbounds nuw %struct.object, ptr %242, i32 0, i32 13, !dbg !4846
  store i32 %239, ptr %243, align 4, !dbg !4847
  br label %244, !dbg !4848

244:                                              ; preds = %204, %198
  %245 = load ptr, ptr %5, align 8, !dbg !4849
  %246 = getelementptr inbounds nuw %struct.object, ptr %245, i32 0, i32 1, !dbg !4850
  %247 = load i8, ptr %246, align 4, !dbg !4850
  %248 = zext i8 %247 to i64, !dbg !4851
  %249 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %248, !dbg !4851
  %250 = getelementptr inbounds nuw %struct.weapon_info, ptr %249, i32 0, i32 31, !dbg !4852
  %251 = load i32, ptr %250, align 4, !dbg !4852
  %252 = load i32, ptr %11, align 4, !dbg !4853
  %253 = sext i32 %252 to i64, !dbg !4854
  %254 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %253, !dbg !4854
  %255 = getelementptr inbounds nuw %struct.object, ptr %254, i32 0, i32 21, !dbg !4855
  %256 = getelementptr inbounds nuw %struct.physics_info, ptr %255, i32 0, i32 2, !dbg !4856
  store i32 %251, ptr %256, align 4, !dbg !4857
  %257 = load ptr, ptr %5, align 8, !dbg !4858
  %258 = getelementptr inbounds nuw %struct.object, ptr %257, i32 0, i32 1, !dbg !4859
  %259 = load i8, ptr %258, align 4, !dbg !4859
  %260 = zext i8 %259 to i64, !dbg !4860
  %261 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %260, !dbg !4860
  %262 = getelementptr inbounds nuw %struct.weapon_info, ptr %261, i32 0, i32 32, !dbg !4861
  %263 = load i32, ptr %262, align 4, !dbg !4861
  %264 = load i32, ptr %11, align 4, !dbg !4862
  %265 = sext i32 %264 to i64, !dbg !4863
  %266 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %265, !dbg !4863
  %267 = getelementptr inbounds nuw %struct.object, ptr %266, i32 0, i32 21, !dbg !4864
  %268 = getelementptr inbounds nuw %struct.physics_info, ptr %267, i32 0, i32 3, !dbg !4865
  store i32 %263, ptr %268, align 4, !dbg !4866
  %269 = load i32, ptr %11, align 4, !dbg !4867
  %270 = sext i32 %269 to i64, !dbg !4867
  %271 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %270, !dbg !4867
  %272 = getelementptr inbounds nuw %struct.object, ptr %271, i32 0, i32 21, !dbg !4867
  %273 = getelementptr inbounds nuw %struct.physics_info, ptr %272, i32 0, i32 1, !dbg !4867
  %274 = getelementptr inbounds nuw %struct.vms_vector, ptr %273, i32 0, i32 2, !dbg !4867
  store i32 0, ptr %274, align 4, !dbg !4867
  %275 = load i32, ptr %11, align 4, !dbg !4867
  %276 = sext i32 %275 to i64, !dbg !4867
  %277 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %276, !dbg !4867
  %278 = getelementptr inbounds nuw %struct.object, ptr %277, i32 0, i32 21, !dbg !4867
  %279 = getelementptr inbounds nuw %struct.physics_info, ptr %278, i32 0, i32 1, !dbg !4867
  %280 = getelementptr inbounds nuw %struct.vms_vector, ptr %279, i32 0, i32 1, !dbg !4867
  store i32 0, ptr %280, align 4, !dbg !4867
  %281 = load i32, ptr %11, align 4, !dbg !4867
  %282 = sext i32 %281 to i64, !dbg !4867
  %283 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %282, !dbg !4867
  %284 = getelementptr inbounds nuw %struct.object, ptr %283, i32 0, i32 21, !dbg !4867
  %285 = getelementptr inbounds nuw %struct.physics_info, ptr %284, i32 0, i32 1, !dbg !4867
  %286 = getelementptr inbounds nuw %struct.vms_vector, ptr %285, i32 0, i32 0, !dbg !4867
  store i32 0, ptr %286, align 4, !dbg !4867
  %287 = load ptr, ptr %6, align 8, !dbg !4868
  %288 = load ptr, ptr %4, align 8, !dbg !4869
  %289 = getelementptr inbounds nuw %struct.object, ptr %288, i32 0, i32 11, !dbg !4870
  %290 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %287, ptr noundef %289), !dbg !4871
  %291 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %14), !dbg !4872
  %292 = load ptr, ptr %5, align 8, !dbg !4873
  %293 = getelementptr inbounds nuw %struct.object, ptr %292, i32 0, i32 21, !dbg !4874
  %294 = getelementptr inbounds nuw %struct.physics_info, ptr %293, i32 0, i32 0, !dbg !4875
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %15, ptr align 4 %294, i64 12, i1 false), !dbg !4876
  %295 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %15), !dbg !4877
  store i32 %295, ptr %16, align 4, !dbg !4878
  %296 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %14, ptr noundef %15, i32 noundef -131072), !dbg !4879
  %297 = load i32, ptr %16, align 4, !dbg !4880
  %298 = sdiv i32 %297, 4, !dbg !4881
  %299 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %14, i32 noundef %298), !dbg !4882
  %300 = load i32, ptr %11, align 4, !dbg !4883
  %301 = sext i32 %300 to i64, !dbg !4884
  %302 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %301, !dbg !4884
  %303 = getelementptr inbounds nuw %struct.object, ptr %302, i32 0, i32 21, !dbg !4885
  %304 = getelementptr inbounds nuw %struct.physics_info, ptr %303, i32 0, i32 0, !dbg !4886
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %304, ptr align 4 %14, i64 12, i1 false), !dbg !4887
  br label %305, !dbg !4888

305:                                              ; preds = %244, %168
  br label %306, !dbg !4889

306:                                              ; preds = %305, %159
  br label %307, !dbg !4890

307:                                              ; preds = %306, %103
  br label %350, !dbg !4891

308:                                              ; preds = %97
  %309 = load ptr, ptr %5, align 8, !dbg !4892
  %310 = getelementptr inbounds nuw %struct.object, ptr %309, i32 0, i32 2, !dbg !4894
  %311 = load i8, ptr %310, align 1, !dbg !4894
  %312 = zext i8 %311 to i64, !dbg !4895
  %313 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %312, !dbg !4895
  %314 = getelementptr inbounds nuw %struct.weapon_info, ptr %313, i32 0, i32 14, !dbg !4896
  %315 = load i8, ptr %314, align 1, !dbg !4896
  %316 = icmp ne i8 %315, 0, !dbg !4895
  br i1 %316, label %317, label %323, !dbg !4897

317:                                              ; preds = %308
  %318 = load i32, ptr %7, align 4, !dbg !4898
  %319 = sext i32 %318 to i64, !dbg !4899
  %320 = getelementptr inbounds [8 x i8], ptr @Boss_invulnerable_matter, i64 0, i64 %319, !dbg !4899
  %321 = load i8, ptr %320, align 1, !dbg !4899
  %322 = icmp ne i8 %321, 0, !dbg !4899
  br i1 %322, label %338, label %323, !dbg !4900

323:                                              ; preds = %317, %308
  %324 = load ptr, ptr %5, align 8, !dbg !4901
  %325 = getelementptr inbounds nuw %struct.object, ptr %324, i32 0, i32 2, !dbg !4902
  %326 = load i8, ptr %325, align 1, !dbg !4902
  %327 = zext i8 %326 to i64, !dbg !4903
  %328 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %327, !dbg !4903
  %329 = getelementptr inbounds nuw %struct.weapon_info, ptr %328, i32 0, i32 14, !dbg !4904
  %330 = load i8, ptr %329, align 1, !dbg !4904
  %331 = icmp ne i8 %330, 0, !dbg !4903
  br i1 %331, label %349, label %332, !dbg !4905

332:                                              ; preds = %323
  %333 = load i32, ptr %7, align 4, !dbg !4906
  %334 = sext i32 %333 to i64, !dbg !4907
  %335 = getelementptr inbounds [8 x i8], ptr @Boss_invulnerable_energy, i64 0, i64 %334, !dbg !4907
  %336 = load i8, ptr %335, align 1, !dbg !4907
  %337 = icmp ne i8 %336, 0, !dbg !4907
  br i1 %337, label %338, label %349, !dbg !4900

338:                                              ; preds = %332, %317
    #dbg_declare(ptr %17, !4908, !DIExpression(), !4910)
  %339 = load ptr, ptr %6, align 8, !dbg !4911
  %340 = load ptr, ptr %4, align 8, !dbg !4912
  %341 = getelementptr inbounds nuw %struct.object, ptr %340, i32 0, i32 9, !dbg !4913
  %342 = load i16, ptr %341, align 2, !dbg !4913
  %343 = sext i16 %342 to i32, !dbg !4912
  %344 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %339, i32 noundef %343), !dbg !4914
  store i32 %344, ptr %17, align 4, !dbg !4915
  %345 = load i32, ptr %17, align 4, !dbg !4916
  %346 = trunc i32 %345 to i16, !dbg !4916
  %347 = load ptr, ptr %6, align 8, !dbg !4917
  %348 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 27, i16 noundef signext %346, i16 noundef signext 0, ptr noundef %347, i32 noundef 0, i32 noundef 65536), !dbg !4918
  store i32 0, ptr %8, align 4, !dbg !4919
  br label %349, !dbg !4920

349:                                              ; preds = %338, %332, %323
  br label %350

350:                                              ; preds = %349, %307
  %351 = load i32, ptr %8, align 4, !dbg !4921
  ret i32 %351, !dbg !4922
}

declare noundef i32 @_Z15boss_spew_robotP6objectP10vms_vector(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext, i8 noundef zeroext, i32 noundef, ptr noundef, ptr noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24collide_robot_and_weaponP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4923 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4924, !DIExpression(), !4925)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4926, !DIExpression(), !4927)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4928, !DIExpression(), !4929)
    #dbg_declare(ptr %7, !4930, !DIExpression(), !4931)
  store i32 1, ptr %7, align 4, !dbg !4931
    #dbg_declare(ptr %8, !4932, !DIExpression(), !4933)
  store i32 0, ptr %8, align 4, !dbg !4933
  %15 = load ptr, ptr %5, align 8, !dbg !4934
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 2, !dbg !4936
  %17 = load i8, ptr %16, align 1, !dbg !4936
  %18 = zext i8 %17 to i32, !dbg !4934
  %19 = icmp eq i32 %18, 35, !dbg !4937
  br i1 %19, label %20, label %26, !dbg !4937

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8, !dbg !4938
  %22 = call noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %21), !dbg !4940
  %23 = icmp ne i32 %22, 0, !dbg !4940
  br i1 %23, label %25, label %24, !dbg !4941

24:                                               ; preds = %20
  br label %553, !dbg !4942

25:                                               ; preds = %20
  br label %26, !dbg !4943

26:                                               ; preds = %25, %3
  %27 = load ptr, ptr %4, align 8, !dbg !4944
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 2, !dbg !4946
  %29 = load i8, ptr %28, align 1, !dbg !4946
  %30 = zext i8 %29 to i64, !dbg !4947
  %31 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %30, !dbg !4947
  %32 = getelementptr inbounds nuw %struct.robot_info, ptr %31, i32 0, i32 36, !dbg !4948
  %33 = load i8, ptr %32, align 4, !dbg !4948
  %34 = icmp ne i8 %33, 0, !dbg !4947
  br i1 %34, label %35, label %56, !dbg !4947

35:                                               ; preds = %26
  %36 = load i32, ptr @GameTime, align 4, !dbg !4949
  store i32 %36, ptr @Boss_hit_time, align 4, !dbg !4951
  %37 = load ptr, ptr %4, align 8, !dbg !4952
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 2, !dbg !4954
  %39 = load i8, ptr %38, align 1, !dbg !4954
  %40 = zext i8 %39 to i64, !dbg !4955
  %41 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %40, !dbg !4955
  %42 = getelementptr inbounds nuw %struct.robot_info, ptr %41, i32 0, i32 36, !dbg !4956
  %43 = load i8, ptr %42, align 4, !dbg !4956
  %44 = sext i8 %43 to i32, !dbg !4955
  %45 = icmp sge i32 %44, 21, !dbg !4957
  br i1 %45, label %46, label %55, !dbg !4957

46:                                               ; preds = %35
  %47 = load ptr, ptr %4, align 8, !dbg !4958
  %48 = load ptr, ptr %5, align 8, !dbg !4960
  %49 = load ptr, ptr %6, align 8, !dbg !4961
  %50 = call noundef i32 @_Z24do_boss_weapon_collisionP6objectS0_P10vms_vector(ptr noundef %47, ptr noundef %48, ptr noundef %49), !dbg !4962
  store i32 %50, ptr %7, align 4, !dbg !4963
  %51 = load i32, ptr %7, align 4, !dbg !4964
  %52 = icmp ne i32 %51, 0, !dbg !4964
  %53 = xor i1 %52, true, !dbg !4965
  %54 = zext i1 %53 to i32, !dbg !4965
  store i32 %54, ptr %8, align 4, !dbg !4966
  br label %55, !dbg !4967

55:                                               ; preds = %46, %35
  br label %56, !dbg !4968

56:                                               ; preds = %55, %26
  %57 = load ptr, ptr %4, align 8, !dbg !4969
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 2, !dbg !4971
  %59 = load i8, ptr %58, align 1, !dbg !4971
  %60 = zext i8 %59 to i64, !dbg !4972
  %61 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %60, !dbg !4972
  %62 = getelementptr inbounds nuw %struct.robot_info, ptr %61, i32 0, i32 37, !dbg !4973
  %63 = load i8, ptr %62, align 1, !dbg !4973
  %64 = icmp ne i8 %63, 0, !dbg !4974
  br i1 %64, label %65, label %76, !dbg !4975

65:                                               ; preds = %56
  %66 = load ptr, ptr %5, align 8, !dbg !4976
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 22, !dbg !4977
  %68 = getelementptr inbounds nuw %struct.laser_info_s, ptr %67, i32 0, i32 0, !dbg !4978
  %69 = load i16, ptr %68, align 4, !dbg !4978
  %70 = sext i16 %69 to i32, !dbg !4976
  %71 = icmp ne i32 %70, 2, !dbg !4979
  br i1 %71, label %72, label %76, !dbg !4980

72:                                               ; preds = %65
  %73 = load i32, ptr @Robots_kill_robots_cheat, align 4, !dbg !4981
  %74 = icmp ne i32 %73, 0, !dbg !4981
  br i1 %74, label %76, label %75, !dbg !4975

75:                                               ; preds = %72
  br label %553, !dbg !4982

76:                                               ; preds = %72, %65, %56
  %77 = load ptr, ptr %5, align 8, !dbg !4983
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 2, !dbg !4985
  %79 = load i8, ptr %78, align 1, !dbg !4985
  %80 = zext i8 %79 to i32, !dbg !4983
  %81 = icmp eq i32 %80, 40, !dbg !4986
  br i1 %81, label %82, label %83, !dbg !4986

82:                                               ; preds = %76
  call void @_Z16smega_rock_stuffv(), !dbg !4987
  br label %83, !dbg !4987

83:                                               ; preds = %82, %76
  %84 = load ptr, ptr %5, align 8, !dbg !4988
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 21, !dbg !4990
  %86 = getelementptr inbounds nuw %struct.physics_info, ptr %85, i32 0, i32 8, !dbg !4991
  %87 = load i16, ptr %86, align 2, !dbg !4991
  %88 = zext i16 %87 to i32, !dbg !4988
  %89 = and i32 %88, 32, !dbg !4992
  %90 = icmp ne i32 %89, 0, !dbg !4988
  br i1 %90, label %91, label %113, !dbg !4988

91:                                               ; preds = %83
  %92 = load ptr, ptr %5, align 8, !dbg !4993
  %93 = getelementptr inbounds nuw %struct.object, ptr %92, i32 0, i32 22, !dbg !4996
  %94 = getelementptr inbounds nuw %struct.laser_info_s, ptr %93, i32 0, i32 4, !dbg !4997
  %95 = load i16, ptr %94, align 4, !dbg !4997
  %96 = sext i16 %95 to i64, !dbg !4993
  %97 = load ptr, ptr %4, align 8, !dbg !4998
  %98 = ptrtoint ptr %97 to i64, !dbg !4999
  %99 = sub i64 %98, ptrtoint (ptr @Objects to i64), !dbg !4999
  %100 = sdiv exact i64 %99, 268, !dbg !4999
  %101 = icmp eq i64 %96, %100, !dbg !5000
  br i1 %101, label %102, label %103, !dbg !5000

102:                                              ; preds = %91
  br label %553, !dbg !5001

103:                                              ; preds = %91
  %104 = load ptr, ptr %4, align 8, !dbg !5002
  %105 = ptrtoint ptr %104 to i64, !dbg !5003
  %106 = sub i64 %105, ptrtoint (ptr @Objects to i64), !dbg !5003
  %107 = sdiv exact i64 %106, 268, !dbg !5003
  %108 = trunc i64 %107 to i16, !dbg !5002
  %109 = load ptr, ptr %5, align 8, !dbg !5004
  %110 = getelementptr inbounds nuw %struct.object, ptr %109, i32 0, i32 22, !dbg !5005
  %111 = getelementptr inbounds nuw %struct.laser_info_s, ptr %110, i32 0, i32 4, !dbg !5006
  store i16 %108, ptr %111, align 4, !dbg !5007
  br label %112

112:                                              ; preds = %103
  br label %113, !dbg !5008

113:                                              ; preds = %112, %83
  %114 = load ptr, ptr %5, align 8, !dbg !5009
  %115 = getelementptr inbounds nuw %struct.object, ptr %114, i32 0, i32 22, !dbg !5011
  %116 = getelementptr inbounds nuw %struct.laser_info_s, ptr %115, i32 0, i32 2, !dbg !5012
  %117 = load i32, ptr %116, align 4, !dbg !5012
  %118 = load ptr, ptr %4, align 8, !dbg !5013
  %119 = getelementptr inbounds nuw %struct.object, ptr %118, i32 0, i32 0, !dbg !5014
  %120 = load i32, ptr %119, align 4, !dbg !5014
  %121 = icmp eq i32 %117, %120, !dbg !5015
  br i1 %121, label %122, label %123, !dbg !5015

122:                                              ; preds = %113
  br label %553, !dbg !5016

123:                                              ; preds = %113
  %124 = load ptr, ptr %5, align 8, !dbg !5017
  %125 = getelementptr inbounds nuw %struct.object, ptr %124, i32 0, i32 22, !dbg !5019
  %126 = getelementptr inbounds nuw %struct.laser_info_s, ptr %125, i32 0, i32 0, !dbg !5020
  %127 = load i16, ptr %126, align 4, !dbg !5020
  %128 = sext i16 %127 to i32, !dbg !5017
  %129 = icmp eq i32 %128, 4, !dbg !5021
  br i1 %129, label %130, label %191, !dbg !5022

130:                                              ; preds = %123
  %131 = load ptr, ptr %4, align 8, !dbg !5023
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 2, !dbg !5024
  %133 = load i8, ptr %132, align 1, !dbg !5024
  %134 = zext i8 %133 to i64, !dbg !5025
  %135 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %134, !dbg !5025
  %136 = getelementptr inbounds nuw %struct.robot_info, ptr %135, i32 0, i32 39, !dbg !5026
  %137 = load i8, ptr %136, align 1, !dbg !5026
  %138 = icmp ne i8 %137, 0, !dbg !5027
  br i1 %138, label %139, label %191, !dbg !5022

139:                                              ; preds = %130
  %140 = load ptr, ptr %4, align 8, !dbg !5028
  %141 = getelementptr inbounds nuw %struct.object, ptr %140, i32 0, i32 14, !dbg !5030
  %142 = load i32, ptr %141, align 4, !dbg !5030
  %143 = icmp sgt i32 %142, 0, !dbg !5031
  br i1 %143, label %144, label %190, !dbg !5032

144:                                              ; preds = %139
  %145 = load ptr, ptr %5, align 8, !dbg !5033
  %146 = getelementptr inbounds nuw %struct.object, ptr %145, i32 0, i32 2, !dbg !5034
  %147 = load i8, ptr %146, align 1, !dbg !5034
  %148 = zext i8 %147 to i64, !dbg !5035
  %149 = getelementptr inbounds nuw [70 x i8], ptr @Weapon_is_energy, i64 0, i64 %148, !dbg !5035
  %150 = load i8, ptr %149, align 1, !dbg !5035
  %151 = icmp ne i8 %150, 0, !dbg !5035
  br i1 %151, label %152, label %190, !dbg !5032

152:                                              ; preds = %144
    #dbg_declare(ptr %9, !5036, !DIExpression(), !5038)
    #dbg_declare(ptr %10, !5039, !DIExpression(), !5040)
  %153 = load i32, ptr @Difficulty_level, align 4, !dbg !5041
  %154 = add nsw i32 %153, 2, !dbg !5042
  %155 = load ptr, ptr %5, align 8, !dbg !5043
  %156 = getelementptr inbounds nuw %struct.object, ptr %155, i32 0, i32 14, !dbg !5044
  %157 = load ptr, ptr %4, align 8, !dbg !5045
  %158 = getelementptr inbounds nuw %struct.object, ptr %157, i32 0, i32 14, !dbg !5046
  %159 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %156, ptr noundef nonnull align 4 dereferenceable(4) %158), !dbg !5047
  %160 = load i32, ptr %159, align 4, !dbg !5047
  %161 = mul nsw i32 %154, %160, !dbg !5048
  store i32 %161, ptr %9, align 4, !dbg !5049
  %162 = load ptr, ptr %4, align 8, !dbg !5050
  %163 = getelementptr inbounds nuw %struct.object, ptr %162, i32 0, i32 2, !dbg !5051
  %164 = load i8, ptr %163, align 1, !dbg !5051
  %165 = zext i8 %164 to i64, !dbg !5052
  %166 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %165, !dbg !5052
  %167 = getelementptr inbounds nuw %struct.robot_info, ptr %166, i32 0, i32 39, !dbg !5053
  %168 = load i8, ptr %167, align 1, !dbg !5053
  %169 = sext i8 %168 to i32, !dbg !5052
  %170 = load i32, ptr %9, align 4, !dbg !5054
  %171 = mul nsw i32 %169, %170, !dbg !5055
  %172 = sdiv i32 %171, 160, !dbg !5056
  store i32 %172, ptr %9, align 4, !dbg !5057
  %173 = load i32, ptr %9, align 4, !dbg !5058
  %174 = ashr i32 %173, 16, !dbg !5059
  store i32 %174, ptr %10, align 4, !dbg !5060
  %175 = call noundef i32 @_Z6P_Randv(), !dbg !5061
  %176 = mul nsw i32 2, %175, !dbg !5063
  %177 = load i32, ptr %9, align 4, !dbg !5064
  %178 = and i32 %177, 65535, !dbg !5065
  %179 = icmp slt i32 %176, %178, !dbg !5066
  br i1 %179, label %180, label %183, !dbg !5066

180:                                              ; preds = %152
  %181 = load i32, ptr %10, align 4, !dbg !5067
  %182 = add nsw i32 %181, 1, !dbg !5067
  store i32 %182, ptr %10, align 4, !dbg !5067
  br label %183, !dbg !5068

183:                                              ; preds = %180, %152
  %184 = load i32, ptr %10, align 4, !dbg !5069
  %185 = icmp ne i32 %184, 0, !dbg !5069
  br i1 %185, label %186, label %189, !dbg !5069

186:                                              ; preds = %183
  %187 = load ptr, ptr %4, align 8, !dbg !5071
  %188 = load i32, ptr %10, align 4, !dbg !5072
  call void @_Z21create_smart_childrenP6objecti(ptr noundef %187, i32 noundef %188), !dbg !5073
  br label %189, !dbg !5073

189:                                              ; preds = %186, %183
  br label %190, !dbg !5074

190:                                              ; preds = %189, %144, %139
  br label %191, !dbg !5075

191:                                              ; preds = %190, %130, %123
  %192 = load ptr, ptr %5, align 8, !dbg !5076
  %193 = getelementptr inbounds nuw %struct.object, ptr %192, i32 0, i32 2, !dbg !5078
  %194 = load i8, ptr %193, align 1, !dbg !5078
  %195 = zext i8 %194 to i64, !dbg !5079
  %196 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %195, !dbg !5079
  %197 = getelementptr inbounds nuw %struct.weapon_info, ptr %196, i32 0, i32 37, !dbg !5080
  %198 = load i32, ptr %197, align 4, !dbg !5080
  %199 = icmp ne i32 %198, 0, !dbg !5079
  br i1 %199, label %200, label %247, !dbg !5079

200:                                              ; preds = %191
  %201 = load i32, ptr %8, align 4, !dbg !5081
  %202 = icmp ne i32 %201, 0, !dbg !5081
  br i1 %202, label %203, label %242, !dbg !5081

203:                                              ; preds = %200
    #dbg_declare(ptr %11, !5083, !DIExpression(), !5085)
  %204 = load ptr, ptr %5, align 8, !dbg !5086
  %205 = getelementptr inbounds nuw %struct.object, ptr %204, i32 0, i32 2, !dbg !5087
  %206 = load i8, ptr %205, align 1, !dbg !5087
  %207 = zext i8 %206 to i64, !dbg !5088
  %208 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %207, !dbg !5088
  store ptr %208, ptr %11, align 8, !dbg !5085
  %209 = load ptr, ptr %5, align 8, !dbg !5089
  %210 = load ptr, ptr %5, align 8, !dbg !5090
  %211 = getelementptr inbounds nuw %struct.object, ptr %210, i32 0, i32 9, !dbg !5091
  %212 = load i16, ptr %211, align 2, !dbg !5091
  %213 = load ptr, ptr %6, align 8, !dbg !5092
  %214 = load ptr, ptr %11, align 8, !dbg !5093
  %215 = getelementptr inbounds nuw %struct.weapon_info, ptr %214, i32 0, i32 28, !dbg !5094
  %216 = load i32, ptr %215, align 4, !dbg !5094
  %217 = load ptr, ptr %11, align 8, !dbg !5095
  %218 = getelementptr inbounds nuw %struct.weapon_info, ptr %217, i32 0, i32 5, !dbg !5096
  %219 = load i8, ptr %218, align 1, !dbg !5096
  %220 = sext i8 %219 to i32, !dbg !5095
  %221 = load ptr, ptr %11, align 8, !dbg !5097
  %222 = getelementptr inbounds nuw %struct.weapon_info, ptr %221, i32 0, i32 29, !dbg !5098
  %223 = load i32, ptr @Difficulty_level, align 4, !dbg !5099
  %224 = sext i32 %223 to i64, !dbg !5097
  %225 = getelementptr inbounds [5 x i32], ptr %222, i64 0, i64 %224, !dbg !5097
  %226 = load i32, ptr %225, align 4, !dbg !5097
  %227 = load ptr, ptr %11, align 8, !dbg !5100
  %228 = getelementptr inbounds nuw %struct.weapon_info, ptr %227, i32 0, i32 37, !dbg !5101
  %229 = load i32, ptr %228, align 4, !dbg !5101
  %230 = load ptr, ptr %11, align 8, !dbg !5102
  %231 = getelementptr inbounds nuw %struct.weapon_info, ptr %230, i32 0, i32 29, !dbg !5103
  %232 = load i32, ptr @Difficulty_level, align 4, !dbg !5104
  %233 = sext i32 %232 to i64, !dbg !5102
  %234 = getelementptr inbounds [5 x i32], ptr %231, i64 0, i64 %233, !dbg !5102
  %235 = load i32, ptr %234, align 4, !dbg !5102
  %236 = load ptr, ptr %5, align 8, !dbg !5105
  %237 = getelementptr inbounds nuw %struct.object, ptr %236, i32 0, i32 22, !dbg !5106
  %238 = getelementptr inbounds nuw %struct.laser_info_s, ptr %237, i32 0, i32 1, !dbg !5107
  %239 = load i16, ptr %238, align 2, !dbg !5107
  %240 = sext i16 %239 to i32, !dbg !5105
  %241 = call noundef ptr @_Z30object_create_badass_explosionP6objectsP10vms_vectoriiiiii(ptr noundef %209, i16 noundef signext %212, ptr noundef %213, i32 noundef %216, i32 noundef %220, i32 noundef %226, i32 noundef %229, i32 noundef %235, i32 noundef %240), !dbg !5108
  br label %246, !dbg !5109

242:                                              ; preds = %200
  %243 = load ptr, ptr %5, align 8, !dbg !5110
  %244 = load ptr, ptr %6, align 8, !dbg !5111
  %245 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %243, ptr noundef %244), !dbg !5112
  br label %246

246:                                              ; preds = %242, %203
  br label %247, !dbg !5081

247:                                              ; preds = %246, %191
  %248 = load ptr, ptr %5, align 8, !dbg !5113
  %249 = getelementptr inbounds nuw %struct.object, ptr %248, i32 0, i32 22, !dbg !5115
  %250 = getelementptr inbounds nuw %struct.laser_info_s, ptr %249, i32 0, i32 0, !dbg !5116
  %251 = load i16, ptr %250, align 4, !dbg !5116
  %252 = sext i16 %251 to i32, !dbg !5113
  %253 = icmp eq i32 %252, 4, !dbg !5117
  br i1 %253, label %257, label %254, !dbg !5118

254:                                              ; preds = %247
  %255 = load i32, ptr @Robots_kill_robots_cheat, align 4, !dbg !5119
  %256 = icmp ne i32 %255, 0, !dbg !5119
  br i1 %256, label %257, label %550, !dbg !5120

257:                                              ; preds = %254, %247
  %258 = load ptr, ptr %4, align 8, !dbg !5121
  %259 = getelementptr inbounds nuw %struct.object, ptr %258, i32 0, i32 8, !dbg !5122
  %260 = load i8, ptr %259, align 1, !dbg !5122
  %261 = zext i8 %260 to i32, !dbg !5121
  %262 = and i32 %261, 1, !dbg !5123
  %263 = icmp ne i32 %262, 0, !dbg !5124
  br i1 %263, label %550, label %264, !dbg !5120

264:                                              ; preds = %257
    #dbg_declare(ptr %12, !5125, !DIExpression(), !5127)
  store ptr null, ptr %12, align 8, !dbg !5127
  %265 = load ptr, ptr %5, align 8, !dbg !5128
  %266 = getelementptr inbounds nuw %struct.object, ptr %265, i32 0, i32 22, !dbg !5130
  %267 = getelementptr inbounds nuw %struct.laser_info_s, ptr %266, i32 0, i32 1, !dbg !5131
  %268 = load i16, ptr %267, align 2, !dbg !5131
  %269 = sext i16 %268 to i32, !dbg !5128
  %270 = load i32, ptr @Player_num, align 4, !dbg !5132
  %271 = sext i32 %270 to i64, !dbg !5133
  %272 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %271, !dbg !5133
  %273 = getelementptr inbounds nuw %struct.player, ptr %272, i32 0, i32 4, !dbg !5134
  %274 = load i32, ptr %273, align 4, !dbg !5134
  %275 = icmp eq i32 %269, %274, !dbg !5135
  br i1 %275, label %276, label %279, !dbg !5135

276:                                              ; preds = %264
  %277 = load ptr, ptr %5, align 8, !dbg !5136
  call void @_Z22create_awareness_eventP6objecti(ptr noundef %277, i32 noundef 4), !dbg !5138
  %278 = load ptr, ptr %4, align 8, !dbg !5139
  call void @_Z15do_ai_robot_hitP6objecti(ptr noundef %278, i32 noundef 4), !dbg !5140
  br label %279, !dbg !5141

279:                                              ; preds = %276, %264
  %280 = load ptr, ptr %4, align 8, !dbg !5142
  %281 = getelementptr inbounds nuw %struct.object, ptr %280, i32 0, i32 2, !dbg !5144
  %282 = load i8, ptr %281, align 1, !dbg !5144
  %283 = zext i8 %282 to i64, !dbg !5145
  %284 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %283, !dbg !5145
  %285 = getelementptr inbounds nuw %struct.robot_info, ptr %284, i32 0, i32 3, !dbg !5146
  %286 = load i16, ptr %285, align 4, !dbg !5146
  %287 = sext i16 %286 to i32, !dbg !5145
  %288 = icmp sgt i32 %287, -1, !dbg !5147
  br i1 %288, label %289, label %309, !dbg !5147

289:                                              ; preds = %279
  %290 = load ptr, ptr %5, align 8, !dbg !5148
  %291 = getelementptr inbounds nuw %struct.object, ptr %290, i32 0, i32 9, !dbg !5149
  %292 = load i16, ptr %291, align 2, !dbg !5149
  %293 = load ptr, ptr %6, align 8, !dbg !5150
  %294 = load ptr, ptr %4, align 8, !dbg !5151
  %295 = getelementptr inbounds nuw %struct.object, ptr %294, i32 0, i32 13, !dbg !5152
  %296 = load i32, ptr %295, align 4, !dbg !5152
  %297 = sdiv i32 %296, 2, !dbg !5153
  %298 = mul nsw i32 %297, 3, !dbg !5154
  %299 = sdiv i32 %298, 4, !dbg !5155
  %300 = load ptr, ptr %4, align 8, !dbg !5156
  %301 = getelementptr inbounds nuw %struct.object, ptr %300, i32 0, i32 2, !dbg !5157
  %302 = load i8, ptr %301, align 1, !dbg !5157
  %303 = zext i8 %302 to i64, !dbg !5158
  %304 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %303, !dbg !5158
  %305 = getelementptr inbounds nuw %struct.robot_info, ptr %304, i32 0, i32 3, !dbg !5159
  %306 = load i16, ptr %305, align 4, !dbg !5159
  %307 = sext i16 %306 to i32, !dbg !5158
  %308 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %292, ptr noundef %293, i32 noundef %299, i32 noundef %307), !dbg !5160
  store ptr %308, ptr %12, align 8, !dbg !5161
  br label %341, !dbg !5162

309:                                              ; preds = %279
  %310 = load ptr, ptr %5, align 8, !dbg !5163
  %311 = getelementptr inbounds nuw %struct.object, ptr %310, i32 0, i32 2, !dbg !5165
  %312 = load i8, ptr %311, align 1, !dbg !5165
  %313 = zext i8 %312 to i64, !dbg !5166
  %314 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %313, !dbg !5166
  %315 = getelementptr inbounds nuw %struct.weapon_info, ptr %314, i32 0, i32 5, !dbg !5167
  %316 = load i8, ptr %315, align 1, !dbg !5167
  %317 = sext i8 %316 to i32, !dbg !5166
  %318 = icmp sgt i32 %317, -1, !dbg !5168
  br i1 %318, label %319, label %340, !dbg !5168

319:                                              ; preds = %309
  %320 = load ptr, ptr %5, align 8, !dbg !5169
  %321 = getelementptr inbounds nuw %struct.object, ptr %320, i32 0, i32 9, !dbg !5170
  %322 = load i16, ptr %321, align 2, !dbg !5170
  %323 = load ptr, ptr %6, align 8, !dbg !5171
  %324 = load ptr, ptr %5, align 8, !dbg !5172
  %325 = getelementptr inbounds nuw %struct.object, ptr %324, i32 0, i32 2, !dbg !5173
  %326 = load i8, ptr %325, align 1, !dbg !5173
  %327 = zext i8 %326 to i64, !dbg !5174
  %328 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %327, !dbg !5174
  %329 = getelementptr inbounds nuw %struct.weapon_info, ptr %328, i32 0, i32 28, !dbg !5175
  %330 = load i32, ptr %329, align 4, !dbg !5175
  %331 = load ptr, ptr %5, align 8, !dbg !5176
  %332 = getelementptr inbounds nuw %struct.object, ptr %331, i32 0, i32 2, !dbg !5177
  %333 = load i8, ptr %332, align 1, !dbg !5177
  %334 = zext i8 %333 to i64, !dbg !5178
  %335 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %334, !dbg !5178
  %336 = getelementptr inbounds nuw %struct.weapon_info, ptr %335, i32 0, i32 5, !dbg !5179
  %337 = load i8, ptr %336, align 1, !dbg !5179
  %338 = sext i8 %337 to i32, !dbg !5178
  %339 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %322, ptr noundef %323, i32 noundef %330, i32 noundef %338), !dbg !5180
  store ptr %339, ptr %12, align 8, !dbg !5181
  br label %340, !dbg !5182

340:                                              ; preds = %319, %309
  br label %341

341:                                              ; preds = %340, %289
  %342 = load ptr, ptr %12, align 8, !dbg !5183
  %343 = icmp ne ptr %342, null, !dbg !5183
  br i1 %343, label %344, label %347, !dbg !5183

344:                                              ; preds = %341
  %345 = load ptr, ptr %4, align 8, !dbg !5185
  %346 = load ptr, ptr %12, align 8, !dbg !5186
  call void @_Z10obj_attachP6objectS0_(ptr noundef %345, ptr noundef %346), !dbg !5187
  br label %347, !dbg !5187

347:                                              ; preds = %344, %341
  %348 = load i32, ptr %7, align 4, !dbg !5188
  %349 = icmp ne i32 %348, 0, !dbg !5188
  br i1 %349, label %350, label %374, !dbg !5190

350:                                              ; preds = %347
  %351 = load ptr, ptr %4, align 8, !dbg !5191
  %352 = getelementptr inbounds nuw %struct.object, ptr %351, i32 0, i32 2, !dbg !5192
  %353 = load i8, ptr %352, align 1, !dbg !5192
  %354 = zext i8 %353 to i64, !dbg !5193
  %355 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %354, !dbg !5193
  %356 = getelementptr inbounds nuw %struct.robot_info, ptr %355, i32 0, i32 4, !dbg !5194
  %357 = load i16, ptr %356, align 2, !dbg !5194
  %358 = sext i16 %357 to i32, !dbg !5193
  %359 = icmp sgt i32 %358, -1, !dbg !5195
  br i1 %359, label %360, label %374, !dbg !5190

360:                                              ; preds = %350
  %361 = load ptr, ptr %4, align 8, !dbg !5196
  %362 = getelementptr inbounds nuw %struct.object, ptr %361, i32 0, i32 2, !dbg !5197
  %363 = load i8, ptr %362, align 1, !dbg !5197
  %364 = zext i8 %363 to i64, !dbg !5198
  %365 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %364, !dbg !5198
  %366 = getelementptr inbounds nuw %struct.robot_info, ptr %365, i32 0, i32 4, !dbg !5199
  %367 = load i16, ptr %366, align 2, !dbg !5199
  %368 = sext i16 %367 to i32, !dbg !5198
  %369 = load ptr, ptr %4, align 8, !dbg !5200
  %370 = getelementptr inbounds nuw %struct.object, ptr %369, i32 0, i32 9, !dbg !5201
  %371 = load i16, ptr %370, align 2, !dbg !5201
  %372 = load ptr, ptr %6, align 8, !dbg !5202
  %373 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %368, i16 noundef signext %371, i16 noundef signext 0, ptr noundef %372, i32 noundef 0, i32 noundef 65536), !dbg !5203
  br label %374, !dbg !5203

374:                                              ; preds = %360, %350, %347
  %375 = load ptr, ptr %5, align 8, !dbg !5204
  %376 = getelementptr inbounds nuw %struct.object, ptr %375, i32 0, i32 8, !dbg !5206
  %377 = load i8, ptr %376, align 1, !dbg !5206
  %378 = zext i8 %377 to i32, !dbg !5204
  %379 = and i32 %378, 32, !dbg !5207
  %380 = icmp ne i32 %379, 0, !dbg !5208
  br i1 %380, label %455, label %381, !dbg !5209

381:                                              ; preds = %374
    #dbg_declare(ptr %13, !5210, !DIExpression(), !5212)
  %382 = load ptr, ptr %5, align 8, !dbg !5213
  %383 = getelementptr inbounds nuw %struct.object, ptr %382, i32 0, i32 14, !dbg !5214
  %384 = load i32, ptr %383, align 4, !dbg !5214
  store i32 %384, ptr %13, align 4, !dbg !5212
  %385 = load i32, ptr %7, align 4, !dbg !5215
  %386 = icmp ne i32 %385, 0, !dbg !5215
  br i1 %386, label %387, label %394, !dbg !5215

387:                                              ; preds = %381
  %388 = load i32, ptr %13, align 4, !dbg !5217
  %389 = load ptr, ptr %5, align 8, !dbg !5218
  %390 = getelementptr inbounds nuw %struct.object, ptr %389, i32 0, i32 22, !dbg !5219
  %391 = getelementptr inbounds nuw %struct.laser_info_s, ptr %390, i32 0, i32 6, !dbg !5220
  %392 = load i32, ptr %391, align 4, !dbg !5220
  %393 = call noundef i32 @_Z6fixmulii(i32 noundef %388, i32 noundef %392), !dbg !5221
  store i32 %393, ptr %13, align 4, !dbg !5222
  br label %395, !dbg !5223

394:                                              ; preds = %381
  store i32 0, ptr %13, align 4, !dbg !5224
  br label %395

395:                                              ; preds = %394, %387
  %396 = load ptr, ptr %5, align 8, !dbg !5225
  %397 = getelementptr inbounds nuw %struct.object, ptr %396, i32 0, i32 2, !dbg !5227
  %398 = load i8, ptr %397, align 1, !dbg !5227
  %399 = zext i8 %398 to i32, !dbg !5225
  %400 = icmp eq i32 %399, 32, !dbg !5228
  br i1 %400, label %401, label %417, !dbg !5228

401:                                              ; preds = %395
  %402 = load ptr, ptr %4, align 8, !dbg !5229
  %403 = getelementptr inbounds nuw %struct.object, ptr %402, i32 0, i32 2, !dbg !5231
  %404 = load i8, ptr %403, align 1, !dbg !5231
  %405 = zext i8 %404 to i64, !dbg !5232
  %406 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %405, !dbg !5232
  %407 = getelementptr inbounds nuw %struct.robot_info, ptr %406, i32 0, i32 36, !dbg !5233
  %408 = load i8, ptr %407, align 4, !dbg !5233
  %409 = icmp ne i8 %408, 0, !dbg !5232
  br i1 %409, label %410, label %416, !dbg !5232

410:                                              ; preds = %401
  %411 = load i32, ptr %13, align 4, !dbg !5234
  %412 = load i32, ptr @Difficulty_level, align 4, !dbg !5235
  %413 = sub nsw i32 10, %412, !dbg !5236
  %414 = mul nsw i32 %411, %413, !dbg !5237
  %415 = sdiv i32 %414, 10, !dbg !5238
  store i32 %415, ptr %13, align 4, !dbg !5239
  br label %416, !dbg !5240

416:                                              ; preds = %410, %401
  br label %417, !dbg !5233

417:                                              ; preds = %416, %395
  %418 = load ptr, ptr %4, align 8, !dbg !5241
  %419 = load i32, ptr %13, align 4, !dbg !5243
  %420 = load ptr, ptr %5, align 8, !dbg !5244
  %421 = getelementptr inbounds nuw %struct.object, ptr %420, i32 0, i32 22, !dbg !5245
  %422 = getelementptr inbounds nuw %struct.laser_info_s, ptr %421, i32 0, i32 1, !dbg !5246
  %423 = load i16, ptr %422, align 2, !dbg !5246
  %424 = sext i16 %423 to i32, !dbg !5244
  %425 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %418, i32 noundef %419, i32 noundef %424), !dbg !5247
  %426 = icmp ne i32 %425, 0, !dbg !5247
  br i1 %426, label %430, label %427, !dbg !5248

427:                                              ; preds = %417
  %428 = load ptr, ptr %4, align 8, !dbg !5249
  %429 = load ptr, ptr %5, align 8, !dbg !5250
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %428, ptr noundef %429, i32 noundef 0), !dbg !5251
  br label %454, !dbg !5251

430:                                              ; preds = %417
  %431 = load ptr, ptr %5, align 8, !dbg !5252
  %432 = getelementptr inbounds nuw %struct.object, ptr %431, i32 0, i32 22, !dbg !5254
  %433 = getelementptr inbounds nuw %struct.laser_info_s, ptr %432, i32 0, i32 2, !dbg !5255
  %434 = load i32, ptr %433, align 4, !dbg !5255
  %435 = load ptr, ptr @ConsoleObject, align 8, !dbg !5256
  %436 = getelementptr inbounds nuw %struct.object, ptr %435, i32 0, i32 0, !dbg !5257
  %437 = load i32, ptr %436, align 4, !dbg !5257
  %438 = icmp eq i32 %434, %437, !dbg !5258
  br i1 %438, label %439, label %453, !dbg !5258

439:                                              ; preds = %430
  %440 = load ptr, ptr %4, align 8, !dbg !5259
  %441 = getelementptr inbounds nuw %struct.object, ptr %440, i32 0, i32 2, !dbg !5261
  %442 = load i8, ptr %441, align 1, !dbg !5261
  %443 = zext i8 %442 to i64, !dbg !5262
  %444 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %443, !dbg !5262
  %445 = getelementptr inbounds nuw %struct.robot_info, ptr %444, i32 0, i32 15, !dbg !5263
  %446 = load i16, ptr %445, align 4, !dbg !5263
  %447 = sext i16 %446 to i32, !dbg !5262
  call void @_Z19add_points_to_scorei(i32 noundef %447), !dbg !5264
  %448 = load ptr, ptr %4, align 8, !dbg !5265
  %449 = ptrtoint ptr %448 to i64, !dbg !5266
  %450 = sub i64 %449, ptrtoint (ptr @Objects to i64), !dbg !5266
  %451 = sdiv exact i64 %450, 268, !dbg !5266
  %452 = trunc i64 %451 to i32, !dbg !5265
  call void @_Z31detect_escort_goal_accomplishedi(i32 noundef %452), !dbg !5267
  br label %453, !dbg !5268

453:                                              ; preds = %439, %430
  br label %454

454:                                              ; preds = %453, %427
  br label %455, !dbg !5269

455:                                              ; preds = %454, %374
  %456 = load ptr, ptr %4, align 8, !dbg !5270
  %457 = icmp ne ptr %456, null, !dbg !5272
  br i1 %457, label %458, label %549, !dbg !5273

458:                                              ; preds = %455
  %459 = load ptr, ptr %4, align 8, !dbg !5274
  %460 = getelementptr inbounds nuw %struct.object, ptr %459, i32 0, i32 2, !dbg !5275
  %461 = load i8, ptr %460, align 1, !dbg !5275
  %462 = zext i8 %461 to i64, !dbg !5276
  %463 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %462, !dbg !5276
  %464 = getelementptr inbounds nuw %struct.robot_info, ptr %463, i32 0, i32 37, !dbg !5277
  %465 = load i8, ptr %464, align 1, !dbg !5277
  %466 = icmp ne i8 %465, 0, !dbg !5276
  br i1 %466, label %549, label %467, !dbg !5278

467:                                              ; preds = %458
  %468 = load ptr, ptr %4, align 8, !dbg !5279
  %469 = getelementptr inbounds nuw %struct.object, ptr %468, i32 0, i32 2, !dbg !5280
  %470 = load i8, ptr %469, align 1, !dbg !5280
  %471 = zext i8 %470 to i64, !dbg !5281
  %472 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %471, !dbg !5281
  %473 = getelementptr inbounds nuw %struct.robot_info, ptr %472, i32 0, i32 36, !dbg !5282
  %474 = load i8, ptr %473, align 4, !dbg !5282
  %475 = icmp ne i8 %474, 0, !dbg !5281
  br i1 %475, label %549, label %476, !dbg !5283

476:                                              ; preds = %467
  %477 = load ptr, ptr %5, align 8, !dbg !5284
  %478 = getelementptr inbounds nuw %struct.object, ptr %477, i32 0, i32 2, !dbg !5285
  %479 = load i8, ptr %478, align 1, !dbg !5285
  %480 = zext i8 %479 to i32, !dbg !5284
  %481 = icmp eq i32 %480, 32, !dbg !5286
  br i1 %481, label %482, label %549, !dbg !5283

482:                                              ; preds = %476
    #dbg_declare(ptr %14, !5287, !DIExpression(), !5290)
  %483 = load ptr, ptr %4, align 8, !dbg !5291
  %484 = getelementptr inbounds nuw %struct.object, ptr %483, i32 0, i32 22, !dbg !5292
  store ptr %484, ptr %14, align 8, !dbg !5290
  %485 = load ptr, ptr %14, align 8, !dbg !5293
  %486 = getelementptr inbounds nuw %struct.ai_static, ptr %485, i32 0, i32 1, !dbg !5295
  %487 = getelementptr inbounds [11 x i8], ptr %486, i64 0, i64 7, !dbg !5293
  %488 = load i8, ptr %487, align 1, !dbg !5293
  %489 = sext i8 %488 to i32, !dbg !5293
  %490 = load i32, ptr @FrameTime, align 4, !dbg !5296
  %491 = mul nsw i32 %489, %490, !dbg !5297
  %492 = icmp slt i32 %491, 65536, !dbg !5298
  br i1 %492, label %493, label %548, !dbg !5298

493:                                              ; preds = %482
  %494 = load ptr, ptr %14, align 8, !dbg !5299
  %495 = getelementptr inbounds nuw %struct.ai_static, ptr %494, i32 0, i32 1, !dbg !5301
  %496 = getelementptr inbounds [11 x i8], ptr %495, i64 0, i64 7, !dbg !5299
  %497 = load i8, ptr %496, align 1, !dbg !5302
  %498 = add i8 %497, 1, !dbg !5302
  store i8 %498, ptr %496, align 1, !dbg !5302
  %499 = call noundef i32 @_Z6P_Randv(), !dbg !5303
  %500 = sub nsw i32 %499, 16384, !dbg !5304
  %501 = load i32, ptr @FrameTime, align 4, !dbg !5305
  %502 = load ptr, ptr %14, align 8, !dbg !5306
  %503 = getelementptr inbounds nuw %struct.ai_static, ptr %502, i32 0, i32 1, !dbg !5307
  %504 = getelementptr inbounds [11 x i8], ptr %503, i64 0, i64 7, !dbg !5306
  %505 = load i8, ptr %504, align 1, !dbg !5306
  %506 = sext i8 %505 to i32, !dbg !5306
  %507 = mul nsw i32 %501, %506, !dbg !5308
  %508 = call noundef i32 @_Z6fixmulii(i32 noundef %500, i32 noundef %507), !dbg !5309
  %509 = load ptr, ptr %4, align 8, !dbg !5310
  %510 = getelementptr inbounds nuw %struct.object, ptr %509, i32 0, i32 21, !dbg !5311
  %511 = getelementptr inbounds nuw %struct.physics_info, ptr %510, i32 0, i32 6, !dbg !5312
  %512 = getelementptr inbounds nuw %struct.vms_vector, ptr %511, i32 0, i32 0, !dbg !5313
  store i32 %508, ptr %512, align 4, !dbg !5314
  %513 = call noundef i32 @_Z6P_Randv(), !dbg !5315
  %514 = sub nsw i32 %513, 16384, !dbg !5316
  %515 = load i32, ptr @FrameTime, align 4, !dbg !5317
  %516 = load ptr, ptr %14, align 8, !dbg !5318
  %517 = getelementptr inbounds nuw %struct.ai_static, ptr %516, i32 0, i32 1, !dbg !5319
  %518 = getelementptr inbounds [11 x i8], ptr %517, i64 0, i64 7, !dbg !5318
  %519 = load i8, ptr %518, align 1, !dbg !5318
  %520 = sext i8 %519 to i32, !dbg !5318
  %521 = mul nsw i32 %515, %520, !dbg !5320
  %522 = call noundef i32 @_Z6fixmulii(i32 noundef %514, i32 noundef %521), !dbg !5321
  %523 = load ptr, ptr %4, align 8, !dbg !5322
  %524 = getelementptr inbounds nuw %struct.object, ptr %523, i32 0, i32 21, !dbg !5323
  %525 = getelementptr inbounds nuw %struct.physics_info, ptr %524, i32 0, i32 6, !dbg !5324
  %526 = getelementptr inbounds nuw %struct.vms_vector, ptr %525, i32 0, i32 1, !dbg !5325
  store i32 %522, ptr %526, align 4, !dbg !5326
  %527 = call noundef i32 @_Z6P_Randv(), !dbg !5327
  %528 = sub nsw i32 %527, 16384, !dbg !5328
  %529 = load i32, ptr @FrameTime, align 4, !dbg !5329
  %530 = load ptr, ptr %14, align 8, !dbg !5330
  %531 = getelementptr inbounds nuw %struct.ai_static, ptr %530, i32 0, i32 1, !dbg !5331
  %532 = getelementptr inbounds [11 x i8], ptr %531, i64 0, i64 7, !dbg !5330
  %533 = load i8, ptr %532, align 1, !dbg !5330
  %534 = sext i8 %533 to i32, !dbg !5330
  %535 = mul nsw i32 %529, %534, !dbg !5332
  %536 = call noundef i32 @_Z6fixmulii(i32 noundef %528, i32 noundef %535), !dbg !5333
  %537 = load ptr, ptr %4, align 8, !dbg !5334
  %538 = getelementptr inbounds nuw %struct.object, ptr %537, i32 0, i32 21, !dbg !5335
  %539 = getelementptr inbounds nuw %struct.physics_info, ptr %538, i32 0, i32 6, !dbg !5336
  %540 = getelementptr inbounds nuw %struct.vms_vector, ptr %539, i32 0, i32 2, !dbg !5337
  store i32 %536, ptr %540, align 4, !dbg !5338
  %541 = load ptr, ptr %4, align 8, !dbg !5339
  %542 = getelementptr inbounds nuw %struct.object, ptr %541, i32 0, i32 21, !dbg !5340
  %543 = getelementptr inbounds nuw %struct.physics_info, ptr %542, i32 0, i32 8, !dbg !5341
  %544 = load i16, ptr %543, align 2, !dbg !5342
  %545 = zext i16 %544 to i32, !dbg !5342
  %546 = or i32 %545, 64, !dbg !5342
  %547 = trunc i32 %546 to i16, !dbg !5342
  store i16 %547, ptr %543, align 2, !dbg !5342
  br label %548, !dbg !5343

548:                                              ; preds = %493, %482
  br label %549, !dbg !5344

549:                                              ; preds = %548, %476, %467, %458, %455
  br label %550, !dbg !5345

550:                                              ; preds = %549, %257, %254
  %551 = load ptr, ptr %5, align 8, !dbg !5346
  %552 = load ptr, ptr %4, align 8, !dbg !5347
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %551, ptr noundef %552), !dbg !5348
  br label %553, !dbg !5349

553:                                              ; preds = %550, %122, %102, %75, %24
  ret void, !dbg !5350
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !5351 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5358, !DIExpression(), !5359)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5360, !DIExpression(), !5361)
  %6 = load ptr, ptr %3, align 8, !dbg !5362
  %7 = load ptr, ptr %4, align 8, !dbg !5363
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !5364
  ret ptr %8, !dbg !5365
}

declare void @_Z21create_smart_childrenP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z10obj_attachP6objectS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26collide_hostage_and_playerP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !5366 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5367, !DIExpression(), !5368)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5369, !DIExpression(), !5370)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !5371, !DIExpression(), !5372)
  %7 = load ptr, ptr %5, align 8, !dbg !5373
  %8 = load ptr, ptr @ConsoleObject, align 8, !dbg !5375
  %9 = icmp eq ptr %7, %8, !dbg !5376
  br i1 %9, label %10, label %26, !dbg !5376

10:                                               ; preds = %3
  %11 = load ptr, ptr %4, align 8, !dbg !5377
  %12 = ptrtoint ptr %11 to i64, !dbg !5379
  %13 = sub i64 %12, ptrtoint (ptr @Objects to i64), !dbg !5379
  %14 = sdiv exact i64 %13, 268, !dbg !5379
  %15 = trunc i64 %14 to i32, !dbg !5377
  call void @_Z31detect_escort_goal_accomplishedi(i32 noundef %15), !dbg !5380
  call void @_Z19add_points_to_scorei(i32 noundef 1000), !dbg !5381
  %16 = load ptr, ptr %4, align 8, !dbg !5382
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 2, !dbg !5383
  %18 = load i8, ptr %17, align 1, !dbg !5383
  %19 = zext i8 %18 to i32, !dbg !5382
  call void @_Z14hostage_rescuei(i32 noundef %19), !dbg !5384
  %20 = load ptr, ptr %4, align 8, !dbg !5385
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 8, !dbg !5386
  %22 = load i8, ptr %21, align 1, !dbg !5387
  %23 = zext i8 %22 to i32, !dbg !5387
  %24 = or i32 %23, 2, !dbg !5387
  %25 = trunc i32 %24 to i8, !dbg !5387
  store i8 %25, ptr %21, align 1, !dbg !5387
  br label %26, !dbg !5388

26:                                               ; preds = %10, %3
  ret void, !dbg !5389
}

declare void @_Z14hostage_rescuei(i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25collide_player_and_playerP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !5390 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5391, !DIExpression(), !5392)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5393, !DIExpression(), !5394)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !5395, !DIExpression(), !5396)
  %7 = load ptr, ptr %4, align 8, !dbg !5397
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 9, !dbg !5398
  %9 = load i16, ptr %8, align 2, !dbg !5398
  %10 = load ptr, ptr %6, align 8, !dbg !5399
  %11 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 17, i16 noundef signext %9, i16 noundef signext 0, ptr noundef %10, i32 noundef 0, i32 noundef 65536), !dbg !5400
  %12 = load ptr, ptr %4, align 8, !dbg !5401
  %13 = load ptr, ptr %5, align 8, !dbg !5402
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %12, ptr noundef %13, i32 noundef 1), !dbg !5403
  ret void, !dbg !5404
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !5405 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5408, !DIExpression(), !5409)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5410, !DIExpression(), !5411)
    #dbg_declare(ptr %6, !5412, !DIExpression(), !5413)
  %8 = load i32, ptr %5, align 4, !dbg !5414
  %9 = shl i32 1, %8, !dbg !5414
  store i32 %9, ptr %6, align 4, !dbg !5413
    #dbg_declare(ptr %7, !5415, !DIExpression(), !5416)
  %10 = load i32, ptr %5, align 4, !dbg !5417
  %11 = sext i32 %10 to i64, !dbg !5418
  %12 = getelementptr inbounds [10 x i8], ptr @Primary_weapon_to_powerup, i64 0, i64 %11, !dbg !5418
  %13 = load i8, ptr %12, align 1, !dbg !5418
  %14 = zext i8 %13 to i32, !dbg !5418
  store i32 %14, ptr %7, align 4, !dbg !5419
  %15 = load ptr, ptr %4, align 8, !dbg !5420
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 2, !dbg !5422
  %17 = load i8, ptr %16, align 1, !dbg !5422
  %18 = zext i8 %17 to i64, !dbg !5423
  %19 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !5423
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 15, !dbg !5424
  %21 = load i16, ptr %20, align 2, !dbg !5424
  %22 = zext i16 %21 to i32, !dbg !5423
  %23 = load i32, ptr %6, align 4, !dbg !5425
  %24 = and i32 %22, %23, !dbg !5426
  %25 = icmp ne i32 %24, 0, !dbg !5423
  br i1 %25, label %26, label %30, !dbg !5423

26:                                               ; preds = %2
  %27 = load ptr, ptr %4, align 8, !dbg !5427
  %28 = load i32, ptr %7, align 4, !dbg !5428
  %29 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %27, i32 noundef 1, i32 noundef 7, i32 noundef %28), !dbg !5429
  store i32 %29, ptr %3, align 4, !dbg !5430
  br label %31, !dbg !5430

30:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !5431
  br label %31, !dbg !5431

31:                                               ; preds = %30, %26
  %32 = load i32, ptr %3, align 4, !dbg !5432
  ret i32 %32, !dbg !5432
}

declare noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z31maybe_drop_secondary_weapon_eggP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !5433 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5436, !DIExpression(), !5437)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5438, !DIExpression(), !5439)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !5440, !DIExpression(), !5441)
    #dbg_declare(ptr %7, !5442, !DIExpression(), !5443)
  %12 = load i32, ptr %5, align 4, !dbg !5444
  %13 = shl i32 1, %12, !dbg !5444
  store i32 %13, ptr %7, align 4, !dbg !5443
    #dbg_declare(ptr %8, !5445, !DIExpression(), !5446)
  %14 = load i32, ptr %5, align 4, !dbg !5447
  %15 = sext i32 %14 to i64, !dbg !5448
  %16 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %15, !dbg !5448
  %17 = load i8, ptr %16, align 1, !dbg !5448
  %18 = zext i8 %17 to i32, !dbg !5448
  store i32 %18, ptr %8, align 4, !dbg !5449
  %19 = load ptr, ptr %4, align 8, !dbg !5450
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 2, !dbg !5452
  %21 = load i8, ptr %20, align 1, !dbg !5452
  %22 = zext i8 %21 to i64, !dbg !5453
  %23 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %22, !dbg !5453
  %24 = getelementptr inbounds nuw %struct.player, ptr %23, i32 0, i32 16, !dbg !5454
  %25 = load i16, ptr %24, align 4, !dbg !5454
  %26 = zext i16 %25 to i32, !dbg !5453
  %27 = load i32, ptr %7, align 4, !dbg !5455
  %28 = and i32 %26, %27, !dbg !5456
  %29 = icmp ne i32 %28, 0, !dbg !5453
  br i1 %29, label %30, label %45, !dbg !5453

30:                                               ; preds = %3
    #dbg_declare(ptr %9, !5457, !DIExpression(), !5459)
    #dbg_declare(ptr %10, !5460, !DIExpression(), !5461)
  store i32 3, ptr %11, align 4, !dbg !5462
  %31 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %11), !dbg !5463
  %32 = load i32, ptr %31, align 4, !dbg !5463
  store i32 %32, ptr %10, align 4, !dbg !5464
  store i32 0, ptr %9, align 4, !dbg !5465
  br label %33, !dbg !5467

33:                                               ; preds = %41, %30
  %34 = load i32, ptr %9, align 4, !dbg !5468
  %35 = load i32, ptr %10, align 4, !dbg !5470
  %36 = icmp slt i32 %34, %35, !dbg !5471
  br i1 %36, label %37, label %44, !dbg !5472

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8, !dbg !5473
  %39 = load i32, ptr %8, align 4, !dbg !5474
  %40 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %38, i32 noundef 1, i32 noundef 7, i32 noundef %39), !dbg !5475
  br label %41, !dbg !5475

41:                                               ; preds = %37
  %42 = load i32, ptr %9, align 4, !dbg !5476
  %43 = add nsw i32 %42, 1, !dbg !5476
  store i32 %43, ptr %9, align 4, !dbg !5476
  br label %33, !dbg !5477, !llvm.loop !5478

44:                                               ; preds = %33
  br label %45, !dbg !5480

45:                                               ; preds = %44, %3
  ret void, !dbg !5481
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19drop_missile_1_or_4P6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !5482 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5485, !DIExpression(), !5486)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !5487, !DIExpression(), !5488)
    #dbg_declare(ptr %5, !5489, !DIExpression(), !5490)
    #dbg_declare(ptr %6, !5491, !DIExpression(), !5492)
  %7 = load ptr, ptr %3, align 8, !dbg !5493
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 2, !dbg !5494
  %9 = load i8, ptr %8, align 1, !dbg !5494
  %10 = zext i8 %9 to i64, !dbg !5495
  %11 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %10, !dbg !5495
  %12 = getelementptr inbounds nuw %struct.player, ptr %11, i32 0, i32 18, !dbg !5496
  %13 = load i32, ptr %4, align 4, !dbg !5497
  %14 = sext i32 %13 to i64, !dbg !5495
  %15 = getelementptr inbounds [10 x i16], ptr %12, i64 0, i64 %14, !dbg !5495
  %16 = load i16, ptr %15, align 2, !dbg !5495
  %17 = zext i16 %16 to i32, !dbg !5495
  store i32 %17, ptr %5, align 4, !dbg !5498
  %18 = load i32, ptr %4, align 4, !dbg !5499
  %19 = sext i32 %18 to i64, !dbg !5500
  %20 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %19, !dbg !5500
  %21 = load i8, ptr %20, align 1, !dbg !5500
  %22 = zext i8 %21 to i32, !dbg !5500
  store i32 %22, ptr %6, align 4, !dbg !5501
  %23 = load i32, ptr %5, align 4, !dbg !5502
  %24 = icmp sgt i32 %23, 10, !dbg !5504
  br i1 %24, label %25, label %26, !dbg !5504

25:                                               ; preds = %2
  store i32 10, ptr %5, align 4, !dbg !5505
  br label %26, !dbg !5506

26:                                               ; preds = %25, %2
  %27 = load ptr, ptr %3, align 8, !dbg !5507
  %28 = load i32, ptr %5, align 4, !dbg !5508
  %29 = sdiv i32 %28, 4, !dbg !5509
  %30 = load i32, ptr %6, align 4, !dbg !5510
  %31 = add nsw i32 %30, 1, !dbg !5511
  %32 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %27, i32 noundef %29, i32 noundef 7, i32 noundef %31), !dbg !5512
  %33 = load ptr, ptr %3, align 8, !dbg !5513
  %34 = load i32, ptr %5, align 4, !dbg !5514
  %35 = srem i32 %34, 4, !dbg !5515
  %36 = load i32, ptr %6, align 4, !dbg !5516
  %37 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %33, i32 noundef %35, i32 noundef 7, i32 noundef %36), !dbg !5517
  ret void, !dbg !5518
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16drop_player_eggsP6object(ptr noundef %0) #0 !dbg !5519 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.vms_vector, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i16, align 2
  %16 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !5520, !DIExpression(), !5521)
  %17 = load ptr, ptr %2, align 8, !dbg !5522
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 1, !dbg !5524
  %19 = load i8, ptr %18, align 4, !dbg !5524
  %20 = zext i8 %19 to i32, !dbg !5522
  %21 = icmp eq i32 %20, 4, !dbg !5525
  br i1 %21, label %28, label %22, !dbg !5526

22:                                               ; preds = %1
  %23 = load ptr, ptr %2, align 8, !dbg !5527
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 1, !dbg !5528
  %25 = load i8, ptr %24, align 4, !dbg !5528
  %26 = zext i8 %25 to i32, !dbg !5527
  %27 = icmp eq i32 %26, 12, !dbg !5529
  br i1 %27, label %28, label %475, !dbg !5526

28:                                               ; preds = %22, %1
    #dbg_declare(ptr %3, !5530, !DIExpression(), !5532)
    #dbg_declare(ptr %4, !5533, !DIExpression(), !5534)
  store i32 1, ptr %4, align 4, !dbg !5534
    #dbg_declare(ptr %5, !5535, !DIExpression(), !5536)
  %29 = load ptr, ptr %2, align 8, !dbg !5537
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 2, !dbg !5538
  %31 = load i8, ptr %30, align 1, !dbg !5538
  %32 = zext i8 %31 to i32, !dbg !5537
  store i32 %32, ptr %5, align 4, !dbg !5536
    #dbg_declare(ptr %6, !5539, !DIExpression(), !5540)
    #dbg_declare(ptr %7, !5541, !DIExpression(), !5542)
  store i32 0, ptr %7, align 4, !dbg !5542
    #dbg_declare(ptr %8, !5543, !DIExpression(), !5544)
  store i32 30000, ptr %3, align 4, !dbg !5545
  br label %33, !dbg !5546

33:                                               ; preds = %72, %28
  %34 = load ptr, ptr %2, align 8, !dbg !5547
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 2, !dbg !5548
  %36 = load i8, ptr %35, align 1, !dbg !5548
  %37 = zext i8 %36 to i64, !dbg !5549
  %38 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %37, !dbg !5549
  %39 = getelementptr inbounds nuw %struct.player, ptr %38, i32 0, i32 18, !dbg !5550
  %40 = getelementptr inbounds [10 x i16], ptr %39, i64 0, i64 7, !dbg !5549
  %41 = load i16, ptr %40, align 2, !dbg !5549
  %42 = zext i16 %41 to i32, !dbg !5549
  %43 = srem i32 %42, 4, !dbg !5551
  %44 = icmp eq i32 %43, 1, !dbg !5552
  br i1 %44, label %45, label %49, !dbg !5553

45:                                               ; preds = %33
  %46 = call noundef i32 @_Z6P_Randv(), !dbg !5554
  %47 = load i32, ptr %3, align 4, !dbg !5555
  %48 = icmp slt i32 %46, %47, !dbg !5556
  br label %49

49:                                               ; preds = %45, %33
  %50 = phi i1 [ false, %33 ], [ %48, %45 ], !dbg !5557
  br i1 %50, label %51, label %73, !dbg !5546

51:                                               ; preds = %49
    #dbg_declare(ptr %9, !5558, !DIExpression(), !5560)
    #dbg_declare(ptr %10, !5561, !DIExpression(), !5562)
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %8), !dbg !5563
  %52 = load i32, ptr %3, align 4, !dbg !5564
  %53 = sdiv i32 %52, 2, !dbg !5564
  store i32 %53, ptr %3, align 4, !dbg !5564
  %54 = load ptr, ptr %2, align 8, !dbg !5565
  %55 = getelementptr inbounds nuw %struct.object, ptr %54, i32 0, i32 11, !dbg !5566
  %56 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %10, ptr noundef %55, ptr noundef %8), !dbg !5567
  %57 = load ptr, ptr %2, align 8, !dbg !5568
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 9, !dbg !5569
  %59 = load i16, ptr %58, align 2, !dbg !5569
  %60 = sext i16 %59 to i32, !dbg !5568
  %61 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %10, i32 noundef %60), !dbg !5570
  store i32 %61, ptr %9, align 4, !dbg !5571
  %62 = load i32, ptr %9, align 4, !dbg !5572
  %63 = icmp ne i32 %62, -1, !dbg !5574
  br i1 %63, label %64, label %72, !dbg !5574

64:                                               ; preds = %51
  %65 = load i32, ptr %9, align 4, !dbg !5575
  %66 = load ptr, ptr %2, align 8, !dbg !5576
  %67 = ptrtoint ptr %66 to i64, !dbg !5577
  %68 = sub i64 %67, ptrtoint (ptr @Objects to i64), !dbg !5577
  %69 = sdiv exact i64 %68, 268, !dbg !5577
  %70 = trunc i64 %69 to i32, !dbg !5576
  %71 = call noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %8, ptr noundef %10, i32 noundef %65, i32 noundef %70, i32 noundef 38, i32 noundef 0), !dbg !5578
  br label %72, !dbg !5578

72:                                               ; preds = %64, %51
  br label %33, !dbg !5546, !llvm.loop !5579

73:                                               ; preds = %49
  %74 = load i32, ptr @Game_mode, align 4, !dbg !5581
  %75 = and i32 %74, 38, !dbg !5583
  %76 = icmp ne i32 %75, 0, !dbg !5584
  br i1 %76, label %77, label %123, !dbg !5585

77:                                               ; preds = %73
  %78 = load i32, ptr @Game_mode, align 4, !dbg !5586
  %79 = and i32 %78, 1024, !dbg !5587
  %80 = icmp ne i32 %79, 0, !dbg !5588
  br i1 %80, label %123, label %81, !dbg !5585

81:                                               ; preds = %77
  store i32 30000, ptr %3, align 4, !dbg !5589
  br label %82, !dbg !5591

82:                                               ; preds = %121, %81
  %83 = load ptr, ptr %2, align 8, !dbg !5592
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 2, !dbg !5593
  %85 = load i8, ptr %84, align 1, !dbg !5593
  %86 = zext i8 %85 to i64, !dbg !5594
  %87 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %86, !dbg !5594
  %88 = getelementptr inbounds nuw %struct.player, ptr %87, i32 0, i32 18, !dbg !5595
  %89 = getelementptr inbounds [10 x i16], ptr %88, i64 0, i64 2, !dbg !5594
  %90 = load i16, ptr %89, align 2, !dbg !5594
  %91 = zext i16 %90 to i32, !dbg !5594
  %92 = srem i32 %91, 4, !dbg !5596
  %93 = icmp eq i32 %92, 1, !dbg !5597
  br i1 %93, label %94, label %98, !dbg !5598

94:                                               ; preds = %82
  %95 = call noundef i32 @_Z6P_Randv(), !dbg !5599
  %96 = load i32, ptr %3, align 4, !dbg !5600
  %97 = icmp slt i32 %95, %96, !dbg !5601
  br label %98

98:                                               ; preds = %94, %82
  %99 = phi i1 [ false, %82 ], [ %97, %94 ], !dbg !5602
  br i1 %99, label %100, label %122, !dbg !5591

100:                                              ; preds = %98
    #dbg_declare(ptr %11, !5603, !DIExpression(), !5605)
    #dbg_declare(ptr %12, !5606, !DIExpression(), !5607)
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %8), !dbg !5608
  %101 = load i32, ptr %3, align 4, !dbg !5609
  %102 = sdiv i32 %101, 2, !dbg !5609
  store i32 %102, ptr %3, align 4, !dbg !5609
  %103 = load ptr, ptr %2, align 8, !dbg !5610
  %104 = getelementptr inbounds nuw %struct.object, ptr %103, i32 0, i32 11, !dbg !5611
  %105 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %12, ptr noundef %104, ptr noundef %8), !dbg !5612
  %106 = load ptr, ptr %2, align 8, !dbg !5613
  %107 = getelementptr inbounds nuw %struct.object, ptr %106, i32 0, i32 9, !dbg !5614
  %108 = load i16, ptr %107, align 2, !dbg !5614
  %109 = sext i16 %108 to i32, !dbg !5613
  %110 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %12, i32 noundef %109), !dbg !5615
  store i32 %110, ptr %11, align 4, !dbg !5616
  %111 = load i32, ptr %11, align 4, !dbg !5617
  %112 = icmp ne i32 %111, -1, !dbg !5619
  br i1 %112, label %113, label %121, !dbg !5619

113:                                              ; preds = %100
  %114 = load i32, ptr %11, align 4, !dbg !5620
  %115 = load ptr, ptr %2, align 8, !dbg !5621
  %116 = ptrtoint ptr %115 to i64, !dbg !5622
  %117 = sub i64 %116, ptrtoint (ptr @Objects to i64), !dbg !5622
  %118 = sdiv exact i64 %117, 268, !dbg !5622
  %119 = trunc i64 %118 to i32, !dbg !5621
  %120 = call noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef %8, ptr noundef %12, i32 noundef %114, i32 noundef %119, i32 noundef 16, i32 noundef 0), !dbg !5623
  br label %121, !dbg !5623

121:                                              ; preds = %113, %100
  br label %82, !dbg !5591, !llvm.loop !5624

122:                                              ; preds = %98
  br label %123, !dbg !5626

123:                                              ; preds = %122, %77, %73
  %124 = load i32, ptr %5, align 4, !dbg !5627
  %125 = sext i32 %124 to i64, !dbg !5629
  %126 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %125, !dbg !5629
  %127 = getelementptr inbounds nuw %struct.player, ptr %126, i32 0, i32 12, !dbg !5630
  %128 = load i8, ptr %127, align 2, !dbg !5630
  %129 = zext i8 %128 to i32, !dbg !5629
  %130 = icmp sgt i32 %129, 3, !dbg !5631
  br i1 %130, label %131, label %141, !dbg !5631

131:                                              ; preds = %123
  %132 = load ptr, ptr %2, align 8, !dbg !5632
  %133 = load i32, ptr %5, align 4, !dbg !5633
  %134 = sext i32 %133 to i64, !dbg !5634
  %135 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %134, !dbg !5634
  %136 = getelementptr inbounds nuw %struct.player, ptr %135, i32 0, i32 12, !dbg !5635
  %137 = load i8, ptr %136, align 2, !dbg !5635
  %138 = zext i8 %137 to i32, !dbg !5634
  %139 = sub nsw i32 %138, 3, !dbg !5636
  %140 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %132, i32 noundef %139, i32 noundef 7, i32 noundef 32), !dbg !5637
  br label %159, !dbg !5637

141:                                              ; preds = %123
  %142 = load i32, ptr %5, align 4, !dbg !5638
  %143 = sext i32 %142 to i64, !dbg !5640
  %144 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %143, !dbg !5640
  %145 = getelementptr inbounds nuw %struct.player, ptr %144, i32 0, i32 12, !dbg !5641
  %146 = load i8, ptr %145, align 2, !dbg !5641
  %147 = zext i8 %146 to i32, !dbg !5640
  %148 = icmp sge i32 %147, 1, !dbg !5642
  br i1 %148, label %149, label %158, !dbg !5642

149:                                              ; preds = %141
  %150 = load ptr, ptr %2, align 8, !dbg !5643
  %151 = load i32, ptr %5, align 4, !dbg !5644
  %152 = sext i32 %151 to i64, !dbg !5645
  %153 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %152, !dbg !5645
  %154 = getelementptr inbounds nuw %struct.player, ptr %153, i32 0, i32 12, !dbg !5646
  %155 = load i8, ptr %154, align 2, !dbg !5646
  %156 = zext i8 %155 to i32, !dbg !5645
  %157 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %150, i32 noundef %156, i32 noundef 7, i32 noundef 3), !dbg !5647
  br label %158, !dbg !5647

158:                                              ; preds = %149, %141
  br label %159

159:                                              ; preds = %158, %131
  %160 = load i32, ptr %5, align 4, !dbg !5648
  %161 = sext i32 %160 to i64, !dbg !5650
  %162 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %161, !dbg !5650
  %163 = getelementptr inbounds nuw %struct.player, ptr %162, i32 0, i32 7, !dbg !5651
  %164 = load i32, ptr %163, align 4, !dbg !5651
  %165 = and i32 %164, 1024, !dbg !5652
  %166 = icmp ne i32 %165, 0, !dbg !5650
  br i1 %166, label %167, label %170, !dbg !5650

167:                                              ; preds = %159
  %168 = load ptr, ptr %2, align 8, !dbg !5653
  %169 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %168, i32 noundef 1, i32 noundef 7, i32 noundef 12), !dbg !5654
  br label %170, !dbg !5654

170:                                              ; preds = %167, %159
  %171 = load i32, ptr %5, align 4, !dbg !5655
  %172 = sext i32 %171 to i64, !dbg !5657
  %173 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %172, !dbg !5657
  %174 = getelementptr inbounds nuw %struct.player, ptr %173, i32 0, i32 7, !dbg !5658
  %175 = load i32, ptr %174, align 4, !dbg !5658
  %176 = and i32 %175, 2048, !dbg !5659
  %177 = icmp ne i32 %176, 0, !dbg !5657
  br i1 %177, label %178, label %181, !dbg !5657

178:                                              ; preds = %170
  %179 = load ptr, ptr %2, align 8, !dbg !5660
  %180 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %179, i32 noundef 1, i32 noundef 7, i32 noundef 23), !dbg !5661
  br label %181, !dbg !5661

181:                                              ; preds = %178, %170
  %182 = load i32, ptr %5, align 4, !dbg !5662
  %183 = sext i32 %182 to i64, !dbg !5664
  %184 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %183, !dbg !5664
  %185 = getelementptr inbounds nuw %struct.player, ptr %184, i32 0, i32 7, !dbg !5665
  %186 = load i32, ptr %185, align 4, !dbg !5665
  %187 = and i32 %186, 64, !dbg !5666
  %188 = icmp ne i32 %187, 0, !dbg !5664
  br i1 %188, label %189, label %192, !dbg !5664

189:                                              ; preds = %181
  %190 = load ptr, ptr %2, align 8, !dbg !5667
  %191 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %190, i32 noundef 1, i32 noundef 7, i32 noundef 33), !dbg !5668
  br label %192, !dbg !5668

192:                                              ; preds = %189, %181
  %193 = load i32, ptr %5, align 4, !dbg !5669
  %194 = sext i32 %193 to i64, !dbg !5671
  %195 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %194, !dbg !5671
  %196 = getelementptr inbounds nuw %struct.player, ptr %195, i32 0, i32 7, !dbg !5672
  %197 = load i32, ptr %196, align 4, !dbg !5672
  %198 = and i32 %197, 4096, !dbg !5673
  %199 = icmp ne i32 %198, 0, !dbg !5671
  br i1 %199, label %200, label %203, !dbg !5671

200:                                              ; preds = %192
  %201 = load ptr, ptr %2, align 8, !dbg !5674
  %202 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %201, i32 noundef 1, i32 noundef 7, i32 noundef 36), !dbg !5675
  br label %203, !dbg !5675

203:                                              ; preds = %200, %192
  %204 = load i32, ptr %5, align 4, !dbg !5676
  %205 = sext i32 %204 to i64, !dbg !5678
  %206 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %205, !dbg !5678
  %207 = getelementptr inbounds nuw %struct.player, ptr %206, i32 0, i32 7, !dbg !5679
  %208 = load i32, ptr %207, align 4, !dbg !5679
  %209 = and i32 %208, 128, !dbg !5680
  %210 = icmp ne i32 %209, 0, !dbg !5678
  br i1 %210, label %211, label %214, !dbg !5678

211:                                              ; preds = %203
  %212 = load ptr, ptr %2, align 8, !dbg !5681
  %213 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %212, i32 noundef 1, i32 noundef 7, i32 noundef 35), !dbg !5682
  br label %214, !dbg !5682

214:                                              ; preds = %211, %203
  %215 = load i32, ptr %5, align 4, !dbg !5683
  %216 = sext i32 %215 to i64, !dbg !5685
  %217 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %216, !dbg !5685
  %218 = getelementptr inbounds nuw %struct.player, ptr %217, i32 0, i32 7, !dbg !5686
  %219 = load i32, ptr %218, align 4, !dbg !5686
  %220 = and i32 %219, 256, !dbg !5687
  %221 = icmp ne i32 %220, 0, !dbg !5685
  br i1 %221, label %222, label %225, !dbg !5685

222:                                              ; preds = %214
  %223 = load ptr, ptr %2, align 8, !dbg !5688
  %224 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %223, i32 noundef 1, i32 noundef 7, i32 noundef 34), !dbg !5689
  br label %225, !dbg !5689

225:                                              ; preds = %222, %214
  %226 = load i32, ptr %5, align 4, !dbg !5690
  %227 = sext i32 %226 to i64, !dbg !5692
  %228 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %227, !dbg !5692
  %229 = getelementptr inbounds nuw %struct.player, ptr %228, i32 0, i32 7, !dbg !5693
  %230 = load i32, ptr %229, align 4, !dbg !5693
  %231 = and i32 %230, 8192, !dbg !5694
  %232 = icmp ne i32 %231, 0, !dbg !5692
  br i1 %232, label %233, label %236, !dbg !5692

233:                                              ; preds = %225
  %234 = load ptr, ptr %2, align 8, !dbg !5695
  %235 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %234, i32 noundef 1, i32 noundef 7, i32 noundef 37), !dbg !5696
  br label %236, !dbg !5696

236:                                              ; preds = %233, %225
  %237 = load i32, ptr @Game_mode, align 4, !dbg !5697
  %238 = and i32 %237, 512, !dbg !5699
  %239 = icmp ne i32 %238, 0, !dbg !5700
  br i1 %239, label %240, label %280, !dbg !5701

240:                                              ; preds = %236
  %241 = load i32, ptr %5, align 4, !dbg !5702
  %242 = sext i32 %241 to i64, !dbg !5703
  %243 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %242, !dbg !5703
  %244 = getelementptr inbounds nuw %struct.player, ptr %243, i32 0, i32 7, !dbg !5704
  %245 = load i32, ptr %244, align 4, !dbg !5704
  %246 = and i32 %245, 16, !dbg !5705
  %247 = icmp ne i32 %246, 0, !dbg !5706
  br i1 %247, label %248, label %280, !dbg !5701

248:                                              ; preds = %240
  %249 = load i32, ptr @Game_mode, align 4, !dbg !5707
  %250 = and i32 %249, 1024, !dbg !5709
  %251 = icmp ne i32 %250, 0, !dbg !5707
  br i1 %251, label %252, label %279, !dbg !5707

252:                                              ; preds = %248
    #dbg_declare(ptr %13, !5710, !DIExpression(), !5712)
    #dbg_declare(ptr %14, !5713, !DIExpression(), !5714)
  %253 = load i32, ptr %5, align 4, !dbg !5715
  %254 = sext i32 %253 to i64, !dbg !5715
  %255 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %254, !dbg !5715
  %256 = getelementptr inbounds nuw %struct.player, ptr %255, i32 0, i32 18, !dbg !5715
  %257 = getelementptr inbounds [10 x i16], ptr %256, i64 0, i64 2, !dbg !5715
  %258 = load i16, ptr %257, align 2, !dbg !5715
  %259 = zext i16 %258 to i32, !dbg !5715
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.23, i32 noundef %259), !dbg !5715
  %260 = load i32, ptr %5, align 4, !dbg !5716
  %261 = sext i32 %260 to i64, !dbg !5717
  %262 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %261, !dbg !5717
  %263 = getelementptr inbounds nuw %struct.player, ptr %262, i32 0, i32 18, !dbg !5718
  %264 = getelementptr inbounds [10 x i16], ptr %263, i64 0, i64 2, !dbg !5717
  store i16 12, ptr %15, align 2, !dbg !5719
  %265 = call noundef nonnull align 2 dereferenceable(2) ptr @_ZNSt3__13minB8ne200100ItEERKT_S3_S3_(ptr noundef nonnull align 2 dereferenceable(2) %264, ptr noundef nonnull align 2 dereferenceable(2) %15), !dbg !5720
  %266 = load i16, ptr %265, align 2, !dbg !5720
  %267 = zext i16 %266 to i32, !dbg !5720
  store i32 %267, ptr %13, align 4, !dbg !5721
  store i32 0, ptr %14, align 4, !dbg !5722
  br label %268, !dbg !5724

268:                                              ; preds = %275, %252
  %269 = load i32, ptr %14, align 4, !dbg !5725
  %270 = load i32, ptr %13, align 4, !dbg !5727
  %271 = icmp slt i32 %269, %270, !dbg !5728
  br i1 %271, label %272, label %278, !dbg !5729

272:                                              ; preds = %268
  %273 = load ptr, ptr %2, align 8, !dbg !5730
  %274 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %273, i32 noundef 1, i32 noundef 7, i32 noundef 7), !dbg !5731
  br label %275, !dbg !5731

275:                                              ; preds = %272
  %276 = load i32, ptr %14, align 4, !dbg !5732
  %277 = add nsw i32 %276, 1, !dbg !5732
  store i32 %277, ptr %14, align 4, !dbg !5732
  br label %268, !dbg !5733, !llvm.loop !5734

278:                                              ; preds = %268
  br label %279, !dbg !5736

279:                                              ; preds = %278, %248
  br label %280, !dbg !5737

280:                                              ; preds = %279, %240, %236
  %281 = load i32, ptr %5, align 4, !dbg !5738
  %282 = sext i32 %281 to i64, !dbg !5739
  %283 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %282, !dbg !5739
  %284 = getelementptr inbounds nuw %struct.player, ptr %283, i32 0, i32 17, !dbg !5740
  %285 = getelementptr inbounds [10 x i16], ptr %284, i64 0, i64 1, !dbg !5739
  %286 = load i16, ptr %285, align 2, !dbg !5739
  %287 = zext i16 %286 to i32, !dbg !5739
  store i32 %287, ptr %7, align 4, !dbg !5741
  %288 = load i32, ptr %5, align 4, !dbg !5742
  %289 = sext i32 %288 to i64, !dbg !5744
  %290 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %289, !dbg !5744
  %291 = getelementptr inbounds nuw %struct.player, ptr %290, i32 0, i32 15, !dbg !5745
  %292 = load i16, ptr %291, align 2, !dbg !5745
  %293 = zext i16 %292 to i32, !dbg !5744
  %294 = and i32 %293, 2, !dbg !5746
  %295 = icmp ne i32 %294, 0, !dbg !5747
  br i1 %295, label %296, label %308, !dbg !5748

296:                                              ; preds = %280
  %297 = load i32, ptr %5, align 4, !dbg !5749
  %298 = sext i32 %297 to i64, !dbg !5750
  %299 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %298, !dbg !5750
  %300 = getelementptr inbounds nuw %struct.player, ptr %299, i32 0, i32 15, !dbg !5751
  %301 = load i16, ptr %300, align 2, !dbg !5751
  %302 = zext i16 %301 to i32, !dbg !5750
  %303 = and i32 %302, 64, !dbg !5752
  %304 = icmp ne i32 %303, 0, !dbg !5753
  br i1 %304, label %305, label %308, !dbg !5748

305:                                              ; preds = %296
  %306 = load i32, ptr %7, align 4, !dbg !5754
  %307 = sdiv i32 %306, 2, !dbg !5754
  store i32 %307, ptr %7, align 4, !dbg !5754
  br label %308, !dbg !5755

308:                                              ; preds = %305, %296, %280
  %309 = load i32, ptr %7, align 4, !dbg !5756
  %310 = icmp slt i32 %309, 98, !dbg !5758
  br i1 %310, label %311, label %312, !dbg !5758

311:                                              ; preds = %308
  store i32 98, ptr %7, align 4, !dbg !5759
  br label %312, !dbg !5760

312:                                              ; preds = %311, %308
  %313 = load ptr, ptr %2, align 8, !dbg !5761
  %314 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %313, i32 noundef 1), !dbg !5762
  store i32 %314, ptr %6, align 4, !dbg !5763
  %315 = load i32, ptr %6, align 4, !dbg !5764
  %316 = icmp ne i32 %315, -1, !dbg !5766
  br i1 %316, label %317, label %324, !dbg !5766

317:                                              ; preds = %312
  %318 = load i32, ptr %7, align 4, !dbg !5767
  %319 = load i32, ptr %6, align 4, !dbg !5768
  %320 = sext i32 %319 to i64, !dbg !5769
  %321 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %320, !dbg !5769
  %322 = getelementptr inbounds nuw %struct.object, ptr %321, i32 0, i32 22, !dbg !5770
  %323 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %322, i32 0, i32 0, !dbg !5771
  store i32 %318, ptr %323, align 4, !dbg !5772
  br label %324, !dbg !5769

324:                                              ; preds = %317, %312
  %325 = load ptr, ptr %2, align 8, !dbg !5773
  %326 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %325, i32 noundef 6), !dbg !5774
  store i32 %326, ptr %6, align 4, !dbg !5775
  %327 = load i32, ptr %6, align 4, !dbg !5776
  %328 = icmp ne i32 %327, -1, !dbg !5778
  br i1 %328, label %329, label %336, !dbg !5778

329:                                              ; preds = %324
  %330 = load i32, ptr %7, align 4, !dbg !5779
  %331 = load i32, ptr %6, align 4, !dbg !5780
  %332 = sext i32 %331 to i64, !dbg !5781
  %333 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %332, !dbg !5781
  %334 = getelementptr inbounds nuw %struct.object, ptr %333, i32 0, i32 22, !dbg !5782
  %335 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %334, i32 0, i32 0, !dbg !5783
  store i32 %330, ptr %335, align 4, !dbg !5784
  br label %336, !dbg !5781

336:                                              ; preds = %329, %324
  %337 = load ptr, ptr %2, align 8, !dbg !5785
  %338 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %337, i32 noundef 2), !dbg !5786
  %339 = load ptr, ptr %2, align 8, !dbg !5787
  %340 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %339, i32 noundef 3), !dbg !5788
  %341 = load ptr, ptr %2, align 8, !dbg !5789
  %342 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %341, i32 noundef 4), !dbg !5790
  %343 = load ptr, ptr %2, align 8, !dbg !5791
  %344 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %343, i32 noundef 7), !dbg !5792
  %345 = load ptr, ptr %2, align 8, !dbg !5793
  %346 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %345, i32 noundef 8), !dbg !5794
  %347 = load ptr, ptr %2, align 8, !dbg !5795
  %348 = call noundef i32 @_Z29maybe_drop_primary_weapon_eggP6objecti(ptr noundef %347, i32 noundef 9), !dbg !5796
  store i32 %348, ptr %6, align 4, !dbg !5797
  %349 = load i32, ptr %6, align 4, !dbg !5798
  %350 = icmp ne i32 %349, -1, !dbg !5800
  br i1 %350, label %351, label %368, !dbg !5800

351:                                              ; preds = %336
  %352 = load ptr, ptr %2, align 8, !dbg !5801
  %353 = getelementptr inbounds nuw %struct.object, ptr %352, i32 0, i32 2, !dbg !5802
  %354 = load i8, ptr %353, align 1, !dbg !5802
  %355 = zext i8 %354 to i32, !dbg !5801
  %356 = load i32, ptr @Player_num, align 4, !dbg !5803
  %357 = icmp eq i32 %355, %356, !dbg !5804
  br i1 %357, label %358, label %360, !dbg !5805

358:                                              ; preds = %351
  %359 = load i32, ptr @Omega_charge, align 4, !dbg !5806
  br label %361, !dbg !5805

360:                                              ; preds = %351
  br label %361, !dbg !5805

361:                                              ; preds = %360, %358
  %362 = phi i32 [ %359, %358 ], [ 65536, %360 ], !dbg !5805
  %363 = load i32, ptr %6, align 4, !dbg !5807
  %364 = sext i32 %363 to i64, !dbg !5808
  %365 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %364, !dbg !5808
  %366 = getelementptr inbounds nuw %struct.object, ptr %365, i32 0, i32 22, !dbg !5809
  %367 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %366, i32 0, i32 0, !dbg !5810
  store i32 %362, ptr %367, align 4, !dbg !5811
  br label %368, !dbg !5808

368:                                              ; preds = %361, %336
  %369 = load i32, ptr @Game_mode, align 4, !dbg !5812
  %370 = and i32 %369, 1024, !dbg !5814
  %371 = icmp ne i32 %370, 0, !dbg !5815
  br i1 %371, label %384, label %372, !dbg !5816

372:                                              ; preds = %368
  %373 = load ptr, ptr %2, align 8, !dbg !5817
  %374 = load ptr, ptr %2, align 8, !dbg !5818
  %375 = getelementptr inbounds nuw %struct.object, ptr %374, i32 0, i32 2, !dbg !5819
  %376 = load i8, ptr %375, align 1, !dbg !5819
  %377 = zext i8 %376 to i64, !dbg !5820
  %378 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %377, !dbg !5820
  %379 = getelementptr inbounds nuw %struct.player, ptr %378, i32 0, i32 18, !dbg !5821
  %380 = getelementptr inbounds [10 x i16], ptr %379, i64 0, i64 2, !dbg !5820
  %381 = load i16, ptr %380, align 2, !dbg !5820
  %382 = zext i16 %381 to i32, !dbg !5822
  %383 = sdiv i32 %382, 4, !dbg !5823
  call void @_Z31maybe_drop_secondary_weapon_eggP6objectii(ptr noundef %373, i32 noundef 2, i32 noundef %383), !dbg !5824
  br label %384, !dbg !5824

384:                                              ; preds = %372, %368
  %385 = load ptr, ptr %2, align 8, !dbg !5825
  %386 = load ptr, ptr %2, align 8, !dbg !5826
  %387 = getelementptr inbounds nuw %struct.object, ptr %386, i32 0, i32 2, !dbg !5827
  %388 = load i8, ptr %387, align 1, !dbg !5827
  %389 = zext i8 %388 to i64, !dbg !5828
  %390 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %389, !dbg !5828
  %391 = getelementptr inbounds nuw %struct.player, ptr %390, i32 0, i32 18, !dbg !5829
  %392 = getelementptr inbounds [10 x i16], ptr %391, i64 0, i64 3, !dbg !5828
  %393 = load i16, ptr %392, align 2, !dbg !5828
  %394 = zext i16 %393 to i32, !dbg !5828
  call void @_Z31maybe_drop_secondary_weapon_eggP6objectii(ptr noundef %385, i32 noundef 3, i32 noundef %394), !dbg !5830
  %395 = load ptr, ptr %2, align 8, !dbg !5831
  %396 = load ptr, ptr %2, align 8, !dbg !5832
  %397 = getelementptr inbounds nuw %struct.object, ptr %396, i32 0, i32 2, !dbg !5833
  %398 = load i8, ptr %397, align 1, !dbg !5833
  %399 = zext i8 %398 to i64, !dbg !5834
  %400 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %399, !dbg !5834
  %401 = getelementptr inbounds nuw %struct.player, ptr %400, i32 0, i32 18, !dbg !5835
  %402 = getelementptr inbounds [10 x i16], ptr %401, i64 0, i64 4, !dbg !5834
  %403 = load i16, ptr %402, align 2, !dbg !5834
  %404 = zext i16 %403 to i32, !dbg !5834
  call void @_Z31maybe_drop_secondary_weapon_eggP6objectii(ptr noundef %395, i32 noundef 4, i32 noundef %404), !dbg !5836
  %405 = load ptr, ptr %2, align 8, !dbg !5837
  %406 = load ptr, ptr %2, align 8, !dbg !5838
  %407 = getelementptr inbounds nuw %struct.object, ptr %406, i32 0, i32 2, !dbg !5839
  %408 = load i8, ptr %407, align 1, !dbg !5839
  %409 = zext i8 %408 to i64, !dbg !5840
  %410 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %409, !dbg !5840
  %411 = getelementptr inbounds nuw %struct.player, ptr %410, i32 0, i32 18, !dbg !5841
  %412 = getelementptr inbounds [10 x i16], ptr %411, i64 0, i64 7, !dbg !5840
  %413 = load i16, ptr %412, align 2, !dbg !5840
  %414 = zext i16 %413 to i32, !dbg !5842
  %415 = sdiv i32 %414, 4, !dbg !5843
  call void @_Z31maybe_drop_secondary_weapon_eggP6objectii(ptr noundef %405, i32 noundef 7, i32 noundef %415), !dbg !5844
  %416 = load ptr, ptr %2, align 8, !dbg !5845
  %417 = load ptr, ptr %2, align 8, !dbg !5846
  %418 = getelementptr inbounds nuw %struct.object, ptr %417, i32 0, i32 2, !dbg !5847
  %419 = load i8, ptr %418, align 1, !dbg !5847
  %420 = zext i8 %419 to i64, !dbg !5848
  %421 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %420, !dbg !5848
  %422 = getelementptr inbounds nuw %struct.player, ptr %421, i32 0, i32 18, !dbg !5849
  %423 = getelementptr inbounds [10 x i16], ptr %422, i64 0, i64 9, !dbg !5848
  %424 = load i16, ptr %423, align 2, !dbg !5848
  %425 = zext i16 %424 to i32, !dbg !5848
  call void @_Z31maybe_drop_secondary_weapon_eggP6objectii(ptr noundef %416, i32 noundef 9, i32 noundef %425), !dbg !5850
  %426 = load ptr, ptr %2, align 8, !dbg !5851
  call void @_Z19drop_missile_1_or_4P6objecti(ptr noundef %426, i32 noundef 1), !dbg !5852
  %427 = load ptr, ptr %2, align 8, !dbg !5853
  call void @_Z19drop_missile_1_or_4P6objecti(ptr noundef %427, i32 noundef 6), !dbg !5854
  %428 = load ptr, ptr %2, align 8, !dbg !5855
  call void @_Z19drop_missile_1_or_4P6objecti(ptr noundef %428, i32 noundef 0), !dbg !5856
  %429 = load ptr, ptr %2, align 8, !dbg !5857
  call void @_Z19drop_missile_1_or_4P6objecti(ptr noundef %429, i32 noundef 5), !dbg !5858
  %430 = load ptr, ptr %2, align 8, !dbg !5859
  call void @_Z19drop_missile_1_or_4P6objecti(ptr noundef %430, i32 noundef 8), !dbg !5860
  %431 = load ptr, ptr %2, align 8, !dbg !5861
  %432 = getelementptr inbounds nuw %struct.object, ptr %431, i32 0, i32 2, !dbg !5863
  %433 = load i8, ptr %432, align 1, !dbg !5863
  %434 = zext i8 %433 to i64, !dbg !5864
  %435 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %434, !dbg !5864
  %436 = getelementptr inbounds nuw %struct.player, ptr %435, i32 0, i32 15, !dbg !5865
  %437 = load i16, ptr %436, align 2, !dbg !5865
  %438 = zext i16 %437 to i32, !dbg !5864
  %439 = and i32 %438, 2, !dbg !5866
  %440 = icmp ne i32 %439, 0, !dbg !5867
  br i1 %440, label %465, label %441, !dbg !5868

441:                                              ; preds = %384
    #dbg_declare(ptr %16, !5869, !DIExpression(), !5871)
  %442 = load ptr, ptr %2, align 8, !dbg !5872
  %443 = getelementptr inbounds nuw %struct.object, ptr %442, i32 0, i32 2, !dbg !5873
  %444 = load i8, ptr %443, align 1, !dbg !5873
  %445 = zext i8 %444 to i64, !dbg !5874
  %446 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %445, !dbg !5874
  %447 = getelementptr inbounds nuw %struct.player, ptr %446, i32 0, i32 17, !dbg !5875
  %448 = getelementptr inbounds [10 x i16], ptr %447, i64 0, i64 1, !dbg !5874
  %449 = load i16, ptr %448, align 2, !dbg !5874
  %450 = zext i16 %449 to i32, !dbg !5874
  store i32 %450, ptr %16, align 4, !dbg !5871
  %451 = load i32, ptr %16, align 4, !dbg !5876
  %452 = icmp sgt i32 %451, 200, !dbg !5878
  br i1 %452, label %453, label %455, !dbg !5878

453:                                              ; preds = %441
  %454 = load i32, ptr %16, align 4, !dbg !5879
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.24, i32 noundef %454), !dbg !5879
  store i32 200, ptr %16, align 4, !dbg !5881
  br label %455, !dbg !5882

455:                                              ; preds = %453, %441
  br label %456, !dbg !5883

456:                                              ; preds = %459, %455
  %457 = load i32, ptr %16, align 4, !dbg !5884
  %458 = icmp sgt i32 %457, 0, !dbg !5885
  br i1 %458, label %459, label %464, !dbg !5883

459:                                              ; preds = %456
  %460 = load ptr, ptr %2, align 8, !dbg !5886
  %461 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %460, i32 noundef 1, i32 noundef 7, i32 noundef 22), !dbg !5888
  %462 = load i32, ptr %16, align 4, !dbg !5889
  %463 = sub nsw i32 %462, 98, !dbg !5889
  store i32 %463, ptr %16, align 4, !dbg !5889
  br label %456, !dbg !5883, !llvm.loop !5890

464:                                              ; preds = %456
  br label %465, !dbg !5892

465:                                              ; preds = %464, %384
  %466 = load i32, ptr @Game_mode, align 4, !dbg !5893
  %467 = and i32 %466, 38, !dbg !5895
  %468 = icmp ne i32 %467, 0, !dbg !5893
  br i1 %468, label %469, label %474, !dbg !5893

469:                                              ; preds = %465
  %470 = load ptr, ptr %2, align 8, !dbg !5896
  %471 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %470, i32 noundef 1, i32 noundef 7, i32 noundef 2), !dbg !5898
  %472 = load ptr, ptr %2, align 8, !dbg !5899
  %473 = call noundef i32 @_Z22call_object_create_eggP6objectiii(ptr noundef %472, i32 noundef 1, i32 noundef 7, i32 noundef 1), !dbg !5900
  br label %474, !dbg !5901

474:                                              ; preds = %469, %465
  br label %475, !dbg !5902

475:                                              ; preds = %474, %22
  ret void, !dbg !5903
}

declare noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z16Laser_create_newP10vms_vectorS0_iiii(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 2 dereferenceable(2) ptr @_ZNSt3__13minB8ne200100ItEERKT_S3_S3_(ptr noundef nonnull align 2 dereferenceable(2) %0, ptr noundef nonnull align 2 dereferenceable(2) %1) #0 !dbg !5904 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5911, !DIExpression(), !5912)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5913, !DIExpression(), !5914)
  %6 = load ptr, ptr %3, align 8, !dbg !5915
  %7 = load ptr, ptr %4, align 8, !dbg !5916
  %8 = call noundef nonnull align 2 dereferenceable(2) ptr @_ZNSt3__13minB8ne200100ItNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 2 dereferenceable(2) %6, ptr noundef nonnull align 2 dereferenceable(2) %7), !dbg !5917
  ret ptr %8, !dbg !5918
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25collide_player_and_weaponP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !5919 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5920, !DIExpression(), !5921)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5922, !DIExpression(), !5923)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !5924, !DIExpression(), !5925)
    #dbg_declare(ptr %7, !5926, !DIExpression(), !5927)
  %9 = load ptr, ptr %5, align 8, !dbg !5928
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 14, !dbg !5929
  %11 = load i32, ptr %10, align 4, !dbg !5929
  store i32 %11, ptr %7, align 4, !dbg !5927
    #dbg_declare(ptr %8, !5930, !DIExpression(), !5931)
  store ptr null, ptr %8, align 8, !dbg !5931
  %12 = load ptr, ptr %5, align 8, !dbg !5932
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 2, !dbg !5934
  %14 = load i8, ptr %13, align 1, !dbg !5934
  %15 = zext i8 %14 to i32, !dbg !5932
  %16 = icmp eq i32 %15, 35, !dbg !5935
  br i1 %16, label %17, label %23, !dbg !5935

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8, !dbg !5936
  %19 = call noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %18), !dbg !5938
  %20 = icmp ne i32 %19, 0, !dbg !5938
  br i1 %20, label %22, label %21, !dbg !5939

21:                                               ; preds = %17
  br label %197, !dbg !5940

22:                                               ; preds = %17
  br label %23, !dbg !5941

23:                                               ; preds = %22, %3
  %24 = load ptr, ptr %5, align 8, !dbg !5942
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 2, !dbg !5944
  %26 = load i8, ptr %25, align 1, !dbg !5944
  %27 = zext i8 %26 to i32, !dbg !5942
  %28 = icmp eq i32 %27, 38, !dbg !5945
  br i1 %28, label %29, label %52, !dbg !5945

29:                                               ; preds = %23
  %30 = load ptr, ptr %4, align 8, !dbg !5946
  %31 = ptrtoint ptr %30 to i64, !dbg !5948
  %32 = sub i64 %31, ptrtoint (ptr @Objects to i64), !dbg !5948
  %33 = sdiv exact i64 %32, 268, !dbg !5948
  %34 = load ptr, ptr %5, align 8, !dbg !5949
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 22, !dbg !5950
  %36 = getelementptr inbounds nuw %struct.laser_info_s, ptr %35, i32 0, i32 1, !dbg !5951
  %37 = load i16, ptr %36, align 2, !dbg !5951
  %38 = sext i16 %37 to i64, !dbg !5949
  %39 = icmp eq i64 %33, %38, !dbg !5952
  br i1 %39, label %40, label %51, !dbg !5952

40:                                               ; preds = %29
  %41 = load ptr, ptr %6, align 8, !dbg !5953
  %42 = load ptr, ptr %4, align 8, !dbg !5955
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 11, !dbg !5956
  %44 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %41, ptr noundef %43), !dbg !5957
  %45 = load ptr, ptr %4, align 8, !dbg !5958
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 13, !dbg !5959
  %47 = load i32, ptr %46, align 4, !dbg !5959
  %48 = icmp sgt i32 %44, %47, !dbg !5960
  br i1 %48, label %49, label %50, !dbg !5960

49:                                               ; preds = %40
  br label %197, !dbg !5961

50:                                               ; preds = %40
  br label %51, !dbg !5959

51:                                               ; preds = %50, %29
  br label %52, !dbg !5951

52:                                               ; preds = %51, %23
  %53 = load ptr, ptr %5, align 8, !dbg !5962
  %54 = getelementptr inbounds nuw %struct.object, ptr %53, i32 0, i32 2, !dbg !5964
  %55 = load i8, ptr %54, align 1, !dbg !5964
  %56 = zext i8 %55 to i32, !dbg !5962
  %57 = icmp eq i32 %56, 40, !dbg !5965
  br i1 %57, label %58, label %59, !dbg !5965

58:                                               ; preds = %52
  call void @_Z16smega_rock_stuffv(), !dbg !5966
  br label %59, !dbg !5966

59:                                               ; preds = %58, %52
  %60 = load i32, ptr %7, align 4, !dbg !5967
  %61 = load ptr, ptr %5, align 8, !dbg !5968
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 22, !dbg !5969
  %63 = getelementptr inbounds nuw %struct.laser_info_s, ptr %62, i32 0, i32 6, !dbg !5970
  %64 = load i32, ptr %63, align 4, !dbg !5970
  %65 = call noundef i32 @_Z6fixmulii(i32 noundef %60, i32 noundef %64), !dbg !5971
  store i32 %65, ptr %7, align 4, !dbg !5972
  %66 = load i32, ptr @Game_mode, align 4, !dbg !5973
  %67 = and i32 %66, 38, !dbg !5975
  %68 = icmp ne i32 %67, 0, !dbg !5973
  br i1 %68, label %69, label %79, !dbg !5973

69:                                               ; preds = %59
  %70 = load i32, ptr %7, align 4, !dbg !5976
  %71 = load ptr, ptr %5, align 8, !dbg !5977
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 2, !dbg !5978
  %73 = load i8, ptr %72, align 1, !dbg !5978
  %74 = zext i8 %73 to i64, !dbg !5979
  %75 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %74, !dbg !5979
  %76 = getelementptr inbounds nuw %struct.weapon_info, ptr %75, i32 0, i32 24, !dbg !5980
  %77 = load i32, ptr %76, align 4, !dbg !5980
  %78 = call noundef i32 @_Z6fixmulii(i32 noundef %70, i32 noundef %77), !dbg !5981
  store i32 %78, ptr %7, align 4, !dbg !5982
  br label %79, !dbg !5983

79:                                               ; preds = %69, %59
  %80 = load ptr, ptr %5, align 8, !dbg !5984
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 21, !dbg !5986
  %82 = getelementptr inbounds nuw %struct.physics_info, ptr %81, i32 0, i32 8, !dbg !5987
  %83 = load i16, ptr %82, align 2, !dbg !5987
  %84 = zext i16 %83 to i32, !dbg !5984
  %85 = and i32 %84, 32, !dbg !5988
  %86 = icmp ne i32 %85, 0, !dbg !5984
  br i1 %86, label %87, label %109, !dbg !5984

87:                                               ; preds = %79
  %88 = load ptr, ptr %5, align 8, !dbg !5989
  %89 = getelementptr inbounds nuw %struct.object, ptr %88, i32 0, i32 22, !dbg !5991
  %90 = getelementptr inbounds nuw %struct.laser_info_s, ptr %89, i32 0, i32 4, !dbg !5992
  %91 = load i16, ptr %90, align 4, !dbg !5992
  %92 = sext i16 %91 to i64, !dbg !5989
  %93 = load ptr, ptr %4, align 8, !dbg !5993
  %94 = ptrtoint ptr %93 to i64, !dbg !5994
  %95 = sub i64 %94, ptrtoint (ptr @Objects to i64), !dbg !5994
  %96 = sdiv exact i64 %95, 268, !dbg !5994
  %97 = icmp eq i64 %92, %96, !dbg !5995
  br i1 %97, label %98, label %99, !dbg !5995

98:                                               ; preds = %87
  br label %197, !dbg !5996

99:                                               ; preds = %87
  %100 = load ptr, ptr %4, align 8, !dbg !5997
  %101 = ptrtoint ptr %100 to i64, !dbg !5998
  %102 = sub i64 %101, ptrtoint (ptr @Objects to i64), !dbg !5998
  %103 = sdiv exact i64 %102, 268, !dbg !5998
  %104 = trunc i64 %103 to i16, !dbg !5997
  %105 = load ptr, ptr %5, align 8, !dbg !5999
  %106 = getelementptr inbounds nuw %struct.object, ptr %105, i32 0, i32 22, !dbg !6000
  %107 = getelementptr inbounds nuw %struct.laser_info_s, ptr %106, i32 0, i32 4, !dbg !6001
  store i16 %104, ptr %107, align 4, !dbg !6002
  br label %108

108:                                              ; preds = %99
  br label %109, !dbg !6003

109:                                              ; preds = %108, %79
  %110 = load ptr, ptr %4, align 8, !dbg !6004
  %111 = getelementptr inbounds nuw %struct.object, ptr %110, i32 0, i32 2, !dbg !6006
  %112 = load i8, ptr %111, align 1, !dbg !6006
  %113 = zext i8 %112 to i32, !dbg !6004
  %114 = load i32, ptr @Player_num, align 4, !dbg !6007
  %115 = icmp eq i32 %113, %114, !dbg !6008
  br i1 %115, label %116, label %137, !dbg !6008

116:                                              ; preds = %109
  %117 = load i32, ptr @Player_num, align 4, !dbg !6009
  %118 = sext i32 %117 to i64, !dbg !6012
  %119 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %118, !dbg !6012
  %120 = getelementptr inbounds nuw %struct.player, ptr %119, i32 0, i32 7, !dbg !6013
  %121 = load i32, ptr %120, align 4, !dbg !6013
  %122 = and i32 %121, 1, !dbg !6014
  %123 = icmp ne i32 %122, 0, !dbg !6015
  br i1 %123, label %130, label %124, !dbg !6016

124:                                              ; preds = %116
  %125 = load ptr, ptr %4, align 8, !dbg !6017
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 9, !dbg !6019
  %127 = load i16, ptr %126, align 2, !dbg !6019
  %128 = load ptr, ptr %6, align 8, !dbg !6020
  %129 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 71, i16 noundef signext %127, i16 noundef signext 0, ptr noundef %128, i32 noundef 0, i32 noundef 65536), !dbg !6021
  br label %136, !dbg !6022

130:                                              ; preds = %116
  %131 = load ptr, ptr %4, align 8, !dbg !6023
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 9, !dbg !6025
  %133 = load i16, ptr %132, align 2, !dbg !6025
  %134 = load ptr, ptr %6, align 8, !dbg !6026
  %135 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 27, i16 noundef signext %133, i16 noundef signext 0, ptr noundef %134, i32 noundef 0, i32 noundef 65536), !dbg !6027
  br label %136

136:                                              ; preds = %130, %124
  br label %137, !dbg !6028

137:                                              ; preds = %136, %109
  %138 = load ptr, ptr %4, align 8, !dbg !6029
  %139 = getelementptr inbounds nuw %struct.object, ptr %138, i32 0, i32 9, !dbg !6030
  %140 = load i16, ptr %139, align 2, !dbg !6030
  %141 = load ptr, ptr %6, align 8, !dbg !6031
  %142 = call noundef i32 @_Z3i2fi(i32 noundef 10), !dbg !6032
  %143 = sdiv i32 %142, 2, !dbg !6033
  %144 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %140, ptr noundef %141, i32 noundef %143, i32 noundef 1), !dbg !6034
  %145 = load ptr, ptr %5, align 8, !dbg !6035
  %146 = getelementptr inbounds nuw %struct.object, ptr %145, i32 0, i32 2, !dbg !6037
  %147 = load i8, ptr %146, align 1, !dbg !6037
  %148 = zext i8 %147 to i64, !dbg !6038
  %149 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %148, !dbg !6038
  %150 = getelementptr inbounds nuw %struct.weapon_info, ptr %149, i32 0, i32 37, !dbg !6039
  %151 = load i32, ptr %150, align 4, !dbg !6039
  %152 = icmp ne i32 %151, 0, !dbg !6038
  br i1 %152, label %153, label %157, !dbg !6038

153:                                              ; preds = %137
  %154 = load ptr, ptr %5, align 8, !dbg !6040
  %155 = load ptr, ptr %6, align 8, !dbg !6041
  %156 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %154, ptr noundef %155), !dbg !6042
  br label %157, !dbg !6042

157:                                              ; preds = %153, %137
  %158 = load ptr, ptr %5, align 8, !dbg !6043
  %159 = load ptr, ptr %4, align 8, !dbg !6044
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %158, ptr noundef %159), !dbg !6045
  %160 = load ptr, ptr %4, align 8, !dbg !6046
  %161 = load ptr, ptr %5, align 8, !dbg !6047
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %160, ptr noundef %161, i32 noundef 0), !dbg !6048
  %162 = load ptr, ptr %5, align 8, !dbg !6049
  %163 = getelementptr inbounds nuw %struct.object, ptr %162, i32 0, i32 2, !dbg !6051
  %164 = load i8, ptr %163, align 1, !dbg !6051
  %165 = zext i8 %164 to i64, !dbg !6052
  %166 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %165, !dbg !6052
  %167 = getelementptr inbounds nuw %struct.weapon_info, ptr %166, i32 0, i32 37, !dbg !6053
  %168 = load i32, ptr %167, align 4, !dbg !6053
  %169 = icmp ne i32 %168, 0, !dbg !6052
  br i1 %169, label %196, label %170, !dbg !6054

170:                                              ; preds = %157
  %171 = load ptr, ptr %5, align 8, !dbg !6055
  %172 = getelementptr inbounds nuw %struct.object, ptr %171, i32 0, i32 22, !dbg !6058
  %173 = getelementptr inbounds nuw %struct.laser_info_s, ptr %172, i32 0, i32 1, !dbg !6059
  %174 = load i16, ptr %173, align 2, !dbg !6059
  %175 = sext i16 %174 to i32, !dbg !6055
  %176 = icmp sgt i32 %175, -1, !dbg !6060
  br i1 %176, label %177, label %184, !dbg !6060

177:                                              ; preds = %170
  %178 = load ptr, ptr %5, align 8, !dbg !6061
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 22, !dbg !6062
  %180 = getelementptr inbounds nuw %struct.laser_info_s, ptr %179, i32 0, i32 1, !dbg !6063
  %181 = load i16, ptr %180, align 2, !dbg !6063
  %182 = sext i16 %181 to i64, !dbg !6064
  %183 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %182, !dbg !6064
  store ptr %183, ptr %8, align 8, !dbg !6065
  br label %184, !dbg !6066

184:                                              ; preds = %177, %170
  %185 = load ptr, ptr %5, align 8, !dbg !6067
  %186 = getelementptr inbounds nuw %struct.object, ptr %185, i32 0, i32 8, !dbg !6069
  %187 = load i8, ptr %186, align 1, !dbg !6069
  %188 = zext i8 %187 to i32, !dbg !6067
  %189 = and i32 %188, 32, !dbg !6070
  %190 = icmp ne i32 %189, 0, !dbg !6071
  br i1 %190, label %195, label %191, !dbg !6072

191:                                              ; preds = %184
  %192 = load ptr, ptr %4, align 8, !dbg !6073
  %193 = load ptr, ptr %8, align 8, !dbg !6074
  %194 = load i32, ptr %7, align 4, !dbg !6075
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %192, ptr noundef %193, i32 noundef %194), !dbg !6076
  br label %195, !dbg !6076

195:                                              ; preds = %191, %184
  br label %196, !dbg !6077

196:                                              ; preds = %195, %157
  call void @_Z17ai_do_cloak_stuffv(), !dbg !6078
  br label %197, !dbg !6079

197:                                              ; preds = %196, %98, %49, %21
  ret void, !dbg !6080
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z30collide_player_and_nasty_robotP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6081 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6082, !DIExpression(), !6083)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6084, !DIExpression(), !6085)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6086, !DIExpression(), !6087)
  %7 = load ptr, ptr %5, align 8, !dbg !6088
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 2, !dbg !6089
  %9 = load i8, ptr %8, align 1, !dbg !6089
  %10 = zext i8 %9 to i64, !dbg !6090
  %11 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %10, !dbg !6090
  %12 = getelementptr inbounds nuw %struct.robot_info, ptr %11, i32 0, i32 34, !dbg !6091
  %13 = load i8, ptr %12, align 2, !dbg !6091
  %14 = zext i8 %13 to i32, !dbg !6090
  %15 = load ptr, ptr %4, align 8, !dbg !6092
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 9, !dbg !6093
  %17 = load i16, ptr %16, align 2, !dbg !6093
  %18 = load ptr, ptr %6, align 8, !dbg !6094
  %19 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %14, i16 noundef signext %17, i16 noundef signext 0, ptr noundef %18, i32 noundef 0, i32 noundef 65536), !dbg !6095
  %20 = load ptr, ptr %4, align 8, !dbg !6096
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 9, !dbg !6097
  %22 = load i16, ptr %21, align 2, !dbg !6097
  %23 = load ptr, ptr %6, align 8, !dbg !6098
  %24 = call noundef i32 @_Z3i2fi(i32 noundef 10), !dbg !6099
  %25 = sdiv i32 %24, 2, !dbg !6100
  %26 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %22, ptr noundef %23, i32 noundef %25, i32 noundef 1), !dbg !6101
  %27 = load ptr, ptr %4, align 8, !dbg !6102
  %28 = load ptr, ptr %5, align 8, !dbg !6103
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %27, ptr noundef %28, i32 noundef 0), !dbg !6104
  %29 = load ptr, ptr %4, align 8, !dbg !6105
  %30 = load ptr, ptr %5, align 8, !dbg !6106
  %31 = load i32, ptr @Difficulty_level, align 4, !dbg !6107
  %32 = add nsw i32 %31, 1, !dbg !6108
  %33 = mul nsw i32 65536, %32, !dbg !6109
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %29, ptr noundef %30, i32 noundef %33), !dbg !6110
  ret void, !dbg !6111
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z41collide_player_and_materialization_centerP6object(ptr noundef %0) #0 !dbg !6112 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.vms_vector, align 4
  %7 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !6113, !DIExpression(), !6114)
    #dbg_declare(ptr %3, !6115, !DIExpression(), !6116)
    #dbg_declare(ptr %4, !6117, !DIExpression(), !6118)
    #dbg_declare(ptr %5, !6119, !DIExpression(), !6120)
  %8 = load ptr, ptr %2, align 8, !dbg !6121
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 9, !dbg !6122
  %10 = load i16, ptr %9, align 2, !dbg !6122
  %11 = sext i16 %10 to i64, !dbg !6123
  %12 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %11, !dbg !6123
  store ptr %12, ptr %5, align 8, !dbg !6120
  %13 = load ptr, ptr %2, align 8, !dbg !6124
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 9, !dbg !6125
  %15 = load i16, ptr %14, align 2, !dbg !6125
  %16 = load ptr, ptr %2, align 8, !dbg !6126
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 11, !dbg !6127
  %18 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 71, i16 noundef signext %15, i16 noundef signext 0, ptr noundef %17, i32 noundef 0, i32 noundef 65536), !dbg !6128
  %19 = load ptr, ptr %2, align 8, !dbg !6129
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 9, !dbg !6130
  %21 = load i16, ptr %20, align 2, !dbg !6130
  %22 = load ptr, ptr %2, align 8, !dbg !6131
  %23 = getelementptr inbounds nuw %struct.object, ptr %22, i32 0, i32 11, !dbg !6132
  %24 = call noundef i32 @_Z3i2fi(i32 noundef 10), !dbg !6133
  %25 = sdiv i32 %24, 2, !dbg !6134
  %26 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %21, ptr noundef %23, i32 noundef %25, i32 noundef 1), !dbg !6135
  %27 = load ptr, ptr %2, align 8, !dbg !6136
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 2, !dbg !6138
  %29 = load i8, ptr %28, align 1, !dbg !6138
  %30 = zext i8 %29 to i32, !dbg !6136
  %31 = load i32, ptr @Player_num, align 4, !dbg !6139
  %32 = icmp ne i32 %30, %31, !dbg !6140
  br i1 %32, label %33, label %34, !dbg !6140

33:                                               ; preds = %1
  br label %107, !dbg !6141

34:                                               ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !6142
  br label %35, !dbg !6144

35:                                               ; preds = %100, %34
  %36 = load i32, ptr %3, align 4, !dbg !6145
  %37 = icmp slt i32 %36, 6, !dbg !6147
  br i1 %37, label %38, label %103, !dbg !6148

38:                                               ; preds = %35
  %39 = load ptr, ptr %5, align 8, !dbg !6149
  %40 = getelementptr inbounds nuw %struct.segment, ptr %39, i32 0, i32 1, !dbg !6149
  %41 = load i32, ptr %3, align 4, !dbg !6149
  %42 = sext i32 %41 to i64, !dbg !6149
  %43 = getelementptr inbounds [6 x i16], ptr %40, i64 0, i64 %42, !dbg !6149
  %44 = load i16, ptr %43, align 2, !dbg !6149
  %45 = sext i16 %44 to i32, !dbg !6149
  %46 = icmp eq i32 %45, -1, !dbg !6149
  br i1 %46, label %47, label %48, !dbg !6149

47:                                               ; preds = %38
  br label %77, !dbg !6149

48:                                               ; preds = %38
  %49 = load ptr, ptr %5, align 8, !dbg !6149
  %50 = getelementptr inbounds nuw %struct.segment, ptr %49, i32 0, i32 1, !dbg !6149
  %51 = load i32, ptr %3, align 4, !dbg !6149
  %52 = sext i32 %51 to i64, !dbg !6149
  %53 = getelementptr inbounds [6 x i16], ptr %50, i64 0, i64 %52, !dbg !6149
  %54 = load i16, ptr %53, align 2, !dbg !6149
  %55 = sext i16 %54 to i32, !dbg !6149
  %56 = icmp eq i32 %55, -2, !dbg !6149
  br i1 %56, label %57, label %58, !dbg !6149

57:                                               ; preds = %48
  br label %75, !dbg !6149

58:                                               ; preds = %48
  %59 = load ptr, ptr %5, align 8, !dbg !6149
  %60 = getelementptr inbounds nuw %struct.segment, ptr %59, i32 0, i32 0, !dbg !6149
  %61 = load i32, ptr %3, align 4, !dbg !6149
  %62 = sext i32 %61 to i64, !dbg !6149
  %63 = getelementptr inbounds [6 x %struct.side], ptr %60, i64 0, i64 %62, !dbg !6149
  %64 = getelementptr inbounds nuw %struct.side, ptr %63, i32 0, i32 2, !dbg !6149
  %65 = load i16, ptr %64, align 2, !dbg !6149
  %66 = sext i16 %65 to i32, !dbg !6149
  %67 = icmp eq i32 %66, -1, !dbg !6149
  br i1 %67, label %68, label %69, !dbg !6149

68:                                               ; preds = %58
  br label %73, !dbg !6149

69:                                               ; preds = %58
  %70 = load ptr, ptr %5, align 8, !dbg !6149
  %71 = load i32, ptr %3, align 4, !dbg !6149
  %72 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %70, i32 noundef %71), !dbg !6149
  br label %73, !dbg !6149

73:                                               ; preds = %69, %68
  %74 = phi i32 [ 5, %68 ], [ %72, %69 ], !dbg !6149
  br label %75, !dbg !6149

75:                                               ; preds = %73, %57
  %76 = phi i32 [ 8, %57 ], [ %74, %73 ], !dbg !6149
  br label %77, !dbg !6149

77:                                               ; preds = %75, %47
  %78 = phi i32 [ 2, %47 ], [ %76, %75 ], !dbg !6149
  %79 = and i32 %78, 1, !dbg !6151
  %80 = icmp ne i32 %79, 0, !dbg !6149
  br i1 %80, label %81, label %99, !dbg !6149

81:                                               ; preds = %77
    #dbg_declare(ptr %6, !6152, !DIExpression(), !6154)
    #dbg_declare(ptr %7, !6155, !DIExpression(), !6156)
  %82 = load ptr, ptr %5, align 8, !dbg !6157
  %83 = load i32, ptr %3, align 4, !dbg !6158
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %6, ptr noundef %82, i32 noundef %83), !dbg !6159
  %84 = load ptr, ptr %2, align 8, !dbg !6160
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 11, !dbg !6161
  %86 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %4, ptr noundef %6, ptr noundef %85), !dbg !6162
  %87 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %4), !dbg !6163
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %7), !dbg !6164
  %88 = getelementptr inbounds nuw %struct.vms_vector, ptr %7, i32 0, i32 0, !dbg !6165
  %89 = load i32, ptr %88, align 4, !dbg !6166
  %90 = sdiv i32 %89, 4, !dbg !6166
  store i32 %90, ptr %88, align 4, !dbg !6166
  %91 = getelementptr inbounds nuw %struct.vms_vector, ptr %7, i32 0, i32 1, !dbg !6167
  %92 = load i32, ptr %91, align 4, !dbg !6168
  %93 = sdiv i32 %92, 4, !dbg !6168
  store i32 %93, ptr %91, align 4, !dbg !6168
  %94 = getelementptr inbounds nuw %struct.vms_vector, ptr %7, i32 0, i32 2, !dbg !6169
  %95 = load i32, ptr %94, align 4, !dbg !6170
  %96 = sdiv i32 %95, 4, !dbg !6170
  store i32 %96, ptr %94, align 4, !dbg !6170
  %97 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %4, ptr noundef %7), !dbg !6171
  %98 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %4), !dbg !6172
  br label %99, !dbg !6173

99:                                               ; preds = %81, %77
  br label %100, !dbg !6174

100:                                              ; preds = %99
  %101 = load i32, ptr %3, align 4, !dbg !6175
  %102 = add nsw i32 %101, 1, !dbg !6175
  store i32 %102, ptr %3, align 4, !dbg !6175
  br label %35, !dbg !6176, !llvm.loop !6177

103:                                              ; preds = %35
  %104 = load ptr, ptr %2, align 8, !dbg !6179
  call void @_Z15bump_one_objectP6objectP10vms_vectori(ptr noundef %104, ptr noundef %4, i32 noundef 4194304), !dbg !6180
  %105 = load ptr, ptr %2, align 8, !dbg !6181
  %106 = load ptr, ptr %2, align 8, !dbg !6182
  call void @_Z22apply_damage_to_playerP6objectS0_i(ptr noundef %105, ptr noundef %106, i32 noundef 262144), !dbg !6183
  br label %107, !dbg !6184

107:                                              ; preds = %103, %33
  ret void, !dbg !6185
}

declare noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef, i32 noundef) #1

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z40collide_robot_and_materialization_centerP6object(ptr noundef %0) #0 !dbg !6186 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !6187, !DIExpression(), !6188)
    #dbg_declare(ptr %3, !6189, !DIExpression(), !6190)
    #dbg_declare(ptr %4, !6191, !DIExpression(), !6192)
    #dbg_declare(ptr %5, !6193, !DIExpression(), !6194)
  %7 = load ptr, ptr %2, align 8, !dbg !6195
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 9, !dbg !6196
  %9 = load i16, ptr %8, align 2, !dbg !6196
  %10 = sext i16 %9 to i64, !dbg !6197
  %11 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %10, !dbg !6197
  store ptr %11, ptr %5, align 8, !dbg !6194
  %12 = load ptr, ptr %2, align 8, !dbg !6198
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 9, !dbg !6199
  %14 = load i16, ptr %13, align 2, !dbg !6199
  %15 = load ptr, ptr %2, align 8, !dbg !6200
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 11, !dbg !6201
  %17 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 20, i16 noundef signext %14, i16 noundef signext 0, ptr noundef %16, i32 noundef 0, i32 noundef 65536), !dbg !6202
  %18 = load ptr, ptr %2, align 8, !dbg !6203
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !6205
  %20 = load i8, ptr %19, align 1, !dbg !6205
  %21 = zext i8 %20 to i64, !dbg !6206
  %22 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %21, !dbg !6206
  %23 = getelementptr inbounds nuw %struct.robot_info, ptr %22, i32 0, i32 3, !dbg !6207
  %24 = load i16, ptr %23, align 4, !dbg !6207
  %25 = sext i16 %24 to i32, !dbg !6206
  %26 = icmp sgt i32 %25, -1, !dbg !6208
  br i1 %26, label %27, label %48, !dbg !6208

27:                                               ; preds = %1
  %28 = load ptr, ptr %2, align 8, !dbg !6209
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 9, !dbg !6210
  %30 = load i16, ptr %29, align 2, !dbg !6210
  %31 = load ptr, ptr %2, align 8, !dbg !6211
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 11, !dbg !6212
  %33 = load ptr, ptr %2, align 8, !dbg !6213
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 13, !dbg !6214
  %35 = load i32, ptr %34, align 4, !dbg !6214
  %36 = sdiv i32 %35, 2, !dbg !6215
  %37 = mul nsw i32 %36, 3, !dbg !6216
  %38 = sdiv i32 %37, 4, !dbg !6217
  %39 = load ptr, ptr %2, align 8, !dbg !6218
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 2, !dbg !6219
  %41 = load i8, ptr %40, align 1, !dbg !6219
  %42 = zext i8 %41 to i64, !dbg !6220
  %43 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %42, !dbg !6220
  %44 = getelementptr inbounds nuw %struct.robot_info, ptr %43, i32 0, i32 3, !dbg !6221
  %45 = load i16, ptr %44, align 4, !dbg !6221
  %46 = sext i16 %45 to i32, !dbg !6220
  %47 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %30, ptr noundef %32, i32 noundef %38, i32 noundef %46), !dbg !6222
  br label %48, !dbg !6222

48:                                               ; preds = %27, %1
  store i32 0, ptr %3, align 4, !dbg !6223
  br label %49, !dbg !6225

49:                                               ; preds = %103, %48
  %50 = load i32, ptr %3, align 4, !dbg !6226
  %51 = icmp slt i32 %50, 6, !dbg !6228
  br i1 %51, label %52, label %106, !dbg !6229

52:                                               ; preds = %49
  %53 = load ptr, ptr %5, align 8, !dbg !6230
  %54 = getelementptr inbounds nuw %struct.segment, ptr %53, i32 0, i32 1, !dbg !6230
  %55 = load i32, ptr %3, align 4, !dbg !6230
  %56 = sext i32 %55 to i64, !dbg !6230
  %57 = getelementptr inbounds [6 x i16], ptr %54, i64 0, i64 %56, !dbg !6230
  %58 = load i16, ptr %57, align 2, !dbg !6230
  %59 = sext i16 %58 to i32, !dbg !6230
  %60 = icmp eq i32 %59, -1, !dbg !6230
  br i1 %60, label %61, label %62, !dbg !6230

61:                                               ; preds = %52
  br label %91, !dbg !6230

62:                                               ; preds = %52
  %63 = load ptr, ptr %5, align 8, !dbg !6230
  %64 = getelementptr inbounds nuw %struct.segment, ptr %63, i32 0, i32 1, !dbg !6230
  %65 = load i32, ptr %3, align 4, !dbg !6230
  %66 = sext i32 %65 to i64, !dbg !6230
  %67 = getelementptr inbounds [6 x i16], ptr %64, i64 0, i64 %66, !dbg !6230
  %68 = load i16, ptr %67, align 2, !dbg !6230
  %69 = sext i16 %68 to i32, !dbg !6230
  %70 = icmp eq i32 %69, -2, !dbg !6230
  br i1 %70, label %71, label %72, !dbg !6230

71:                                               ; preds = %62
  br label %89, !dbg !6230

72:                                               ; preds = %62
  %73 = load ptr, ptr %5, align 8, !dbg !6230
  %74 = getelementptr inbounds nuw %struct.segment, ptr %73, i32 0, i32 0, !dbg !6230
  %75 = load i32, ptr %3, align 4, !dbg !6230
  %76 = sext i32 %75 to i64, !dbg !6230
  %77 = getelementptr inbounds [6 x %struct.side], ptr %74, i64 0, i64 %76, !dbg !6230
  %78 = getelementptr inbounds nuw %struct.side, ptr %77, i32 0, i32 2, !dbg !6230
  %79 = load i16, ptr %78, align 2, !dbg !6230
  %80 = sext i16 %79 to i32, !dbg !6230
  %81 = icmp eq i32 %80, -1, !dbg !6230
  br i1 %81, label %82, label %83, !dbg !6230

82:                                               ; preds = %72
  br label %87, !dbg !6230

83:                                               ; preds = %72
  %84 = load ptr, ptr %5, align 8, !dbg !6230
  %85 = load i32, ptr %3, align 4, !dbg !6230
  %86 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %84, i32 noundef %85), !dbg !6230
  br label %87, !dbg !6230

87:                                               ; preds = %83, %82
  %88 = phi i32 [ 5, %82 ], [ %86, %83 ], !dbg !6230
  br label %89, !dbg !6230

89:                                               ; preds = %87, %71
  %90 = phi i32 [ 8, %71 ], [ %88, %87 ], !dbg !6230
  br label %91, !dbg !6230

91:                                               ; preds = %89, %61
  %92 = phi i32 [ 2, %61 ], [ %90, %89 ], !dbg !6230
  %93 = and i32 %92, 1, !dbg !6232
  %94 = icmp ne i32 %93, 0, !dbg !6230
  br i1 %94, label %95, label %102, !dbg !6230

95:                                               ; preds = %91
    #dbg_declare(ptr %6, !6233, !DIExpression(), !6235)
  %96 = load ptr, ptr %5, align 8, !dbg !6236
  %97 = load i32, ptr %3, align 4, !dbg !6237
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %6, ptr noundef %96, i32 noundef %97), !dbg !6238
  %98 = load ptr, ptr %2, align 8, !dbg !6239
  %99 = getelementptr inbounds nuw %struct.object, ptr %98, i32 0, i32 11, !dbg !6240
  %100 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %4, ptr noundef %6, ptr noundef %99), !dbg !6241
  %101 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %4), !dbg !6242
  br label %102, !dbg !6243

102:                                              ; preds = %95, %91
  br label %103, !dbg !6244

103:                                              ; preds = %102
  %104 = load i32, ptr %3, align 4, !dbg !6245
  %105 = add nsw i32 %104, 1, !dbg !6245
  store i32 %105, ptr %3, align 4, !dbg !6245
  br label %49, !dbg !6246, !llvm.loop !6247

106:                                              ; preds = %49
  %107 = load ptr, ptr %2, align 8, !dbg !6249
  call void @_Z15bump_one_objectP6objectP10vms_vectori(ptr noundef %107, ptr noundef %4, i32 noundef 524288), !dbg !6250
  %108 = load ptr, ptr %2, align 8, !dbg !6251
  %109 = call noundef i32 @_Z21apply_damage_to_robotP6objectii(ptr noundef %108, i32 noundef 65536, i32 noundef -1), !dbg !6252
  ret void, !dbg !6253
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26collide_player_and_powerupP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6254 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6255, !DIExpression(), !6256)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6257, !DIExpression(), !6258)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6259, !DIExpression(), !6260)
  %8 = load i32, ptr @Endlevel_sequence, align 4, !dbg !6261
  %9 = icmp ne i32 %8, 0, !dbg !6261
  br i1 %9, label %33, label %10, !dbg !6263

10:                                               ; preds = %3
  %11 = load i32, ptr @Player_is_dead, align 4, !dbg !6264
  %12 = icmp ne i32 %11, 0, !dbg !6264
  br i1 %12, label %33, label %13, !dbg !6265

13:                                               ; preds = %10
  %14 = load ptr, ptr %4, align 8, !dbg !6266
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 2, !dbg !6267
  %16 = load i8, ptr %15, align 1, !dbg !6267
  %17 = zext i8 %16 to i32, !dbg !6266
  %18 = load i32, ptr @Player_num, align 4, !dbg !6268
  %19 = icmp eq i32 %17, %18, !dbg !6269
  br i1 %19, label %20, label %33, !dbg !6265

20:                                               ; preds = %13
    #dbg_declare(ptr %7, !6270, !DIExpression(), !6272)
  %21 = load ptr, ptr %5, align 8, !dbg !6273
  %22 = call noundef i32 @_Z10do_powerupP6object(ptr noundef %21), !dbg !6274
  store i32 %22, ptr %7, align 4, !dbg !6275
  %23 = load i32, ptr %7, align 4, !dbg !6276
  %24 = icmp ne i32 %23, 0, !dbg !6276
  br i1 %24, label %25, label %32, !dbg !6276

25:                                               ; preds = %20
  %26 = load ptr, ptr %5, align 8, !dbg !6278
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 8, !dbg !6280
  %28 = load i8, ptr %27, align 1, !dbg !6281
  %29 = zext i8 %28 to i32, !dbg !6281
  %30 = or i32 %29, 2, !dbg !6281
  %31 = trunc i32 %30 to i8, !dbg !6281
  store i8 %31, ptr %27, align 1, !dbg !6281
  br label %32, !dbg !6282

32:                                               ; preds = %25, %20
  br label %79, !dbg !6283

33:                                               ; preds = %13, %10, %3
  %34 = load i32, ptr @Game_mode, align 4, !dbg !6284
  %35 = and i32 %34, 16, !dbg !6286
  %36 = icmp ne i32 %35, 0, !dbg !6287
  br i1 %36, label %37, label %78, !dbg !6288

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8, !dbg !6289
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 2, !dbg !6290
  %40 = load i8, ptr %39, align 1, !dbg !6290
  %41 = zext i8 %40 to i32, !dbg !6289
  %42 = load i32, ptr @Player_num, align 4, !dbg !6291
  %43 = icmp ne i32 %41, %42, !dbg !6292
  br i1 %43, label %44, label %78, !dbg !6288

44:                                               ; preds = %37
  %45 = load ptr, ptr %5, align 8, !dbg !6293
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 2, !dbg !6295
  %47 = load i8, ptr %46, align 1, !dbg !6295
  %48 = zext i8 %47 to i32, !dbg !6293
  switch i32 %48, label %76 [
    i32 4, label %49
    i32 5, label %58
    i32 6, label %67
  ], !dbg !6296

49:                                               ; preds = %44
  %50 = load ptr, ptr %4, align 8, !dbg !6297
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 2, !dbg !6299
  %52 = load i8, ptr %51, align 1, !dbg !6299
  %53 = zext i8 %52 to i64, !dbg !6300
  %54 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %53, !dbg !6300
  %55 = getelementptr inbounds nuw %struct.player, ptr %54, i32 0, i32 7, !dbg !6301
  %56 = load i32, ptr %55, align 4, !dbg !6302
  %57 = or i32 %56, 2, !dbg !6302
  store i32 %57, ptr %55, align 4, !dbg !6302
  br label %77, !dbg !6303

58:                                               ; preds = %44
  %59 = load ptr, ptr %4, align 8, !dbg !6304
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 2, !dbg !6305
  %61 = load i8, ptr %60, align 1, !dbg !6305
  %62 = zext i8 %61 to i64, !dbg !6306
  %63 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %62, !dbg !6306
  %64 = getelementptr inbounds nuw %struct.player, ptr %63, i32 0, i32 7, !dbg !6307
  %65 = load i32, ptr %64, align 4, !dbg !6308
  %66 = or i32 %65, 4, !dbg !6308
  store i32 %66, ptr %64, align 4, !dbg !6308
  br label %77, !dbg !6309

67:                                               ; preds = %44
  %68 = load ptr, ptr %4, align 8, !dbg !6310
  %69 = getelementptr inbounds nuw %struct.object, ptr %68, i32 0, i32 2, !dbg !6311
  %70 = load i8, ptr %69, align 1, !dbg !6311
  %71 = zext i8 %70 to i64, !dbg !6312
  %72 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %71, !dbg !6312
  %73 = getelementptr inbounds nuw %struct.player, ptr %72, i32 0, i32 7, !dbg !6313
  %74 = load i32, ptr %73, align 4, !dbg !6314
  %75 = or i32 %74, 8, !dbg !6314
  store i32 %75, ptr %73, align 4, !dbg !6314
  br label %77, !dbg !6315

76:                                               ; preds = %44
  br label %77, !dbg !6316

77:                                               ; preds = %76, %67, %58, %49
  br label %78, !dbg !6317

78:                                               ; preds = %77, %37, %33
  br label %79

79:                                               ; preds = %78, %32
  ret void, !dbg !6318
}

declare noundef i32 @_Z10do_powerupP6object(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26collide_player_and_clutterP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6319 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6320, !DIExpression(), !6321)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6322, !DIExpression(), !6323)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6324, !DIExpression(), !6325)
  %7 = load ptr, ptr %4, align 8, !dbg !6326
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 9, !dbg !6327
  %9 = load i16, ptr %8, align 2, !dbg !6327
  %10 = load ptr, ptr %6, align 8, !dbg !6328
  %11 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 17, i16 noundef signext %9, i16 noundef signext 0, ptr noundef %10, i32 noundef 0, i32 noundef 65536), !dbg !6329
  %12 = load ptr, ptr %5, align 8, !dbg !6330
  %13 = load ptr, ptr %4, align 8, !dbg !6331
  call void @_Z16bump_two_objectsP6objectS0_i(ptr noundef %12, ptr noundef %13, i32 noundef 1), !dbg !6332
  ret void, !dbg !6333
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21maybe_detonate_weaponP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6334 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !6335, !DIExpression(), !6336)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !6337, !DIExpression(), !6338)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !6339, !DIExpression(), !6340)
  %11 = load ptr, ptr %5, align 8, !dbg !6341
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 2, !dbg !6343
  %13 = load i8, ptr %12, align 1, !dbg !6343
  %14 = zext i8 %13 to i64, !dbg !6344
  %15 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %14, !dbg !6344
  %16 = getelementptr inbounds nuw %struct.weapon_info, ptr %15, i32 0, i32 37, !dbg !6345
  %17 = load i32, ptr %16, align 4, !dbg !6345
  %18 = icmp ne i32 %17, 0, !dbg !6344
  br i1 %18, label %19, label %61, !dbg !6344

19:                                               ; preds = %3
    #dbg_declare(ptr %8, !6346, !DIExpression(), !6348)
  %20 = load ptr, ptr %5, align 8, !dbg !6349
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 11, !dbg !6350
  %22 = load ptr, ptr %6, align 8, !dbg !6351
  %23 = getelementptr inbounds nuw %struct.object, ptr %22, i32 0, i32 11, !dbg !6352
  %24 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %21, ptr noundef %23), !dbg !6353
  store i32 %24, ptr %8, align 4, !dbg !6354
  %25 = load i32, ptr %8, align 4, !dbg !6355
  %26 = icmp slt i32 %25, 327680, !dbg !6357
  br i1 %26, label %27, label %54, !dbg !6357

27:                                               ; preds = %19
  %28 = load ptr, ptr %5, align 8, !dbg !6358
  %29 = load ptr, ptr %6, align 8, !dbg !6360
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %28, ptr noundef %29), !dbg !6361
  %30 = load ptr, ptr %5, align 8, !dbg !6362
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 8, !dbg !6364
  %32 = load i8, ptr %31, align 1, !dbg !6364
  %33 = zext i8 %32 to i32, !dbg !6362
  %34 = and i32 %33, 2, !dbg !6365
  %35 = icmp ne i32 %34, 0, !dbg !6362
  br i1 %35, label %36, label %53, !dbg !6362

36:                                               ; preds = %27
  %37 = load ptr, ptr %5, align 8, !dbg !6366
  %38 = load ptr, ptr %7, align 8, !dbg !6368
  %39 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %37, ptr noundef %38), !dbg !6369
  %40 = load ptr, ptr %5, align 8, !dbg !6370
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 2, !dbg !6371
  %42 = load i8, ptr %41, align 1, !dbg !6371
  %43 = zext i8 %42 to i64, !dbg !6372
  %44 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %43, !dbg !6372
  %45 = getelementptr inbounds nuw %struct.weapon_info, ptr %44, i32 0, i32 9, !dbg !6373
  %46 = load i16, ptr %45, align 4, !dbg !6373
  %47 = sext i16 %46 to i32, !dbg !6372
  %48 = load ptr, ptr %5, align 8, !dbg !6374
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 9, !dbg !6375
  %50 = load i16, ptr %49, align 2, !dbg !6375
  %51 = load ptr, ptr %7, align 8, !dbg !6376
  %52 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %47, i16 noundef signext %50, i16 noundef signext 0, ptr noundef %51, i32 noundef 0, i32 noundef 65536), !dbg !6377
  br label %53, !dbg !6378

53:                                               ; preds = %36, %27
  store i32 1, ptr %4, align 4, !dbg !6379
  br label %62, !dbg !6379

54:                                               ; preds = %19
  %55 = load i32, ptr %8, align 4, !dbg !6380
  %56 = sdiv i32 %55, 64, !dbg !6382
  store i32 %56, ptr %9, align 4, !dbg !6380
  store i32 65536, ptr %10, align 4, !dbg !6383
  %57 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %9, ptr noundef nonnull align 4 dereferenceable(4) %10), !dbg !6384
  %58 = load i32, ptr %57, align 4, !dbg !6384
  %59 = load ptr, ptr %5, align 8, !dbg !6385
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 20, !dbg !6386
  store i32 %58, ptr %60, align 4, !dbg !6387
  store i32 1, ptr %4, align 4, !dbg !6388
  br label %62, !dbg !6388

61:                                               ; preds = %3
  store i32 0, ptr %4, align 4, !dbg !6389
  br label %62, !dbg !6389

62:                                               ; preds = %61, %54, %53
  %63 = load i32, ptr %4, align 4, !dbg !6390
  ret i32 %63, !dbg !6390
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25collide_weapon_and_weaponP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6391 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6392, !DIExpression(), !6393)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6394, !DIExpression(), !6395)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6396, !DIExpression(), !6397)
  %7 = load ptr, ptr %4, align 8, !dbg !6398
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 2, !dbg !6400
  %9 = load i8, ptr %8, align 1, !dbg !6400
  %10 = zext i8 %9 to i32, !dbg !6398
  %11 = icmp eq i32 %10, 51, !dbg !6401
  br i1 %11, label %12, label %19, !dbg !6402

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8, !dbg !6403
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 2, !dbg !6404
  %15 = load i8, ptr %14, align 1, !dbg !6404
  %16 = zext i8 %15 to i32, !dbg !6403
  %17 = icmp eq i32 %16, 51, !dbg !6405
  br i1 %17, label %18, label %19, !dbg !6402

18:                                               ; preds = %12
  br label %132, !dbg !6406

19:                                               ; preds = %12, %3
  %20 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !6407
  %21 = icmp eq i32 %20, 3, !dbg !6409
  br i1 %21, label %22, label %48, !dbg !6409

22:                                               ; preds = %19
  %23 = load ptr, ptr %4, align 8, !dbg !6410
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 2, !dbg !6413
  %25 = load i8, ptr %24, align 1, !dbg !6413
  %26 = zext i8 %25 to i32, !dbg !6410
  %27 = icmp eq i32 %26, 35, !dbg !6414
  br i1 %27, label %28, label %34, !dbg !6414

28:                                               ; preds = %22
  %29 = load ptr, ptr %4, align 8, !dbg !6415
  %30 = call noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %29), !dbg !6418
  %31 = icmp ne i32 %30, 0, !dbg !6418
  br i1 %31, label %33, label %32, !dbg !6419

32:                                               ; preds = %28
  br label %132, !dbg !6420

33:                                               ; preds = %28
  br label %47, !dbg !6421

34:                                               ; preds = %22
  %35 = load ptr, ptr %5, align 8, !dbg !6422
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 2, !dbg !6424
  %37 = load i8, ptr %36, align 1, !dbg !6424
  %38 = zext i8 %37 to i32, !dbg !6422
  %39 = icmp eq i32 %38, 35, !dbg !6425
  br i1 %39, label %40, label %46, !dbg !6425

40:                                               ; preds = %34
  %41 = load ptr, ptr %5, align 8, !dbg !6426
  %42 = call noundef i32 @_Z21ok_to_do_omega_damageP6object(ptr noundef %41), !dbg !6429
  %43 = icmp ne i32 %42, 0, !dbg !6429
  br i1 %43, label %45, label %44, !dbg !6430

44:                                               ; preds = %40
  br label %132, !dbg !6431

45:                                               ; preds = %40
  br label %46, !dbg !6432

46:                                               ; preds = %45, %34
  br label %47

47:                                               ; preds = %46, %33
  br label %48, !dbg !6433

48:                                               ; preds = %47, %19
  %49 = load ptr, ptr %4, align 8, !dbg !6434
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 2, !dbg !6436
  %51 = load i8, ptr %50, align 1, !dbg !6436
  %52 = zext i8 %51 to i64, !dbg !6437
  %53 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %52, !dbg !6437
  %54 = getelementptr inbounds nuw %struct.weapon_info, ptr %53, i32 0, i32 13, !dbg !6438
  %55 = load i8, ptr %54, align 2, !dbg !6438
  %56 = icmp ne i8 %55, 0, !dbg !6439
  br i1 %56, label %66, label %57, !dbg !6440

57:                                               ; preds = %48
  %58 = load ptr, ptr %5, align 8, !dbg !6441
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 2, !dbg !6442
  %60 = load i8, ptr %59, align 1, !dbg !6442
  %61 = zext i8 %60 to i64, !dbg !6443
  %62 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %61, !dbg !6443
  %63 = getelementptr inbounds nuw %struct.weapon_info, ptr %62, i32 0, i32 13, !dbg !6444
  %64 = load i8, ptr %63, align 2, !dbg !6444
  %65 = icmp ne i8 %64, 0, !dbg !6445
  br i1 %65, label %66, label %132, !dbg !6440

66:                                               ; preds = %57, %48
  %67 = load ptr, ptr %4, align 8, !dbg !6446
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 2, !dbg !6449
  %69 = load i8, ptr %68, align 1, !dbg !6449
  %70 = zext i8 %69 to i32, !dbg !6446
  %71 = load ptr, ptr %5, align 8, !dbg !6450
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 2, !dbg !6451
  %73 = load i8, ptr %72, align 1, !dbg !6451
  %74 = zext i8 %73 to i32, !dbg !6450
  %75 = icmp eq i32 %70, %74, !dbg !6452
  br i1 %75, label %76, label %89, !dbg !6453

76:                                               ; preds = %66
  %77 = load ptr, ptr %4, align 8, !dbg !6454
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 22, !dbg !6455
  %79 = getelementptr inbounds nuw %struct.laser_info_s, ptr %78, i32 0, i32 1, !dbg !6456
  %80 = load i16, ptr %79, align 2, !dbg !6456
  %81 = sext i16 %80 to i32, !dbg !6454
  %82 = load ptr, ptr %5, align 8, !dbg !6457
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 22, !dbg !6458
  %84 = getelementptr inbounds nuw %struct.laser_info_s, ptr %83, i32 0, i32 1, !dbg !6459
  %85 = load i16, ptr %84, align 2, !dbg !6459
  %86 = sext i16 %85 to i32, !dbg !6457
  %87 = icmp eq i32 %81, %86, !dbg !6460
  br i1 %87, label %88, label %89, !dbg !6453

88:                                               ; preds = %76
  br label %132, !dbg !6461

89:                                               ; preds = %76, %66
  %90 = load ptr, ptr %4, align 8, !dbg !6462
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 2, !dbg !6464
  %92 = load i8, ptr %91, align 1, !dbg !6464
  %93 = zext i8 %92 to i64, !dbg !6465
  %94 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %93, !dbg !6465
  %95 = getelementptr inbounds nuw %struct.weapon_info, ptr %94, i32 0, i32 13, !dbg !6466
  %96 = load i8, ptr %95, align 2, !dbg !6466
  %97 = icmp ne i8 %96, 0, !dbg !6465
  br i1 %97, label %98, label %110, !dbg !6465

98:                                               ; preds = %89
  %99 = load ptr, ptr %4, align 8, !dbg !6467
  %100 = load ptr, ptr %5, align 8, !dbg !6469
  %101 = load ptr, ptr %6, align 8, !dbg !6470
  %102 = call noundef i32 @_Z21maybe_detonate_weaponP6objectS0_P10vms_vector(ptr noundef %99, ptr noundef %100, ptr noundef %101), !dbg !6471
  %103 = icmp ne i32 %102, 0, !dbg !6471
  br i1 %103, label %104, label %109, !dbg !6471

104:                                              ; preds = %98
  %105 = load ptr, ptr %5, align 8, !dbg !6472
  %106 = load ptr, ptr %4, align 8, !dbg !6473
  %107 = load ptr, ptr %6, align 8, !dbg !6474
  %108 = call noundef i32 @_Z21maybe_detonate_weaponP6objectS0_P10vms_vector(ptr noundef %105, ptr noundef %106, ptr noundef %107), !dbg !6475
  br label %109, !dbg !6475

109:                                              ; preds = %104, %98
  br label %110, !dbg !6476

110:                                              ; preds = %109, %89
  %111 = load ptr, ptr %5, align 8, !dbg !6477
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 2, !dbg !6479
  %113 = load i8, ptr %112, align 1, !dbg !6479
  %114 = zext i8 %113 to i64, !dbg !6480
  %115 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %114, !dbg !6480
  %116 = getelementptr inbounds nuw %struct.weapon_info, ptr %115, i32 0, i32 13, !dbg !6481
  %117 = load i8, ptr %116, align 2, !dbg !6481
  %118 = icmp ne i8 %117, 0, !dbg !6480
  br i1 %118, label %119, label %131, !dbg !6480

119:                                              ; preds = %110
  %120 = load ptr, ptr %5, align 8, !dbg !6482
  %121 = load ptr, ptr %4, align 8, !dbg !6484
  %122 = load ptr, ptr %6, align 8, !dbg !6485
  %123 = call noundef i32 @_Z21maybe_detonate_weaponP6objectS0_P10vms_vector(ptr noundef %120, ptr noundef %121, ptr noundef %122), !dbg !6486
  %124 = icmp ne i32 %123, 0, !dbg !6486
  br i1 %124, label %125, label %130, !dbg !6486

125:                                              ; preds = %119
  %126 = load ptr, ptr %4, align 8, !dbg !6487
  %127 = load ptr, ptr %5, align 8, !dbg !6488
  %128 = load ptr, ptr %6, align 8, !dbg !6489
  %129 = call noundef i32 @_Z21maybe_detonate_weaponP6objectS0_P10vms_vector(ptr noundef %126, ptr noundef %127, ptr noundef %128), !dbg !6490
  br label %130, !dbg !6490

130:                                              ; preds = %125, %119
  br label %131, !dbg !6491

131:                                              ; preds = %130, %110
  br label %132, !dbg !6492

132:                                              ; preds = %18, %32, %44, %88, %131, %57
  ret void, !dbg !6493
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25collide_weapon_and_debrisP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6494 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6495, !DIExpression(), !6496)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6497, !DIExpression(), !6498)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6499, !DIExpression(), !6500)
  %7 = load ptr, ptr %4, align 8, !dbg !6501
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 2, !dbg !6503
  %9 = load i8, ptr %8, align 1, !dbg !6503
  %10 = zext i8 %9 to i32, !dbg !6501
  %11 = icmp eq i32 %10, 16, !dbg !6504
  br i1 %11, label %18, label %12, !dbg !6505

12:                                               ; preds = %3
  %13 = load ptr, ptr %4, align 8, !dbg !6506
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 2, !dbg !6507
  %15 = load i8, ptr %14, align 1, !dbg !6507
  %16 = zext i8 %15 to i32, !dbg !6506
  %17 = icmp eq i32 %16, 38, !dbg !6508
  br i1 %17, label %18, label %28, !dbg !6505

18:                                               ; preds = %12, %3
  %19 = load ptr, ptr %4, align 8, !dbg !6509
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 22, !dbg !6512
  %21 = getelementptr inbounds nuw %struct.laser_info_s, ptr %20, i32 0, i32 3, !dbg !6513
  %22 = load i32, ptr %21, align 4, !dbg !6513
  %23 = add nsw i32 %22, 32768, !dbg !6514
  %24 = load i32, ptr @GameTime, align 4, !dbg !6515
  %25 = icmp sgt i32 %23, %24, !dbg !6516
  br i1 %25, label %26, label %27, !dbg !6516

26:                                               ; preds = %18
  br label %71, !dbg !6517

27:                                               ; preds = %18
  br label %28, !dbg !6518

28:                                               ; preds = %27, %12
  %29 = load ptr, ptr %4, align 8, !dbg !6519
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 22, !dbg !6521
  %31 = getelementptr inbounds nuw %struct.laser_info_s, ptr %30, i32 0, i32 0, !dbg !6522
  %32 = load i16, ptr %31, align 4, !dbg !6522
  %33 = sext i16 %32 to i32, !dbg !6519
  %34 = icmp eq i32 %33, 4, !dbg !6523
  br i1 %34, label %35, label %70, !dbg !6524

35:                                               ; preds = %28
  %36 = load ptr, ptr %5, align 8, !dbg !6525
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 8, !dbg !6526
  %38 = load i8, ptr %37, align 1, !dbg !6526
  %39 = zext i8 %38 to i32, !dbg !6525
  %40 = and i32 %39, 1, !dbg !6527
  %41 = icmp ne i32 %40, 0, !dbg !6528
  br i1 %41, label %70, label %42, !dbg !6524

42:                                               ; preds = %35
  %43 = load ptr, ptr %4, align 8, !dbg !6529
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 9, !dbg !6531
  %45 = load i16, ptr %44, align 2, !dbg !6531
  %46 = load ptr, ptr %6, align 8, !dbg !6532
  %47 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 20, i16 noundef signext %45, i16 noundef signext 0, ptr noundef %46, i32 noundef 0, i32 noundef 65536), !dbg !6533
  %48 = load ptr, ptr %5, align 8, !dbg !6534
  call void @_Z14explode_objectP6objecti(ptr noundef %48, i32 noundef 0), !dbg !6535
  %49 = load ptr, ptr %4, align 8, !dbg !6536
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 2, !dbg !6538
  %51 = load i8, ptr %50, align 1, !dbg !6538
  %52 = zext i8 %51 to i64, !dbg !6539
  %53 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %52, !dbg !6539
  %54 = getelementptr inbounds nuw %struct.weapon_info, ptr %53, i32 0, i32 37, !dbg !6540
  %55 = load i32, ptr %54, align 4, !dbg !6540
  %56 = icmp ne i32 %55, 0, !dbg !6539
  br i1 %56, label %57, label %61, !dbg !6539

57:                                               ; preds = %42
  %58 = load ptr, ptr %4, align 8, !dbg !6541
  %59 = load ptr, ptr %6, align 8, !dbg !6542
  %60 = call noundef ptr @_Z21explode_badass_weaponP6objectP10vms_vector(ptr noundef %58, ptr noundef %59), !dbg !6543
  br label %61, !dbg !6543

61:                                               ; preds = %57, %42
  %62 = load ptr, ptr %4, align 8, !dbg !6544
  %63 = load ptr, ptr %5, align 8, !dbg !6545
  call void @_Z17maybe_kill_weaponP6objectS0_(ptr noundef %62, ptr noundef %63), !dbg !6546
  %64 = load ptr, ptr %4, align 8, !dbg !6547
  %65 = getelementptr inbounds nuw %struct.object, ptr %64, i32 0, i32 8, !dbg !6548
  %66 = load i8, ptr %65, align 1, !dbg !6549
  %67 = zext i8 %66 to i32, !dbg !6549
  %68 = or i32 %67, 2, !dbg !6549
  %69 = trunc i32 %68 to i8, !dbg !6549
  store i8 %69, ptr %65, align 1, !dbg !6549
  br label %70, !dbg !6550

70:                                               ; preds = %61, %35, %28
  br label %71, !dbg !6551

71:                                               ; preds = %70, %26
  ret void, !dbg !6552
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19collide_two_objectsP6objectS0_P10vms_vector(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !6553 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6554, !DIExpression(), !6555)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6556, !DIExpression(), !6557)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6558, !DIExpression(), !6559)
    #dbg_declare(ptr %7, !6560, !DIExpression(), !6561)
  %8 = load ptr, ptr %4, align 8, !dbg !6562
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 1, !dbg !6562
  %10 = load i8, ptr %9, align 4, !dbg !6562
  %11 = zext i8 %10 to i32, !dbg !6562
  %12 = shl i32 %11, 8, !dbg !6562
  %13 = load ptr, ptr %5, align 8, !dbg !6562
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 1, !dbg !6562
  %15 = load i8, ptr %14, align 4, !dbg !6562
  %16 = zext i8 %15 to i32, !dbg !6562
  %17 = add nsw i32 %12, %16, !dbg !6562
  store i32 %17, ptr %7, align 4, !dbg !6563
  %18 = load i32, ptr %7, align 4, !dbg !6564
  switch i32 %18, label %189 [
    i32 257, label %19
    i32 514, label %20
    i32 771, label %24
    i32 1028, label %25
    i32 1285, label %29
    i32 1542, label %33
    i32 1799, label %34
    i32 2056, label %35
    i32 3855, label %36
    i32 258, label %37
    i32 513, label %38
    i32 259, label %39
    i32 769, label %40
    i32 260, label %41
    i32 1025, label %42
    i32 261, label %43
    i32 1281, label %44
    i32 262, label %45
    i32 1537, label %46
    i32 263, label %47
    i32 1793, label %48
    i32 264, label %49
    i32 2049, label %50
    i32 515, label %51
    i32 770, label %52
    i32 516, label %53
    i32 1026, label %57
    i32 517, label %61
    i32 1282, label %65
    i32 518, label %69
    i32 1538, label %70
    i32 519, label %71
    i32 1794, label %72
    i32 520, label %73
    i32 2050, label %74
    i32 772, label %75
    i32 1027, label %79
    i32 773, label %83
    i32 1283, label %84
    i32 774, label %85
    i32 1539, label %86
    i32 775, label %87
    i32 1795, label %88
    i32 776, label %89
    i32 2051, label %90
    i32 1029, label %91
    i32 1284, label %95
    i32 1030, label %99
    i32 1540, label %100
    i32 1031, label %101
    i32 1796, label %105
    i32 1032, label %109
    i32 2052, label %110
    i32 1033, label %111
    i32 2308, label %115
    i32 1035, label %119
    i32 2820, label %123
    i32 1286, label %127
    i32 1541, label %128
    i32 1287, label %129
    i32 1797, label %130
    i32 1288, label %131
    i32 2053, label %135
    i32 1543, label %139
    i32 1798, label %140
    i32 1544, label %141
    i32 2054, label %142
    i32 1800, label %143
    i32 2055, label %144
    i32 1289, label %145
    i32 2309, label %149
    i32 521, label %153
    i32 2306, label %157
    i32 1291, label %161
    i32 2821, label %165
    i32 3844, label %169
    i32 1039, label %173
    i32 3842, label %177
    i32 527, label %178
    i32 3843, label %179
    i32 783, label %180
    i32 3845, label %181
    i32 1295, label %182
    i32 3846, label %183
    i32 1551, label %184
    i32 3847, label %185
    i32 1807, label %186
    i32 3848, label %187
    i32 2063, label %188
  ], !dbg !6565

19:                                               ; preds = %3
  br label %190, !dbg !6566

20:                                               ; preds = %3
  %21 = load ptr, ptr %4, align 8, !dbg !6568
  %22 = load ptr, ptr %5, align 8, !dbg !6568
  %23 = load ptr, ptr %6, align 8, !dbg !6568
  call void @_Z23collide_robot_and_robotP6objectS0_P10vms_vector(ptr noundef %21, ptr noundef %22, ptr noundef %23), !dbg !6568
  br label %190, !dbg !6568

24:                                               ; preds = %3
  br label %190, !dbg !6569

25:                                               ; preds = %3
  %26 = load ptr, ptr %4, align 8, !dbg !6570
  %27 = load ptr, ptr %5, align 8, !dbg !6570
  %28 = load ptr, ptr %6, align 8, !dbg !6570
  call void @_Z25collide_player_and_playerP6objectS0_P10vms_vector(ptr noundef %26, ptr noundef %27, ptr noundef %28), !dbg !6570
  br label %190, !dbg !6570

29:                                               ; preds = %3
  %30 = load ptr, ptr %4, align 8, !dbg !6571
  %31 = load ptr, ptr %5, align 8, !dbg !6571
  %32 = load ptr, ptr %6, align 8, !dbg !6571
  call void @_Z25collide_weapon_and_weaponP6objectS0_P10vms_vector(ptr noundef %30, ptr noundef %31, ptr noundef %32), !dbg !6571
  br label %190, !dbg !6571

33:                                               ; preds = %3
  br label %190, !dbg !6572

34:                                               ; preds = %3
  br label %190, !dbg !6573

35:                                               ; preds = %3
  br label %190, !dbg !6574

36:                                               ; preds = %3
  br label %190, !dbg !6575

37:                                               ; preds = %3
  br label %190, !dbg !6576

38:                                               ; preds = %3
  br label %190, !dbg !6576

39:                                               ; preds = %3
  br label %190, !dbg !6577

40:                                               ; preds = %3
  br label %190, !dbg !6577

41:                                               ; preds = %3
  br label %190, !dbg !6578

42:                                               ; preds = %3
  br label %190, !dbg !6578

43:                                               ; preds = %3
  br label %190, !dbg !6579

44:                                               ; preds = %3
  br label %190, !dbg !6579

45:                                               ; preds = %3
  br label %190, !dbg !6580

46:                                               ; preds = %3
  br label %190, !dbg !6580

47:                                               ; preds = %3
  br label %190, !dbg !6581

48:                                               ; preds = %3
  br label %190, !dbg !6581

49:                                               ; preds = %3
  br label %190, !dbg !6582

50:                                               ; preds = %3
  br label %190, !dbg !6582

51:                                               ; preds = %3
  br label %190, !dbg !6583

52:                                               ; preds = %3
  br label %190, !dbg !6583

53:                                               ; preds = %3
  %54 = load ptr, ptr %4, align 8, !dbg !6584
  %55 = load ptr, ptr %5, align 8, !dbg !6584
  %56 = load ptr, ptr %6, align 8, !dbg !6584
  call void @_Z24collide_robot_and_playerP6objectS0_P10vms_vector(ptr noundef %54, ptr noundef %55, ptr noundef %56), !dbg !6584
  br label %190, !dbg !6584

57:                                               ; preds = %3
  %58 = load ptr, ptr %5, align 8, !dbg !6584
  %59 = load ptr, ptr %4, align 8, !dbg !6584
  %60 = load ptr, ptr %6, align 8, !dbg !6584
  call void @_Z24collide_robot_and_playerP6objectS0_P10vms_vector(ptr noundef %58, ptr noundef %59, ptr noundef %60), !dbg !6584
  br label %190, !dbg !6584

61:                                               ; preds = %3
  %62 = load ptr, ptr %4, align 8, !dbg !6585
  %63 = load ptr, ptr %5, align 8, !dbg !6585
  %64 = load ptr, ptr %6, align 8, !dbg !6585
  call void @_Z24collide_robot_and_weaponP6objectS0_P10vms_vector(ptr noundef %62, ptr noundef %63, ptr noundef %64), !dbg !6585
  br label %190, !dbg !6585

65:                                               ; preds = %3
  %66 = load ptr, ptr %5, align 8, !dbg !6585
  %67 = load ptr, ptr %4, align 8, !dbg !6585
  %68 = load ptr, ptr %6, align 8, !dbg !6585
  call void @_Z24collide_robot_and_weaponP6objectS0_P10vms_vector(ptr noundef %66, ptr noundef %67, ptr noundef %68), !dbg !6585
  br label %190, !dbg !6585

69:                                               ; preds = %3
  br label %190, !dbg !6586

70:                                               ; preds = %3
  br label %190, !dbg !6586

71:                                               ; preds = %3
  br label %190, !dbg !6587

72:                                               ; preds = %3
  br label %190, !dbg !6587

73:                                               ; preds = %3
  br label %190, !dbg !6588

74:                                               ; preds = %3
  br label %190, !dbg !6588

75:                                               ; preds = %3
  %76 = load ptr, ptr %4, align 8, !dbg !6589
  %77 = load ptr, ptr %5, align 8, !dbg !6589
  %78 = load ptr, ptr %6, align 8, !dbg !6589
  call void @_Z26collide_hostage_and_playerP6objectS0_P10vms_vector(ptr noundef %76, ptr noundef %77, ptr noundef %78), !dbg !6589
  br label %190, !dbg !6589

79:                                               ; preds = %3
  %80 = load ptr, ptr %5, align 8, !dbg !6589
  %81 = load ptr, ptr %4, align 8, !dbg !6589
  %82 = load ptr, ptr %6, align 8, !dbg !6589
  call void @_Z26collide_hostage_and_playerP6objectS0_P10vms_vector(ptr noundef %80, ptr noundef %81, ptr noundef %82), !dbg !6589
  br label %190, !dbg !6589

83:                                               ; preds = %3
  br label %190, !dbg !6590

84:                                               ; preds = %3
  br label %190, !dbg !6590

85:                                               ; preds = %3
  br label %190, !dbg !6591

86:                                               ; preds = %3
  br label %190, !dbg !6591

87:                                               ; preds = %3
  br label %190, !dbg !6592

88:                                               ; preds = %3
  br label %190, !dbg !6592

89:                                               ; preds = %3
  br label %190, !dbg !6593

90:                                               ; preds = %3
  br label %190, !dbg !6593

91:                                               ; preds = %3
  %92 = load ptr, ptr %4, align 8, !dbg !6594
  %93 = load ptr, ptr %5, align 8, !dbg !6594
  %94 = load ptr, ptr %6, align 8, !dbg !6594
  call void @_Z25collide_player_and_weaponP6objectS0_P10vms_vector(ptr noundef %92, ptr noundef %93, ptr noundef %94), !dbg !6594
  br label %190, !dbg !6594

95:                                               ; preds = %3
  %96 = load ptr, ptr %5, align 8, !dbg !6594
  %97 = load ptr, ptr %4, align 8, !dbg !6594
  %98 = load ptr, ptr %6, align 8, !dbg !6594
  call void @_Z25collide_player_and_weaponP6objectS0_P10vms_vector(ptr noundef %96, ptr noundef %97, ptr noundef %98), !dbg !6594
  br label %190, !dbg !6594

99:                                               ; preds = %3
  br label %190, !dbg !6595

100:                                              ; preds = %3
  br label %190, !dbg !6595

101:                                              ; preds = %3
  %102 = load ptr, ptr %4, align 8, !dbg !6596
  %103 = load ptr, ptr %5, align 8, !dbg !6596
  %104 = load ptr, ptr %6, align 8, !dbg !6596
  call void @_Z26collide_player_and_powerupP6objectS0_P10vms_vector(ptr noundef %102, ptr noundef %103, ptr noundef %104), !dbg !6596
  br label %190, !dbg !6596

105:                                              ; preds = %3
  %106 = load ptr, ptr %5, align 8, !dbg !6596
  %107 = load ptr, ptr %4, align 8, !dbg !6596
  %108 = load ptr, ptr %6, align 8, !dbg !6596
  call void @_Z26collide_player_and_powerupP6objectS0_P10vms_vector(ptr noundef %106, ptr noundef %107, ptr noundef %108), !dbg !6596
  br label %190, !dbg !6596

109:                                              ; preds = %3
  br label %190, !dbg !6597

110:                                              ; preds = %3
  br label %190, !dbg !6597

111:                                              ; preds = %3
  %112 = load ptr, ptr %4, align 8, !dbg !6598
  %113 = load ptr, ptr %5, align 8, !dbg !6598
  %114 = load ptr, ptr %6, align 8, !dbg !6598
  call void @_Z29collide_player_and_controlcenP6objectS0_P10vms_vector(ptr noundef %112, ptr noundef %113, ptr noundef %114), !dbg !6598
  br label %190, !dbg !6598

115:                                              ; preds = %3
  %116 = load ptr, ptr %5, align 8, !dbg !6598
  %117 = load ptr, ptr %4, align 8, !dbg !6598
  %118 = load ptr, ptr %6, align 8, !dbg !6598
  call void @_Z29collide_player_and_controlcenP6objectS0_P10vms_vector(ptr noundef %116, ptr noundef %117, ptr noundef %118), !dbg !6598
  br label %190, !dbg !6598

119:                                              ; preds = %3
  %120 = load ptr, ptr %4, align 8, !dbg !6599
  %121 = load ptr, ptr %5, align 8, !dbg !6599
  %122 = load ptr, ptr %6, align 8, !dbg !6599
  call void @_Z26collide_player_and_clutterP6objectS0_P10vms_vector(ptr noundef %120, ptr noundef %121, ptr noundef %122), !dbg !6599
  br label %190, !dbg !6599

123:                                              ; preds = %3
  %124 = load ptr, ptr %5, align 8, !dbg !6599
  %125 = load ptr, ptr %4, align 8, !dbg !6599
  %126 = load ptr, ptr %6, align 8, !dbg !6599
  call void @_Z26collide_player_and_clutterP6objectS0_P10vms_vector(ptr noundef %124, ptr noundef %125, ptr noundef %126), !dbg !6599
  br label %190, !dbg !6599

127:                                              ; preds = %3
  br label %190, !dbg !6600

128:                                              ; preds = %3
  br label %190, !dbg !6600

129:                                              ; preds = %3
  br label %190, !dbg !6601

130:                                              ; preds = %3
  br label %190, !dbg !6601

131:                                              ; preds = %3
  %132 = load ptr, ptr %4, align 8, !dbg !6602
  %133 = load ptr, ptr %5, align 8, !dbg !6602
  %134 = load ptr, ptr %6, align 8, !dbg !6602
  call void @_Z25collide_weapon_and_debrisP6objectS0_P10vms_vector(ptr noundef %132, ptr noundef %133, ptr noundef %134), !dbg !6602
  br label %190, !dbg !6602

135:                                              ; preds = %3
  %136 = load ptr, ptr %5, align 8, !dbg !6602
  %137 = load ptr, ptr %4, align 8, !dbg !6602
  %138 = load ptr, ptr %6, align 8, !dbg !6602
  call void @_Z25collide_weapon_and_debrisP6objectS0_P10vms_vector(ptr noundef %136, ptr noundef %137, ptr noundef %138), !dbg !6602
  br label %190, !dbg !6602

139:                                              ; preds = %3
  br label %190, !dbg !6603

140:                                              ; preds = %3
  br label %190, !dbg !6603

141:                                              ; preds = %3
  br label %190, !dbg !6604

142:                                              ; preds = %3
  br label %190, !dbg !6604

143:                                              ; preds = %3
  br label %190, !dbg !6605

144:                                              ; preds = %3
  br label %190, !dbg !6605

145:                                              ; preds = %3
  %146 = load ptr, ptr %4, align 8, !dbg !6606
  %147 = load ptr, ptr %5, align 8, !dbg !6606
  %148 = load ptr, ptr %6, align 8, !dbg !6606
  call void @_Z29collide_weapon_and_controlcenP6objectS0_P10vms_vector(ptr noundef %146, ptr noundef %147, ptr noundef %148), !dbg !6606
  br label %190, !dbg !6606

149:                                              ; preds = %3
  %150 = load ptr, ptr %5, align 8, !dbg !6606
  %151 = load ptr, ptr %4, align 8, !dbg !6606
  %152 = load ptr, ptr %6, align 8, !dbg !6606
  call void @_Z29collide_weapon_and_controlcenP6objectS0_P10vms_vector(ptr noundef %150, ptr noundef %151, ptr noundef %152), !dbg !6606
  br label %190, !dbg !6606

153:                                              ; preds = %3
  %154 = load ptr, ptr %4, align 8, !dbg !6607
  %155 = load ptr, ptr %5, align 8, !dbg !6607
  %156 = load ptr, ptr %6, align 8, !dbg !6607
  call void @_Z28collide_robot_and_controlcenP6objectS0_P10vms_vector(ptr noundef %154, ptr noundef %155, ptr noundef %156), !dbg !6607
  br label %190, !dbg !6607

157:                                              ; preds = %3
  %158 = load ptr, ptr %5, align 8, !dbg !6607
  %159 = load ptr, ptr %4, align 8, !dbg !6607
  %160 = load ptr, ptr %6, align 8, !dbg !6607
  call void @_Z28collide_robot_and_controlcenP6objectS0_P10vms_vector(ptr noundef %158, ptr noundef %159, ptr noundef %160), !dbg !6607
  br label %190, !dbg !6607

161:                                              ; preds = %3
  %162 = load ptr, ptr %4, align 8, !dbg !6608
  %163 = load ptr, ptr %5, align 8, !dbg !6608
  %164 = load ptr, ptr %6, align 8, !dbg !6608
  call void @_Z26collide_weapon_and_clutterP6objectS0_P10vms_vector(ptr noundef %162, ptr noundef %163, ptr noundef %164), !dbg !6608
  br label %190, !dbg !6608

165:                                              ; preds = %3
  %166 = load ptr, ptr %5, align 8, !dbg !6608
  %167 = load ptr, ptr %4, align 8, !dbg !6608
  %168 = load ptr, ptr %6, align 8, !dbg !6608
  call void @_Z26collide_weapon_and_clutterP6objectS0_P10vms_vector(ptr noundef %166, ptr noundef %167, ptr noundef %168), !dbg !6608
  br label %190, !dbg !6608

169:                                              ; preds = %3
  %170 = load ptr, ptr %4, align 8, !dbg !6609
  %171 = load ptr, ptr %5, align 8, !dbg !6609
  %172 = load ptr, ptr %6, align 8, !dbg !6609
  call void @_Z25collide_player_and_markerP6objectS0_P10vms_vector(ptr noundef %170, ptr noundef %171, ptr noundef %172), !dbg !6609
  br label %190, !dbg !6609

173:                                              ; preds = %3
  %174 = load ptr, ptr %5, align 8, !dbg !6609
  %175 = load ptr, ptr %4, align 8, !dbg !6609
  %176 = load ptr, ptr %6, align 8, !dbg !6609
  call void @_Z25collide_player_and_markerP6objectS0_P10vms_vector(ptr noundef %174, ptr noundef %175, ptr noundef %176), !dbg !6609
  br label %190, !dbg !6609

177:                                              ; preds = %3
  br label %190, !dbg !6610

178:                                              ; preds = %3
  br label %190, !dbg !6610

179:                                              ; preds = %3
  br label %190, !dbg !6611

180:                                              ; preds = %3
  br label %190, !dbg !6611

181:                                              ; preds = %3
  br label %190, !dbg !6612

182:                                              ; preds = %3
  br label %190, !dbg !6612

183:                                              ; preds = %3
  br label %190, !dbg !6613

184:                                              ; preds = %3
  br label %190, !dbg !6613

185:                                              ; preds = %3
  br label %190, !dbg !6614

186:                                              ; preds = %3
  br label %190, !dbg !6614

187:                                              ; preds = %3
  br label %190, !dbg !6615

188:                                              ; preds = %3
  br label %190, !dbg !6615

189:                                              ; preds = %3
  call void @_Z4Int3v(), !dbg !6616
  br label %190, !dbg !6617

190:                                              ; preds = %189, %188, %187, %186, %185, %184, %183, %182, %181, %180, %179, %178, %177, %173, %169, %165, %161, %157, %153, %149, %145, %144, %143, %142, %141, %140, %139, %135, %131, %130, %129, %128, %127, %123, %119, %115, %111, %110, %109, %105, %101, %100, %99, %95, %91, %90, %89, %88, %87, %86, %85, %84, %83, %79, %75, %74, %73, %72, %71, %70, %69, %65, %61, %57, %53, %52, %51, %50, %49, %48, %47, %46, %45, %44, %43, %42, %41, %40, %39, %38, %37, %36, %35, %34, %33, %29, %25, %24, %20, %19
  ret void, !dbg !6618
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z12collide_initv() #2 !dbg !6619 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !6620, !DIExpression(), !6621)
    #dbg_declare(ptr %2, !6622, !DIExpression(), !6623)
  store i32 0, ptr %1, align 4, !dbg !6624
  br label %3, !dbg !6626

3:                                                ; preds = %21, %0
  %4 = load i32, ptr %1, align 4, !dbg !6627
  %5 = icmp slt i32 %4, 16, !dbg !6629
  br i1 %5, label %6, label %24, !dbg !6630

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4, !dbg !6631
  br label %7, !dbg !6633

7:                                                ; preds = %17, %6
  %8 = load i32, ptr %2, align 4, !dbg !6634
  %9 = icmp slt i32 %8, 16, !dbg !6636
  br i1 %9, label %10, label %20, !dbg !6637

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4, !dbg !6638
  %12 = sext i32 %11 to i64, !dbg !6639
  %13 = getelementptr inbounds [16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 %12, !dbg !6639
  %14 = load i32, ptr %2, align 4, !dbg !6640
  %15 = sext i32 %14 to i64, !dbg !6639
  %16 = getelementptr inbounds [16 x i8], ptr %13, i64 0, i64 %15, !dbg !6639
  store i8 0, ptr %16, align 1, !dbg !6641
  br label %17, !dbg !6639

17:                                               ; preds = %10
  %18 = load i32, ptr %2, align 4, !dbg !6642
  %19 = add nsw i32 %18, 1, !dbg !6642
  store i32 %19, ptr %2, align 4, !dbg !6642
  br label %7, !dbg !6643, !llvm.loop !6644

20:                                               ; preds = %7
  br label %21, !dbg !6645

21:                                               ; preds = %20
  %22 = load i32, ptr %1, align 4, !dbg !6646
  %23 = add nsw i32 %22, 1, !dbg !6646
  store i32 %23, ptr %1, align 4, !dbg !6646
  br label %3, !dbg !6647, !llvm.loop !6648

24:                                               ; preds = %3
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr @CollisionResult, i64 0, i64 2), align 1, !dbg !6650
  store i8 1, ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), align 1, !dbg !6650
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr @CollisionResult, i64 0, i64 5), align 1, !dbg !6651
  store i8 1, ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), align 1, !dbg !6651
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr @CollisionResult, i64 0, i64 4), align 1, !dbg !6652
  store i8 1, ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), align 1, !dbg !6652
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 1), align 1, !dbg !6653
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 1), align 1, !dbg !6653
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 2), align 1, !dbg !6654
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 2), align 1, !dbg !6654
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 3), align 1, !dbg !6655
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 3), align 1, !dbg !6655
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 4), align 1, !dbg !6656
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 4), align 1, !dbg !6656
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 5), align 1, !dbg !6657
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 5), align 1, !dbg !6657
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 6), align 1, !dbg !6658
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 6), align 1, !dbg !6658
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 7), align 1, !dbg !6659
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 7), align 1, !dbg !6659
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 8), align 1, !dbg !6660
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 8), align 1, !dbg !6660
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 2), align 1, !dbg !6661
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 1), align 1, !dbg !6661
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 3), align 1, !dbg !6662
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 1), align 1, !dbg !6662
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 4), align 1, !dbg !6663
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 1), align 1, !dbg !6663
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 5), align 1, !dbg !6664
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 1), align 1, !dbg !6664
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 6), align 1, !dbg !6665
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 1), align 1, !dbg !6665
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 7), align 1, !dbg !6666
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 1), align 1, !dbg !6666
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 1), i64 0, i64 8), align 1, !dbg !6667
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 1), align 1, !dbg !6667
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 3), align 1, !dbg !6668
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 2), align 1, !dbg !6668
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 4), align 1, !dbg !6669
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 2), align 1, !dbg !6669
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 5), align 1, !dbg !6670
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 2), align 1, !dbg !6670
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 6), align 1, !dbg !6671
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 2), align 1, !dbg !6671
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 7), align 1, !dbg !6672
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 2), align 1, !dbg !6672
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 8), align 1, !dbg !6673
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 2), align 1, !dbg !6673
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 4), align 1, !dbg !6674
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 3), align 1, !dbg !6674
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 5), align 1, !dbg !6675
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 3), align 1, !dbg !6675
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 6), align 1, !dbg !6676
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 3), align 1, !dbg !6676
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 7), align 1, !dbg !6677
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 3), align 1, !dbg !6677
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 3), i64 0, i64 8), align 1, !dbg !6678
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 3), align 1, !dbg !6678
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 5), align 1, !dbg !6679
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 4), align 1, !dbg !6679
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 6), align 1, !dbg !6680
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 4), align 1, !dbg !6680
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 7), align 1, !dbg !6681
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 4), align 1, !dbg !6681
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 8), align 1, !dbg !6682
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 4), align 1, !dbg !6682
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 6), align 1, !dbg !6683
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 5), align 1, !dbg !6683
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 7), align 1, !dbg !6684
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 5), align 1, !dbg !6684
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 8), align 1, !dbg !6685
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 5), align 1, !dbg !6685
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 7), align 1, !dbg !6686
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 6), align 1, !dbg !6686
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 6), i64 0, i64 8), align 1, !dbg !6687
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 6), align 1, !dbg !6687
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), i64 0, i64 8), align 1, !dbg !6688
  store i8 0, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 8), i64 0, i64 7), align 1, !dbg !6688
  store i8 1, ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 7), align 1, !dbg !6689
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr @CollisionResult, i64 0, i64 7), align 1, !dbg !6689
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 9), align 1, !dbg !6690
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 9), i64 0, i64 5), align 1, !dbg !6690
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 5), i64 0, i64 11), align 1, !dbg !6691
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 11), i64 0, i64 5), align 1, !dbg !6691
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 9), align 1, !dbg !6692
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 9), i64 0, i64 4), align 1, !dbg !6692
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 2), i64 0, i64 9), align 1, !dbg !6693
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 9), i64 0, i64 2), align 1, !dbg !6693
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 11), align 1, !dbg !6694
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 11), i64 0, i64 4), align 1, !dbg !6694
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 4), i64 0, i64 15), align 1, !dbg !6695
  store i8 1, ptr getelementptr inbounds ([16 x i8], ptr getelementptr inbounds ([16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 15), i64 0, i64 4), align 1, !dbg !6695
  ret void, !dbg !6696
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24collide_object_with_wallP6objectissP10vms_vector(ptr noundef %0, i32 noundef %1, i16 noundef signext %2, i16 noundef signext %3, ptr noundef %4) #0 !dbg !6697 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !6698, !DIExpression(), !6699)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !6700, !DIExpression(), !6701)
  store i16 %2, ptr %8, align 2
    #dbg_declare(ptr %8, !6702, !DIExpression(), !6703)
  store i16 %3, ptr %9, align 2
    #dbg_declare(ptr %9, !6704, !DIExpression(), !6705)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !6706, !DIExpression(), !6707)
  %11 = load ptr, ptr %6, align 8, !dbg !6708
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 1, !dbg !6709
  %13 = load i8, ptr %12, align 4, !dbg !6709
  %14 = zext i8 %13 to i32, !dbg !6708
  switch i32 %14, label %45 [
    i32 255, label %15
    i32 4, label %16
    i32 5, label %22
    i32 8, label %28
    i32 1, label %34
    i32 2, label %35
    i32 3, label %41
    i32 6, label %42
    i32 7, label %43
    i32 12, label %44
  ], !dbg !6710

15:                                               ; preds = %5
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.25), !dbg !6711
  br label %46, !dbg !6713

16:                                               ; preds = %5
  %17 = load ptr, ptr %6, align 8, !dbg !6714
  %18 = load i32, ptr %7, align 4, !dbg !6715
  %19 = load i16, ptr %8, align 2, !dbg !6716
  %20 = load i16, ptr %9, align 2, !dbg !6717
  %21 = load ptr, ptr %10, align 8, !dbg !6718
  call void @_Z23collide_player_and_wallP6objectissP10vms_vector(ptr noundef %17, i32 noundef %18, i16 noundef signext %19, i16 noundef signext %20, ptr noundef %21), !dbg !6719
  br label %46, !dbg !6720

22:                                               ; preds = %5
  %23 = load ptr, ptr %6, align 8, !dbg !6721
  %24 = load i32, ptr %7, align 4, !dbg !6722
  %25 = load i16, ptr %8, align 2, !dbg !6723
  %26 = load i16, ptr %9, align 2, !dbg !6724
  %27 = load ptr, ptr %10, align 8, !dbg !6725
  call void @_Z23collide_weapon_and_wallP6objectissP10vms_vector(ptr noundef %23, i32 noundef %24, i16 noundef signext %25, i16 noundef signext %26, ptr noundef %27), !dbg !6726
  br label %46, !dbg !6727

28:                                               ; preds = %5
  %29 = load ptr, ptr %6, align 8, !dbg !6728
  %30 = load i32, ptr %7, align 4, !dbg !6729
  %31 = load i16, ptr %8, align 2, !dbg !6730
  %32 = load i16, ptr %9, align 2, !dbg !6731
  %33 = load ptr, ptr %10, align 8, !dbg !6732
  call void @_Z23collide_debris_and_wallP6objectissP10vms_vector(ptr noundef %29, i32 noundef %30, i16 noundef signext %31, i16 noundef signext %32, ptr noundef %33), !dbg !6733
  br label %46, !dbg !6734

34:                                               ; preds = %5
  br label %46, !dbg !6735

35:                                               ; preds = %5
  %36 = load ptr, ptr %6, align 8, !dbg !6736
  %37 = load i32, ptr %7, align 4, !dbg !6737
  %38 = load i16, ptr %8, align 2, !dbg !6738
  %39 = load i16, ptr %9, align 2, !dbg !6739
  %40 = load ptr, ptr %10, align 8, !dbg !6740
  call void @_Z22collide_robot_and_wallP6objectissP10vms_vector(ptr noundef %36, i32 noundef %37, i16 noundef signext %38, i16 noundef signext %39, ptr noundef %40), !dbg !6741
  br label %46, !dbg !6742

41:                                               ; preds = %5
  br label %46, !dbg !6743

42:                                               ; preds = %5
  br label %46, !dbg !6744

43:                                               ; preds = %5
  br label %46, !dbg !6745

44:                                               ; preds = %5
  br label %46, !dbg !6746

45:                                               ; preds = %5
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.26), !dbg !6747
  br label %46, !dbg !6748

46:                                               ; preds = %45, %44, %43, %42, %41, %35, %34, %28, %22, %16, %15
  ret void, !dbg !6749
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !6750 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6760, !DIExpression(), !6761)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6762, !DIExpression(), !6763)
    #dbg_declare(ptr %3, !6764, !DIExpression(), !6765)
  %6 = load ptr, ptr %5, align 8, !dbg !6766
  %7 = load ptr, ptr %4, align 8, !dbg !6767
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !6768
  br i1 %8, label %9, label %11, !dbg !6768

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !6769
  br label %13, !dbg !6768

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !6770
  br label %13, !dbg !6768

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !6768
  ret ptr %14, !dbg !6771
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #2 !dbg !6772 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6780, !DIExpression(), !6782)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6783, !DIExpression(), !6784)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6785, !DIExpression(), !6786)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !6787
  %9 = load i32, ptr %8, align 4, !dbg !6787
  %10 = load ptr, ptr %6, align 8, !dbg !6788
  %11 = load i32, ptr %10, align 4, !dbg !6788
  %12 = icmp slt i32 %9, %11, !dbg !6789
  ret i1 %12, !dbg !6790
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 2 dereferenceable(2) ptr @_ZNSt3__13minB8ne200100ItNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 2 dereferenceable(2) %0, ptr noundef nonnull align 2 dereferenceable(2) %1) #0 !dbg !6791 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6795, !DIExpression(), !6796)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6797, !DIExpression(), !6798)
    #dbg_declare(ptr %3, !6799, !DIExpression(), !6800)
  %6 = load ptr, ptr %5, align 8, !dbg !6801
  %7 = load ptr, ptr %4, align 8, !dbg !6802
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IttEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 2 dereferenceable(2) %6, ptr noundef nonnull align 2 dereferenceable(2) %7), !dbg !6803
  br i1 %8, label %9, label %11, !dbg !6803

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !6804
  br label %13, !dbg !6803

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !6805
  br label %13, !dbg !6803

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !6803
  ret ptr %14, !dbg !6806
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IttEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 2 dereferenceable(2) %1, ptr noundef nonnull align 2 dereferenceable(2) %2) #2 !dbg !6807 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !6813, !DIExpression(), !6814)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !6815, !DIExpression(), !6816)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !6817, !DIExpression(), !6818)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !6819
  %9 = load i16, ptr %8, align 2, !dbg !6819
  %10 = zext i16 %9 to i32, !dbg !6819
  %11 = load ptr, ptr %6, align 8, !dbg !6820
  %12 = load i16, ptr %11, align 2, !dbg !6820
  %13 = zext i16 %12 to i32, !dbg !6820
  %14 = icmp slt i32 %10, %13, !dbg !6821
  ret i1 %14, !dbg !6822
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!1456, !1457, !1458, !1459, !1460, !1461, !1462}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1463}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Monster_mode", scope: !2, file: !25, line: 166, type: !28, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !22, imports: !162, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/collide.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "11cbcd57389429fc9a85e64e09757f45")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "LogicVer", file: !6, line: 56, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS8LogicVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "SHAREWARE", value: 0)
!10 = !DIEnumerator(name: "FULL_1_0", value: 1)
!11 = !DIEnumerator(name: "FULL_1_1", value: 2)
!12 = !DIEnumerator(name: "FULL_1_2", value: 3)
!13 = !{!14, !15, !19}
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !16, line: 20, baseType: !17)
!16 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !18, line: 30, baseType: !7)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !20, line: 30, baseType: !21)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!21 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!22 = !{!0, !23, !31, !36, !38, !40, !45, !50, !55, !60, !65, !70, !75, !80, !82, !84, !89, !94, !99, !101, !106, !108, !110, !112, !114, !116, !118, !123, !125, !130, !135, !137, !142, !147, !149, !154, !159}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !25, line: 289, type: !26, isLocal: true, isDefinition: true)
!25 = !DIFile(filename: "main_d2/collide.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "11cbcd57389429fc9a85e64e09757f45")
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 248, elements: !29)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 31)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !25, line: 289, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 456, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 57)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "force_force", scope: !2, file: !25, line: 319, type: !15, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "Last_volatile_scrape_sound_time", scope: !2, file: !25, line: 422, type: !15, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !25, line: 434, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 192, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 24)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !25, line: 653, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 104, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 13)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !25, line: 662, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 376, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 47)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !25, line: 667, type: !57, isLocal: true, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 344, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 43)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !25, line: 705, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 496, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 62)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(scope: null, file: !25, line: 745, type: !67, isLocal: true, isDefinition: true)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 224, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 28)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(scope: null, file: !25, line: 747, type: !72, isLocal: true, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 272, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 34)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(scope: null, file: !25, line: 770, type: !77, isLocal: true, isDefinition: true)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 440, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 55)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(scope: null, file: !25, line: 771, type: !57, isLocal: true, isDefinition: true)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "Last_thief_hit_time", scope: !2, file: !25, line: 1055, type: !15, isLocal: false, isDefinition: true)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1194, type: !86, isLocal: true, isDefinition: true)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 512, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 64)
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1256, type: !91, isLocal: true, isDefinition: true)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 208, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 26)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1263, type: !96, isLocal: true, isDefinition: true)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 112, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 14)
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1268, type: !96, isLocal: true, isDefinition: true)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1270, type: !103, isLocal: true, isDefinition: true)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 80, elements: !104)
!104 = !{!105}
!105 = !DISubrange(count: 10)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(name: "Final_boss_is_dead", scope: !2, file: !25, line: 1394, type: !7, isLocal: false, isDefinition: true)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "Final_boss_countdown_time", scope: !2, file: !25, line: 1395, type: !15, isLocal: false, isDefinition: true)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1439, type: !96, isLocal: true, isDefinition: true)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "Boss_invulnerable_dot", scope: !2, file: !25, line: 1686, type: !15, isLocal: false, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "Buddy_gave_hint_count", scope: !2, file: !25, line: 1688, type: !7, isLocal: false, isDefinition: true)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(name: "Last_time_buddy_gave_hint", scope: !2, file: !25, line: 1689, type: !15, isLocal: false, isDefinition: true)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1702, type: !120, isLocal: true, isDefinition: true)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 448, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 56)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1723, type: !91, isLocal: true, isDefinition: true)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1744, type: !127, isLocal: true, isDefinition: true)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 168, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 21)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1745, type: !132, isLocal: true, isDefinition: true)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 200, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 25)
!135 = !DIGlobalVariableExpression(var: !136, expr: !DIExpression())
!136 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1746, type: !132, isLocal: true, isDefinition: true)
!137 = !DIGlobalVariableExpression(var: !138, expr: !DIExpression())
!138 = distinct !DIGlobalVariable(scope: null, file: !25, line: 1749, type: !139, isLocal: true, isDefinition: true)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 176, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 22)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !25, line: 2168, type: !144, isLocal: true, isDefinition: true)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 240, elements: !145)
!145 = !{!146}
!146 = !DISubrange(count: 30)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(scope: null, file: !25, line: 2223, type: !52, isLocal: true, isDefinition: true)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(scope: null, file: !25, line: 2886, type: !151, isLocal: true, isDefinition: true)
!151 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 280, elements: !152)
!152 = !{!153}
!153 = !DISubrange(count: 35)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(scope: null, file: !25, line: 2900, type: !156, isLocal: true, isDefinition: true)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 360, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 45)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!160 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !16, line: 18, type: !161, isLocal: true, isDefinition: true)
!161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!162 = !{!163, !170, !174, !175, !176, !180, !184, !187, !191, !194, !196, !198, !200, !202, !204, !206, !208, !210, !212, !214, !216, !218, !220, !222, !224, !230, !234, !237, !240, !245, !251, !253, !255, !257, !259, !261, !263, !265, !267, !269, !271, !273, !275, !277, !282, !287, !292, !297, !299, !302, !304, !306, !308, !310, !312, !314, !316, !318, !320, !324, !329, !333, !335, !339, !343, !356, !372, !373, !428, !437, !439, !447, !453, !457, !461, !463, !467, !471, !475, !479, !483, !487, !489, !491, !495, !501, !506, !510, !514, !518, !522, !526, !530, !534, !536, !538, !542, !544, !548, !552, !557, !559, !561, !563, !567, !571, !575, !577, !581, !583, !585, !587, !589, !595, !599, !601, !607, !612, !616, !620, !625, !630, !634, !638, !642, !646, !648, !650, !658, !660, !664, !668, !670, !672, !676, !680, !684, !686, !690, !695, !699, !703, !705, !707, !709, !711, !713, !715, !719, !723, !731, !733, !735, !737, !743, !745, !746, !747, !748, !751, !753, !758, !762, !764, !766, !770, !772, !774, !776, !778, !780, !782, !784, !789, !793, !795, !797, !798, !803, !805, !807, !809, !811, !813, !815, !817, !819, !821, !823, !825, !827, !829, !831, !833, !835, !839, !841, !843, !845, !849, !851, !855, !857, !859, !861, !863, !867, !869, !873, !877, !879, !881, !885, !887, !891, !893, !895, !899, !901, !903, !905, !907, !909, !911, !915, !917, !919, !921, !923, !925, !927, !929, !933, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !961, !963, !965, !967, !969, !971, !973, !975, !979, !981, !983, !985, !989, !991, !995, !997, !999, !1001, !1003, !1007, !1009, !1013, !1015, !1017, !1019, !1021, !1025, !1027, !1029, !1033, !1035, !1037, !1039, !1044, !1049, !1053, !1054, !1058, !1062, !1067, !1072, !1076, !1082, !1086, !1088, !1092, !1100, !1106, !1112, !1114, !1118, !1122, !1126, !1131, !1135, !1139, !1143, !1147, !1151, !1155, !1159, !1163, !1168, !1172, !1176, !1180, !1185, !1190, !1194, !1196, !1200, !1202, !1209, !1213, !1214, !1218, !1222, !1226, !1230, !1232, !1236, !1240, !1244, !1248, !1252, !1254, !1256, !1258, !1260, !1261, !1265, !1267, !1271, !1275, !1279, !1281, !1285, !1289, !1293, !1299, !1301, !1305, !1309, !1313, !1315, !1319, !1323, !1327, !1329, !1331, !1333, !1337, !1341, !1346, !1350, !1356, !1360, !1364, !1366, !1368, !1370, !1374, !1378, !1382, !1384, !1386, !1390, !1394, !1396, !1400, !1404, !1407, !1409, !1411, !1413, !1442, !1447, !1452}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !166, file: !169, line: 158)
!164 = !DINamespace(name: "__1", scope: !165, exportSymbols: true)
!165 = !DINamespace(name: "std", scope: null)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !167, line: 30, baseType: !168)
!167 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!168 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!169 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !171, file: !169, line: 159)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !172, line: 30, baseType: !173)
!172 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!173 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !17, file: !169, line: 160)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !19, file: !169, line: 161)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !177, file: !169, line: 163)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !178, line: 31, baseType: !179)
!178 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!179 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !181, file: !169, line: 164)
!181 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !182, line: 31, baseType: !183)
!182 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!183 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !185, file: !169, line: 165)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !186, line: 31, baseType: !14)
!186 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !188, file: !169, line: 166)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !189, line: 31, baseType: !190)
!189 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!190 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !192, file: !169, line: 168)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !193, line: 29, baseType: !166)
!193 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !195, file: !169, line: 169)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !193, line: 30, baseType: !171)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !197, file: !169, line: 170)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !193, line: 31, baseType: !17)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !199, file: !169, line: 171)
!199 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !193, line: 32, baseType: !19)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !201, file: !169, line: 173)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !193, line: 33, baseType: !177)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !203, file: !169, line: 174)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !193, line: 34, baseType: !181)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !205, file: !169, line: 175)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !193, line: 35, baseType: !185)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !207, file: !169, line: 176)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !193, line: 36, baseType: !188)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !209, file: !169, line: 178)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !193, line: 40, baseType: !166)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !211, file: !169, line: 179)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !193, line: 41, baseType: !171)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !213, file: !169, line: 180)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !193, line: 42, baseType: !17)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !215, file: !169, line: 181)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !193, line: 43, baseType: !19)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !217, file: !169, line: 183)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !193, line: 44, baseType: !177)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !219, file: !169, line: 184)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !193, line: 45, baseType: !181)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !221, file: !169, line: 185)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !193, line: 46, baseType: !185)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !223, file: !169, line: 186)
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !193, line: 47, baseType: !188)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !225, file: !169, line: 188)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !226, line: 32, baseType: !227)
!226 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !228, line: 40, baseType: !229)
!228 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!229 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !231, file: !169, line: 189)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !232, line: 34, baseType: !233)
!232 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!233 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !235, file: !169, line: 191)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !236, line: 32, baseType: !229)
!236 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !238, file: !169, line: 192)
!238 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !239, line: 32, baseType: !233)
!239 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !241, file: !244, line: 22)
!241 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !242, line: 16, baseType: !243)
!242 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!243 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!244 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !246, file: !250, line: 113)
!246 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !247, file: !247, line: 217, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!247 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!248 = !DISubroutineType(types: !249)
!249 = !{!7, !7}
!250 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !252, file: !250, line: 114)
!252 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !247, file: !247, line: 223, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !254, file: !250, line: 115)
!254 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !247, file: !247, line: 229, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !256, file: !250, line: 116)
!256 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !247, file: !247, line: 235, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !258, file: !250, line: 117)
!258 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !247, file: !247, line: 242, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !260, file: !250, line: 118)
!260 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !247, file: !247, line: 248, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !262, file: !250, line: 119)
!262 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !247, file: !247, line: 254, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !264, file: !250, line: 120)
!264 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !247, file: !247, line: 260, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !266, file: !250, line: 121)
!266 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !247, file: !247, line: 266, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !268, file: !250, line: 122)
!268 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !247, file: !247, line: 272, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !270, file: !250, line: 123)
!270 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !247, file: !247, line: 278, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !272, file: !250, line: 124)
!272 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !247, file: !247, line: 285, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !274, file: !250, line: 125)
!274 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !247, file: !247, line: 297, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !276, file: !250, line: 126)
!276 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !247, file: !247, line: 303, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !278, file: !281, line: 75)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !279, line: 32, baseType: !280)
!279 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!280 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !228, line: 111, baseType: !7)
!281 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !283, file: !281, line: 76)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !284, line: 32, baseType: !285)
!284 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !286, line: 44, baseType: !7)
!286 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !288, file: !281, line: 77)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !289, line: 32, baseType: !290)
!289 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !286, line: 46, baseType: !291)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !228, line: 36, baseType: !14)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !293, file: !281, line: 78)
!293 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !294, file: !294, line: 84, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!295 = !DISubroutineType(types: !296)
!296 = !{!7, !278}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !298, file: !281, line: 79)
!298 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !294, file: !294, line: 90, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !300, file: !281, line: 80)
!300 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !301, file: !301, line: 53, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!301 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !303, file: !281, line: 81)
!303 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !294, file: !294, line: 96, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !305, file: !281, line: 82)
!305 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !294, file: !294, line: 108, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !307, file: !281, line: 83)
!307 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !294, file: !294, line: 114, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !309, file: !281, line: 84)
!309 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !294, file: !294, line: 120, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !311, file: !281, line: 85)
!311 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !294, file: !294, line: 126, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !313, file: !281, line: 86)
!313 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !294, file: !294, line: 132, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !315, file: !281, line: 87)
!315 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !294, file: !294, line: 138, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !317, file: !281, line: 88)
!317 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !294, file: !294, line: 144, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !319, file: !281, line: 89)
!319 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !294, file: !294, line: 150, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !321, file: !281, line: 90)
!321 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !294, file: !294, line: 102, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DISubroutineType(types: !323)
!323 = !{!7, !278, !288}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !325, file: !281, line: 91)
!325 = !DISubprogram(name: "wctype", scope: !294, file: !294, line: 190, type: !326, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DISubroutineType(types: !327)
!327 = !{!288, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !330, file: !281, line: 92)
!330 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !294, file: !294, line: 156, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{!278, !278}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !334, file: !281, line: 93)
!334 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !294, file: !294, line: 162, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !336, file: !281, line: 94)
!336 = !DISubprogram(name: "towctrans", scope: !301, file: !301, line: 124, type: !337, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DISubroutineType(types: !338)
!338 = !{!278, !278, !283}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !340, file: !281, line: 95)
!340 = !DISubprogram(name: "wctrans", scope: !301, file: !301, line: 126, type: !341, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DISubroutineType(types: !342)
!342 = !{!283, !328}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !344, file: !355, line: 133)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !345, line: 32, baseType: !346)
!345 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !228, line: 72, baseType: !347)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !228, line: 70, baseType: !348)
!348 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !228, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !349, identifier: "_ZTS11__mbstate_t")
!349 = !{!350, !354}
!350 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !348, file: !228, line: 68, baseType: !351, size: 1024)
!351 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 1024, elements: !352)
!352 = !{!353}
!353 = !DISubrange(count: 128)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !348, file: !228, line: 69, baseType: !21, size: 64)
!355 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !357, file: !355, line: 134)
!357 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !358, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !359, identifier: "_ZTS2tm")
!358 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!359 = !{!360, !361, !362, !363, !364, !365, !366, !367, !368, !369, !370}
!360 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !357, file: !358, line: 79, baseType: !7, size: 32)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !357, file: !358, line: 80, baseType: !7, size: 32, offset: 32)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !357, file: !358, line: 81, baseType: !7, size: 32, offset: 64)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !357, file: !358, line: 82, baseType: !7, size: 32, offset: 96)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !357, file: !358, line: 83, baseType: !7, size: 32, offset: 128)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !357, file: !358, line: 84, baseType: !7, size: 32, offset: 160)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !357, file: !358, line: 85, baseType: !7, size: 32, offset: 192)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !357, file: !358, line: 86, baseType: !7, size: 32, offset: 224)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !357, file: !358, line: 87, baseType: !7, size: 32, offset: 256)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !357, file: !358, line: 88, baseType: !229, size: 64, offset: 320)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !357, file: !358, line: 89, baseType: !371, size: 64, offset: 384)
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !278, file: !355, line: 135)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !374, file: !355, line: 136)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !375, line: 162, baseType: !376)
!375 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!376 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !375, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !377, identifier: "_ZTS7__sFILE")
!377 = !{!378, !380, !381, !382, !383, !384, !389, !390, !392, !396, !400, !408, !412, !413, !416, !417, !421, !425, !426, !427}
!378 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !376, file: !375, line: 132, baseType: !379, size: 64)
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !376, file: !375, line: 133, baseType: !7, size: 32, offset: 64)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !376, file: !375, line: 134, baseType: !7, size: 32, offset: 96)
!382 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !376, file: !375, line: 135, baseType: !173, size: 16, offset: 128)
!383 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !376, file: !375, line: 136, baseType: !173, size: 16, offset: 144)
!384 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !376, file: !375, line: 137, baseType: !385, size: 128, offset: 192)
!385 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !375, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !386, identifier: "_ZTS6__sbuf")
!386 = !{!387, !388}
!387 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !385, file: !375, line: 98, baseType: !379, size: 64)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !385, file: !375, line: 99, baseType: !7, size: 32, offset: 64)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !376, file: !375, line: 138, baseType: !7, size: 32, offset: 320)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !376, file: !375, line: 141, baseType: !391, size: 64, offset: 384)
!391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !376, file: !375, line: 142, baseType: !393, size: 64, offset: 448)
!393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !394, size: 64)
!394 = !DISubroutineType(types: !395)
!395 = !{!7, !391}
!396 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !376, file: !375, line: 143, baseType: !397, size: 64, offset: 512)
!397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !398, size: 64)
!398 = !DISubroutineType(types: !399)
!399 = !{!7, !391, !371, !7}
!400 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !376, file: !375, line: 144, baseType: !401, size: 64, offset: 576)
!401 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !402, size: 64)
!402 = !DISubroutineType(types: !403)
!403 = !{!404, !391, !404, !7}
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !375, line: 86, baseType: !405)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !406, line: 83, baseType: !407)
!406 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !228, line: 37, baseType: !21)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !376, file: !375, line: 145, baseType: !409, size: 64, offset: 640)
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!410 = !DISubroutineType(types: !411)
!411 = !{!7, !391, !328, !7}
!412 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !376, file: !375, line: 148, baseType: !385, size: 128, offset: 704)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !376, file: !375, line: 149, baseType: !414, size: 64, offset: 832)
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !415, size: 64)
!415 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !375, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!416 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !376, file: !375, line: 150, baseType: !7, size: 32, offset: 896)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !376, file: !375, line: 153, baseType: !418, size: 24, offset: 928)
!418 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 24, elements: !419)
!419 = !{!420}
!420 = !DISubrange(count: 3)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !376, file: !375, line: 154, baseType: !422, size: 8, offset: 952)
!422 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 8, elements: !423)
!423 = !{!424}
!424 = !DISubrange(count: 1)
!425 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !376, file: !375, line: 157, baseType: !385, size: 128, offset: 960)
!426 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !376, file: !375, line: 160, baseType: !7, size: 32, offset: 1088)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !376, file: !375, line: 161, baseType: !404, size: 64, offset: 1152)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !429, file: !355, line: 137)
!429 = !DISubprogram(name: "fwprintf", scope: !430, file: !430, line: 107, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!431 = !DISubroutineType(types: !432)
!432 = !{!7, !433, !434, null}
!433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !374, size: 64)
!434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64)
!435 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !436)
!436 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !438, file: !355, line: 138)
!438 = !DISubprogram(name: "fwscanf", scope: !430, file: !430, line: 108, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !440, file: !355, line: 139)
!440 = !DISubprogram(name: "swprintf", scope: !430, file: !430, line: 120, type: !441, flags: DIFlagPrototyped, spFlags: 0)
!441 = !DISubroutineType(types: !442)
!442 = !{!7, !443, !444, !434, null}
!443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !445, line: 50, baseType: !446)
!445 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!446 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !228, line: 87, baseType: !233)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !448, file: !355, line: 140)
!448 = !DISubprogram(name: "vfwprintf", scope: !430, file: !430, line: 124, type: !449, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DISubroutineType(types: !450)
!450 = !{!7, !433, !434, !451}
!451 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !228, line: 95, baseType: !452)
!452 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !25, baseType: !371)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !454, file: !355, line: 141)
!454 = !DISubprogram(name: "vswprintf", scope: !430, file: !430, line: 126, type: !455, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DISubroutineType(types: !456)
!456 = !{!7, !443, !444, !434, !451}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !458, file: !355, line: 142)
!458 = !DISubprogram(name: "swscanf", scope: !430, file: !430, line: 122, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{!7, !434, !434, null}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !462, file: !355, line: 143)
!462 = !DISubprogram(name: "vfwscanf", scope: !430, file: !430, line: 195, type: !449, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !464, file: !355, line: 144)
!464 = !DISubprogram(name: "vswscanf", scope: !430, file: !430, line: 197, type: !465, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DISubroutineType(types: !466)
!466 = !{!7, !434, !434, !451}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !468, file: !355, line: 145)
!468 = !DISubprogram(name: "fgetwc", scope: !430, file: !430, line: 100, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!278, !433}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !472, file: !355, line: 146)
!472 = !DISubprogram(name: "fgetws", scope: !430, file: !430, line: 102, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!443, !443, !7, !433}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !476, file: !355, line: 147)
!476 = !DISubprogram(name: "fputwc", scope: !430, file: !430, line: 104, type: !477, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DISubroutineType(types: !478)
!478 = !{!278, !436, !433}
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !480, file: !355, line: 148)
!480 = !DISubprogram(name: "fputws", scope: !430, file: !430, line: 105, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DISubroutineType(types: !482)
!482 = !{!7, !434, !433}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !484, file: !355, line: 149)
!484 = !DISubprogram(name: "fwide", scope: !430, file: !430, line: 106, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DISubroutineType(types: !486)
!486 = !{!7, !433, !7}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !488, file: !355, line: 150)
!488 = !DISubprogram(name: "getwc", scope: !430, file: !430, line: 109, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !490, file: !355, line: 151)
!490 = !DISubprogram(name: "putwc", scope: !430, file: !430, line: 118, type: !477, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !492, file: !355, line: 152)
!492 = !DISubprogram(name: "ungetwc", scope: !430, file: !430, line: 123, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DISubroutineType(types: !494)
!494 = !{!278, !278, !433}
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !496, file: !355, line: 153)
!496 = !DISubprogram(name: "wcstod", scope: !430, file: !430, line: 160, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DISubroutineType(types: !498)
!498 = !{!499, !434, !500}
!499 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!500 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !443, size: 64)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !502, file: !355, line: 154)
!502 = !DISubprogram(name: "wcstof", scope: !430, file: !430, line: 200, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!505, !434, !500}
!505 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !507, file: !355, line: 155)
!507 = !DISubprogram(name: "wcstold", scope: !430, file: !430, line: 202, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DISubroutineType(types: !509)
!509 = !{!243, !434, !500}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !511, file: !355, line: 156)
!511 = !DISubprogram(name: "wcstol", scope: !430, file: !430, line: 164, type: !512, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DISubroutineType(types: !513)
!513 = !{!229, !434, !500, !7}
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !515, file: !355, line: 157)
!515 = !DISubprogram(name: "wcstoll", scope: !430, file: !430, line: 205, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DISubroutineType(types: !517)
!517 = !{!21, !434, !500, !7}
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !519, file: !355, line: 158)
!519 = !DISubprogram(name: "wcstoul", scope: !430, file: !430, line: 167, type: !520, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DISubroutineType(types: !521)
!521 = !{!233, !434, !500, !7}
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !523, file: !355, line: 159)
!523 = !DISubprogram(name: "wcstoull", scope: !430, file: !430, line: 207, type: !524, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DISubroutineType(types: !525)
!525 = !{!190, !434, !500, !7}
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !527, file: !355, line: 160)
!527 = !DISubprogram(name: "wcscpy", scope: !430, file: !430, line: 134, type: !528, flags: DIFlagPrototyped, spFlags: 0)
!528 = !DISubroutineType(types: !529)
!529 = !{!443, !443, !434}
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !531, file: !355, line: 161)
!531 = !DISubprogram(name: "wcsncpy", scope: !430, file: !430, line: 148, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!532 = !DISubroutineType(types: !533)
!533 = !{!443, !443, !434, !444}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !535, file: !355, line: 162)
!535 = !DISubprogram(name: "wcscat", scope: !430, file: !430, line: 130, type: !528, flags: DIFlagPrototyped, spFlags: 0)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !537, file: !355, line: 163)
!537 = !DISubprogram(name: "wcsncat", scope: !430, file: !430, line: 142, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !539, file: !355, line: 164)
!539 = !DISubprogram(name: "wcscmp", scope: !430, file: !430, line: 132, type: !540, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DISubroutineType(types: !541)
!541 = !{!7, !434, !434}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !543, file: !355, line: 165)
!543 = !DISubprogram(name: "wcscoll", scope: !430, file: !430, line: 133, type: !540, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !545, file: !355, line: 166)
!545 = !DISubprogram(name: "wcsncmp", scope: !430, file: !430, line: 145, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DISubroutineType(types: !547)
!547 = !{!7, !434, !434, !444}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !549, file: !355, line: 167)
!549 = !DISubprogram(name: "wcsxfrm", scope: !430, file: !430, line: 157, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!444, !443, !434, !444}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !553, file: !355, line: 168)
!553 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !554, file: !554, line: 147, type: !555, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!555 = !DISubroutineType(types: !556)
!556 = !{!443, !443, !436}
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !558, file: !355, line: 169)
!558 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !554, file: !554, line: 158, type: !528, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !560, file: !355, line: 170)
!560 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !554, file: !554, line: 168, type: !555, flags: DIFlagPrototyped, spFlags: 0)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !562, file: !355, line: 171)
!562 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !554, file: !554, line: 179, type: !528, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !564, file: !355, line: 172)
!564 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !554, file: !554, line: 190, type: !565, flags: DIFlagPrototyped, spFlags: 0)
!565 = !DISubroutineType(types: !566)
!566 = !{!443, !443, !436, !444}
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !568, file: !355, line: 173)
!568 = !DISubprogram(name: "wcscspn", scope: !430, file: !430, line: 136, type: !569, flags: DIFlagPrototyped, spFlags: 0)
!569 = !DISubroutineType(types: !570)
!570 = !{!444, !434, !434}
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !572, file: !355, line: 174)
!572 = !DISubprogram(name: "wcslen", scope: !430, file: !430, line: 140, type: !573, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DISubroutineType(types: !574)
!574 = !{!444, !434}
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !576, file: !355, line: 175)
!576 = !DISubprogram(name: "wcsspn", scope: !430, file: !430, line: 155, type: !569, flags: DIFlagPrototyped, spFlags: 0)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !578, file: !355, line: 176)
!578 = !DISubprogram(name: "wcstok", scope: !430, file: !430, line: 162, type: !579, flags: DIFlagPrototyped, spFlags: 0)
!579 = !DISubroutineType(types: !580)
!580 = !{!443, !443, !434, !500}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !582, file: !355, line: 177)
!582 = !DISubprogram(name: "wmemcmp", scope: !430, file: !430, line: 170, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !584, file: !355, line: 178)
!584 = !DISubprogram(name: "wmemcpy", scope: !430, file: !430, line: 173, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !586, file: !355, line: 179)
!586 = !DISubprogram(name: "wmemmove", scope: !430, file: !430, line: 176, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !588, file: !355, line: 180)
!588 = !DISubprogram(name: "wmemset", scope: !430, file: !430, line: 179, type: !565, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !590, file: !355, line: 181)
!590 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !430, file: !430, line: 137, type: !591, flags: DIFlagPrototyped, spFlags: 0)
!591 = !DISubroutineType(types: !592)
!592 = !{!444, !443, !444, !434, !593}
!593 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !594, size: 64)
!594 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !357)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !596, file: !355, line: 182)
!596 = !DISubprogram(name: "btowc", scope: !430, file: !430, line: 99, type: !597, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DISubroutineType(types: !598)
!598 = !{!278, !7}
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !600, file: !355, line: 183)
!600 = !DISubprogram(name: "wctob", scope: !430, file: !430, line: 159, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !602, file: !355, line: 184)
!602 = !DISubprogram(name: "mbsinit", scope: !430, file: !430, line: 115, type: !603, flags: DIFlagPrototyped, spFlags: 0)
!603 = !DISubroutineType(types: !604)
!604 = !{!7, !605}
!605 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !606, size: 64)
!606 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !344)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !608, file: !355, line: 185)
!608 = !DISubprogram(name: "mbrlen", scope: !430, file: !430, line: 111, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!444, !328, !444, !611}
!611 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !613, file: !355, line: 186)
!613 = !DISubprogram(name: "mbrtowc", scope: !430, file: !430, line: 113, type: !614, flags: DIFlagPrototyped, spFlags: 0)
!614 = !DISubroutineType(types: !615)
!615 = !{!444, !443, !328, !444, !611}
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !617, file: !355, line: 187)
!617 = !DISubprogram(name: "wcrtomb", scope: !430, file: !430, line: 129, type: !618, flags: DIFlagPrototyped, spFlags: 0)
!618 = !DISubroutineType(types: !619)
!619 = !{!444, !371, !436, !611}
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !621, file: !355, line: 188)
!621 = !DISubprogram(name: "mbsrtowcs", scope: !430, file: !430, line: 116, type: !622, flags: DIFlagPrototyped, spFlags: 0)
!622 = !DISubroutineType(types: !623)
!623 = !{!444, !443, !624, !444, !611}
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !626, file: !355, line: 189)
!626 = !DISubprogram(name: "wcsrtombs", scope: !430, file: !430, line: 153, type: !627, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DISubroutineType(types: !628)
!628 = !{!444, !371, !629, !444, !611}
!629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !434, size: 64)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !631, file: !355, line: 191)
!631 = !DISubprogram(name: "getwchar", scope: !430, file: !430, line: 110, type: !632, flags: DIFlagPrototyped, spFlags: 0)
!632 = !DISubroutineType(types: !633)
!633 = !{!278}
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !635, file: !355, line: 192)
!635 = !DISubprogram(name: "vwscanf", scope: !430, file: !430, line: 199, type: !636, flags: DIFlagPrototyped, spFlags: 0)
!636 = !DISubroutineType(types: !637)
!637 = !{!7, !434, !451}
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !639, file: !355, line: 193)
!639 = !DISubprogram(name: "wscanf", scope: !430, file: !430, line: 181, type: !640, flags: DIFlagPrototyped, spFlags: 0)
!640 = !DISubroutineType(types: !641)
!641 = !{!7, !434, null}
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !643, file: !355, line: 195)
!643 = !DISubprogram(name: "putwchar", scope: !430, file: !430, line: 119, type: !644, flags: DIFlagPrototyped, spFlags: 0)
!644 = !DISubroutineType(types: !645)
!645 = !{!278, !436}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !647, file: !355, line: 196)
!647 = !DISubprogram(name: "vwprintf", scope: !430, file: !430, line: 128, type: !636, flags: DIFlagPrototyped, spFlags: 0)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !649, file: !355, line: 197)
!649 = !DISubprogram(name: "wprintf", scope: !430, file: !430, line: 180, type: !640, flags: DIFlagPrototyped, spFlags: 0)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !651, file: !657, line: 82)
!651 = !DISubprogram(name: "memcpy", scope: !652, file: !652, line: 78, type: !653, flags: DIFlagPrototyped, spFlags: 0)
!652 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!653 = !DISubroutineType(types: !654)
!654 = !{!391, !391, !655, !444}
!655 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !656, size: 64)
!656 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!657 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !659, file: !657, line: 83)
!659 = !DISubprogram(name: "memmove", scope: !652, file: !652, line: 81, type: !653, flags: DIFlagPrototyped, spFlags: 0)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !661, file: !657, line: 84)
!661 = !DISubprogram(name: "strcpy", scope: !652, file: !652, line: 92, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DISubroutineType(types: !663)
!663 = !{!371, !371, !328}
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !665, file: !657, line: 85)
!665 = !DISubprogram(name: "strncpy", scope: !652, file: !652, line: 104, type: !666, flags: DIFlagPrototyped, spFlags: 0)
!666 = !DISubroutineType(types: !667)
!667 = !{!371, !371, !328, !444}
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !669, file: !657, line: 86)
!669 = !DISubprogram(name: "strcat", scope: !652, file: !652, line: 86, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !671, file: !657, line: 87)
!671 = !DISubprogram(name: "strncat", scope: !652, file: !652, line: 98, type: !666, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !673, file: !657, line: 88)
!673 = !DISubprogram(name: "memcmp", scope: !652, file: !652, line: 75, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{!7, !655, !655, !444}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !677, file: !657, line: 89)
!677 = !DISubprogram(name: "strcmp", scope: !652, file: !652, line: 89, type: !678, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DISubroutineType(types: !679)
!679 = !{!7, !328, !328}
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !681, file: !657, line: 90)
!681 = !DISubprogram(name: "strncmp", scope: !652, file: !652, line: 101, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DISubroutineType(types: !683)
!683 = !{!7, !328, !328, !444}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !685, file: !657, line: 91)
!685 = !DISubprogram(name: "strcoll", scope: !652, file: !652, line: 90, type: !678, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !687, file: !657, line: 92)
!687 = !DISubprogram(name: "strxfrm", scope: !652, file: !652, line: 112, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!444, !371, !328, !444}
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !691, file: !657, line: 93)
!691 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !692, file: !692, line: 101, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!692 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!693 = !DISubroutineType(types: !694)
!694 = !{!391, !391, !7, !444}
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !696, file: !657, line: 94)
!696 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !692, file: !692, line: 80, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DISubroutineType(types: !698)
!698 = !{!371, !371, !7}
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !700, file: !657, line: 95)
!700 = !DISubprogram(name: "strcspn", scope: !652, file: !652, line: 94, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!444, !328, !328}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !704, file: !657, line: 96)
!704 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !692, file: !692, line: 87, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !706, file: !657, line: 97)
!706 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !692, file: !692, line: 94, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !708, file: !657, line: 98)
!708 = !DISubprogram(name: "strspn", scope: !652, file: !652, line: 109, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !710, file: !657, line: 99)
!710 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !692, file: !692, line: 108, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !712, file: !657, line: 100)
!712 = !DISubprogram(name: "strtok", scope: !652, file: !652, line: 111, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !714, file: !657, line: 101)
!714 = !DISubprogram(name: "memset", scope: !652, file: !652, line: 84, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !716, file: !657, line: 102)
!716 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !652, file: !652, line: 95, type: !717, flags: DIFlagPrototyped, spFlags: 0)
!717 = !DISubroutineType(types: !718)
!718 = !{!371, !7}
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !720, file: !657, line: 103)
!720 = !DISubprogram(name: "strlen", scope: !652, file: !652, line: 96, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!444, !328}
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !724, file: !730, line: 422)
!724 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !726, file: !725, line: 79, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!726 = !DINamespace(name: "__math", scope: !164)
!727 = !DISubroutineType(types: !728)
!728 = !{!729, !243}
!729 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!730 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !732, file: !730, line: 425)
!732 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !726, file: !725, line: 103, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !734, file: !730, line: 429)
!734 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !726, file: !725, line: 127, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !736, file: !730, line: 430)
!736 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !726, file: !725, line: 146, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !738, file: !730, line: 485)
!738 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !726, file: !739, line: 55, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!740 = !DISubroutineType(types: !741)
!741 = !{!243, !243, !742}
!742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !724, file: !744, line: 352)
!744 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !732, file: !744, line: 353)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !734, file: !744, line: 354)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !736, file: !744, line: 355)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !749, file: !744, line: 364)
!749 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !750, line: 50, baseType: !505)
!750 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !752, file: !744, line: 365)
!752 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !750, line: 51, baseType: !499)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !754, file: !744, line: 367)
!754 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !755, file: !755, line: 123, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!755 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!756 = !DISubroutineType(types: !757)
!757 = !{!243, !243}
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !759, file: !744, line: 370)
!759 = !DISubprogram(name: "acosf", scope: !750, file: !750, line: 314, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!760 = !DISubroutineType(types: !761)
!761 = !{!505, !505}
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !763, file: !744, line: 372)
!763 = !DISubprogram(name: "asinf", scope: !750, file: !750, line: 318, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !765, file: !744, line: 374)
!765 = !DISubprogram(name: "atanf", scope: !750, file: !750, line: 322, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !767, file: !744, line: 376)
!767 = !DISubprogram(name: "atan2f", scope: !750, file: !750, line: 326, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!768 = !DISubroutineType(types: !769)
!769 = !{!505, !505, !505}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !771, file: !744, line: 378)
!771 = !DISubprogram(name: "ceilf", scope: !750, file: !750, line: 461, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !773, file: !744, line: 380)
!773 = !DISubprogram(name: "cosf", scope: !750, file: !750, line: 330, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !775, file: !744, line: 382)
!775 = !DISubprogram(name: "coshf", scope: !750, file: !750, line: 354, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !777, file: !744, line: 385)
!777 = !DISubprogram(name: "expf", scope: !750, file: !750, line: 366, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !779, file: !744, line: 388)
!779 = !DISubprogram(name: "fabsf", scope: !750, file: !750, line: 422, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !781, file: !744, line: 390)
!781 = !DISubprogram(name: "floorf", scope: !750, file: !750, line: 465, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !783, file: !744, line: 393)
!783 = !DISubprogram(name: "fmodf", scope: !750, file: !750, line: 505, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !785, file: !744, line: 396)
!785 = !DISubprogram(name: "frexpf", scope: !750, file: !750, line: 406, type: !786, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DISubroutineType(types: !787)
!787 = !{!505, !505, !788}
!788 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !790, file: !744, line: 398)
!790 = !DISubprogram(name: "ldexpf", scope: !750, file: !750, line: 402, type: !791, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DISubroutineType(types: !792)
!792 = !{!505, !505, !7}
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !794, file: !744, line: 401)
!794 = !DISubprogram(name: "logf", scope: !750, file: !750, line: 378, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !796, file: !744, line: 404)
!796 = !DISubprogram(name: "log10f", scope: !750, file: !750, line: 382, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !738, file: !744, line: 405)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !799, file: !744, line: 406)
!799 = !DISubprogram(name: "modff", scope: !750, file: !750, line: 398, type: !800, flags: DIFlagPrototyped, spFlags: 0)
!800 = !DISubroutineType(types: !801)
!801 = !{!505, !505, !802}
!802 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !505, size: 64)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !804, file: !744, line: 409)
!804 = !DISubprogram(name: "powf", scope: !750, file: !750, line: 434, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !806, file: !744, line: 412)
!806 = !DISubprogram(name: "sinf", scope: !750, file: !750, line: 334, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !808, file: !744, line: 414)
!808 = !DISubprogram(name: "sinhf", scope: !750, file: !750, line: 358, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !810, file: !744, line: 417)
!810 = !DISubprogram(name: "sqrtf", scope: !750, file: !750, line: 438, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !812, file: !744, line: 419)
!812 = !DISubprogram(name: "tanf", scope: !750, file: !750, line: 338, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !814, file: !744, line: 422)
!814 = !DISubprogram(name: "tanhf", scope: !750, file: !750, line: 362, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !816, file: !744, line: 425)
!816 = !DISubprogram(name: "acoshf", scope: !750, file: !750, line: 342, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !818, file: !744, line: 427)
!818 = !DISubprogram(name: "asinhf", scope: !750, file: !750, line: 346, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !820, file: !744, line: 429)
!820 = !DISubprogram(name: "atanhf", scope: !750, file: !750, line: 350, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !822, file: !744, line: 431)
!822 = !DISubprogram(name: "cbrtf", scope: !750, file: !750, line: 426, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !824, file: !744, line: 434)
!824 = !DISubprogram(name: "copysignf", scope: !750, file: !750, line: 517, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !826, file: !744, line: 437)
!826 = !DISubprogram(name: "erff", scope: !750, file: !750, line: 442, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !828, file: !744, line: 439)
!828 = !DISubprogram(name: "erfcf", scope: !750, file: !750, line: 446, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !830, file: !744, line: 441)
!830 = !DISubprogram(name: "exp2f", scope: !750, file: !750, line: 370, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !832, file: !744, line: 443)
!832 = !DISubprogram(name: "expm1f", scope: !750, file: !750, line: 374, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !834, file: !744, line: 445)
!834 = !DISubprogram(name: "fdimf", scope: !750, file: !750, line: 533, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !836, file: !744, line: 446)
!836 = !DISubprogram(name: "fmaf", scope: !750, file: !750, line: 545, type: !837, flags: DIFlagPrototyped, spFlags: 0)
!837 = !DISubroutineType(types: !838)
!838 = !{!505, !505, !505, !505}
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !840, file: !744, line: 449)
!840 = !DISubprogram(name: "fmaxf", scope: !750, file: !750, line: 537, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !842, file: !744, line: 451)
!842 = !DISubprogram(name: "fminf", scope: !750, file: !750, line: 541, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !844, file: !744, line: 453)
!844 = !DISubprogram(name: "hypotf", scope: !750, file: !750, line: 430, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !846, file: !744, line: 455)
!846 = !DISubprogram(name: "ilogbf", scope: !750, file: !750, line: 410, type: !847, flags: DIFlagPrototyped, spFlags: 0)
!847 = !DISubroutineType(types: !848)
!848 = !{!7, !505}
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !850, file: !744, line: 457)
!850 = !DISubprogram(name: "lgammaf", scope: !750, file: !750, line: 453, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !852, file: !744, line: 459)
!852 = !DISubprogram(name: "llrintf", scope: !750, file: !750, line: 492, type: !853, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DISubroutineType(types: !854)
!854 = !{!21, !505}
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !856, file: !744, line: 461)
!856 = !DISubprogram(name: "llroundf", scope: !750, file: !750, line: 496, type: !853, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !858, file: !744, line: 463)
!858 = !DISubprogram(name: "log1pf", scope: !750, file: !750, line: 390, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !860, file: !744, line: 465)
!860 = !DISubprogram(name: "log2f", scope: !750, file: !750, line: 386, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !862, file: !744, line: 467)
!862 = !DISubprogram(name: "logbf", scope: !750, file: !750, line: 394, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !864, file: !744, line: 469)
!864 = !DISubprogram(name: "lrintf", scope: !750, file: !750, line: 477, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!865 = !DISubroutineType(types: !866)
!866 = !{!229, !505}
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !868, file: !744, line: 471)
!868 = !DISubprogram(name: "lroundf", scope: !750, file: !750, line: 485, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !870, file: !744, line: 473)
!870 = !DISubprogram(name: "nan", scope: !750, file: !750, line: 522, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DISubroutineType(types: !872)
!872 = !{!499, !328}
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !874, file: !744, line: 474)
!874 = !DISubprogram(name: "nanf", scope: !750, file: !750, line: 521, type: !875, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DISubroutineType(types: !876)
!876 = !{!505, !328}
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !878, file: !744, line: 477)
!878 = !DISubprogram(name: "nearbyintf", scope: !750, file: !750, line: 469, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !880, file: !744, line: 479)
!880 = !DISubprogram(name: "nextafterf", scope: !750, file: !750, line: 525, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !882, file: !744, line: 481)
!882 = !DISubprogram(name: "nexttowardf", scope: !750, file: !750, line: 530, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DISubroutineType(types: !884)
!884 = !{!505, !505, !243}
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !886, file: !744, line: 483)
!886 = !DISubprogram(name: "remainderf", scope: !750, file: !750, line: 509, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !888, file: !744, line: 485)
!888 = !DISubprogram(name: "remquof", scope: !750, file: !750, line: 513, type: !889, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DISubroutineType(types: !890)
!890 = !{!505, !505, !505, !788}
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !892, file: !744, line: 487)
!892 = !DISubprogram(name: "rintf", scope: !750, file: !750, line: 473, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !894, file: !744, line: 489)
!894 = !DISubprogram(name: "roundf", scope: !750, file: !750, line: 481, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !896, file: !744, line: 491)
!896 = !DISubprogram(name: "scalblnf", scope: !750, file: !750, line: 418, type: !897, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DISubroutineType(types: !898)
!898 = !{!505, !505, !229}
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !900, file: !744, line: 493)
!900 = !DISubprogram(name: "scalbnf", scope: !750, file: !750, line: 414, type: !791, flags: DIFlagPrototyped, spFlags: 0)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !902, file: !744, line: 495)
!902 = !DISubprogram(name: "tgammaf", scope: !750, file: !750, line: 457, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !904, file: !744, line: 497)
!904 = !DISubprogram(name: "truncf", scope: !750, file: !750, line: 501, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !906, file: !744, line: 499)
!906 = !DISubprogram(name: "acosl", scope: !750, file: !750, line: 316, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !908, file: !744, line: 500)
!908 = !DISubprogram(name: "asinl", scope: !750, file: !750, line: 320, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !910, file: !744, line: 501)
!910 = !DISubprogram(name: "atanl", scope: !750, file: !750, line: 324, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !912, file: !744, line: 502)
!912 = !DISubprogram(name: "atan2l", scope: !750, file: !750, line: 328, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DISubroutineType(types: !914)
!914 = !{!243, !243, !243}
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !916, file: !744, line: 503)
!916 = !DISubprogram(name: "ceill", scope: !750, file: !750, line: 463, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !918, file: !744, line: 504)
!918 = !DISubprogram(name: "cosl", scope: !750, file: !750, line: 332, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !920, file: !744, line: 505)
!920 = !DISubprogram(name: "coshl", scope: !750, file: !750, line: 356, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !922, file: !744, line: 506)
!922 = !DISubprogram(name: "expl", scope: !750, file: !750, line: 368, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !924, file: !744, line: 507)
!924 = !DISubprogram(name: "fabsl", scope: !750, file: !750, line: 424, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !926, file: !744, line: 508)
!926 = !DISubprogram(name: "floorl", scope: !750, file: !750, line: 467, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !928, file: !744, line: 509)
!928 = !DISubprogram(name: "fmodl", scope: !750, file: !750, line: 507, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !930, file: !744, line: 510)
!930 = !DISubprogram(name: "frexpl", scope: !750, file: !750, line: 408, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DISubroutineType(types: !932)
!932 = !{!243, !243, !788}
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !934, file: !744, line: 511)
!934 = !DISubprogram(name: "ldexpl", scope: !750, file: !750, line: 404, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DISubroutineType(types: !936)
!936 = !{!243, !243, !7}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !938, file: !744, line: 512)
!938 = !DISubprogram(name: "logl", scope: !750, file: !750, line: 380, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !940, file: !744, line: 513)
!940 = !DISubprogram(name: "log10l", scope: !750, file: !750, line: 384, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !942, file: !744, line: 514)
!942 = !DISubprogram(name: "modfl", scope: !750, file: !750, line: 400, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !944, file: !744, line: 515)
!944 = !DISubprogram(name: "powl", scope: !750, file: !750, line: 436, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !946, file: !744, line: 516)
!946 = !DISubprogram(name: "sinl", scope: !750, file: !750, line: 336, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !948, file: !744, line: 517)
!948 = !DISubprogram(name: "sinhl", scope: !750, file: !750, line: 360, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !950, file: !744, line: 518)
!950 = !DISubprogram(name: "sqrtl", scope: !750, file: !750, line: 440, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !952, file: !744, line: 519)
!952 = !DISubprogram(name: "tanl", scope: !750, file: !750, line: 340, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !954, file: !744, line: 521)
!954 = !DISubprogram(name: "tanhl", scope: !750, file: !750, line: 364, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !956, file: !744, line: 522)
!956 = !DISubprogram(name: "acoshl", scope: !750, file: !750, line: 344, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !958, file: !744, line: 523)
!958 = !DISubprogram(name: "asinhl", scope: !750, file: !750, line: 348, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !960, file: !744, line: 524)
!960 = !DISubprogram(name: "atanhl", scope: !750, file: !750, line: 352, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !962, file: !744, line: 525)
!962 = !DISubprogram(name: "cbrtl", scope: !750, file: !750, line: 428, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !964, file: !744, line: 527)
!964 = !DISubprogram(name: "copysignl", scope: !750, file: !750, line: 519, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !966, file: !744, line: 529)
!966 = !DISubprogram(name: "erfl", scope: !750, file: !750, line: 444, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !968, file: !744, line: 530)
!968 = !DISubprogram(name: "erfcl", scope: !750, file: !750, line: 448, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !970, file: !744, line: 531)
!970 = !DISubprogram(name: "exp2l", scope: !750, file: !750, line: 372, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !972, file: !744, line: 532)
!972 = !DISubprogram(name: "expm1l", scope: !750, file: !750, line: 376, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !974, file: !744, line: 533)
!974 = !DISubprogram(name: "fdiml", scope: !750, file: !750, line: 535, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !976, file: !744, line: 534)
!976 = !DISubprogram(name: "fmal", scope: !750, file: !750, line: 547, type: !977, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DISubroutineType(types: !978)
!978 = !{!243, !243, !243, !243}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !980, file: !744, line: 535)
!980 = !DISubprogram(name: "fmaxl", scope: !750, file: !750, line: 539, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !982, file: !744, line: 536)
!982 = !DISubprogram(name: "fminl", scope: !750, file: !750, line: 543, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !984, file: !744, line: 537)
!984 = !DISubprogram(name: "hypotl", scope: !750, file: !750, line: 432, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !986, file: !744, line: 538)
!986 = !DISubprogram(name: "ilogbl", scope: !750, file: !750, line: 412, type: !987, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DISubroutineType(types: !988)
!988 = !{!7, !243}
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !990, file: !744, line: 539)
!990 = !DISubprogram(name: "lgammal", scope: !750, file: !750, line: 455, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !992, file: !744, line: 540)
!992 = !DISubprogram(name: "llrintl", scope: !750, file: !750, line: 494, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DISubroutineType(types: !994)
!994 = !{!21, !243}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !996, file: !744, line: 541)
!996 = !DISubprogram(name: "llroundl", scope: !750, file: !750, line: 498, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !998, file: !744, line: 542)
!998 = !DISubprogram(name: "log1pl", scope: !750, file: !750, line: 392, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1000, file: !744, line: 543)
!1000 = !DISubprogram(name: "log2l", scope: !750, file: !750, line: 388, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1002, file: !744, line: 544)
!1002 = !DISubprogram(name: "logbl", scope: !750, file: !750, line: 396, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1004, file: !744, line: 545)
!1004 = !DISubprogram(name: "lrintl", scope: !750, file: !750, line: 479, type: !1005, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!229, !243}
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1008, file: !744, line: 546)
!1008 = !DISubprogram(name: "lroundl", scope: !750, file: !750, line: 487, type: !1005, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1010, file: !744, line: 547)
!1010 = !DISubprogram(name: "nanl", scope: !750, file: !750, line: 523, type: !1011, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!243, !328}
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1014, file: !744, line: 548)
!1014 = !DISubprogram(name: "nearbyintl", scope: !750, file: !750, line: 471, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1016, file: !744, line: 549)
!1016 = !DISubprogram(name: "nextafterl", scope: !750, file: !750, line: 527, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1018, file: !744, line: 550)
!1018 = !DISubprogram(name: "nexttowardl", scope: !750, file: !750, line: 531, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1020, file: !744, line: 551)
!1020 = !DISubprogram(name: "remainderl", scope: !750, file: !750, line: 511, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1022, file: !744, line: 552)
!1022 = !DISubprogram(name: "remquol", scope: !750, file: !750, line: 515, type: !1023, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!243, !243, !243, !788}
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1026, file: !744, line: 553)
!1026 = !DISubprogram(name: "rintl", scope: !750, file: !750, line: 475, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1028, file: !744, line: 554)
!1028 = !DISubprogram(name: "roundl", scope: !750, file: !750, line: 483, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1030, file: !744, line: 555)
!1030 = !DISubprogram(name: "scalblnl", scope: !750, file: !750, line: 420, type: !1031, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!243, !243, !229}
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1034, file: !744, line: 556)
!1034 = !DISubprogram(name: "scalbnl", scope: !750, file: !750, line: 416, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1036, file: !744, line: 557)
!1036 = !DISubprogram(name: "tgammal", scope: !750, file: !750, line: 459, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1038, file: !744, line: 558)
!1038 = !DISubprogram(name: "truncl", scope: !750, file: !750, line: 503, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1040, entity: !1041, file: !1043, line: 536)
!1040 = !DINamespace(name: "chrono", scope: !164)
!1041 = !DINamespace(name: "chrono_literals", scope: !1042, exportSymbols: true)
!1042 = !DINamespace(name: "literals", scope: !164, exportSymbols: true)
!1043 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1045, file: !1048, line: 68)
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1046, line: 31, baseType: !1047)
!1046 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1047 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !228, line: 116, baseType: !233)
!1048 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1050, file: !1048, line: 69)
!1050 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1051, line: 31, baseType: !1052)
!1051 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1052 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !228, line: 119, baseType: !229)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !357, file: !1048, line: 70)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1055, file: !1048, line: 74)
!1055 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !358, file: !358, line: 112, type: !1056, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DISubroutineType(types: !1057)
!1057 = !{!1045}
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1059, file: !1048, line: 75)
!1059 = !DISubprogram(name: "difftime", scope: !358, file: !358, line: 114, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{!499, !1050, !1050}
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1063, file: !1048, line: 76)
!1063 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !358, file: !358, line: 118, type: !1064, flags: DIFlagPrototyped, spFlags: 0)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!1050, !1066}
!1066 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1068, file: !1048, line: 77)
!1068 = !DISubprogram(name: "time", scope: !358, file: !358, line: 121, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!1050, !1071}
!1071 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1050, size: 64)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1073, file: !1048, line: 78)
!1073 = !DISubprogram(name: "asctime", scope: !358, file: !358, line: 111, type: !1074, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!371, !593}
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1077, file: !1048, line: 79)
!1077 = !DISubprogram(name: "ctime", scope: !358, file: !358, line: 113, type: !1078, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!371, !1080}
!1080 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1081, size: 64)
!1081 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1050)
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1083, file: !1048, line: 80)
!1083 = !DISubprogram(name: "gmtime", scope: !358, file: !358, line: 116, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!1066, !1080}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1087, file: !1048, line: 81)
!1087 = !DISubprogram(name: "localtime", scope: !358, file: !358, line: 117, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1089, file: !1048, line: 82)
!1089 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !358, file: !358, line: 119, type: !1090, flags: DIFlagPrototyped, spFlags: 0)
!1090 = !DISubroutineType(types: !1091)
!1091 = !{!444, !371, !444, !328, !593}
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1093, file: !1099, line: 106)
!1093 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1094, line: 105, baseType: !1095)
!1094 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!1095 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1094, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !1096, identifier: "_ZTS5div_t")
!1096 = !{!1097, !1098}
!1097 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1095, file: !1094, line: 103, baseType: !7, size: 32)
!1098 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1095, file: !1094, line: 104, baseType: !7, size: 32, offset: 32)
!1099 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1101, file: !1099, line: 107)
!1101 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1094, line: 110, baseType: !1102)
!1102 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1094, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !1103, identifier: "_ZTS6ldiv_t")
!1103 = !{!1104, !1105}
!1104 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1102, file: !1094, line: 108, baseType: !229, size: 64)
!1105 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1102, file: !1094, line: 109, baseType: !229, size: 64, offset: 64)
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1107, file: !1099, line: 108)
!1107 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1094, line: 116, baseType: !1108)
!1108 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1094, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !1109, identifier: "_ZTS7lldiv_t")
!1109 = !{!1110, !1111}
!1110 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1108, file: !1094, line: 114, baseType: !21, size: 64)
!1111 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1108, file: !1094, line: 115, baseType: !21, size: 64, offset: 64)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1113, file: !1099, line: 109)
!1113 = !DISubprogram(name: "atof", scope: !1094, file: !1094, line: 149, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1115, file: !1099, line: 110)
!1115 = !DISubprogram(name: "atoi", scope: !1094, file: !1094, line: 150, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!7, !328}
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1119, file: !1099, line: 111)
!1119 = !DISubprogram(name: "atol", scope: !1094, file: !1094, line: 151, type: !1120, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!229, !328}
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1123, file: !1099, line: 112)
!1123 = !DISubprogram(name: "atoll", scope: !1094, file: !1094, line: 154, type: !1124, flags: DIFlagPrototyped, spFlags: 0)
!1124 = !DISubroutineType(types: !1125)
!1125 = !{!21, !328}
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1127, file: !1099, line: 113)
!1127 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !1094, file: !1094, line: 184, type: !1128, flags: DIFlagPrototyped, spFlags: 0)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!499, !328, !1130}
!1130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1132, file: !1099, line: 114)
!1132 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !1094, file: !1094, line: 185, type: !1133, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!505, !328, !1130}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1136, file: !1099, line: 115)
!1136 = !DISubprogram(name: "strtold", scope: !1094, file: !1094, line: 188, type: !1137, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!243, !328, !1130}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1140, file: !1099, line: 116)
!1140 = !DISubprogram(name: "strtol", scope: !1094, file: !1094, line: 186, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!229, !328, !1130, !7}
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1144, file: !1099, line: 117)
!1144 = !DISubprogram(name: "strtoll", scope: !1094, file: !1094, line: 191, type: !1145, flags: DIFlagPrototyped, spFlags: 0)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!21, !328, !1130, !7}
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1148, file: !1099, line: 118)
!1148 = !DISubprogram(name: "strtoul", scope: !1094, file: !1094, line: 194, type: !1149, flags: DIFlagPrototyped, spFlags: 0)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!233, !328, !1130, !7}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1152, file: !1099, line: 119)
!1152 = !DISubprogram(name: "strtoull", scope: !1094, file: !1094, line: 197, type: !1153, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!190, !328, !1130, !7}
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1156, file: !1099, line: 120)
!1156 = !DISubprogram(name: "rand", scope: !1094, file: !1094, line: 181, type: !1157, flags: DIFlagPrototyped, spFlags: 0)
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!7}
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1160, file: !1099, line: 121)
!1160 = !DISubprogram(name: "srand", scope: !1094, file: !1094, line: 183, type: !1161, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{null, !14}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1164, file: !1099, line: 122)
!1164 = !DISubprogram(name: "calloc", scope: !1165, file: !1165, line: 55, type: !1166, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!391, !444, !444}
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1169, file: !1099, line: 123)
!1169 = !DISubprogram(name: "free", scope: !1165, file: !1165, line: 56, type: !1170, flags: DIFlagPrototyped, spFlags: 0)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{null, !391}
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1173, file: !1099, line: 124)
!1173 = !DISubprogram(name: "malloc", scope: !1165, file: !1165, line: 54, type: !1174, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!391, !444}
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1177, file: !1099, line: 125)
!1177 = !DISubprogram(name: "realloc", scope: !1165, file: !1165, line: 57, type: !1178, flags: DIFlagPrototyped, spFlags: 0)
!1178 = !DISubroutineType(types: !1179)
!1179 = !{!391, !391, !444}
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1181, file: !1099, line: 126)
!1181 = !DISubprogram(name: "abort", scope: !1182, file: !1182, line: 33, type: !1183, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1182 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!1183 = !DISubroutineType(types: !1184)
!1184 = !{null}
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1186, file: !1099, line: 127)
!1186 = !DISubprogram(name: "atexit", scope: !1094, file: !1094, line: 144, type: !1187, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!7, !1189}
!1189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1183, size: 64)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1191, file: !1099, line: 128)
!1191 = !DISubprogram(name: "exit", scope: !1094, file: !1094, line: 160, type: !1192, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1192 = !DISubroutineType(types: !1193)
!1193 = !{null, !7}
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1195, file: !1099, line: 129)
!1195 = !DISubprogram(name: "_Exit", scope: !1094, file: !1094, line: 210, type: !1192, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1197, file: !1099, line: 130)
!1197 = !DISubprogram(name: "getenv", scope: !1094, file: !1094, line: 162, type: !1198, flags: DIFlagPrototyped, spFlags: 0)
!1198 = !DISubroutineType(types: !1199)
!1199 = !{!371, !328}
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1201, file: !1099, line: 131)
!1201 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !1094, file: !1094, line: 203, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1203, file: !1099, line: 132)
!1203 = !DISubprogram(name: "bsearch", scope: !1094, file: !1094, line: 156, type: !1204, flags: DIFlagPrototyped, spFlags: 0)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{!391, !655, !655, !444, !444, !1206}
!1206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1207, size: 64)
!1207 = !DISubroutineType(types: !1208)
!1208 = !{!7, !655, !655}
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1210, file: !1099, line: 133)
!1210 = !DISubprogram(name: "qsort", scope: !1094, file: !1094, line: 175, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{null, !391, !444, !444, !1206}
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !754, file: !1099, line: 134)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1215, file: !1099, line: 135)
!1215 = !DISubprogram(name: "labs", scope: !1094, file: !1094, line: 163, type: !1216, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DISubroutineType(types: !1217)
!1217 = !{!229, !229}
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1219, file: !1099, line: 136)
!1219 = !DISubprogram(name: "llabs", scope: !1094, file: !1094, line: 167, type: !1220, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!21, !21}
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1223, file: !1099, line: 137)
!1223 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !755, file: !755, line: 143, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!1107, !21, !21}
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1227, file: !1099, line: 138)
!1227 = !DISubprogram(name: "ldiv", scope: !1094, file: !1094, line: 164, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!1101, !229, !229}
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1231, file: !1099, line: 139)
!1231 = !DISubprogram(name: "lldiv", scope: !1094, file: !1094, line: 168, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1233, file: !1099, line: 140)
!1233 = !DISubprogram(name: "mblen", scope: !1094, file: !1094, line: 171, type: !1234, flags: DIFlagPrototyped, spFlags: 0)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!7, !328, !444}
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1237, file: !1099, line: 142)
!1237 = !DISubprogram(name: "mbtowc", scope: !1094, file: !1094, line: 173, type: !1238, flags: DIFlagPrototyped, spFlags: 0)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!7, !443, !328, !444}
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1241, file: !1099, line: 143)
!1241 = !DISubprogram(name: "wctomb", scope: !1094, file: !1094, line: 207, type: !1242, flags: DIFlagPrototyped, spFlags: 0)
!1242 = !DISubroutineType(types: !1243)
!1243 = !{!7, !371, !436}
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1245, file: !1099, line: 144)
!1245 = !DISubprogram(name: "mbstowcs", scope: !1094, file: !1094, line: 172, type: !1246, flags: DIFlagPrototyped, spFlags: 0)
!1246 = !DISubroutineType(types: !1247)
!1247 = !{!444, !443, !328, !444}
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1249, file: !1099, line: 145)
!1249 = !DISubprogram(name: "wcstombs", scope: !1094, file: !1094, line: 206, type: !1250, flags: DIFlagPrototyped, spFlags: 0)
!1250 = !DISubroutineType(types: !1251)
!1251 = !{!444, !371, !434, !444}
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1253, file: !1099, line: 148)
!1253 = !DISubprogram(name: "at_quick_exit", scope: !1094, file: !1094, line: 147, type: !1187, flags: DIFlagPrototyped, spFlags: 0)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1255, file: !1099, line: 149)
!1255 = !DISubprogram(name: "quick_exit", scope: !1094, file: !1094, line: 179, type: !1192, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !344, file: !1257, line: 25)
!1257 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !374, file: !1259, line: 120)
!1259 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !404, file: !1259, line: 121)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1262, file: !1259, line: 123)
!1262 = !DISubprogram(name: "fclose", scope: !375, file: !375, line: 233, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!7, !433}
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1266, file: !1259, line: 124)
!1266 = !DISubprogram(name: "fflush", scope: !375, file: !375, line: 236, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1268, file: !1259, line: 125)
!1268 = !DISubprogram(name: "setbuf", scope: !375, file: !375, line: 272, type: !1269, flags: DIFlagPrototyped, spFlags: 0)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{null, !433, !371}
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1272, file: !1259, line: 126)
!1272 = !DISubprogram(name: "setvbuf", scope: !375, file: !375, line: 273, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!7, !433, !371, !7, !444}
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1276, file: !1259, line: 127)
!1276 = !DISubprogram(name: "fprintf", scope: !375, file: !375, line: 245, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{!7, !433, !328, null}
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1280, file: !1259, line: 128)
!1280 = !DISubprogram(name: "fscanf", scope: !375, file: !375, line: 251, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1282, file: !1259, line: 129)
!1282 = !DISubprogram(name: "snprintf", scope: !375, file: !375, line: 435, type: !1283, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!7, !371, !444, !328, null}
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1286, file: !1259, line: 130)
!1286 = !DISubprogram(name: "sprintf", scope: !375, file: !375, line: 280, type: !1287, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DISubroutineType(types: !1288)
!1288 = !{!7, !371, !328, null}
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1290, file: !1259, line: 131)
!1290 = !DISubprogram(name: "sscanf", scope: !375, file: !375, line: 282, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!7, !328, !328, null}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1294, file: !1259, line: 132)
!1294 = !DISubprogram(name: "vfprintf", scope: !375, file: !375, line: 292, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!7, !433, !328, !1297}
!1297 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1298, line: 44, baseType: !451)
!1298 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1300, file: !1259, line: 133)
!1300 = !DISubprogram(name: "vfscanf", scope: !375, file: !375, line: 436, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1302, file: !1259, line: 134)
!1302 = !DISubprogram(name: "vsscanf", scope: !375, file: !375, line: 439, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!7, !328, !328, !1297}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1306, file: !1259, line: 135)
!1306 = !DISubprogram(name: "vsnprintf", scope: !375, file: !375, line: 438, type: !1307, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!7, !371, !444, !328, !1297}
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1310, file: !1259, line: 136)
!1310 = !DISubprogram(name: "vsprintf", scope: !375, file: !375, line: 300, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!7, !371, !328, !1297}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1314, file: !1259, line: 137)
!1314 = !DISubprogram(name: "fgetc", scope: !375, file: !375, line: 237, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1316, file: !1259, line: 138)
!1316 = !DISubprogram(name: "fgets", scope: !375, file: !375, line: 239, type: !1317, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DISubroutineType(types: !1318)
!1318 = !{!371, !371, !7, !433}
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1320, file: !1259, line: 139)
!1320 = !DISubprogram(name: "fputc", scope: !375, file: !375, line: 246, type: !1321, flags: DIFlagPrototyped, spFlags: 0)
!1321 = !DISubroutineType(types: !1322)
!1322 = !{!7, !7, !433}
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1324, file: !1259, line: 140)
!1324 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !375, file: !375, line: 247, type: !1325, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DISubroutineType(types: !1326)
!1326 = !{!7, !328, !433}
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1328, file: !1259, line: 141)
!1328 = !DISubprogram(name: "getc", scope: !375, file: !375, line: 256, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1330, file: !1259, line: 142)
!1330 = !DISubprogram(name: "putc", scope: !375, file: !375, line: 265, type: !1321, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1332, file: !1259, line: 143)
!1332 = !DISubprogram(name: "ungetc", scope: !375, file: !375, line: 291, type: !1321, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1334, file: !1259, line: 144)
!1334 = !DISubprogram(name: "fread", scope: !375, file: !375, line: 248, type: !1335, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DISubroutineType(types: !1336)
!1336 = !{!444, !391, !444, !444, !433}
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1338, file: !1259, line: 145)
!1338 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !375, file: !375, line: 255, type: !1339, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DISubroutineType(types: !1340)
!1340 = !{!444, !655, !444, !444, !433}
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1342, file: !1259, line: 146)
!1342 = !DISubprogram(name: "fgetpos", scope: !375, file: !375, line: 238, type: !1343, flags: DIFlagPrototyped, spFlags: 0)
!1343 = !DISubroutineType(types: !1344)
!1344 = !{!7, !433, !1345}
!1345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64)
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1347, file: !1259, line: 147)
!1347 = !DISubprogram(name: "fseek", scope: !375, file: !375, line: 252, type: !1348, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!7, !433, !229, !7}
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1351, file: !1259, line: 148)
!1351 = !DISubprogram(name: "fsetpos", scope: !375, file: !375, line: 253, type: !1352, flags: DIFlagPrototyped, spFlags: 0)
!1352 = !DISubroutineType(types: !1353)
!1353 = !{!7, !433, !1354}
!1354 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1355, size: 64)
!1355 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !404)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1357, file: !1259, line: 149)
!1357 = !DISubprogram(name: "ftell", scope: !375, file: !375, line: 254, type: !1358, flags: DIFlagPrototyped, spFlags: 0)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!229, !433}
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1361, file: !1259, line: 150)
!1361 = !DISubprogram(name: "rewind", scope: !375, file: !375, line: 270, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{null, !433}
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1365, file: !1259, line: 151)
!1365 = !DISubprogram(name: "clearerr", scope: !375, file: !375, line: 232, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1367, file: !1259, line: 152)
!1367 = !DISubprogram(name: "feof", scope: !375, file: !375, line: 234, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1369, file: !1259, line: 153)
!1369 = !DISubprogram(name: "ferror", scope: !375, file: !375, line: 235, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1371, file: !1259, line: 154)
!1371 = !DISubprogram(name: "perror", scope: !375, file: !375, line: 264, type: !1372, flags: DIFlagPrototyped, spFlags: 0)
!1372 = !DISubroutineType(types: !1373)
!1373 = !{null, !328}
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1375, file: !1259, line: 156)
!1375 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !375, file: !375, line: 243, type: !1376, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!433, !328, !328}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1379, file: !1259, line: 157)
!1379 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !375, file: !375, line: 249, type: !1380, flags: DIFlagPrototyped, spFlags: 0)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!433, !328, !328, !433}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1383, file: !1259, line: 158)
!1383 = !DISubprogram(name: "remove", scope: !375, file: !375, line: 268, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1385, file: !1259, line: 159)
!1385 = !DISubprogram(name: "rename", scope: !375, file: !375, line: 269, type: !678, flags: DIFlagPrototyped, spFlags: 0)
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1387, file: !1259, line: 160)
!1387 = !DISubprogram(name: "tmpfile", scope: !375, file: !375, line: 283, type: !1388, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!433}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1391, file: !1259, line: 161)
!1391 = !DISubprogram(name: "tmpnam", scope: !375, file: !375, line: 289, type: !1392, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DISubroutineType(types: !1393)
!1393 = !{!371, !371}
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1395, file: !1259, line: 163)
!1395 = !DISubprogram(name: "getchar", scope: !375, file: !375, line: 257, type: !1157, flags: DIFlagPrototyped, spFlags: 0)
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1397, file: !1259, line: 167)
!1397 = !DISubprogram(name: "scanf", scope: !375, file: !375, line: 271, type: !1398, flags: DIFlagPrototyped, spFlags: 0)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!7, !328, null}
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1401, file: !1259, line: 168)
!1401 = !DISubprogram(name: "vscanf", scope: !375, file: !375, line: 437, type: !1402, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DISubroutineType(types: !1403)
!1403 = !{!7, !328, !1297}
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1405, file: !1259, line: 170)
!1405 = !DISubprogram(name: "printf", scope: !1406, file: !1406, line: 34, type: !1398, flags: DIFlagPrototyped, spFlags: 0)
!1406 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1408, file: !1259, line: 171)
!1408 = !DISubprogram(name: "putchar", scope: !375, file: !375, line: 266, type: !248, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1410, file: !1259, line: 172)
!1410 = !DISubprogram(name: "puts", scope: !375, file: !375, line: 267, type: !1116, flags: DIFlagPrototyped, spFlags: 0)
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1412, file: !1259, line: 173)
!1412 = !DISubprogram(name: "vprintf", scope: !375, file: !375, line: 293, type: !1402, flags: DIFlagPrototyped, spFlags: 0)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1414, file: !1441, line: 52)
!1414 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1415, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1416, identifier: "_ZTS5lconv")
!1415 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1416 = !{!1417, !1418, !1419, !1420, !1421, !1422, !1423, !1424, !1425, !1426, !1427, !1428, !1429, !1430, !1431, !1432, !1433, !1434, !1435, !1436, !1437, !1438, !1439, !1440}
!1417 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1414, file: !1415, line: 47, baseType: !371, size: 64)
!1418 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1414, file: !1415, line: 48, baseType: !371, size: 64, offset: 64)
!1419 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1414, file: !1415, line: 49, baseType: !371, size: 64, offset: 128)
!1420 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1414, file: !1415, line: 50, baseType: !371, size: 64, offset: 192)
!1421 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1414, file: !1415, line: 51, baseType: !371, size: 64, offset: 256)
!1422 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1414, file: !1415, line: 52, baseType: !371, size: 64, offset: 320)
!1423 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1414, file: !1415, line: 53, baseType: !371, size: 64, offset: 384)
!1424 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1414, file: !1415, line: 54, baseType: !371, size: 64, offset: 448)
!1425 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1414, file: !1415, line: 55, baseType: !371, size: 64, offset: 512)
!1426 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1414, file: !1415, line: 56, baseType: !371, size: 64, offset: 576)
!1427 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1414, file: !1415, line: 57, baseType: !28, size: 8, offset: 640)
!1428 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1414, file: !1415, line: 58, baseType: !28, size: 8, offset: 648)
!1429 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1414, file: !1415, line: 59, baseType: !28, size: 8, offset: 656)
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1414, file: !1415, line: 60, baseType: !28, size: 8, offset: 664)
!1431 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1414, file: !1415, line: 61, baseType: !28, size: 8, offset: 672)
!1432 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1414, file: !1415, line: 62, baseType: !28, size: 8, offset: 680)
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1414, file: !1415, line: 63, baseType: !28, size: 8, offset: 688)
!1434 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1414, file: !1415, line: 64, baseType: !28, size: 8, offset: 696)
!1435 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1414, file: !1415, line: 65, baseType: !28, size: 8, offset: 704)
!1436 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1414, file: !1415, line: 66, baseType: !28, size: 8, offset: 712)
!1437 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1414, file: !1415, line: 67, baseType: !28, size: 8, offset: 720)
!1438 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1414, file: !1415, line: 68, baseType: !28, size: 8, offset: 728)
!1439 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1414, file: !1415, line: 69, baseType: !28, size: 8, offset: 736)
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1414, file: !1415, line: 70, baseType: !28, size: 8, offset: 744)
!1441 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1443, file: !1441, line: 53)
!1443 = !DISubprogram(name: "setlocale", scope: !1444, file: !1444, line: 56, type: !1445, flags: DIFlagPrototyped, spFlags: 0)
!1444 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1445 = !DISubroutineType(types: !1446)
!1446 = !{!371, !7, !328}
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1448, file: !1441, line: 54)
!1448 = !DISubprogram(name: "localeconv", scope: !1415, file: !1415, line: 99, type: !1449, flags: DIFlagPrototyped, spFlags: 0)
!1449 = !DISubroutineType(types: !1450)
!1450 = !{!1451}
!1451 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1414, size: 64)
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !164, entity: !1453, file: !1455, line: 53)
!1453 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1454, line: 12, baseType: !452)
!1454 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stdarg_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "7bd78a282b99fcfe41a9e3c566d14f7d")
!1455 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1456 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1457 = !{i32 7, !"Dwarf Version", i32 5}
!1458 = !{i32 2, !"Debug Info Version", i32 3}
!1459 = !{i32 1, !"wchar_size", i32 4}
!1460 = !{i32 8, !"PIC Level", i32 2}
!1461 = !{i32 7, !"uwtable", i32 1}
!1462 = !{i32 7, !"frame-pointer", i32 1}
!1463 = !{!"Homebrew clang version 20.1.8"}
!1464 = distinct !DISubprogram(name: "collide_robot_and_wall", linkageName: "_Z22collide_robot_and_wallP6objectissP10vms_vector", scope: !25, file: !25, line: 92, type: !1465, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!1465 = !DISubroutineType(types: !1466)
!1466 = !{null, !1467, !15, !173, !173, !1604}
!1467 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1468, size: 64)
!1468 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !1469, line: 259, baseType: !1470)
!1469 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!1470 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !1469, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !1471, identifier: "_ZTS6object")
!1471 = !{!1472, !1473, !1474, !1475, !1476, !1477, !1478, !1479, !1480, !1481, !1482, !1483, !1491, !1498, !1499, !1500, !1501, !1502, !1503, !1504, !1505, !1506, !1524, !1578}
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !1470, file: !1469, line: 212, baseType: !7, size: 32)
!1473 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1470, file: !1469, line: 213, baseType: !177, size: 8, offset: 32)
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !1470, file: !1469, line: 214, baseType: !177, size: 8, offset: 40)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !1470, file: !1469, line: 215, baseType: !173, size: 16, offset: 48)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !1470, file: !1469, line: 215, baseType: !173, size: 16, offset: 64)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !1470, file: !1469, line: 216, baseType: !177, size: 8, offset: 80)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !1470, file: !1469, line: 217, baseType: !177, size: 8, offset: 88)
!1479 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !1470, file: !1469, line: 218, baseType: !177, size: 8, offset: 96)
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1470, file: !1469, line: 219, baseType: !177, size: 8, offset: 104)
!1481 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1470, file: !1469, line: 220, baseType: !173, size: 16, offset: 112)
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !1470, file: !1469, line: 221, baseType: !173, size: 16, offset: 128)
!1483 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1470, file: !1469, line: 222, baseType: !1484, size: 96, offset: 160)
!1484 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !1485, line: 22, baseType: !1486)
!1485 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!1486 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !1485, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !1487, identifier: "_ZTS10vms_vector")
!1487 = !{!1488, !1489, !1490}
!1488 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1486, file: !1485, line: 21, baseType: !15, size: 32)
!1489 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1486, file: !1485, line: 21, baseType: !15, size: 32, offset: 32)
!1490 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1486, file: !1485, line: 21, baseType: !15, size: 32, offset: 64)
!1491 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !1470, file: !1469, line: 223, baseType: !1492, size: 288, offset: 256)
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !1485, line: 47, baseType: !1493)
!1493 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !1485, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !1494, identifier: "_ZTS10vms_matrix")
!1494 = !{!1495, !1496, !1497}
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !1493, file: !1485, line: 46, baseType: !1484, size: 96)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !1493, file: !1485, line: 46, baseType: !1484, size: 96, offset: 96)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !1493, file: !1485, line: 46, baseType: !1484, size: 96, offset: 192)
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1470, file: !1469, line: 224, baseType: !15, size: 32, offset: 544)
!1499 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !1470, file: !1469, line: 225, baseType: !15, size: 32, offset: 576)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !1470, file: !1469, line: 226, baseType: !1484, size: 96, offset: 608)
!1501 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !1470, file: !1469, line: 227, baseType: !166, size: 8, offset: 704)
!1502 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !1470, file: !1469, line: 228, baseType: !166, size: 8, offset: 712)
!1503 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !1470, file: !1469, line: 229, baseType: !166, size: 8, offset: 720)
!1504 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !1470, file: !1469, line: 230, baseType: !166, size: 8, offset: 728)
!1505 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !1470, file: !1469, line: 231, baseType: !15, size: 32, offset: 736)
!1506 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !1470, file: !1469, line: 240, baseType: !1507, size: 512, offset: 768)
!1507 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1470, file: !1469, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !1508, identifier: "_ZTSN6objectUt_E")
!1508 = !{!1509, !1523}
!1509 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !1507, file: !1469, line: 238, baseType: !1510, size: 512)
!1510 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !1469, line: 153, baseType: !1511)
!1511 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !1469, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !1512, identifier: "_ZTS12physics_info")
!1512 = !{!1513, !1514, !1515, !1516, !1517, !1518, !1519, !1520, !1522}
!1513 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !1511, file: !1469, line: 144, baseType: !1484, size: 96)
!1514 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !1511, file: !1469, line: 145, baseType: !1484, size: 96, offset: 96)
!1515 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !1511, file: !1469, line: 146, baseType: !15, size: 32, offset: 192)
!1516 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !1511, file: !1469, line: 147, baseType: !15, size: 32, offset: 224)
!1517 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !1511, file: !1469, line: 148, baseType: !15, size: 32, offset: 256)
!1518 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !1511, file: !1469, line: 149, baseType: !1484, size: 96, offset: 288)
!1519 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !1511, file: !1469, line: 150, baseType: !1484, size: 96, offset: 384)
!1520 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !1511, file: !1469, line: 151, baseType: !1521, size: 16, offset: 480)
!1521 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !16, line: 21, baseType: !173)
!1522 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1511, file: !1469, line: 152, baseType: !181, size: 16, offset: 496)
!1523 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !1507, file: !1469, line: 239, baseType: !1484, size: 96)
!1524 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !1470, file: !1469, line: 250, baseType: !1525, size: 256, offset: 1280)
!1525 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1470, file: !1469, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !1526, identifier: "_ZTSN6objectUt0_E")
!1526 = !{!1527, !1538, !1548, !1566, !1571}
!1527 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !1525, file: !1469, line: 245, baseType: !1528, size: 160)
!1528 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !1469, line: 166, baseType: !1529)
!1529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !1469, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !1530, identifier: "_ZTS12laser_info_s")
!1530 = !{!1531, !1532, !1533, !1534, !1535, !1536, !1537}
!1531 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !1529, file: !1469, line: 159, baseType: !173, size: 16)
!1532 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !1529, file: !1469, line: 160, baseType: !173, size: 16, offset: 16)
!1533 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !1529, file: !1469, line: 161, baseType: !7, size: 32, offset: 32)
!1534 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1529, file: !1469, line: 162, baseType: !15, size: 32, offset: 64)
!1535 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !1529, file: !1469, line: 163, baseType: !173, size: 16, offset: 96)
!1536 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !1529, file: !1469, line: 164, baseType: !173, size: 16, offset: 112)
!1537 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !1529, file: !1469, line: 165, baseType: !15, size: 32, offset: 128)
!1538 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !1525, file: !1469, line: 246, baseType: !1539, size: 128)
!1539 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !1469, line: 176, baseType: !1540)
!1540 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !1469, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !1541, identifier: "_ZTS14explosion_info")
!1541 = !{!1542, !1543, !1544, !1545, !1546, !1547}
!1542 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !1540, file: !1469, line: 170, baseType: !15, size: 32)
!1543 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !1540, file: !1469, line: 171, baseType: !15, size: 32, offset: 32)
!1544 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !1540, file: !1469, line: 172, baseType: !173, size: 16, offset: 64)
!1545 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !1540, file: !1469, line: 173, baseType: !173, size: 16, offset: 80)
!1546 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !1540, file: !1469, line: 174, baseType: !173, size: 16, offset: 96)
!1547 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !1540, file: !1469, line: 175, baseType: !173, size: 16, offset: 112)
!1548 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !1525, file: !1469, line: 247, baseType: !1549, size: 256)
!1549 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !1550, line: 144, baseType: !1551)
!1550 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!1551 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !1550, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !1552, identifier: "_ZTS9ai_static")
!1552 = !{!1553, !1554, !1558, !1559, !1560, !1561, !1562, !1563, !1564, !1565}
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !1551, file: !1550, line: 128, baseType: !177, size: 8)
!1554 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1551, file: !1550, line: 129, baseType: !1555, size: 88, offset: 8)
!1555 = !DICompositeType(tag: DW_TAG_array_type, baseType: !166, size: 88, elements: !1556)
!1556 = !{!1557}
!1557 = !DISubrange(count: 11)
!1558 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !1551, file: !1550, line: 130, baseType: !173, size: 16, offset: 96)
!1559 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !1551, file: !1550, line: 131, baseType: !173, size: 16, offset: 112)
!1560 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !1551, file: !1550, line: 132, baseType: !173, size: 16, offset: 128)
!1561 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !1551, file: !1550, line: 133, baseType: !166, size: 8, offset: 144)
!1562 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !1551, file: !1550, line: 134, baseType: !166, size: 8, offset: 152)
!1563 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !1551, file: !1550, line: 139, baseType: !173, size: 16, offset: 160)
!1564 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !1551, file: !1550, line: 140, baseType: !7, size: 32, offset: 192)
!1565 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !1551, file: !1550, line: 141, baseType: !15, size: 32, offset: 224)
!1566 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !1525, file: !1469, line: 248, baseType: !1567, size: 32)
!1567 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !1469, line: 181, baseType: !1568)
!1568 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !1469, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !1569, identifier: "_ZTS12light_info_s")
!1569 = !{!1570}
!1570 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !1568, file: !1469, line: 180, baseType: !15, size: 32)
!1571 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !1525, file: !1469, line: 249, baseType: !1572, size: 96)
!1572 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !1469, line: 190, baseType: !1573)
!1573 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !1469, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !1574, identifier: "_ZTS14powerup_info_s")
!1574 = !{!1575, !1576, !1577}
!1575 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !1573, file: !1469, line: 187, baseType: !7, size: 32)
!1576 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1573, file: !1469, line: 188, baseType: !15, size: 32, offset: 32)
!1577 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1573, file: !1469, line: 189, baseType: !7, size: 32, offset: 64)
!1578 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !1470, file: !1469, line: 257, baseType: !1579, size: 608, offset: 1536)
!1579 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1470, file: !1469, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !1580, identifier: "_ZTSN6objectUt1_E")
!1580 = !{!1581, !1597}
!1581 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !1579, file: !1469, line: 255, baseType: !1582, size: 608)
!1582 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !1469, line: 208, baseType: !1583)
!1583 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !1469, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !1584, identifier: "_ZTS12polyobj_info")
!1584 = !{!1585, !1586, !1594, !1595, !1596}
!1585 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !1583, file: !1469, line: 203, baseType: !7, size: 32)
!1586 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !1583, file: !1469, line: 204, baseType: !1587, size: 480, offset: 32)
!1587 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1588, size: 480, elements: !104)
!1588 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !1485, line: 40, baseType: !1589)
!1589 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !1485, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !1590, identifier: "_ZTS10vms_angvec")
!1590 = !{!1591, !1592, !1593}
!1591 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1589, file: !1485, line: 39, baseType: !1521, size: 16)
!1592 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !1589, file: !1485, line: 39, baseType: !1521, size: 16, offset: 16)
!1593 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !1589, file: !1485, line: 39, baseType: !1521, size: 16, offset: 32)
!1594 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !1583, file: !1469, line: 205, baseType: !7, size: 32, offset: 512)
!1595 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !1583, file: !1469, line: 206, baseType: !7, size: 32, offset: 544)
!1596 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !1583, file: !1469, line: 207, baseType: !7, size: 32, offset: 576)
!1597 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !1579, file: !1469, line: 256, baseType: !1598, size: 96)
!1598 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !1469, line: 197, baseType: !1599)
!1599 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !1469, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !1600, identifier: "_ZTS12vclip_info_s")
!1600 = !{!1601, !1602, !1603}
!1601 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !1599, file: !1469, line: 194, baseType: !7, size: 32)
!1602 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !1599, file: !1469, line: 195, baseType: !15, size: 32, offset: 32)
!1603 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !1599, file: !1469, line: 196, baseType: !166, size: 8, offset: 64)
!1604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1484, size: 64)
!1605 = !{}
!1606 = !DILocalVariable(name: "robot", arg: 1, scope: !1464, file: !25, line: 92, type: !1467)
!1607 = !DILocation(line: 92, column: 37, scope: !1464)
!1608 = !DILocalVariable(name: "hitspeed", arg: 2, scope: !1464, file: !25, line: 92, type: !15)
!1609 = !DILocation(line: 92, column: 48, scope: !1464)
!1610 = !DILocalVariable(name: "hitseg", arg: 3, scope: !1464, file: !25, line: 92, type: !173)
!1611 = !DILocation(line: 92, column: 64, scope: !1464)
!1612 = !DILocalVariable(name: "hitwall", arg: 4, scope: !1464, file: !25, line: 92, type: !173)
!1613 = !DILocation(line: 92, column: 78, scope: !1464)
!1614 = !DILocalVariable(name: "hitpt", arg: 5, scope: !1464, file: !25, line: 92, type: !1604)
!1615 = !DILocation(line: 92, column: 99, scope: !1464)
!1616 = !DILocalVariable(name: "ailp", scope: !1464, file: !25, line: 94, type: !1617)
!1617 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1618, size: 64)
!1618 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_local", file: !1550, line: 173, baseType: !1619)
!1619 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_local", file: !1550, line: 147, size: 1600, flags: DIFlagTypePassByValue, elements: !1620, identifier: "_ZTS8ai_local")
!1620 = !{!1621, !1622, !1623, !1624, !1625, !1626, !1627, !1628, !1629, !1630, !1631, !1632, !1633, !1634, !1635, !1636, !1637, !1638, !1640}
!1621 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_type", scope: !1619, file: !1550, line: 151, baseType: !7, size: 32)
!1622 = !DIDerivedType(tag: DW_TAG_member, name: "retry_count", scope: !1619, file: !1550, line: 152, baseType: !7, size: 32, offset: 32)
!1623 = !DIDerivedType(tag: DW_TAG_member, name: "consecutive_retries", scope: !1619, file: !1550, line: 153, baseType: !7, size: 32, offset: 64)
!1624 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !1619, file: !1550, line: 154, baseType: !7, size: 32, offset: 96)
!1625 = !DIDerivedType(tag: DW_TAG_member, name: "previous_visibility", scope: !1619, file: !1550, line: 155, baseType: !7, size: 32, offset: 128)
!1626 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !1619, file: !1550, line: 156, baseType: !7, size: 32, offset: 160)
!1627 = !DIDerivedType(tag: DW_TAG_member, name: "goal_segment", scope: !1619, file: !1550, line: 157, baseType: !7, size: 32, offset: 192)
!1628 = !DIDerivedType(tag: DW_TAG_member, name: "next_action_time", scope: !1619, file: !1550, line: 161, baseType: !15, size: 32, offset: 224)
!1629 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire", scope: !1619, file: !1550, line: 162, baseType: !15, size: 32, offset: 256)
!1630 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire2", scope: !1619, file: !1550, line: 163, baseType: !15, size: 32, offset: 288)
!1631 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_time", scope: !1619, file: !1550, line: 164, baseType: !15, size: 32, offset: 320)
!1632 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_seen", scope: !1619, file: !1550, line: 165, baseType: !15, size: 32, offset: 352)
!1633 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_sound_attacked", scope: !1619, file: !1550, line: 166, baseType: !15, size: 32, offset: 384)
!1634 = !DIDerivedType(tag: DW_TAG_member, name: "next_misc_sound_time", scope: !1619, file: !1550, line: 167, baseType: !15, size: 32, offset: 416)
!1635 = !DIDerivedType(tag: DW_TAG_member, name: "time_since_processed", scope: !1619, file: !1550, line: 168, baseType: !15, size: 32, offset: 448)
!1636 = !DIDerivedType(tag: DW_TAG_member, name: "goal_angles", scope: !1619, file: !1550, line: 169, baseType: !1587, size: 480, offset: 480)
!1637 = !DIDerivedType(tag: DW_TAG_member, name: "delta_angles", scope: !1619, file: !1550, line: 170, baseType: !1587, size: 480, offset: 960)
!1638 = !DIDerivedType(tag: DW_TAG_member, name: "goal_state", scope: !1619, file: !1550, line: 171, baseType: !1639, size: 80, offset: 1440)
!1639 = !DICompositeType(tag: DW_TAG_array_type, baseType: !166, size: 80, elements: !104)
!1640 = !DIDerivedType(tag: DW_TAG_member, name: "achieved_state", scope: !1619, file: !1550, line: 172, baseType: !1639, size: 80, offset: 1520)
!1641 = !DILocation(line: 94, column: 12, scope: !1464)
!1642 = !DILocation(line: 94, column: 34, scope: !1464)
!1643 = !DILocation(line: 94, column: 40, scope: !1464)
!1644 = !DILocation(line: 94, column: 20, scope: !1464)
!1645 = !DILocation(line: 96, column: 7, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1464, file: !25, line: 96, column: 6)
!1647 = !DILocation(line: 96, column: 14, scope: !1646)
!1648 = !DILocation(line: 96, column: 17, scope: !1646)
!1649 = !DILocation(line: 96, column: 33, scope: !1646)
!1650 = !DILocation(line: 96, column: 37, scope: !1646)
!1651 = !DILocation(line: 96, column: 44, scope: !1646)
!1652 = !DILocation(line: 96, column: 58, scope: !1646)
!1653 = !DILocation(line: 96, column: 67, scope: !1646)
!1654 = !DILocation(line: 96, column: 84, scope: !1646)
!1655 = !DILocation(line: 96, column: 99, scope: !1646)
!1656 = !DILocation(line: 96, column: 106, scope: !1646)
!1657 = !DILocation(line: 96, column: 88, scope: !1646)
!1658 = !DILocation(line: 96, column: 110, scope: !1646)
!1659 = !DILocation(line: 96, column: 120, scope: !1646)
!1660 = !DILocation(line: 96, column: 126, scope: !1646)
!1661 = !DILocation(line: 96, column: 130, scope: !1646)
!1662 = !DILocation(line: 96, column: 137, scope: !1646)
!1663 = !DILocation(line: 96, column: 151, scope: !1646)
!1664 = !DILocation(line: 96, column: 160, scope: !1646)
!1665 = !DILocalVariable(name: "wall_num", scope: !1666, file: !25, line: 97, type: !7)
!1666 = distinct !DILexicalBlock(scope: !1646, file: !25, line: 96, column: 175)
!1667 = !DILocation(line: 97, column: 7, scope: !1666)
!1668 = !DILocation(line: 97, column: 27, scope: !1666)
!1669 = !DILocation(line: 97, column: 18, scope: !1666)
!1670 = !DILocation(line: 97, column: 35, scope: !1666)
!1671 = !DILocation(line: 97, column: 41, scope: !1666)
!1672 = !DILocation(line: 97, column: 50, scope: !1666)
!1673 = !DILocation(line: 98, column: 7, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1666, file: !25, line: 98, column: 7)
!1675 = !DILocation(line: 98, column: 16, scope: !1674)
!1676 = !DILocation(line: 99, column: 15, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1678, file: !25, line: 99, column: 8)
!1678 = distinct !DILexicalBlock(scope: !1674, file: !25, line: 98, column: 23)
!1679 = !DILocation(line: 99, column: 9, scope: !1677)
!1680 = !DILocation(line: 99, column: 25, scope: !1677)
!1681 = !DILocation(line: 99, column: 30, scope: !1677)
!1682 = !DILocation(line: 99, column: 44, scope: !1677)
!1683 = !DILocation(line: 99, column: 54, scope: !1677)
!1684 = !DILocation(line: 99, column: 48, scope: !1677)
!1685 = !DILocation(line: 99, column: 64, scope: !1677)
!1686 = !DILocation(line: 99, column: 69, scope: !1677)
!1687 = !DILocation(line: 99, column: 82, scope: !1677)
!1688 = !DILocation(line: 99, column: 92, scope: !1677)
!1689 = !DILocation(line: 99, column: 86, scope: !1677)
!1690 = !DILocation(line: 99, column: 102, scope: !1677)
!1691 = !DILocation(line: 99, column: 108, scope: !1677)
!1692 = !DILocation(line: 99, column: 129, scope: !1677)
!1693 = !DILocation(line: 99, column: 140, scope: !1677)
!1694 = !DILocation(line: 99, column: 134, scope: !1677)
!1695 = !DILocation(line: 99, column: 150, scope: !1677)
!1696 = !DILocation(line: 99, column: 156, scope: !1677)
!1697 = !DILocation(line: 99, column: 133, scope: !1677)
!1698 = !DILocation(line: 101, column: 30, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1677, file: !25, line: 99, column: 177)
!1700 = !DILocation(line: 101, column: 21, scope: !1699)
!1701 = !DILocation(line: 101, column: 39, scope: !1699)
!1702 = !DILocation(line: 101, column: 5, scope: !1699)
!1703 = !DILocation(line: 104, column: 4, scope: !1699)
!1704 = !DILocation(line: 105, column: 25, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1677, file: !25, line: 105, column: 13)
!1706 = !DILocation(line: 105, column: 32, scope: !1705)
!1707 = !DILocation(line: 105, column: 14, scope: !1705)
!1708 = !DILocation(line: 105, column: 36, scope: !1705)
!1709 = !DILocation(line: 105, column: 46, scope: !1705)
!1710 = !DILocation(line: 105, column: 52, scope: !1705)
!1711 = !DILocation(line: 105, column: 62, scope: !1705)
!1712 = !DILocation(line: 105, column: 56, scope: !1705)
!1713 = !DILocation(line: 105, column: 72, scope: !1705)
!1714 = !DILocation(line: 105, column: 77, scope: !1705)
!1715 = !DILocation(line: 106, column: 10, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1717, file: !25, line: 106, column: 9)
!1717 = distinct !DILexicalBlock(scope: !1705, file: !25, line: 105, column: 92)
!1718 = !DILocation(line: 106, column: 16, scope: !1716)
!1719 = !DILocation(line: 106, column: 21, scope: !1716)
!1720 = !DILocation(line: 106, column: 41, scope: !1716)
!1721 = !DILocation(line: 106, column: 45, scope: !1716)
!1722 = !DILocation(line: 106, column: 65, scope: !1716)
!1723 = !DILocation(line: 107, column: 16, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1725, file: !25, line: 107, column: 10)
!1725 = distinct !DILexicalBlock(scope: !1716, file: !25, line: 106, column: 88)
!1726 = !DILocation(line: 107, column: 10, scope: !1724)
!1727 = !DILocation(line: 107, column: 26, scope: !1724)
!1728 = !DILocation(line: 107, column: 31, scope: !1724)
!1729 = !DILocation(line: 108, column: 17, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1731, file: !25, line: 108, column: 11)
!1731 = distinct !DILexicalBlock(scope: !1724, file: !25, line: 107, column: 44)
!1732 = !DILocation(line: 108, column: 11, scope: !1730)
!1733 = !DILocation(line: 108, column: 27, scope: !1730)
!1734 = !DILocation(line: 108, column: 42, scope: !1730)
!1735 = !DILocation(line: 108, column: 34, scope: !1730)
!1736 = !DILocation(line: 108, column: 54, scope: !1730)
!1737 = !DILocation(line: 108, column: 32, scope: !1730)
!1738 = !DILocation(line: 109, column: 33, scope: !1730)
!1739 = !DILocation(line: 109, column: 24, scope: !1730)
!1740 = !DILocation(line: 109, column: 42, scope: !1730)
!1741 = !DILocation(line: 109, column: 8, scope: !1730)
!1742 = !DILocation(line: 110, column: 6, scope: !1731)
!1743 = !DILocation(line: 111, column: 23, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1724, file: !25, line: 111, column: 15)
!1745 = !DILocation(line: 111, column: 17, scope: !1744)
!1746 = !DILocation(line: 111, column: 33, scope: !1744)
!1747 = !DILocation(line: 111, column: 39, scope: !1744)
!1748 = !DILocation(line: 111, column: 16, scope: !1744)
!1749 = !DILocation(line: 111, column: 15, scope: !1744)
!1750 = !DILocation(line: 112, column: 32, scope: !1744)
!1751 = !DILocation(line: 112, column: 23, scope: !1744)
!1752 = !DILocation(line: 112, column: 41, scope: !1744)
!1753 = !DILocation(line: 112, column: 7, scope: !1744)
!1754 = !DILocation(line: 113, column: 5, scope: !1725)
!1755 = !DILocation(line: 114, column: 4, scope: !1717)
!1756 = !DILocation(line: 115, column: 24, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1705, file: !25, line: 115, column: 13)
!1758 = !DILocation(line: 115, column: 31, scope: !1757)
!1759 = !DILocation(line: 115, column: 13, scope: !1757)
!1760 = !DILocation(line: 115, column: 35, scope: !1757)
!1761 = !DILocation(line: 116, column: 15, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1763, file: !25, line: 116, column: 9)
!1763 = distinct !DILexicalBlock(scope: !1757, file: !25, line: 115, column: 42)
!1764 = !DILocation(line: 116, column: 9, scope: !1762)
!1765 = !DILocation(line: 116, column: 25, scope: !1762)
!1766 = !DILocation(line: 116, column: 30, scope: !1762)
!1767 = !DILocation(line: 117, column: 16, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1762, file: !25, line: 117, column: 10)
!1769 = !DILocation(line: 117, column: 10, scope: !1768)
!1770 = !DILocation(line: 117, column: 26, scope: !1768)
!1771 = !DILocation(line: 117, column: 41, scope: !1768)
!1772 = !DILocation(line: 117, column: 33, scope: !1768)
!1773 = !DILocation(line: 117, column: 53, scope: !1768)
!1774 = !DILocation(line: 117, column: 31, scope: !1768)
!1775 = !DILocation(line: 118, column: 32, scope: !1768)
!1776 = !DILocation(line: 118, column: 23, scope: !1768)
!1777 = !DILocation(line: 118, column: 41, scope: !1768)
!1778 = !DILocation(line: 118, column: 7, scope: !1768)
!1779 = !DILocation(line: 119, column: 4, scope: !1763)
!1780 = !DILocation(line: 120, column: 3, scope: !1678)
!1781 = !DILocation(line: 121, column: 2, scope: !1666)
!1782 = !DILocation(line: 123, column: 2, scope: !1464)
!1783 = distinct !DISubprogram(name: "apply_damage_to_clutter", linkageName: "_Z23apply_damage_to_clutterP6objecti", scope: !25, file: !25, line: 132, type: !1784, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!1784 = !DISubroutineType(types: !1785)
!1785 = !{!7, !1467, !15}
!1786 = !DILocalVariable(name: "clutter", arg: 1, scope: !1783, file: !25, line: 132, type: !1467)
!1787 = !DILocation(line: 132, column: 37, scope: !1783)
!1788 = !DILocalVariable(name: "damage", arg: 2, scope: !1783, file: !25, line: 132, type: !15)
!1789 = !DILocation(line: 132, column: 50, scope: !1783)
!1790 = !DILocation(line: 151, column: 6, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1783, file: !25, line: 151, column: 6)
!1792 = !DILocation(line: 151, column: 15, scope: !1791)
!1793 = !DILocation(line: 151, column: 21, scope: !1791)
!1794 = !DILocation(line: 151, column: 37, scope: !1791)
!1795 = !DILocation(line: 153, column: 6, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1783, file: !25, line: 153, column: 6)
!1797 = !DILocation(line: 153, column: 15, scope: !1796)
!1798 = !DILocation(line: 153, column: 23, scope: !1796)
!1799 = !DILocation(line: 153, column: 28, scope: !1796)
!1800 = !DILocation(line: 155, column: 22, scope: !1783)
!1801 = !DILocation(line: 155, column: 2, scope: !1783)
!1802 = !DILocation(line: 155, column: 11, scope: !1783)
!1803 = !DILocation(line: 155, column: 19, scope: !1783)
!1804 = !DILocation(line: 157, column: 6, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1783, file: !25, line: 157, column: 6)
!1806 = !DILocation(line: 157, column: 15, scope: !1805)
!1807 = !DILocation(line: 157, column: 23, scope: !1805)
!1808 = !DILocation(line: 158, column: 18, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1805, file: !25, line: 157, column: 28)
!1810 = !DILocation(line: 158, column: 3, scope: !1809)
!1811 = !DILocation(line: 159, column: 3, scope: !1809)
!1812 = !DILocation(line: 162, column: 3, scope: !1805)
!1813 = !DILocation(line: 164, column: 1, scope: !1783)
!1814 = distinct !DISubprogram(name: "apply_force_damage", linkageName: "_Z18apply_force_damageP6objectiS0_", scope: !25, file: !25, line: 169, type: !1815, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!1815 = !DISubroutineType(types: !1816)
!1816 = !{null, !1467, !15, !1467}
!1817 = !DILocalVariable(name: "obj", arg: 1, scope: !1814, file: !25, line: 169, type: !1467)
!1818 = !DILocation(line: 169, column: 33, scope: !1814)
!1819 = !DILocalVariable(name: "force", arg: 2, scope: !1814, file: !25, line: 169, type: !15)
!1820 = !DILocation(line: 169, column: 42, scope: !1814)
!1821 = !DILocalVariable(name: "other_obj", arg: 3, scope: !1814, file: !25, line: 169, type: !1467)
!1822 = !DILocation(line: 169, column: 57, scope: !1814)
!1823 = !DILocalVariable(name: "result", scope: !1814, file: !25, line: 171, type: !7)
!1824 = !DILocation(line: 171, column: 6, scope: !1814)
!1825 = !DILocalVariable(name: "damage", scope: !1814, file: !25, line: 172, type: !15)
!1826 = !DILocation(line: 172, column: 6, scope: !1814)
!1827 = !DILocation(line: 174, column: 6, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1814, file: !25, line: 174, column: 6)
!1829 = !DILocation(line: 174, column: 11, scope: !1828)
!1830 = !DILocation(line: 174, column: 17, scope: !1828)
!1831 = !DILocation(line: 175, column: 3, scope: !1828)
!1832 = !DILocation(line: 177, column: 18, scope: !1814)
!1833 = !DILocation(line: 177, column: 25, scope: !1814)
!1834 = !DILocation(line: 177, column: 30, scope: !1814)
!1835 = !DILocation(line: 177, column: 46, scope: !1814)
!1836 = !DILocation(line: 177, column: 11, scope: !1814)
!1837 = !DILocation(line: 177, column: 52, scope: !1814)
!1838 = !DILocation(line: 177, column: 9, scope: !1814)
!1839 = !DILocation(line: 179, column: 7, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1814, file: !25, line: 179, column: 6)
!1841 = !DILocation(line: 179, column: 18, scope: !1840)
!1842 = !DILocation(line: 179, column: 23, scope: !1840)
!1843 = !DILocation(line: 179, column: 38, scope: !1840)
!1844 = !DILocation(line: 179, column: 41, scope: !1840)
!1845 = !DILocation(line: 180, column: 10, scope: !1840)
!1846 = !DILocation(line: 180, column: 3, scope: !1840)
!1847 = !DILocation(line: 184, column: 10, scope: !1814)
!1848 = !DILocation(line: 184, column: 15, scope: !1814)
!1849 = !DILocation(line: 184, column: 2, scope: !1814)
!1850 = !DILocation(line: 188, column: 18, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1852, file: !25, line: 188, column: 7)
!1852 = distinct !DILexicalBlock(scope: !1814, file: !25, line: 184, column: 21)
!1853 = !DILocation(line: 188, column: 23, scope: !1851)
!1854 = !DILocation(line: 188, column: 7, scope: !1851)
!1855 = !DILocation(line: 188, column: 27, scope: !1851)
!1856 = !DILocation(line: 188, column: 39, scope: !1851)
!1857 = !DILocation(line: 189, column: 8, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1859, file: !25, line: 189, column: 8)
!1859 = distinct !DILexicalBlock(scope: !1851, file: !25, line: 188, column: 45)
!1860 = !DILocation(line: 189, column: 19, scope: !1858)
!1861 = !DILocation(line: 189, column: 24, scope: !1858)
!1862 = !DILocation(line: 190, column: 36, scope: !1858)
!1863 = !DILocation(line: 190, column: 41, scope: !1858)
!1864 = !DILocation(line: 190, column: 48, scope: !1858)
!1865 = !DILocation(line: 190, column: 53, scope: !1858)
!1866 = !DILocation(line: 190, column: 64, scope: !1858)
!1867 = !DILocation(line: 190, column: 81, scope: !1858)
!1868 = !DILocation(line: 190, column: 14, scope: !1858)
!1869 = !DILocation(line: 190, column: 12, scope: !1858)
!1870 = !DILocation(line: 190, column: 5, scope: !1858)
!1871 = !DILocation(line: 192, column: 36, scope: !1858)
!1872 = !DILocation(line: 192, column: 41, scope: !1858)
!1873 = !DILocation(line: 192, column: 48, scope: !1858)
!1874 = !DILocation(line: 192, column: 53, scope: !1858)
!1875 = !DILocation(line: 192, column: 63, scope: !1858)
!1876 = !DILocation(line: 192, column: 14, scope: !1858)
!1877 = !DILocation(line: 192, column: 12, scope: !1858)
!1878 = !DILocation(line: 193, column: 3, scope: !1859)
!1879 = !DILocation(line: 195, column: 8, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1881, file: !25, line: 195, column: 8)
!1881 = distinct !DILexicalBlock(scope: !1851, file: !25, line: 194, column: 8)
!1882 = !DILocation(line: 195, column: 19, scope: !1880)
!1883 = !DILocation(line: 195, column: 24, scope: !1880)
!1884 = !DILocation(line: 196, column: 36, scope: !1880)
!1885 = !DILocation(line: 196, column: 41, scope: !1880)
!1886 = !DILocation(line: 196, column: 48, scope: !1880)
!1887 = !DILocation(line: 196, column: 53, scope: !1880)
!1888 = !DILocation(line: 196, column: 64, scope: !1880)
!1889 = !DILocation(line: 196, column: 81, scope: !1880)
!1890 = !DILocation(line: 196, column: 14, scope: !1880)
!1891 = !DILocation(line: 196, column: 12, scope: !1880)
!1892 = !DILocation(line: 196, column: 5, scope: !1880)
!1893 = !DILocation(line: 198, column: 36, scope: !1880)
!1894 = !DILocation(line: 198, column: 41, scope: !1880)
!1895 = !DILocation(line: 198, column: 48, scope: !1880)
!1896 = !DILocation(line: 198, column: 53, scope: !1880)
!1897 = !DILocation(line: 198, column: 63, scope: !1880)
!1898 = !DILocation(line: 198, column: 14, scope: !1880)
!1899 = !DILocation(line: 198, column: 12, scope: !1880)
!1900 = !DILocation(line: 201, column: 7, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1852, file: !25, line: 201, column: 7)
!1902 = !DILocation(line: 201, column: 14, scope: !1901)
!1903 = !DILocation(line: 201, column: 18, scope: !1901)
!1904 = !DILocation(line: 201, column: 29, scope: !1901)
!1905 = !DILocation(line: 201, column: 46, scope: !1901)
!1906 = !DILocation(line: 201, column: 66, scope: !1901)
!1907 = !DILocation(line: 201, column: 81, scope: !1901)
!1908 = !DILocation(line: 201, column: 63, scope: !1901)
!1909 = !DILocation(line: 202, column: 35, scope: !1901)
!1910 = !DILocation(line: 202, column: 40, scope: !1901)
!1911 = !DILocation(line: 202, column: 24, scope: !1901)
!1912 = !DILocation(line: 202, column: 44, scope: !1901)
!1913 = !DILocation(line: 202, column: 4, scope: !1901)
!1914 = !DILocation(line: 203, column: 3, scope: !1852)
!1915 = !DILocation(line: 209, column: 8, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1852, file: !25, line: 209, column: 7)
!1917 = !DILocation(line: 209, column: 19, scope: !1916)
!1918 = !DILocation(line: 209, column: 24, scope: !1916)
!1919 = !DILocation(line: 209, column: 38, scope: !1916)
!1920 = !DILocation(line: 209, column: 53, scope: !1916)
!1921 = !DILocation(line: 209, column: 64, scope: !1916)
!1922 = !DILocation(line: 209, column: 42, scope: !1916)
!1923 = !DILocation(line: 209, column: 68, scope: !1916)
!1924 = !DILocation(line: 209, column: 41, scope: !1916)
!1925 = !DILocation(line: 210, column: 20, scope: !1916)
!1926 = !DILocation(line: 210, column: 28, scope: !1916)
!1927 = !DILocation(line: 210, column: 38, scope: !1916)
!1928 = !DILocation(line: 210, column: 13, scope: !1916)
!1929 = !DILocation(line: 210, column: 11, scope: !1916)
!1930 = !DILocation(line: 210, column: 4, scope: !1916)
!1931 = !DILocation(line: 213, column: 7, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1852, file: !25, line: 213, column: 7)
!1933 = !DILocation(line: 213, column: 24, scope: !1932)
!1934 = !DILocation(line: 214, column: 11, scope: !1932)
!1935 = !DILocation(line: 214, column: 4, scope: !1932)
!1936 = !DILocation(line: 216, column: 26, scope: !1852)
!1937 = !DILocation(line: 216, column: 31, scope: !1852)
!1938 = !DILocation(line: 216, column: 42, scope: !1852)
!1939 = !DILocation(line: 216, column: 3, scope: !1852)
!1940 = !DILocation(line: 217, column: 3, scope: !1852)
!1941 = !DILocation(line: 221, column: 27, scope: !1852)
!1942 = !DILocation(line: 221, column: 32, scope: !1852)
!1943 = !DILocation(line: 221, column: 3, scope: !1852)
!1944 = !DILocation(line: 222, column: 3, scope: !1852)
!1945 = !DILocation(line: 226, column: 30, scope: !1852)
!1946 = !DILocation(line: 226, column: 35, scope: !1852)
!1947 = !DILocation(line: 226, column: 43, scope: !1852)
!1948 = !DILocation(line: 226, column: 53, scope: !1852)
!1949 = !DILocation(line: 226, column: 3, scope: !1852)
!1950 = !DILocation(line: 227, column: 3, scope: !1852)
!1951 = !DILocation(line: 231, column: 3, scope: !1852)
!1952 = !DILocation(line: 235, column: 3, scope: !1852)
!1953 = !DILocation(line: 237, column: 2, scope: !1852)
!1954 = !DILocation(line: 238, column: 1, scope: !1814)
!1955 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !16, file: !16, line: 89, type: !1956, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!1956 = !DISubroutineType(types: !1957)
!1957 = !{!15, !15, !15}
!1958 = !DILocalVariable(name: "a", arg: 1, scope: !1955, file: !16, line: 89, type: !15)
!1959 = !DILocation(line: 89, column: 26, scope: !1955)
!1960 = !DILocalVariable(name: "b", arg: 2, scope: !1955, file: !16, line: 89, type: !15)
!1961 = !DILocation(line: 89, column: 33, scope: !1955)
!1962 = !DILocation(line: 92, column: 6, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1955, file: !16, line: 92, column: 6)
!1964 = !DILocation(line: 92, column: 8, scope: !1963)
!1965 = !DILocation(line: 92, column: 14, scope: !1963)
!1966 = !DILocation(line: 94, column: 25, scope: !1955)
!1967 = !DILocation(line: 94, column: 27, scope: !1955)
!1968 = !DILocation(line: 94, column: 36, scope: !1955)
!1969 = !DILocation(line: 94, column: 34, scope: !1955)
!1970 = !DILocation(line: 94, column: 14, scope: !1955)
!1971 = !DILocation(line: 94, column: 2, scope: !1955)
!1972 = !DILocation(line: 95, column: 1, scope: !1955)
!1973 = distinct !DISubprogram(name: "apply_damage_to_robot", linkageName: "_Z21apply_damage_to_robotP6objectii", scope: !25, file: !25, line: 1450, type: !1974, scopeLine: 1451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!1974 = !DISubroutineType(types: !1975)
!1975 = !{!7, !1467, !15, !7}
!1976 = !DILocalVariable(name: "robot", arg: 1, scope: !1973, file: !25, line: 1450, type: !1467)
!1977 = !DILocation(line: 1450, column: 35, scope: !1973)
!1978 = !DILocalVariable(name: "damage", arg: 2, scope: !1973, file: !25, line: 1450, type: !15)
!1979 = !DILocation(line: 1450, column: 46, scope: !1973)
!1980 = !DILocalVariable(name: "killer_objnum", arg: 3, scope: !1973, file: !25, line: 1450, type: !7)
!1981 = !DILocation(line: 1450, column: 58, scope: !1973)
!1982 = !DILocalVariable(name: "isthief", scope: !1973, file: !25, line: 1558, type: !28)
!1983 = !DILocation(line: 1558, column: 7, scope: !1973)
!1984 = !DILocalVariable(name: "i", scope: !1973, file: !25, line: 1559, type: !28)
!1985 = !DILocation(line: 1559, column: 7, scope: !1973)
!1986 = !DILocalVariable(name: "temp_stolen", scope: !1973, file: !25, line: 1559, type: !1987)
!1987 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 80, elements: !104)
!1988 = !DILocation(line: 1559, column: 10, scope: !1973)
!1989 = !DILocation(line: 1561, column: 6, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1973, file: !25, line: 1561, column: 6)
!1991 = !DILocation(line: 1561, column: 13, scope: !1990)
!1992 = !DILocation(line: 1561, column: 19, scope: !1990)
!1993 = !DILocation(line: 1561, column: 35, scope: !1990)
!1994 = !DILocation(line: 1563, column: 6, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1973, file: !25, line: 1563, column: 6)
!1996 = !DILocation(line: 1563, column: 13, scope: !1995)
!1997 = !DILocation(line: 1563, column: 21, scope: !1995)
!1998 = !DILocation(line: 1563, column: 26, scope: !1995)
!1999 = !DILocation(line: 1565, column: 17, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1973, file: !25, line: 1565, column: 6)
!2001 = !DILocation(line: 1565, column: 24, scope: !2000)
!2002 = !DILocation(line: 1565, column: 6, scope: !2000)
!2003 = !DILocation(line: 1565, column: 28, scope: !2000)
!2004 = !DILocation(line: 1566, column: 19, scope: !2000)
!2005 = !DILocation(line: 1566, column: 17, scope: !2000)
!2006 = !DILocation(line: 1566, column: 3, scope: !2000)
!2007 = !DILocation(line: 1570, column: 17, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !1973, file: !25, line: 1570, column: 6)
!2009 = !DILocation(line: 1570, column: 24, scope: !2008)
!2010 = !DILocation(line: 1570, column: 6, scope: !2008)
!2011 = !DILocation(line: 1570, column: 28, scope: !2008)
!2012 = !DILocation(line: 1572, column: 8, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2008, file: !25, line: 1572, column: 7)
!2014 = !DILocation(line: 1572, column: 28, scope: !2013)
!2015 = !DILocation(line: 1572, column: 33, scope: !2013)
!2016 = !DILocation(line: 1572, column: 36, scope: !2013)
!2017 = !DILocation(line: 1572, column: 57, scope: !2013)
!2018 = !DILocation(line: 1572, column: 54, scope: !2013)
!2019 = !DILocation(line: 1572, column: 7, scope: !2013)
!2020 = !DILocation(line: 1573, column: 4, scope: !2013)
!2021 = !DILocation(line: 1572, column: 67, scope: !2013)
!2022 = !DILocation(line: 1581, column: 20, scope: !1973)
!2023 = !DILocation(line: 1581, column: 2, scope: !1973)
!2024 = !DILocation(line: 1581, column: 9, scope: !1973)
!2025 = !DILocation(line: 1581, column: 17, scope: !1973)
!2026 = !DILocation(line: 1584, column: 17, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !1973, file: !25, line: 1584, column: 6)
!2028 = !DILocation(line: 1584, column: 24, scope: !2027)
!2029 = !DILocation(line: 1584, column: 6, scope: !2027)
!2030 = !DILocation(line: 1584, column: 28, scope: !2027)
!2031 = !DILocation(line: 1585, column: 8, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2027, file: !25, line: 1585, column: 7)
!2033 = !DILocation(line: 1585, column: 28, scope: !2032)
!2034 = !DILocation(line: 1585, column: 34, scope: !2032)
!2035 = !DILocation(line: 1585, column: 37, scope: !2032)
!2036 = !DILocation(line: 1585, column: 58, scope: !2032)
!2037 = !DILocation(line: 1585, column: 55, scope: !2032)
!2038 = !DILocation(line: 1586, column: 8, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2032, file: !25, line: 1586, column: 8)
!2040 = !DILocation(line: 1586, column: 15, scope: !2039)
!2041 = !DILocation(line: 1586, column: 23, scope: !2039)
!2042 = !DILocation(line: 1588, column: 9, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2044, file: !25, line: 1588, column: 9)
!2044 = distinct !DILexicalBlock(scope: !2039, file: !25, line: 1587, column: 4)
!2045 = !DILocation(line: 1588, column: 19, scope: !2043)
!2046 = !DILocation(line: 1599, column: 5, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2043, file: !25, line: 1589, column: 5)
!2048 = !DILocation(line: 1602, column: 19, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2050, file: !25, line: 1602, column: 10)
!2050 = distinct !DILexicalBlock(scope: !2043, file: !25, line: 1601, column: 5)
!2051 = !DILocation(line: 1602, column: 11, scope: !2049)
!2052 = !DILocation(line: 1602, column: 31, scope: !2049)
!2053 = !DILocation(line: 1602, column: 39, scope: !2049)
!2054 = !DILocation(line: 1602, column: 44, scope: !2049)
!2055 = !DILocation(line: 1602, column: 47, scope: !2049)
!2056 = !DILocation(line: 1603, column: 7, scope: !2049)
!2057 = !DILocation(line: 1603, column: 14, scope: !2049)
!2058 = !DILocation(line: 1603, column: 22, scope: !2049)
!2059 = !DILocation(line: 1605, column: 7, scope: !2049)
!2060 = !DILocation(line: 1607, column: 4, scope: !2044)
!2061 = !DILocation(line: 1586, column: 25, scope: !2039)
!2062 = !DILocation(line: 1609, column: 6, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !1973, file: !25, line: 1609, column: 6)
!2064 = !DILocation(line: 1609, column: 13, scope: !2063)
!2065 = !DILocation(line: 1609, column: 21, scope: !2063)
!2066 = !DILocation(line: 1611, column: 7, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2068, file: !25, line: 1611, column: 7)
!2068 = distinct !DILexicalBlock(scope: !2063, file: !25, line: 1610, column: 2)
!2069 = !DILocation(line: 1611, column: 17, scope: !2067)
!2070 = !DILocation(line: 1613, column: 19, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2072, file: !25, line: 1613, column: 8)
!2072 = distinct !DILexicalBlock(scope: !2067, file: !25, line: 1612, column: 3)
!2073 = !DILocation(line: 1613, column: 26, scope: !2071)
!2074 = !DILocation(line: 1613, column: 8, scope: !2071)
!2075 = !DILocation(line: 1613, column: 30, scope: !2071)
!2076 = !DILocation(line: 1614, column: 13, scope: !2071)
!2077 = !DILocation(line: 1614, column: 5, scope: !2071)
!2078 = !DILocation(line: 1616, column: 13, scope: !2071)
!2079 = !DILocation(line: 1618, column: 8, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2072, file: !25, line: 1618, column: 8)
!2081 = !DILocation(line: 1619, column: 12, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2080, file: !25, line: 1619, column: 5)
!2083 = !DILocation(line: 1619, column: 10, scope: !2082)
!2084 = !DILocation(line: 1619, column: 17, scope: !2085)
!2085 = distinct !DILexicalBlock(scope: !2082, file: !25, line: 1619, column: 5)
!2086 = !DILocation(line: 1619, column: 19, scope: !2085)
!2087 = !DILocation(line: 1619, column: 5, scope: !2082)
!2088 = !DILocation(line: 1620, column: 36, scope: !2085)
!2089 = !DILocation(line: 1620, column: 23, scope: !2085)
!2090 = !DILocation(line: 1620, column: 18, scope: !2085)
!2091 = !DILocation(line: 1620, column: 6, scope: !2085)
!2092 = !DILocation(line: 1620, column: 21, scope: !2085)
!2093 = !DILocation(line: 1619, column: 40, scope: !2085)
!2094 = !DILocation(line: 1619, column: 5, scope: !2085)
!2095 = distinct !{!2095, !2087, !2096, !2097}
!2096 = !DILocation(line: 1620, column: 37, scope: !2082)
!2097 = !{!"llvm.loop.mustprogress"}
!2098 = !DILocation(line: 1640, column: 3, scope: !2072)
!2099 = !DILocation(line: 1642, column: 11, scope: !2068)
!2100 = !DILocation(line: 1642, column: 3, scope: !2068)
!2101 = !DILocation(line: 1642, column: 23, scope: !2068)
!2102 = !DILocation(line: 1642, column: 38, scope: !2068)
!2103 = !DILocation(line: 1643, column: 11, scope: !2068)
!2104 = !DILocation(line: 1643, column: 3, scope: !2068)
!2105 = !DILocation(line: 1643, column: 23, scope: !2068)
!2106 = !DILocation(line: 1643, column: 38, scope: !2068)
!2107 = !DILocation(line: 1645, column: 18, scope: !2108)
!2108 = distinct !DILexicalBlock(scope: !2068, file: !25, line: 1645, column: 7)
!2109 = !DILocation(line: 1645, column: 25, scope: !2108)
!2110 = !DILocation(line: 1645, column: 7, scope: !2108)
!2111 = !DILocation(line: 1645, column: 29, scope: !2108)
!2112 = !DILocation(line: 1647, column: 30, scope: !2113)
!2113 = distinct !DILexicalBlock(scope: !2108, file: !25, line: 1646, column: 3)
!2114 = !DILocation(line: 1647, column: 4, scope: !2113)
!2115 = !DILocation(line: 1648, column: 3, scope: !2113)
!2116 = !DILocation(line: 1649, column: 23, scope: !2117)
!2117 = distinct !DILexicalBlock(scope: !2108, file: !25, line: 1649, column: 12)
!2118 = !DILocation(line: 1649, column: 30, scope: !2117)
!2119 = !DILocation(line: 1649, column: 12, scope: !2117)
!2120 = !DILocation(line: 1649, column: 34, scope: !2117)
!2121 = !DILocation(line: 1651, column: 31, scope: !2122)
!2122 = distinct !DILexicalBlock(scope: !2117, file: !25, line: 1650, column: 3)
!2123 = !DILocation(line: 1651, column: 4, scope: !2122)
!2124 = !DILocation(line: 1652, column: 3, scope: !2122)
!2125 = !DILocation(line: 1655, column: 8, scope: !2126)
!2126 = distinct !DILexicalBlock(scope: !2127, file: !25, line: 1655, column: 8)
!2127 = distinct !DILexicalBlock(scope: !2117, file: !25, line: 1654, column: 3)
!2128 = !DILocation(line: 1655, column: 15, scope: !2126)
!2129 = !DILocation(line: 1655, column: 18, scope: !2126)
!2130 = !DILocation(line: 1656, column: 5, scope: !2126)
!2131 = !DILocation(line: 1663, column: 19, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2127, file: !25, line: 1663, column: 8)
!2133 = !DILocation(line: 1663, column: 26, scope: !2132)
!2134 = !DILocation(line: 1663, column: 8, scope: !2132)
!2135 = !DILocation(line: 1663, column: 30, scope: !2132)
!2136 = !DILocation(line: 1664, column: 20, scope: !2132)
!2137 = !DILocation(line: 1664, column: 5, scope: !2132)
!2138 = !DILocation(line: 1666, column: 20, scope: !2132)
!2139 = !DILocation(line: 1666, column: 5, scope: !2132)
!2140 = !DILocation(line: 1668, column: 3, scope: !2068)
!2141 = !DILocation(line: 1671, column: 3, scope: !2063)
!2142 = !DILocation(line: 1673, column: 1, scope: !1973)
!2143 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !16, file: !16, line: 83, type: !1956, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2144 = !DILocalVariable(name: "a", arg: 1, scope: !2143, file: !16, line: 83, type: !15)
!2145 = !DILocation(line: 83, column: 26, scope: !2143)
!2146 = !DILocalVariable(name: "b", arg: 2, scope: !2143, file: !16, line: 83, type: !15)
!2147 = !DILocation(line: 83, column: 33, scope: !2143)
!2148 = !DILocation(line: 85, column: 19, scope: !2143)
!2149 = !DILocation(line: 85, column: 32, scope: !2143)
!2150 = !DILocation(line: 85, column: 21, scope: !2143)
!2151 = !DILocation(line: 85, column: 35, scope: !2143)
!2152 = !DILocation(line: 85, column: 9, scope: !2143)
!2153 = !DILocation(line: 85, column: 2, scope: !2143)
!2154 = distinct !DISubprogram(name: "apply_damage_to_player", linkageName: "_Z22apply_damage_to_playerP6objectS0_i", scope: !25, file: !25, line: 2303, type: !2155, scopeLine: 2304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2155 = !DISubroutineType(types: !2156)
!2156 = !{null, !1467, !1467, !15}
!2157 = !DILocalVariable(name: "playerobj", arg: 1, scope: !2154, file: !25, line: 2303, type: !1467)
!2158 = !DILocation(line: 2303, column: 37, scope: !2154)
!2159 = !DILocalVariable(name: "killer", arg: 2, scope: !2154, file: !25, line: 2303, type: !1467)
!2160 = !DILocation(line: 2303, column: 56, scope: !2154)
!2161 = !DILocalVariable(name: "damage", arg: 3, scope: !2154, file: !25, line: 2303, type: !15)
!2162 = !DILocation(line: 2303, column: 68, scope: !2154)
!2163 = !DILocation(line: 2333, column: 6, scope: !2164)
!2164 = distinct !DILexicalBlock(scope: !2154, file: !25, line: 2333, column: 6)
!2165 = !DILocation(line: 2334, column: 3, scope: !2164)
!2166 = !DILocation(line: 2336, column: 14, scope: !2167)
!2167 = distinct !DILexicalBlock(scope: !2154, file: !25, line: 2336, column: 6)
!2168 = !DILocation(line: 2336, column: 6, scope: !2167)
!2169 = !DILocation(line: 2336, column: 26, scope: !2167)
!2170 = !DILocation(line: 2336, column: 32, scope: !2167)
!2171 = !DILocation(line: 2337, column: 3, scope: !2167)
!2172 = !DILocation(line: 2339, column: 6, scope: !2173)
!2173 = distinct !DILexicalBlock(scope: !2154, file: !25, line: 2339, column: 6)
!2174 = !DILocation(line: 2340, column: 3, scope: !2173)
!2175 = !DILocation(line: 2347, column: 6, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2154, file: !25, line: 2347, column: 6)
!2177 = !DILocation(line: 2347, column: 17, scope: !2176)
!2178 = !DILocation(line: 2347, column: 23, scope: !2176)
!2179 = !DILocation(line: 2347, column: 20, scope: !2176)
!2180 = !DILocation(line: 2359, column: 34, scope: !2181)
!2181 = distinct !DILexicalBlock(scope: !2176, file: !25, line: 2347, column: 35)
!2182 = !DILocation(line: 2359, column: 11, scope: !2181)
!2183 = !DILocation(line: 2359, column: 3, scope: !2181)
!2184 = !DILocation(line: 2359, column: 23, scope: !2181)
!2185 = !DILocation(line: 2359, column: 31, scope: !2181)
!2186 = !DILocation(line: 2361, column: 25, scope: !2181)
!2187 = !DILocation(line: 2361, column: 21, scope: !2181)
!2188 = !DILocation(line: 2361, column: 33, scope: !2181)
!2189 = !DILocation(line: 2361, column: 43, scope: !2181)
!2190 = !DILocation(line: 2361, column: 50, scope: !2181)
!2191 = !DILocation(line: 2361, column: 39, scope: !2181)
!2192 = !DILocation(line: 2361, column: 38, scope: !2181)
!2193 = !DILocation(line: 2361, column: 61, scope: !2181)
!2194 = !DILocation(line: 2361, column: 68, scope: !2181)
!2195 = !DILocation(line: 2361, column: 57, scope: !2181)
!2196 = !DILocation(line: 2361, column: 56, scope: !2181)
!2197 = !DILocation(line: 2361, column: 3, scope: !2181)
!2198 = !DILocation(line: 2365, column: 15, scope: !2199)
!2199 = distinct !DILexicalBlock(scope: !2181, file: !25, line: 2365, column: 7)
!2200 = !DILocation(line: 2365, column: 7, scope: !2199)
!2201 = !DILocation(line: 2365, column: 27, scope: !2199)
!2202 = !DILocation(line: 2365, column: 35, scope: !2199)
!2203 = !DILocation(line: 2367, column: 40, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2199, file: !25, line: 2365, column: 40)
!2205 = !DILocation(line: 2367, column: 47, scope: !2204)
!2206 = !DILocation(line: 2367, column: 12, scope: !2204)
!2207 = !DILocation(line: 2367, column: 4, scope: !2204)
!2208 = !DILocation(line: 2367, column: 24, scope: !2204)
!2209 = !DILocation(line: 2367, column: 38, scope: !2204)
!2210 = !DILocation(line: 2372, column: 4, scope: !2204)
!2211 = !DILocation(line: 2372, column: 15, scope: !2204)
!2212 = !DILocation(line: 2372, column: 21, scope: !2204)
!2213 = !DILocation(line: 2374, column: 8, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2204, file: !25, line: 2374, column: 8)
!2215 = !DILocation(line: 2374, column: 21, scope: !2214)
!2216 = !DILocation(line: 2375, column: 9, scope: !2217)
!2217 = distinct !DILexicalBlock(scope: !2214, file: !25, line: 2375, column: 9)
!2218 = !DILocation(line: 2375, column: 16, scope: !2217)
!2219 = !DILocation(line: 2375, column: 20, scope: !2217)
!2220 = !DILocation(line: 2375, column: 28, scope: !2217)
!2221 = !DILocation(line: 2375, column: 33, scope: !2217)
!2222 = !DILocation(line: 2375, column: 47, scope: !2217)
!2223 = !DILocation(line: 2375, column: 62, scope: !2217)
!2224 = !DILocation(line: 2375, column: 70, scope: !2217)
!2225 = !DILocation(line: 2375, column: 51, scope: !2217)
!2226 = !DILocation(line: 2375, column: 74, scope: !2217)
!2227 = !DILocation(line: 2375, column: 50, scope: !2217)
!2228 = !DILocation(line: 2376, column: 25, scope: !2217)
!2229 = !DILocation(line: 2376, column: 23, scope: !2217)
!2230 = !DILocation(line: 2376, column: 6, scope: !2217)
!2231 = !DILocation(line: 2375, column: 83, scope: !2217)
!2232 = !DILocation(line: 2377, column: 3, scope: !2204)
!2233 = !DILocation(line: 2379, column: 32, scope: !2181)
!2234 = !DILocation(line: 2379, column: 24, scope: !2181)
!2235 = !DILocation(line: 2379, column: 44, scope: !2181)
!2236 = !DILocation(line: 2379, column: 3, scope: !2181)
!2237 = !DILocation(line: 2379, column: 14, scope: !2181)
!2238 = !DILocation(line: 2379, column: 22, scope: !2181)
!2239 = !DILocation(line: 2381, column: 2, scope: !2181)
!2240 = !DILocation(line: 2383, column: 1, scope: !2154)
!2241 = distinct !DISubprogram(name: "apply_damage_to_controlcen", linkageName: "_Z26apply_damage_to_controlcenP6objectis", scope: !25, file: !25, line: 1134, type: !2242, scopeLine: 1135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2242 = !DISubroutineType(types: !2243)
!2243 = !{null, !1467, !15, !173}
!2244 = !DILocalVariable(name: "controlcen", arg: 1, scope: !2241, file: !25, line: 1134, type: !1467)
!2245 = !DILocation(line: 1134, column: 41, scope: !2241)
!2246 = !DILocalVariable(name: "damage", arg: 2, scope: !2241, file: !25, line: 1134, type: !15)
!2247 = !DILocation(line: 1134, column: 57, scope: !2241)
!2248 = !DILocalVariable(name: "who", arg: 3, scope: !2241, file: !25, line: 1134, type: !173)
!2249 = !DILocation(line: 1134, column: 71, scope: !2241)
!2250 = !DILocalVariable(name: "whotype", scope: !2241, file: !25, line: 1185, type: !7)
!2251 = !DILocation(line: 1185, column: 6, scope: !2241)
!2252 = !DILocation(line: 1189, column: 7, scope: !2253)
!2253 = distinct !DILexicalBlock(scope: !2241, file: !25, line: 1189, column: 6)
!2254 = !DILocation(line: 1189, column: 11, scope: !2253)
!2255 = !DILocation(line: 1189, column: 16, scope: !2253)
!2256 = !DILocation(line: 1189, column: 20, scope: !2253)
!2257 = !DILocation(line: 1189, column: 26, scope: !2253)
!2258 = !DILocation(line: 1189, column: 24, scope: !2253)
!2259 = !DILocation(line: 1190, column: 3, scope: !2253)
!2260 = !DILocation(line: 1192, column: 20, scope: !2241)
!2261 = !DILocation(line: 1192, column: 12, scope: !2241)
!2262 = !DILocation(line: 1192, column: 25, scope: !2241)
!2263 = !DILocation(line: 1192, column: 10, scope: !2241)
!2264 = !DILocation(line: 1193, column: 6, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2241, file: !25, line: 1193, column: 6)
!2266 = !DILocation(line: 1193, column: 14, scope: !2265)
!2267 = !DILocation(line: 1194, column: 3, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2265, file: !25, line: 1193, column: 29)
!2269 = !DILocation(line: 1195, column: 3, scope: !2268)
!2270 = !DILocation(line: 1210, column: 14, scope: !2271)
!2271 = distinct !DILexicalBlock(scope: !2241, file: !25, line: 1210, column: 6)
!2272 = !DILocation(line: 1210, column: 6, scope: !2271)
!2273 = !DILocation(line: 1210, column: 19, scope: !2271)
!2274 = !DILocation(line: 1210, column: 25, scope: !2271)
!2275 = !DILocation(line: 1210, column: 22, scope: !2271)
!2276 = !DILocation(line: 1211, column: 27, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2271, file: !25, line: 1210, column: 37)
!2278 = !DILocation(line: 1212, column: 3, scope: !2277)
!2279 = !DILocation(line: 1213, column: 2, scope: !2277)
!2280 = !DILocation(line: 1215, column: 6, scope: !2281)
!2281 = distinct !DILexicalBlock(scope: !2241, file: !25, line: 1215, column: 6)
!2282 = !DILocation(line: 1215, column: 18, scope: !2281)
!2283 = !DILocation(line: 1215, column: 26, scope: !2281)
!2284 = !DILocation(line: 1216, column: 26, scope: !2281)
!2285 = !DILocation(line: 1216, column: 3, scope: !2281)
!2286 = !DILocation(line: 1216, column: 15, scope: !2281)
!2287 = !DILocation(line: 1216, column: 23, scope: !2281)
!2288 = !DILocation(line: 1218, column: 7, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2241, file: !25, line: 1218, column: 6)
!2290 = !DILocation(line: 1218, column: 19, scope: !2289)
!2291 = !DILocation(line: 1218, column: 27, scope: !2289)
!2292 = !DILocation(line: 1218, column: 32, scope: !2289)
!2293 = !DILocation(line: 1218, column: 37, scope: !2289)
!2294 = !DILocation(line: 1218, column: 49, scope: !2289)
!2295 = !DILocation(line: 1218, column: 55, scope: !2289)
!2296 = !DILocation(line: 1218, column: 36, scope: !2289)
!2297 = !DILocalVariable(name: "i", scope: !2298, file: !25, line: 1219, type: !7)
!2298 = distinct !DILexicalBlock(scope: !2289, file: !25, line: 1218, column: 89)
!2299 = !DILocation(line: 1219, column: 7, scope: !2298)
!2300 = !DILocation(line: 1221, column: 33, scope: !2298)
!2301 = !DILocation(line: 1221, column: 3, scope: !2298)
!2302 = !DILocation(line: 1231, column: 9, scope: !2303)
!2303 = distinct !DILexicalBlock(scope: !2298, file: !25, line: 1231, column: 7)
!2304 = !DILocation(line: 1231, column: 19, scope: !2303)
!2305 = !DILocation(line: 1231, column: 8, scope: !2303)
!2306 = !DILocation(line: 1231, column: 7, scope: !2303)
!2307 = !DILocation(line: 1232, column: 4, scope: !2303)
!2308 = !DILocation(line: 1234, column: 58, scope: !2298)
!2309 = !DILocation(line: 1234, column: 70, scope: !2298)
!2310 = !DILocation(line: 1234, column: 82, scope: !2298)
!2311 = !DILocation(line: 1234, column: 94, scope: !2298)
!2312 = !DILocation(line: 1234, column: 3, scope: !2298)
!2313 = !DILocation(line: 1236, column: 18, scope: !2298)
!2314 = !DILocation(line: 1236, column: 3, scope: !2298)
!2315 = !DILocation(line: 1237, column: 2, scope: !2298)
!2316 = !DILocation(line: 1239, column: 1, scope: !2241)
!2317 = distinct !DISubprogram(name: "bump_this_object", linkageName: "_Z16bump_this_objectP6objectS0_P10vms_vectori", scope: !25, file: !25, line: 241, type: !2318, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2318 = !DISubroutineType(types: !2319)
!2319 = !{null, !1467, !1467, !1604, !7}
!2320 = !DILocalVariable(name: "objp", arg: 1, scope: !2317, file: !25, line: 241, type: !1467)
!2321 = !DILocation(line: 241, column: 31, scope: !2317)
!2322 = !DILocalVariable(name: "other_objp", arg: 2, scope: !2317, file: !25, line: 241, type: !1467)
!2323 = !DILocation(line: 241, column: 45, scope: !2317)
!2324 = !DILocalVariable(name: "force", arg: 3, scope: !2317, file: !25, line: 241, type: !1604)
!2325 = !DILocation(line: 241, column: 69, scope: !2317)
!2326 = !DILocalVariable(name: "damage_flag", arg: 4, scope: !2317, file: !25, line: 241, type: !7)
!2327 = !DILocation(line: 241, column: 80, scope: !2317)
!2328 = !DILocalVariable(name: "force_mag", scope: !2317, file: !25, line: 243, type: !15)
!2329 = !DILocation(line: 243, column: 6, scope: !2317)
!2330 = !DILocation(line: 245, column: 8, scope: !2331)
!2331 = distinct !DILexicalBlock(scope: !2317, file: !25, line: 245, column: 6)
!2332 = !DILocation(line: 245, column: 14, scope: !2331)
!2333 = !DILocation(line: 245, column: 30, scope: !2331)
!2334 = !DILocation(line: 245, column: 36, scope: !2331)
!2335 = !DILocation(line: 245, column: 7, scope: !2331)
!2336 = !DILocation(line: 245, column: 6, scope: !2331)
!2337 = !DILocation(line: 246, column: 7, scope: !2338)
!2338 = distinct !DILexicalBlock(scope: !2331, file: !25, line: 246, column: 7)
!2339 = !DILocation(line: 246, column: 13, scope: !2338)
!2340 = !DILocation(line: 246, column: 18, scope: !2338)
!2341 = !DILocalVariable(name: "force2", scope: !2342, file: !25, line: 247, type: !1484)
!2342 = distinct !DILexicalBlock(scope: !2338, file: !25, line: 246, column: 33)
!2343 = !DILocation(line: 247, column: 15, scope: !2342)
!2344 = !DILocation(line: 248, column: 15, scope: !2342)
!2345 = !DILocation(line: 248, column: 22, scope: !2342)
!2346 = !DILocation(line: 248, column: 24, scope: !2342)
!2347 = !DILocation(line: 248, column: 11, scope: !2342)
!2348 = !DILocation(line: 248, column: 13, scope: !2342)
!2349 = !DILocation(line: 249, column: 15, scope: !2342)
!2350 = !DILocation(line: 249, column: 22, scope: !2342)
!2351 = !DILocation(line: 249, column: 24, scope: !2342)
!2352 = !DILocation(line: 249, column: 11, scope: !2342)
!2353 = !DILocation(line: 249, column: 13, scope: !2342)
!2354 = !DILocation(line: 250, column: 15, scope: !2342)
!2355 = !DILocation(line: 250, column: 22, scope: !2342)
!2356 = !DILocation(line: 250, column: 24, scope: !2342)
!2357 = !DILocation(line: 250, column: 11, scope: !2342)
!2358 = !DILocation(line: 250, column: 13, scope: !2342)
!2359 = !DILocation(line: 251, column: 21, scope: !2342)
!2360 = !DILocation(line: 251, column: 4, scope: !2342)
!2361 = !DILocation(line: 252, column: 8, scope: !2362)
!2362 = distinct !DILexicalBlock(scope: !2342, file: !25, line: 252, column: 8)
!2363 = !DILocation(line: 252, column: 20, scope: !2362)
!2364 = !DILocation(line: 252, column: 25, scope: !2362)
!2365 = !DILocation(line: 252, column: 37, scope: !2362)
!2366 = !DILocation(line: 252, column: 42, scope: !2362)
!2367 = !DILocation(line: 252, column: 56, scope: !2362)
!2368 = !DILocation(line: 252, column: 71, scope: !2362)
!2369 = !DILocation(line: 252, column: 83, scope: !2362)
!2370 = !DILocation(line: 252, column: 60, scope: !2362)
!2371 = !DILocation(line: 252, column: 87, scope: !2362)
!2372 = !DILocation(line: 253, column: 17, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2362, file: !25, line: 252, column: 99)
!2374 = !DILocation(line: 253, column: 15, scope: !2373)
!2375 = !DILocation(line: 254, column: 24, scope: !2373)
!2376 = !DILocation(line: 254, column: 30, scope: !2373)
!2377 = !DILocation(line: 254, column: 41, scope: !2373)
!2378 = !DILocation(line: 254, column: 5, scope: !2373)
!2379 = !DILocation(line: 255, column: 4, scope: !2373)
!2380 = !DILocation(line: 256, column: 3, scope: !2342)
!2381 = !DILocation(line: 257, column: 13, scope: !2382)
!2382 = distinct !DILexicalBlock(scope: !2338, file: !25, line: 257, column: 12)
!2383 = !DILocation(line: 257, column: 19, scope: !2382)
!2384 = !DILocation(line: 257, column: 24, scope: !2382)
!2385 = !DILocation(line: 257, column: 38, scope: !2382)
!2386 = !DILocation(line: 257, column: 42, scope: !2382)
!2387 = !DILocation(line: 257, column: 48, scope: !2382)
!2388 = !DILocation(line: 257, column: 53, scope: !2382)
!2389 = !DILocation(line: 257, column: 69, scope: !2382)
!2390 = !DILocation(line: 257, column: 73, scope: !2382)
!2391 = !DILocation(line: 257, column: 79, scope: !2382)
!2392 = !DILocation(line: 257, column: 84, scope: !2382)
!2393 = !DILocation(line: 258, column: 20, scope: !2394)
!2394 = distinct !DILexicalBlock(scope: !2395, file: !25, line: 258, column: 8)
!2395 = distinct !DILexicalBlock(scope: !2382, file: !25, line: 257, column: 102)
!2396 = !DILocation(line: 258, column: 26, scope: !2394)
!2397 = !DILocation(line: 258, column: 9, scope: !2394)
!2398 = !DILocation(line: 258, column: 30, scope: !2394)
!2399 = !DILocation(line: 258, column: 8, scope: !2394)
!2400 = !DILocalVariable(name: "force2", scope: !2401, file: !25, line: 259, type: !1484)
!2401 = distinct !DILexicalBlock(scope: !2394, file: !25, line: 258, column: 41)
!2402 = !DILocation(line: 259, column: 16, scope: !2401)
!2403 = !DILocation(line: 260, column: 16, scope: !2401)
!2404 = !DILocation(line: 260, column: 23, scope: !2401)
!2405 = !DILocation(line: 260, column: 32, scope: !2401)
!2406 = !DILocation(line: 260, column: 30, scope: !2401)
!2407 = !DILocation(line: 260, column: 25, scope: !2401)
!2408 = !DILocation(line: 260, column: 12, scope: !2401)
!2409 = !DILocation(line: 260, column: 14, scope: !2401)
!2410 = !DILocation(line: 261, column: 16, scope: !2401)
!2411 = !DILocation(line: 261, column: 23, scope: !2401)
!2412 = !DILocation(line: 261, column: 32, scope: !2401)
!2413 = !DILocation(line: 261, column: 30, scope: !2401)
!2414 = !DILocation(line: 261, column: 25, scope: !2401)
!2415 = !DILocation(line: 261, column: 12, scope: !2401)
!2416 = !DILocation(line: 261, column: 14, scope: !2401)
!2417 = !DILocation(line: 262, column: 16, scope: !2401)
!2418 = !DILocation(line: 262, column: 23, scope: !2401)
!2419 = !DILocation(line: 262, column: 32, scope: !2401)
!2420 = !DILocation(line: 262, column: 30, scope: !2401)
!2421 = !DILocation(line: 262, column: 25, scope: !2401)
!2422 = !DILocation(line: 262, column: 12, scope: !2401)
!2423 = !DILocation(line: 262, column: 14, scope: !2401)
!2424 = !DILocation(line: 264, column: 22, scope: !2401)
!2425 = !DILocation(line: 264, column: 28, scope: !2401)
!2426 = !DILocation(line: 264, column: 5, scope: !2401)
!2427 = !DILocation(line: 265, column: 20, scope: !2401)
!2428 = !DILocation(line: 265, column: 5, scope: !2401)
!2429 = !DILocation(line: 266, column: 9, scope: !2430)
!2430 = distinct !DILexicalBlock(scope: !2401, file: !25, line: 266, column: 9)
!2431 = !DILocation(line: 267, column: 35, scope: !2432)
!2432 = distinct !DILexicalBlock(scope: !2430, file: !25, line: 266, column: 22)
!2433 = !DILocation(line: 267, column: 18, scope: !2432)
!2434 = !DILocation(line: 267, column: 16, scope: !2432)
!2435 = !DILocation(line: 268, column: 25, scope: !2432)
!2436 = !DILocation(line: 268, column: 31, scope: !2432)
!2437 = !DILocation(line: 268, column: 42, scope: !2432)
!2438 = !DILocation(line: 268, column: 6, scope: !2432)
!2439 = !DILocation(line: 269, column: 5, scope: !2432)
!2440 = !DILocation(line: 270, column: 4, scope: !2401)
!2441 = !DILocation(line: 271, column: 3, scope: !2395)
!2442 = !DILocation(line: 246, column: 21, scope: !2338)
!2443 = !DILocation(line: 272, column: 1, scope: !2317)
!2444 = distinct !DISubprogram(name: "bump_two_objects", linkageName: "_Z16bump_two_objectsP6objectS0_i", scope: !25, file: !25, line: 278, type: !2445, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2445 = !DISubroutineType(types: !2446)
!2446 = !{null, !1467, !1467, !7}
!2447 = !DILocalVariable(name: "obj0", arg: 1, scope: !2444, file: !25, line: 278, type: !1467)
!2448 = !DILocation(line: 278, column: 31, scope: !2444)
!2449 = !DILocalVariable(name: "obj1", arg: 2, scope: !2444, file: !25, line: 278, type: !1467)
!2450 = !DILocation(line: 278, column: 45, scope: !2444)
!2451 = !DILocalVariable(name: "damage_flag", arg: 3, scope: !2444, file: !25, line: 278, type: !7)
!2452 = !DILocation(line: 278, column: 55, scope: !2444)
!2453 = !DILocalVariable(name: "dv", scope: !2444, file: !25, line: 280, type: !1484)
!2454 = !DILocation(line: 280, column: 13, scope: !2444)
!2455 = !DILocalVariable(name: "force", scope: !2444, file: !25, line: 280, type: !1484)
!2456 = !DILocation(line: 280, column: 17, scope: !2444)
!2457 = !DILocalVariable(name: "t", scope: !2444, file: !25, line: 281, type: !1467)
!2458 = !DILocation(line: 281, column: 10, scope: !2444)
!2459 = !DILocation(line: 283, column: 6, scope: !2460)
!2460 = distinct !DILexicalBlock(scope: !2444, file: !25, line: 283, column: 6)
!2461 = !DILocation(line: 283, column: 12, scope: !2460)
!2462 = !DILocation(line: 283, column: 26, scope: !2460)
!2463 = !DILocation(line: 284, column: 7, scope: !2460)
!2464 = !DILocation(line: 284, column: 5, scope: !2460)
!2465 = !DILocation(line: 284, column: 3, scope: !2460)
!2466 = !DILocation(line: 285, column: 11, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2460, file: !25, line: 285, column: 11)
!2468 = !DILocation(line: 285, column: 17, scope: !2467)
!2469 = !DILocation(line: 285, column: 31, scope: !2467)
!2470 = !DILocation(line: 286, column: 7, scope: !2467)
!2471 = !DILocation(line: 286, column: 5, scope: !2467)
!2472 = !DILocation(line: 286, column: 3, scope: !2467)
!2473 = !DILocation(line: 288, column: 6, scope: !2474)
!2474 = distinct !DILexicalBlock(scope: !2444, file: !25, line: 288, column: 6)
!2475 = !DILocation(line: 289, column: 3, scope: !2476)
!2476 = distinct !DILexicalBlock(scope: !2474, file: !25, line: 288, column: 9)
!2477 = !DILocation(line: 290, column: 30, scope: !2476)
!2478 = !DILocation(line: 290, column: 33, scope: !2476)
!2479 = !DILocation(line: 290, column: 49, scope: !2476)
!2480 = !DILocation(line: 290, column: 60, scope: !2476)
!2481 = !DILocation(line: 290, column: 63, scope: !2476)
!2482 = !DILocation(line: 290, column: 79, scope: !2476)
!2483 = !DILocation(line: 290, column: 59, scope: !2476)
!2484 = !DILocation(line: 290, column: 3, scope: !2476)
!2485 = !DILocation(line: 291, column: 20, scope: !2476)
!2486 = !DILocation(line: 291, column: 3, scope: !2476)
!2487 = !DILocation(line: 292, column: 3, scope: !2476)
!2488 = !DILocation(line: 295, column: 22, scope: !2444)
!2489 = !DILocation(line: 295, column: 28, scope: !2444)
!2490 = !DILocation(line: 295, column: 44, scope: !2444)
!2491 = !DILocation(line: 295, column: 55, scope: !2444)
!2492 = !DILocation(line: 295, column: 61, scope: !2444)
!2493 = !DILocation(line: 295, column: 77, scope: !2444)
!2494 = !DILocation(line: 295, column: 2, scope: !2444)
!2495 = !DILocation(line: 296, column: 35, scope: !2444)
!2496 = !DILocation(line: 296, column: 41, scope: !2444)
!2497 = !DILocation(line: 296, column: 57, scope: !2444)
!2498 = !DILocation(line: 296, column: 63, scope: !2444)
!2499 = !DILocation(line: 296, column: 69, scope: !2444)
!2500 = !DILocation(line: 296, column: 85, scope: !2444)
!2501 = !DILocation(line: 296, column: 28, scope: !2444)
!2502 = !DILocation(line: 296, column: 26, scope: !2444)
!2503 = !DILocation(line: 296, column: 93, scope: !2444)
!2504 = !DILocation(line: 296, column: 99, scope: !2444)
!2505 = !DILocation(line: 296, column: 115, scope: !2444)
!2506 = !DILocation(line: 296, column: 122, scope: !2444)
!2507 = !DILocation(line: 296, column: 128, scope: !2444)
!2508 = !DILocation(line: 296, column: 144, scope: !2444)
!2509 = !DILocation(line: 296, column: 120, scope: !2444)
!2510 = !DILocation(line: 296, column: 2, scope: !2444)
!2511 = !DILocation(line: 298, column: 19, scope: !2444)
!2512 = !DILocation(line: 298, column: 25, scope: !2444)
!2513 = !DILocation(line: 298, column: 39, scope: !2444)
!2514 = !DILocation(line: 298, column: 2, scope: !2444)
!2515 = !DILocation(line: 299, column: 2, scope: !2444)
!2516 = !DILocation(line: 299, column: 2, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2444, file: !25, line: 299, column: 2)
!2518 = !DILocation(line: 300, column: 19, scope: !2444)
!2519 = !DILocation(line: 300, column: 25, scope: !2444)
!2520 = !DILocation(line: 300, column: 39, scope: !2444)
!2521 = !DILocation(line: 300, column: 2, scope: !2444)
!2522 = !DILocation(line: 302, column: 1, scope: !2444)
!2523 = distinct !DISubprogram(name: "bump_one_object", linkageName: "_Z15bump_one_objectP6objectP10vms_vectori", scope: !25, file: !25, line: 304, type: !2524, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2524 = !DISubroutineType(types: !2525)
!2525 = !{null, !1467, !1604, !15}
!2526 = !DILocalVariable(name: "obj0", arg: 1, scope: !2523, file: !25, line: 304, type: !1467)
!2527 = !DILocation(line: 304, column: 30, scope: !2523)
!2528 = !DILocalVariable(name: "hit_dir", arg: 2, scope: !2523, file: !25, line: 304, type: !1604)
!2529 = !DILocation(line: 304, column: 48, scope: !2523)
!2530 = !DILocalVariable(name: "damage", arg: 3, scope: !2523, file: !25, line: 304, type: !15)
!2531 = !DILocation(line: 304, column: 61, scope: !2523)
!2532 = !DILocalVariable(name: "hit_vec", scope: !2523, file: !25, line: 306, type: !1484)
!2533 = !DILocation(line: 306, column: 13, scope: !2523)
!2534 = !DILocation(line: 308, column: 13, scope: !2523)
!2535 = !DILocation(line: 308, column: 10, scope: !2523)
!2536 = !DILocation(line: 309, column: 25, scope: !2523)
!2537 = !DILocation(line: 309, column: 2, scope: !2523)
!2538 = !DILocation(line: 311, column: 19, scope: !2523)
!2539 = !DILocation(line: 311, column: 2, scope: !2523)
!2540 = !DILocation(line: 313, column: 1, scope: !2523)
!2541 = distinct !DISubprogram(name: "collide_player_and_wall", linkageName: "_Z23collide_player_and_wallP6objectissP10vms_vector", scope: !25, file: !25, line: 321, type: !1465, scopeLine: 322, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2542 = !DILocalVariable(name: "playerobj", arg: 1, scope: !2541, file: !25, line: 321, type: !1467)
!2543 = !DILocation(line: 321, column: 38, scope: !2541)
!2544 = !DILocalVariable(name: "hitspeed", arg: 2, scope: !2541, file: !25, line: 321, type: !15)
!2545 = !DILocation(line: 321, column: 53, scope: !2541)
!2546 = !DILocalVariable(name: "hitseg", arg: 3, scope: !2541, file: !25, line: 321, type: !173)
!2547 = !DILocation(line: 321, column: 69, scope: !2541)
!2548 = !DILocalVariable(name: "hitwall", arg: 4, scope: !2541, file: !25, line: 321, type: !173)
!2549 = !DILocation(line: 321, column: 83, scope: !2541)
!2550 = !DILocalVariable(name: "hitpt", arg: 5, scope: !2541, file: !25, line: 321, type: !1604)
!2551 = !DILocation(line: 321, column: 104, scope: !2541)
!2552 = !DILocalVariable(name: "damage", scope: !2541, file: !25, line: 323, type: !15)
!2553 = !DILocation(line: 323, column: 6, scope: !2541)
!2554 = !DILocalVariable(name: "ForceFieldHit", scope: !2541, file: !25, line: 324, type: !28)
!2555 = !DILocation(line: 324, column: 7, scope: !2541)
!2556 = !DILocalVariable(name: "tmap_num", scope: !2541, file: !25, line: 325, type: !7)
!2557 = !DILocation(line: 325, column: 6, scope: !2541)
!2558 = !DILocalVariable(name: "tmap_num2", scope: !2541, file: !25, line: 325, type: !7)
!2559 = !DILocation(line: 325, column: 16, scope: !2541)
!2560 = !DILocation(line: 327, column: 6, scope: !2561)
!2561 = distinct !DILexicalBlock(scope: !2541, file: !25, line: 327, column: 6)
!2562 = !DILocation(line: 327, column: 17, scope: !2561)
!2563 = !DILocation(line: 327, column: 23, scope: !2561)
!2564 = !DILocation(line: 327, column: 20, scope: !2561)
!2565 = !DILocation(line: 328, column: 3, scope: !2561)
!2566 = !DILocation(line: 330, column: 22, scope: !2541)
!2567 = !DILocation(line: 330, column: 13, scope: !2541)
!2568 = !DILocation(line: 330, column: 30, scope: !2541)
!2569 = !DILocation(line: 330, column: 36, scope: !2541)
!2570 = !DILocation(line: 330, column: 45, scope: !2541)
!2571 = !DILocation(line: 330, column: 11, scope: !2541)
!2572 = !DILocation(line: 333, column: 15, scope: !2573)
!2573 = distinct !DILexicalBlock(scope: !2541, file: !25, line: 333, column: 6)
!2574 = !DILocation(line: 333, column: 6, scope: !2573)
!2575 = !DILocation(line: 333, column: 25, scope: !2573)
!2576 = !DILocation(line: 333, column: 32, scope: !2573)
!2577 = !DILocation(line: 334, column: 3, scope: !2573)
!2578 = !DILocation(line: 336, column: 15, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2541, file: !25, line: 336, column: 6)
!2580 = !DILocation(line: 336, column: 6, scope: !2579)
!2581 = !DILocation(line: 336, column: 25, scope: !2579)
!2582 = !DILocation(line: 336, column: 31, scope: !2579)
!2583 = !DILocalVariable(name: "force", scope: !2584, file: !25, line: 337, type: !1484)
!2584 = distinct !DILexicalBlock(scope: !2579, file: !25, line: 336, column: 50)
!2585 = !DILocation(line: 337, column: 14, scope: !2584)
!2586 = !DILocation(line: 339, column: 3, scope: !2584)
!2587 = !DILocation(line: 342, column: 19, scope: !2584)
!2588 = !DILocation(line: 342, column: 28, scope: !2584)
!2589 = !DILocation(line: 342, column: 16, scope: !2584)
!2590 = !DILocation(line: 342, column: 9, scope: !2584)
!2591 = !DILocation(line: 342, column: 11, scope: !2584)
!2592 = !DILocation(line: 343, column: 19, scope: !2584)
!2593 = !DILocation(line: 343, column: 28, scope: !2584)
!2594 = !DILocation(line: 343, column: 16, scope: !2584)
!2595 = !DILocation(line: 343, column: 9, scope: !2584)
!2596 = !DILocation(line: 343, column: 11, scope: !2584)
!2597 = !DILocation(line: 344, column: 19, scope: !2584)
!2598 = !DILocation(line: 344, column: 28, scope: !2584)
!2599 = !DILocation(line: 344, column: 16, scope: !2584)
!2600 = !DILocation(line: 344, column: 9, scope: !2584)
!2601 = !DILocation(line: 344, column: 11, scope: !2584)
!2602 = !DILocation(line: 345, column: 18, scope: !2584)
!2603 = !DILocation(line: 345, column: 3, scope: !2584)
!2604 = !DILocation(line: 353, column: 58, scope: !2584)
!2605 = !DILocation(line: 353, column: 69, scope: !2584)
!2606 = !DILocation(line: 353, column: 3, scope: !2584)
!2607 = !DILocation(line: 358, column: 17, scope: !2584)
!2608 = !DILocation(line: 359, column: 2, scope: !2584)
!2609 = !DILocalVariable(name: "force", scope: !2610, file: !25, line: 361, type: !1484)
!2610 = distinct !DILexicalBlock(scope: !2579, file: !25, line: 360, column: 7)
!2611 = !DILocation(line: 361, column: 14, scope: !2610)
!2612 = !DILocation(line: 372, column: 30, scope: !2610)
!2613 = !DILocation(line: 372, column: 21, scope: !2610)
!2614 = !DILocation(line: 372, column: 39, scope: !2610)
!2615 = !DILocation(line: 372, column: 52, scope: !2610)
!2616 = !DILocation(line: 372, column: 63, scope: !2610)
!2617 = !DILocation(line: 372, column: 67, scope: !2610)
!2618 = !DILocation(line: 372, column: 3, scope: !2610)
!2619 = !DILocation(line: 378, column: 12, scope: !2541)
!2620 = !DILocation(line: 378, column: 21, scope: !2541)
!2621 = !DILocation(line: 378, column: 40, scope: !2541)
!2622 = !DILocation(line: 378, column: 54, scope: !2541)
!2623 = !DILocation(line: 378, column: 58, scope: !2541)
!2624 = !DILocation(line: 378, column: 37, scope: !2541)
!2625 = !DILocation(line: 378, column: 9, scope: !2541)
!2626 = !DILocation(line: 380, column: 23, scope: !2541)
!2627 = !DILocation(line: 380, column: 14, scope: !2541)
!2628 = !DILocation(line: 380, column: 31, scope: !2541)
!2629 = !DILocation(line: 380, column: 37, scope: !2541)
!2630 = !DILocation(line: 380, column: 46, scope: !2541)
!2631 = !DILocation(line: 380, column: 12, scope: !2541)
!2632 = !DILocation(line: 383, column: 16, scope: !2633)
!2633 = distinct !DILexicalBlock(scope: !2541, file: !25, line: 383, column: 6)
!2634 = !DILocation(line: 383, column: 7, scope: !2633)
!2635 = !DILocation(line: 383, column: 26, scope: !2633)
!2636 = !DILocation(line: 383, column: 32, scope: !2633)
!2637 = !DILocation(line: 383, column: 6, scope: !2633)
!2638 = !DILocation(line: 383, column: 62, scope: !2633)
!2639 = !DILocation(line: 383, column: 66, scope: !2633)
!2640 = !DILocation(line: 383, column: 76, scope: !2633)
!2641 = !DILocation(line: 383, column: 89, scope: !2633)
!2642 = !DILocation(line: 383, column: 99, scope: !2633)
!2643 = !DILocation(line: 383, column: 80, scope: !2633)
!2644 = !DILocation(line: 383, column: 109, scope: !2633)
!2645 = !DILocation(line: 383, column: 115, scope: !2633)
!2646 = !DILocation(line: 383, column: 79, scope: !2633)
!2647 = !DILocation(line: 384, column: 10, scope: !2633)
!2648 = !DILocation(line: 384, column: 3, scope: !2633)
!2649 = !DILocation(line: 386, column: 6, scope: !2650)
!2650 = distinct !DILexicalBlock(scope: !2541, file: !25, line: 386, column: 6)
!2651 = !DILocation(line: 386, column: 13, scope: !2650)
!2652 = !DILocalVariable(name: "volume", scope: !2653, file: !25, line: 387, type: !7)
!2653 = distinct !DILexicalBlock(scope: !2650, file: !25, line: 386, column: 34)
!2654 = !DILocation(line: 387, column: 7, scope: !2653)
!2655 = !DILocation(line: 388, column: 13, scope: !2653)
!2656 = !DILocation(line: 388, column: 22, scope: !2653)
!2657 = !DILocation(line: 388, column: 59, scope: !2653)
!2658 = !DILocation(line: 388, column: 10, scope: !2653)
!2659 = !DILocation(line: 390, column: 26, scope: !2653)
!2660 = !DILocation(line: 390, column: 3, scope: !2653)
!2661 = !DILocation(line: 392, column: 7, scope: !2662)
!2662 = distinct !DILexicalBlock(scope: !2653, file: !25, line: 392, column: 7)
!2663 = !DILocation(line: 392, column: 14, scope: !2662)
!2664 = !DILocation(line: 393, column: 11, scope: !2662)
!2665 = !DILocation(line: 393, column: 4, scope: !2662)
!2666 = !DILocation(line: 394, column: 7, scope: !2667)
!2667 = distinct !DILexicalBlock(scope: !2653, file: !25, line: 394, column: 7)
!2668 = !DILocation(line: 394, column: 14, scope: !2667)
!2669 = !DILocation(line: 394, column: 18, scope: !2667)
!2670 = !DILocation(line: 394, column: 22, scope: !2667)
!2671 = !DILocation(line: 395, column: 50, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2667, file: !25, line: 394, column: 37)
!2673 = !DILocation(line: 395, column: 61, scope: !2672)
!2674 = !DILocation(line: 395, column: 71, scope: !2672)
!2675 = !DILocation(line: 395, column: 4, scope: !2672)
!2676 = !DILocation(line: 400, column: 3, scope: !2672)
!2677 = !DILocation(line: 402, column: 17, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2653, file: !25, line: 402, column: 7)
!2679 = !DILocation(line: 402, column: 9, scope: !2678)
!2680 = !DILocation(line: 402, column: 29, scope: !2678)
!2681 = !DILocation(line: 402, column: 35, scope: !2678)
!2682 = !DILocation(line: 402, column: 8, scope: !2678)
!2683 = !DILocation(line: 402, column: 7, scope: !2678)
!2684 = !DILocation(line: 403, column: 16, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2678, file: !25, line: 403, column: 8)
!2686 = !DILocation(line: 403, column: 8, scope: !2685)
!2687 = !DILocation(line: 403, column: 28, scope: !2685)
!2688 = !DILocation(line: 403, column: 36, scope: !2685)
!2689 = !DILocation(line: 403, column: 48, scope: !2685)
!2690 = !DILocation(line: 403, column: 51, scope: !2685)
!2691 = !DILocation(line: 404, column: 28, scope: !2685)
!2692 = !DILocation(line: 404, column: 39, scope: !2685)
!2693 = !DILocation(line: 404, column: 50, scope: !2685)
!2694 = !DILocation(line: 404, column: 5, scope: !2685)
!2695 = !DILocation(line: 417, column: 2, scope: !2653)
!2696 = !DILocation(line: 419, column: 2, scope: !2541)
!2697 = !DILocation(line: 420, column: 1, scope: !2541)
!2698 = distinct !DISubprogram(name: "check_volatile_wall", linkageName: "_Z19check_volatile_wallP6objectiiP10vms_vector", scope: !25, file: !25, line: 430, type: !2699, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2699 = !DISubroutineType(types: !2700)
!2700 = !{!7, !1467, !7, !7, !1604}
!2701 = !DILocalVariable(name: "obj", arg: 1, scope: !2698, file: !25, line: 430, type: !1467)
!2702 = !DILocation(line: 430, column: 33, scope: !2698)
!2703 = !DILocalVariable(name: "segnum", arg: 2, scope: !2698, file: !25, line: 430, type: !7)
!2704 = !DILocation(line: 430, column: 42, scope: !2698)
!2705 = !DILocalVariable(name: "sidenum", arg: 3, scope: !2698, file: !25, line: 430, type: !7)
!2706 = !DILocation(line: 430, column: 54, scope: !2698)
!2707 = !DILocalVariable(name: "hitpt", arg: 4, scope: !2698, file: !25, line: 430, type: !1604)
!2708 = !DILocation(line: 430, column: 75, scope: !2698)
!2709 = !DILocalVariable(name: "tmap_num", scope: !2698, file: !25, line: 432, type: !15)
!2710 = !DILocation(line: 432, column: 6, scope: !2698)
!2711 = !DILocalVariable(name: "d", scope: !2698, file: !25, line: 432, type: !15)
!2712 = !DILocation(line: 432, column: 16, scope: !2698)
!2713 = !DILocalVariable(name: "water", scope: !2698, file: !25, line: 432, type: !15)
!2714 = !DILocation(line: 432, column: 19, scope: !2698)
!2715 = !DILocation(line: 434, column: 2, scope: !2698)
!2716 = !DILocation(line: 436, column: 22, scope: !2698)
!2717 = !DILocation(line: 436, column: 13, scope: !2698)
!2718 = !DILocation(line: 436, column: 30, scope: !2698)
!2719 = !DILocation(line: 436, column: 36, scope: !2698)
!2720 = !DILocation(line: 436, column: 45, scope: !2698)
!2721 = !DILocation(line: 436, column: 11, scope: !2698)
!2722 = !DILocation(line: 438, column: 15, scope: !2698)
!2723 = !DILocation(line: 438, column: 6, scope: !2698)
!2724 = !DILocation(line: 438, column: 25, scope: !2698)
!2725 = !DILocation(line: 438, column: 4, scope: !2698)
!2726 = !DILocation(line: 439, column: 20, scope: !2698)
!2727 = !DILocation(line: 439, column: 11, scope: !2698)
!2728 = !DILocation(line: 439, column: 30, scope: !2698)
!2729 = !DILocation(line: 439, column: 36, scope: !2698)
!2730 = !DILocation(line: 439, column: 8, scope: !2698)
!2731 = !DILocation(line: 441, column: 6, scope: !2732)
!2732 = distinct !DILexicalBlock(scope: !2698, file: !25, line: 441, column: 6)
!2733 = !DILocation(line: 441, column: 8, scope: !2732)
!2734 = !DILocation(line: 441, column: 12, scope: !2732)
!2735 = !DILocation(line: 441, column: 15, scope: !2732)
!2736 = !DILocation(line: 443, column: 7, scope: !2737)
!2737 = distinct !DILexicalBlock(scope: !2738, file: !25, line: 443, column: 7)
!2738 = distinct !DILexicalBlock(scope: !2732, file: !25, line: 441, column: 22)
!2739 = !DILocation(line: 443, column: 12, scope: !2737)
!2740 = !DILocation(line: 443, column: 18, scope: !2737)
!2741 = !DILocation(line: 443, column: 15, scope: !2737)
!2742 = !DILocation(line: 445, column: 8, scope: !2743)
!2743 = distinct !DILexicalBlock(scope: !2744, file: !25, line: 445, column: 8)
!2744 = distinct !DILexicalBlock(scope: !2737, file: !25, line: 443, column: 30)
!2745 = !DILocation(line: 445, column: 10, scope: !2743)
!2746 = !DILocalVariable(name: "damage", scope: !2747, file: !25, line: 446, type: !15)
!2747 = distinct !DILexicalBlock(scope: !2743, file: !25, line: 445, column: 15)
!2748 = !DILocation(line: 446, column: 9, scope: !2747)
!2749 = !DILocation(line: 446, column: 25, scope: !2747)
!2750 = !DILocation(line: 446, column: 28, scope: !2747)
!2751 = !DILocation(line: 446, column: 18, scope: !2747)
!2752 = !DILocation(line: 448, column: 9, scope: !2753)
!2753 = distinct !DILexicalBlock(scope: !2747, file: !25, line: 448, column: 9)
!2754 = !DILocation(line: 448, column: 26, scope: !2753)
!2755 = !DILocation(line: 449, column: 13, scope: !2753)
!2756 = !DILocation(line: 449, column: 6, scope: !2753)
!2757 = !DILocation(line: 451, column: 19, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2747, file: !25, line: 451, column: 9)
!2759 = !DILocation(line: 451, column: 11, scope: !2758)
!2760 = !DILocation(line: 451, column: 31, scope: !2758)
!2761 = !DILocation(line: 451, column: 37, scope: !2758)
!2762 = !DILocation(line: 451, column: 10, scope: !2758)
!2763 = !DILocation(line: 451, column: 9, scope: !2758)
!2764 = !DILocation(line: 452, column: 29, scope: !2758)
!2765 = !DILocation(line: 452, column: 34, scope: !2758)
!2766 = !DILocation(line: 452, column: 39, scope: !2758)
!2767 = !DILocation(line: 452, column: 6, scope: !2758)
!2768 = !DILocation(line: 459, column: 27, scope: !2747)
!2769 = !DILocation(line: 459, column: 34, scope: !2747)
!2770 = !DILocation(line: 459, column: 23, scope: !2747)
!2771 = !DILocation(line: 459, column: 5, scope: !2747)
!2772 = !DILocation(line: 460, column: 4, scope: !2747)
!2773 = !DILocation(line: 462, column: 37, scope: !2744)
!2774 = !DILocation(line: 462, column: 46, scope: !2744)
!2775 = !DILocation(line: 462, column: 55, scope: !2744)
!2776 = !DILocation(line: 462, column: 4, scope: !2744)
!2777 = !DILocation(line: 462, column: 9, scope: !2744)
!2778 = !DILocation(line: 462, column: 25, scope: !2744)
!2779 = !DILocation(line: 462, column: 32, scope: !2744)
!2780 = !DILocation(line: 462, column: 34, scope: !2744)
!2781 = !DILocation(line: 463, column: 37, scope: !2744)
!2782 = !DILocation(line: 463, column: 46, scope: !2744)
!2783 = !DILocation(line: 463, column: 55, scope: !2744)
!2784 = !DILocation(line: 463, column: 4, scope: !2744)
!2785 = !DILocation(line: 463, column: 9, scope: !2744)
!2786 = !DILocation(line: 463, column: 25, scope: !2744)
!2787 = !DILocation(line: 463, column: 32, scope: !2744)
!2788 = !DILocation(line: 463, column: 34, scope: !2744)
!2789 = !DILocation(line: 464, column: 3, scope: !2744)
!2790 = !DILocation(line: 466, column: 11, scope: !2738)
!2791 = !DILocation(line: 466, column: 13, scope: !2738)
!2792 = !DILocation(line: 466, column: 10, scope: !2738)
!2793 = !DILocation(line: 466, column: 3, scope: !2738)
!2794 = !DILocation(line: 475, column: 3, scope: !2795)
!2795 = distinct !DILexicalBlock(scope: !2732, file: !25, line: 469, column: 2)
!2796 = !DILocation(line: 477, column: 1, scope: !2698)
!2797 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !16, file: !16, line: 55, type: !2798, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2798 = !DISubroutineType(types: !2799)
!2799 = !{!7, !15}
!2800 = !DILocalVariable(name: "f", arg: 1, scope: !2797, file: !16, line: 55, type: !15)
!2801 = !DILocation(line: 55, column: 23, scope: !2797)
!2802 = !DILocation(line: 57, column: 9, scope: !2797)
!2803 = !DILocation(line: 57, column: 11, scope: !2797)
!2804 = !DILocation(line: 57, column: 2, scope: !2797)
!2805 = distinct !DISubprogram(name: "scrape_object_on_wall", linkageName: "_Z21scrape_object_on_wallP6objectssP10vms_vector", scope: !25, file: !25, line: 480, type: !2806, scopeLine: 481, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2806 = !DISubroutineType(types: !2807)
!2807 = !{null, !1467, !173, !173, !1604}
!2808 = !DILocalVariable(name: "obj", arg: 1, scope: !2805, file: !25, line: 480, type: !1467)
!2809 = !DILocation(line: 480, column: 36, scope: !2805)
!2810 = !DILocalVariable(name: "hitseg", arg: 2, scope: !2805, file: !25, line: 480, type: !173)
!2811 = !DILocation(line: 480, column: 47, scope: !2805)
!2812 = !DILocalVariable(name: "hitside", arg: 3, scope: !2805, file: !25, line: 480, type: !173)
!2813 = !DILocation(line: 480, column: 61, scope: !2805)
!2814 = !DILocalVariable(name: "hitpt", arg: 4, scope: !2805, file: !25, line: 480, type: !1604)
!2815 = !DILocation(line: 480, column: 82, scope: !2805)
!2816 = !DILocation(line: 482, column: 10, scope: !2805)
!2817 = !DILocation(line: 482, column: 15, scope: !2805)
!2818 = !DILocation(line: 482, column: 2, scope: !2805)
!2819 = !DILocation(line: 486, column: 7, scope: !2820)
!2820 = distinct !DILexicalBlock(scope: !2821, file: !25, line: 486, column: 7)
!2821 = distinct !DILexicalBlock(scope: !2805, file: !25, line: 482, column: 21)
!2822 = !DILocation(line: 486, column: 12, scope: !2820)
!2823 = !DILocation(line: 486, column: 18, scope: !2820)
!2824 = !DILocation(line: 486, column: 15, scope: !2820)
!2825 = !DILocalVariable(name: "type", scope: !2826, file: !25, line: 487, type: !7)
!2826 = distinct !DILexicalBlock(scope: !2820, file: !25, line: 486, column: 30)
!2827 = !DILocation(line: 487, column: 8, scope: !2826)
!2828 = !DILocation(line: 491, column: 36, scope: !2829)
!2829 = distinct !DILexicalBlock(scope: !2826, file: !25, line: 491, column: 8)
!2830 = !DILocation(line: 491, column: 41, scope: !2829)
!2831 = !DILocation(line: 491, column: 49, scope: !2829)
!2832 = !DILocation(line: 491, column: 58, scope: !2829)
!2833 = !DILocation(line: 491, column: 16, scope: !2829)
!2834 = !DILocation(line: 491, column: 14, scope: !2829)
!2835 = !DILocation(line: 491, column: 66, scope: !2829)
!2836 = !DILocalVariable(name: "hit_dir", scope: !2837, file: !25, line: 492, type: !1484)
!2837 = distinct !DILexicalBlock(scope: !2829, file: !25, line: 491, column: 72)
!2838 = !DILocation(line: 492, column: 16, scope: !2837)
!2839 = !DILocalVariable(name: "rand_vec", scope: !2837, file: !25, line: 492, type: !1484)
!2840 = !DILocation(line: 492, column: 25, scope: !2837)
!2841 = !DILocation(line: 494, column: 10, scope: !2842)
!2842 = distinct !DILexicalBlock(scope: !2837, file: !25, line: 494, column: 9)
!2843 = !DILocation(line: 494, column: 21, scope: !2842)
!2844 = !DILocation(line: 494, column: 53, scope: !2842)
!2845 = !DILocation(line: 494, column: 19, scope: !2842)
!2846 = !DILocation(line: 494, column: 65, scope: !2842)
!2847 = !DILocation(line: 494, column: 69, scope: !2842)
!2848 = !DILocation(line: 494, column: 80, scope: !2842)
!2849 = !DILocation(line: 494, column: 78, scope: !2842)
!2850 = !DILocalVariable(name: "sound", scope: !2851, file: !25, line: 495, type: !7)
!2851 = distinct !DILexicalBlock(scope: !2842, file: !25, line: 494, column: 114)
!2852 = !DILocation(line: 495, column: 10, scope: !2851)
!2853 = !DILocation(line: 495, column: 19, scope: !2851)
!2854 = !DILocation(line: 495, column: 24, scope: !2851)
!2855 = !DILocation(line: 495, column: 18, scope: !2851)
!2856 = !DILocation(line: 497, column: 40, scope: !2851)
!2857 = !DILocation(line: 497, column: 38, scope: !2851)
!2858 = !DILocation(line: 499, column: 29, scope: !2851)
!2859 = !DILocation(line: 499, column: 36, scope: !2851)
!2860 = !DILocation(line: 499, column: 47, scope: !2851)
!2861 = !DILocation(line: 499, column: 6, scope: !2851)
!2862 = !DILocation(line: 504, column: 5, scope: !2851)
!2863 = !DILocation(line: 509, column: 24, scope: !2837)
!2864 = !DILocation(line: 509, column: 15, scope: !2837)
!2865 = !DILocation(line: 509, column: 32, scope: !2837)
!2866 = !DILocation(line: 509, column: 38, scope: !2837)
!2867 = !DILocation(line: 509, column: 47, scope: !2837)
!2868 = !DILocation(line: 509, column: 13, scope: !2837)
!2869 = !DILocation(line: 512, column: 5, scope: !2837)
!2870 = !DILocation(line: 513, column: 5, scope: !2837)
!2871 = !DILocation(line: 514, column: 5, scope: !2837)
!2872 = !DILocation(line: 515, column: 21, scope: !2837)
!2873 = !DILocation(line: 515, column: 5, scope: !2837)
!2874 = !DILocation(line: 516, column: 4, scope: !2837)
!2875 = !DILocation(line: 523, column: 3, scope: !2826)
!2876 = !DILocation(line: 525, column: 3, scope: !2821)
!2877 = !DILocation(line: 533, column: 27, scope: !2821)
!2878 = !DILocation(line: 533, column: 35, scope: !2821)
!2879 = !DILocation(line: 533, column: 43, scope: !2821)
!2880 = !DILocation(line: 533, column: 52, scope: !2821)
!2881 = !DILocation(line: 533, column: 3, scope: !2821)
!2882 = !DILocation(line: 534, column: 3, scope: !2821)
!2883 = !DILocation(line: 537, column: 27, scope: !2821)
!2884 = !DILocation(line: 537, column: 35, scope: !2821)
!2885 = !DILocation(line: 537, column: 43, scope: !2821)
!2886 = !DILocation(line: 537, column: 52, scope: !2821)
!2887 = !DILocation(line: 537, column: 3, scope: !2821)
!2888 = !DILocation(line: 538, column: 3, scope: !2821)
!2889 = !DILocation(line: 541, column: 1, scope: !2805)
!2890 = distinct !DISubprogram(name: "collide_weapon_and_wall", linkageName: "_Z23collide_weapon_and_wallP6objectissP10vms_vector", scope: !25, file: !25, line: 728, type: !1465, scopeLine: 729, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!2891 = !DILocalVariable(name: "weapon", arg: 1, scope: !2890, file: !25, line: 728, type: !1467)
!2892 = !DILocation(line: 728, column: 38, scope: !2890)
!2893 = !DILocalVariable(name: "hitspeed", arg: 2, scope: !2890, file: !25, line: 728, type: !15)
!2894 = !DILocation(line: 728, column: 50, scope: !2890)
!2895 = !DILocalVariable(name: "hitseg", arg: 3, scope: !2890, file: !25, line: 728, type: !173)
!2896 = !DILocation(line: 728, column: 66, scope: !2890)
!2897 = !DILocalVariable(name: "hitwall", arg: 4, scope: !2890, file: !25, line: 728, type: !173)
!2898 = !DILocation(line: 728, column: 80, scope: !2890)
!2899 = !DILocalVariable(name: "hitpt", arg: 5, scope: !2890, file: !25, line: 728, type: !1604)
!2900 = !DILocation(line: 728, column: 101, scope: !2890)
!2901 = !DILocalVariable(name: "seg", scope: !2890, file: !25, line: 730, type: !2902)
!2902 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2903, size: 64)
!2903 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !2904, line: 123, baseType: !2905)
!2904 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!2905 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !2904, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !2906, identifier: "_ZTS7segment")
!2906 = !{!2907, !2933, !2935, !2939}
!2907 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !2905, file: !2904, line: 105, baseType: !2908, size: 3840)
!2908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2909, size: 3840, elements: !2931)
!2909 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !2904, line: 91, baseType: !2910)
!2910 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !2904, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !2911, identifier: "_ZTS4side")
!2911 = !{!2912, !2913, !2914, !2915, !2916, !2917, !2927}
!2912 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2910, file: !2904, line: 84, baseType: !166, size: 8)
!2913 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !2910, file: !2904, line: 85, baseType: !177, size: 8, offset: 8)
!2914 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !2910, file: !2904, line: 86, baseType: !173, size: 16, offset: 16)
!2915 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !2910, file: !2904, line: 87, baseType: !173, size: 16, offset: 32)
!2916 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !2910, file: !2904, line: 88, baseType: !173, size: 16, offset: 48)
!2917 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !2910, file: !2904, line: 89, baseType: !2918, size: 384, offset: 64)
!2918 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2919, size: 384, elements: !2925)
!2919 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !2904, line: 67, baseType: !2920)
!2920 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !2904, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !2921, identifier: "_ZTS3uvl")
!2921 = !{!2922, !2923, !2924}
!2922 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !2920, file: !2904, line: 66, baseType: !15, size: 32)
!2923 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !2920, file: !2904, line: 66, baseType: !15, size: 32, offset: 32)
!2924 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !2920, file: !2904, line: 66, baseType: !15, size: 32, offset: 64)
!2925 = !{!2926}
!2926 = !DISubrange(count: 4)
!2927 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !2910, file: !2904, line: 90, baseType: !2928, size: 192, offset: 448)
!2928 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1484, size: 192, elements: !2929)
!2929 = !{!2930}
!2930 = !DISubrange(count: 2)
!2931 = !{!2932}
!2932 = !DISubrange(count: 6)
!2933 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !2905, file: !2904, line: 106, baseType: !2934, size: 96, offset: 3840)
!2934 = !DICompositeType(tag: DW_TAG_array_type, baseType: !173, size: 96, elements: !2931)
!2935 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !2905, file: !2904, line: 107, baseType: !2936, size: 128, offset: 3936)
!2936 = !DICompositeType(tag: DW_TAG_array_type, baseType: !173, size: 128, elements: !2937)
!2937 = !{!2938}
!2938 = !DISubrange(count: 8)
!2939 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !2905, file: !2904, line: 112, baseType: !7, size: 32, offset: 4064)
!2940 = !DILocation(line: 730, column: 11, scope: !2890)
!2941 = !DILocation(line: 730, column: 27, scope: !2890)
!2942 = !DILocation(line: 730, column: 18, scope: !2890)
!2943 = !DILocalVariable(name: "blew_up", scope: !2890, file: !25, line: 731, type: !7)
!2944 = !DILocation(line: 731, column: 6, scope: !2890)
!2945 = !DILocalVariable(name: "wall_type", scope: !2890, file: !25, line: 732, type: !7)
!2946 = !DILocation(line: 732, column: 6, scope: !2890)
!2947 = !DILocalVariable(name: "playernum", scope: !2890, file: !25, line: 733, type: !7)
!2948 = !DILocation(line: 733, column: 6, scope: !2890)
!2949 = !DILocalVariable(name: "robot_escort", scope: !2890, file: !25, line: 734, type: !7)
!2950 = !DILocation(line: 734, column: 6, scope: !2890)
!2951 = !DILocation(line: 736, column: 6, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 736, column: 6)
!2953 = !DILocation(line: 736, column: 14, scope: !2952)
!2954 = !DILocation(line: 736, column: 17, scope: !2952)
!2955 = !DILocation(line: 737, column: 30, scope: !2956)
!2956 = distinct !DILexicalBlock(scope: !2952, file: !25, line: 737, column: 7)
!2957 = !DILocation(line: 737, column: 8, scope: !2956)
!2958 = !DILocation(line: 737, column: 7, scope: !2956)
!2959 = !DILocation(line: 738, column: 4, scope: !2956)
!2960 = !DILocation(line: 737, column: 36, scope: !2956)
!2961 = !DILocation(line: 741, column: 6, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 741, column: 6)
!2963 = !DILocation(line: 741, column: 14, scope: !2962)
!2964 = !DILocation(line: 741, column: 17, scope: !2962)
!2965 = !DILocalVariable(name: "dot", scope: !2966, file: !25, line: 742, type: !15)
!2966 = distinct !DILexicalBlock(scope: !2962, file: !25, line: 741, column: 35)
!2967 = !DILocation(line: 742, column: 7, scope: !2966)
!2968 = !DILocation(line: 744, column: 9, scope: !2966)
!2969 = !DILocation(line: 744, column: 7, scope: !2966)
!2970 = !DILocation(line: 745, column: 3, scope: !2966)
!2971 = !DILocation(line: 746, column: 7, scope: !2972)
!2972 = distinct !DILexicalBlock(scope: !2966, file: !25, line: 746, column: 7)
!2973 = !DILocation(line: 746, column: 11, scope: !2972)
!2974 = !DILocation(line: 747, column: 4, scope: !2975)
!2975 = distinct !DILexicalBlock(scope: !2972, file: !25, line: 746, column: 24)
!2976 = !DILocation(line: 748, column: 4, scope: !2975)
!2977 = !DILocation(line: 748, column: 12, scope: !2975)
!2978 = !DILocation(line: 748, column: 28, scope: !2975)
!2979 = !DILocation(line: 748, column: 34, scope: !2975)
!2980 = !DILocation(line: 749, column: 3, scope: !2975)
!2981 = !DILocation(line: 750, column: 2, scope: !2966)
!2982 = !DILocation(line: 753, column: 16, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 753, column: 6)
!2984 = !DILocation(line: 753, column: 21, scope: !2983)
!2985 = !DILocation(line: 753, column: 27, scope: !2983)
!2986 = !DILocation(line: 753, column: 36, scope: !2983)
!2987 = !DILocation(line: 753, column: 7, scope: !2983)
!2988 = !DILocation(line: 753, column: 46, scope: !2983)
!2989 = !DILocation(line: 753, column: 52, scope: !2983)
!2990 = !DILocation(line: 753, column: 6, scope: !2983)
!2991 = !DILocation(line: 753, column: 71, scope: !2983)
!2992 = !DILocation(line: 754, column: 5, scope: !2983)
!2993 = !DILocation(line: 754, column: 13, scope: !2983)
!2994 = !DILocation(line: 754, column: 18, scope: !2983)
!2995 = !DILocation(line: 754, column: 32, scope: !2983)
!2996 = !DILocation(line: 754, column: 47, scope: !2983)
!2997 = !DILocation(line: 754, column: 55, scope: !2983)
!2998 = !DILocation(line: 754, column: 35, scope: !2983)
!2999 = !DILocation(line: 754, column: 59, scope: !2983)
!3000 = !DILocation(line: 754, column: 72, scope: !2983)
!3001 = !DILocation(line: 757, column: 58, scope: !3002)
!3002 = distinct !DILexicalBlock(scope: !2983, file: !25, line: 754, column: 79)
!3003 = !DILocation(line: 757, column: 69, scope: !3002)
!3004 = !DILocation(line: 757, column: 3, scope: !3002)
!3005 = !DILocation(line: 763, column: 3, scope: !3002)
!3006 = !DILocation(line: 767, column: 6, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 767, column: 6)
!3008 = !DILocation(line: 768, column: 7, scope: !3009)
!3009 = distinct !DILexicalBlock(scope: !3007, file: !25, line: 768, column: 7)
!3010 = !DILocation(line: 768, column: 15, scope: !3009)
!3011 = !DILocation(line: 768, column: 32, scope: !3009)
!3012 = !DILocation(line: 768, column: 54, scope: !3009)
!3013 = !DILocation(line: 768, column: 46, scope: !3009)
!3014 = !DILocation(line: 768, column: 66, scope: !3009)
!3015 = !DILocation(line: 768, column: 43, scope: !3009)
!3016 = !DILocation(line: 770, column: 4, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !3009, file: !25, line: 768, column: 74)
!3018 = !DILocation(line: 771, column: 67, scope: !3017)
!3019 = !DILocation(line: 771, column: 75, scope: !3017)
!3020 = !DILocation(line: 771, column: 84, scope: !3017)
!3021 = !DILocation(line: 771, column: 4, scope: !3017)
!3022 = !DILocation(line: 772, column: 8, scope: !3023)
!3023 = distinct !DILexicalBlock(scope: !3017, file: !25, line: 772, column: 8)
!3024 = !DILocation(line: 772, column: 16, scope: !3023)
!3025 = !DILocation(line: 772, column: 19, scope: !3023)
!3026 = !DILocation(line: 773, column: 20, scope: !3023)
!3027 = !DILocation(line: 773, column: 28, scope: !3023)
!3028 = !DILocation(line: 773, column: 5, scope: !3023)
!3029 = !DILocation(line: 774, column: 13, scope: !3030)
!3030 = distinct !DILexicalBlock(scope: !3023, file: !25, line: 774, column: 13)
!3031 = !DILocation(line: 774, column: 21, scope: !3030)
!3032 = !DILocation(line: 774, column: 24, scope: !3030)
!3033 = !DILocation(line: 775, column: 15, scope: !3030)
!3034 = !DILocation(line: 775, column: 23, scope: !3030)
!3035 = !DILocation(line: 775, column: 5, scope: !3030)
!3036 = !DILocation(line: 776, column: 3, scope: !3017)
!3037 = !DILocation(line: 784, column: 7, scope: !3038)
!3038 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 784, column: 6)
!3039 = !DILocation(line: 784, column: 15, scope: !3038)
!3040 = !DILocation(line: 784, column: 31, scope: !3038)
!3041 = !DILocation(line: 784, column: 40, scope: !3038)
!3042 = !DILocation(line: 784, column: 42, scope: !3038)
!3043 = !DILocation(line: 784, column: 48, scope: !3038)
!3044 = !DILocation(line: 784, column: 52, scope: !3038)
!3045 = !DILocation(line: 784, column: 60, scope: !3038)
!3046 = !DILocation(line: 784, column: 76, scope: !3038)
!3047 = !DILocation(line: 784, column: 85, scope: !3038)
!3048 = !DILocation(line: 784, column: 87, scope: !3038)
!3049 = !DILocation(line: 784, column: 93, scope: !3038)
!3050 = !DILocation(line: 784, column: 97, scope: !3038)
!3051 = !DILocation(line: 784, column: 105, scope: !3038)
!3052 = !DILocation(line: 784, column: 121, scope: !3038)
!3053 = !DILocation(line: 784, column: 130, scope: !3038)
!3054 = !DILocation(line: 784, column: 132, scope: !3038)
!3055 = !DILocation(line: 785, column: 3, scope: !3056)
!3056 = distinct !DILexicalBlock(scope: !3038, file: !25, line: 784, column: 139)
!3057 = !DILocation(line: 786, column: 3, scope: !3056)
!3058 = !DILocation(line: 789, column: 32, scope: !2890)
!3059 = !DILocation(line: 789, column: 37, scope: !2890)
!3060 = !DILocation(line: 789, column: 46, scope: !2890)
!3061 = !DILocation(line: 789, column: 53, scope: !2890)
!3062 = !DILocation(line: 789, column: 12, scope: !2890)
!3063 = !DILocation(line: 789, column: 10, scope: !2890)
!3064 = !DILocation(line: 793, column: 7, scope: !3065)
!3065 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 793, column: 6)
!3066 = !DILocation(line: 793, column: 15, scope: !3065)
!3067 = !DILocation(line: 793, column: 32, scope: !3065)
!3068 = !DILocation(line: 793, column: 44, scope: !3065)
!3069 = !DILocation(line: 793, column: 58, scope: !3065)
!3070 = !DILocation(line: 793, column: 81, scope: !3065)
!3071 = !DILocation(line: 793, column: 89, scope: !3065)
!3072 = !DILocation(line: 793, column: 106, scope: !3065)
!3073 = !DILocation(line: 793, column: 73, scope: !3065)
!3074 = !DILocation(line: 793, column: 118, scope: !3065)
!3075 = !DILocation(line: 793, column: 62, scope: !3065)
!3076 = !DILocation(line: 793, column: 122, scope: !3065)
!3077 = !DILocation(line: 793, column: 132, scope: !3065)
!3078 = !DILocation(line: 794, column: 16, scope: !3079)
!3079 = distinct !DILexicalBlock(scope: !3065, file: !25, line: 793, column: 139)
!3080 = !DILocation(line: 796, column: 7, scope: !3081)
!3081 = distinct !DILexicalBlock(scope: !3079, file: !25, line: 796, column: 7)
!3082 = !DILocation(line: 796, column: 17, scope: !3081)
!3083 = !DILocation(line: 798, column: 4, scope: !3084)
!3084 = distinct !DILexicalBlock(scope: !3081, file: !25, line: 797, column: 3)
!3085 = !DILocation(line: 799, column: 4, scope: !3084)
!3086 = !DILocation(line: 803, column: 15, scope: !3079)
!3087 = !DILocation(line: 803, column: 13, scope: !3079)
!3088 = !DILocation(line: 804, column: 2, scope: !3079)
!3089 = !DILocation(line: 806, column: 16, scope: !3090)
!3090 = distinct !DILexicalBlock(scope: !3065, file: !25, line: 805, column: 7)
!3091 = !DILocation(line: 808, column: 15, scope: !3092)
!3092 = distinct !DILexicalBlock(scope: !3090, file: !25, line: 808, column: 7)
!3093 = !DILocation(line: 808, column: 23, scope: !3092)
!3094 = !DILocation(line: 808, column: 40, scope: !3092)
!3095 = !DILocation(line: 808, column: 7, scope: !3092)
!3096 = !DILocation(line: 808, column: 52, scope: !3092)
!3097 = !DILocation(line: 808, column: 57, scope: !3092)
!3098 = !DILocation(line: 809, column: 24, scope: !3092)
!3099 = !DILocation(line: 809, column: 32, scope: !3092)
!3100 = !DILocation(line: 809, column: 49, scope: !3092)
!3101 = !DILocation(line: 809, column: 16, scope: !3092)
!3102 = !DILocation(line: 809, column: 61, scope: !3092)
!3103 = !DILocation(line: 809, column: 14, scope: !3092)
!3104 = !DILocation(line: 809, column: 4, scope: !3092)
!3105 = !DILocation(line: 811, column: 14, scope: !3092)
!3106 = !DILocation(line: 814, column: 6, scope: !3107)
!3107 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 814, column: 6)
!3108 = !DILocation(line: 819, column: 17, scope: !3109)
!3109 = distinct !DILexicalBlock(scope: !3107, file: !25, line: 814, column: 15)
!3110 = !DILocation(line: 819, column: 22, scope: !3109)
!3111 = !DILocation(line: 819, column: 31, scope: !3109)
!3112 = !DILocation(line: 819, column: 39, scope: !3109)
!3113 = !DILocation(line: 819, column: 56, scope: !3109)
!3114 = !DILocation(line: 819, column: 3, scope: !3109)
!3115 = !DILocation(line: 820, column: 2, scope: !3109)
!3116 = !DILocation(line: 822, column: 6, scope: !3117)
!3117 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 822, column: 6)
!3118 = !DILocation(line: 822, column: 14, scope: !3117)
!3119 = !DILocation(line: 822, column: 17, scope: !3117)
!3120 = !DILocation(line: 823, column: 3, scope: !3117)
!3121 = !DILocation(line: 825, column: 31, scope: !2890)
!3122 = !DILocation(line: 825, column: 36, scope: !2890)
!3123 = !DILocation(line: 825, column: 45, scope: !2890)
!3124 = !DILocation(line: 825, column: 53, scope: !2890)
!3125 = !DILocation(line: 825, column: 62, scope: !2890)
!3126 = !DILocation(line: 825, column: 73, scope: !2890)
!3127 = !DILocation(line: 825, column: 14, scope: !2890)
!3128 = !DILocation(line: 825, column: 12, scope: !2890)
!3129 = !DILocation(line: 828, column: 16, scope: !3130)
!3130 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 828, column: 6)
!3131 = !DILocation(line: 828, column: 21, scope: !3130)
!3132 = !DILocation(line: 828, column: 27, scope: !3130)
!3133 = !DILocation(line: 828, column: 36, scope: !3130)
!3134 = !DILocation(line: 828, column: 7, scope: !3130)
!3135 = !DILocation(line: 828, column: 46, scope: !3130)
!3136 = !DILocation(line: 828, column: 52, scope: !3130)
!3137 = !DILocation(line: 828, column: 6, scope: !3130)
!3138 = !DILocation(line: 828, column: 68, scope: !3130)
!3139 = !DILocation(line: 828, column: 72, scope: !3130)
!3140 = !DILocation(line: 828, column: 77, scope: !3130)
!3141 = !DILocation(line: 828, column: 83, scope: !3130)
!3142 = !DILocation(line: 828, column: 92, scope: !3130)
!3143 = !DILocation(line: 828, column: 102, scope: !3130)
!3144 = !DILocation(line: 828, column: 115, scope: !3130)
!3145 = !DILocation(line: 828, column: 120, scope: !3130)
!3146 = !DILocation(line: 828, column: 126, scope: !3130)
!3147 = !DILocation(line: 828, column: 135, scope: !3130)
!3148 = !DILocation(line: 828, column: 145, scope: !3130)
!3149 = !DILocation(line: 828, column: 106, scope: !3130)
!3150 = !DILocation(line: 828, column: 155, scope: !3130)
!3151 = !DILocation(line: 828, column: 161, scope: !3130)
!3152 = !DILocation(line: 828, column: 105, scope: !3130)
!3153 = !DILocalVariable(name: "wi", scope: !3154, file: !25, line: 829, type: !3155)
!3154 = distinct !DILexicalBlock(scope: !3130, file: !25, line: 828, column: 179)
!3155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3156, size: 64)
!3156 = !DIDerivedType(tag: DW_TAG_typedef, name: "weapon_info", file: !3157, line: 80, baseType: !3158)
!3157 = !DIFile(filename: "main_d2/weapon.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a9e4f8b8f865fefc0854f8f4cf993ef2")
!3158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "weapon_info", file: !3157, line: 24, size: 1024, flags: DIFlagTypePassByValue, elements: !3159, identifier: "_ZTS11weapon_info")
!3159 = !{!3160, !3161, !3162, !3163, !3164, !3165, !3166, !3167, !3168, !3169, !3170, !3171, !3172, !3173, !3174, !3175, !3176, !3177, !3178, !3179, !3180, !3181, !3182, !3183, !3184, !3185, !3191, !3192, !3193, !3194, !3198, !3199, !3200, !3201, !3202, !3203, !3204, !3205, !3206, !3207}
!3160 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !3158, file: !3157, line: 26, baseType: !166, size: 8)
!3161 = !DIDerivedType(tag: DW_TAG_member, name: "persistent", scope: !3158, file: !3157, line: 27, baseType: !166, size: 8, offset: 8)
!3162 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !3158, file: !3157, line: 28, baseType: !173, size: 16, offset: 16)
!3163 = !DIDerivedType(tag: DW_TAG_member, name: "model_num_inner", scope: !3158, file: !3157, line: 29, baseType: !173, size: 16, offset: 32)
!3164 = !DIDerivedType(tag: DW_TAG_member, name: "flash_vclip", scope: !3158, file: !3157, line: 31, baseType: !166, size: 8, offset: 48)
!3165 = !DIDerivedType(tag: DW_TAG_member, name: "robot_hit_vclip", scope: !3158, file: !3157, line: 32, baseType: !166, size: 8, offset: 56)
!3166 = !DIDerivedType(tag: DW_TAG_member, name: "flash_sound", scope: !3158, file: !3157, line: 33, baseType: !173, size: 16, offset: 64)
!3167 = !DIDerivedType(tag: DW_TAG_member, name: "wall_hit_vclip", scope: !3158, file: !3157, line: 35, baseType: !166, size: 8, offset: 80)
!3168 = !DIDerivedType(tag: DW_TAG_member, name: "fire_count", scope: !3158, file: !3157, line: 36, baseType: !166, size: 8, offset: 88)
!3169 = !DIDerivedType(tag: DW_TAG_member, name: "robot_hit_sound", scope: !3158, file: !3157, line: 37, baseType: !173, size: 16, offset: 96)
!3170 = !DIDerivedType(tag: DW_TAG_member, name: "ammo_usage", scope: !3158, file: !3157, line: 39, baseType: !166, size: 8, offset: 112)
!3171 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_vclip", scope: !3158, file: !3157, line: 40, baseType: !166, size: 8, offset: 120)
!3172 = !DIDerivedType(tag: DW_TAG_member, name: "wall_hit_sound", scope: !3158, file: !3157, line: 41, baseType: !173, size: 16, offset: 128)
!3173 = !DIDerivedType(tag: DW_TAG_member, name: "destroyable", scope: !3158, file: !3157, line: 43, baseType: !166, size: 8, offset: 144)
!3174 = !DIDerivedType(tag: DW_TAG_member, name: "matter", scope: !3158, file: !3157, line: 44, baseType: !166, size: 8, offset: 152)
!3175 = !DIDerivedType(tag: DW_TAG_member, name: "bounce", scope: !3158, file: !3157, line: 45, baseType: !166, size: 8, offset: 160)
!3176 = !DIDerivedType(tag: DW_TAG_member, name: "homing_flag", scope: !3158, file: !3157, line: 46, baseType: !166, size: 8, offset: 168)
!3177 = !DIDerivedType(tag: DW_TAG_member, name: "speedvar", scope: !3158, file: !3157, line: 48, baseType: !177, size: 8, offset: 176)
!3178 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3158, file: !3157, line: 50, baseType: !177, size: 8, offset: 184)
!3179 = !DIDerivedType(tag: DW_TAG_member, name: "flash", scope: !3158, file: !3157, line: 52, baseType: !166, size: 8, offset: 192)
!3180 = !DIDerivedType(tag: DW_TAG_member, name: "afterburner_size", scope: !3158, file: !3157, line: 53, baseType: !166, size: 8, offset: 200)
!3181 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !3158, file: !3157, line: 55, baseType: !166, size: 8, offset: 208)
!3182 = !DIDerivedType(tag: DW_TAG_member, name: "energy_usage", scope: !3158, file: !3157, line: 57, baseType: !15, size: 32, offset: 224)
!3183 = !DIDerivedType(tag: DW_TAG_member, name: "fire_wait", scope: !3158, file: !3157, line: 58, baseType: !15, size: 32, offset: 256)
!3184 = !DIDerivedType(tag: DW_TAG_member, name: "multi_damage_scale", scope: !3158, file: !3157, line: 60, baseType: !15, size: 32, offset: 288)
!3185 = !DIDerivedType(tag: DW_TAG_member, name: "bitmap", scope: !3158, file: !3157, line: 62, baseType: !3186, size: 16, offset: 320)
!3186 = !DIDerivedType(tag: DW_TAG_typedef, name: "bitmap_index", file: !3187, line: 40, baseType: !3188)
!3187 = !DIFile(filename: "./main_shared/piggy.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "5d74a9a5fcd56b04e1df3c49c8d4c571")
!3188 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bitmap_index", file: !3187, line: 37, size: 16, flags: DIFlagTypePassByValue, elements: !3189, identifier: "_ZTS12bitmap_index")
!3189 = !{!3190}
!3190 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !3188, file: !3187, line: 39, baseType: !181, size: 16)
!3191 = !DIDerivedType(tag: DW_TAG_member, name: "blob_size", scope: !3158, file: !3157, line: 64, baseType: !15, size: 32, offset: 352)
!3192 = !DIDerivedType(tag: DW_TAG_member, name: "flash_size", scope: !3158, file: !3157, line: 65, baseType: !15, size: 32, offset: 384)
!3193 = !DIDerivedType(tag: DW_TAG_member, name: "impact_size", scope: !3158, file: !3157, line: 66, baseType: !15, size: 32, offset: 416)
!3194 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !3158, file: !3157, line: 67, baseType: !3195, size: 160, offset: 448)
!3195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 160, elements: !3196)
!3196 = !{!3197}
!3197 = !DISubrange(count: 5)
!3198 = !DIDerivedType(tag: DW_TAG_member, name: "speed", scope: !3158, file: !3157, line: 68, baseType: !3195, size: 160, offset: 608)
!3199 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !3158, file: !3157, line: 69, baseType: !15, size: 32, offset: 768)
!3200 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !3158, file: !3157, line: 70, baseType: !15, size: 32, offset: 800)
!3201 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !3158, file: !3157, line: 71, baseType: !15, size: 32, offset: 832)
!3202 = !DIDerivedType(tag: DW_TAG_member, name: "po_len_to_width_ratio", scope: !3158, file: !3157, line: 72, baseType: !15, size: 32, offset: 864)
!3203 = !DIDerivedType(tag: DW_TAG_member, name: "light", scope: !3158, file: !3157, line: 73, baseType: !15, size: 32, offset: 896)
!3204 = !DIDerivedType(tag: DW_TAG_member, name: "lifetime", scope: !3158, file: !3157, line: 74, baseType: !15, size: 32, offset: 928)
!3205 = !DIDerivedType(tag: DW_TAG_member, name: "damage_radius", scope: !3158, file: !3157, line: 75, baseType: !15, size: 32, offset: 960)
!3206 = !DIDerivedType(tag: DW_TAG_member, name: "picture", scope: !3158, file: !3157, line: 78, baseType: !3186, size: 16, offset: 992)
!3207 = !DIDerivedType(tag: DW_TAG_member, name: "hires_picture", scope: !3158, file: !3157, line: 79, baseType: !3186, size: 16, offset: 1008)
!3208 = !DILocation(line: 829, column: 16, scope: !3154)
!3209 = !DILocation(line: 829, column: 34, scope: !3154)
!3210 = !DILocation(line: 829, column: 42, scope: !3154)
!3211 = !DILocation(line: 829, column: 22, scope: !3154)
!3212 = !DILocalVariable(name: "vclip", scope: !3154, file: !25, line: 830, type: !7)
!3213 = !DILocation(line: 830, column: 7, scope: !3154)
!3214 = !DILocation(line: 834, column: 51, scope: !3154)
!3215 = !DILocation(line: 834, column: 62, scope: !3154)
!3216 = !DILocation(line: 834, column: 3, scope: !3154)
!3217 = !DILocation(line: 837, column: 12, scope: !3154)
!3218 = !DILocation(line: 837, column: 20, scope: !3154)
!3219 = !DILocation(line: 837, column: 23, scope: !3154)
!3220 = !DILocation(line: 837, column: 11, scope: !3154)
!3221 = !DILocation(line: 837, column: 49, scope: !3154)
!3222 = !DILocation(line: 837, column: 57, scope: !3154)
!3223 = !DILocation(line: 837, column: 37, scope: !3154)
!3224 = !DILocation(line: 837, column: 61, scope: !3154)
!3225 = !DILocation(line: 837, column: 9, scope: !3154)
!3226 = !DILocation(line: 840, column: 7, scope: !3227)
!3227 = distinct !DILexicalBlock(scope: !3154, file: !25, line: 840, column: 7)
!3228 = !DILocation(line: 840, column: 11, scope: !3227)
!3229 = !DILocation(line: 840, column: 28, scope: !3227)
!3230 = !DILocation(line: 840, column: 56, scope: !3227)
!3231 = !DILocation(line: 840, column: 25, scope: !3227)
!3232 = !DILocation(line: 842, column: 26, scope: !3233)
!3233 = distinct !DILexicalBlock(scope: !3227, file: !25, line: 840, column: 61)
!3234 = !DILocation(line: 842, column: 34, scope: !3233)
!3235 = !DILocation(line: 842, column: 4, scope: !3233)
!3236 = !DILocation(line: 843, column: 3, scope: !3233)
!3237 = !DILocation(line: 845, column: 35, scope: !3238)
!3238 = distinct !DILexicalBlock(scope: !3227, file: !25, line: 844, column: 8)
!3239 = !DILocation(line: 845, column: 43, scope: !3238)
!3240 = !DILocation(line: 845, column: 51, scope: !3238)
!3241 = !DILocation(line: 846, column: 5, scope: !3238)
!3242 = !DILocation(line: 846, column: 9, scope: !3238)
!3243 = !DILocation(line: 846, column: 23, scope: !3238)
!3244 = !DILocation(line: 846, column: 21, scope: !3238)
!3245 = !DILocation(line: 847, column: 5, scope: !3238)
!3246 = !DILocation(line: 848, column: 5, scope: !3238)
!3247 = !DILocation(line: 848, column: 9, scope: !3238)
!3248 = !DILocation(line: 848, column: 18, scope: !3238)
!3249 = !DILocation(line: 848, column: 36, scope: !3238)
!3250 = !DILocation(line: 848, column: 42, scope: !3238)
!3251 = !DILocation(line: 848, column: 40, scope: !3238)
!3252 = !DILocation(line: 849, column: 5, scope: !3238)
!3253 = !DILocation(line: 849, column: 9, scope: !3238)
!3254 = !DILocation(line: 849, column: 25, scope: !3238)
!3255 = !DILocation(line: 849, column: 23, scope: !3238)
!3256 = !DILocation(line: 850, column: 5, scope: !3238)
!3257 = !DILocation(line: 850, column: 9, scope: !3238)
!3258 = !DILocation(line: 850, column: 18, scope: !3238)
!3259 = !DILocation(line: 850, column: 36, scope: !3238)
!3260 = !DILocation(line: 850, column: 42, scope: !3238)
!3261 = !DILocation(line: 850, column: 40, scope: !3238)
!3262 = !DILocation(line: 851, column: 5, scope: !3238)
!3263 = !DILocation(line: 851, column: 13, scope: !3238)
!3264 = !DILocation(line: 851, column: 30, scope: !3238)
!3265 = !DILocation(line: 845, column: 4, scope: !3238)
!3266 = !DILocation(line: 854, column: 3, scope: !3154)
!3267 = !DILocation(line: 854, column: 11, scope: !3154)
!3268 = !DILocation(line: 854, column: 17, scope: !3154)
!3269 = !DILocation(line: 856, column: 2, scope: !3154)
!3270 = !DILocation(line: 857, column: 21, scope: !3271)
!3271 = distinct !DILexicalBlock(scope: !3130, file: !25, line: 857, column: 11)
!3272 = !DILocation(line: 857, column: 26, scope: !3271)
!3273 = !DILocation(line: 857, column: 32, scope: !3271)
!3274 = !DILocation(line: 857, column: 41, scope: !3271)
!3275 = !DILocation(line: 857, column: 12, scope: !3271)
!3276 = !DILocation(line: 857, column: 51, scope: !3271)
!3277 = !DILocation(line: 857, column: 57, scope: !3271)
!3278 = !DILocation(line: 857, column: 11, scope: !3271)
!3279 = !DILocation(line: 857, column: 70, scope: !3271)
!3280 = !DILocation(line: 857, column: 74, scope: !3271)
!3281 = !DILocation(line: 857, column: 79, scope: !3271)
!3282 = !DILocation(line: 857, column: 85, scope: !3271)
!3283 = !DILocation(line: 857, column: 94, scope: !3271)
!3284 = !DILocation(line: 857, column: 104, scope: !3271)
!3285 = !DILocation(line: 857, column: 117, scope: !3271)
!3286 = !DILocation(line: 857, column: 122, scope: !3271)
!3287 = !DILocation(line: 857, column: 128, scope: !3271)
!3288 = !DILocation(line: 857, column: 137, scope: !3271)
!3289 = !DILocation(line: 857, column: 147, scope: !3271)
!3290 = !DILocation(line: 857, column: 108, scope: !3271)
!3291 = !DILocation(line: 857, column: 157, scope: !3271)
!3292 = !DILocation(line: 857, column: 163, scope: !3271)
!3293 = !DILocation(line: 857, column: 107, scope: !3271)
!3294 = !DILocalVariable(name: "wi", scope: !3295, file: !25, line: 858, type: !3155)
!3295 = distinct !DILexicalBlock(scope: !3271, file: !25, line: 857, column: 178)
!3296 = !DILocation(line: 858, column: 16, scope: !3295)
!3297 = !DILocation(line: 858, column: 34, scope: !3295)
!3298 = !DILocation(line: 858, column: 42, scope: !3295)
!3299 = !DILocation(line: 858, column: 22, scope: !3295)
!3300 = !DILocation(line: 863, column: 19, scope: !3301)
!3301 = distinct !DILexicalBlock(scope: !3295, file: !25, line: 863, column: 7)
!3302 = !DILocation(line: 863, column: 27, scope: !3301)
!3303 = !DILocation(line: 863, column: 7, scope: !3301)
!3304 = !DILocation(line: 863, column: 31, scope: !3301)
!3305 = !DILocation(line: 865, column: 52, scope: !3306)
!3306 = distinct !DILexicalBlock(scope: !3301, file: !25, line: 863, column: 39)
!3307 = !DILocation(line: 865, column: 63, scope: !3306)
!3308 = !DILocation(line: 865, column: 4, scope: !3306)
!3309 = !DILocation(line: 867, column: 20, scope: !3310)
!3310 = distinct !DILexicalBlock(scope: !3306, file: !25, line: 867, column: 8)
!3311 = !DILocation(line: 867, column: 28, scope: !3310)
!3312 = !DILocation(line: 867, column: 8, scope: !3310)
!3313 = !DILocation(line: 867, column: 32, scope: !3310)
!3314 = !DILocation(line: 869, column: 55, scope: !3315)
!3315 = distinct !DILexicalBlock(scope: !3310, file: !25, line: 867, column: 47)
!3316 = !DILocation(line: 869, column: 62, scope: !3315)
!3317 = !DILocation(line: 869, column: 5, scope: !3315)
!3318 = !DILocation(line: 872, column: 36, scope: !3315)
!3319 = !DILocation(line: 872, column: 44, scope: !3315)
!3320 = !DILocation(line: 872, column: 52, scope: !3315)
!3321 = !DILocation(line: 873, column: 6, scope: !3315)
!3322 = !DILocation(line: 873, column: 10, scope: !3315)
!3323 = !DILocation(line: 873, column: 22, scope: !3315)
!3324 = !DILocation(line: 874, column: 6, scope: !3315)
!3325 = !DILocation(line: 874, column: 10, scope: !3315)
!3326 = !DILocation(line: 875, column: 6, scope: !3315)
!3327 = !DILocation(line: 875, column: 10, scope: !3315)
!3328 = !DILocation(line: 875, column: 19, scope: !3315)
!3329 = !DILocation(line: 875, column: 37, scope: !3315)
!3330 = !DILocation(line: 876, column: 6, scope: !3315)
!3331 = !DILocation(line: 876, column: 10, scope: !3315)
!3332 = !DILocation(line: 877, column: 6, scope: !3315)
!3333 = !DILocation(line: 877, column: 10, scope: !3315)
!3334 = !DILocation(line: 877, column: 19, scope: !3315)
!3335 = !DILocation(line: 877, column: 37, scope: !3315)
!3336 = !DILocation(line: 878, column: 6, scope: !3315)
!3337 = !DILocation(line: 878, column: 14, scope: !3315)
!3338 = !DILocation(line: 878, column: 31, scope: !3315)
!3339 = !DILocation(line: 872, column: 5, scope: !3315)
!3340 = !DILocation(line: 879, column: 4, scope: !3315)
!3341 = !DILocation(line: 881, column: 29, scope: !3310)
!3342 = !DILocation(line: 881, column: 37, scope: !3310)
!3343 = !DILocation(line: 881, column: 46, scope: !3310)
!3344 = !DILocation(line: 881, column: 54, scope: !3310)
!3345 = !DILocation(line: 881, column: 71, scope: !3310)
!3346 = !DILocation(line: 881, column: 79, scope: !3310)
!3347 = !DILocation(line: 881, column: 59, scope: !3310)
!3348 = !DILocation(line: 881, column: 83, scope: !3310)
!3349 = !DILocation(line: 881, column: 108, scope: !3310)
!3350 = !DILocation(line: 881, column: 116, scope: !3310)
!3351 = !DILocation(line: 881, column: 96, scope: !3310)
!3352 = !DILocation(line: 881, column: 120, scope: !3310)
!3353 = !DILocation(line: 881, column: 5, scope: !3310)
!3354 = !DILocation(line: 883, column: 3, scope: !3306)
!3355 = !DILocation(line: 885, column: 50, scope: !3356)
!3356 = distinct !DILexicalBlock(scope: !3301, file: !25, line: 884, column: 8)
!3357 = !DILocation(line: 885, column: 61, scope: !3356)
!3358 = !DILocation(line: 885, column: 4, scope: !3356)
!3359 = !DILocation(line: 886, column: 28, scope: !3356)
!3360 = !DILocation(line: 886, column: 36, scope: !3356)
!3361 = !DILocation(line: 886, column: 45, scope: !3356)
!3362 = !DILocation(line: 886, column: 53, scope: !3356)
!3363 = !DILocation(line: 886, column: 70, scope: !3356)
!3364 = !DILocation(line: 886, column: 78, scope: !3356)
!3365 = !DILocation(line: 886, column: 58, scope: !3356)
!3366 = !DILocation(line: 886, column: 82, scope: !3356)
!3367 = !DILocation(line: 886, column: 4, scope: !3356)
!3368 = !DILocation(line: 889, column: 3, scope: !3295)
!3369 = !DILocation(line: 889, column: 11, scope: !3295)
!3370 = !DILocation(line: 889, column: 17, scope: !3295)
!3371 = !DILocation(line: 891, column: 2, scope: !3295)
!3372 = !DILocation(line: 894, column: 7, scope: !3373)
!3373 = distinct !DILexicalBlock(scope: !3374, file: !25, line: 894, column: 7)
!3374 = distinct !DILexicalBlock(scope: !3271, file: !25, line: 892, column: 7)
!3375 = !DILocation(line: 894, column: 15, scope: !3373)
!3376 = !DILocation(line: 894, column: 31, scope: !3373)
!3377 = !DILocation(line: 894, column: 37, scope: !3373)
!3378 = !DILocation(line: 898, column: 3, scope: !3379)
!3379 = distinct !DILexicalBlock(scope: !3373, file: !25, line: 894, column: 50)
!3380 = !DILocation(line: 903, column: 9, scope: !3381)
!3381 = distinct !DILexicalBlock(scope: !3382, file: !25, line: 903, column: 8)
!3382 = distinct !DILexicalBlock(scope: !3373, file: !25, line: 899, column: 8)
!3383 = !DILocation(line: 903, column: 17, scope: !3381)
!3384 = !DILocation(line: 903, column: 34, scope: !3381)
!3385 = !DILocation(line: 903, column: 46, scope: !3381)
!3386 = !DILocation(line: 903, column: 61, scope: !3381)
!3387 = !DILocation(line: 903, column: 66, scope: !3381)
!3388 = !DILocation(line: 903, column: 71, scope: !3381)
!3389 = !DILocation(line: 903, column: 77, scope: !3381)
!3390 = !DILocation(line: 903, column: 86, scope: !3381)
!3391 = !DILocation(line: 903, column: 95, scope: !3381)
!3392 = !DILocation(line: 903, column: 101, scope: !3381)
!3393 = !DILocation(line: 903, column: 104, scope: !3381)
!3394 = !DILocation(line: 903, column: 114, scope: !3381)
!3395 = !DILocation(line: 903, column: 134, scope: !3381)
!3396 = !DILocation(line: 903, column: 138, scope: !3381)
!3397 = !DILocation(line: 904, column: 22, scope: !3398)
!3398 = distinct !DILexicalBlock(scope: !3381, file: !25, line: 904, column: 9)
!3399 = !DILocation(line: 904, column: 30, scope: !3398)
!3400 = !DILocation(line: 904, column: 10, scope: !3398)
!3401 = !DILocation(line: 904, column: 34, scope: !3398)
!3402 = !DILocation(line: 904, column: 49, scope: !3398)
!3403 = !DILocation(line: 904, column: 55, scope: !3398)
!3404 = !DILocation(line: 904, column: 61, scope: !3398)
!3405 = !DILocation(line: 904, column: 69, scope: !3398)
!3406 = !DILocation(line: 904, column: 75, scope: !3398)
!3407 = !DILocation(line: 904, column: 60, scope: !3398)
!3408 = !DILocation(line: 905, column: 41, scope: !3398)
!3409 = !DILocation(line: 905, column: 49, scope: !3398)
!3410 = !DILocation(line: 905, column: 29, scope: !3398)
!3411 = !DILocation(line: 905, column: 53, scope: !3398)
!3412 = !DILocation(line: 905, column: 69, scope: !3398)
!3413 = !DILocation(line: 905, column: 77, scope: !3398)
!3414 = !DILocation(line: 905, column: 89, scope: !3398)
!3415 = !DILocation(line: 905, column: 97, scope: !3398)
!3416 = !DILocation(line: 905, column: 6, scope: !3398)
!3417 = !DILocation(line: 904, column: 87, scope: !3398)
!3418 = !DILocation(line: 907, column: 20, scope: !3419)
!3419 = distinct !DILexicalBlock(scope: !3382, file: !25, line: 907, column: 8)
!3420 = !DILocation(line: 907, column: 28, scope: !3419)
!3421 = !DILocation(line: 907, column: 8, scope: !3419)
!3422 = !DILocation(line: 907, column: 32, scope: !3419)
!3423 = !DILocation(line: 907, column: 47, scope: !3419)
!3424 = !DILocation(line: 908, column: 21, scope: !3425)
!3425 = distinct !DILexicalBlock(scope: !3426, file: !25, line: 908, column: 9)
!3426 = distinct !DILexicalBlock(scope: !3419, file: !25, line: 907, column: 53)
!3427 = !DILocation(line: 908, column: 29, scope: !3425)
!3428 = !DILocation(line: 908, column: 9, scope: !3425)
!3429 = !DILocation(line: 908, column: 33, scope: !3425)
!3430 = !DILocation(line: 909, column: 28, scope: !3425)
!3431 = !DILocation(line: 909, column: 36, scope: !3425)
!3432 = !DILocation(line: 909, column: 6, scope: !3425)
!3433 = !DILocation(line: 911, column: 30, scope: !3425)
!3434 = !DILocation(line: 911, column: 38, scope: !3425)
!3435 = !DILocation(line: 911, column: 47, scope: !3425)
!3436 = !DILocation(line: 911, column: 55, scope: !3425)
!3437 = !DILocation(line: 911, column: 72, scope: !3425)
!3438 = !DILocation(line: 911, column: 80, scope: !3425)
!3439 = !DILocation(line: 911, column: 60, scope: !3425)
!3440 = !DILocation(line: 911, column: 84, scope: !3425)
!3441 = !DILocation(line: 911, column: 109, scope: !3425)
!3442 = !DILocation(line: 911, column: 117, scope: !3425)
!3443 = !DILocation(line: 911, column: 97, scope: !3425)
!3444 = !DILocation(line: 911, column: 121, scope: !3425)
!3445 = !DILocation(line: 911, column: 6, scope: !3425)
!3446 = !DILocation(line: 912, column: 4, scope: !3426)
!3447 = !DILocation(line: 917, column: 7, scope: !3448)
!3448 = distinct !DILexicalBlock(scope: !2890, file: !25, line: 917, column: 6)
!3449 = !DILocation(line: 917, column: 15, scope: !3448)
!3450 = !DILocation(line: 917, column: 32, scope: !3448)
!3451 = !DILocation(line: 917, column: 44, scope: !3448)
!3452 = !DILocation(line: 917, column: 59, scope: !3448)
!3453 = !DILocation(line: 917, column: 62, scope: !3448)
!3454 = !DILocation(line: 919, column: 9, scope: !3455)
!3455 = distinct !DILexicalBlock(scope: !3456, file: !25, line: 919, column: 7)
!3456 = distinct !DILexicalBlock(scope: !3448, file: !25, line: 917, column: 76)
!3457 = !DILocation(line: 919, column: 17, scope: !3455)
!3458 = !DILocation(line: 919, column: 23, scope: !3455)
!3459 = !DILocation(line: 919, column: 8, scope: !3455)
!3460 = !DILocation(line: 919, column: 36, scope: !3455)
!3461 = !DILocation(line: 919, column: 40, scope: !3455)
!3462 = !DILocation(line: 919, column: 48, scope: !3455)
!3463 = !DILocation(line: 919, column: 65, scope: !3455)
!3464 = !DILocation(line: 919, column: 87, scope: !3455)
!3465 = !DILocation(line: 919, column: 79, scope: !3455)
!3466 = !DILocation(line: 919, column: 99, scope: !3455)
!3467 = !DILocation(line: 919, column: 76, scope: !3455)
!3468 = !DILocation(line: 920, column: 27, scope: !3455)
!3469 = !DILocation(line: 920, column: 4, scope: !3455)
!3470 = !DILocation(line: 926, column: 10, scope: !3471)
!3471 = distinct !DILexicalBlock(scope: !3472, file: !25, line: 926, column: 8)
!3472 = distinct !DILexicalBlock(scope: !3456, file: !25, line: 924, column: 3)
!3473 = !DILocation(line: 926, column: 18, scope: !3471)
!3474 = !DILocation(line: 926, column: 21, scope: !3471)
!3475 = !DILocation(line: 926, column: 34, scope: !3471)
!3476 = !DILocation(line: 926, column: 38, scope: !3471)
!3477 = !DILocation(line: 926, column: 46, scope: !3471)
!3478 = !DILocation(line: 926, column: 63, scope: !3471)
!3479 = !DILocation(line: 926, column: 75, scope: !3471)
!3480 = !DILocation(line: 926, column: 91, scope: !3471)
!3481 = !DILocation(line: 926, column: 96, scope: !3471)
!3482 = !DILocation(line: 926, column: 104, scope: !3471)
!3483 = !DILocation(line: 926, column: 120, scope: !3471)
!3484 = !DILocation(line: 926, column: 126, scope: !3471)
!3485 = !DILocation(line: 926, column: 95, scope: !3471)
!3486 = !DILocation(line: 927, column: 5, scope: !3471)
!3487 = !DILocation(line: 927, column: 13, scope: !3471)
!3488 = !DILocation(line: 927, column: 19, scope: !3471)
!3489 = !DILocation(line: 930, column: 9, scope: !3490)
!3490 = distinct !DILexicalBlock(scope: !3472, file: !25, line: 930, column: 8)
!3491 = !DILocation(line: 930, column: 17, scope: !3490)
!3492 = !DILocation(line: 930, column: 20, scope: !3490)
!3493 = !DILocation(line: 930, column: 33, scope: !3490)
!3494 = !DILocation(line: 930, column: 46, scope: !3490)
!3495 = !DILocation(line: 930, column: 51, scope: !3490)
!3496 = !DILocation(line: 930, column: 57, scope: !3490)
!3497 = !DILocation(line: 930, column: 66, scope: !3490)
!3498 = !DILocation(line: 930, column: 37, scope: !3490)
!3499 = !DILocation(line: 930, column: 76, scope: !3490)
!3500 = !DILocation(line: 930, column: 82, scope: !3490)
!3501 = !DILocation(line: 930, column: 36, scope: !3490)
!3502 = !DILocation(line: 931, column: 5, scope: !3490)
!3503 = !DILocation(line: 931, column: 13, scope: !3490)
!3504 = !DILocation(line: 931, column: 19, scope: !3490)
!3505 = !DILocation(line: 933, column: 10, scope: !3506)
!3506 = distinct !DILexicalBlock(scope: !3472, file: !25, line: 933, column: 8)
!3507 = !DILocation(line: 933, column: 18, scope: !3506)
!3508 = !DILocation(line: 933, column: 24, scope: !3506)
!3509 = !DILocation(line: 933, column: 9, scope: !3506)
!3510 = !DILocation(line: 933, column: 8, scope: !3506)
!3511 = !DILocation(line: 934, column: 13, scope: !3512)
!3512 = distinct !DILexicalBlock(scope: !3506, file: !25, line: 933, column: 38)
!3513 = !DILocation(line: 934, column: 5, scope: !3512)
!3514 = !DILocation(line: 939, column: 6, scope: !3515)
!3515 = distinct !DILexicalBlock(scope: !3512, file: !25, line: 934, column: 24)
!3516 = !DILocation(line: 943, column: 52, scope: !3515)
!3517 = !DILocation(line: 943, column: 60, scope: !3515)
!3518 = !DILocation(line: 943, column: 72, scope: !3515)
!3519 = !DILocation(line: 943, column: 80, scope: !3515)
!3520 = !DILocation(line: 943, column: 6, scope: !3515)
!3521 = !DILocation(line: 949, column: 6, scope: !3515)
!3522 = !DILocation(line: 953, column: 23, scope: !3523)
!3523 = distinct !DILexicalBlock(scope: !3515, file: !25, line: 953, column: 10)
!3524 = !DILocation(line: 953, column: 31, scope: !3523)
!3525 = !DILocation(line: 953, column: 11, scope: !3523)
!3526 = !DILocation(line: 953, column: 35, scope: !3523)
!3527 = !DILocation(line: 953, column: 50, scope: !3523)
!3528 = !DILocation(line: 953, column: 56, scope: !3523)
!3529 = !DILocation(line: 953, column: 62, scope: !3523)
!3530 = !DILocation(line: 953, column: 70, scope: !3523)
!3531 = !DILocation(line: 953, column: 76, scope: !3523)
!3532 = !DILocation(line: 953, column: 61, scope: !3523)
!3533 = !DILocation(line: 954, column: 58, scope: !3523)
!3534 = !DILocation(line: 954, column: 66, scope: !3523)
!3535 = !DILocation(line: 954, column: 78, scope: !3523)
!3536 = !DILocation(line: 954, column: 86, scope: !3523)
!3537 = !DILocation(line: 954, column: 7, scope: !3523)
!3538 = !DILocation(line: 955, column: 6, scope: !3515)
!3539 = !DILocation(line: 959, column: 6, scope: !3515)
!3540 = !DILocation(line: 961, column: 4, scope: !3512)
!3541 = !DILocation(line: 968, column: 2, scope: !3456)
!3542 = !DILocation(line: 971, column: 9, scope: !3543)
!3543 = distinct !DILexicalBlock(scope: !3544, file: !25, line: 971, column: 7)
!3544 = distinct !DILexicalBlock(scope: !3448, file: !25, line: 969, column: 7)
!3545 = !DILocation(line: 971, column: 17, scope: !3543)
!3546 = !DILocation(line: 971, column: 33, scope: !3543)
!3547 = !DILocation(line: 971, column: 39, scope: !3543)
!3548 = !DILocation(line: 971, column: 8, scope: !3543)
!3549 = !DILocation(line: 971, column: 7, scope: !3543)
!3550 = !DILocation(line: 972, column: 4, scope: !3543)
!3551 = !DILocation(line: 972, column: 12, scope: !3543)
!3552 = !DILocation(line: 972, column: 18, scope: !3543)
!3553 = !DILocation(line: 975, column: 2, scope: !2890)
!3554 = !DILocation(line: 976, column: 1, scope: !2890)
!3555 = distinct !DISubprogram(name: "collide_debris_and_wall", linkageName: "_Z23collide_debris_and_wallP6objectissP10vms_vector", scope: !25, file: !25, line: 986, type: !1465, scopeLine: 986, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!3556 = !DILocalVariable(name: "debris", arg: 1, scope: !3555, file: !25, line: 986, type: !1467)
!3557 = !DILocation(line: 986, column: 38, scope: !3555)
!3558 = !DILocalVariable(name: "hitspeed", arg: 2, scope: !3555, file: !25, line: 986, type: !15)
!3559 = !DILocation(line: 986, column: 50, scope: !3555)
!3560 = !DILocalVariable(name: "hitseg", arg: 3, scope: !3555, file: !25, line: 986, type: !173)
!3561 = !DILocation(line: 986, column: 66, scope: !3555)
!3562 = !DILocalVariable(name: "hitwall", arg: 4, scope: !3555, file: !25, line: 986, type: !173)
!3563 = !DILocation(line: 986, column: 80, scope: !3555)
!3564 = !DILocalVariable(name: "hitpt", arg: 5, scope: !3555, file: !25, line: 986, type: !1604)
!3565 = !DILocation(line: 986, column: 101, scope: !3555)
!3566 = !DILocation(line: 987, column: 17, scope: !3555)
!3567 = !DILocation(line: 987, column: 2, scope: !3555)
!3568 = !DILocation(line: 988, column: 2, scope: !3555)
!3569 = distinct !DISubprogram(name: "check_effect_blowup", linkageName: "_Z19check_effect_blowupP7segmentiP10vms_vectorP6objecti", scope: !25, file: !25, line: 545, type: !3570, scopeLine: 546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!3570 = !DISubroutineType(types: !3571)
!3571 = !{!7, !2902, !7, !1604, !1467, !7}
!3572 = !DILocalVariable(name: "seg", arg: 1, scope: !3569, file: !25, line: 545, type: !2902)
!3573 = !DILocation(line: 545, column: 34, scope: !3569)
!3574 = !DILocalVariable(name: "side", arg: 2, scope: !3569, file: !25, line: 545, type: !7)
!3575 = !DILocation(line: 545, column: 43, scope: !3569)
!3576 = !DILocalVariable(name: "pnt", arg: 3, scope: !3569, file: !25, line: 545, type: !1604)
!3577 = !DILocation(line: 545, column: 61, scope: !3569)
!3578 = !DILocalVariable(name: "blower", arg: 4, scope: !3569, file: !25, line: 545, type: !1467)
!3579 = !DILocation(line: 545, column: 74, scope: !3569)
!3580 = !DILocalVariable(name: "force_blowup_flag", arg: 5, scope: !3569, file: !25, line: 545, type: !7)
!3581 = !DILocation(line: 545, column: 86, scope: !3569)
!3582 = !DILocalVariable(name: "tm", scope: !3569, file: !25, line: 547, type: !7)
!3583 = !DILocation(line: 547, column: 6, scope: !3569)
!3584 = !DILocalVariable(name: "tmf", scope: !3569, file: !25, line: 547, type: !7)
!3585 = !DILocation(line: 547, column: 10, scope: !3569)
!3586 = !DILocalVariable(name: "ec", scope: !3569, file: !25, line: 547, type: !7)
!3587 = !DILocation(line: 547, column: 15, scope: !3569)
!3588 = !DILocalVariable(name: "db", scope: !3569, file: !25, line: 547, type: !7)
!3589 = !DILocation(line: 547, column: 19, scope: !3569)
!3590 = !DILocalVariable(name: "ok_to_blow", scope: !3591, file: !25, line: 551, type: !7)
!3591 = distinct !DILexicalBlock(scope: !3569, file: !25, line: 550, column: 2)
!3592 = !DILocation(line: 551, column: 7, scope: !3591)
!3593 = !DILocation(line: 553, column: 7, scope: !3594)
!3594 = distinct !DILexicalBlock(scope: !3591, file: !25, line: 553, column: 7)
!3595 = !DILocation(line: 553, column: 15, scope: !3594)
!3596 = !DILocation(line: 553, column: 32, scope: !3594)
!3597 = !DILocation(line: 553, column: 44, scope: !3594)
!3598 = !DILocation(line: 554, column: 27, scope: !3599)
!3599 = distinct !DILexicalBlock(scope: !3594, file: !25, line: 554, column: 8)
!3600 = !DILocation(line: 554, column: 35, scope: !3599)
!3601 = !DILocation(line: 554, column: 52, scope: !3599)
!3602 = !DILocation(line: 554, column: 19, scope: !3599)
!3603 = !DILocation(line: 554, column: 64, scope: !3599)
!3604 = !DILocation(line: 554, column: 8, scope: !3599)
!3605 = !DILocation(line: 554, column: 68, scope: !3599)
!3606 = !DILocation(line: 555, column: 16, scope: !3599)
!3607 = !DILocation(line: 555, column: 5, scope: !3599)
!3608 = !DILocation(line: 557, column: 9, scope: !3609)
!3609 = distinct !DILexicalBlock(scope: !3591, file: !25, line: 557, column: 7)
!3610 = !DILocation(line: 557, column: 20, scope: !3609)
!3611 = !DILocation(line: 557, column: 24, scope: !3609)
!3612 = !DILocation(line: 557, column: 32, scope: !3609)
!3613 = !DILocation(line: 557, column: 49, scope: !3609)
!3614 = !DILocation(line: 557, column: 61, scope: !3609)
!3615 = !DILocation(line: 557, column: 7, scope: !3609)
!3616 = !DILocalVariable(name: "trigger_num", scope: !3617, file: !25, line: 558, type: !7)
!3617 = distinct !DILexicalBlock(scope: !3609, file: !25, line: 557, column: 78)
!3618 = !DILocation(line: 558, column: 8, scope: !3617)
!3619 = !DILocalVariable(name: "wall_num", scope: !3617, file: !25, line: 558, type: !7)
!3620 = !DILocation(line: 558, column: 21, scope: !3617)
!3621 = !DILocation(line: 560, column: 15, scope: !3617)
!3622 = !DILocation(line: 560, column: 20, scope: !3617)
!3623 = !DILocation(line: 560, column: 26, scope: !3617)
!3624 = !DILocation(line: 560, column: 32, scope: !3617)
!3625 = !DILocation(line: 560, column: 13, scope: !3617)
!3626 = !DILocation(line: 561, column: 8, scope: !3627)
!3627 = distinct !DILexicalBlock(scope: !3617, file: !25, line: 561, column: 8)
!3628 = !DILocation(line: 561, column: 17, scope: !3627)
!3629 = !DILocation(line: 562, column: 25, scope: !3630)
!3630 = distinct !DILexicalBlock(scope: !3627, file: !25, line: 561, column: 24)
!3631 = !DILocation(line: 562, column: 19, scope: !3630)
!3632 = !DILocation(line: 562, column: 35, scope: !3630)
!3633 = !DILocation(line: 562, column: 17, scope: !3630)
!3634 = !DILocation(line: 564, column: 9, scope: !3635)
!3635 = distinct !DILexicalBlock(scope: !3630, file: !25, line: 564, column: 9)
!3636 = !DILocation(line: 564, column: 21, scope: !3635)
!3637 = !DILocation(line: 565, column: 6, scope: !3635)
!3638 = !DILocation(line: 566, column: 4, scope: !3630)
!3639 = !DILocation(line: 567, column: 3, scope: !3617)
!3640 = !DILocation(line: 571, column: 12, scope: !3641)
!3641 = distinct !DILexicalBlock(scope: !3569, file: !25, line: 571, column: 6)
!3642 = !DILocation(line: 571, column: 17, scope: !3641)
!3643 = !DILocation(line: 571, column: 23, scope: !3641)
!3644 = !DILocation(line: 571, column: 29, scope: !3641)
!3645 = !DILocation(line: 571, column: 10, scope: !3641)
!3646 = !DILocation(line: 571, column: 40, scope: !3641)
!3647 = !DILocation(line: 573, column: 9, scope: !3648)
!3648 = distinct !DILexicalBlock(scope: !3641, file: !25, line: 571, column: 46)
!3649 = !DILocation(line: 573, column: 12, scope: !3648)
!3650 = !DILocation(line: 573, column: 7, scope: !3648)
!3651 = !DILocation(line: 574, column: 6, scope: !3648)
!3652 = !DILocation(line: 577, column: 24, scope: !3653)
!3653 = distinct !DILexicalBlock(scope: !3648, file: !25, line: 577, column: 7)
!3654 = !DILocation(line: 577, column: 15, scope: !3653)
!3655 = !DILocation(line: 577, column: 28, scope: !3653)
!3656 = !DILocation(line: 577, column: 13, scope: !3653)
!3657 = !DILocation(line: 577, column: 39, scope: !3653)
!3658 = !DILocation(line: 577, column: 46, scope: !3653)
!3659 = !DILocation(line: 577, column: 64, scope: !3653)
!3660 = !DILocation(line: 577, column: 56, scope: !3653)
!3661 = !DILocation(line: 577, column: 68, scope: !3653)
!3662 = !DILocation(line: 577, column: 54, scope: !3653)
!3663 = !DILocation(line: 577, column: 81, scope: !3653)
!3664 = !DILocation(line: 577, column: 87, scope: !3653)
!3665 = !DILocation(line: 577, column: 100, scope: !3653)
!3666 = !DILocation(line: 577, column: 92, scope: !3653)
!3667 = !DILocation(line: 577, column: 104, scope: !3653)
!3668 = !DILocation(line: 577, column: 110, scope: !3653)
!3669 = !DILocation(line: 577, column: 91, scope: !3653)
!3670 = !DILocation(line: 577, column: 127, scope: !3653)
!3671 = !DILocation(line: 577, column: 131, scope: !3653)
!3672 = !DILocation(line: 577, column: 134, scope: !3653)
!3673 = !DILocation(line: 577, column: 140, scope: !3653)
!3674 = !DILocation(line: 577, column: 153, scope: !3653)
!3675 = !DILocation(line: 577, column: 144, scope: !3653)
!3676 = !DILocation(line: 577, column: 157, scope: !3653)
!3677 = !DILocation(line: 577, column: 167, scope: !3653)
!3678 = !DILocalVariable(name: "u", scope: !3679, file: !25, line: 578, type: !15)
!3679 = distinct !DILexicalBlock(scope: !3653, file: !25, line: 577, column: 176)
!3680 = !DILocation(line: 578, column: 8, scope: !3679)
!3681 = !DILocalVariable(name: "v", scope: !3679, file: !25, line: 578, type: !15)
!3682 = !DILocation(line: 578, column: 11, scope: !3679)
!3683 = !DILocalVariable(name: "bm", scope: !3679, file: !25, line: 579, type: !3684)
!3684 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3685, size: 64)
!3685 = !DIDerivedType(tag: DW_TAG_typedef, name: "grs_bitmap", file: !3686, line: 87, baseType: !3687)
!3686 = !DIFile(filename: "./2d/gr.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "15a87c28ac1ffa2cb346888bc15e47c5")
!3687 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_grs_bitmap", file: !3686, line: 72, size: 256, flags: DIFlagTypePassByValue, elements: !3688, identifier: "_ZTS11_grs_bitmap")
!3688 = !{!3689, !3690, !3691, !3692, !3693, !3694, !3695, !3696, !3697, !3698, !3699}
!3689 = !DIDerivedType(tag: DW_TAG_member, name: "bm_x", scope: !3687, file: !3686, line: 73, baseType: !173, size: 16)
!3690 = !DIDerivedType(tag: DW_TAG_member, name: "bm_y", scope: !3687, file: !3686, line: 73, baseType: !173, size: 16, offset: 16)
!3691 = !DIDerivedType(tag: DW_TAG_member, name: "bm_w", scope: !3687, file: !3686, line: 74, baseType: !173, size: 16, offset: 32)
!3692 = !DIDerivedType(tag: DW_TAG_member, name: "bm_h", scope: !3687, file: !3686, line: 74, baseType: !173, size: 16, offset: 48)
!3693 = !DIDerivedType(tag: DW_TAG_member, name: "bm_type", scope: !3687, file: !3686, line: 75, baseType: !166, size: 8, offset: 64)
!3694 = !DIDerivedType(tag: DW_TAG_member, name: "bm_flags", scope: !3687, file: !3686, line: 76, baseType: !166, size: 8, offset: 72)
!3695 = !DIDerivedType(tag: DW_TAG_member, name: "bm_rowsize", scope: !3687, file: !3686, line: 79, baseType: !173, size: 16, offset: 80)
!3696 = !DIDerivedType(tag: DW_TAG_member, name: "bm_data", scope: !3687, file: !3686, line: 80, baseType: !379, size: 64, offset: 128)
!3697 = !DIDerivedType(tag: DW_TAG_member, name: "bm_selector", scope: !3687, file: !3686, line: 84, baseType: !183, size: 16, offset: 192)
!3698 = !DIDerivedType(tag: DW_TAG_member, name: "avg_color", scope: !3687, file: !3686, line: 85, baseType: !177, size: 8, offset: 208)
!3699 = !DIDerivedType(tag: DW_TAG_member, name: "unused", scope: !3687, file: !3686, line: 86, baseType: !166, size: 8, offset: 216)
!3700 = !DILocation(line: 579, column: 16, scope: !3679)
!3701 = !DILocation(line: 579, column: 43, scope: !3679)
!3702 = !DILocation(line: 579, column: 34, scope: !3679)
!3703 = !DILocation(line: 579, column: 47, scope: !3679)
!3704 = !DILocation(line: 579, column: 22, scope: !3679)
!3705 = !DILocalVariable(name: "x", scope: !3679, file: !25, line: 580, type: !7)
!3706 = !DILocation(line: 580, column: 8, scope: !3679)
!3707 = !DILocalVariable(name: "y", scope: !3679, file: !25, line: 580, type: !7)
!3708 = !DILocation(line: 580, column: 11, scope: !3679)
!3709 = !DILocalVariable(name: "t", scope: !3679, file: !25, line: 580, type: !7)
!3710 = !DILocation(line: 580, column: 14, scope: !3679)
!3711 = !DILocation(line: 582, column: 4, scope: !3679)
!3712 = !DILocation(line: 582, column: 4, scope: !3713)
!3713 = distinct !DILexicalBlock(scope: !3714, file: !25, line: 582, column: 4)
!3714 = distinct !DILexicalBlock(scope: !3679, file: !25, line: 582, column: 4)
!3715 = !DILocation(line: 582, column: 4, scope: !3716)
!3716 = distinct !DILexicalBlock(scope: !3713, file: !25, line: 582, column: 4)
!3717 = !DILocation(line: 582, column: 4, scope: !3714)
!3718 = !DILocation(line: 586, column: 9, scope: !3719)
!3719 = distinct !DILexicalBlock(scope: !3679, file: !25, line: 586, column: 8)
!3720 = !DILocation(line: 586, column: 8, scope: !3719)
!3721 = !DILocation(line: 588, column: 36, scope: !3722)
!3722 = distinct !DILexicalBlock(scope: !3719, file: !25, line: 587, column: 4)
!3723 = !DILocation(line: 588, column: 41, scope: !3722)
!3724 = !DILocation(line: 588, column: 46, scope: !3722)
!3725 = !DILocation(line: 588, column: 5, scope: !3722)
!3726 = !DILocation(line: 590, column: 24, scope: !3722)
!3727 = !DILocation(line: 590, column: 28, scope: !3722)
!3728 = !DILocation(line: 590, column: 32, scope: !3722)
!3729 = !DILocation(line: 590, column: 26, scope: !3722)
!3730 = !DILocation(line: 590, column: 20, scope: !3722)
!3731 = !DILocation(line: 590, column: 41, scope: !3722)
!3732 = !DILocation(line: 590, column: 45, scope: !3722)
!3733 = !DILocation(line: 590, column: 39, scope: !3722)
!3734 = !DILocation(line: 590, column: 7, scope: !3722)
!3735 = !DILocation(line: 591, column: 24, scope: !3722)
!3736 = !DILocation(line: 591, column: 28, scope: !3722)
!3737 = !DILocation(line: 591, column: 32, scope: !3722)
!3738 = !DILocation(line: 591, column: 26, scope: !3722)
!3739 = !DILocation(line: 591, column: 20, scope: !3722)
!3740 = !DILocation(line: 591, column: 41, scope: !3722)
!3741 = !DILocation(line: 591, column: 45, scope: !3722)
!3742 = !DILocation(line: 591, column: 39, scope: !3722)
!3743 = !DILocation(line: 591, column: 7, scope: !3722)
!3744 = !DILocation(line: 593, column: 13, scope: !3722)
!3745 = !DILocation(line: 593, column: 5, scope: !3722)
!3746 = !DILocation(line: 595, column: 18, scope: !3747)
!3747 = distinct !DILexicalBlock(scope: !3722, file: !25, line: 594, column: 5)
!3748 = !DILocation(line: 596, column: 22, scope: !3747)
!3749 = !DILocation(line: 596, column: 20, scope: !3747)
!3750 = !DILocation(line: 596, column: 29, scope: !3747)
!3751 = !DILocation(line: 596, column: 27, scope: !3747)
!3752 = !DILocation(line: 596, column: 36, scope: !3747)
!3753 = !DILocation(line: 596, column: 40, scope: !3747)
!3754 = !DILocation(line: 596, column: 47, scope: !3747)
!3755 = !DILocation(line: 596, column: 45, scope: !3747)
!3756 = !DILocation(line: 596, column: 49, scope: !3747)
!3757 = !DILocation(line: 596, column: 34, scope: !3747)
!3758 = !DILocation(line: 596, column: 54, scope: !3747)
!3759 = !DILocation(line: 597, column: 22, scope: !3747)
!3760 = !DILocation(line: 597, column: 26, scope: !3747)
!3761 = !DILocation(line: 597, column: 33, scope: !3747)
!3762 = !DILocation(line: 597, column: 31, scope: !3747)
!3763 = !DILocation(line: 597, column: 35, scope: !3747)
!3764 = !DILocation(line: 597, column: 20, scope: !3747)
!3765 = !DILocation(line: 597, column: 44, scope: !3747)
!3766 = !DILocation(line: 597, column: 48, scope: !3747)
!3767 = !DILocation(line: 597, column: 55, scope: !3747)
!3768 = !DILocation(line: 597, column: 53, scope: !3747)
!3769 = !DILocation(line: 597, column: 57, scope: !3747)
!3770 = !DILocation(line: 597, column: 42, scope: !3747)
!3771 = !DILocation(line: 597, column: 62, scope: !3747)
!3772 = !DILocation(line: 598, column: 22, scope: !3747)
!3773 = !DILocation(line: 598, column: 20, scope: !3747)
!3774 = !DILocation(line: 598, column: 29, scope: !3747)
!3775 = !DILocation(line: 598, column: 27, scope: !3747)
!3776 = !DILocation(line: 598, column: 36, scope: !3747)
!3777 = !DILocation(line: 598, column: 40, scope: !3747)
!3778 = !DILocation(line: 598, column: 47, scope: !3747)
!3779 = !DILocation(line: 598, column: 45, scope: !3747)
!3780 = !DILocation(line: 598, column: 49, scope: !3747)
!3781 = !DILocation(line: 598, column: 34, scope: !3747)
!3782 = !DILocation(line: 598, column: 54, scope: !3747)
!3783 = !DILocation(line: 603, column: 9, scope: !3784)
!3784 = distinct !DILexicalBlock(scope: !3722, file: !25, line: 603, column: 9)
!3785 = !DILocation(line: 603, column: 13, scope: !3784)
!3786 = !DILocation(line: 603, column: 22, scope: !3784)
!3787 = !DILocation(line: 604, column: 30, scope: !3784)
!3788 = !DILocation(line: 604, column: 11, scope: !3784)
!3789 = !DILocation(line: 604, column: 9, scope: !3784)
!3790 = !DILocation(line: 604, column: 6, scope: !3784)
!3791 = !DILocation(line: 605, column: 4, scope: !3722)
!3792 = !DILocation(line: 607, column: 8, scope: !3793)
!3793 = distinct !DILexicalBlock(scope: !3679, file: !25, line: 607, column: 8)
!3794 = !DILocation(line: 607, column: 26, scope: !3793)
!3795 = !DILocation(line: 607, column: 30, scope: !3793)
!3796 = !DILocation(line: 607, column: 34, scope: !3793)
!3797 = !DILocation(line: 607, column: 42, scope: !3793)
!3798 = !DILocation(line: 607, column: 46, scope: !3793)
!3799 = !DILocation(line: 607, column: 50, scope: !3793)
!3800 = !DILocation(line: 607, column: 44, scope: !3793)
!3801 = !DILocation(line: 607, column: 57, scope: !3793)
!3802 = !DILocation(line: 607, column: 55, scope: !3793)
!3803 = !DILocation(line: 607, column: 60, scope: !3793)
!3804 = !DILocalVariable(name: "vc", scope: !3805, file: !25, line: 608, type: !7)
!3805 = distinct !DILexicalBlock(scope: !3793, file: !25, line: 607, column: 84)
!3806 = !DILocation(line: 608, column: 9, scope: !3805)
!3807 = !DILocalVariable(name: "sound_num", scope: !3805, file: !25, line: 608, type: !7)
!3808 = !DILocation(line: 608, column: 13, scope: !3805)
!3809 = !DILocalVariable(name: "dest_size", scope: !3805, file: !25, line: 609, type: !15)
!3810 = !DILocation(line: 609, column: 9, scope: !3805)
!3811 = !DILocation(line: 622, column: 20, scope: !3805)
!3812 = !DILocation(line: 622, column: 24, scope: !3805)
!3813 = !DILocation(line: 622, column: 36, scope: !3805)
!3814 = !DILocation(line: 622, column: 5, scope: !3805)
!3815 = !DILocation(line: 624, column: 9, scope: !3816)
!3816 = distinct !DILexicalBlock(scope: !3805, file: !25, line: 624, column: 9)
!3817 = !DILocation(line: 624, column: 23, scope: !3816)
!3818 = !DILocation(line: 625, column: 35, scope: !3816)
!3819 = !DILocation(line: 625, column: 39, scope: !3816)
!3820 = !DILocation(line: 625, column: 51, scope: !3816)
!3821 = !DILocation(line: 625, column: 57, scope: !3816)
!3822 = !DILocation(line: 625, column: 6, scope: !3816)
!3823 = !DILocation(line: 627, column: 9, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3805, file: !25, line: 627, column: 9)
!3825 = !DILocation(line: 627, column: 12, scope: !3824)
!3826 = !DILocation(line: 628, column: 26, scope: !3827)
!3827 = distinct !DILexicalBlock(scope: !3824, file: !25, line: 627, column: 19)
!3828 = !DILocation(line: 628, column: 18, scope: !3827)
!3829 = !DILocation(line: 628, column: 30, scope: !3827)
!3830 = !DILocation(line: 628, column: 16, scope: !3827)
!3831 = !DILocation(line: 629, column: 19, scope: !3827)
!3832 = !DILocation(line: 629, column: 11, scope: !3827)
!3833 = !DILocation(line: 629, column: 23, scope: !3827)
!3834 = !DILocation(line: 629, column: 9, scope: !3827)
!3835 = !DILocation(line: 630, column: 5, scope: !3827)
!3836 = !DILocation(line: 632, column: 18, scope: !3837)
!3837 = distinct !DILexicalBlock(scope: !3824, file: !25, line: 631, column: 10)
!3838 = !DILocation(line: 632, column: 16, scope: !3837)
!3839 = !DILocation(line: 633, column: 9, scope: !3837)
!3840 = !DILocation(line: 636, column: 29, scope: !3805)
!3841 = !DILocation(line: 636, column: 33, scope: !3805)
!3842 = !DILocation(line: 636, column: 45, scope: !3805)
!3843 = !DILocation(line: 636, column: 50, scope: !3805)
!3844 = !DILocation(line: 636, column: 61, scope: !3805)
!3845 = !DILocation(line: 636, column: 5, scope: !3805)
!3846 = !DILocation(line: 638, column: 9, scope: !3847)
!3847 = distinct !DILexicalBlock(scope: !3805, file: !25, line: 638, column: 9)
!3848 = !DILocation(line: 638, column: 12, scope: !3847)
!3849 = !DILocation(line: 638, column: 18, scope: !3847)
!3850 = !DILocation(line: 638, column: 21, scope: !3847)
!3851 = !DILocation(line: 638, column: 24, scope: !3847)
!3852 = !DILocation(line: 638, column: 30, scope: !3847)
!3853 = !DILocation(line: 638, column: 43, scope: !3847)
!3854 = !DILocation(line: 638, column: 35, scope: !3847)
!3855 = !DILocation(line: 638, column: 47, scope: !3847)
!3856 = !DILocation(line: 638, column: 53, scope: !3847)
!3857 = !DILocation(line: 638, column: 34, scope: !3847)
!3858 = !DILocation(line: 640, column: 29, scope: !3859)
!3859 = distinct !DILexicalBlock(scope: !3860, file: !25, line: 640, column: 10)
!3860 = distinct !DILexicalBlock(scope: !3847, file: !25, line: 638, column: 69)
!3861 = !DILocation(line: 640, column: 23, scope: !3859)
!3862 = !DILocation(line: 640, column: 33, scope: !3859)
!3863 = !DILocation(line: 640, column: 21, scope: !3859)
!3864 = !DILocation(line: 640, column: 44, scope: !3859)
!3865 = !DILocation(line: 641, column: 30, scope: !3859)
!3866 = !DILocation(line: 641, column: 41, scope: !3859)
!3867 = !DILocation(line: 641, column: 45, scope: !3859)
!3868 = !DILocation(line: 641, column: 60, scope: !3859)
!3869 = !DILocation(line: 641, column: 7, scope: !3859)
!3870 = !DILocation(line: 643, column: 31, scope: !3871)
!3871 = distinct !DILexicalBlock(scope: !3860, file: !25, line: 643, column: 10)
!3872 = !DILocation(line: 643, column: 23, scope: !3871)
!3873 = !DILocation(line: 643, column: 35, scope: !3871)
!3874 = !DILocation(line: 643, column: 21, scope: !3871)
!3875 = !DILocation(line: 643, column: 46, scope: !3871)
!3876 = !DILocation(line: 644, column: 41, scope: !3871)
!3877 = !DILocation(line: 644, column: 45, scope: !3871)
!3878 = !DILocation(line: 644, column: 57, scope: !3871)
!3879 = !DILocation(line: 644, column: 63, scope: !3871)
!3880 = !DILocation(line: 644, column: 7, scope: !3871)
!3881 = !DILocation(line: 646, column: 18, scope: !3882)
!3882 = distinct !DILexicalBlock(scope: !3860, file: !25, line: 646, column: 10)
!3883 = !DILocation(line: 646, column: 10, scope: !3882)
!3884 = !DILocation(line: 646, column: 22, scope: !3882)
!3885 = !DILocation(line: 646, column: 33, scope: !3882)
!3886 = !DILocation(line: 646, column: 39, scope: !3882)
!3887 = !DILocation(line: 646, column: 58, scope: !3882)
!3888 = !DILocation(line: 646, column: 50, scope: !3882)
!3889 = !DILocation(line: 646, column: 62, scope: !3882)
!3890 = !DILocation(line: 646, column: 42, scope: !3882)
!3891 = !DILocation(line: 646, column: 74, scope: !3882)
!3892 = !DILocation(line: 646, column: 81, scope: !3882)
!3893 = !DILocalVariable(name: "bm_num", scope: !3894, file: !25, line: 647, type: !7)
!3894 = distinct !DILexicalBlock(scope: !3882, file: !25, line: 646, column: 88)
!3895 = !DILocation(line: 647, column: 11, scope: !3894)
!3896 = !DILocalVariable(name: "new_ec", scope: !3894, file: !25, line: 648, type: !3897)
!3897 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3898, size: 64)
!3898 = !DIDerivedType(tag: DW_TAG_typedef, name: "eclip", file: !3899, line: 49, baseType: !3900)
!3899 = !DIFile(filename: "./main_shared/effects.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "29c158295c6a92e65e06e9a9c3d3ac72")
!3900 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "eclip", file: !3899, line: 34, size: 1056, flags: DIFlagTypePassByValue, elements: !3901, identifier: "_ZTS5eclip")
!3901 = !{!3902, !3915, !3916, !3917, !3918, !3919, !3920, !3921, !3922, !3923, !3924, !3925, !3926, !3927}
!3902 = !DIDerivedType(tag: DW_TAG_member, name: "vc", scope: !3900, file: !3899, line: 36, baseType: !3903, size: 672)
!3903 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip", file: !3904, line: 45, baseType: !3905)
!3904 = !DIFile(filename: "main_d2/vclip.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "56f7fb862081e56816e9555a5e64040f")
!3905 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3904, line: 36, size: 672, flags: DIFlagTypePassByValue, elements: !3906, identifier: "_ZTS5vclip")
!3906 = !{!3907, !3908, !3909, !3910, !3911, !3912, !3914}
!3907 = !DIDerivedType(tag: DW_TAG_member, name: "play_time", scope: !3905, file: !3904, line: 38, baseType: !15, size: 32)
!3908 = !DIDerivedType(tag: DW_TAG_member, name: "num_frames", scope: !3905, file: !3904, line: 39, baseType: !7, size: 32, offset: 32)
!3909 = !DIDerivedType(tag: DW_TAG_member, name: "frame_time", scope: !3905, file: !3904, line: 40, baseType: !15, size: 32, offset: 64)
!3910 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3905, file: !3904, line: 41, baseType: !7, size: 32, offset: 96)
!3911 = !DIDerivedType(tag: DW_TAG_member, name: "sound_num", scope: !3905, file: !3904, line: 42, baseType: !173, size: 16, offset: 128)
!3912 = !DIDerivedType(tag: DW_TAG_member, name: "frames", scope: !3905, file: !3904, line: 43, baseType: !3913, size: 480, offset: 144)
!3913 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3186, size: 480, elements: !145)
!3914 = !DIDerivedType(tag: DW_TAG_member, name: "light_value", scope: !3905, file: !3904, line: 44, baseType: !15, size: 32, offset: 640)
!3915 = !DIDerivedType(tag: DW_TAG_member, name: "time_left", scope: !3900, file: !3899, line: 37, baseType: !15, size: 32, offset: 672)
!3916 = !DIDerivedType(tag: DW_TAG_member, name: "frame_count", scope: !3900, file: !3899, line: 38, baseType: !7, size: 32, offset: 704)
!3917 = !DIDerivedType(tag: DW_TAG_member, name: "changing_wall_texture", scope: !3900, file: !3899, line: 39, baseType: !173, size: 16, offset: 736)
!3918 = !DIDerivedType(tag: DW_TAG_member, name: "changing_object_texture", scope: !3900, file: !3899, line: 40, baseType: !173, size: 16, offset: 752)
!3919 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3900, file: !3899, line: 41, baseType: !7, size: 32, offset: 768)
!3920 = !DIDerivedType(tag: DW_TAG_member, name: "crit_clip", scope: !3900, file: !3899, line: 42, baseType: !7, size: 32, offset: 800)
!3921 = !DIDerivedType(tag: DW_TAG_member, name: "dest_bm_num", scope: !3900, file: !3899, line: 43, baseType: !7, size: 32, offset: 832)
!3922 = !DIDerivedType(tag: DW_TAG_member, name: "dest_vclip", scope: !3900, file: !3899, line: 44, baseType: !7, size: 32, offset: 864)
!3923 = !DIDerivedType(tag: DW_TAG_member, name: "dest_eclip", scope: !3900, file: !3899, line: 45, baseType: !7, size: 32, offset: 896)
!3924 = !DIDerivedType(tag: DW_TAG_member, name: "dest_size", scope: !3900, file: !3899, line: 46, baseType: !15, size: 32, offset: 928)
!3925 = !DIDerivedType(tag: DW_TAG_member, name: "sound_num", scope: !3900, file: !3899, line: 47, baseType: !7, size: 32, offset: 960)
!3926 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !3900, file: !3899, line: 48, baseType: !7, size: 32, offset: 992)
!3927 = !DIDerivedType(tag: DW_TAG_member, name: "sidenum", scope: !3900, file: !3899, line: 48, baseType: !7, size: 32, offset: 1024)
!3928 = !DILocation(line: 648, column: 14, scope: !3894)
!3929 = !DILocation(line: 650, column: 33, scope: !3894)
!3930 = !DILocation(line: 650, column: 25, scope: !3894)
!3931 = !DILocation(line: 650, column: 37, scope: !3894)
!3932 = !DILocation(line: 650, column: 17, scope: !3894)
!3933 = !DILocation(line: 650, column: 14, scope: !3894)
!3934 = !DILocation(line: 651, column: 16, scope: !3894)
!3935 = !DILocation(line: 651, column: 24, scope: !3894)
!3936 = !DILocation(line: 651, column: 14, scope: !3894)
!3937 = !DILocation(line: 653, column: 7, scope: !3894)
!3938 = !DILocation(line: 655, column: 27, scope: !3894)
!3939 = !DILocation(line: 655, column: 35, scope: !3894)
!3940 = !DILocation(line: 655, column: 38, scope: !3894)
!3941 = !DILocation(line: 655, column: 7, scope: !3894)
!3942 = !DILocation(line: 655, column: 15, scope: !3894)
!3943 = !DILocation(line: 655, column: 25, scope: !3894)
!3944 = !DILocation(line: 656, column: 7, scope: !3894)
!3945 = !DILocation(line: 656, column: 15, scope: !3894)
!3946 = !DILocation(line: 656, column: 27, scope: !3894)
!3947 = !DILocation(line: 657, column: 24, scope: !3894)
!3948 = !DILocation(line: 657, column: 28, scope: !3894)
!3949 = !DILocation(line: 657, column: 7, scope: !3894)
!3950 = !DILocation(line: 657, column: 15, scope: !3894)
!3951 = !DILocation(line: 657, column: 22, scope: !3894)
!3952 = !DILocation(line: 658, column: 25, scope: !3894)
!3953 = !DILocation(line: 658, column: 7, scope: !3894)
!3954 = !DILocation(line: 658, column: 15, scope: !3894)
!3955 = !DILocation(line: 658, column: 23, scope: !3894)
!3956 = !DILocation(line: 659, column: 7, scope: !3894)
!3957 = !DILocation(line: 659, column: 15, scope: !3894)
!3958 = !DILocation(line: 659, column: 21, scope: !3894)
!3959 = !DILocation(line: 660, column: 37, scope: !3894)
!3960 = !DILocation(line: 660, column: 29, scope: !3894)
!3961 = !DILocation(line: 660, column: 41, scope: !3894)
!3962 = !DILocation(line: 660, column: 7, scope: !3894)
!3963 = !DILocation(line: 660, column: 15, scope: !3894)
!3964 = !DILocation(line: 660, column: 27, scope: !3894)
!3965 = !DILocation(line: 662, column: 7, scope: !3894)
!3966 = !DILocation(line: 0, scope: !3894)
!3967 = !DILocation(line: 663, column: 36, scope: !3894)
!3968 = !DILocation(line: 663, column: 45, scope: !3894)
!3969 = !DILocation(line: 663, column: 43, scope: !3894)
!3970 = !DILocation(line: 663, column: 7, scope: !3894)
!3971 = !DILocation(line: 663, column: 12, scope: !3894)
!3972 = !DILocation(line: 663, column: 18, scope: !3894)
!3973 = !DILocation(line: 663, column: 24, scope: !3894)
!3974 = !DILocation(line: 663, column: 34, scope: !3894)
!3975 = !DILocation(line: 665, column: 6, scope: !3894)
!3976 = !DILocation(line: 667, column: 7, scope: !3977)
!3977 = distinct !DILexicalBlock(scope: !3882, file: !25, line: 666, column: 11)
!3978 = !DILocation(line: 0, scope: !3977)
!3979 = !DILocation(line: 668, column: 36, scope: !3977)
!3980 = !DILocation(line: 668, column: 41, scope: !3977)
!3981 = !DILocation(line: 668, column: 39, scope: !3977)
!3982 = !DILocation(line: 668, column: 7, scope: !3977)
!3983 = !DILocation(line: 668, column: 12, scope: !3977)
!3984 = !DILocation(line: 668, column: 18, scope: !3977)
!3985 = !DILocation(line: 668, column: 24, scope: !3977)
!3986 = !DILocation(line: 668, column: 34, scope: !3977)
!3987 = !DILocation(line: 670, column: 5, scope: !3860)
!3988 = !DILocation(line: 672, column: 44, scope: !3989)
!3989 = distinct !DILexicalBlock(scope: !3847, file: !25, line: 671, column: 10)
!3990 = !DILocation(line: 672, column: 35, scope: !3989)
!3991 = !DILocation(line: 672, column: 48, scope: !3989)
!3992 = !DILocation(line: 672, column: 60, scope: !3989)
!3993 = !DILocation(line: 672, column: 58, scope: !3989)
!3994 = !DILocation(line: 672, column: 6, scope: !3989)
!3995 = !DILocation(line: 672, column: 11, scope: !3989)
!3996 = !DILocation(line: 672, column: 17, scope: !3989)
!3997 = !DILocation(line: 672, column: 23, scope: !3989)
!3998 = !DILocation(line: 672, column: 33, scope: !3989)
!3999 = !DILocation(line: 675, column: 50, scope: !3989)
!4000 = !DILocation(line: 675, column: 54, scope: !3989)
!4001 = !DILocation(line: 675, column: 69, scope: !3989)
!4002 = !DILocation(line: 675, column: 6, scope: !3989)
!4003 = !DILocation(line: 679, column: 5, scope: !3805)
!4004 = !DILocation(line: 681, column: 3, scope: !3679)
!4005 = !DILocation(line: 682, column: 2, scope: !3648)
!4006 = !DILocation(line: 684, column: 2, scope: !3569)
!4007 = !DILocation(line: 685, column: 1, scope: !3569)
!4008 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !16, file: !16, line: 49, type: !4009, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4009 = !DISubroutineType(types: !4010)
!4010 = !{!15, !7}
!4011 = !DILocalVariable(name: "i", arg: 1, scope: !4008, file: !16, line: 49, type: !7)
!4012 = !DILocation(line: 49, column: 23, scope: !4008)
!4013 = !DILocation(line: 51, column: 9, scope: !4008)
!4014 = !DILocation(line: 51, column: 11, scope: !4008)
!4015 = !DILocation(line: 51, column: 2, scope: !4008)
!4016 = distinct !DISubprogram(name: "ok_to_do_omega_damage", linkageName: "_Z21ok_to_do_omega_damageP6object", scope: !25, file: !25, line: 696, type: !4017, scopeLine: 697, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4017 = !DISubroutineType(types: !4018)
!4018 = !{!7, !1467}
!4019 = !DILocalVariable(name: "weapon", arg: 1, scope: !4016, file: !25, line: 696, type: !1467)
!4020 = !DILocation(line: 696, column: 36, scope: !4016)
!4021 = !DILocalVariable(name: "parent_sig", scope: !4016, file: !25, line: 698, type: !7)
!4022 = !DILocation(line: 698, column: 6, scope: !4016)
!4023 = !DILocation(line: 698, column: 19, scope: !4016)
!4024 = !DILocation(line: 698, column: 27, scope: !4016)
!4025 = !DILocation(line: 698, column: 44, scope: !4016)
!4026 = !DILocalVariable(name: "parent_num", scope: !4016, file: !25, line: 699, type: !7)
!4027 = !DILocation(line: 699, column: 6, scope: !4016)
!4028 = !DILocation(line: 699, column: 19, scope: !4016)
!4029 = !DILocation(line: 699, column: 27, scope: !4016)
!4030 = !DILocation(line: 699, column: 44, scope: !4016)
!4031 = !DILocation(line: 701, column: 8, scope: !4032)
!4032 = distinct !DILexicalBlock(scope: !4016, file: !25, line: 701, column: 6)
!4033 = !DILocation(line: 701, column: 18, scope: !4032)
!4034 = !DILocation(line: 701, column: 7, scope: !4032)
!4035 = !DILocation(line: 701, column: 6, scope: !4032)
!4036 = !DILocation(line: 702, column: 3, scope: !4032)
!4037 = !DILocation(line: 704, column: 14, scope: !4038)
!4038 = distinct !DILexicalBlock(scope: !4016, file: !25, line: 704, column: 6)
!4039 = !DILocation(line: 704, column: 6, scope: !4038)
!4040 = !DILocation(line: 704, column: 26, scope: !4038)
!4041 = !DILocation(line: 704, column: 39, scope: !4038)
!4042 = !DILocation(line: 704, column: 36, scope: !4038)
!4043 = !DILocation(line: 705, column: 3, scope: !4038)
!4044 = !DILocalVariable(name: "dist", scope: !4045, file: !25, line: 707, type: !15)
!4045 = distinct !DILexicalBlock(scope: !4038, file: !25, line: 706, column: 7)
!4046 = !DILocation(line: 707, column: 7, scope: !4045)
!4047 = !DILocation(line: 707, column: 41, scope: !4045)
!4048 = !DILocation(line: 707, column: 33, scope: !4045)
!4049 = !DILocation(line: 707, column: 53, scope: !4045)
!4050 = !DILocation(line: 707, column: 59, scope: !4045)
!4051 = !DILocation(line: 707, column: 67, scope: !4045)
!4052 = !DILocation(line: 707, column: 14, scope: !4045)
!4053 = !DILocation(line: 709, column: 7, scope: !4054)
!4054 = distinct !DILexicalBlock(scope: !4045, file: !25, line: 709, column: 7)
!4055 = !DILocation(line: 709, column: 12, scope: !4054)
!4056 = !DILocation(line: 711, column: 4, scope: !4057)
!4057 = distinct !DILexicalBlock(scope: !4054, file: !25, line: 709, column: 30)
!4058 = !DILocation(line: 717, column: 2, scope: !4016)
!4059 = !DILocation(line: 718, column: 1, scope: !4016)
!4060 = distinct !DISubprogram(name: "f2fl", linkageName: "_Z4f2fli", scope: !16, file: !16, line: 72, type: !4061, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4061 = !DISubroutineType(types: !4062)
!4062 = !{!505, !15}
!4063 = !DILocalVariable(name: "f", arg: 1, scope: !4060, file: !16, line: 72, type: !15)
!4064 = !DILocation(line: 72, column: 26, scope: !4060)
!4065 = !DILocation(line: 74, column: 9, scope: !4060)
!4066 = !DILocation(line: 74, column: 11, scope: !4060)
!4067 = !DILocation(line: 74, column: 2, scope: !4060)
!4068 = distinct !DISubprogram(name: "collide_robot_and_robot", linkageName: "_Z23collide_robot_and_robotP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1025, type: !4069, scopeLine: 1025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4069 = !DISubroutineType(types: !4070)
!4070 = !{null, !1467, !1467, !1604}
!4071 = !DILocalVariable(name: "robot1", arg: 1, scope: !4068, file: !25, line: 1025, type: !1467)
!4072 = !DILocation(line: 1025, column: 38, scope: !4068)
!4073 = !DILocalVariable(name: "robot2", arg: 2, scope: !4068, file: !25, line: 1025, type: !1467)
!4074 = !DILocation(line: 1025, column: 54, scope: !4068)
!4075 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4068, file: !25, line: 1025, type: !1604)
!4076 = !DILocation(line: 1025, column: 74, scope: !4068)
!4077 = !DILocation(line: 1031, column: 19, scope: !4068)
!4078 = !DILocation(line: 1031, column: 27, scope: !4068)
!4079 = !DILocation(line: 1031, column: 2, scope: !4068)
!4080 = !DILocation(line: 1032, column: 2, scope: !4068)
!4081 = distinct !DISubprogram(name: "collide_robot_and_controlcen", linkageName: "_Z28collide_robot_and_controlcenP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1035, type: !4069, scopeLine: 1036, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4082 = !DILocalVariable(name: "obj1", arg: 1, scope: !4081, file: !25, line: 1035, type: !1467)
!4083 = !DILocation(line: 1035, column: 43, scope: !4081)
!4084 = !DILocalVariable(name: "obj2", arg: 2, scope: !4081, file: !25, line: 1035, type: !1467)
!4085 = !DILocation(line: 1035, column: 57, scope: !4081)
!4086 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4081, file: !25, line: 1035, type: !1604)
!4087 = !DILocation(line: 1035, column: 75, scope: !4081)
!4088 = !DILocation(line: 1038, column: 6, scope: !4089)
!4089 = distinct !DILexicalBlock(scope: !4081, file: !25, line: 1038, column: 6)
!4090 = !DILocation(line: 1038, column: 12, scope: !4089)
!4091 = !DILocation(line: 1038, column: 17, scope: !4089)
!4092 = !DILocalVariable(name: "hitvec", scope: !4093, file: !25, line: 1039, type: !1484)
!4093 = distinct !DILexicalBlock(scope: !4089, file: !25, line: 1038, column: 31)
!4094 = !DILocation(line: 1039, column: 14, scope: !4093)
!4095 = !DILocation(line: 1040, column: 47, scope: !4093)
!4096 = !DILocation(line: 1040, column: 53, scope: !4093)
!4097 = !DILocation(line: 1040, column: 59, scope: !4093)
!4098 = !DILocation(line: 1040, column: 65, scope: !4093)
!4099 = !DILocation(line: 1040, column: 26, scope: !4093)
!4100 = !DILocation(line: 1040, column: 3, scope: !4093)
!4101 = !DILocation(line: 1041, column: 19, scope: !4093)
!4102 = !DILocation(line: 1041, column: 3, scope: !4093)
!4103 = !DILocation(line: 1042, column: 2, scope: !4093)
!4104 = !DILocalVariable(name: "hitvec", scope: !4105, file: !25, line: 1044, type: !1484)
!4105 = distinct !DILexicalBlock(scope: !4089, file: !25, line: 1043, column: 7)
!4106 = !DILocation(line: 1044, column: 14, scope: !4105)
!4107 = !DILocation(line: 1045, column: 47, scope: !4105)
!4108 = !DILocation(line: 1045, column: 53, scope: !4105)
!4109 = !DILocation(line: 1045, column: 59, scope: !4105)
!4110 = !DILocation(line: 1045, column: 65, scope: !4105)
!4111 = !DILocation(line: 1045, column: 26, scope: !4105)
!4112 = !DILocation(line: 1045, column: 3, scope: !4105)
!4113 = !DILocation(line: 1046, column: 19, scope: !4105)
!4114 = !DILocation(line: 1046, column: 3, scope: !4105)
!4115 = !DILocation(line: 1049, column: 1, scope: !4081)
!4116 = distinct !DISubprogram(name: "collide_robot_and_player", linkageName: "_Z24collide_robot_and_playerP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1057, type: !4069, scopeLine: 1058, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4117 = !DILocalVariable(name: "robot", arg: 1, scope: !4116, file: !25, line: 1057, type: !1467)
!4118 = !DILocation(line: 1057, column: 39, scope: !4116)
!4119 = !DILocalVariable(name: "playerobj", arg: 2, scope: !4116, file: !25, line: 1057, type: !1467)
!4120 = !DILocation(line: 1057, column: 54, scope: !4116)
!4121 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4116, file: !25, line: 1057, type: !1604)
!4122 = !DILocation(line: 1057, column: 77, scope: !4116)
!4123 = !DILocalVariable(name: "steal_attempt", scope: !4116, file: !25, line: 1059, type: !7)
!4124 = !DILocation(line: 1059, column: 6, scope: !4116)
!4125 = !DILocalVariable(name: "collision_seg", scope: !4116, file: !25, line: 1060, type: !7)
!4126 = !DILocation(line: 1060, column: 6, scope: !4116)
!4127 = !DILocation(line: 1062, column: 6, scope: !4128)
!4128 = distinct !DILexicalBlock(scope: !4116, file: !25, line: 1062, column: 6)
!4129 = !DILocation(line: 1062, column: 13, scope: !4128)
!4130 = !DILocation(line: 1062, column: 19, scope: !4128)
!4131 = !DILocation(line: 1063, column: 3, scope: !4128)
!4132 = !DILocation(line: 1065, column: 6, scope: !4133)
!4133 = distinct !DILexicalBlock(scope: !4116, file: !25, line: 1065, column: 6)
!4134 = !DILocation(line: 1065, column: 26, scope: !4133)
!4135 = !DILocation(line: 1067, column: 34, scope: !4136)
!4136 = distinct !DILexicalBlock(scope: !4133, file: !25, line: 1066, column: 2)
!4137 = !DILocation(line: 1067, column: 51, scope: !4136)
!4138 = !DILocation(line: 1067, column: 62, scope: !4136)
!4139 = !DILocation(line: 1067, column: 19, scope: !4136)
!4140 = !DILocation(line: 1067, column: 17, scope: !4136)
!4141 = !DILocation(line: 1068, column: 7, scope: !4142)
!4142 = distinct !DILexicalBlock(scope: !4136, file: !25, line: 1068, column: 7)
!4143 = !DILocation(line: 1068, column: 21, scope: !4142)
!4144 = !DILocation(line: 1069, column: 28, scope: !4142)
!4145 = !DILocation(line: 1069, column: 43, scope: !4142)
!4146 = !DILocation(line: 1069, column: 75, scope: !4142)
!4147 = !DILocation(line: 1069, column: 103, scope: !4142)
!4148 = !DILocation(line: 1069, column: 88, scope: !4142)
!4149 = !DILocation(line: 1069, column: 4, scope: !4142)
!4150 = !DILocation(line: 1070, column: 2, scope: !4136)
!4151 = !DILocation(line: 1072, column: 6, scope: !4152)
!4152 = distinct !DILexicalBlock(scope: !4116, file: !25, line: 1072, column: 6)
!4153 = !DILocation(line: 1072, column: 17, scope: !4152)
!4154 = !DILocation(line: 1072, column: 23, scope: !4152)
!4155 = !DILocation(line: 1072, column: 20, scope: !4152)
!4156 = !DILocation(line: 1073, column: 18, scope: !4157)
!4157 = distinct !DILexicalBlock(scope: !4158, file: !25, line: 1073, column: 7)
!4158 = distinct !DILexicalBlock(scope: !4152, file: !25, line: 1072, column: 35)
!4159 = !DILocation(line: 1073, column: 25, scope: !4157)
!4160 = !DILocation(line: 1073, column: 7, scope: !4157)
!4161 = !DILocation(line: 1073, column: 29, scope: !4157)
!4162 = !DILocation(line: 1074, column: 4, scope: !4157)
!4163 = !DILocation(line: 1075, column: 18, scope: !4164)
!4164 = distinct !DILexicalBlock(scope: !4158, file: !25, line: 1075, column: 7)
!4165 = !DILocation(line: 1075, column: 25, scope: !4164)
!4166 = !DILocation(line: 1075, column: 7, scope: !4164)
!4167 = !DILocation(line: 1075, column: 29, scope: !4164)
!4168 = !DILocation(line: 1076, column: 26, scope: !4169)
!4169 = distinct !DILexicalBlock(scope: !4164, file: !25, line: 1075, column: 39)
!4170 = !DILocation(line: 1076, column: 33, scope: !4169)
!4171 = !DILocation(line: 1076, column: 40, scope: !4169)
!4172 = !DILocation(line: 1076, column: 48, scope: !4169)
!4173 = !DILocation(line: 1076, column: 53, scope: !4169)
!4174 = !DILocation(line: 1076, column: 63, scope: !4169)
!4175 = !DILocation(line: 1076, column: 4, scope: !4169)
!4176 = !DILocation(line: 1077, column: 8, scope: !4177)
!4177 = distinct !DILexicalBlock(scope: !4169, file: !25, line: 1077, column: 8)
!4178 = !DILocation(line: 1077, column: 21, scope: !4177)
!4179 = !DILocation(line: 1077, column: 18, scope: !4177)
!4180 = !DILocation(line: 1078, column: 36, scope: !4177)
!4181 = !DILocation(line: 1078, column: 43, scope: !4177)
!4182 = !DILocation(line: 1078, column: 25, scope: !4177)
!4183 = !DILocation(line: 1078, column: 47, scope: !4177)
!4184 = !DILocation(line: 1078, column: 5, scope: !4177)
!4185 = !DILocation(line: 1079, column: 3, scope: !4169)
!4186 = !DILocation(line: 1081, column: 18, scope: !4187)
!4187 = distinct !DILexicalBlock(scope: !4158, file: !25, line: 1081, column: 7)
!4188 = !DILocation(line: 1081, column: 25, scope: !4187)
!4189 = !DILocation(line: 1081, column: 7, scope: !4187)
!4190 = !DILocation(line: 1081, column: 29, scope: !4187)
!4191 = !DILocation(line: 1082, column: 22, scope: !4192)
!4192 = distinct !DILexicalBlock(scope: !4193, file: !25, line: 1082, column: 8)
!4193 = distinct !DILexicalBlock(scope: !4187, file: !25, line: 1081, column: 36)
!4194 = !DILocation(line: 1082, column: 28, scope: !4192)
!4195 = !DILocation(line: 1082, column: 8, scope: !4192)
!4196 = !DILocation(line: 1082, column: 39, scope: !4192)
!4197 = !DILocation(line: 1082, column: 44, scope: !4192)
!4198 = !DILocation(line: 1083, column: 27, scope: !4199)
!4199 = distinct !DILexicalBlock(scope: !4192, file: !25, line: 1082, column: 65)
!4200 = !DILocation(line: 1083, column: 25, scope: !4199)
!4201 = !DILocation(line: 1084, column: 27, scope: !4199)
!4202 = !DILocation(line: 1084, column: 34, scope: !4199)
!4203 = !DILocation(line: 1084, column: 45, scope: !4199)
!4204 = !DILocation(line: 1084, column: 5, scope: !4199)
!4205 = !DILocation(line: 1085, column: 19, scope: !4199)
!4206 = !DILocation(line: 1086, column: 4, scope: !4199)
!4207 = !DILocation(line: 1087, column: 13, scope: !4208)
!4208 = distinct !DILexicalBlock(scope: !4192, file: !25, line: 1087, column: 13)
!4209 = !DILocation(line: 1087, column: 24, scope: !4208)
!4210 = !DILocation(line: 1087, column: 22, scope: !4208)
!4211 = !DILocation(line: 1087, column: 44, scope: !4208)
!4212 = !DILocation(line: 1088, column: 5, scope: !4208)
!4213 = !DILocation(line: 1091, column: 27, scope: !4208)
!4214 = !DILocation(line: 1091, column: 25, scope: !4208)
!4215 = !DILocation(line: 1092, column: 3, scope: !4193)
!4216 = !DILocation(line: 1094, column: 26, scope: !4158)
!4217 = !DILocation(line: 1094, column: 3, scope: !4158)
!4218 = !DILocation(line: 1095, column: 26, scope: !4158)
!4219 = !DILocation(line: 1095, column: 33, scope: !4158)
!4220 = !DILocation(line: 1095, column: 44, scope: !4158)
!4221 = !DILocation(line: 1095, column: 3, scope: !4158)
!4222 = !DILocation(line: 1096, column: 19, scope: !4158)
!4223 = !DILocation(line: 1096, column: 3, scope: !4158)
!4224 = !DILocation(line: 1097, column: 2, scope: !4158)
!4225 = !DILocation(line: 1106, column: 8, scope: !4226)
!4226 = distinct !DILexicalBlock(scope: !4116, file: !25, line: 1106, column: 6)
!4227 = !DILocation(line: 1106, column: 23, scope: !4226)
!4228 = !DILocation(line: 1106, column: 38, scope: !4226)
!4229 = !DILocation(line: 1106, column: 45, scope: !4226)
!4230 = !DILocation(line: 1106, column: 27, scope: !4226)
!4231 = !DILocation(line: 1106, column: 49, scope: !4226)
!4232 = !DILocation(line: 1107, column: 50, scope: !4226)
!4233 = !DILocation(line: 1107, column: 61, scope: !4226)
!4234 = !DILocation(line: 1107, column: 72, scope: !4226)
!4235 = !DILocation(line: 1107, column: 3, scope: !4226)
!4236 = !DILocation(line: 1109, column: 19, scope: !4116)
!4237 = !DILocation(line: 1109, column: 26, scope: !4116)
!4238 = !DILocation(line: 1109, column: 2, scope: !4116)
!4239 = !DILocation(line: 1110, column: 2, scope: !4116)
!4240 = !DILocation(line: 1111, column: 1, scope: !4116)
!4241 = distinct !DISubprogram(name: "net_destroy_controlcen", linkageName: "_Z22net_destroy_controlcenP6object", scope: !25, file: !25, line: 1118, type: !4242, scopeLine: 1119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4242 = !DISubroutineType(types: !4243)
!4243 = !{null, !1467}
!4244 = !DILocalVariable(name: "controlcen", arg: 1, scope: !4241, file: !25, line: 1118, type: !1467)
!4245 = !DILocation(line: 1118, column: 37, scope: !4241)
!4246 = !DILocation(line: 1120, column: 6, scope: !4247)
!4247 = distinct !DILexicalBlock(scope: !4241, file: !25, line: 1120, column: 6)
!4248 = !DILocation(line: 1120, column: 31, scope: !4247)
!4249 = !DILocalVariable(name: "i", scope: !4250, file: !25, line: 1121, type: !7)
!4250 = distinct !DILexicalBlock(scope: !4247, file: !25, line: 1120, column: 37)
!4251 = !DILocation(line: 1121, column: 7, scope: !4250)
!4252 = !DILocation(line: 1123, column: 33, scope: !4250)
!4253 = !DILocation(line: 1123, column: 3, scope: !4250)
!4254 = !DILocation(line: 1125, column: 8, scope: !4255)
!4255 = distinct !DILexicalBlock(scope: !4250, file: !25, line: 1125, column: 7)
!4256 = !DILocation(line: 1125, column: 19, scope: !4255)
!4257 = !DILocation(line: 1125, column: 28, scope: !4255)
!4258 = !DILocation(line: 1125, column: 33, scope: !4255)
!4259 = !DILocation(line: 1125, column: 45, scope: !4255)
!4260 = !DILocation(line: 1125, column: 51, scope: !4255)
!4261 = !DILocation(line: 1125, column: 32, scope: !4255)
!4262 = !DILocation(line: 1126, column: 59, scope: !4263)
!4263 = distinct !DILexicalBlock(scope: !4255, file: !25, line: 1125, column: 85)
!4264 = !DILocation(line: 1126, column: 71, scope: !4263)
!4265 = !DILocation(line: 1126, column: 83, scope: !4263)
!4266 = !DILocation(line: 1126, column: 95, scope: !4263)
!4267 = !DILocation(line: 1126, column: 4, scope: !4263)
!4268 = !DILocation(line: 1127, column: 19, scope: !4263)
!4269 = !DILocation(line: 1127, column: 4, scope: !4263)
!4270 = !DILocation(line: 1128, column: 3, scope: !4263)
!4271 = !DILocation(line: 1129, column: 2, scope: !4250)
!4272 = !DILocation(line: 1131, column: 1, scope: !4241)
!4273 = distinct !DISubprogram(name: "collide_player_and_controlcen", linkageName: "_Z29collide_player_and_controlcenP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1241, type: !4069, scopeLine: 1242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4274 = !DILocalVariable(name: "controlcen", arg: 1, scope: !4273, file: !25, line: 1241, type: !1467)
!4275 = !DILocation(line: 1241, column: 44, scope: !4273)
!4276 = !DILocalVariable(name: "playerobj", arg: 2, scope: !4273, file: !25, line: 1241, type: !1467)
!4277 = !DILocation(line: 1241, column: 64, scope: !4273)
!4278 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4273, file: !25, line: 1241, type: !1604)
!4279 = !DILocation(line: 1241, column: 87, scope: !4273)
!4280 = !DILocation(line: 1243, column: 6, scope: !4281)
!4281 = distinct !DILexicalBlock(scope: !4273, file: !25, line: 1243, column: 6)
!4282 = !DILocation(line: 1243, column: 17, scope: !4281)
!4283 = !DILocation(line: 1243, column: 23, scope: !4281)
!4284 = !DILocation(line: 1243, column: 20, scope: !4281)
!4285 = !DILocation(line: 1244, column: 27, scope: !4286)
!4286 = distinct !DILexicalBlock(scope: !4281, file: !25, line: 1243, column: 35)
!4287 = !DILocation(line: 1245, column: 3, scope: !4286)
!4288 = !DILocation(line: 1246, column: 2, scope: !4286)
!4289 = !DILocation(line: 1248, column: 49, scope: !4273)
!4290 = !DILocation(line: 1248, column: 60, scope: !4273)
!4291 = !DILocation(line: 1248, column: 71, scope: !4273)
!4292 = !DILocation(line: 1248, column: 2, scope: !4273)
!4293 = !DILocation(line: 1249, column: 19, scope: !4273)
!4294 = !DILocation(line: 1249, column: 31, scope: !4273)
!4295 = !DILocation(line: 1249, column: 2, scope: !4273)
!4296 = !DILocation(line: 1251, column: 2, scope: !4273)
!4297 = distinct !DISubprogram(name: "collide_player_and_marker", linkageName: "_Z25collide_player_and_markerP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1254, type: !4069, scopeLine: 1255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4298 = !DILocalVariable(name: "marker", arg: 1, scope: !4297, file: !25, line: 1254, type: !1467)
!4299 = !DILocation(line: 1254, column: 40, scope: !4297)
!4300 = !DILocalVariable(name: "playerobj", arg: 2, scope: !4297, file: !25, line: 1254, type: !1467)
!4301 = !DILocation(line: 1254, column: 56, scope: !4297)
!4302 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4297, file: !25, line: 1254, type: !1604)
!4303 = !DILocation(line: 1254, column: 79, scope: !4297)
!4304 = !DILocation(line: 1256, column: 2, scope: !4297)
!4305 = !DILocation(line: 1258, column: 6, scope: !4306)
!4306 = distinct !DILexicalBlock(scope: !4297, file: !25, line: 1258, column: 6)
!4307 = !DILocation(line: 1258, column: 17, scope: !4306)
!4308 = !DILocation(line: 1258, column: 23, scope: !4306)
!4309 = !DILocation(line: 1258, column: 20, scope: !4306)
!4310 = !DILocalVariable(name: "drawn", scope: !4311, file: !25, line: 1259, type: !7)
!4311 = distinct !DILexicalBlock(scope: !4306, file: !25, line: 1258, column: 35)
!4312 = !DILocation(line: 1259, column: 7, scope: !4311)
!4313 = !DILocation(line: 1261, column: 7, scope: !4314)
!4314 = distinct !DILexicalBlock(scope: !4311, file: !25, line: 1261, column: 7)
!4315 = !DILocation(line: 1261, column: 17, scope: !4314)
!4316 = !DILocation(line: 1263, column: 54, scope: !4317)
!4317 = distinct !DILexicalBlock(scope: !4314, file: !25, line: 1262, column: 3)
!4318 = !DILocation(line: 1263, column: 62, scope: !4317)
!4319 = !DILocation(line: 1263, column: 65, scope: !4317)
!4320 = !DILocation(line: 1263, column: 46, scope: !4317)
!4321 = !DILocation(line: 1263, column: 70, scope: !4317)
!4322 = !DILocation(line: 1263, column: 94, scope: !4317)
!4323 = !DILocation(line: 1263, column: 102, scope: !4317)
!4324 = !DILocation(line: 1263, column: 80, scope: !4317)
!4325 = !DILocation(line: 1263, column: 12, scope: !4317)
!4326 = !DILocation(line: 1263, column: 10, scope: !4317)
!4327 = !DILocation(line: 1264, column: 3, scope: !4317)
!4328 = !DILocation(line: 1267, column: 22, scope: !4329)
!4329 = distinct !DILexicalBlock(scope: !4330, file: !25, line: 1267, column: 8)
!4330 = distinct !DILexicalBlock(scope: !4314, file: !25, line: 1266, column: 3)
!4331 = !DILocation(line: 1267, column: 30, scope: !4329)
!4332 = !DILocation(line: 1267, column: 8, scope: !4329)
!4333 = !DILocation(line: 1268, column: 47, scope: !4329)
!4334 = !DILocation(line: 1268, column: 55, scope: !4329)
!4335 = !DILocation(line: 1268, column: 58, scope: !4329)
!4336 = !DILocation(line: 1268, column: 77, scope: !4329)
!4337 = !DILocation(line: 1268, column: 85, scope: !4329)
!4338 = !DILocation(line: 1268, column: 63, scope: !4329)
!4339 = !DILocation(line: 1268, column: 13, scope: !4329)
!4340 = !DILocation(line: 1268, column: 11, scope: !4329)
!4341 = !DILocation(line: 1268, column: 5, scope: !4329)
!4342 = !DILocation(line: 1270, column: 43, scope: !4329)
!4343 = !DILocation(line: 1270, column: 51, scope: !4329)
!4344 = !DILocation(line: 1270, column: 54, scope: !4329)
!4345 = !DILocation(line: 1270, column: 13, scope: !4329)
!4346 = !DILocation(line: 1270, column: 11, scope: !4329)
!4347 = !DILocation(line: 1273, column: 7, scope: !4348)
!4348 = distinct !DILexicalBlock(scope: !4311, file: !25, line: 1273, column: 7)
!4349 = !DILocation(line: 1274, column: 4, scope: !4348)
!4350 = !DILocation(line: 1276, column: 35, scope: !4311)
!4351 = !DILocation(line: 1276, column: 42, scope: !4311)
!4352 = !DILocation(line: 1276, column: 3, scope: !4311)
!4353 = !DILocation(line: 1277, column: 2, scope: !4311)
!4354 = !DILocation(line: 1278, column: 1, scope: !4297)
!4355 = distinct !DISubprogram(name: "maybe_kill_weapon", linkageName: "_Z17maybe_kill_weaponP6objectS0_", scope: !25, file: !25, line: 1282, type: !4356, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4356 = !DISubroutineType(types: !4357)
!4357 = !{null, !1467, !1467}
!4358 = !DILocalVariable(name: "weapon", arg: 1, scope: !4355, file: !25, line: 1282, type: !1467)
!4359 = !DILocation(line: 1282, column: 32, scope: !4355)
!4360 = !DILocalVariable(name: "other_obj", arg: 2, scope: !4355, file: !25, line: 1282, type: !1467)
!4361 = !DILocation(line: 1282, column: 48, scope: !4355)
!4362 = !DILocation(line: 1295, column: 7, scope: !4363)
!4363 = distinct !DILexicalBlock(scope: !4355, file: !25, line: 1295, column: 6)
!4364 = !DILocation(line: 1295, column: 15, scope: !4363)
!4365 = !DILocation(line: 1295, column: 18, scope: !4363)
!4366 = !DILocation(line: 1295, column: 35, scope: !4363)
!4367 = !DILocation(line: 1295, column: 39, scope: !4363)
!4368 = !DILocation(line: 1295, column: 47, scope: !4363)
!4369 = !DILocation(line: 1295, column: 50, scope: !4363)
!4370 = !DILocation(line: 1295, column: 67, scope: !4363)
!4371 = !DILocation(line: 1295, column: 71, scope: !4363)
!4372 = !DILocation(line: 1295, column: 79, scope: !4363)
!4373 = !DILocation(line: 1295, column: 82, scope: !4363)
!4374 = !DILocation(line: 1297, column: 3, scope: !4375)
!4375 = distinct !DILexicalBlock(scope: !4363, file: !25, line: 1296, column: 2)
!4376 = !DILocation(line: 1297, column: 11, scope: !4375)
!4377 = !DILocation(line: 1297, column: 17, scope: !4375)
!4378 = !DILocation(line: 1298, column: 3, scope: !4375)
!4379 = !DILocation(line: 1303, column: 6, scope: !4380)
!4380 = distinct !DILexicalBlock(scope: !4355, file: !25, line: 1303, column: 6)
!4381 = !DILocation(line: 1303, column: 14, scope: !4380)
!4382 = !DILocation(line: 1303, column: 30, scope: !4380)
!4383 = !DILocation(line: 1303, column: 36, scope: !4380)
!4384 = !DILocation(line: 1303, column: 52, scope: !4380)
!4385 = !DILocation(line: 1303, column: 56, scope: !4380)
!4386 = !DILocation(line: 1303, column: 76, scope: !4380)
!4387 = !DILocation(line: 1303, column: 99, scope: !4380)
!4388 = !DILocation(line: 1303, column: 102, scope: !4380)
!4389 = !DILocation(line: 1303, column: 113, scope: !4380)
!4390 = !DILocation(line: 1303, column: 118, scope: !4380)
!4391 = !DILocation(line: 1306, column: 9, scope: !4392)
!4392 = distinct !DILexicalBlock(scope: !4393, file: !25, line: 1306, column: 7)
!4393 = distinct !DILexicalBlock(scope: !4380, file: !25, line: 1304, column: 2)
!4394 = !DILocation(line: 1306, column: 17, scope: !4392)
!4395 = !DILocation(line: 1306, column: 33, scope: !4392)
!4396 = !DILocation(line: 1306, column: 39, scope: !4392)
!4397 = !DILocation(line: 1306, column: 8, scope: !4392)
!4398 = !DILocation(line: 1306, column: 7, scope: !4392)
!4399 = !DILocation(line: 1308, column: 8, scope: !4400)
!4400 = distinct !DILexicalBlock(scope: !4401, file: !25, line: 1308, column: 8)
!4401 = distinct !DILexicalBlock(scope: !4392, file: !25, line: 1307, column: 3)
!4402 = !DILocation(line: 1308, column: 19, scope: !4400)
!4403 = !DILocation(line: 1308, column: 24, scope: !4400)
!4404 = !DILocation(line: 1309, column: 24, scope: !4400)
!4405 = !DILocation(line: 1309, column: 35, scope: !4400)
!4406 = !DILocation(line: 1309, column: 43, scope: !4400)
!4407 = !DILocation(line: 1309, column: 5, scope: !4400)
!4408 = !DILocation(line: 1309, column: 13, scope: !4400)
!4409 = !DILocation(line: 1309, column: 21, scope: !4400)
!4410 = !DILocation(line: 1311, column: 24, scope: !4400)
!4411 = !DILocation(line: 1311, column: 35, scope: !4400)
!4412 = !DILocation(line: 1311, column: 43, scope: !4400)
!4413 = !DILocation(line: 1311, column: 5, scope: !4400)
!4414 = !DILocation(line: 1311, column: 13, scope: !4400)
!4415 = !DILocation(line: 1311, column: 21, scope: !4400)
!4416 = !DILocation(line: 1313, column: 8, scope: !4417)
!4417 = distinct !DILexicalBlock(scope: !4401, file: !25, line: 1313, column: 8)
!4418 = !DILocation(line: 1313, column: 16, scope: !4417)
!4419 = !DILocation(line: 1313, column: 24, scope: !4417)
!4420 = !DILocation(line: 1315, column: 5, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4417, file: !25, line: 1314, column: 4)
!4422 = !DILocation(line: 1315, column: 13, scope: !4421)
!4423 = !DILocation(line: 1315, column: 21, scope: !4421)
!4424 = !DILocation(line: 1316, column: 5, scope: !4421)
!4425 = !DILocation(line: 1316, column: 13, scope: !4421)
!4426 = !DILocation(line: 1316, column: 19, scope: !4421)
!4427 = !DILocation(line: 1317, column: 4, scope: !4421)
!4428 = !DILocation(line: 1318, column: 3, scope: !4401)
!4429 = !DILocation(line: 1319, column: 2, scope: !4393)
!4430 = !DILocation(line: 1321, column: 3, scope: !4380)
!4431 = !DILocation(line: 1321, column: 11, scope: !4380)
!4432 = !DILocation(line: 1321, column: 17, scope: !4380)
!4433 = !DILocation(line: 1339, column: 1, scope: !4355)
!4434 = distinct !DISubprogram(name: "collide_weapon_and_controlcen", linkageName: "_Z29collide_weapon_and_controlcenP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1341, type: !4069, scopeLine: 1342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4435 = !DILocalVariable(name: "weapon", arg: 1, scope: !4434, file: !25, line: 1341, type: !1467)
!4436 = !DILocation(line: 1341, column: 44, scope: !4434)
!4437 = !DILocalVariable(name: "controlcen", arg: 2, scope: !4434, file: !25, line: 1341, type: !1467)
!4438 = !DILocation(line: 1341, column: 60, scope: !4434)
!4439 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4434, file: !25, line: 1341, type: !1604)
!4440 = !DILocation(line: 1341, column: 84, scope: !4434)
!4441 = !DILocation(line: 1344, column: 6, scope: !4442)
!4442 = distinct !DILexicalBlock(scope: !4434, file: !25, line: 1344, column: 6)
!4443 = !DILocation(line: 1344, column: 14, scope: !4442)
!4444 = !DILocation(line: 1344, column: 17, scope: !4442)
!4445 = !DILocation(line: 1345, column: 30, scope: !4446)
!4446 = distinct !DILexicalBlock(scope: !4442, file: !25, line: 1345, column: 7)
!4447 = !DILocation(line: 1345, column: 8, scope: !4446)
!4448 = !DILocation(line: 1345, column: 7, scope: !4446)
!4449 = !DILocation(line: 1346, column: 4, scope: !4446)
!4450 = !DILocation(line: 1345, column: 36, scope: !4446)
!4451 = !DILocation(line: 1348, column: 6, scope: !4452)
!4452 = distinct !DILexicalBlock(scope: !4434, file: !25, line: 1348, column: 6)
!4453 = !DILocation(line: 1348, column: 14, scope: !4452)
!4454 = !DILocation(line: 1348, column: 31, scope: !4452)
!4455 = !DILocation(line: 1348, column: 43, scope: !4452)
!4456 = !DILocalVariable(name: "damage", scope: !4457, file: !25, line: 1349, type: !15)
!4457 = distinct !DILexicalBlock(scope: !4452, file: !25, line: 1348, column: 58)
!4458 = !DILocation(line: 1349, column: 7, scope: !4457)
!4459 = !DILocation(line: 1349, column: 16, scope: !4457)
!4460 = !DILocation(line: 1349, column: 24, scope: !4457)
!4461 = !DILocation(line: 1351, column: 15, scope: !4462)
!4462 = distinct !DILexicalBlock(scope: !4457, file: !25, line: 1351, column: 7)
!4463 = !DILocation(line: 1351, column: 23, scope: !4462)
!4464 = !DILocation(line: 1351, column: 40, scope: !4462)
!4465 = !DILocation(line: 1351, column: 7, scope: !4462)
!4466 = !DILocation(line: 1351, column: 52, scope: !4462)
!4467 = !DILocation(line: 1351, column: 58, scope: !4462)
!4468 = !DILocation(line: 1351, column: 55, scope: !4462)
!4469 = !DILocation(line: 1352, column: 28, scope: !4462)
!4470 = !DILocation(line: 1352, column: 4, scope: !4462)
!4471 = !DILocation(line: 1354, column: 19, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4457, file: !25, line: 1354, column: 7)
!4473 = !DILocation(line: 1354, column: 27, scope: !4472)
!4474 = !DILocation(line: 1354, column: 7, scope: !4472)
!4475 = !DILocation(line: 1354, column: 31, scope: !4472)
!4476 = !DILocation(line: 1355, column: 26, scope: !4472)
!4477 = !DILocation(line: 1355, column: 34, scope: !4472)
!4478 = !DILocation(line: 1355, column: 4, scope: !4472)
!4479 = !DILocation(line: 1357, column: 28, scope: !4472)
!4480 = !DILocation(line: 1357, column: 40, scope: !4472)
!4481 = !DILocation(line: 1357, column: 48, scope: !4472)
!4482 = !DILocation(line: 1357, column: 65, scope: !4472)
!4483 = !DILocation(line: 1357, column: 77, scope: !4472)
!4484 = !DILocation(line: 1357, column: 82, scope: !4472)
!4485 = !DILocation(line: 1357, column: 86, scope: !4472)
!4486 = !DILocation(line: 1357, column: 4, scope: !4472)
!4487 = !DILocation(line: 1359, column: 52, scope: !4457)
!4488 = !DILocation(line: 1359, column: 64, scope: !4457)
!4489 = !DILocation(line: 1359, column: 75, scope: !4457)
!4490 = !DILocation(line: 1359, column: 3, scope: !4457)
!4491 = !DILocation(line: 1361, column: 19, scope: !4457)
!4492 = !DILocation(line: 1361, column: 27, scope: !4457)
!4493 = !DILocation(line: 1361, column: 35, scope: !4457)
!4494 = !DILocation(line: 1361, column: 52, scope: !4457)
!4495 = !DILocation(line: 1361, column: 12, scope: !4457)
!4496 = !DILocation(line: 1361, column: 10, scope: !4457)
!4497 = !DILocation(line: 1363, column: 30, scope: !4457)
!4498 = !DILocation(line: 1363, column: 42, scope: !4457)
!4499 = !DILocation(line: 1363, column: 50, scope: !4457)
!4500 = !DILocation(line: 1363, column: 58, scope: !4457)
!4501 = !DILocation(line: 1363, column: 75, scope: !4457)
!4502 = !DILocation(line: 1363, column: 3, scope: !4457)
!4503 = !DILocation(line: 1365, column: 21, scope: !4457)
!4504 = !DILocation(line: 1365, column: 29, scope: !4457)
!4505 = !DILocation(line: 1365, column: 3, scope: !4457)
!4506 = !DILocation(line: 1366, column: 2, scope: !4457)
!4507 = !DILocation(line: 1368, column: 27, scope: !4508)
!4508 = distinct !DILexicalBlock(scope: !4452, file: !25, line: 1367, column: 7)
!4509 = !DILocation(line: 1368, column: 39, scope: !4508)
!4510 = !DILocation(line: 1368, column: 47, scope: !4508)
!4511 = !DILocation(line: 1368, column: 64, scope: !4508)
!4512 = !DILocation(line: 1368, column: 76, scope: !4508)
!4513 = !DILocation(line: 1368, column: 81, scope: !4508)
!4514 = !DILocation(line: 1368, column: 85, scope: !4508)
!4515 = !DILocation(line: 1368, column: 3, scope: !4508)
!4516 = !DILocation(line: 1369, column: 21, scope: !4508)
!4517 = !DILocation(line: 1369, column: 29, scope: !4508)
!4518 = !DILocation(line: 1369, column: 3, scope: !4508)
!4519 = !DILocation(line: 1372, column: 1, scope: !4434)
!4520 = distinct !DISubprogram(name: "collide_weapon_and_clutter", linkageName: "_Z26collide_weapon_and_clutterP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1374, type: !4069, scopeLine: 1374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4521 = !DILocalVariable(name: "weapon", arg: 1, scope: !4520, file: !25, line: 1374, type: !1467)
!4522 = !DILocation(line: 1374, column: 41, scope: !4520)
!4523 = !DILocalVariable(name: "clutter", arg: 2, scope: !4520, file: !25, line: 1374, type: !1467)
!4524 = !DILocation(line: 1374, column: 57, scope: !4520)
!4525 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4520, file: !25, line: 1374, type: !1604)
!4526 = !DILocation(line: 1374, column: 78, scope: !4520)
!4527 = !DILocalVariable(name: "exp_vclip", scope: !4520, file: !25, line: 1375, type: !173)
!4528 = !DILocation(line: 1375, column: 8, scope: !4520)
!4529 = !DILocation(line: 1377, column: 6, scope: !4530)
!4530 = distinct !DILexicalBlock(scope: !4520, file: !25, line: 1377, column: 6)
!4531 = !DILocation(line: 1377, column: 15, scope: !4530)
!4532 = !DILocation(line: 1377, column: 23, scope: !4530)
!4533 = !DILocation(line: 1378, column: 23, scope: !4530)
!4534 = !DILocation(line: 1378, column: 31, scope: !4530)
!4535 = !DILocation(line: 1378, column: 3, scope: !4530)
!4536 = !DILocation(line: 1378, column: 12, scope: !4530)
!4537 = !DILocation(line: 1378, column: 20, scope: !4530)
!4538 = !DILocation(line: 1380, column: 50, scope: !4520)
!4539 = !DILocation(line: 1380, column: 58, scope: !4520)
!4540 = !DILocation(line: 1380, column: 69, scope: !4520)
!4541 = !DILocation(line: 1380, column: 2, scope: !4520)
!4542 = !DILocation(line: 1382, column: 26, scope: !4520)
!4543 = !DILocation(line: 1382, column: 35, scope: !4520)
!4544 = !DILocation(line: 1382, column: 43, scope: !4520)
!4545 = !DILocation(line: 1382, column: 62, scope: !4520)
!4546 = !DILocation(line: 1382, column: 71, scope: !4520)
!4547 = !DILocation(line: 1382, column: 76, scope: !4520)
!4548 = !DILocation(line: 1382, column: 81, scope: !4520)
!4549 = !DILocation(line: 1382, column: 86, scope: !4520)
!4550 = !DILocation(line: 1382, column: 91, scope: !4520)
!4551 = !DILocation(line: 1382, column: 2, scope: !4520)
!4552 = !DILocation(line: 1384, column: 7, scope: !4553)
!4553 = distinct !DILexicalBlock(scope: !4520, file: !25, line: 1384, column: 6)
!4554 = !DILocation(line: 1384, column: 16, scope: !4553)
!4555 = !DILocation(line: 1384, column: 24, scope: !4553)
!4556 = !DILocation(line: 1384, column: 29, scope: !4553)
!4557 = !DILocation(line: 1384, column: 34, scope: !4553)
!4558 = !DILocation(line: 1384, column: 43, scope: !4553)
!4559 = !DILocation(line: 1384, column: 49, scope: !4553)
!4560 = !DILocation(line: 1384, column: 33, scope: !4553)
!4561 = !DILocation(line: 1385, column: 18, scope: !4553)
!4562 = !DILocation(line: 1385, column: 3, scope: !4553)
!4563 = !DILocation(line: 1387, column: 20, scope: !4520)
!4564 = !DILocation(line: 1387, column: 28, scope: !4520)
!4565 = !DILocation(line: 1387, column: 2, scope: !4520)
!4566 = !DILocation(line: 1388, column: 1, scope: !4520)
!4567 = distinct !DISubprogram(name: "do_final_boss_frame", linkageName: "_Z19do_final_boss_framev", scope: !25, file: !25, line: 1398, type: !1183, scopeLine: 1399, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4568 = !DILocalVariable(name: "addval", scope: !4567, file: !25, line: 1400, type: !7)
!4569 = !DILocation(line: 1400, column: 6, scope: !4567)
!4570 = !DILocation(line: 1402, column: 7, scope: !4571)
!4571 = distinct !DILexicalBlock(scope: !4567, file: !25, line: 1402, column: 6)
!4572 = !DILocation(line: 1402, column: 6, scope: !4571)
!4573 = !DILocation(line: 1403, column: 3, scope: !4571)
!4574 = !DILocation(line: 1405, column: 7, scope: !4575)
!4575 = distinct !DILexicalBlock(scope: !4567, file: !25, line: 1405, column: 6)
!4576 = !DILocation(line: 1405, column: 6, scope: !4575)
!4577 = !DILocation(line: 1406, column: 3, scope: !4575)
!4578 = !DILocation(line: 1408, column: 6, scope: !4579)
!4579 = distinct !DILexicalBlock(scope: !4567, file: !25, line: 1408, column: 6)
!4580 = !DILocation(line: 1408, column: 32, scope: !4579)
!4581 = !DILocation(line: 1409, column: 29, scope: !4579)
!4582 = !DILocation(line: 1409, column: 3, scope: !4579)
!4583 = !DILocation(line: 1411, column: 31, scope: !4567)
!4584 = !DILocation(line: 1411, column: 28, scope: !4567)
!4585 = !DILocation(line: 1412, column: 6, scope: !4586)
!4586 = distinct !DILexicalBlock(scope: !4567, file: !25, line: 1412, column: 6)
!4587 = !DILocation(line: 1412, column: 32, scope: !4586)
!4588 = !DILocation(line: 1413, column: 3, scope: !4586)
!4589 = !DILocation(line: 1415, column: 2, scope: !4567)
!4590 = !DILocation(line: 1416, column: 2, scope: !4567)
!4591 = !DILocation(line: 1418, column: 1, scope: !4567)
!4592 = distinct !DISubprogram(name: "do_final_boss_hacks", linkageName: "_Z19do_final_boss_hacksv", scope: !25, file: !25, line: 1423, type: !1183, scopeLine: 1424, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4593 = !DILocation(line: 1425, column: 6, scope: !4594)
!4594 = distinct !DILexicalBlock(scope: !4592, file: !25, line: 1425, column: 6)
!4595 = !DILocation(line: 1426, column: 3, scope: !4596)
!4596 = distinct !DILexicalBlock(scope: !4594, file: !25, line: 1425, column: 22)
!4597 = !DILocation(line: 1427, column: 18, scope: !4596)
!4598 = !DILocation(line: 1428, column: 2, scope: !4596)
!4599 = !DILocation(line: 1430, column: 14, scope: !4600)
!4600 = distinct !DILexicalBlock(scope: !4592, file: !25, line: 1430, column: 6)
!4601 = !DILocation(line: 1430, column: 6, scope: !4600)
!4602 = !DILocation(line: 1430, column: 26, scope: !4600)
!4603 = !DILocation(line: 1430, column: 34, scope: !4600)
!4604 = !DILocation(line: 1431, column: 11, scope: !4600)
!4605 = !DILocation(line: 1431, column: 3, scope: !4600)
!4606 = !DILocation(line: 1431, column: 23, scope: !4600)
!4607 = !DILocation(line: 1431, column: 31, scope: !4600)
!4608 = !DILocation(line: 1434, column: 16, scope: !4609)
!4609 = distinct !DILexicalBlock(scope: !4592, file: !25, line: 1434, column: 6)
!4610 = !DILocation(line: 1434, column: 8, scope: !4609)
!4611 = !DILocation(line: 1434, column: 28, scope: !4609)
!4612 = !DILocation(line: 1434, column: 34, scope: !4609)
!4613 = !DILocation(line: 1434, column: 7, scope: !4609)
!4614 = !DILocation(line: 1434, column: 6, scope: !4609)
!4615 = !DILocation(line: 1435, column: 43, scope: !4616)
!4616 = distinct !DILexicalBlock(scope: !4609, file: !25, line: 1434, column: 64)
!4617 = !DILocation(line: 1435, column: 11, scope: !4616)
!4618 = !DILocation(line: 1435, column: 3, scope: !4616)
!4619 = !DILocation(line: 1435, column: 23, scope: !4616)
!4620 = !DILocation(line: 1435, column: 41, scope: !4616)
!4621 = !DILocation(line: 1436, column: 11, scope: !4616)
!4622 = !DILocation(line: 1436, column: 3, scope: !4616)
!4623 = !DILocation(line: 1436, column: 23, scope: !4616)
!4624 = !DILocation(line: 1436, column: 29, scope: !4616)
!4625 = !DILocation(line: 1437, column: 2, scope: !4616)
!4626 = !DILocation(line: 1438, column: 8, scope: !4627)
!4627 = distinct !DILexicalBlock(scope: !4592, file: !25, line: 1438, column: 6)
!4628 = !DILocation(line: 1438, column: 18, scope: !4627)
!4629 = !DILocation(line: 1438, column: 7, scope: !4627)
!4630 = !DILocation(line: 1438, column: 6, scope: !4627)
!4631 = !DILocation(line: 1439, column: 42, scope: !4627)
!4632 = !DILocation(line: 1439, column: 34, scope: !4627)
!4633 = !DILocation(line: 1439, column: 54, scope: !4627)
!4634 = !DILocation(line: 1439, column: 3, scope: !4627)
!4635 = !DILocation(line: 1441, column: 21, scope: !4592)
!4636 = !DILocation(line: 1442, column: 1, scope: !4592)
!4637 = distinct !DISubprogram(name: "do_boss_weapon_collision", linkageName: "_Z24do_boss_weapon_collisionP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1693, type: !4638, scopeLine: 1694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4638 = !DISubroutineType(types: !4639)
!4639 = !{!7, !1467, !1467, !1604}
!4640 = !DILocalVariable(name: "robot", arg: 1, scope: !4637, file: !25, line: 1693, type: !1467)
!4641 = !DILocation(line: 1693, column: 38, scope: !4637)
!4642 = !DILocalVariable(name: "weapon", arg: 2, scope: !4637, file: !25, line: 1693, type: !1467)
!4643 = !DILocation(line: 1693, column: 53, scope: !4637)
!4644 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4637, file: !25, line: 1693, type: !1604)
!4645 = !DILocation(line: 1693, column: 73, scope: !4637)
!4646 = !DILocalVariable(name: "d2_boss_index", scope: !4637, file: !25, line: 1695, type: !7)
!4647 = !DILocation(line: 1695, column: 6, scope: !4637)
!4648 = !DILocalVariable(name: "damage_flag", scope: !4637, file: !25, line: 1696, type: !7)
!4649 = !DILocation(line: 1696, column: 6, scope: !4637)
!4650 = !DILocation(line: 1698, column: 14, scope: !4637)
!4651 = !DILocation(line: 1700, column: 29, scope: !4637)
!4652 = !DILocation(line: 1700, column: 36, scope: !4637)
!4653 = !DILocation(line: 1700, column: 18, scope: !4637)
!4654 = !DILocation(line: 1700, column: 40, scope: !4637)
!4655 = !DILocation(line: 1700, column: 50, scope: !4637)
!4656 = !DILocation(line: 1700, column: 16, scope: !4637)
!4657 = !DILocation(line: 1702, column: 2, scope: !4637)
!4658 = !DILocation(line: 0, scope: !4637)
!4659 = !DILocation(line: 1705, column: 6, scope: !4660)
!4660 = distinct !DILexicalBlock(scope: !4637, file: !25, line: 1705, column: 6)
!4661 = !DILocation(line: 1705, column: 14, scope: !4660)
!4662 = !DILocation(line: 1705, column: 31, scope: !4660)
!4663 = !DILocation(line: 1705, column: 43, scope: !4660)
!4664 = !DILocation(line: 1706, column: 20, scope: !4665)
!4665 = distinct !DILexicalBlock(scope: !4660, file: !25, line: 1706, column: 7)
!4666 = !DILocation(line: 1706, column: 28, scope: !4665)
!4667 = !DILocation(line: 1706, column: 8, scope: !4665)
!4668 = !DILocation(line: 1706, column: 32, scope: !4665)
!4669 = !DILocation(line: 1706, column: 39, scope: !4665)
!4670 = !DILocation(line: 1706, column: 65, scope: !4665)
!4671 = !DILocation(line: 1706, column: 42, scope: !4665)
!4672 = !DILocation(line: 1706, column: 81, scope: !4665)
!4673 = !DILocation(line: 1706, column: 98, scope: !4665)
!4674 = !DILocation(line: 1706, column: 106, scope: !4665)
!4675 = !DILocation(line: 1706, column: 86, scope: !4665)
!4676 = !DILocation(line: 1706, column: 110, scope: !4665)
!4677 = !DILocation(line: 1706, column: 117, scope: !4665)
!4678 = !DILocation(line: 1706, column: 143, scope: !4665)
!4679 = !DILocation(line: 1706, column: 120, scope: !4665)
!4680 = !DILocation(line: 1707, column: 23, scope: !4681)
!4681 = distinct !DILexicalBlock(scope: !4682, file: !25, line: 1707, column: 8)
!4682 = distinct !DILexicalBlock(scope: !4665, file: !25, line: 1706, column: 160)
!4683 = !DILocation(line: 1707, column: 8, scope: !4681)
!4684 = !DILocation(line: 1708, column: 9, scope: !4685)
!4685 = distinct !DILexicalBlock(scope: !4681, file: !25, line: 1708, column: 9)
!4686 = !DILocation(line: 1708, column: 18, scope: !4685)
!4687 = !DILocation(line: 1709, column: 26, scope: !4688)
!4688 = distinct !DILexicalBlock(scope: !4689, file: !25, line: 1709, column: 10)
!4689 = distinct !DILexicalBlock(scope: !4685, file: !25, line: 1708, column: 27)
!4690 = !DILocation(line: 1709, column: 33, scope: !4688)
!4691 = !DILocation(line: 1709, column: 10, scope: !4688)
!4692 = !DILocation(line: 1709, column: 50, scope: !4688)
!4693 = !DILocation(line: 1710, column: 24, scope: !4688)
!4694 = !DILocation(line: 1710, column: 35, scope: !4688)
!4695 = !DILocation(line: 1710, column: 33, scope: !4688)
!4696 = !DILocation(line: 1710, column: 49, scope: !4688)
!4697 = !DILocation(line: 1710, column: 22, scope: !4688)
!4698 = !DILocation(line: 1710, column: 7, scope: !4688)
!4699 = !DILocation(line: 1711, column: 5, scope: !4689)
!4700 = !DILocation(line: 1708, column: 20, scope: !4685)
!4701 = !DILocation(line: 1712, column: 20, scope: !4682)
!4702 = !DILocation(line: 1712, column: 27, scope: !4682)
!4703 = !DILocation(line: 1712, column: 4, scope: !4682)
!4704 = !DILocation(line: 1713, column: 3, scope: !4682)
!4705 = !DILocation(line: 1706, column: 157, scope: !4665)
!4706 = !DILocation(line: 1715, column: 29, scope: !4707)
!4707 = distinct !DILexicalBlock(scope: !4637, file: !25, line: 1715, column: 6)
!4708 = !DILocation(line: 1715, column: 6, scope: !4707)
!4709 = !DILocalVariable(name: "dot", scope: !4710, file: !25, line: 1716, type: !15)
!4710 = distinct !DILexicalBlock(scope: !4707, file: !25, line: 1715, column: 45)
!4711 = !DILocation(line: 1716, column: 9, scope: !4710)
!4712 = !DILocalVariable(name: "tvec1", scope: !4710, file: !25, line: 1717, type: !1484)
!4713 = !DILocation(line: 1717, column: 14, scope: !4710)
!4714 = !DILocation(line: 1720, column: 22, scope: !4710)
!4715 = !DILocation(line: 1720, column: 40, scope: !4710)
!4716 = !DILocation(line: 1720, column: 47, scope: !4710)
!4717 = !DILocation(line: 1720, column: 3, scope: !4710)
!4718 = !DILocation(line: 1721, column: 3, scope: !4710)
!4719 = !DILocation(line: 1722, column: 9, scope: !4710)
!4720 = !DILocation(line: 1722, column: 7, scope: !4710)
!4721 = !DILocation(line: 1723, column: 3, scope: !4710)
!4722 = !DILocation(line: 1725, column: 7, scope: !4723)
!4723 = distinct !DILexicalBlock(scope: !4710, file: !25, line: 1725, column: 7)
!4724 = !DILocation(line: 1725, column: 13, scope: !4723)
!4725 = !DILocation(line: 1725, column: 11, scope: !4723)
!4726 = !DILocalVariable(name: "new_obj", scope: !4727, file: !25, line: 1726, type: !7)
!4727 = distinct !DILexicalBlock(scope: !4723, file: !25, line: 1725, column: 36)
!4728 = !DILocation(line: 1726, column: 8, scope: !4727)
!4729 = !DILocalVariable(name: "segnum", scope: !4727, file: !25, line: 1727, type: !7)
!4730 = !DILocation(line: 1727, column: 8, scope: !4727)
!4731 = !DILocation(line: 1729, column: 28, scope: !4727)
!4732 = !DILocation(line: 1729, column: 45, scope: !4727)
!4733 = !DILocation(line: 1729, column: 52, scope: !4727)
!4734 = !DILocation(line: 1729, column: 13, scope: !4727)
!4735 = !DILocation(line: 1729, column: 11, scope: !4727)
!4736 = !DILocation(line: 1730, column: 50, scope: !4727)
!4737 = !DILocation(line: 1730, column: 61, scope: !4727)
!4738 = !DILocation(line: 1730, column: 4, scope: !4727)
!4739 = !DILocation(line: 1731, column: 16, scope: !4727)
!4740 = !DILocation(line: 1733, column: 8, scope: !4741)
!4741 = distinct !DILexicalBlock(scope: !4727, file: !25, line: 1733, column: 8)
!4742 = !DILocation(line: 1733, column: 34, scope: !4741)
!4743 = !DILocation(line: 1734, column: 33, scope: !4741)
!4744 = !DILocation(line: 1734, column: 42, scope: !4741)
!4745 = !DILocation(line: 1734, column: 47, scope: !4741)
!4746 = !DILocation(line: 1734, column: 31, scope: !4741)
!4747 = !DILocation(line: 1734, column: 5, scope: !4741)
!4748 = !DILocation(line: 1736, column: 8, scope: !4749)
!4749 = distinct !DILexicalBlock(scope: !4727, file: !25, line: 1736, column: 8)
!4750 = !DILocation(line: 1737, column: 9, scope: !4751)
!4751 = distinct !DILexicalBlock(scope: !4752, file: !25, line: 1737, column: 9)
!4752 = distinct !DILexicalBlock(scope: !4749, file: !25, line: 1736, column: 31)
!4753 = !DILocation(line: 1737, column: 35, scope: !4751)
!4754 = !DILocation(line: 1737, column: 49, scope: !4751)
!4755 = !DILocation(line: 1737, column: 47, scope: !4751)
!4756 = !DILocalVariable(name: "sval", scope: !4757, file: !25, line: 1738, type: !7)
!4757 = distinct !DILexicalBlock(scope: !4751, file: !25, line: 1737, column: 59)
!4758 = !DILocation(line: 1738, column: 10, scope: !4757)
!4759 = !DILocation(line: 1740, column: 27, scope: !4757)
!4760 = !DILocation(line: 1741, column: 34, scope: !4757)
!4761 = !DILocation(line: 1741, column: 32, scope: !4757)
!4762 = !DILocation(line: 1742, column: 14, scope: !4757)
!4763 = !DILocation(line: 1742, column: 23, scope: !4757)
!4764 = !DILocation(line: 1742, column: 28, scope: !4757)
!4765 = !DILocation(line: 1742, column: 11, scope: !4757)
!4766 = !DILocation(line: 1743, column: 14, scope: !4757)
!4767 = !DILocation(line: 1743, column: 6, scope: !4757)
!4768 = !DILocation(line: 1744, column: 14, scope: !4769)
!4769 = distinct !DILexicalBlock(scope: !4757, file: !25, line: 1743, column: 20)
!4770 = !DILocation(line: 1744, column: 53, scope: !4769)
!4771 = !DILocation(line: 1745, column: 14, scope: !4769)
!4772 = !DILocation(line: 1745, column: 57, scope: !4769)
!4773 = !DILocation(line: 1746, column: 14, scope: !4769)
!4774 = !DILocation(line: 1746, column: 57, scope: !4769)
!4775 = !DILocation(line: 1747, column: 6, scope: !4769)
!4776 = !DILocation(line: 1749, column: 7, scope: !4769)
!4777 = !DILocation(line: 1749, column: 47, scope: !4769)
!4778 = !DILocation(line: 1751, column: 5, scope: !4757)
!4779 = !DILocation(line: 1752, column: 4, scope: !4752)
!4780 = !DILocation(line: 1756, column: 21, scope: !4781)
!4781 = distinct !DILexicalBlock(scope: !4727, file: !25, line: 1756, column: 8)
!4782 = !DILocation(line: 1756, column: 29, scope: !4781)
!4783 = !DILocation(line: 1756, column: 9, scope: !4781)
!4784 = !DILocation(line: 1756, column: 33, scope: !4781)
!4785 = !DILocation(line: 1756, column: 8, scope: !4781)
!4786 = !DILocation(line: 1757, column: 26, scope: !4787)
!4787 = distinct !DILexicalBlock(scope: !4781, file: !25, line: 1756, column: 41)
!4788 = !DILocation(line: 1757, column: 34, scope: !4787)
!4789 = !DILocation(line: 1757, column: 40, scope: !4787)
!4790 = !DILocation(line: 1757, column: 48, scope: !4787)
!4791 = !DILocation(line: 1757, column: 52, scope: !4787)
!4792 = !DILocation(line: 1757, column: 60, scope: !4787)
!4793 = !DILocation(line: 1757, column: 69, scope: !4787)
!4794 = !DILocation(line: 1757, column: 77, scope: !4787)
!4795 = !DILocation(line: 1758, column: 7, scope: !4787)
!4796 = !DILocation(line: 1758, column: 15, scope: !4787)
!4797 = !DILocation(line: 1758, column: 23, scope: !4787)
!4798 = !DILocation(line: 1758, column: 31, scope: !4787)
!4799 = !DILocation(line: 1758, column: 37, scope: !4787)
!4800 = !DILocation(line: 1758, column: 45, scope: !4787)
!4801 = !DILocation(line: 1758, column: 59, scope: !4787)
!4802 = !DILocation(line: 1758, column: 67, scope: !4787)
!4803 = !DILocation(line: 1758, column: 82, scope: !4787)
!4804 = !DILocation(line: 1758, column: 90, scope: !4787)
!4805 = !DILocation(line: 1757, column: 15, scope: !4787)
!4806 = !DILocation(line: 1757, column: 13, scope: !4787)
!4807 = !DILocation(line: 1760, column: 9, scope: !4808)
!4808 = distinct !DILexicalBlock(scope: !4787, file: !25, line: 1760, column: 9)
!4809 = !DILocation(line: 1760, column: 17, scope: !4808)
!4810 = !DILocalVariable(name: "vec_to_point", scope: !4811, file: !25, line: 1761, type: !1484)
!4811 = distinct !DILexicalBlock(scope: !4808, file: !25, line: 1760, column: 24)
!4812 = !DILocation(line: 1761, column: 17, scope: !4811)
!4813 = !DILocalVariable(name: "weap_vec", scope: !4811, file: !25, line: 1762, type: !1484)
!4814 = !DILocation(line: 1762, column: 17, scope: !4811)
!4815 = !DILocalVariable(name: "speed", scope: !4811, file: !25, line: 1763, type: !15)
!4816 = !DILocation(line: 1763, column: 12, scope: !4811)
!4817 = !DILocation(line: 1765, column: 10, scope: !4818)
!4818 = distinct !DILexicalBlock(scope: !4811, file: !25, line: 1765, column: 10)
!4819 = !DILocation(line: 1765, column: 18, scope: !4818)
!4820 = !DILocation(line: 1765, column: 30, scope: !4818)
!4821 = !DILocation(line: 1766, column: 72, scope: !4822)
!4822 = distinct !DILexicalBlock(scope: !4818, file: !25, line: 1765, column: 45)
!4823 = !DILocation(line: 1766, column: 64, scope: !4822)
!4824 = !DILocation(line: 1766, column: 81, scope: !4822)
!4825 = !DILocation(line: 1766, column: 52, scope: !4822)
!4826 = !DILocation(line: 1766, column: 85, scope: !4822)
!4827 = !DILocation(line: 1766, column: 15, scope: !4822)
!4828 = !DILocation(line: 1766, column: 7, scope: !4822)
!4829 = !DILocation(line: 1766, column: 24, scope: !4822)
!4830 = !DILocation(line: 1766, column: 40, scope: !4822)
!4831 = !DILocation(line: 1766, column: 50, scope: !4822)
!4832 = !DILocation(line: 1767, column: 61, scope: !4822)
!4833 = !DILocation(line: 1767, column: 53, scope: !4822)
!4834 = !DILocation(line: 1767, column: 70, scope: !4822)
!4835 = !DILocation(line: 1767, column: 86, scope: !4822)
!4836 = !DILocation(line: 1767, column: 38, scope: !4822)
!4837 = !DILocation(line: 1767, column: 97, scope: !4822)
!4838 = !DILocation(line: 1767, column: 122, scope: !4822)
!4839 = !DILocation(line: 1767, column: 114, scope: !4822)
!4840 = !DILocation(line: 1767, column: 131, scope: !4822)
!4841 = !DILocation(line: 1767, column: 102, scope: !4822)
!4842 = !DILocation(line: 1767, column: 135, scope: !4822)
!4843 = !DILocation(line: 1767, column: 31, scope: !4822)
!4844 = !DILocation(line: 1767, column: 15, scope: !4822)
!4845 = !DILocation(line: 1767, column: 7, scope: !4822)
!4846 = !DILocation(line: 1767, column: 24, scope: !4822)
!4847 = !DILocation(line: 1767, column: 29, scope: !4822)
!4848 = !DILocation(line: 1768, column: 6, scope: !4822)
!4849 = !DILocation(line: 1770, column: 58, scope: !4811)
!4850 = !DILocation(line: 1770, column: 66, scope: !4811)
!4851 = !DILocation(line: 1770, column: 46, scope: !4811)
!4852 = !DILocation(line: 1770, column: 72, scope: !4811)
!4853 = !DILocation(line: 1770, column: 14, scope: !4811)
!4854 = !DILocation(line: 1770, column: 6, scope: !4811)
!4855 = !DILocation(line: 1770, column: 23, scope: !4811)
!4856 = !DILocation(line: 1770, column: 39, scope: !4811)
!4857 = !DILocation(line: 1770, column: 44, scope: !4811)
!4858 = !DILocation(line: 1771, column: 58, scope: !4811)
!4859 = !DILocation(line: 1771, column: 66, scope: !4811)
!4860 = !DILocation(line: 1771, column: 46, scope: !4811)
!4861 = !DILocation(line: 1771, column: 72, scope: !4811)
!4862 = !DILocation(line: 1771, column: 14, scope: !4811)
!4863 = !DILocation(line: 1771, column: 6, scope: !4811)
!4864 = !DILocation(line: 1771, column: 23, scope: !4811)
!4865 = !DILocation(line: 1771, column: 39, scope: !4811)
!4866 = !DILocation(line: 1771, column: 44, scope: !4811)
!4867 = !DILocation(line: 1772, column: 6, scope: !4811)
!4868 = !DILocation(line: 1774, column: 32, scope: !4811)
!4869 = !DILocation(line: 1774, column: 50, scope: !4811)
!4870 = !DILocation(line: 1774, column: 57, scope: !4811)
!4871 = !DILocation(line: 1774, column: 6, scope: !4811)
!4872 = !DILocation(line: 1775, column: 6, scope: !4811)
!4873 = !DILocation(line: 1776, column: 17, scope: !4811)
!4874 = !DILocation(line: 1776, column: 25, scope: !4811)
!4875 = !DILocation(line: 1776, column: 41, scope: !4811)
!4876 = !DILocation(line: 1776, column: 15, scope: !4811)
!4877 = !DILocation(line: 1777, column: 14, scope: !4811)
!4878 = !DILocation(line: 1777, column: 12, scope: !4811)
!4879 = !DILocation(line: 1778, column: 6, scope: !4811)
!4880 = !DILocation(line: 1779, column: 34, scope: !4811)
!4881 = !DILocation(line: 1779, column: 40, scope: !4811)
!4882 = !DILocation(line: 1779, column: 6, scope: !4811)
!4883 = !DILocation(line: 1780, column: 14, scope: !4811)
!4884 = !DILocation(line: 1780, column: 6, scope: !4811)
!4885 = !DILocation(line: 1780, column: 23, scope: !4811)
!4886 = !DILocation(line: 1780, column: 39, scope: !4811)
!4887 = !DILocation(line: 1780, column: 48, scope: !4811)
!4888 = !DILocation(line: 1781, column: 5, scope: !4811)
!4889 = !DILocation(line: 1782, column: 4, scope: !4787)
!4890 = !DILocation(line: 1783, column: 3, scope: !4727)
!4891 = !DILocation(line: 1784, column: 2, scope: !4710)
!4892 = !DILocation(line: 1785, column: 24, scope: !4893)
!4893 = distinct !DILexicalBlock(scope: !4707, file: !25, line: 1785, column: 11)
!4894 = !DILocation(line: 1785, column: 32, scope: !4893)
!4895 = !DILocation(line: 1785, column: 12, scope: !4893)
!4896 = !DILocation(line: 1785, column: 36, scope: !4893)
!4897 = !DILocation(line: 1785, column: 43, scope: !4893)
!4898 = !DILocation(line: 1785, column: 71, scope: !4893)
!4899 = !DILocation(line: 1785, column: 46, scope: !4893)
!4900 = !DILocation(line: 1785, column: 87, scope: !4893)
!4901 = !DILocation(line: 1785, column: 104, scope: !4893)
!4902 = !DILocation(line: 1785, column: 112, scope: !4893)
!4903 = !DILocation(line: 1785, column: 92, scope: !4893)
!4904 = !DILocation(line: 1785, column: 116, scope: !4893)
!4905 = !DILocation(line: 1785, column: 123, scope: !4893)
!4906 = !DILocation(line: 1785, column: 151, scope: !4893)
!4907 = !DILocation(line: 1785, column: 126, scope: !4893)
!4908 = !DILocalVariable(name: "segnum", scope: !4909, file: !25, line: 1786, type: !7)
!4909 = distinct !DILexicalBlock(scope: !4893, file: !25, line: 1785, column: 168)
!4910 = !DILocation(line: 1786, column: 7, scope: !4909)
!4911 = !DILocation(line: 1788, column: 27, scope: !4909)
!4912 = !DILocation(line: 1788, column: 44, scope: !4909)
!4913 = !DILocation(line: 1788, column: 51, scope: !4909)
!4914 = !DILocation(line: 1788, column: 12, scope: !4909)
!4915 = !DILocation(line: 1788, column: 10, scope: !4909)
!4916 = !DILocation(line: 1789, column: 49, scope: !4909)
!4917 = !DILocation(line: 1789, column: 60, scope: !4909)
!4918 = !DILocation(line: 1789, column: 3, scope: !4909)
!4919 = !DILocation(line: 1790, column: 15, scope: !4909)
!4920 = !DILocation(line: 1791, column: 2, scope: !4909)
!4921 = !DILocation(line: 1793, column: 9, scope: !4637)
!4922 = !DILocation(line: 1793, column: 2, scope: !4637)
!4923 = distinct !DISubprogram(name: "collide_robot_and_weapon", linkageName: "_Z24collide_robot_and_weaponP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1799, type: !4069, scopeLine: 1800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!4924 = !DILocalVariable(name: "robot", arg: 1, scope: !4923, file: !25, line: 1799, type: !1467)
!4925 = !DILocation(line: 1799, column: 39, scope: !4923)
!4926 = !DILocalVariable(name: "weapon", arg: 2, scope: !4923, file: !25, line: 1799, type: !1467)
!4927 = !DILocation(line: 1799, column: 54, scope: !4923)
!4928 = !DILocalVariable(name: "collision_point", arg: 3, scope: !4923, file: !25, line: 1799, type: !1604)
!4929 = !DILocation(line: 1799, column: 74, scope: !4923)
!4930 = !DILocalVariable(name: "damage_flag", scope: !4923, file: !25, line: 1801, type: !7)
!4931 = !DILocation(line: 1801, column: 6, scope: !4923)
!4932 = !DILocalVariable(name: "boss_invul_flag", scope: !4923, file: !25, line: 1802, type: !7)
!4933 = !DILocation(line: 1802, column: 6, scope: !4923)
!4934 = !DILocation(line: 1804, column: 6, scope: !4935)
!4935 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1804, column: 6)
!4936 = !DILocation(line: 1804, column: 14, scope: !4935)
!4937 = !DILocation(line: 1804, column: 17, scope: !4935)
!4938 = !DILocation(line: 1805, column: 30, scope: !4939)
!4939 = distinct !DILexicalBlock(scope: !4935, file: !25, line: 1805, column: 7)
!4940 = !DILocation(line: 1805, column: 8, scope: !4939)
!4941 = !DILocation(line: 1805, column: 7, scope: !4939)
!4942 = !DILocation(line: 1806, column: 4, scope: !4939)
!4943 = !DILocation(line: 1805, column: 36, scope: !4939)
!4944 = !DILocation(line: 1808, column: 17, scope: !4945)
!4945 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1808, column: 6)
!4946 = !DILocation(line: 1808, column: 24, scope: !4945)
!4947 = !DILocation(line: 1808, column: 6, scope: !4945)
!4948 = !DILocation(line: 1808, column: 28, scope: !4945)
!4949 = !DILocation(line: 1809, column: 19, scope: !4950)
!4950 = distinct !DILexicalBlock(scope: !4945, file: !25, line: 1808, column: 39)
!4951 = !DILocation(line: 1809, column: 17, scope: !4950)
!4952 = !DILocation(line: 1810, column: 18, scope: !4953)
!4953 = distinct !DILexicalBlock(scope: !4950, file: !25, line: 1810, column: 7)
!4954 = !DILocation(line: 1810, column: 25, scope: !4953)
!4955 = !DILocation(line: 1810, column: 7, scope: !4953)
!4956 = !DILocation(line: 1810, column: 29, scope: !4953)
!4957 = !DILocation(line: 1810, column: 39, scope: !4953)
!4958 = !DILocation(line: 1811, column: 43, scope: !4959)
!4959 = distinct !DILexicalBlock(scope: !4953, file: !25, line: 1810, column: 51)
!4960 = !DILocation(line: 1811, column: 50, scope: !4959)
!4961 = !DILocation(line: 1811, column: 58, scope: !4959)
!4962 = !DILocation(line: 1811, column: 18, scope: !4959)
!4963 = !DILocation(line: 1811, column: 16, scope: !4959)
!4964 = !DILocation(line: 1812, column: 23, scope: !4959)
!4965 = !DILocation(line: 1812, column: 22, scope: !4959)
!4966 = !DILocation(line: 1812, column: 20, scope: !4959)
!4967 = !DILocation(line: 1813, column: 3, scope: !4959)
!4968 = !DILocation(line: 1814, column: 2, scope: !4950)
!4969 = !DILocation(line: 1818, column: 18, scope: !4970)
!4970 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1818, column: 6)
!4971 = !DILocation(line: 1818, column: 25, scope: !4970)
!4972 = !DILocation(line: 1818, column: 7, scope: !4970)
!4973 = !DILocation(line: 1818, column: 29, scope: !4970)
!4974 = !DILocation(line: 1818, column: 6, scope: !4970)
!4975 = !DILocation(line: 1818, column: 40, scope: !4970)
!4976 = !DILocation(line: 1818, column: 45, scope: !4970)
!4977 = !DILocation(line: 1818, column: 53, scope: !4970)
!4978 = !DILocation(line: 1818, column: 70, scope: !4970)
!4979 = !DILocation(line: 1818, column: 82, scope: !4970)
!4980 = !DILocation(line: 1818, column: 96, scope: !4970)
!4981 = !DILocation(line: 1818, column: 100, scope: !4970)
!4982 = !DILocation(line: 1819, column: 3, scope: !4970)
!4983 = !DILocation(line: 1821, column: 6, scope: !4984)
!4984 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1821, column: 6)
!4985 = !DILocation(line: 1821, column: 14, scope: !4984)
!4986 = !DILocation(line: 1821, column: 17, scope: !4984)
!4987 = !DILocation(line: 1822, column: 3, scope: !4984)
!4988 = !DILocation(line: 1826, column: 6, scope: !4989)
!4989 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1826, column: 6)
!4990 = !DILocation(line: 1826, column: 14, scope: !4989)
!4991 = !DILocation(line: 1826, column: 30, scope: !4989)
!4992 = !DILocation(line: 1826, column: 36, scope: !4989)
!4993 = !DILocation(line: 1827, column: 7, scope: !4994)
!4994 = distinct !DILexicalBlock(scope: !4995, file: !25, line: 1827, column: 7)
!4995 = distinct !DILexicalBlock(scope: !4989, file: !25, line: 1826, column: 53)
!4996 = !DILocation(line: 1827, column: 15, scope: !4994)
!4997 = !DILocation(line: 1827, column: 32, scope: !4994)
!4998 = !DILocation(line: 1827, column: 47, scope: !4994)
!4999 = !DILocation(line: 1827, column: 53, scope: !4994)
!5000 = !DILocation(line: 1827, column: 44, scope: !4994)
!5001 = !DILocation(line: 1828, column: 4, scope: !4994)
!5002 = !DILocation(line: 1830, column: 43, scope: !4994)
!5003 = !DILocation(line: 1830, column: 49, scope: !4994)
!5004 = !DILocation(line: 1830, column: 4, scope: !4994)
!5005 = !DILocation(line: 1830, column: 12, scope: !4994)
!5006 = !DILocation(line: 1830, column: 29, scope: !4994)
!5007 = !DILocation(line: 1830, column: 41, scope: !4994)
!5008 = !DILocation(line: 1833, column: 2, scope: !4995)
!5009 = !DILocation(line: 1835, column: 6, scope: !5010)
!5010 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1835, column: 6)
!5011 = !DILocation(line: 1835, column: 14, scope: !5010)
!5012 = !DILocation(line: 1835, column: 31, scope: !5010)
!5013 = !DILocation(line: 1835, column: 51, scope: !5010)
!5014 = !DILocation(line: 1835, column: 58, scope: !5010)
!5015 = !DILocation(line: 1835, column: 48, scope: !5010)
!5016 = !DILocation(line: 1836, column: 3, scope: !5010)
!5017 = !DILocation(line: 1840, column: 7, scope: !5018)
!5018 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1840, column: 6)
!5019 = !DILocation(line: 1840, column: 15, scope: !5018)
!5020 = !DILocation(line: 1840, column: 32, scope: !5018)
!5021 = !DILocation(line: 1840, column: 44, scope: !5018)
!5022 = !DILocation(line: 1840, column: 59, scope: !5018)
!5023 = !DILocation(line: 1840, column: 74, scope: !5018)
!5024 = !DILocation(line: 1840, column: 81, scope: !5018)
!5025 = !DILocation(line: 1840, column: 63, scope: !5018)
!5026 = !DILocation(line: 1840, column: 85, scope: !5018)
!5027 = !DILocation(line: 1840, column: 62, scope: !5018)
!5028 = !DILocation(line: 1841, column: 8, scope: !5029)
!5029 = distinct !DILexicalBlock(scope: !5018, file: !25, line: 1841, column: 7)
!5030 = !DILocation(line: 1841, column: 15, scope: !5029)
!5031 = !DILocation(line: 1841, column: 23, scope: !5029)
!5032 = !DILocation(line: 1841, column: 28, scope: !5029)
!5033 = !DILocation(line: 1841, column: 48, scope: !5029)
!5034 = !DILocation(line: 1841, column: 56, scope: !5029)
!5035 = !DILocation(line: 1841, column: 31, scope: !5029)
!5036 = !DILocalVariable(name: "probval", scope: !5037, file: !25, line: 1842, type: !15)
!5037 = distinct !DILexicalBlock(scope: !5029, file: !25, line: 1841, column: 61)
!5038 = !DILocation(line: 1842, column: 8, scope: !5037)
!5039 = !DILocalVariable(name: "num_blobs", scope: !5037, file: !25, line: 1843, type: !7)
!5040 = !DILocation(line: 1843, column: 8, scope: !5037)
!5041 = !DILocation(line: 1845, column: 15, scope: !5037)
!5042 = !DILocation(line: 1845, column: 32, scope: !5037)
!5043 = !DILocation(line: 1845, column: 48, scope: !5037)
!5044 = !DILocation(line: 1845, column: 56, scope: !5037)
!5045 = !DILocation(line: 1845, column: 65, scope: !5037)
!5046 = !DILocation(line: 1845, column: 72, scope: !5037)
!5047 = !DILocation(line: 1845, column: 39, scope: !5037)
!5048 = !DILocation(line: 1845, column: 37, scope: !5037)
!5049 = !DILocation(line: 1845, column: 12, scope: !5037)
!5050 = !DILocation(line: 1846, column: 25, scope: !5037)
!5051 = !DILocation(line: 1846, column: 32, scope: !5037)
!5052 = !DILocation(line: 1846, column: 14, scope: !5037)
!5053 = !DILocation(line: 1846, column: 36, scope: !5037)
!5054 = !DILocation(line: 1846, column: 51, scope: !5037)
!5055 = !DILocation(line: 1846, column: 49, scope: !5037)
!5056 = !DILocation(line: 1846, column: 59, scope: !5037)
!5057 = !DILocation(line: 1846, column: 12, scope: !5037)
!5058 = !DILocation(line: 1848, column: 16, scope: !5037)
!5059 = !DILocation(line: 1848, column: 24, scope: !5037)
!5060 = !DILocation(line: 1848, column: 14, scope: !5037)
!5061 = !DILocation(line: 1849, column: 12, scope: !5062)
!5062 = distinct !DILexicalBlock(scope: !5037, file: !25, line: 1849, column: 8)
!5063 = !DILocation(line: 1849, column: 10, scope: !5062)
!5064 = !DILocation(line: 1849, column: 24, scope: !5062)
!5065 = !DILocation(line: 1849, column: 32, scope: !5062)
!5066 = !DILocation(line: 1849, column: 21, scope: !5062)
!5067 = !DILocation(line: 1850, column: 14, scope: !5062)
!5068 = !DILocation(line: 1850, column: 5, scope: !5062)
!5069 = !DILocation(line: 1852, column: 8, scope: !5070)
!5070 = distinct !DILexicalBlock(scope: !5037, file: !25, line: 1852, column: 8)
!5071 = !DILocation(line: 1853, column: 27, scope: !5070)
!5072 = !DILocation(line: 1853, column: 34, scope: !5070)
!5073 = !DILocation(line: 1853, column: 5, scope: !5070)
!5074 = !DILocation(line: 1854, column: 3, scope: !5037)
!5075 = !DILocation(line: 1841, column: 58, scope: !5029)
!5076 = !DILocation(line: 1858, column: 18, scope: !5077)
!5077 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1858, column: 6)
!5078 = !DILocation(line: 1858, column: 26, scope: !5077)
!5079 = !DILocation(line: 1858, column: 6, scope: !5077)
!5080 = !DILocation(line: 1858, column: 30, scope: !5077)
!5081 = !DILocation(line: 1859, column: 7, scope: !5082)
!5082 = distinct !DILexicalBlock(scope: !5077, file: !25, line: 1859, column: 7)
!5083 = !DILocalVariable(name: "wi", scope: !5084, file: !25, line: 1860, type: !3155)
!5084 = distinct !DILexicalBlock(scope: !5082, file: !25, line: 1859, column: 24)
!5085 = !DILocation(line: 1860, column: 17, scope: !5084)
!5086 = !DILocation(line: 1860, column: 35, scope: !5084)
!5087 = !DILocation(line: 1860, column: 43, scope: !5084)
!5088 = !DILocation(line: 1860, column: 23, scope: !5084)
!5089 = !DILocation(line: 1864, column: 35, scope: !5084)
!5090 = !DILocation(line: 1864, column: 43, scope: !5084)
!5091 = !DILocation(line: 1864, column: 51, scope: !5084)
!5092 = !DILocation(line: 1864, column: 59, scope: !5084)
!5093 = !DILocation(line: 1865, column: 5, scope: !5084)
!5094 = !DILocation(line: 1865, column: 9, scope: !5084)
!5095 = !DILocation(line: 1866, column: 5, scope: !5084)
!5096 = !DILocation(line: 1866, column: 9, scope: !5084)
!5097 = !DILocation(line: 1867, column: 5, scope: !5084)
!5098 = !DILocation(line: 1867, column: 9, scope: !5084)
!5099 = !DILocation(line: 1867, column: 18, scope: !5084)
!5100 = !DILocation(line: 1868, column: 5, scope: !5084)
!5101 = !DILocation(line: 1868, column: 9, scope: !5084)
!5102 = !DILocation(line: 1868, column: 24, scope: !5084)
!5103 = !DILocation(line: 1868, column: 28, scope: !5084)
!5104 = !DILocation(line: 1868, column: 37, scope: !5084)
!5105 = !DILocation(line: 1869, column: 5, scope: !5084)
!5106 = !DILocation(line: 1869, column: 13, scope: !5084)
!5107 = !DILocation(line: 1869, column: 30, scope: !5084)
!5108 = !DILocation(line: 1864, column: 4, scope: !5084)
!5109 = !DILocation(line: 1871, column: 3, scope: !5084)
!5110 = !DILocation(line: 1873, column: 26, scope: !5082)
!5111 = !DILocation(line: 1873, column: 34, scope: !5082)
!5112 = !DILocation(line: 1873, column: 4, scope: !5082)
!5113 = !DILocation(line: 1875, column: 8, scope: !5114)
!5114 = distinct !DILexicalBlock(scope: !4923, file: !25, line: 1875, column: 6)
!5115 = !DILocation(line: 1875, column: 16, scope: !5114)
!5116 = !DILocation(line: 1875, column: 33, scope: !5114)
!5117 = !DILocation(line: 1875, column: 45, scope: !5114)
!5118 = !DILocation(line: 1875, column: 60, scope: !5114)
!5119 = !DILocation(line: 1875, column: 63, scope: !5114)
!5120 = !DILocation(line: 1875, column: 89, scope: !5114)
!5121 = !DILocation(line: 1875, column: 94, scope: !5114)
!5122 = !DILocation(line: 1875, column: 101, scope: !5114)
!5123 = !DILocation(line: 1875, column: 107, scope: !5114)
!5124 = !DILocation(line: 1875, column: 93, scope: !5114)
!5125 = !DILocalVariable(name: "expl_obj", scope: !5126, file: !25, line: 1876, type: !1467)
!5126 = distinct !DILexicalBlock(scope: !5114, file: !25, line: 1875, column: 124)
!5127 = !DILocation(line: 1876, column: 11, scope: !5126)
!5128 = !DILocation(line: 1878, column: 7, scope: !5129)
!5129 = distinct !DILexicalBlock(scope: !5126, file: !25, line: 1878, column: 7)
!5130 = !DILocation(line: 1878, column: 15, scope: !5129)
!5131 = !DILocation(line: 1878, column: 32, scope: !5129)
!5132 = !DILocation(line: 1878, column: 54, scope: !5129)
!5133 = !DILocation(line: 1878, column: 46, scope: !5129)
!5134 = !DILocation(line: 1878, column: 66, scope: !5129)
!5135 = !DILocation(line: 1878, column: 43, scope: !5129)
!5136 = !DILocation(line: 1879, column: 27, scope: !5137)
!5137 = distinct !DILexicalBlock(scope: !5129, file: !25, line: 1878, column: 74)
!5138 = !DILocation(line: 1879, column: 4, scope: !5137)
!5139 = !DILocation(line: 1880, column: 20, scope: !5137)
!5140 = !DILocation(line: 1880, column: 4, scope: !5137)
!5141 = !DILocation(line: 1881, column: 3, scope: !5137)
!5142 = !DILocation(line: 1887, column: 18, scope: !5143)
!5143 = distinct !DILexicalBlock(scope: !5126, file: !25, line: 1887, column: 7)
!5144 = !DILocation(line: 1887, column: 25, scope: !5143)
!5145 = !DILocation(line: 1887, column: 7, scope: !5143)
!5146 = !DILocation(line: 1887, column: 29, scope: !5143)
!5147 = !DILocation(line: 1887, column: 44, scope: !5143)
!5148 = !DILocation(line: 1888, column: 39, scope: !5143)
!5149 = !DILocation(line: 1888, column: 47, scope: !5143)
!5150 = !DILocation(line: 1888, column: 55, scope: !5143)
!5151 = !DILocation(line: 1888, column: 73, scope: !5143)
!5152 = !DILocation(line: 1888, column: 80, scope: !5143)
!5153 = !DILocation(line: 1888, column: 85, scope: !5143)
!5154 = !DILocation(line: 1888, column: 89, scope: !5143)
!5155 = !DILocation(line: 1888, column: 94, scope: !5143)
!5156 = !DILocation(line: 1888, column: 110, scope: !5143)
!5157 = !DILocation(line: 1888, column: 117, scope: !5143)
!5158 = !DILocation(line: 1888, column: 99, scope: !5143)
!5159 = !DILocation(line: 1888, column: 121, scope: !5143)
!5160 = !DILocation(line: 1888, column: 15, scope: !5143)
!5161 = !DILocation(line: 1888, column: 13, scope: !5143)
!5162 = !DILocation(line: 1888, column: 4, scope: !5143)
!5163 = !DILocation(line: 1889, column: 24, scope: !5164)
!5164 = distinct !DILexicalBlock(scope: !5143, file: !25, line: 1889, column: 12)
!5165 = !DILocation(line: 1889, column: 32, scope: !5164)
!5166 = !DILocation(line: 1889, column: 12, scope: !5164)
!5167 = !DILocation(line: 1889, column: 36, scope: !5164)
!5168 = !DILocation(line: 1889, column: 52, scope: !5164)
!5169 = !DILocation(line: 1890, column: 39, scope: !5164)
!5170 = !DILocation(line: 1890, column: 47, scope: !5164)
!5171 = !DILocation(line: 1890, column: 55, scope: !5164)
!5172 = !DILocation(line: 1890, column: 84, scope: !5164)
!5173 = !DILocation(line: 1890, column: 92, scope: !5164)
!5174 = !DILocation(line: 1890, column: 72, scope: !5164)
!5175 = !DILocation(line: 1890, column: 96, scope: !5164)
!5176 = !DILocation(line: 1890, column: 121, scope: !5164)
!5177 = !DILocation(line: 1890, column: 129, scope: !5164)
!5178 = !DILocation(line: 1890, column: 109, scope: !5164)
!5179 = !DILocation(line: 1890, column: 133, scope: !5164)
!5180 = !DILocation(line: 1890, column: 15, scope: !5164)
!5181 = !DILocation(line: 1890, column: 13, scope: !5164)
!5182 = !DILocation(line: 1890, column: 4, scope: !5164)
!5183 = !DILocation(line: 1892, column: 7, scope: !5184)
!5184 = distinct !DILexicalBlock(scope: !5126, file: !25, line: 1892, column: 7)
!5185 = !DILocation(line: 1893, column: 15, scope: !5184)
!5186 = !DILocation(line: 1893, column: 22, scope: !5184)
!5187 = !DILocation(line: 1893, column: 4, scope: !5184)
!5188 = !DILocation(line: 1895, column: 7, scope: !5189)
!5189 = distinct !DILexicalBlock(scope: !5126, file: !25, line: 1895, column: 7)
!5190 = !DILocation(line: 1895, column: 19, scope: !5189)
!5191 = !DILocation(line: 1895, column: 34, scope: !5189)
!5192 = !DILocation(line: 1895, column: 41, scope: !5189)
!5193 = !DILocation(line: 1895, column: 23, scope: !5189)
!5194 = !DILocation(line: 1895, column: 45, scope: !5189)
!5195 = !DILocation(line: 1895, column: 60, scope: !5189)
!5196 = !DILocation(line: 1896, column: 38, scope: !5189)
!5197 = !DILocation(line: 1896, column: 45, scope: !5189)
!5198 = !DILocation(line: 1896, column: 27, scope: !5189)
!5199 = !DILocation(line: 1896, column: 49, scope: !5189)
!5200 = !DILocation(line: 1896, column: 65, scope: !5189)
!5201 = !DILocation(line: 1896, column: 72, scope: !5189)
!5202 = !DILocation(line: 1896, column: 83, scope: !5189)
!5203 = !DILocation(line: 1896, column: 4, scope: !5189)
!5204 = !DILocation(line: 1898, column: 9, scope: !5205)
!5205 = distinct !DILexicalBlock(scope: !5126, file: !25, line: 1898, column: 7)
!5206 = !DILocation(line: 1898, column: 17, scope: !5205)
!5207 = !DILocation(line: 1898, column: 23, scope: !5205)
!5208 = !DILocation(line: 1898, column: 8, scope: !5205)
!5209 = !DILocation(line: 1898, column: 7, scope: !5205)
!5210 = !DILocalVariable(name: "damage", scope: !5211, file: !25, line: 1899, type: !15)
!5211 = distinct !DILexicalBlock(scope: !5205, file: !25, line: 1898, column: 39)
!5212 = !DILocation(line: 1899, column: 8, scope: !5211)
!5213 = !DILocation(line: 1899, column: 17, scope: !5211)
!5214 = !DILocation(line: 1899, column: 25, scope: !5211)
!5215 = !DILocation(line: 1901, column: 8, scope: !5216)
!5216 = distinct !DILexicalBlock(scope: !5211, file: !25, line: 1901, column: 8)
!5217 = !DILocation(line: 1902, column: 21, scope: !5216)
!5218 = !DILocation(line: 1902, column: 29, scope: !5216)
!5219 = !DILocation(line: 1902, column: 37, scope: !5216)
!5220 = !DILocation(line: 1902, column: 54, scope: !5216)
!5221 = !DILocation(line: 1902, column: 14, scope: !5216)
!5222 = !DILocation(line: 1902, column: 12, scope: !5216)
!5223 = !DILocation(line: 1902, column: 5, scope: !5216)
!5224 = !DILocation(line: 1904, column: 12, scope: !5216)
!5225 = !DILocation(line: 1908, column: 8, scope: !5226)
!5226 = distinct !DILexicalBlock(scope: !5211, file: !25, line: 1908, column: 8)
!5227 = !DILocation(line: 1908, column: 16, scope: !5226)
!5228 = !DILocation(line: 1908, column: 19, scope: !5226)
!5229 = !DILocation(line: 1909, column: 20, scope: !5230)
!5230 = distinct !DILexicalBlock(scope: !5226, file: !25, line: 1909, column: 9)
!5231 = !DILocation(line: 1909, column: 27, scope: !5230)
!5232 = !DILocation(line: 1909, column: 9, scope: !5230)
!5233 = !DILocation(line: 1909, column: 31, scope: !5230)
!5234 = !DILocation(line: 1910, column: 15, scope: !5230)
!5235 = !DILocation(line: 1910, column: 35, scope: !5230)
!5236 = !DILocation(line: 1910, column: 33, scope: !5230)
!5237 = !DILocation(line: 1910, column: 22, scope: !5230)
!5238 = !DILocation(line: 1910, column: 53, scope: !5230)
!5239 = !DILocation(line: 1910, column: 13, scope: !5230)
!5240 = !DILocation(line: 1910, column: 6, scope: !5230)
!5241 = !DILocation(line: 1912, column: 31, scope: !5242)
!5242 = distinct !DILexicalBlock(scope: !5211, file: !25, line: 1912, column: 8)
!5243 = !DILocation(line: 1912, column: 38, scope: !5242)
!5244 = !DILocation(line: 1912, column: 46, scope: !5242)
!5245 = !DILocation(line: 1912, column: 54, scope: !5242)
!5246 = !DILocation(line: 1912, column: 71, scope: !5242)
!5247 = !DILocation(line: 1912, column: 9, scope: !5242)
!5248 = !DILocation(line: 1912, column: 8, scope: !5242)
!5249 = !DILocation(line: 1913, column: 22, scope: !5242)
!5250 = !DILocation(line: 1913, column: 29, scope: !5242)
!5251 = !DILocation(line: 1913, column: 5, scope: !5242)
!5252 = !DILocation(line: 1914, column: 13, scope: !5253)
!5253 = distinct !DILexicalBlock(scope: !5242, file: !25, line: 1914, column: 13)
!5254 = !DILocation(line: 1914, column: 21, scope: !5253)
!5255 = !DILocation(line: 1914, column: 38, scope: !5253)
!5256 = !DILocation(line: 1914, column: 58, scope: !5253)
!5257 = !DILocation(line: 1914, column: 73, scope: !5253)
!5258 = !DILocation(line: 1914, column: 55, scope: !5253)
!5259 = !DILocation(line: 1915, column: 36, scope: !5260)
!5260 = distinct !DILexicalBlock(scope: !5253, file: !25, line: 1914, column: 84)
!5261 = !DILocation(line: 1915, column: 43, scope: !5260)
!5262 = !DILocation(line: 1915, column: 25, scope: !5260)
!5263 = !DILocation(line: 1915, column: 47, scope: !5260)
!5264 = !DILocation(line: 1915, column: 5, scope: !5260)
!5265 = !DILocation(line: 1916, column: 37, scope: !5260)
!5266 = !DILocation(line: 1916, column: 43, scope: !5260)
!5267 = !DILocation(line: 1916, column: 5, scope: !5260)
!5268 = !DILocation(line: 1917, column: 4, scope: !5260)
!5269 = !DILocation(line: 1918, column: 3, scope: !5211)
!5270 = !DILocation(line: 1922, column: 8, scope: !5271)
!5271 = distinct !DILexicalBlock(scope: !5126, file: !25, line: 1922, column: 7)
!5272 = !DILocation(line: 1922, column: 14, scope: !5271)
!5273 = !DILocation(line: 1922, column: 23, scope: !5271)
!5274 = !DILocation(line: 1922, column: 39, scope: !5271)
!5275 = !DILocation(line: 1922, column: 46, scope: !5271)
!5276 = !DILocation(line: 1922, column: 28, scope: !5271)
!5277 = !DILocation(line: 1922, column: 50, scope: !5271)
!5278 = !DILocation(line: 1922, column: 61, scope: !5271)
!5279 = !DILocation(line: 1922, column: 77, scope: !5271)
!5280 = !DILocation(line: 1922, column: 84, scope: !5271)
!5281 = !DILocation(line: 1922, column: 66, scope: !5271)
!5282 = !DILocation(line: 1922, column: 88, scope: !5271)
!5283 = !DILocation(line: 1922, column: 99, scope: !5271)
!5284 = !DILocation(line: 1922, column: 103, scope: !5271)
!5285 = !DILocation(line: 1922, column: 111, scope: !5271)
!5286 = !DILocation(line: 1922, column: 114, scope: !5271)
!5287 = !DILocalVariable(name: "aip", scope: !5288, file: !25, line: 1923, type: !5289)
!5288 = distinct !DILexicalBlock(scope: !5271, file: !25, line: 1922, column: 128)
!5289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1549, size: 64)
!5290 = !DILocation(line: 1923, column: 15, scope: !5288)
!5291 = !DILocation(line: 1923, column: 22, scope: !5288)
!5292 = !DILocation(line: 1923, column: 29, scope: !5288)
!5293 = !DILocation(line: 1925, column: 8, scope: !5294)
!5294 = distinct !DILexicalBlock(scope: !5288, file: !25, line: 1925, column: 8)
!5295 = !DILocation(line: 1925, column: 13, scope: !5294)
!5296 = !DILocation(line: 1925, column: 29, scope: !5294)
!5297 = !DILocation(line: 1925, column: 27, scope: !5294)
!5298 = !DILocation(line: 1925, column: 39, scope: !5294)
!5299 = !DILocation(line: 1926, column: 5, scope: !5300)
!5300 = distinct !DILexicalBlock(scope: !5294, file: !25, line: 1925, column: 47)
!5301 = !DILocation(line: 1926, column: 10, scope: !5300)
!5302 = !DILocation(line: 1926, column: 23, scope: !5300)
!5303 = !DILocation(line: 1927, column: 50, scope: !5300)
!5304 = !DILocation(line: 1927, column: 59, scope: !5300)
!5305 = !DILocation(line: 1927, column: 69, scope: !5300)
!5306 = !DILocation(line: 1927, column: 81, scope: !5300)
!5307 = !DILocation(line: 1927, column: 86, scope: !5300)
!5308 = !DILocation(line: 1927, column: 79, scope: !5300)
!5309 = !DILocation(line: 1927, column: 42, scope: !5300)
!5310 = !DILocation(line: 1927, column: 5, scope: !5300)
!5311 = !DILocation(line: 1927, column: 12, scope: !5300)
!5312 = !DILocation(line: 1927, column: 28, scope: !5300)
!5313 = !DILocation(line: 1927, column: 38, scope: !5300)
!5314 = !DILocation(line: 1927, column: 40, scope: !5300)
!5315 = !DILocation(line: 1928, column: 50, scope: !5300)
!5316 = !DILocation(line: 1928, column: 59, scope: !5300)
!5317 = !DILocation(line: 1928, column: 69, scope: !5300)
!5318 = !DILocation(line: 1928, column: 81, scope: !5300)
!5319 = !DILocation(line: 1928, column: 86, scope: !5300)
!5320 = !DILocation(line: 1928, column: 79, scope: !5300)
!5321 = !DILocation(line: 1928, column: 42, scope: !5300)
!5322 = !DILocation(line: 1928, column: 5, scope: !5300)
!5323 = !DILocation(line: 1928, column: 12, scope: !5300)
!5324 = !DILocation(line: 1928, column: 28, scope: !5300)
!5325 = !DILocation(line: 1928, column: 38, scope: !5300)
!5326 = !DILocation(line: 1928, column: 40, scope: !5300)
!5327 = !DILocation(line: 1929, column: 50, scope: !5300)
!5328 = !DILocation(line: 1929, column: 59, scope: !5300)
!5329 = !DILocation(line: 1929, column: 69, scope: !5300)
!5330 = !DILocation(line: 1929, column: 81, scope: !5300)
!5331 = !DILocation(line: 1929, column: 86, scope: !5300)
!5332 = !DILocation(line: 1929, column: 79, scope: !5300)
!5333 = !DILocation(line: 1929, column: 42, scope: !5300)
!5334 = !DILocation(line: 1929, column: 5, scope: !5300)
!5335 = !DILocation(line: 1929, column: 12, scope: !5300)
!5336 = !DILocation(line: 1929, column: 28, scope: !5300)
!5337 = !DILocation(line: 1929, column: 38, scope: !5300)
!5338 = !DILocation(line: 1929, column: 40, scope: !5300)
!5339 = !DILocation(line: 1930, column: 5, scope: !5300)
!5340 = !DILocation(line: 1930, column: 12, scope: !5300)
!5341 = !DILocation(line: 1930, column: 28, scope: !5300)
!5342 = !DILocation(line: 1930, column: 34, scope: !5300)
!5343 = !DILocation(line: 1932, column: 4, scope: !5300)
!5344 = !DILocation(line: 1933, column: 3, scope: !5288)
!5345 = !DILocation(line: 1935, column: 2, scope: !5126)
!5346 = !DILocation(line: 1937, column: 20, scope: !4923)
!5347 = !DILocation(line: 1937, column: 28, scope: !4923)
!5348 = !DILocation(line: 1937, column: 2, scope: !4923)
!5349 = !DILocation(line: 1939, column: 2, scope: !4923)
!5350 = !DILocation(line: 1940, column: 1, scope: !4923)
!5351 = distinct !DISubprogram(name: "min<int>", linkageName: "_ZNSt3__13minB8ne200100IiEERKT_S3_S3_", scope: !164, file: !5352, line: 35, type: !5353, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !5356, retainedNodes: !1605)
!5352 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/min.h", directory: "")
!5353 = !DISubroutineType(types: !5354)
!5354 = !{!5355, !5355, !5355}
!5355 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !161, size: 64)
!5356 = !{!5357}
!5357 = !DITemplateTypeParameter(name: "_Tp", type: !7)
!5358 = !DILocalVariable(name: "__a", arg: 1, scope: !5351, file: !5352, line: 35, type: !5355)
!5359 = !DILocation(line: 35, column: 38, scope: !5351)
!5360 = !DILocalVariable(name: "__b", arg: 2, scope: !5351, file: !5352, line: 35, type: !5355)
!5361 = !DILocation(line: 35, column: 76, scope: !5351)
!5362 = !DILocation(line: 36, column: 19, scope: !5351)
!5363 = !DILocation(line: 36, column: 24, scope: !5351)
!5364 = !DILocation(line: 36, column: 10, scope: !5351)
!5365 = !DILocation(line: 36, column: 3, scope: !5351)
!5366 = distinct !DISubprogram(name: "collide_hostage_and_player", linkageName: "_Z26collide_hostage_and_playerP6objectS0_P10vms_vector", scope: !25, file: !25, line: 1958, type: !4069, scopeLine: 1959, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5367 = !DILocalVariable(name: "hostage", arg: 1, scope: !5366, file: !25, line: 1958, type: !1467)
!5368 = !DILocation(line: 1958, column: 41, scope: !5366)
!5369 = !DILocalVariable(name: "player", arg: 2, scope: !5366, file: !25, line: 1958, type: !1467)
!5370 = !DILocation(line: 1958, column: 58, scope: !5366)
!5371 = !DILocalVariable(name: "collision_point", arg: 3, scope: !5366, file: !25, line: 1958, type: !1604)
!5372 = !DILocation(line: 1958, column: 78, scope: !5366)
!5373 = !DILocation(line: 1961, column: 6, scope: !5374)
!5374 = distinct !DILexicalBlock(scope: !5366, file: !25, line: 1961, column: 6)
!5375 = !DILocation(line: 1961, column: 16, scope: !5374)
!5376 = !DILocation(line: 1961, column: 13, scope: !5374)
!5377 = !DILocation(line: 1962, column: 35, scope: !5378)
!5378 = distinct !DILexicalBlock(scope: !5374, file: !25, line: 1961, column: 31)
!5379 = !DILocation(line: 1962, column: 43, scope: !5378)
!5380 = !DILocation(line: 1962, column: 3, scope: !5378)
!5381 = !DILocation(line: 1963, column: 3, scope: !5378)
!5382 = !DILocation(line: 1966, column: 18, scope: !5378)
!5383 = !DILocation(line: 1966, column: 27, scope: !5378)
!5384 = !DILocation(line: 1966, column: 3, scope: !5378)
!5385 = !DILocation(line: 1969, column: 3, scope: !5378)
!5386 = !DILocation(line: 1969, column: 12, scope: !5378)
!5387 = !DILocation(line: 1969, column: 18, scope: !5378)
!5388 = !DILocation(line: 1975, column: 2, scope: !5378)
!5389 = !DILocation(line: 1976, column: 2, scope: !5366)
!5390 = distinct !DISubprogram(name: "collide_player_and_player", linkageName: "_Z25collide_player_and_playerP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2015, type: !4069, scopeLine: 2015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5391 = !DILocalVariable(name: "player1", arg: 1, scope: !5390, file: !25, line: 2015, type: !1467)
!5392 = !DILocation(line: 2015, column: 40, scope: !5390)
!5393 = !DILocalVariable(name: "player2", arg: 2, scope: !5390, file: !25, line: 2015, type: !1467)
!5394 = !DILocation(line: 2015, column: 57, scope: !5390)
!5395 = !DILocalVariable(name: "collision_point", arg: 3, scope: !5390, file: !25, line: 2015, type: !1604)
!5396 = !DILocation(line: 2015, column: 78, scope: !5390)
!5397 = !DILocation(line: 2016, column: 49, scope: !5390)
!5398 = !DILocation(line: 2016, column: 58, scope: !5390)
!5399 = !DILocation(line: 2016, column: 69, scope: !5390)
!5400 = !DILocation(line: 2016, column: 2, scope: !5390)
!5401 = !DILocation(line: 2017, column: 19, scope: !5390)
!5402 = !DILocation(line: 2017, column: 28, scope: !5390)
!5403 = !DILocation(line: 2017, column: 2, scope: !5390)
!5404 = !DILocation(line: 2018, column: 2, scope: !5390)
!5405 = distinct !DISubprogram(name: "maybe_drop_primary_weapon_egg", linkageName: "_Z29maybe_drop_primary_weapon_eggP6objecti", scope: !25, file: !25, line: 2021, type: !5406, scopeLine: 2022, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5406 = !DISubroutineType(types: !5407)
!5407 = !{!7, !1467, !7}
!5408 = !DILocalVariable(name: "playerobj", arg: 1, scope: !5405, file: !25, line: 2021, type: !1467)
!5409 = !DILocation(line: 2021, column: 43, scope: !5405)
!5410 = !DILocalVariable(name: "weapon_index", arg: 2, scope: !5405, file: !25, line: 2021, type: !7)
!5411 = !DILocation(line: 2021, column: 58, scope: !5405)
!5412 = !DILocalVariable(name: "weapon_flag", scope: !5405, file: !25, line: 2023, type: !7)
!5413 = !DILocation(line: 2023, column: 6, scope: !5405)
!5414 = !DILocation(line: 2023, column: 20, scope: !5405)
!5415 = !DILocalVariable(name: "powerup_num", scope: !5405, file: !25, line: 2024, type: !7)
!5416 = !DILocation(line: 2024, column: 6, scope: !5405)
!5417 = !DILocation(line: 2026, column: 42, scope: !5405)
!5418 = !DILocation(line: 2026, column: 16, scope: !5405)
!5419 = !DILocation(line: 2026, column: 14, scope: !5405)
!5420 = !DILocation(line: 2028, column: 14, scope: !5421)
!5421 = distinct !DILexicalBlock(scope: !5405, file: !25, line: 2028, column: 6)
!5422 = !DILocation(line: 2028, column: 25, scope: !5421)
!5423 = !DILocation(line: 2028, column: 6, scope: !5421)
!5424 = !DILocation(line: 2028, column: 29, scope: !5421)
!5425 = !DILocation(line: 2028, column: 52, scope: !5421)
!5426 = !DILocation(line: 2028, column: 50, scope: !5421)
!5427 = !DILocation(line: 2029, column: 33, scope: !5421)
!5428 = !DILocation(line: 2029, column: 60, scope: !5421)
!5429 = !DILocation(line: 2029, column: 10, scope: !5421)
!5430 = !DILocation(line: 2029, column: 3, scope: !5421)
!5431 = !DILocation(line: 2031, column: 3, scope: !5421)
!5432 = !DILocation(line: 2032, column: 1, scope: !5405)
!5433 = distinct !DISubprogram(name: "maybe_drop_secondary_weapon_egg", linkageName: "_Z31maybe_drop_secondary_weapon_eggP6objectii", scope: !25, file: !25, line: 2034, type: !5434, scopeLine: 2035, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5434 = !DISubroutineType(types: !5435)
!5435 = !{null, !1467, !7, !7}
!5436 = !DILocalVariable(name: "playerobj", arg: 1, scope: !5433, file: !25, line: 2034, type: !1467)
!5437 = !DILocation(line: 2034, column: 46, scope: !5433)
!5438 = !DILocalVariable(name: "weapon_index", arg: 2, scope: !5433, file: !25, line: 2034, type: !7)
!5439 = !DILocation(line: 2034, column: 61, scope: !5433)
!5440 = !DILocalVariable(name: "count", arg: 3, scope: !5433, file: !25, line: 2034, type: !7)
!5441 = !DILocation(line: 2034, column: 79, scope: !5433)
!5442 = !DILocalVariable(name: "weapon_flag", scope: !5433, file: !25, line: 2036, type: !7)
!5443 = !DILocation(line: 2036, column: 6, scope: !5433)
!5444 = !DILocation(line: 2036, column: 20, scope: !5433)
!5445 = !DILocalVariable(name: "powerup_num", scope: !5433, file: !25, line: 2037, type: !7)
!5446 = !DILocation(line: 2037, column: 6, scope: !5433)
!5447 = !DILocation(line: 2039, column: 44, scope: !5433)
!5448 = !DILocation(line: 2039, column: 16, scope: !5433)
!5449 = !DILocation(line: 2039, column: 14, scope: !5433)
!5450 = !DILocation(line: 2041, column: 14, scope: !5451)
!5451 = distinct !DILexicalBlock(scope: !5433, file: !25, line: 2041, column: 6)
!5452 = !DILocation(line: 2041, column: 25, scope: !5451)
!5453 = !DILocation(line: 2041, column: 6, scope: !5451)
!5454 = !DILocation(line: 2041, column: 29, scope: !5451)
!5455 = !DILocation(line: 2041, column: 54, scope: !5451)
!5456 = !DILocation(line: 2041, column: 52, scope: !5451)
!5457 = !DILocalVariable(name: "i", scope: !5458, file: !25, line: 2042, type: !7)
!5458 = distinct !DILexicalBlock(scope: !5451, file: !25, line: 2041, column: 67)
!5459 = !DILocation(line: 2042, column: 7, scope: !5458)
!5460 = !DILocalVariable(name: "max_count", scope: !5458, file: !25, line: 2042, type: !7)
!5461 = !DILocation(line: 2042, column: 10, scope: !5458)
!5462 = !DILocation(line: 2044, column: 31, scope: !5458)
!5463 = !DILocation(line: 2044, column: 15, scope: !5458)
!5464 = !DILocation(line: 2044, column: 13, scope: !5458)
!5465 = !DILocation(line: 2045, column: 10, scope: !5466)
!5466 = distinct !DILexicalBlock(scope: !5458, file: !25, line: 2045, column: 3)
!5467 = !DILocation(line: 2045, column: 8, scope: !5466)
!5468 = !DILocation(line: 2045, column: 15, scope: !5469)
!5469 = distinct !DILexicalBlock(scope: !5466, file: !25, line: 2045, column: 3)
!5470 = !DILocation(line: 2045, column: 19, scope: !5469)
!5471 = !DILocation(line: 2045, column: 17, scope: !5469)
!5472 = !DILocation(line: 2045, column: 3, scope: !5466)
!5473 = !DILocation(line: 2046, column: 27, scope: !5469)
!5474 = !DILocation(line: 2046, column: 54, scope: !5469)
!5475 = !DILocation(line: 2046, column: 4, scope: !5469)
!5476 = !DILocation(line: 2045, column: 31, scope: !5469)
!5477 = !DILocation(line: 2045, column: 3, scope: !5469)
!5478 = distinct !{!5478, !5472, !5479, !2097}
!5479 = !DILocation(line: 2046, column: 65, scope: !5466)
!5480 = !DILocation(line: 2047, column: 2, scope: !5458)
!5481 = !DILocation(line: 2048, column: 1, scope: !5433)
!5482 = distinct !DISubprogram(name: "drop_missile_1_or_4", linkageName: "_Z19drop_missile_1_or_4P6objecti", scope: !25, file: !25, line: 2050, type: !5483, scopeLine: 2051, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5483 = !DISubroutineType(types: !5484)
!5484 = !{null, !1467, !7}
!5485 = !DILocalVariable(name: "playerobj", arg: 1, scope: !5482, file: !25, line: 2050, type: !1467)
!5486 = !DILocation(line: 2050, column: 34, scope: !5482)
!5487 = !DILocalVariable(name: "missile_index", arg: 2, scope: !5482, file: !25, line: 2050, type: !7)
!5488 = !DILocation(line: 2050, column: 49, scope: !5482)
!5489 = !DILocalVariable(name: "num_missiles", scope: !5482, file: !25, line: 2052, type: !7)
!5490 = !DILocation(line: 2052, column: 6, scope: !5482)
!5491 = !DILocalVariable(name: "powerup_id", scope: !5482, file: !25, line: 2052, type: !7)
!5492 = !DILocation(line: 2052, column: 20, scope: !5482)
!5493 = !DILocation(line: 2054, column: 25, scope: !5482)
!5494 = !DILocation(line: 2054, column: 36, scope: !5482)
!5495 = !DILocation(line: 2054, column: 17, scope: !5482)
!5496 = !DILocation(line: 2054, column: 40, scope: !5482)
!5497 = !DILocation(line: 2054, column: 55, scope: !5482)
!5498 = !DILocation(line: 2054, column: 15, scope: !5482)
!5499 = !DILocation(line: 2055, column: 43, scope: !5482)
!5500 = !DILocation(line: 2055, column: 15, scope: !5482)
!5501 = !DILocation(line: 2055, column: 13, scope: !5482)
!5502 = !DILocation(line: 2057, column: 6, scope: !5503)
!5503 = distinct !DILexicalBlock(scope: !5482, file: !25, line: 2057, column: 6)
!5504 = !DILocation(line: 2057, column: 19, scope: !5503)
!5505 = !DILocation(line: 2058, column: 16, scope: !5503)
!5506 = !DILocation(line: 2058, column: 3, scope: !5503)
!5507 = !DILocation(line: 2060, column: 25, scope: !5482)
!5508 = !DILocation(line: 2060, column: 36, scope: !5482)
!5509 = !DILocation(line: 2060, column: 49, scope: !5482)
!5510 = !DILocation(line: 2060, column: 67, scope: !5482)
!5511 = !DILocation(line: 2060, column: 78, scope: !5482)
!5512 = !DILocation(line: 2060, column: 2, scope: !5482)
!5513 = !DILocation(line: 2061, column: 25, scope: !5482)
!5514 = !DILocation(line: 2061, column: 36, scope: !5482)
!5515 = !DILocation(line: 2061, column: 49, scope: !5482)
!5516 = !DILocation(line: 2061, column: 67, scope: !5482)
!5517 = !DILocation(line: 2061, column: 2, scope: !5482)
!5518 = !DILocation(line: 2062, column: 1, scope: !5482)
!5519 = distinct !DISubprogram(name: "drop_player_eggs", linkageName: "_Z16drop_player_eggsP6object", scope: !25, file: !25, line: 2066, type: !4242, scopeLine: 2067, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5520 = !DILocalVariable(name: "playerobj", arg: 1, scope: !5519, file: !25, line: 2066, type: !1467)
!5521 = !DILocation(line: 2066, column: 31, scope: !5519)
!5522 = !DILocation(line: 2070, column: 7, scope: !5523)
!5523 = distinct !DILexicalBlock(scope: !5519, file: !25, line: 2070, column: 6)
!5524 = !DILocation(line: 2070, column: 18, scope: !5523)
!5525 = !DILocation(line: 2070, column: 23, scope: !5523)
!5526 = !DILocation(line: 2070, column: 38, scope: !5523)
!5527 = !DILocation(line: 2070, column: 42, scope: !5523)
!5528 = !DILocation(line: 2070, column: 53, scope: !5523)
!5529 = !DILocation(line: 2070, column: 58, scope: !5523)
!5530 = !DILocalVariable(name: "rthresh", scope: !5531, file: !25, line: 2071, type: !7)
!5531 = distinct !DILexicalBlock(scope: !5523, file: !25, line: 2070, column: 73)
!5532 = !DILocation(line: 2071, column: 7, scope: !5531)
!5533 = !DILocalVariable(name: "num_missiles", scope: !5531, file: !25, line: 2072, type: !7)
!5534 = !DILocation(line: 2072, column: 7, scope: !5531)
!5535 = !DILocalVariable(name: "pnum", scope: !5531, file: !25, line: 2073, type: !7)
!5536 = !DILocation(line: 2073, column: 7, scope: !5531)
!5537 = !DILocation(line: 2073, column: 14, scope: !5531)
!5538 = !DILocation(line: 2073, column: 25, scope: !5531)
!5539 = !DILocalVariable(name: "objnum", scope: !5531, file: !25, line: 2074, type: !7)
!5540 = !DILocation(line: 2074, column: 7, scope: !5531)
!5541 = !DILocalVariable(name: "vulcan_ammo", scope: !5531, file: !25, line: 2075, type: !7)
!5542 = !DILocation(line: 2075, column: 7, scope: !5531)
!5543 = !DILocalVariable(name: "randvec", scope: !5531, file: !25, line: 2076, type: !1484)
!5544 = !DILocation(line: 2076, column: 14, scope: !5531)
!5545 = !DILocation(line: 2091, column: 11, scope: !5531)
!5546 = !DILocation(line: 2092, column: 3, scope: !5531)
!5547 = !DILocation(line: 2092, column: 19, scope: !5531)
!5548 = !DILocation(line: 2092, column: 30, scope: !5531)
!5549 = !DILocation(line: 2092, column: 11, scope: !5531)
!5550 = !DILocation(line: 2092, column: 34, scope: !5531)
!5551 = !DILocation(line: 2092, column: 67, scope: !5531)
!5552 = !DILocation(line: 2092, column: 71, scope: !5531)
!5553 = !DILocation(line: 2092, column: 77, scope: !5531)
!5554 = !DILocation(line: 2092, column: 81, scope: !5531)
!5555 = !DILocation(line: 2092, column: 92, scope: !5531)
!5556 = !DILocation(line: 2092, column: 90, scope: !5531)
!5557 = !DILocation(line: 0, scope: !5531)
!5558 = !DILocalVariable(name: "newseg", scope: !5559, file: !25, line: 2093, type: !7)
!5559 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2092, column: 102)
!5560 = !DILocation(line: 2093, column: 10, scope: !5559)
!5561 = !DILocalVariable(name: "tvec", scope: !5559, file: !25, line: 2094, type: !1484)
!5562 = !DILocation(line: 2094, column: 15, scope: !5559)
!5563 = !DILocation(line: 2096, column: 4, scope: !5559)
!5564 = !DILocation(line: 2097, column: 12, scope: !5559)
!5565 = !DILocation(line: 2098, column: 23, scope: !5559)
!5566 = !DILocation(line: 2098, column: 34, scope: !5559)
!5567 = !DILocation(line: 2098, column: 4, scope: !5559)
!5568 = !DILocation(line: 2099, column: 35, scope: !5559)
!5569 = !DILocation(line: 2099, column: 46, scope: !5559)
!5570 = !DILocation(line: 2099, column: 13, scope: !5559)
!5571 = !DILocation(line: 2099, column: 11, scope: !5559)
!5572 = !DILocation(line: 2100, column: 8, scope: !5573)
!5573 = distinct !DILexicalBlock(scope: !5559, file: !25, line: 2100, column: 8)
!5574 = !DILocation(line: 2100, column: 15, scope: !5573)
!5575 = !DILocation(line: 2101, column: 39, scope: !5573)
!5576 = !DILocation(line: 2101, column: 47, scope: !5573)
!5577 = !DILocation(line: 2101, column: 57, scope: !5573)
!5578 = !DILocation(line: 2101, column: 5, scope: !5573)
!5579 = distinct !{!5579, !5546, !5580, !2097}
!5580 = !DILocation(line: 2102, column: 3, scope: !5531)
!5581 = !DILocation(line: 2106, column: 8, scope: !5582)
!5582 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2106, column: 7)
!5583 = !DILocation(line: 2106, column: 18, scope: !5582)
!5584 = !DILocation(line: 2106, column: 7, scope: !5582)
!5585 = !DILocation(line: 2106, column: 30, scope: !5582)
!5586 = !DILocation(line: 2106, column: 35, scope: !5582)
!5587 = !DILocation(line: 2106, column: 45, scope: !5582)
!5588 = !DILocation(line: 2106, column: 34, scope: !5582)
!5589 = !DILocation(line: 2108, column: 12, scope: !5590)
!5590 = distinct !DILexicalBlock(scope: !5582, file: !25, line: 2107, column: 3)
!5591 = !DILocation(line: 2109, column: 4, scope: !5590)
!5592 = !DILocation(line: 2109, column: 20, scope: !5590)
!5593 = !DILocation(line: 2109, column: 31, scope: !5590)
!5594 = !DILocation(line: 2109, column: 12, scope: !5590)
!5595 = !DILocation(line: 2109, column: 35, scope: !5590)
!5596 = !DILocation(line: 2109, column: 67, scope: !5590)
!5597 = !DILocation(line: 2109, column: 71, scope: !5590)
!5598 = !DILocation(line: 2109, column: 77, scope: !5590)
!5599 = !DILocation(line: 2109, column: 81, scope: !5590)
!5600 = !DILocation(line: 2109, column: 92, scope: !5590)
!5601 = !DILocation(line: 2109, column: 90, scope: !5590)
!5602 = !DILocation(line: 0, scope: !5590)
!5603 = !DILocalVariable(name: "newseg", scope: !5604, file: !25, line: 2110, type: !7)
!5604 = distinct !DILexicalBlock(scope: !5590, file: !25, line: 2109, column: 102)
!5605 = !DILocation(line: 2110, column: 11, scope: !5604)
!5606 = !DILocalVariable(name: "tvec", scope: !5604, file: !25, line: 2111, type: !1484)
!5607 = !DILocation(line: 2111, column: 16, scope: !5604)
!5608 = !DILocation(line: 2113, column: 5, scope: !5604)
!5609 = !DILocation(line: 2114, column: 13, scope: !5604)
!5610 = !DILocation(line: 2115, column: 24, scope: !5604)
!5611 = !DILocation(line: 2115, column: 35, scope: !5604)
!5612 = !DILocation(line: 2115, column: 5, scope: !5604)
!5613 = !DILocation(line: 2116, column: 36, scope: !5604)
!5614 = !DILocation(line: 2116, column: 47, scope: !5604)
!5615 = !DILocation(line: 2116, column: 14, scope: !5604)
!5616 = !DILocation(line: 2116, column: 12, scope: !5604)
!5617 = !DILocation(line: 2117, column: 9, scope: !5618)
!5618 = distinct !DILexicalBlock(scope: !5604, file: !25, line: 2117, column: 9)
!5619 = !DILocation(line: 2117, column: 16, scope: !5618)
!5620 = !DILocation(line: 2118, column: 40, scope: !5618)
!5621 = !DILocation(line: 2118, column: 48, scope: !5618)
!5622 = !DILocation(line: 2118, column: 58, scope: !5618)
!5623 = !DILocation(line: 2118, column: 6, scope: !5618)
!5624 = distinct !{!5624, !5591, !5625, !2097}
!5625 = !DILocation(line: 2120, column: 4, scope: !5590)
!5626 = !DILocation(line: 2121, column: 3, scope: !5590)
!5627 = !DILocation(line: 2125, column: 15, scope: !5628)
!5628 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2125, column: 7)
!5629 = !DILocation(line: 2125, column: 7, scope: !5628)
!5630 = !DILocation(line: 2125, column: 21, scope: !5628)
!5631 = !DILocation(line: 2125, column: 33, scope: !5628)
!5632 = !DILocation(line: 2126, column: 27, scope: !5628)
!5633 = !DILocation(line: 2126, column: 46, scope: !5628)
!5634 = !DILocation(line: 2126, column: 38, scope: !5628)
!5635 = !DILocation(line: 2126, column: 52, scope: !5628)
!5636 = !DILocation(line: 2126, column: 64, scope: !5628)
!5637 = !DILocation(line: 2126, column: 4, scope: !5628)
!5638 = !DILocation(line: 2127, column: 20, scope: !5639)
!5639 = distinct !DILexicalBlock(scope: !5628, file: !25, line: 2127, column: 12)
!5640 = !DILocation(line: 2127, column: 12, scope: !5639)
!5641 = !DILocation(line: 2127, column: 26, scope: !5639)
!5642 = !DILocation(line: 2127, column: 38, scope: !5639)
!5643 = !DILocation(line: 2128, column: 27, scope: !5639)
!5644 = !DILocation(line: 2128, column: 46, scope: !5639)
!5645 = !DILocation(line: 2128, column: 38, scope: !5639)
!5646 = !DILocation(line: 2128, column: 52, scope: !5639)
!5647 = !DILocation(line: 2128, column: 4, scope: !5639)
!5648 = !DILocation(line: 2131, column: 15, scope: !5649)
!5649 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2131, column: 7)
!5650 = !DILocation(line: 2131, column: 7, scope: !5649)
!5651 = !DILocation(line: 2131, column: 21, scope: !5649)
!5652 = !DILocation(line: 2131, column: 27, scope: !5649)
!5653 = !DILocation(line: 2132, column: 27, scope: !5649)
!5654 = !DILocation(line: 2132, column: 4, scope: !5649)
!5655 = !DILocation(line: 2134, column: 15, scope: !5656)
!5656 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2134, column: 7)
!5657 = !DILocation(line: 2134, column: 7, scope: !5656)
!5658 = !DILocation(line: 2134, column: 21, scope: !5656)
!5659 = !DILocation(line: 2134, column: 27, scope: !5656)
!5660 = !DILocation(line: 2135, column: 27, scope: !5656)
!5661 = !DILocation(line: 2135, column: 4, scope: !5656)
!5662 = !DILocation(line: 2137, column: 15, scope: !5663)
!5663 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2137, column: 7)
!5664 = !DILocation(line: 2137, column: 7, scope: !5663)
!5665 = !DILocation(line: 2137, column: 21, scope: !5663)
!5666 = !DILocation(line: 2137, column: 27, scope: !5663)
!5667 = !DILocation(line: 2138, column: 27, scope: !5663)
!5668 = !DILocation(line: 2138, column: 4, scope: !5663)
!5669 = !DILocation(line: 2140, column: 15, scope: !5670)
!5670 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2140, column: 7)
!5671 = !DILocation(line: 2140, column: 7, scope: !5670)
!5672 = !DILocation(line: 2140, column: 21, scope: !5670)
!5673 = !DILocation(line: 2140, column: 27, scope: !5670)
!5674 = !DILocation(line: 2141, column: 27, scope: !5670)
!5675 = !DILocation(line: 2141, column: 4, scope: !5670)
!5676 = !DILocation(line: 2143, column: 15, scope: !5677)
!5677 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2143, column: 7)
!5678 = !DILocation(line: 2143, column: 7, scope: !5677)
!5679 = !DILocation(line: 2143, column: 21, scope: !5677)
!5680 = !DILocation(line: 2143, column: 27, scope: !5677)
!5681 = !DILocation(line: 2144, column: 27, scope: !5677)
!5682 = !DILocation(line: 2144, column: 4, scope: !5677)
!5683 = !DILocation(line: 2146, column: 15, scope: !5684)
!5684 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2146, column: 7)
!5685 = !DILocation(line: 2146, column: 7, scope: !5684)
!5686 = !DILocation(line: 2146, column: 21, scope: !5684)
!5687 = !DILocation(line: 2146, column: 27, scope: !5684)
!5688 = !DILocation(line: 2147, column: 27, scope: !5684)
!5689 = !DILocation(line: 2147, column: 4, scope: !5684)
!5690 = !DILocation(line: 2149, column: 15, scope: !5691)
!5691 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2149, column: 7)
!5692 = !DILocation(line: 2149, column: 7, scope: !5691)
!5693 = !DILocation(line: 2149, column: 21, scope: !5691)
!5694 = !DILocation(line: 2149, column: 27, scope: !5691)
!5695 = !DILocation(line: 2150, column: 27, scope: !5691)
!5696 = !DILocation(line: 2150, column: 4, scope: !5691)
!5697 = !DILocation(line: 2154, column: 8, scope: !5698)
!5698 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2154, column: 7)
!5699 = !DILocation(line: 2154, column: 18, scope: !5698)
!5700 = !DILocation(line: 2154, column: 7, scope: !5698)
!5701 = !DILocation(line: 2154, column: 32, scope: !5698)
!5702 = !DILocation(line: 2154, column: 44, scope: !5698)
!5703 = !DILocation(line: 2154, column: 36, scope: !5698)
!5704 = !DILocation(line: 2154, column: 50, scope: !5698)
!5705 = !DILocation(line: 2154, column: 56, scope: !5698)
!5706 = !DILocation(line: 2154, column: 35, scope: !5698)
!5707 = !DILocation(line: 2162, column: 7, scope: !5708)
!5708 = distinct !DILexicalBlock(scope: !5698, file: !25, line: 2162, column: 7)
!5709 = !DILocation(line: 2162, column: 17, scope: !5708)
!5710 = !DILocalVariable(name: "max_count", scope: !5711, file: !25, line: 2166, type: !7)
!5711 = distinct !DILexicalBlock(scope: !5708, file: !25, line: 2163, column: 3)
!5712 = !DILocation(line: 2166, column: 8, scope: !5711)
!5713 = !DILocalVariable(name: "i", scope: !5711, file: !25, line: 2166, type: !7)
!5714 = !DILocation(line: 2166, column: 19, scope: !5711)
!5715 = !DILocation(line: 2168, column: 4, scope: !5711)
!5716 = !DILocation(line: 2170, column: 33, scope: !5711)
!5717 = !DILocation(line: 2170, column: 25, scope: !5711)
!5718 = !DILocation(line: 2170, column: 39, scope: !5711)
!5719 = !DILocation(line: 2170, column: 72, scope: !5711)
!5720 = !DILocation(line: 2170, column: 16, scope: !5711)
!5721 = !DILocation(line: 2170, column: 14, scope: !5711)
!5722 = !DILocation(line: 2171, column: 11, scope: !5723)
!5723 = distinct !DILexicalBlock(scope: !5711, file: !25, line: 2171, column: 4)
!5724 = !DILocation(line: 2171, column: 9, scope: !5723)
!5725 = !DILocation(line: 2171, column: 16, scope: !5726)
!5726 = distinct !DILexicalBlock(scope: !5723, file: !25, line: 2171, column: 4)
!5727 = !DILocation(line: 2171, column: 20, scope: !5726)
!5728 = !DILocation(line: 2171, column: 18, scope: !5726)
!5729 = !DILocation(line: 2171, column: 4, scope: !5723)
!5730 = !DILocation(line: 2172, column: 28, scope: !5726)
!5731 = !DILocation(line: 2172, column: 5, scope: !5726)
!5732 = !DILocation(line: 2171, column: 32, scope: !5726)
!5733 = !DILocation(line: 2171, column: 4, scope: !5726)
!5734 = distinct !{!5734, !5729, !5735, !2097}
!5735 = !DILocation(line: 2172, column: 68, scope: !5723)
!5736 = !DILocation(line: 2173, column: 3, scope: !5711)
!5737 = !DILocation(line: 2162, column: 19, scope: !5708)
!5738 = !DILocation(line: 2176, column: 25, scope: !5531)
!5739 = !DILocation(line: 2176, column: 17, scope: !5531)
!5740 = !DILocation(line: 2176, column: 31, scope: !5531)
!5741 = !DILocation(line: 2176, column: 15, scope: !5531)
!5742 = !DILocation(line: 2177, column: 16, scope: !5743)
!5743 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2177, column: 7)
!5744 = !DILocation(line: 2177, column: 8, scope: !5743)
!5745 = !DILocation(line: 2177, column: 22, scope: !5743)
!5746 = !DILocation(line: 2177, column: 43, scope: !5743)
!5747 = !DILocation(line: 2177, column: 7, scope: !5743)
!5748 = !DILocation(line: 2177, column: 69, scope: !5743)
!5749 = !DILocation(line: 2177, column: 81, scope: !5743)
!5750 = !DILocation(line: 2177, column: 73, scope: !5743)
!5751 = !DILocation(line: 2177, column: 87, scope: !5743)
!5752 = !DILocation(line: 2177, column: 108, scope: !5743)
!5753 = !DILocation(line: 2177, column: 72, scope: !5743)
!5754 = !DILocation(line: 2178, column: 16, scope: !5743)
!5755 = !DILocation(line: 2178, column: 4, scope: !5743)
!5756 = !DILocation(line: 2179, column: 7, scope: !5757)
!5757 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2179, column: 7)
!5758 = !DILocation(line: 2179, column: 19, scope: !5757)
!5759 = !DILocation(line: 2180, column: 16, scope: !5757)
!5760 = !DILocation(line: 2180, column: 4, scope: !5757)
!5761 = !DILocation(line: 2181, column: 42, scope: !5531)
!5762 = !DILocation(line: 2181, column: 12, scope: !5531)
!5763 = !DILocation(line: 2181, column: 10, scope: !5531)
!5764 = !DILocation(line: 2182, column: 7, scope: !5765)
!5765 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2182, column: 7)
!5766 = !DILocation(line: 2182, column: 14, scope: !5765)
!5767 = !DILocation(line: 2183, column: 47, scope: !5765)
!5768 = !DILocation(line: 2183, column: 12, scope: !5765)
!5769 = !DILocation(line: 2183, column: 4, scope: !5765)
!5770 = !DILocation(line: 2183, column: 20, scope: !5765)
!5771 = !DILocation(line: 2183, column: 39, scope: !5765)
!5772 = !DILocation(line: 2183, column: 45, scope: !5765)
!5773 = !DILocation(line: 2184, column: 42, scope: !5531)
!5774 = !DILocation(line: 2184, column: 12, scope: !5531)
!5775 = !DILocation(line: 2184, column: 10, scope: !5531)
!5776 = !DILocation(line: 2185, column: 7, scope: !5777)
!5777 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2185, column: 7)
!5778 = !DILocation(line: 2185, column: 14, scope: !5777)
!5779 = !DILocation(line: 2186, column: 47, scope: !5777)
!5780 = !DILocation(line: 2186, column: 12, scope: !5777)
!5781 = !DILocation(line: 2186, column: 4, scope: !5777)
!5782 = !DILocation(line: 2186, column: 20, scope: !5777)
!5783 = !DILocation(line: 2186, column: 39, scope: !5777)
!5784 = !DILocation(line: 2186, column: 45, scope: !5777)
!5785 = !DILocation(line: 2189, column: 33, scope: !5531)
!5786 = !DILocation(line: 2189, column: 3, scope: !5531)
!5787 = !DILocation(line: 2190, column: 33, scope: !5531)
!5788 = !DILocation(line: 2190, column: 3, scope: !5531)
!5789 = !DILocation(line: 2191, column: 33, scope: !5531)
!5790 = !DILocation(line: 2191, column: 3, scope: !5531)
!5791 = !DILocation(line: 2193, column: 33, scope: !5531)
!5792 = !DILocation(line: 2193, column: 3, scope: !5531)
!5793 = !DILocation(line: 2194, column: 33, scope: !5531)
!5794 = !DILocation(line: 2194, column: 3, scope: !5531)
!5795 = !DILocation(line: 2196, column: 42, scope: !5531)
!5796 = !DILocation(line: 2196, column: 12, scope: !5531)
!5797 = !DILocation(line: 2196, column: 10, scope: !5531)
!5798 = !DILocation(line: 2197, column: 7, scope: !5799)
!5799 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2197, column: 7)
!5800 = !DILocation(line: 2197, column: 14, scope: !5799)
!5801 = !DILocation(line: 2198, column: 48, scope: !5799)
!5802 = !DILocation(line: 2198, column: 59, scope: !5799)
!5803 = !DILocation(line: 2198, column: 65, scope: !5799)
!5804 = !DILocation(line: 2198, column: 62, scope: !5799)
!5805 = !DILocation(line: 2198, column: 47, scope: !5799)
!5806 = !DILocation(line: 2198, column: 79, scope: !5799)
!5807 = !DILocation(line: 2198, column: 12, scope: !5799)
!5808 = !DILocation(line: 2198, column: 4, scope: !5799)
!5809 = !DILocation(line: 2198, column: 20, scope: !5799)
!5810 = !DILocation(line: 2198, column: 39, scope: !5799)
!5811 = !DILocation(line: 2198, column: 45, scope: !5799)
!5812 = !DILocation(line: 2203, column: 9, scope: !5813)
!5813 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2203, column: 7)
!5814 = !DILocation(line: 2203, column: 19, scope: !5813)
!5815 = !DILocation(line: 2203, column: 8, scope: !5813)
!5816 = !DILocation(line: 2203, column: 7, scope: !5813)
!5817 = !DILocation(line: 2204, column: 36, scope: !5813)
!5818 = !DILocation(line: 2204, column: 73, scope: !5813)
!5819 = !DILocation(line: 2204, column: 84, scope: !5813)
!5820 = !DILocation(line: 2204, column: 65, scope: !5813)
!5821 = !DILocation(line: 2204, column: 88, scope: !5813)
!5822 = !DILocation(line: 2204, column: 64, scope: !5813)
!5823 = !DILocation(line: 2204, column: 121, scope: !5813)
!5824 = !DILocation(line: 2204, column: 4, scope: !5813)
!5825 = !DILocation(line: 2206, column: 35, scope: !5531)
!5826 = !DILocation(line: 2206, column: 67, scope: !5531)
!5827 = !DILocation(line: 2206, column: 78, scope: !5531)
!5828 = !DILocation(line: 2206, column: 59, scope: !5531)
!5829 = !DILocation(line: 2206, column: 82, scope: !5531)
!5830 = !DILocation(line: 2206, column: 3, scope: !5531)
!5831 = !DILocation(line: 2207, column: 35, scope: !5531)
!5832 = !DILocation(line: 2207, column: 66, scope: !5531)
!5833 = !DILocation(line: 2207, column: 77, scope: !5531)
!5834 = !DILocation(line: 2207, column: 58, scope: !5531)
!5835 = !DILocation(line: 2207, column: 81, scope: !5531)
!5836 = !DILocation(line: 2207, column: 3, scope: !5531)
!5837 = !DILocation(line: 2209, column: 35, scope: !5531)
!5838 = !DILocation(line: 2209, column: 73, scope: !5531)
!5839 = !DILocation(line: 2209, column: 84, scope: !5531)
!5840 = !DILocation(line: 2209, column: 65, scope: !5531)
!5841 = !DILocation(line: 2209, column: 88, scope: !5531)
!5842 = !DILocation(line: 2209, column: 64, scope: !5531)
!5843 = !DILocation(line: 2209, column: 122, scope: !5531)
!5844 = !DILocation(line: 2209, column: 3, scope: !5531)
!5845 = !DILocation(line: 2210, column: 35, scope: !5531)
!5846 = !DILocation(line: 2210, column: 71, scope: !5531)
!5847 = !DILocation(line: 2210, column: 82, scope: !5531)
!5848 = !DILocation(line: 2210, column: 63, scope: !5531)
!5849 = !DILocation(line: 2210, column: 86, scope: !5531)
!5850 = !DILocation(line: 2210, column: 3, scope: !5531)
!5851 = !DILocation(line: 2213, column: 23, scope: !5531)
!5852 = !DILocation(line: 2213, column: 3, scope: !5531)
!5853 = !DILocation(line: 2214, column: 23, scope: !5531)
!5854 = !DILocation(line: 2214, column: 3, scope: !5531)
!5855 = !DILocation(line: 2215, column: 23, scope: !5531)
!5856 = !DILocation(line: 2215, column: 3, scope: !5531)
!5857 = !DILocation(line: 2216, column: 23, scope: !5531)
!5858 = !DILocation(line: 2216, column: 3, scope: !5531)
!5859 = !DILocation(line: 2217, column: 23, scope: !5531)
!5860 = !DILocation(line: 2217, column: 3, scope: !5531)
!5861 = !DILocation(line: 2220, column: 17, scope: !5862)
!5862 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2220, column: 7)
!5863 = !DILocation(line: 2220, column: 28, scope: !5862)
!5864 = !DILocation(line: 2220, column: 9, scope: !5862)
!5865 = !DILocation(line: 2220, column: 32, scope: !5862)
!5866 = !DILocation(line: 2220, column: 53, scope: !5862)
!5867 = !DILocation(line: 2220, column: 8, scope: !5862)
!5868 = !DILocation(line: 2220, column: 7, scope: !5862)
!5869 = !DILocalVariable(name: "amount", scope: !5870, file: !25, line: 2221, type: !7)
!5870 = distinct !DILexicalBlock(scope: !5862, file: !25, line: 2220, column: 73)
!5871 = !DILocation(line: 2221, column: 8, scope: !5870)
!5872 = !DILocation(line: 2221, column: 25, scope: !5870)
!5873 = !DILocation(line: 2221, column: 36, scope: !5870)
!5874 = !DILocation(line: 2221, column: 17, scope: !5870)
!5875 = !DILocation(line: 2221, column: 40, scope: !5870)
!5876 = !DILocation(line: 2222, column: 8, scope: !5877)
!5877 = distinct !DILexicalBlock(scope: !5870, file: !25, line: 2222, column: 8)
!5878 = !DILocation(line: 2222, column: 15, scope: !5877)
!5879 = !DILocation(line: 2223, column: 5, scope: !5880)
!5880 = distinct !DILexicalBlock(scope: !5877, file: !25, line: 2222, column: 22)
!5881 = !DILocation(line: 2224, column: 12, scope: !5880)
!5882 = !DILocation(line: 2225, column: 4, scope: !5880)
!5883 = !DILocation(line: 2226, column: 4, scope: !5870)
!5884 = !DILocation(line: 2226, column: 11, scope: !5870)
!5885 = !DILocation(line: 2226, column: 18, scope: !5870)
!5886 = !DILocation(line: 2227, column: 28, scope: !5887)
!5887 = distinct !DILexicalBlock(scope: !5870, file: !25, line: 2226, column: 23)
!5888 = !DILocation(line: 2227, column: 5, scope: !5887)
!5889 = !DILocation(line: 2228, column: 12, scope: !5887)
!5890 = distinct !{!5890, !5883, !5891, !2097}
!5891 = !DILocation(line: 2229, column: 4, scope: !5870)
!5892 = !DILocation(line: 2230, column: 3, scope: !5870)
!5893 = !DILocation(line: 2233, column: 7, scope: !5894)
!5894 = distinct !DILexicalBlock(scope: !5531, file: !25, line: 2233, column: 7)
!5895 = !DILocation(line: 2233, column: 17, scope: !5894)
!5896 = !DILocation(line: 2234, column: 27, scope: !5897)
!5897 = distinct !DILexicalBlock(scope: !5894, file: !25, line: 2233, column: 29)
!5898 = !DILocation(line: 2234, column: 4, scope: !5897)
!5899 = !DILocation(line: 2235, column: 27, scope: !5897)
!5900 = !DILocation(line: 2235, column: 4, scope: !5897)
!5901 = !DILocation(line: 2236, column: 3, scope: !5897)
!5902 = !DILocation(line: 2265, column: 2, scope: !5531)
!5903 = !DILocation(line: 2267, column: 1, scope: !5519)
!5904 = distinct !DISubprogram(name: "min<unsigned short>", linkageName: "_ZNSt3__13minB8ne200100ItEERKT_S3_S3_", scope: !164, file: !5352, line: 35, type: !5905, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !5909, retainedNodes: !1605)
!5905 = !DISubroutineType(types: !5906)
!5906 = !{!5907, !5907, !5907}
!5907 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5908, size: 64)
!5908 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !183)
!5909 = !{!5910}
!5910 = !DITemplateTypeParameter(name: "_Tp", type: !183)
!5911 = !DILocalVariable(name: "__a", arg: 1, scope: !5904, file: !5352, line: 35, type: !5907)
!5912 = !DILocation(line: 35, column: 38, scope: !5904)
!5913 = !DILocalVariable(name: "__b", arg: 2, scope: !5904, file: !5352, line: 35, type: !5907)
!5914 = !DILocation(line: 35, column: 76, scope: !5904)
!5915 = !DILocation(line: 36, column: 19, scope: !5904)
!5916 = !DILocation(line: 36, column: 24, scope: !5904)
!5917 = !DILocation(line: 36, column: 10, scope: !5904)
!5918 = !DILocation(line: 36, column: 3, scope: !5904)
!5919 = distinct !DISubprogram(name: "collide_player_and_weapon", linkageName: "_Z25collide_player_and_weaponP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2385, type: !4069, scopeLine: 2386, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!5920 = !DILocalVariable(name: "playerobj", arg: 1, scope: !5919, file: !25, line: 2385, type: !1467)
!5921 = !DILocation(line: 2385, column: 40, scope: !5919)
!5922 = !DILocalVariable(name: "weapon", arg: 2, scope: !5919, file: !25, line: 2385, type: !1467)
!5923 = !DILocation(line: 2385, column: 59, scope: !5919)
!5924 = !DILocalVariable(name: "collision_point", arg: 3, scope: !5919, file: !25, line: 2385, type: !1604)
!5925 = !DILocation(line: 2385, column: 79, scope: !5919)
!5926 = !DILocalVariable(name: "damage", scope: !5919, file: !25, line: 2387, type: !15)
!5927 = !DILocation(line: 2387, column: 7, scope: !5919)
!5928 = !DILocation(line: 2387, column: 16, scope: !5919)
!5929 = !DILocation(line: 2387, column: 24, scope: !5919)
!5930 = !DILocalVariable(name: "killer", scope: !5919, file: !25, line: 2388, type: !1467)
!5931 = !DILocation(line: 2388, column: 10, scope: !5919)
!5932 = !DILocation(line: 2394, column: 6, scope: !5933)
!5933 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2394, column: 6)
!5934 = !DILocation(line: 2394, column: 14, scope: !5933)
!5935 = !DILocation(line: 2394, column: 17, scope: !5933)
!5936 = !DILocation(line: 2395, column: 30, scope: !5937)
!5937 = distinct !DILexicalBlock(scope: !5933, file: !25, line: 2395, column: 7)
!5938 = !DILocation(line: 2395, column: 8, scope: !5937)
!5939 = !DILocation(line: 2395, column: 7, scope: !5937)
!5940 = !DILocation(line: 2396, column: 4, scope: !5937)
!5941 = !DILocation(line: 2395, column: 36, scope: !5937)
!5942 = !DILocation(line: 2399, column: 6, scope: !5943)
!5943 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2399, column: 6)
!5944 = !DILocation(line: 2399, column: 14, scope: !5943)
!5945 = !DILocation(line: 2399, column: 17, scope: !5943)
!5946 = !DILocation(line: 2400, column: 7, scope: !5947)
!5947 = distinct !DILexicalBlock(scope: !5943, file: !25, line: 2400, column: 7)
!5948 = !DILocation(line: 2400, column: 17, scope: !5947)
!5949 = !DILocation(line: 2400, column: 30, scope: !5947)
!5950 = !DILocation(line: 2400, column: 38, scope: !5947)
!5951 = !DILocation(line: 2400, column: 55, scope: !5947)
!5952 = !DILocation(line: 2400, column: 27, scope: !5947)
!5953 = !DILocation(line: 2401, column: 26, scope: !5954)
!5954 = distinct !DILexicalBlock(scope: !5947, file: !25, line: 2401, column: 8)
!5955 = !DILocation(line: 2401, column: 44, scope: !5954)
!5956 = !DILocation(line: 2401, column: 55, scope: !5954)
!5957 = !DILocation(line: 2401, column: 8, scope: !5954)
!5958 = !DILocation(line: 2401, column: 62, scope: !5954)
!5959 = !DILocation(line: 2401, column: 73, scope: !5954)
!5960 = !DILocation(line: 2401, column: 60, scope: !5954)
!5961 = !DILocation(line: 2402, column: 5, scope: !5954)
!5962 = !DILocation(line: 2404, column: 6, scope: !5963)
!5963 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2404, column: 6)
!5964 = !DILocation(line: 2404, column: 14, scope: !5963)
!5965 = !DILocation(line: 2404, column: 17, scope: !5963)
!5966 = !DILocation(line: 2405, column: 3, scope: !5963)
!5967 = !DILocation(line: 2407, column: 18, scope: !5919)
!5968 = !DILocation(line: 2407, column: 26, scope: !5919)
!5969 = !DILocation(line: 2407, column: 34, scope: !5919)
!5970 = !DILocation(line: 2407, column: 51, scope: !5919)
!5971 = !DILocation(line: 2407, column: 11, scope: !5919)
!5972 = !DILocation(line: 2407, column: 9, scope: !5919)
!5973 = !DILocation(line: 2408, column: 6, scope: !5974)
!5974 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2408, column: 6)
!5975 = !DILocation(line: 2408, column: 16, scope: !5974)
!5976 = !DILocation(line: 2409, column: 19, scope: !5974)
!5977 = !DILocation(line: 2409, column: 39, scope: !5974)
!5978 = !DILocation(line: 2409, column: 47, scope: !5974)
!5979 = !DILocation(line: 2409, column: 27, scope: !5974)
!5980 = !DILocation(line: 2409, column: 51, scope: !5974)
!5981 = !DILocation(line: 2409, column: 12, scope: !5974)
!5982 = !DILocation(line: 2409, column: 10, scope: !5974)
!5983 = !DILocation(line: 2409, column: 3, scope: !5974)
!5984 = !DILocation(line: 2411, column: 6, scope: !5985)
!5985 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2411, column: 6)
!5986 = !DILocation(line: 2411, column: 14, scope: !5985)
!5987 = !DILocation(line: 2411, column: 30, scope: !5985)
!5988 = !DILocation(line: 2411, column: 36, scope: !5985)
!5989 = !DILocation(line: 2412, column: 7, scope: !5990)
!5990 = distinct !DILexicalBlock(scope: !5985, file: !25, line: 2412, column: 7)
!5991 = !DILocation(line: 2412, column: 15, scope: !5990)
!5992 = !DILocation(line: 2412, column: 32, scope: !5990)
!5993 = !DILocation(line: 2412, column: 47, scope: !5990)
!5994 = !DILocation(line: 2412, column: 57, scope: !5990)
!5995 = !DILocation(line: 2412, column: 44, scope: !5990)
!5996 = !DILocation(line: 2413, column: 4, scope: !5990)
!5997 = !DILocation(line: 2415, column: 43, scope: !5990)
!5998 = !DILocation(line: 2415, column: 53, scope: !5990)
!5999 = !DILocation(line: 2415, column: 4, scope: !5990)
!6000 = !DILocation(line: 2415, column: 12, scope: !5990)
!6001 = !DILocation(line: 2415, column: 29, scope: !5990)
!6002 = !DILocation(line: 2415, column: 41, scope: !5990)
!6003 = !DILocation(line: 2412, column: 59, scope: !5990)
!6004 = !DILocation(line: 2417, column: 6, scope: !6005)
!6005 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2417, column: 6)
!6006 = !DILocation(line: 2417, column: 17, scope: !6005)
!6007 = !DILocation(line: 2417, column: 23, scope: !6005)
!6008 = !DILocation(line: 2417, column: 20, scope: !6005)
!6009 = !DILocation(line: 2419, column: 17, scope: !6010)
!6010 = distinct !DILexicalBlock(scope: !6011, file: !25, line: 2419, column: 7)
!6011 = distinct !DILexicalBlock(scope: !6005, file: !25, line: 2418, column: 2)
!6012 = !DILocation(line: 2419, column: 9, scope: !6010)
!6013 = !DILocation(line: 2419, column: 29, scope: !6010)
!6014 = !DILocation(line: 2419, column: 35, scope: !6010)
!6015 = !DILocation(line: 2419, column: 8, scope: !6010)
!6016 = !DILocation(line: 2419, column: 7, scope: !6010)
!6017 = !DILocation(line: 2421, column: 49, scope: !6018)
!6018 = distinct !DILexicalBlock(scope: !6010, file: !25, line: 2420, column: 3)
!6019 = !DILocation(line: 2421, column: 60, scope: !6018)
!6020 = !DILocation(line: 2421, column: 71, scope: !6018)
!6021 = !DILocation(line: 2421, column: 4, scope: !6018)
!6022 = !DILocation(line: 2426, column: 3, scope: !6018)
!6023 = !DILocation(line: 2429, column: 50, scope: !6024)
!6024 = distinct !DILexicalBlock(scope: !6010, file: !25, line: 2428, column: 3)
!6025 = !DILocation(line: 2429, column: 61, scope: !6024)
!6026 = !DILocation(line: 2429, column: 72, scope: !6024)
!6027 = !DILocation(line: 2429, column: 4, scope: !6024)
!6028 = !DILocation(line: 2435, column: 2, scope: !6011)
!6029 = !DILocation(line: 2437, column: 26, scope: !5919)
!6030 = !DILocation(line: 2437, column: 37, scope: !5919)
!6031 = !DILocation(line: 2437, column: 45, scope: !5919)
!6032 = !DILocation(line: 2437, column: 62, scope: !5919)
!6033 = !DILocation(line: 2437, column: 70, scope: !5919)
!6034 = !DILocation(line: 2437, column: 2, scope: !5919)
!6035 = !DILocation(line: 2438, column: 18, scope: !6036)
!6036 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2438, column: 6)
!6037 = !DILocation(line: 2438, column: 26, scope: !6036)
!6038 = !DILocation(line: 2438, column: 6, scope: !6036)
!6039 = !DILocation(line: 2438, column: 30, scope: !6036)
!6040 = !DILocation(line: 2439, column: 25, scope: !6036)
!6041 = !DILocation(line: 2439, column: 33, scope: !6036)
!6042 = !DILocation(line: 2439, column: 3, scope: !6036)
!6043 = !DILocation(line: 2441, column: 20, scope: !5919)
!6044 = !DILocation(line: 2441, column: 28, scope: !5919)
!6045 = !DILocation(line: 2441, column: 2, scope: !5919)
!6046 = !DILocation(line: 2443, column: 19, scope: !5919)
!6047 = !DILocation(line: 2443, column: 30, scope: !5919)
!6048 = !DILocation(line: 2443, column: 2, scope: !5919)
!6049 = !DILocation(line: 2445, column: 19, scope: !6050)
!6050 = distinct !DILexicalBlock(scope: !5919, file: !25, line: 2445, column: 6)
!6051 = !DILocation(line: 2445, column: 27, scope: !6050)
!6052 = !DILocation(line: 2445, column: 7, scope: !6050)
!6053 = !DILocation(line: 2445, column: 31, scope: !6050)
!6054 = !DILocation(line: 2445, column: 6, scope: !6050)
!6055 = !DILocation(line: 2446, column: 7, scope: !6056)
!6056 = distinct !DILexicalBlock(scope: !6057, file: !25, line: 2446, column: 7)
!6057 = distinct !DILexicalBlock(scope: !6050, file: !25, line: 2445, column: 46)
!6058 = !DILocation(line: 2446, column: 15, scope: !6056)
!6059 = !DILocation(line: 2446, column: 32, scope: !6056)
!6060 = !DILocation(line: 2446, column: 43, scope: !6056)
!6061 = !DILocation(line: 2447, column: 22, scope: !6056)
!6062 = !DILocation(line: 2447, column: 30, scope: !6056)
!6063 = !DILocation(line: 2447, column: 47, scope: !6056)
!6064 = !DILocation(line: 2447, column: 14, scope: !6056)
!6065 = !DILocation(line: 2447, column: 11, scope: !6056)
!6066 = !DILocation(line: 2447, column: 4, scope: !6056)
!6067 = !DILocation(line: 2452, column: 9, scope: !6068)
!6068 = distinct !DILexicalBlock(scope: !6057, file: !25, line: 2452, column: 7)
!6069 = !DILocation(line: 2452, column: 17, scope: !6068)
!6070 = !DILocation(line: 2452, column: 23, scope: !6068)
!6071 = !DILocation(line: 2452, column: 8, scope: !6068)
!6072 = !DILocation(line: 2452, column: 7, scope: !6068)
!6073 = !DILocation(line: 2453, column: 27, scope: !6068)
!6074 = !DILocation(line: 2453, column: 38, scope: !6068)
!6075 = !DILocation(line: 2453, column: 46, scope: !6068)
!6076 = !DILocation(line: 2453, column: 4, scope: !6068)
!6077 = !DILocation(line: 2454, column: 2, scope: !6057)
!6078 = !DILocation(line: 2457, column: 2, scope: !5919)
!6079 = !DILocation(line: 2459, column: 2, scope: !5919)
!6080 = !DILocation(line: 2460, column: 1, scope: !5919)
!6081 = distinct !DISubprogram(name: "collide_player_and_nasty_robot", linkageName: "_Z30collide_player_and_nasty_robotP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2463, type: !4069, scopeLine: 2464, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6082 = !DILocalVariable(name: "playerobj", arg: 1, scope: !6081, file: !25, line: 2463, type: !1467)
!6083 = !DILocation(line: 2463, column: 45, scope: !6081)
!6084 = !DILocalVariable(name: "robot", arg: 2, scope: !6081, file: !25, line: 2463, type: !1467)
!6085 = !DILocation(line: 2463, column: 64, scope: !6081)
!6086 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6081, file: !25, line: 2463, type: !1604)
!6087 = !DILocation(line: 2463, column: 83, scope: !6081)
!6088 = !DILocation(line: 2466, column: 36, scope: !6081)
!6089 = !DILocation(line: 2466, column: 43, scope: !6081)
!6090 = !DILocation(line: 2466, column: 25, scope: !6081)
!6091 = !DILocation(line: 2466, column: 47, scope: !6081)
!6092 = !DILocation(line: 2466, column: 59, scope: !6081)
!6093 = !DILocation(line: 2466, column: 70, scope: !6081)
!6094 = !DILocation(line: 2466, column: 81, scope: !6081)
!6095 = !DILocation(line: 2466, column: 2, scope: !6081)
!6096 = !DILocation(line: 2468, column: 26, scope: !6081)
!6097 = !DILocation(line: 2468, column: 37, scope: !6081)
!6098 = !DILocation(line: 2468, column: 45, scope: !6081)
!6099 = !DILocation(line: 2468, column: 62, scope: !6081)
!6100 = !DILocation(line: 2468, column: 70, scope: !6081)
!6101 = !DILocation(line: 2468, column: 2, scope: !6081)
!6102 = !DILocation(line: 2470, column: 19, scope: !6081)
!6103 = !DILocation(line: 2470, column: 30, scope: !6081)
!6104 = !DILocation(line: 2470, column: 2, scope: !6081)
!6105 = !DILocation(line: 2472, column: 25, scope: !6081)
!6106 = !DILocation(line: 2472, column: 36, scope: !6081)
!6107 = !DILocation(line: 2472, column: 51, scope: !6081)
!6108 = !DILocation(line: 2472, column: 68, scope: !6081)
!6109 = !DILocation(line: 2472, column: 48, scope: !6081)
!6110 = !DILocation(line: 2472, column: 2, scope: !6081)
!6111 = !DILocation(line: 2474, column: 2, scope: !6081)
!6112 = distinct !DISubprogram(name: "collide_player_and_materialization_center", linkageName: "_Z41collide_player_and_materialization_centerP6object", scope: !25, file: !25, line: 2477, type: !4242, scopeLine: 2478, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6113 = !DILocalVariable(name: "objp", arg: 1, scope: !6112, file: !25, line: 2477, type: !1467)
!6114 = !DILocation(line: 2477, column: 56, scope: !6112)
!6115 = !DILocalVariable(name: "side", scope: !6112, file: !25, line: 2479, type: !7)
!6116 = !DILocation(line: 2479, column: 6, scope: !6112)
!6117 = !DILocalVariable(name: "exit_dir", scope: !6112, file: !25, line: 2480, type: !1484)
!6118 = !DILocation(line: 2480, column: 13, scope: !6112)
!6119 = !DILocalVariable(name: "segp", scope: !6112, file: !25, line: 2481, type: !2902)
!6120 = !DILocation(line: 2481, column: 11, scope: !6112)
!6121 = !DILocation(line: 2481, column: 28, scope: !6112)
!6122 = !DILocation(line: 2481, column: 34, scope: !6112)
!6123 = !DILocation(line: 2481, column: 19, scope: !6112)
!6124 = !DILocation(line: 2483, column: 47, scope: !6112)
!6125 = !DILocation(line: 2483, column: 53, scope: !6112)
!6126 = !DILocation(line: 2483, column: 65, scope: !6112)
!6127 = !DILocation(line: 2483, column: 71, scope: !6112)
!6128 = !DILocation(line: 2483, column: 2, scope: !6112)
!6129 = !DILocation(line: 2486, column: 26, scope: !6112)
!6130 = !DILocation(line: 2486, column: 32, scope: !6112)
!6131 = !DILocation(line: 2486, column: 41, scope: !6112)
!6132 = !DILocation(line: 2486, column: 47, scope: !6112)
!6133 = !DILocation(line: 2486, column: 52, scope: !6112)
!6134 = !DILocation(line: 2486, column: 60, scope: !6112)
!6135 = !DILocation(line: 2486, column: 2, scope: !6112)
!6136 = !DILocation(line: 2488, column: 6, scope: !6137)
!6137 = distinct !DILexicalBlock(scope: !6112, file: !25, line: 2488, column: 6)
!6138 = !DILocation(line: 2488, column: 12, scope: !6137)
!6139 = !DILocation(line: 2488, column: 18, scope: !6137)
!6140 = !DILocation(line: 2488, column: 15, scope: !6137)
!6141 = !DILocation(line: 2489, column: 3, scope: !6137)
!6142 = !DILocation(line: 2491, column: 12, scope: !6143)
!6143 = distinct !DILexicalBlock(scope: !6112, file: !25, line: 2491, column: 2)
!6144 = !DILocation(line: 2491, column: 7, scope: !6143)
!6145 = !DILocation(line: 2491, column: 17, scope: !6146)
!6146 = distinct !DILexicalBlock(scope: !6143, file: !25, line: 2491, column: 2)
!6147 = !DILocation(line: 2491, column: 22, scope: !6146)
!6148 = !DILocation(line: 2491, column: 2, scope: !6143)
!6149 = !DILocation(line: 2492, column: 7, scope: !6150)
!6150 = distinct !DILexicalBlock(scope: !6146, file: !25, line: 2492, column: 7)
!6151 = !DILocation(line: 2492, column: 35, scope: !6150)
!6152 = !DILocalVariable(name: "exit_point", scope: !6153, file: !25, line: 2493, type: !1484)
!6153 = distinct !DILexicalBlock(scope: !6150, file: !25, line: 2492, column: 51)
!6154 = !DILocation(line: 2493, column: 15, scope: !6153)
!6155 = !DILocalVariable(name: "rand_vec", scope: !6153, file: !25, line: 2493, type: !1484)
!6156 = !DILocation(line: 2493, column: 27, scope: !6153)
!6157 = !DILocation(line: 2495, column: 46, scope: !6153)
!6158 = !DILocation(line: 2495, column: 52, scope: !6153)
!6159 = !DILocation(line: 2495, column: 4, scope: !6153)
!6160 = !DILocation(line: 2496, column: 40, scope: !6153)
!6161 = !DILocation(line: 2496, column: 46, scope: !6153)
!6162 = !DILocation(line: 2496, column: 4, scope: !6153)
!6163 = !DILocation(line: 2497, column: 4, scope: !6153)
!6164 = !DILocation(line: 2498, column: 4, scope: !6153)
!6165 = !DILocation(line: 2499, column: 13, scope: !6153)
!6166 = !DILocation(line: 2499, column: 15, scope: !6153)
!6167 = !DILocation(line: 2499, column: 30, scope: !6153)
!6168 = !DILocation(line: 2499, column: 32, scope: !6153)
!6169 = !DILocation(line: 2499, column: 47, scope: !6153)
!6170 = !DILocation(line: 2499, column: 49, scope: !6153)
!6171 = !DILocation(line: 2500, column: 4, scope: !6153)
!6172 = !DILocation(line: 2501, column: 4, scope: !6153)
!6173 = !DILocation(line: 2502, column: 3, scope: !6153)
!6174 = !DILocation(line: 2492, column: 37, scope: !6150)
!6175 = !DILocation(line: 2491, column: 51, scope: !6146)
!6176 = !DILocation(line: 2491, column: 2, scope: !6146)
!6177 = distinct !{!6177, !6148, !6178, !2097}
!6178 = !DILocation(line: 2502, column: 3, scope: !6143)
!6179 = !DILocation(line: 2504, column: 18, scope: !6112)
!6180 = !DILocation(line: 2504, column: 2, scope: !6112)
!6181 = !DILocation(line: 2506, column: 25, scope: !6112)
!6182 = !DILocation(line: 2506, column: 31, scope: !6112)
!6183 = !DILocation(line: 2506, column: 2, scope: !6112)
!6184 = !DILocation(line: 2508, column: 2, scope: !6112)
!6185 = !DILocation(line: 2510, column: 1, scope: !6112)
!6186 = distinct !DISubprogram(name: "collide_robot_and_materialization_center", linkageName: "_Z40collide_robot_and_materialization_centerP6object", scope: !25, file: !25, line: 2512, type: !4242, scopeLine: 2513, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6187 = !DILocalVariable(name: "objp", arg: 1, scope: !6186, file: !25, line: 2512, type: !1467)
!6188 = !DILocation(line: 2512, column: 55, scope: !6186)
!6189 = !DILocalVariable(name: "side", scope: !6186, file: !25, line: 2514, type: !7)
!6190 = !DILocation(line: 2514, column: 6, scope: !6186)
!6191 = !DILocalVariable(name: "exit_dir", scope: !6186, file: !25, line: 2515, type: !1484)
!6192 = !DILocation(line: 2515, column: 13, scope: !6186)
!6193 = !DILocalVariable(name: "segp", scope: !6186, file: !25, line: 2516, type: !2902)
!6194 = !DILocation(line: 2516, column: 11, scope: !6186)
!6195 = !DILocation(line: 2516, column: 28, scope: !6186)
!6196 = !DILocation(line: 2516, column: 34, scope: !6186)
!6197 = !DILocation(line: 2516, column: 19, scope: !6186)
!6198 = !DILocation(line: 2518, column: 42, scope: !6186)
!6199 = !DILocation(line: 2518, column: 48, scope: !6186)
!6200 = !DILocation(line: 2518, column: 60, scope: !6186)
!6201 = !DILocation(line: 2518, column: 66, scope: !6186)
!6202 = !DILocation(line: 2518, column: 2, scope: !6186)
!6203 = !DILocation(line: 2521, column: 17, scope: !6204)
!6204 = distinct !DILexicalBlock(scope: !6186, file: !25, line: 2521, column: 6)
!6205 = !DILocation(line: 2521, column: 23, scope: !6204)
!6206 = !DILocation(line: 2521, column: 6, scope: !6204)
!6207 = !DILocation(line: 2521, column: 27, scope: !6204)
!6208 = !DILocation(line: 2521, column: 42, scope: !6204)
!6209 = !DILocation(line: 2522, column: 27, scope: !6204)
!6210 = !DILocation(line: 2522, column: 33, scope: !6204)
!6211 = !DILocation(line: 2522, column: 42, scope: !6204)
!6212 = !DILocation(line: 2522, column: 48, scope: !6204)
!6213 = !DILocation(line: 2522, column: 54, scope: !6204)
!6214 = !DILocation(line: 2522, column: 60, scope: !6204)
!6215 = !DILocation(line: 2522, column: 65, scope: !6204)
!6216 = !DILocation(line: 2522, column: 69, scope: !6204)
!6217 = !DILocation(line: 2522, column: 74, scope: !6204)
!6218 = !DILocation(line: 2522, column: 90, scope: !6204)
!6219 = !DILocation(line: 2522, column: 96, scope: !6204)
!6220 = !DILocation(line: 2522, column: 79, scope: !6204)
!6221 = !DILocation(line: 2522, column: 100, scope: !6204)
!6222 = !DILocation(line: 2522, column: 3, scope: !6204)
!6223 = !DILocation(line: 2524, column: 12, scope: !6224)
!6224 = distinct !DILexicalBlock(scope: !6186, file: !25, line: 2524, column: 2)
!6225 = !DILocation(line: 2524, column: 7, scope: !6224)
!6226 = !DILocation(line: 2524, column: 17, scope: !6227)
!6227 = distinct !DILexicalBlock(scope: !6224, file: !25, line: 2524, column: 2)
!6228 = !DILocation(line: 2524, column: 22, scope: !6227)
!6229 = !DILocation(line: 2524, column: 2, scope: !6224)
!6230 = !DILocation(line: 2525, column: 7, scope: !6231)
!6231 = distinct !DILexicalBlock(scope: !6227, file: !25, line: 2525, column: 7)
!6232 = !DILocation(line: 2525, column: 35, scope: !6231)
!6233 = !DILocalVariable(name: "exit_point", scope: !6234, file: !25, line: 2526, type: !1484)
!6234 = distinct !DILexicalBlock(scope: !6231, file: !25, line: 2525, column: 51)
!6235 = !DILocation(line: 2526, column: 15, scope: !6234)
!6236 = !DILocation(line: 2528, column: 46, scope: !6234)
!6237 = !DILocation(line: 2528, column: 52, scope: !6234)
!6238 = !DILocation(line: 2528, column: 4, scope: !6234)
!6239 = !DILocation(line: 2529, column: 40, scope: !6234)
!6240 = !DILocation(line: 2529, column: 46, scope: !6234)
!6241 = !DILocation(line: 2529, column: 4, scope: !6234)
!6242 = !DILocation(line: 2530, column: 4, scope: !6234)
!6243 = !DILocation(line: 2531, column: 3, scope: !6234)
!6244 = !DILocation(line: 2525, column: 37, scope: !6231)
!6245 = !DILocation(line: 2524, column: 51, scope: !6227)
!6246 = !DILocation(line: 2524, column: 2, scope: !6227)
!6247 = distinct !{!6247, !6229, !6248, !2097}
!6248 = !DILocation(line: 2531, column: 3, scope: !6224)
!6249 = !DILocation(line: 2533, column: 18, scope: !6186)
!6250 = !DILocation(line: 2533, column: 2, scope: !6186)
!6251 = !DILocation(line: 2535, column: 24, scope: !6186)
!6252 = !DILocation(line: 2535, column: 2, scope: !6186)
!6253 = !DILocation(line: 2537, column: 2, scope: !6186)
!6254 = distinct !DISubprogram(name: "collide_player_and_powerup", linkageName: "_Z26collide_player_and_powerupP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2547, type: !4069, scopeLine: 2547, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6255 = !DILocalVariable(name: "playerobj", arg: 1, scope: !6254, file: !25, line: 2547, type: !1467)
!6256 = !DILocation(line: 2547, column: 41, scope: !6254)
!6257 = !DILocalVariable(name: "powerup", arg: 2, scope: !6254, file: !25, line: 2547, type: !1467)
!6258 = !DILocation(line: 2547, column: 60, scope: !6254)
!6259 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6254, file: !25, line: 2547, type: !1604)
!6260 = !DILocation(line: 2547, column: 81, scope: !6254)
!6261 = !DILocation(line: 2548, column: 7, scope: !6262)
!6262 = distinct !DILexicalBlock(scope: !6254, file: !25, line: 2548, column: 6)
!6263 = !DILocation(line: 2548, column: 25, scope: !6262)
!6264 = !DILocation(line: 2548, column: 29, scope: !6262)
!6265 = !DILocation(line: 2548, column: 44, scope: !6262)
!6266 = !DILocation(line: 2548, column: 48, scope: !6262)
!6267 = !DILocation(line: 2548, column: 59, scope: !6262)
!6268 = !DILocation(line: 2548, column: 65, scope: !6262)
!6269 = !DILocation(line: 2548, column: 62, scope: !6262)
!6270 = !DILocalVariable(name: "powerup_used", scope: !6271, file: !25, line: 2549, type: !7)
!6271 = distinct !DILexicalBlock(scope: !6262, file: !25, line: 2548, column: 78)
!6272 = !DILocation(line: 2549, column: 7, scope: !6271)
!6273 = !DILocation(line: 2551, column: 29, scope: !6271)
!6274 = !DILocation(line: 2551, column: 18, scope: !6271)
!6275 = !DILocation(line: 2551, column: 16, scope: !6271)
!6276 = !DILocation(line: 2553, column: 7, scope: !6277)
!6277 = distinct !DILexicalBlock(scope: !6271, file: !25, line: 2553, column: 7)
!6278 = !DILocation(line: 2554, column: 4, scope: !6279)
!6279 = distinct !DILexicalBlock(scope: !6277, file: !25, line: 2553, column: 21)
!6280 = !DILocation(line: 2554, column: 13, scope: !6279)
!6281 = !DILocation(line: 2554, column: 19, scope: !6279)
!6282 = !DILocation(line: 2559, column: 3, scope: !6279)
!6283 = !DILocation(line: 2560, column: 2, scope: !6271)
!6284 = !DILocation(line: 2562, column: 12, scope: !6285)
!6285 = distinct !DILexicalBlock(scope: !6262, file: !25, line: 2562, column: 11)
!6286 = !DILocation(line: 2562, column: 22, scope: !6285)
!6287 = !DILocation(line: 2562, column: 11, scope: !6285)
!6288 = !DILocation(line: 2562, column: 39, scope: !6285)
!6289 = !DILocation(line: 2562, column: 43, scope: !6285)
!6290 = !DILocation(line: 2562, column: 54, scope: !6285)
!6291 = !DILocation(line: 2562, column: 60, scope: !6285)
!6292 = !DILocation(line: 2562, column: 57, scope: !6285)
!6293 = !DILocation(line: 2564, column: 11, scope: !6294)
!6294 = distinct !DILexicalBlock(scope: !6285, file: !25, line: 2563, column: 2)
!6295 = !DILocation(line: 2564, column: 20, scope: !6294)
!6296 = !DILocation(line: 2564, column: 3, scope: !6294)
!6297 = !DILocation(line: 2566, column: 12, scope: !6298)
!6298 = distinct !DILexicalBlock(scope: !6294, file: !25, line: 2564, column: 24)
!6299 = !DILocation(line: 2566, column: 23, scope: !6298)
!6300 = !DILocation(line: 2566, column: 4, scope: !6298)
!6301 = !DILocation(line: 2566, column: 27, scope: !6298)
!6302 = !DILocation(line: 2566, column: 33, scope: !6298)
!6303 = !DILocation(line: 2567, column: 4, scope: !6298)
!6304 = !DILocation(line: 2569, column: 12, scope: !6298)
!6305 = !DILocation(line: 2569, column: 23, scope: !6298)
!6306 = !DILocation(line: 2569, column: 4, scope: !6298)
!6307 = !DILocation(line: 2569, column: 27, scope: !6298)
!6308 = !DILocation(line: 2569, column: 33, scope: !6298)
!6309 = !DILocation(line: 2570, column: 4, scope: !6298)
!6310 = !DILocation(line: 2572, column: 12, scope: !6298)
!6311 = !DILocation(line: 2572, column: 23, scope: !6298)
!6312 = !DILocation(line: 2572, column: 4, scope: !6298)
!6313 = !DILocation(line: 2572, column: 27, scope: !6298)
!6314 = !DILocation(line: 2572, column: 33, scope: !6298)
!6315 = !DILocation(line: 2573, column: 4, scope: !6298)
!6316 = !DILocation(line: 2575, column: 4, scope: !6298)
!6317 = !DILocation(line: 2577, column: 2, scope: !6294)
!6318 = !DILocation(line: 2579, column: 2, scope: !6254)
!6319 = distinct !DISubprogram(name: "collide_player_and_clutter", linkageName: "_Z26collide_player_and_clutterP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2586, type: !4069, scopeLine: 2586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6320 = !DILocalVariable(name: "playerobj", arg: 1, scope: !6319, file: !25, line: 2586, type: !1467)
!6321 = !DILocation(line: 2586, column: 41, scope: !6319)
!6322 = !DILocalVariable(name: "clutter", arg: 2, scope: !6319, file: !25, line: 2586, type: !1467)
!6323 = !DILocation(line: 2586, column: 60, scope: !6319)
!6324 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6319, file: !25, line: 2586, type: !1604)
!6325 = !DILocation(line: 2586, column: 81, scope: !6319)
!6326 = !DILocation(line: 2587, column: 49, scope: !6319)
!6327 = !DILocation(line: 2587, column: 60, scope: !6319)
!6328 = !DILocation(line: 2587, column: 71, scope: !6319)
!6329 = !DILocation(line: 2587, column: 2, scope: !6319)
!6330 = !DILocation(line: 2588, column: 19, scope: !6319)
!6331 = !DILocation(line: 2588, column: 28, scope: !6319)
!6332 = !DILocation(line: 2588, column: 2, scope: !6319)
!6333 = !DILocation(line: 2589, column: 2, scope: !6319)
!6334 = distinct !DISubprogram(name: "maybe_detonate_weapon", linkageName: "_Z21maybe_detonate_weaponP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2594, type: !4638, scopeLine: 2595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6335 = !DILocalVariable(name: "weapon1", arg: 1, scope: !6334, file: !25, line: 2594, type: !1467)
!6336 = !DILocation(line: 2594, column: 35, scope: !6334)
!6337 = !DILocalVariable(name: "weapon2", arg: 2, scope: !6334, file: !25, line: 2594, type: !1467)
!6338 = !DILocation(line: 2594, column: 52, scope: !6334)
!6339 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6334, file: !25, line: 2594, type: !1604)
!6340 = !DILocation(line: 2594, column: 73, scope: !6334)
!6341 = !DILocation(line: 2596, column: 18, scope: !6342)
!6342 = distinct !DILexicalBlock(scope: !6334, file: !25, line: 2596, column: 6)
!6343 = !DILocation(line: 2596, column: 27, scope: !6342)
!6344 = !DILocation(line: 2596, column: 6, scope: !6342)
!6345 = !DILocation(line: 2596, column: 31, scope: !6342)
!6346 = !DILocalVariable(name: "dist", scope: !6347, file: !25, line: 2597, type: !15)
!6347 = distinct !DILexicalBlock(scope: !6342, file: !25, line: 2596, column: 46)
!6348 = !DILocation(line: 2597, column: 7, scope: !6347)
!6349 = !DILocation(line: 2599, column: 29, scope: !6347)
!6350 = !DILocation(line: 2599, column: 38, scope: !6347)
!6351 = !DILocation(line: 2599, column: 44, scope: !6347)
!6352 = !DILocation(line: 2599, column: 53, scope: !6347)
!6353 = !DILocation(line: 2599, column: 10, scope: !6347)
!6354 = !DILocation(line: 2599, column: 8, scope: !6347)
!6355 = !DILocation(line: 2600, column: 7, scope: !6356)
!6356 = distinct !DILexicalBlock(scope: !6347, file: !25, line: 2600, column: 7)
!6357 = !DILocation(line: 2600, column: 12, scope: !6356)
!6358 = !DILocation(line: 2601, column: 22, scope: !6359)
!6359 = distinct !DILexicalBlock(scope: !6356, file: !25, line: 2600, column: 24)
!6360 = !DILocation(line: 2601, column: 31, scope: !6359)
!6361 = !DILocation(line: 2601, column: 4, scope: !6359)
!6362 = !DILocation(line: 2602, column: 8, scope: !6363)
!6363 = distinct !DILexicalBlock(scope: !6359, file: !25, line: 2602, column: 8)
!6364 = !DILocation(line: 2602, column: 17, scope: !6363)
!6365 = !DILocation(line: 2602, column: 23, scope: !6363)
!6366 = !DILocation(line: 2603, column: 27, scope: !6367)
!6367 = distinct !DILexicalBlock(scope: !6363, file: !25, line: 2602, column: 44)
!6368 = !DILocation(line: 2603, column: 36, scope: !6367)
!6369 = !DILocation(line: 2603, column: 5, scope: !6367)
!6370 = !DILocation(line: 2604, column: 40, scope: !6367)
!6371 = !DILocation(line: 2604, column: 49, scope: !6367)
!6372 = !DILocation(line: 2604, column: 28, scope: !6367)
!6373 = !DILocation(line: 2604, column: 53, scope: !6367)
!6374 = !DILocation(line: 2604, column: 70, scope: !6367)
!6375 = !DILocation(line: 2604, column: 79, scope: !6367)
!6376 = !DILocation(line: 2604, column: 90, scope: !6367)
!6377 = !DILocation(line: 2604, column: 5, scope: !6367)
!6378 = !DILocation(line: 2605, column: 4, scope: !6367)
!6379 = !DILocation(line: 2606, column: 4, scope: !6359)
!6380 = !DILocation(line: 2609, column: 33, scope: !6381)
!6381 = distinct !DILexicalBlock(scope: !6356, file: !25, line: 2608, column: 8)
!6382 = !DILocation(line: 2609, column: 38, scope: !6381)
!6383 = !DILocation(line: 2609, column: 44, scope: !6381)
!6384 = !DILocation(line: 2609, column: 24, scope: !6381)
!6385 = !DILocation(line: 2609, column: 4, scope: !6381)
!6386 = !DILocation(line: 2609, column: 13, scope: !6381)
!6387 = !DILocation(line: 2609, column: 22, scope: !6381)
!6388 = !DILocation(line: 2610, column: 4, scope: !6381)
!6389 = !DILocation(line: 2614, column: 3, scope: !6342)
!6390 = !DILocation(line: 2615, column: 1, scope: !6334)
!6391 = distinct !DISubprogram(name: "collide_weapon_and_weapon", linkageName: "_Z25collide_weapon_and_weaponP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2617, type: !4069, scopeLine: 2618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6392 = !DILocalVariable(name: "weapon1", arg: 1, scope: !6391, file: !25, line: 2617, type: !1467)
!6393 = !DILocation(line: 2617, column: 40, scope: !6391)
!6394 = !DILocalVariable(name: "weapon2", arg: 2, scope: !6391, file: !25, line: 2617, type: !1467)
!6395 = !DILocation(line: 2617, column: 57, scope: !6391)
!6396 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6391, file: !25, line: 2617, type: !1604)
!6397 = !DILocation(line: 2617, column: 78, scope: !6391)
!6398 = !DILocation(line: 2620, column: 6, scope: !6399)
!6399 = distinct !DILexicalBlock(scope: !6391, file: !25, line: 2620, column: 6)
!6400 = !DILocation(line: 2620, column: 15, scope: !6399)
!6401 = !DILocation(line: 2620, column: 18, scope: !6399)
!6402 = !DILocation(line: 2620, column: 30, scope: !6399)
!6403 = !DILocation(line: 2620, column: 33, scope: !6399)
!6404 = !DILocation(line: 2620, column: 42, scope: !6399)
!6405 = !DILocation(line: 2620, column: 45, scope: !6399)
!6406 = !DILocation(line: 2621, column: 3, scope: !6399)
!6407 = !DILocation(line: 2623, column: 6, scope: !6408)
!6408 = distinct !DILexicalBlock(scope: !6391, file: !25, line: 2623, column: 6)
!6409 = !DILocation(line: 2623, column: 26, scope: !6408)
!6410 = !DILocation(line: 2625, column: 7, scope: !6411)
!6411 = distinct !DILexicalBlock(scope: !6412, file: !25, line: 2625, column: 7)
!6412 = distinct !DILexicalBlock(scope: !6408, file: !25, line: 2624, column: 2)
!6413 = !DILocation(line: 2625, column: 16, scope: !6411)
!6414 = !DILocation(line: 2625, column: 19, scope: !6411)
!6415 = !DILocation(line: 2627, column: 31, scope: !6416)
!6416 = distinct !DILexicalBlock(scope: !6417, file: !25, line: 2627, column: 8)
!6417 = distinct !DILexicalBlock(scope: !6411, file: !25, line: 2626, column: 3)
!6418 = !DILocation(line: 2627, column: 9, scope: !6416)
!6419 = !DILocation(line: 2627, column: 8, scope: !6416)
!6420 = !DILocation(line: 2628, column: 5, scope: !6416)
!6421 = !DILocation(line: 2629, column: 3, scope: !6417)
!6422 = !DILocation(line: 2630, column: 12, scope: !6423)
!6423 = distinct !DILexicalBlock(scope: !6411, file: !25, line: 2630, column: 12)
!6424 = !DILocation(line: 2630, column: 21, scope: !6423)
!6425 = !DILocation(line: 2630, column: 24, scope: !6423)
!6426 = !DILocation(line: 2632, column: 31, scope: !6427)
!6427 = distinct !DILexicalBlock(scope: !6428, file: !25, line: 2632, column: 8)
!6428 = distinct !DILexicalBlock(scope: !6423, file: !25, line: 2631, column: 3)
!6429 = !DILocation(line: 2632, column: 9, scope: !6427)
!6430 = !DILocation(line: 2632, column: 8, scope: !6427)
!6431 = !DILocation(line: 2633, column: 5, scope: !6427)
!6432 = !DILocation(line: 2634, column: 3, scope: !6428)
!6433 = !DILocation(line: 2635, column: 2, scope: !6412)
!6434 = !DILocation(line: 2637, column: 19, scope: !6435)
!6435 = distinct !DILexicalBlock(scope: !6391, file: !25, line: 2637, column: 6)
!6436 = !DILocation(line: 2637, column: 28, scope: !6435)
!6437 = !DILocation(line: 2637, column: 7, scope: !6435)
!6438 = !DILocation(line: 2637, column: 32, scope: !6435)
!6439 = !DILocation(line: 2637, column: 6, scope: !6435)
!6440 = !DILocation(line: 2637, column: 45, scope: !6435)
!6441 = !DILocation(line: 2637, column: 61, scope: !6435)
!6442 = !DILocation(line: 2637, column: 70, scope: !6435)
!6443 = !DILocation(line: 2637, column: 49, scope: !6435)
!6444 = !DILocation(line: 2637, column: 74, scope: !6435)
!6445 = !DILocation(line: 2637, column: 48, scope: !6435)
!6446 = !DILocation(line: 2641, column: 8, scope: !6447)
!6447 = distinct !DILexicalBlock(scope: !6448, file: !25, line: 2641, column: 7)
!6448 = distinct !DILexicalBlock(scope: !6435, file: !25, line: 2638, column: 2)
!6449 = !DILocation(line: 2641, column: 17, scope: !6447)
!6450 = !DILocation(line: 2641, column: 23, scope: !6447)
!6451 = !DILocation(line: 2641, column: 32, scope: !6447)
!6452 = !DILocation(line: 2641, column: 20, scope: !6447)
!6453 = !DILocation(line: 2641, column: 36, scope: !6447)
!6454 = !DILocation(line: 2641, column: 40, scope: !6447)
!6455 = !DILocation(line: 2641, column: 49, scope: !6447)
!6456 = !DILocation(line: 2641, column: 66, scope: !6447)
!6457 = !DILocation(line: 2641, column: 80, scope: !6447)
!6458 = !DILocation(line: 2641, column: 89, scope: !6447)
!6459 = !DILocation(line: 2641, column: 106, scope: !6447)
!6460 = !DILocation(line: 2641, column: 77, scope: !6447)
!6461 = !DILocation(line: 2642, column: 4, scope: !6447)
!6462 = !DILocation(line: 2644, column: 19, scope: !6463)
!6463 = distinct !DILexicalBlock(scope: !6448, file: !25, line: 2644, column: 7)
!6464 = !DILocation(line: 2644, column: 28, scope: !6463)
!6465 = !DILocation(line: 2644, column: 7, scope: !6463)
!6466 = !DILocation(line: 2644, column: 32, scope: !6463)
!6467 = !DILocation(line: 2645, column: 30, scope: !6468)
!6468 = distinct !DILexicalBlock(scope: !6463, file: !25, line: 2645, column: 8)
!6469 = !DILocation(line: 2645, column: 39, scope: !6468)
!6470 = !DILocation(line: 2645, column: 48, scope: !6468)
!6471 = !DILocation(line: 2645, column: 8, scope: !6468)
!6472 = !DILocation(line: 2646, column: 27, scope: !6468)
!6473 = !DILocation(line: 2646, column: 36, scope: !6468)
!6474 = !DILocation(line: 2646, column: 45, scope: !6468)
!6475 = !DILocation(line: 2646, column: 5, scope: !6468)
!6476 = !DILocation(line: 2645, column: 63, scope: !6468)
!6477 = !DILocation(line: 2648, column: 19, scope: !6478)
!6478 = distinct !DILexicalBlock(scope: !6448, file: !25, line: 2648, column: 7)
!6479 = !DILocation(line: 2648, column: 28, scope: !6478)
!6480 = !DILocation(line: 2648, column: 7, scope: !6478)
!6481 = !DILocation(line: 2648, column: 32, scope: !6478)
!6482 = !DILocation(line: 2649, column: 30, scope: !6483)
!6483 = distinct !DILexicalBlock(scope: !6478, file: !25, line: 2649, column: 8)
!6484 = !DILocation(line: 2649, column: 39, scope: !6483)
!6485 = !DILocation(line: 2649, column: 48, scope: !6483)
!6486 = !DILocation(line: 2649, column: 8, scope: !6483)
!6487 = !DILocation(line: 2650, column: 27, scope: !6483)
!6488 = !DILocation(line: 2650, column: 36, scope: !6483)
!6489 = !DILocation(line: 2650, column: 45, scope: !6483)
!6490 = !DILocation(line: 2650, column: 5, scope: !6483)
!6491 = !DILocation(line: 2649, column: 63, scope: !6483)
!6492 = !DILocation(line: 2652, column: 2, scope: !6448)
!6493 = !DILocation(line: 2654, column: 1, scope: !6391)
!6494 = distinct !DISubprogram(name: "collide_weapon_and_debris", linkageName: "_Z25collide_weapon_and_debrisP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2664, type: !4069, scopeLine: 2664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6495 = !DILocalVariable(name: "weapon", arg: 1, scope: !6494, file: !25, line: 2664, type: !1467)
!6496 = !DILocation(line: 2664, column: 40, scope: !6494)
!6497 = !DILocalVariable(name: "debris", arg: 2, scope: !6494, file: !25, line: 2664, type: !1467)
!6498 = !DILocation(line: 2664, column: 56, scope: !6494)
!6499 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6494, file: !25, line: 2664, type: !1604)
!6500 = !DILocation(line: 2664, column: 76, scope: !6494)
!6501 = !DILocation(line: 2667, column: 7, scope: !6502)
!6502 = distinct !DILexicalBlock(scope: !6494, file: !25, line: 2667, column: 6)
!6503 = !DILocation(line: 2667, column: 15, scope: !6502)
!6504 = !DILocation(line: 2667, column: 18, scope: !6502)
!6505 = !DILocation(line: 2667, column: 35, scope: !6502)
!6506 = !DILocation(line: 2667, column: 39, scope: !6502)
!6507 = !DILocation(line: 2667, column: 47, scope: !6502)
!6508 = !DILocation(line: 2667, column: 50, scope: !6502)
!6509 = !DILocation(line: 2668, column: 7, scope: !6510)
!6510 = distinct !DILexicalBlock(scope: !6511, file: !25, line: 2668, column: 7)
!6511 = distinct !DILexicalBlock(scope: !6502, file: !25, line: 2667, column: 68)
!6512 = !DILocation(line: 2668, column: 15, scope: !6510)
!6513 = !DILocation(line: 2668, column: 32, scope: !6510)
!6514 = !DILocation(line: 2668, column: 46, scope: !6510)
!6515 = !DILocation(line: 2668, column: 59, scope: !6510)
!6516 = !DILocation(line: 2668, column: 57, scope: !6510)
!6517 = !DILocation(line: 2669, column: 4, scope: !6510)
!6518 = !DILocation(line: 2670, column: 2, scope: !6511)
!6519 = !DILocation(line: 2672, column: 7, scope: !6520)
!6520 = distinct !DILexicalBlock(scope: !6494, file: !25, line: 2672, column: 6)
!6521 = !DILocation(line: 2672, column: 15, scope: !6520)
!6522 = !DILocation(line: 2672, column: 32, scope: !6520)
!6523 = !DILocation(line: 2672, column: 44, scope: !6520)
!6524 = !DILocation(line: 2672, column: 59, scope: !6520)
!6525 = !DILocation(line: 2672, column: 64, scope: !6520)
!6526 = !DILocation(line: 2672, column: 72, scope: !6520)
!6527 = !DILocation(line: 2672, column: 78, scope: !6520)
!6528 = !DILocation(line: 2672, column: 63, scope: !6520)
!6529 = !DILocation(line: 2673, column: 43, scope: !6530)
!6530 = distinct !DILexicalBlock(scope: !6520, file: !25, line: 2672, column: 95)
!6531 = !DILocation(line: 2673, column: 51, scope: !6530)
!6532 = !DILocation(line: 2673, column: 62, scope: !6530)
!6533 = !DILocation(line: 2673, column: 3, scope: !6530)
!6534 = !DILocation(line: 2675, column: 18, scope: !6530)
!6535 = !DILocation(line: 2675, column: 3, scope: !6530)
!6536 = !DILocation(line: 2676, column: 19, scope: !6537)
!6537 = distinct !DILexicalBlock(scope: !6530, file: !25, line: 2676, column: 7)
!6538 = !DILocation(line: 2676, column: 27, scope: !6537)
!6539 = !DILocation(line: 2676, column: 7, scope: !6537)
!6540 = !DILocation(line: 2676, column: 31, scope: !6537)
!6541 = !DILocation(line: 2677, column: 26, scope: !6537)
!6542 = !DILocation(line: 2677, column: 34, scope: !6537)
!6543 = !DILocation(line: 2677, column: 4, scope: !6537)
!6544 = !DILocation(line: 2678, column: 21, scope: !6530)
!6545 = !DILocation(line: 2678, column: 29, scope: !6530)
!6546 = !DILocation(line: 2678, column: 3, scope: !6530)
!6547 = !DILocation(line: 2679, column: 3, scope: !6530)
!6548 = !DILocation(line: 2679, column: 11, scope: !6530)
!6549 = !DILocation(line: 2679, column: 17, scope: !6530)
!6550 = !DILocation(line: 2680, column: 2, scope: !6530)
!6551 = !DILocation(line: 2681, column: 2, scope: !6494)
!6552 = !DILocation(line: 2682, column: 1, scope: !6494)
!6553 = distinct !DISubprogram(name: "collide_two_objects", linkageName: "_Z19collide_two_objectsP6objectS0_P10vms_vector", scope: !25, file: !25, line: 2748, type: !4069, scopeLine: 2749, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6554 = !DILocalVariable(name: "A", arg: 1, scope: !6553, file: !25, line: 2748, type: !1467)
!6555 = !DILocation(line: 2748, column: 34, scope: !6553)
!6556 = !DILocalVariable(name: "B", arg: 2, scope: !6553, file: !25, line: 2748, type: !1467)
!6557 = !DILocation(line: 2748, column: 45, scope: !6553)
!6558 = !DILocalVariable(name: "collision_point", arg: 3, scope: !6553, file: !25, line: 2748, type: !1604)
!6559 = !DILocation(line: 2748, column: 60, scope: !6553)
!6560 = !DILocalVariable(name: "collision_type", scope: !6553, file: !25, line: 2750, type: !7)
!6561 = !DILocation(line: 2750, column: 6, scope: !6553)
!6562 = !DILocation(line: 2752, column: 19, scope: !6553)
!6563 = !DILocation(line: 2752, column: 17, scope: !6553)
!6564 = !DILocation(line: 2756, column: 10, scope: !6553)
!6565 = !DILocation(line: 2756, column: 2, scope: !6553)
!6566 = !DILocation(line: 2757, column: 3, scope: !6567)
!6567 = distinct !DILexicalBlock(scope: !6553, file: !25, line: 2756, column: 26)
!6568 = !DILocation(line: 2758, column: 4, scope: !6567)
!6569 = !DILocation(line: 2759, column: 4, scope: !6567)
!6570 = !DILocation(line: 2760, column: 4, scope: !6567)
!6571 = !DILocation(line: 2761, column: 4, scope: !6567)
!6572 = !DILocation(line: 2762, column: 4, scope: !6567)
!6573 = !DILocation(line: 2763, column: 4, scope: !6567)
!6574 = !DILocation(line: 2764, column: 4, scope: !6567)
!6575 = !DILocation(line: 2765, column: 4, scope: !6567)
!6576 = !DILocation(line: 2766, column: 4, scope: !6567)
!6577 = !DILocation(line: 2767, column: 4, scope: !6567)
!6578 = !DILocation(line: 2768, column: 4, scope: !6567)
!6579 = !DILocation(line: 2769, column: 4, scope: !6567)
!6580 = !DILocation(line: 2770, column: 4, scope: !6567)
!6581 = !DILocation(line: 2771, column: 4, scope: !6567)
!6582 = !DILocation(line: 2772, column: 4, scope: !6567)
!6583 = !DILocation(line: 2773, column: 4, scope: !6567)
!6584 = !DILocation(line: 2774, column: 4, scope: !6567)
!6585 = !DILocation(line: 2775, column: 4, scope: !6567)
!6586 = !DILocation(line: 2776, column: 4, scope: !6567)
!6587 = !DILocation(line: 2777, column: 4, scope: !6567)
!6588 = !DILocation(line: 2778, column: 4, scope: !6567)
!6589 = !DILocation(line: 2779, column: 4, scope: !6567)
!6590 = !DILocation(line: 2780, column: 4, scope: !6567)
!6591 = !DILocation(line: 2781, column: 4, scope: !6567)
!6592 = !DILocation(line: 2782, column: 4, scope: !6567)
!6593 = !DILocation(line: 2783, column: 4, scope: !6567)
!6594 = !DILocation(line: 2784, column: 4, scope: !6567)
!6595 = !DILocation(line: 2785, column: 4, scope: !6567)
!6596 = !DILocation(line: 2786, column: 4, scope: !6567)
!6597 = !DILocation(line: 2787, column: 4, scope: !6567)
!6598 = !DILocation(line: 2788, column: 4, scope: !6567)
!6599 = !DILocation(line: 2789, column: 4, scope: !6567)
!6600 = !DILocation(line: 2790, column: 4, scope: !6567)
!6601 = !DILocation(line: 2791, column: 4, scope: !6567)
!6602 = !DILocation(line: 2792, column: 4, scope: !6567)
!6603 = !DILocation(line: 2793, column: 4, scope: !6567)
!6604 = !DILocation(line: 2794, column: 4, scope: !6567)
!6605 = !DILocation(line: 2795, column: 4, scope: !6567)
!6606 = !DILocation(line: 2796, column: 4, scope: !6567)
!6607 = !DILocation(line: 2797, column: 4, scope: !6567)
!6608 = !DILocation(line: 2798, column: 4, scope: !6567)
!6609 = !DILocation(line: 2800, column: 4, scope: !6567)
!6610 = !DILocation(line: 2801, column: 4, scope: !6567)
!6611 = !DILocation(line: 2802, column: 4, scope: !6567)
!6612 = !DILocation(line: 2803, column: 4, scope: !6567)
!6613 = !DILocation(line: 2804, column: 4, scope: !6567)
!6614 = !DILocation(line: 2805, column: 4, scope: !6567)
!6615 = !DILocation(line: 2806, column: 4, scope: !6567)
!6616 = !DILocation(line: 2809, column: 3, scope: !6567)
!6617 = !DILocation(line: 2810, column: 2, scope: !6567)
!6618 = !DILocation(line: 2811, column: 1, scope: !6553)
!6619 = distinct !DISubprogram(name: "collide_init", linkageName: "_Z12collide_initv", scope: !25, file: !25, line: 2821, type: !1183, scopeLine: 2821, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6620 = !DILocalVariable(name: "i", scope: !6619, file: !25, line: 2822, type: !7)
!6621 = !DILocation(line: 2822, column: 6, scope: !6619)
!6622 = !DILocalVariable(name: "j", scope: !6619, file: !25, line: 2822, type: !7)
!6623 = !DILocation(line: 2822, column: 9, scope: !6619)
!6624 = !DILocation(line: 2824, column: 9, scope: !6625)
!6625 = distinct !DILexicalBlock(scope: !6619, file: !25, line: 2824, column: 2)
!6626 = !DILocation(line: 2824, column: 7, scope: !6625)
!6627 = !DILocation(line: 2824, column: 14, scope: !6628)
!6628 = distinct !DILexicalBlock(scope: !6625, file: !25, line: 2824, column: 2)
!6629 = !DILocation(line: 2824, column: 16, scope: !6628)
!6630 = !DILocation(line: 2824, column: 2, scope: !6625)
!6631 = !DILocation(line: 2825, column: 10, scope: !6632)
!6632 = distinct !DILexicalBlock(scope: !6628, file: !25, line: 2825, column: 3)
!6633 = !DILocation(line: 2825, column: 8, scope: !6632)
!6634 = !DILocation(line: 2825, column: 15, scope: !6635)
!6635 = distinct !DILexicalBlock(scope: !6632, file: !25, line: 2825, column: 3)
!6636 = !DILocation(line: 2825, column: 17, scope: !6635)
!6637 = !DILocation(line: 2825, column: 3, scope: !6632)
!6638 = !DILocation(line: 2826, column: 20, scope: !6635)
!6639 = !DILocation(line: 2826, column: 4, scope: !6635)
!6640 = !DILocation(line: 2826, column: 23, scope: !6635)
!6641 = !DILocation(line: 2826, column: 26, scope: !6635)
!6642 = !DILocation(line: 2825, column: 38, scope: !6635)
!6643 = !DILocation(line: 2825, column: 3, scope: !6635)
!6644 = distinct !{!6644, !6637, !6645, !2097}
!6645 = !DILocation(line: 2826, column: 28, scope: !6632)
!6646 = !DILocation(line: 2824, column: 37, scope: !6628)
!6647 = !DILocation(line: 2824, column: 2, scope: !6628)
!6648 = distinct !{!6648, !6630, !6649, !2097}
!6649 = !DILocation(line: 2826, column: 28, scope: !6625)
!6650 = !DILocation(line: 2828, column: 2, scope: !6619)
!6651 = !DILocation(line: 2829, column: 2, scope: !6619)
!6652 = !DILocation(line: 2830, column: 2, scope: !6619)
!6653 = !DILocation(line: 2831, column: 2, scope: !6619)
!6654 = !DILocation(line: 2833, column: 2, scope: !6619)
!6655 = !DILocation(line: 2836, column: 2, scope: !6619)
!6656 = !DILocation(line: 2837, column: 2, scope: !6619)
!6657 = !DILocation(line: 2838, column: 2, scope: !6619)
!6658 = !DILocation(line: 2839, column: 2, scope: !6619)
!6659 = !DILocation(line: 2840, column: 2, scope: !6619)
!6660 = !DILocation(line: 2841, column: 2, scope: !6619)
!6661 = !DILocation(line: 2842, column: 2, scope: !6619)
!6662 = !DILocation(line: 2843, column: 2, scope: !6619)
!6663 = !DILocation(line: 2844, column: 2, scope: !6619)
!6664 = !DILocation(line: 2845, column: 2, scope: !6619)
!6665 = !DILocation(line: 2846, column: 2, scope: !6619)
!6666 = !DILocation(line: 2847, column: 2, scope: !6619)
!6667 = !DILocation(line: 2848, column: 2, scope: !6619)
!6668 = !DILocation(line: 2849, column: 2, scope: !6619)
!6669 = !DILocation(line: 2850, column: 2, scope: !6619)
!6670 = !DILocation(line: 2851, column: 2, scope: !6619)
!6671 = !DILocation(line: 2852, column: 2, scope: !6619)
!6672 = !DILocation(line: 2853, column: 2, scope: !6619)
!6673 = !DILocation(line: 2854, column: 2, scope: !6619)
!6674 = !DILocation(line: 2855, column: 2, scope: !6619)
!6675 = !DILocation(line: 2856, column: 2, scope: !6619)
!6676 = !DILocation(line: 2857, column: 2, scope: !6619)
!6677 = !DILocation(line: 2858, column: 2, scope: !6619)
!6678 = !DILocation(line: 2859, column: 2, scope: !6619)
!6679 = !DILocation(line: 2860, column: 2, scope: !6619)
!6680 = !DILocation(line: 2861, column: 2, scope: !6619)
!6681 = !DILocation(line: 2862, column: 2, scope: !6619)
!6682 = !DILocation(line: 2863, column: 2, scope: !6619)
!6683 = !DILocation(line: 2864, column: 2, scope: !6619)
!6684 = !DILocation(line: 2865, column: 2, scope: !6619)
!6685 = !DILocation(line: 2866, column: 2, scope: !6619)
!6686 = !DILocation(line: 2867, column: 2, scope: !6619)
!6687 = !DILocation(line: 2868, column: 2, scope: !6619)
!6688 = !DILocation(line: 2869, column: 2, scope: !6619)
!6689 = !DILocation(line: 2870, column: 2, scope: !6619)
!6690 = !DILocation(line: 2871, column: 2, scope: !6619)
!6691 = !DILocation(line: 2872, column: 3, scope: !6619)
!6692 = !DILocation(line: 2873, column: 3, scope: !6619)
!6693 = !DILocation(line: 2874, column: 3, scope: !6619)
!6694 = !DILocation(line: 2875, column: 3, scope: !6619)
!6695 = !DILocation(line: 2877, column: 3, scope: !6619)
!6696 = !DILocation(line: 2879, column: 1, scope: !6619)
!6697 = distinct !DISubprogram(name: "collide_object_with_wall", linkageName: "_Z24collide_object_with_wallP6objectissP10vms_vector", scope: !25, file: !25, line: 2881, type: !1465, scopeLine: 2882, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1605)
!6698 = !DILocalVariable(name: "A", arg: 1, scope: !6697, file: !25, line: 2881, type: !1467)
!6699 = !DILocation(line: 2881, column: 39, scope: !6697)
!6700 = !DILocalVariable(name: "hitspeed", arg: 2, scope: !6697, file: !25, line: 2881, type: !15)
!6701 = !DILocation(line: 2881, column: 46, scope: !6697)
!6702 = !DILocalVariable(name: "hitseg", arg: 3, scope: !6697, file: !25, line: 2881, type: !173)
!6703 = !DILocation(line: 2881, column: 62, scope: !6697)
!6704 = !DILocalVariable(name: "hitwall", arg: 4, scope: !6697, file: !25, line: 2881, type: !173)
!6705 = !DILocation(line: 2881, column: 76, scope: !6697)
!6706 = !DILocalVariable(name: "hitpt", arg: 5, scope: !6697, file: !25, line: 2881, type: !1604)
!6707 = !DILocation(line: 2881, column: 97, scope: !6697)
!6708 = !DILocation(line: 2884, column: 10, scope: !6697)
!6709 = !DILocation(line: 2884, column: 13, scope: !6697)
!6710 = !DILocation(line: 2884, column: 2, scope: !6697)
!6711 = !DILocation(line: 2886, column: 3, scope: !6712)
!6712 = distinct !DILexicalBlock(scope: !6697, file: !25, line: 2884, column: 19)
!6713 = !DILocation(line: 2887, column: 3, scope: !6712)
!6714 = !DILocation(line: 2888, column: 44, scope: !6712)
!6715 = !DILocation(line: 2888, column: 47, scope: !6712)
!6716 = !DILocation(line: 2888, column: 57, scope: !6712)
!6717 = !DILocation(line: 2888, column: 65, scope: !6712)
!6718 = !DILocation(line: 2888, column: 74, scope: !6712)
!6719 = !DILocation(line: 2888, column: 20, scope: !6712)
!6720 = !DILocation(line: 2888, column: 82, scope: !6712)
!6721 = !DILocation(line: 2889, column: 44, scope: !6712)
!6722 = !DILocation(line: 2889, column: 47, scope: !6712)
!6723 = !DILocation(line: 2889, column: 57, scope: !6712)
!6724 = !DILocation(line: 2889, column: 65, scope: !6712)
!6725 = !DILocation(line: 2889, column: 74, scope: !6712)
!6726 = !DILocation(line: 2889, column: 20, scope: !6712)
!6727 = !DILocation(line: 2889, column: 82, scope: !6712)
!6728 = !DILocation(line: 2890, column: 44, scope: !6712)
!6729 = !DILocation(line: 2890, column: 47, scope: !6712)
!6730 = !DILocation(line: 2890, column: 57, scope: !6712)
!6731 = !DILocation(line: 2890, column: 65, scope: !6712)
!6732 = !DILocation(line: 2890, column: 74, scope: !6712)
!6733 = !DILocation(line: 2890, column: 20, scope: !6712)
!6734 = !DILocation(line: 2890, column: 82, scope: !6712)
!6735 = !DILocation(line: 2892, column: 21, scope: !6712)
!6736 = !DILocation(line: 2893, column: 42, scope: !6712)
!6737 = !DILocation(line: 2893, column: 45, scope: !6712)
!6738 = !DILocation(line: 2893, column: 55, scope: !6712)
!6739 = !DILocation(line: 2893, column: 63, scope: !6712)
!6740 = !DILocation(line: 2893, column: 72, scope: !6712)
!6741 = !DILocation(line: 2893, column: 19, scope: !6712)
!6742 = !DILocation(line: 2893, column: 80, scope: !6712)
!6743 = !DILocation(line: 2894, column: 21, scope: !6712)
!6744 = !DILocation(line: 2895, column: 20, scope: !6712)
!6745 = !DILocation(line: 2896, column: 21, scope: !6712)
!6746 = !DILocation(line: 2897, column: 19, scope: !6712)
!6747 = !DILocation(line: 2900, column: 3, scope: !6712)
!6748 = !DILocation(line: 2901, column: 2, scope: !6712)
!6749 = !DILocation(line: 2902, column: 1, scope: !6697)
!6750 = distinct !DISubprogram(name: "min<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !164, file: !5352, line: 29, type: !6751, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !6758, retainedNodes: !1605)
!6751 = !DISubroutineType(types: !6752)
!6752 = !{!5355, !5355, !5355, !6753}
!6753 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__less<void, void>", scope: !164, file: !6754, line: 38, size: 8, flags: DIFlagTypePassByValue, elements: !1605, templateParams: !6755, identifier: "_ZTSNSt3__16__lessIvvEE")
!6754 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/comp.h", directory: "")
!6755 = !{!6756, !6757}
!6756 = !DITemplateTypeParameter(name: "_T1", type: null, defaulted: true)
!6757 = !DITemplateTypeParameter(name: "_T2", type: null, defaulted: true)
!6758 = !{!5357, !6759}
!6759 = !DITemplateTypeParameter(name: "_Compare", type: !6753)
!6760 = !DILocalVariable(name: "__a", arg: 1, scope: !6750, file: !5352, line: 29, type: !5355)
!6761 = !DILocation(line: 29, column: 38, scope: !6750)
!6762 = !DILocalVariable(name: "__b", arg: 2, scope: !6750, file: !5352, line: 29, type: !5355)
!6763 = !DILocation(line: 29, column: 76, scope: !6750)
!6764 = !DILocalVariable(name: "__comp", arg: 3, scope: !6750, file: !5352, line: 29, type: !6753)
!6765 = !DILocation(line: 29, column: 90, scope: !6750)
!6766 = !DILocation(line: 30, column: 17, scope: !6750)
!6767 = !DILocation(line: 30, column: 22, scope: !6750)
!6768 = !DILocation(line: 30, column: 10, scope: !6750)
!6769 = !DILocation(line: 30, column: 29, scope: !6750)
!6770 = !DILocation(line: 30, column: 35, scope: !6750)
!6771 = !DILocation(line: 30, column: 3, scope: !6750)
!6772 = distinct !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !6753, file: !6754, line: 40, type: !6773, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !6778, declaration: !6777, retainedNodes: !1605)
!6773 = !DISubroutineType(types: !6774)
!6774 = !{!729, !6775, !5355, !5355}
!6775 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6776, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!6776 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6753)
!6777 = !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !6753, file: !6754, line: 40, type: !6773, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !6778)
!6778 = !{!5357, !6779}
!6779 = !DITemplateTypeParameter(name: "_Up", type: !7)
!6780 = !DILocalVariable(name: "this", arg: 1, scope: !6772, type: !6781, flags: DIFlagArtificial | DIFlagObjectPointer)
!6781 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6776, size: 64)
!6782 = !DILocation(line: 0, scope: !6772)
!6783 = !DILocalVariable(name: "__lhs", arg: 2, scope: !6772, file: !6754, line: 40, type: !5355)
!6784 = !DILocation(line: 40, column: 82, scope: !6772)
!6785 = !DILocalVariable(name: "__rhs", arg: 3, scope: !6772, file: !6754, line: 40, type: !5355)
!6786 = !DILocation(line: 40, column: 100, scope: !6772)
!6787 = !DILocation(line: 41, column: 12, scope: !6772)
!6788 = !DILocation(line: 41, column: 20, scope: !6772)
!6789 = !DILocation(line: 41, column: 18, scope: !6772)
!6790 = !DILocation(line: 41, column: 5, scope: !6772)
!6791 = distinct !DISubprogram(name: "min<unsigned short, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13minB8ne200100ItNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !164, file: !5352, line: 29, type: !6792, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !6794, retainedNodes: !1605)
!6792 = !DISubroutineType(types: !6793)
!6793 = !{!5907, !5907, !5907, !6753}
!6794 = !{!5910, !6759}
!6795 = !DILocalVariable(name: "__a", arg: 1, scope: !6791, file: !5352, line: 29, type: !5907)
!6796 = !DILocation(line: 29, column: 38, scope: !6791)
!6797 = !DILocalVariable(name: "__b", arg: 2, scope: !6791, file: !5352, line: 29, type: !5907)
!6798 = !DILocation(line: 29, column: 76, scope: !6791)
!6799 = !DILocalVariable(name: "__comp", arg: 3, scope: !6791, file: !5352, line: 29, type: !6753)
!6800 = !DILocation(line: 29, column: 90, scope: !6791)
!6801 = !DILocation(line: 30, column: 17, scope: !6791)
!6802 = !DILocation(line: 30, column: 22, scope: !6791)
!6803 = !DILocation(line: 30, column: 10, scope: !6791)
!6804 = !DILocation(line: 30, column: 29, scope: !6791)
!6805 = !DILocation(line: 30, column: 35, scope: !6791)
!6806 = !DILocation(line: 30, column: 3, scope: !6791)
!6807 = distinct !DISubprogram(name: "operator()<unsigned short, unsigned short>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IttEEbRKT_RKT0_", scope: !6753, file: !6754, line: 40, type: !6808, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !6811, declaration: !6810, retainedNodes: !1605)
!6808 = !DISubroutineType(types: !6809)
!6809 = !{!729, !6775, !5907, !5907}
!6810 = !DISubprogram(name: "operator()<unsigned short, unsigned short>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IttEEbRKT_RKT0_", scope: !6753, file: !6754, line: 40, type: !6808, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !6811)
!6811 = !{!5910, !6812}
!6812 = !DITemplateTypeParameter(name: "_Up", type: !183)
!6813 = !DILocalVariable(name: "this", arg: 1, scope: !6807, type: !6781, flags: DIFlagArtificial | DIFlagObjectPointer)
!6814 = !DILocation(line: 0, scope: !6807)
!6815 = !DILocalVariable(name: "__lhs", arg: 2, scope: !6807, file: !6754, line: 40, type: !5907)
!6816 = !DILocation(line: 40, column: 82, scope: !6807)
!6817 = !DILocalVariable(name: "__rhs", arg: 3, scope: !6807, file: !6754, line: 40, type: !5907)
!6818 = !DILocation(line: 40, column: 100, scope: !6807)
!6819 = !DILocation(line: 41, column: 12, scope: !6807)
!6820 = !DILocation(line: 41, column: 20, scope: !6807)
!6821 = !DILocation(line: 41, column: 18, scope: !6807)
!6822 = !DILocation(line: 41, column: 5, scope: !6807)
