; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/weapon.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/weapon.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.weapon_info = type { i8, i8, i16, i16, i8, i8, i16, i8, i8, i16, i8, i8, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32, %struct.bitmap_index, i32, i32, i32, [5 x i32], [5 x i32], i32, i32, i32, i32, i32, i32, i32, %struct.bitmap_index, %struct.bitmap_index }
%struct.bitmap_index = type { i16 }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%"class.std::__1::vector" = type { ptr, ptr, ptr }
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
%struct.powerup_type_info = type { i32, i32, i32, i32 }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.newmenu_item = type { i32, i32, i32, i32, i32, i32, ptr, i16, i16, i16, i16, i16, i8, [51 x i8] }
%struct.fvi_query = type { ptr, ptr, i32, i32, i16, ptr, i32 }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }
%struct.vclip_info_s = type { i32, i32, i8 }
%struct.powerup_info_s = type { i32, i32, i32 }

@Primary_weapon_to_weapon_info = global [10 x i8] c"\00\0B\0C\0D\0E\1E !\22#", align 1, !dbg !0
@Secondary_weapon_to_weapon_info = global [10 x i8] c"\08\0F\10\11\12$%&'(", align 1, !dbg !20
@Secondary_weapon_to_gun_num = global [10 x i8] c"\04\04\07\07\07\04\04\07\04\07", align 1, !dbg !29
@Primary_ammo_max = global [10 x i32] [i32 0, i32 1568, i32 0, i32 0, i32 0, i32 0, i32 1568, i32 0, i32 0, i32 0], align 4, !dbg !31
@Secondary_ammo_max = global [10 x i8] c"\14\0A\0A\05\05\14\14\0F\0A\0A", align 1, !dbg !34
@Primary_weapon_to_powerup = global [10 x i8] c"\03\0D\0E\0F\10\03\1C\1D\1E\1F", align 1, !dbg !36
@Secondary_weapon_to_powerup = global [10 x i8] c"\0A\12\11\14\15&(*+-", align 1, !dbg !38
@Weapon_info = global [70 x %struct.weapon_info] zeroinitializer, align 4, !dbg !40
@N_weapon_types = global i32 0, align 4, !dbg !108
@Primary_weapon = global i8 0, align 1, !dbg !110
@Secondary_weapon = global i8 0, align 1, !dbg !112
@PrimaryOrder = global [11 x i8] c"\09\08\07\06\05\04\03\02\01\00\FF", align 1, !dbg !114
@SecondaryOrder = global [11 x i8] c"\09\08\04\03\01\05\00\FF\07\06\02", align 1, !dbg !119
@DefaultPrimaryOrder = global [11 x i8] c"\09\08\07\06\05\04\03\02\01\00\FF", align 1, !dbg !121
@DefaultSecondaryOrder = global [11 x i8] c"\09\08\04\03\01\05\00\FF\07\06\02", align 1, !dbg !123
@Cycling = global i8 0, align 1, !dbg !125
@Weapon_is_energy = global <{ [36 x i8], [34 x i8] }> <{ [36 x i8] c"\01\01\01\01\01\01\01\01\00\01\01\00\01\01\01\00\01\00\00\01\01\00\00\01\01\01\01\01\00\01\01\01\00\01\01\01", [34 x i8] zeroinitializer }>, align 1, !dbg !127
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Omega_charge = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Cycling primary!\0A\00", align 1, !dbg !130
@.str.1 = private unnamed_addr constant [20 x i8] c"Cycling secondary!\0A\00", align 1, !dbg !136
@Newdemo_state = external global i32, align 4
@GameTime = external global i32, align 4
@Next_laser_fire_time = external global i32, align 4
@Global_laser_firing_count = external global i32, align 4
@Text_string = external global %"class.std::__1::vector", align 8
@Primary_last_was_super = global [10 x i8] zeroinitializer, align 1, !dbg !151
@Next_missile_fire_time = external global i32, align 4
@Global_missile_firing_count = external global i32, align 4
@Secondary_last_was_super = global [10 x i8] zeroinitializer, align 1, !dbg !153
@.str.2 = private unnamed_addr constant [15 x i8] c"%s Level %d %s\00", align 1, !dbg !141
@.str.3 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1, !dbg !146
@.str.4 = private unnamed_addr constant [7 x i8] c"%s %s!\00", align 1, !dbg !155
@.str.5 = private unnamed_addr constant [8 x i8] c"%s %s%s\00", align 1, !dbg !160
@.str.6 = private unnamed_addr constant [17 x i8] c"weapon_type == 1\00", align 1, !dbg !165
@.str.7 = private unnamed_addr constant [56 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/weapon.cpp\00", align 1, !dbg !170
@.str.8 = private unnamed_addr constant [31 x i8] c"No secondary weapons selected!\00", align 1, !dbg !175
@.str.9 = private unnamed_addr constant [32 x i8] c"No secondary weapons available!\00", align 1, !dbg !180
@.str.10 = private unnamed_addr constant [5 x i8] c"HAVE\00", align 1, !dbg !185
@.str.11 = private unnamed_addr constant [5 x i8] c"    \00", align 1, !dbg !188
@.str.12 = private unnamed_addr constant [30 x i8] c"  Weapon: %20s, charges: %4i\0A\00", align 1, !dbg !190
@.str.13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !dbg !195
@.str.14 = private unnamed_addr constant [11 x i8] c"%s %i %ss!\00", align 1, !dbg !200
@.str.15 = private unnamed_addr constant [8 x i8] c"%d %s%s\00", align 1, !dbg !203
@.str.16 = private unnamed_addr constant [4 x i8] c"%s!\00", align 1, !dbg !205
@.str.17 = private unnamed_addr constant [61 x i8] c"\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD Never autoselect \EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\EF\BF\BD\00", align 1, !dbg !210
@MenuReordering = external global i8, align 1
@.str.18 = private unnamed_addr constant [16 x i8] c"Reorder Primary\00", align 1, !dbg !215
@.str.19 = private unnamed_addr constant [33 x i8] c"Shift+Up/Down arrow to move item\00", align 1, !dbg !220
@.str.20 = private unnamed_addr constant [18 x i8] c"Reorder Secondary\00", align 1, !dbg !225
@.str.21 = private unnamed_addr constant [32 x i8] c"Primary %d has priority of %d!\0A\00", align 1, !dbg !227
@.str.22 = private unnamed_addr constant [39 x i8] c"Primary Weapon is not in order list!!!\00", align 1, !dbg !229
@.str.23 = private unnamed_addr constant [34 x i8] c"Secondary %d has priority of %d!\0A\00", align 1, !dbg !234
@.str.24 = private unnamed_addr constant [25 x i8] c"Error! Secondary Num=%d\0A\00", align 1, !dbg !239
@.str.25 = private unnamed_addr constant [41 x i8] c"Secondary Weapon is not in order list!!!\00", align 1, !dbg !244
@.str.26 = private unnamed_addr constant [18 x i8] c"Weapon index: %d\0A\00", align 1, !dbg !249
@.str.27 = private unnamed_addr constant [60 x i8] c"class_flag == CLASS_PRIMARY && weapon_index == VULCAN_INDEX\00", align 1, !dbg !251
@Smega_detonate_times = global [4 x i32] zeroinitializer, align 4, !dbg !256
@Seismic_tremor_magnitude = global i32 0, align 4, !dbg !259
@Next_seismic_sound_time = global i32 0, align 4, !dbg !261
@Seismic_sound_playing = global i32 0, align 4, !dbg !263
@Seismic_tremor_volume = global i32 0, align 4, !dbg !265
@Seismic_sound = global i32 251, align 4, !dbg !267
@ConsoleObject = external global ptr, align 8
@Buddy_objnum = external global i32, align 4
@Objects = external global [0 x %struct.object], align 4
@Seismic_disturbance_start_time = global i32 0, align 4, !dbg !269
@Seismic_disturbance_end_time = global i32 0, align 4, !dbg !271
@Seismic_level = global i32 0, align 4, !dbg !273
@Level_shake_duration = external global i32, align 4
@Level_shake_frequency = external global i32, align 4
@FrameTime = external global i32, align 4
@Super_mines_yes = global i32 1, align 4, !dbg !275
@FrameCount = external global i32, align 4
@Highest_object_index = external global i32, align 4
@.str.28 = private unnamed_addr constant [47 x i8] c"Expensive proxmine collision check.  Frame %i\0A\00", align 1, !dbg !277
@CurrentLogicVersion = external global i32, align 4
@Game_mode = external global i32, align 4
@vmd_identity_matrix = external global %struct.vms_matrix, align 4
@Powerup_info = external global [50 x %struct.powerup_type_info], align 4
@.str.29 = private unnamed_addr constant [54 x i8] c"Can't create object in object_create_egg.  Aborting.\0A\00", align 1, !dbg !282
@Vclip = external global [110 x %struct.vclip], align 4
@.str.30 = private unnamed_addr constant [34 x i8] c"You cannot drop your base weapon!\00", align 1, !dbg !287
@.str.31 = private unnamed_addr constant [12 x i8] c"%s dropped!\00", align 1, !dbg !289
@.str.32 = private unnamed_addr constant [29 x i8] c"No secondary weapon to drop!\00", align 1, !dbg !294
@.str.33 = private unnamed_addr constant [29 x i8] c"You need at least 4 to drop!\00", align 1, !dbg !299
@tactile_fire_duration = global [10 x i32] [i32 120, i32 80, i32 150, i32 250, i32 150, i32 200, i32 100, i32 180, i32 280, i32 100], align 4, !dbg !301
@tactile_fire_repeat = global [10 x i32] [i32 260, i32 90, i32 160, i32 160, i32 160, i32 210, i32 110, i32 191, i32 291, i32 111], align 4, !dbg !303

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z17player_has_weaponii(i32 noundef %0, i32 noundef %1) #0 !dbg !1600 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !1604, !DIExpression(), !1605)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1606, !DIExpression(), !1607)
  %7 = load i32, ptr @Player_num, align 4, !dbg !1608
  %8 = sext i32 %7 to i64, !dbg !1610
  %9 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %8, !dbg !1610
  %10 = getelementptr inbounds nuw %struct.player, ptr %9, i32 0, i32 8, !dbg !1611
  %11 = load i32, ptr %10, align 4, !dbg !1611
  %12 = icmp slt i32 %11, 0, !dbg !1612
  br i1 %12, label %13, label %18, !dbg !1612

13:                                               ; preds = %2
  %14 = load i32, ptr @Player_num, align 4, !dbg !1613
  %15 = sext i32 %14 to i64, !dbg !1614
  %16 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %15, !dbg !1614
  %17 = getelementptr inbounds nuw %struct.player, ptr %16, i32 0, i32 8, !dbg !1615
  store i32 0, ptr %17, align 4, !dbg !1616
  br label %18, !dbg !1614

18:                                               ; preds = %13, %2
    #dbg_declare(ptr %5, !1617, !DIExpression(), !1619)
  store i32 0, ptr %5, align 4, !dbg !1619
    #dbg_declare(ptr %6, !1620, !DIExpression(), !1621)
  %19 = load i32, ptr %4, align 4, !dbg !1622
  %20 = icmp ne i32 %19, 0, !dbg !1622
  br i1 %20, label %117, label %21, !dbg !1624

21:                                               ; preds = %18
  %22 = load i32, ptr %3, align 4, !dbg !1625
  %23 = sext i32 %22 to i64, !dbg !1627
  %24 = getelementptr inbounds [10 x i8], ptr @Primary_weapon_to_weapon_info, i64 0, i64 %23, !dbg !1627
  %25 = load i8, ptr %24, align 1, !dbg !1627
  %26 = zext i8 %25 to i32, !dbg !1627
  store i32 %26, ptr %6, align 4, !dbg !1628
  %27 = load i32, ptr @Player_num, align 4, !dbg !1629
  %28 = sext i32 %27 to i64, !dbg !1631
  %29 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %28, !dbg !1631
  %30 = getelementptr inbounds nuw %struct.player, ptr %29, i32 0, i32 15, !dbg !1632
  %31 = load i16, ptr %30, align 2, !dbg !1632
  %32 = zext i16 %31 to i32, !dbg !1631
  %33 = load i32, ptr %3, align 4, !dbg !1633
  %34 = shl i32 1, %33, !dbg !1634
  %35 = and i32 %32, %34, !dbg !1635
  %36 = icmp ne i32 %35, 0, !dbg !1631
  br i1 %36, label %37, label %40, !dbg !1631

37:                                               ; preds = %21
  %38 = load i32, ptr %5, align 4, !dbg !1636
  %39 = or i32 %38, 1, !dbg !1636
  store i32 %39, ptr %5, align 4, !dbg !1636
  br label %40, !dbg !1637

40:                                               ; preds = %37, %21
  %41 = load i32, ptr %3, align 4, !dbg !1638
  %42 = icmp eq i32 %41, 6, !dbg !1640
  br i1 %42, label %43, label %62, !dbg !1640

43:                                               ; preds = %40
  %44 = load i32, ptr %6, align 4, !dbg !1641
  %45 = sext i32 %44 to i64, !dbg !1644
  %46 = getelementptr inbounds [70 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %45, !dbg !1644
  %47 = getelementptr inbounds nuw %struct.weapon_info, ptr %46, i32 0, i32 10, !dbg !1645
  %48 = load i8, ptr %47, align 2, !dbg !1645
  %49 = sext i8 %48 to i32, !dbg !1644
  %50 = load i32, ptr @Player_num, align 4, !dbg !1646
  %51 = sext i32 %50 to i64, !dbg !1647
  %52 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %51, !dbg !1647
  %53 = getelementptr inbounds nuw %struct.player, ptr %52, i32 0, i32 17, !dbg !1648
  %54 = getelementptr inbounds [10 x i16], ptr %53, i64 0, i64 1, !dbg !1647
  %55 = load i16, ptr %54, align 2, !dbg !1647
  %56 = zext i16 %55 to i32, !dbg !1647
  %57 = icmp sle i32 %49, %56, !dbg !1649
  br i1 %57, label %58, label %61, !dbg !1649

58:                                               ; preds = %43
  %59 = load i32, ptr %5, align 4, !dbg !1650
  %60 = or i32 %59, 4, !dbg !1650
  store i32 %60, ptr %5, align 4, !dbg !1650
  br label %61, !dbg !1651

61:                                               ; preds = %58, %43
  br label %83, !dbg !1652

62:                                               ; preds = %40
  %63 = load i32, ptr %6, align 4, !dbg !1653
  %64 = sext i32 %63 to i64, !dbg !1655
  %65 = getelementptr inbounds [70 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %64, !dbg !1655
  %66 = getelementptr inbounds nuw %struct.weapon_info, ptr %65, i32 0, i32 10, !dbg !1656
  %67 = load i8, ptr %66, align 2, !dbg !1656
  %68 = sext i8 %67 to i32, !dbg !1655
  %69 = load i32, ptr @Player_num, align 4, !dbg !1657
  %70 = sext i32 %69 to i64, !dbg !1658
  %71 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %70, !dbg !1658
  %72 = getelementptr inbounds nuw %struct.player, ptr %71, i32 0, i32 17, !dbg !1659
  %73 = load i32, ptr %3, align 4, !dbg !1660
  %74 = sext i32 %73 to i64, !dbg !1658
  %75 = getelementptr inbounds [10 x i16], ptr %72, i64 0, i64 %74, !dbg !1658
  %76 = load i16, ptr %75, align 2, !dbg !1658
  %77 = zext i16 %76 to i32, !dbg !1658
  %78 = icmp sle i32 %68, %77, !dbg !1661
  br i1 %78, label %79, label %82, !dbg !1661

79:                                               ; preds = %62
  %80 = load i32, ptr %5, align 4, !dbg !1662
  %81 = or i32 %80, 4, !dbg !1662
  store i32 %81, ptr %5, align 4, !dbg !1662
  br label %82, !dbg !1663

82:                                               ; preds = %79, %62
  br label %83

83:                                               ; preds = %82, %61
  %84 = load i32, ptr %3, align 4, !dbg !1664
  %85 = icmp eq i32 %84, 9, !dbg !1666
  br i1 %85, label %86, label %100, !dbg !1666

86:                                               ; preds = %83
  %87 = load i32, ptr @Player_num, align 4, !dbg !1667
  %88 = sext i32 %87 to i64, !dbg !1670
  %89 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %88, !dbg !1670
  %90 = getelementptr inbounds nuw %struct.player, ptr %89, i32 0, i32 8, !dbg !1671
  %91 = load i32, ptr %90, align 4, !dbg !1671
  %92 = icmp ne i32 %91, 0, !dbg !1670
  br i1 %92, label %96, label %93, !dbg !1672

93:                                               ; preds = %86
  %94 = load i32, ptr @Omega_charge, align 4, !dbg !1673
  %95 = icmp ne i32 %94, 0, !dbg !1673
  br i1 %95, label %96, label %99, !dbg !1672

96:                                               ; preds = %93, %86
  %97 = load i32, ptr %5, align 4, !dbg !1674
  %98 = or i32 %97, 2, !dbg !1674
  store i32 %98, ptr %5, align 4, !dbg !1674
  br label %99, !dbg !1675

99:                                               ; preds = %96, %93
  br label %116, !dbg !1676

100:                                              ; preds = %83
  %101 = load i32, ptr %6, align 4, !dbg !1677
  %102 = sext i32 %101 to i64, !dbg !1679
  %103 = getelementptr inbounds [70 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %102, !dbg !1679
  %104 = getelementptr inbounds nuw %struct.weapon_info, ptr %103, i32 0, i32 22, !dbg !1680
  %105 = load i32, ptr %104, align 4, !dbg !1680
  %106 = load i32, ptr @Player_num, align 4, !dbg !1681
  %107 = sext i32 %106 to i64, !dbg !1682
  %108 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %107, !dbg !1682
  %109 = getelementptr inbounds nuw %struct.player, ptr %108, i32 0, i32 8, !dbg !1683
  %110 = load i32, ptr %109, align 4, !dbg !1683
  %111 = icmp sle i32 %105, %110, !dbg !1684
  br i1 %111, label %112, label %115, !dbg !1684

112:                                              ; preds = %100
  %113 = load i32, ptr %5, align 4, !dbg !1685
  %114 = or i32 %113, 2, !dbg !1685
  store i32 %114, ptr %5, align 4, !dbg !1685
  br label %115, !dbg !1686

115:                                              ; preds = %112, %100
  br label %116

116:                                              ; preds = %115, %99
  br label %172, !dbg !1687

117:                                              ; preds = %18
  %118 = load i32, ptr %3, align 4, !dbg !1688
  %119 = sext i32 %118 to i64, !dbg !1690
  %120 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_weapon_info, i64 0, i64 %119, !dbg !1690
  %121 = load i8, ptr %120, align 1, !dbg !1690
  %122 = zext i8 %121 to i32, !dbg !1690
  store i32 %122, ptr %6, align 4, !dbg !1691
  %123 = load i32, ptr @Player_num, align 4, !dbg !1692
  %124 = sext i32 %123 to i64, !dbg !1694
  %125 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %124, !dbg !1694
  %126 = getelementptr inbounds nuw %struct.player, ptr %125, i32 0, i32 16, !dbg !1695
  %127 = load i16, ptr %126, align 4, !dbg !1695
  %128 = zext i16 %127 to i32, !dbg !1694
  %129 = load i32, ptr %3, align 4, !dbg !1696
  %130 = shl i32 1, %129, !dbg !1697
  %131 = and i32 %128, %130, !dbg !1698
  %132 = icmp ne i32 %131, 0, !dbg !1694
  br i1 %132, label %133, label %136, !dbg !1694

133:                                              ; preds = %117
  %134 = load i32, ptr %5, align 4, !dbg !1699
  %135 = or i32 %134, 1, !dbg !1699
  store i32 %135, ptr %5, align 4, !dbg !1699
  br label %136, !dbg !1700

136:                                              ; preds = %133, %117
  %137 = load i32, ptr %6, align 4, !dbg !1701
  %138 = sext i32 %137 to i64, !dbg !1703
  %139 = getelementptr inbounds [70 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %138, !dbg !1703
  %140 = getelementptr inbounds nuw %struct.weapon_info, ptr %139, i32 0, i32 10, !dbg !1704
  %141 = load i8, ptr %140, align 2, !dbg !1704
  %142 = sext i8 %141 to i32, !dbg !1703
  %143 = load i32, ptr @Player_num, align 4, !dbg !1705
  %144 = sext i32 %143 to i64, !dbg !1706
  %145 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %144, !dbg !1706
  %146 = getelementptr inbounds nuw %struct.player, ptr %145, i32 0, i32 18, !dbg !1707
  %147 = load i32, ptr %3, align 4, !dbg !1708
  %148 = sext i32 %147 to i64, !dbg !1706
  %149 = getelementptr inbounds [10 x i16], ptr %146, i64 0, i64 %148, !dbg !1706
  %150 = load i16, ptr %149, align 2, !dbg !1706
  %151 = zext i16 %150 to i32, !dbg !1706
  %152 = icmp sle i32 %142, %151, !dbg !1709
  br i1 %152, label %153, label %156, !dbg !1709

153:                                              ; preds = %136
  %154 = load i32, ptr %5, align 4, !dbg !1710
  %155 = or i32 %154, 4, !dbg !1710
  store i32 %155, ptr %5, align 4, !dbg !1710
  br label %156, !dbg !1711

156:                                              ; preds = %153, %136
  %157 = load i32, ptr %6, align 4, !dbg !1712
  %158 = sext i32 %157 to i64, !dbg !1714
  %159 = getelementptr inbounds [70 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %158, !dbg !1714
  %160 = getelementptr inbounds nuw %struct.weapon_info, ptr %159, i32 0, i32 22, !dbg !1715
  %161 = load i32, ptr %160, align 4, !dbg !1715
  %162 = load i32, ptr @Player_num, align 4, !dbg !1716
  %163 = sext i32 %162 to i64, !dbg !1717
  %164 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %163, !dbg !1717
  %165 = getelementptr inbounds nuw %struct.player, ptr %164, i32 0, i32 8, !dbg !1718
  %166 = load i32, ptr %165, align 4, !dbg !1718
  %167 = icmp sle i32 %161, %166, !dbg !1719
  br i1 %167, label %168, label %171, !dbg !1719

168:                                              ; preds = %156
  %169 = load i32, ptr %5, align 4, !dbg !1720
  %170 = or i32 %169, 2, !dbg !1720
  store i32 %170, ptr %5, align 4, !dbg !1720
  br label %171, !dbg !1721

171:                                              ; preds = %168, %156
  br label %172

172:                                              ; preds = %171, %116
  %173 = load i32, ptr %5, align 4, !dbg !1722
  ret i32 %173, !dbg !1723
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z18InitWeaponOrderingv() #0 !dbg !1724 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1725, !DIExpression(), !1726)
  store i32 0, ptr %1, align 4, !dbg !1727
  br label %2, !dbg !1729

2:                                                ; preds = %13, %0
  %3 = load i32, ptr %1, align 4, !dbg !1730
  %4 = icmp slt i32 %3, 11, !dbg !1732
  br i1 %4, label %5, label %16, !dbg !1733

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !1734
  %7 = sext i32 %6 to i64, !dbg !1735
  %8 = getelementptr inbounds [11 x i8], ptr @DefaultPrimaryOrder, i64 0, i64 %7, !dbg !1735
  %9 = load i8, ptr %8, align 1, !dbg !1735
  %10 = load i32, ptr %1, align 4, !dbg !1736
  %11 = sext i32 %10 to i64, !dbg !1737
  %12 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %11, !dbg !1737
  store i8 %9, ptr %12, align 1, !dbg !1738
  br label %13, !dbg !1737

13:                                               ; preds = %5
  %14 = load i32, ptr %1, align 4, !dbg !1739
  %15 = add nsw i32 %14, 1, !dbg !1739
  store i32 %15, ptr %1, align 4, !dbg !1739
  br label %2, !dbg !1740, !llvm.loop !1741

16:                                               ; preds = %2
  store i32 0, ptr %1, align 4, !dbg !1744
  br label %17, !dbg !1746

17:                                               ; preds = %28, %16
  %18 = load i32, ptr %1, align 4, !dbg !1747
  %19 = icmp slt i32 %18, 11, !dbg !1749
  br i1 %19, label %20, label %31, !dbg !1750

20:                                               ; preds = %17
  %21 = load i32, ptr %1, align 4, !dbg !1751
  %22 = sext i32 %21 to i64, !dbg !1752
  %23 = getelementptr inbounds [11 x i8], ptr @DefaultSecondaryOrder, i64 0, i64 %22, !dbg !1752
  %24 = load i8, ptr %23, align 1, !dbg !1752
  %25 = load i32, ptr %1, align 4, !dbg !1753
  %26 = sext i32 %25 to i64, !dbg !1754
  %27 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %26, !dbg !1754
  store i8 %24, ptr %27, align 1, !dbg !1755
  br label %28, !dbg !1754

28:                                               ; preds = %20
  %29 = load i32, ptr %1, align 4, !dbg !1756
  %30 = add nsw i32 %29, 1, !dbg !1756
  store i32 %30, ptr %1, align 4, !dbg !1756
  br label %17, !dbg !1757, !llvm.loop !1758

31:                                               ; preds = %17
  ret void, !dbg !1760
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12CyclePrimaryv() #1 !dbg !1761 {
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str), !dbg !1762
  store i8 1, ptr @Cycling, align 1, !dbg !1763
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !1764
  store i8 0, ptr @Cycling, align 1, !dbg !1765
  ret void, !dbg !1766
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18auto_select_weaponi(i32 noundef %0) #1 !dbg !1767 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !1768, !DIExpression(), !1769)
    #dbg_declare(ptr %3, !1770, !DIExpression(), !1771)
    #dbg_declare(ptr %4, !1772, !DIExpression(), !1773)
    #dbg_declare(ptr %5, !1774, !DIExpression(), !1775)
  store i32 0, ptr %5, align 4, !dbg !1775
  %10 = load i32, ptr %2, align 4, !dbg !1776
  %11 = icmp eq i32 %10, 0, !dbg !1778
  br i1 %11, label %12, label %100, !dbg !1778

12:                                               ; preds = %1
  %13 = load i8, ptr @Primary_weapon, align 1, !dbg !1779
  %14 = sext i8 %13 to i32, !dbg !1779
  %15 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %14, i32 noundef 0), !dbg !1781
  store i32 %15, ptr %3, align 4, !dbg !1782
  %16 = load i32, ptr %3, align 4, !dbg !1783
  %17 = icmp ne i32 %16, 7, !dbg !1785
  br i1 %17, label %21, label %18, !dbg !1786

18:                                               ; preds = %12
  %19 = load i8, ptr @Cycling, align 1, !dbg !1787
  %20 = icmp ne i8 %19, 0, !dbg !1787
  br i1 %20, label %21, label %99, !dbg !1786

21:                                               ; preds = %18, %12
    #dbg_declare(ptr %6, !1788, !DIExpression(), !1790)
    #dbg_declare(ptr %7, !1791, !DIExpression(), !1792)
  store i32 1, ptr %7, align 4, !dbg !1792
  %22 = load i8, ptr @Primary_weapon, align 1, !dbg !1793
  %23 = sext i8 %22 to i32, !dbg !1793
  %24 = call noundef i32 @_Z10POrderListi(i32 noundef %23), !dbg !1794
  store i32 %24, ptr %6, align 4, !dbg !1795
  %25 = call noundef i32 @_Z10POrderListi(i32 noundef 255), !dbg !1796
  store i32 %25, ptr %4, align 4, !dbg !1797
  br label %26, !dbg !1798

26:                                               ; preds = %49, %21
  %27 = load i32, ptr %7, align 4, !dbg !1799
  %28 = icmp ne i32 %27, 0, !dbg !1799
  br i1 %28, label %29, label %98, !dbg !1798

29:                                               ; preds = %26
  %30 = load i32, ptr %6, align 4, !dbg !1800
  %31 = add nsw i32 %30, 1, !dbg !1800
  store i32 %31, ptr %6, align 4, !dbg !1800
  %32 = load i32, ptr %6, align 4, !dbg !1802
  %33 = load i32, ptr %4, align 4, !dbg !1804
  %34 = icmp sge i32 %32, %33, !dbg !1805
  br i1 %34, label %35, label %51, !dbg !1805

35:                                               ; preds = %29
  %36 = load i32, ptr %5, align 4, !dbg !1806
  %37 = icmp ne i32 %36, 0, !dbg !1806
  br i1 %37, label %38, label %50, !dbg !1806

38:                                               ; preds = %35
  %39 = load i8, ptr @Cycling, align 1, !dbg !1809
  %40 = icmp ne i8 %39, 0, !dbg !1809
  br i1 %40, label %45, label %41, !dbg !1812

41:                                               ; preds = %38
  %42 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 150) #5, !dbg !1813
  %43 = load ptr, ptr %42, align 8, !dbg !1813
  %44 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %43), !dbg !1815
  call void @_Z13select_weaponiiii(i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !1816
  br label %48, !dbg !1817

45:                                               ; preds = %38
  %46 = load i8, ptr @Primary_weapon, align 1, !dbg !1818
  %47 = sext i8 %46 to i32, !dbg !1818
  call void @_Z13select_weaponiiii(i32 noundef %47, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !1819
  br label %48

48:                                               ; preds = %45, %41
  store i32 0, ptr %7, align 4, !dbg !1820
  br label %49, !dbg !1821

49:                                               ; preds = %48, %97
  br label %26, !dbg !1799, !llvm.loop !1822

50:                                               ; preds = %35
  store i32 0, ptr %6, align 4, !dbg !1824
  store i32 1, ptr %5, align 4, !dbg !1825
  br label %51, !dbg !1826

51:                                               ; preds = %50, %29
  %52 = load i32, ptr %6, align 4, !dbg !1827
  %53 = icmp eq i32 %52, 10, !dbg !1829
  br i1 %53, label %54, label %55, !dbg !1829

54:                                               ; preds = %51
  store i32 0, ptr %6, align 4, !dbg !1830
  br label %55, !dbg !1831

55:                                               ; preds = %54, %51
  %56 = load i32, ptr %6, align 4, !dbg !1832
  %57 = sext i32 %56 to i64, !dbg !1834
  %58 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %57, !dbg !1834
  %59 = load i8, ptr %58, align 1, !dbg !1834
  %60 = zext i8 %59 to i32, !dbg !1834
  %61 = load i8, ptr @Primary_weapon, align 1, !dbg !1835
  %62 = sext i8 %61 to i32, !dbg !1835
  %63 = icmp eq i32 %60, %62, !dbg !1836
  br i1 %63, label %64, label %75, !dbg !1836

64:                                               ; preds = %55
  %65 = load i8, ptr @Cycling, align 1, !dbg !1837
  %66 = icmp ne i8 %65, 0, !dbg !1837
  br i1 %66, label %71, label %67, !dbg !1840

67:                                               ; preds = %64
  %68 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 150) #5, !dbg !1841
  %69 = load ptr, ptr %68, align 8, !dbg !1841
  %70 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %69), !dbg !1843
  call void @_Z13select_weaponiiii(i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !1844
  br label %74, !dbg !1845

71:                                               ; preds = %64
  %72 = load i8, ptr @Primary_weapon, align 1, !dbg !1846
  %73 = sext i8 %72 to i32, !dbg !1846
  call void @_Z13select_weaponiiii(i32 noundef %73, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !1847
  br label %74

74:                                               ; preds = %71, %67
  store i32 0, ptr %7, align 4, !dbg !1848
  br label %97, !dbg !1849

75:                                               ; preds = %55
  %76 = load i32, ptr %6, align 4, !dbg !1850
  %77 = sext i32 %76 to i64, !dbg !1852
  %78 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %77, !dbg !1852
  %79 = load i8, ptr %78, align 1, !dbg !1852
  %80 = zext i8 %79 to i32, !dbg !1852
  %81 = icmp ne i32 %80, 255, !dbg !1853
  br i1 %81, label %82, label %96, !dbg !1854

82:                                               ; preds = %75
  %83 = load i32, ptr %6, align 4, !dbg !1855
  %84 = sext i32 %83 to i64, !dbg !1856
  %85 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %84, !dbg !1856
  %86 = load i8, ptr %85, align 1, !dbg !1856
  %87 = zext i8 %86 to i32, !dbg !1856
  %88 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %87, i32 noundef 0), !dbg !1857
  %89 = icmp eq i32 %88, 7, !dbg !1858
  br i1 %89, label %90, label %96, !dbg !1854

90:                                               ; preds = %82
  %91 = load i32, ptr %6, align 4, !dbg !1859
  %92 = sext i32 %91 to i64, !dbg !1861
  %93 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %92, !dbg !1861
  %94 = load i8, ptr %93, align 1, !dbg !1861
  %95 = zext i8 %94 to i32, !dbg !1861
  call void @_Z13select_weaponiiii(i32 noundef %95, i32 noundef 0, i32 noundef 1, i32 noundef 1), !dbg !1862
  store i32 0, ptr %7, align 4, !dbg !1863
  br label %96, !dbg !1864

96:                                               ; preds = %90, %82, %75
  br label %97

97:                                               ; preds = %96, %74
  br label %49, !dbg !1798

98:                                               ; preds = %26
  br label %99, !dbg !1865

99:                                               ; preds = %98, %18
  br label %180, !dbg !1866

100:                                              ; preds = %1
  %101 = load i32, ptr %2, align 4, !dbg !1867
  %102 = icmp eq i32 %101, 1, !dbg !1867
  %103 = zext i1 %102 to i32, !dbg !1867
  call void @_Z7_AssertiPKcS0_i(i32 noundef %103, ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 525), !dbg !1867
  %104 = load i8, ptr @Secondary_weapon, align 1, !dbg !1869
  %105 = sext i8 %104 to i32, !dbg !1869
  %106 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %105, i32 noundef 1), !dbg !1870
  store i32 %106, ptr %3, align 4, !dbg !1871
  %107 = load i32, ptr %3, align 4, !dbg !1872
  %108 = icmp ne i32 %107, 7, !dbg !1874
  br i1 %108, label %112, label %109, !dbg !1875

109:                                              ; preds = %100
  %110 = load i8, ptr @Cycling, align 1, !dbg !1876
  %111 = icmp ne i8 %110, 0, !dbg !1876
  br i1 %111, label %112, label %179, !dbg !1875

112:                                              ; preds = %109, %100
    #dbg_declare(ptr %8, !1877, !DIExpression(), !1879)
    #dbg_declare(ptr %9, !1880, !DIExpression(), !1881)
  store i32 1, ptr %9, align 4, !dbg !1881
  %113 = load i8, ptr @Secondary_weapon, align 1, !dbg !1882
  %114 = sext i8 %113 to i32, !dbg !1882
  %115 = call noundef i32 @_Z10SOrderListi(i32 noundef %114), !dbg !1883
  store i32 %115, ptr %8, align 4, !dbg !1884
  %116 = call noundef i32 @_Z10SOrderListi(i32 noundef 255), !dbg !1885
  store i32 %116, ptr %4, align 4, !dbg !1886
  br label %117, !dbg !1887

117:                                              ; preds = %138, %112
  %118 = load i32, ptr %9, align 4, !dbg !1888
  %119 = icmp ne i32 %118, 0, !dbg !1888
  br i1 %119, label %120, label %178, !dbg !1887

120:                                              ; preds = %117
  %121 = load i32, ptr %8, align 4, !dbg !1889
  %122 = add nsw i32 %121, 1, !dbg !1889
  store i32 %122, ptr %8, align 4, !dbg !1889
  %123 = load i32, ptr %8, align 4, !dbg !1891
  %124 = load i32, ptr %4, align 4, !dbg !1893
  %125 = icmp sge i32 %123, %124, !dbg !1894
  br i1 %125, label %126, label %140, !dbg !1894

126:                                              ; preds = %120
  %127 = load i32, ptr %5, align 4, !dbg !1895
  %128 = icmp ne i32 %127, 0, !dbg !1895
  br i1 %128, label %129, label %139, !dbg !1895

129:                                              ; preds = %126
  %130 = load i8, ptr @Cycling, align 1, !dbg !1898
  %131 = icmp ne i8 %130, 0, !dbg !1898
  br i1 %131, label %134, label %132, !dbg !1901

132:                                              ; preds = %129
  %133 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.8), !dbg !1902
  br label %137, !dbg !1902

134:                                              ; preds = %129
  %135 = load i8, ptr @Secondary_weapon, align 1, !dbg !1903
  %136 = sext i8 %135 to i32, !dbg !1903
  call void @_Z13select_weaponiiii(i32 noundef %136, i32 noundef 1, i32 noundef 0, i32 noundef 1), !dbg !1904
  br label %137

137:                                              ; preds = %134, %132
  store i32 0, ptr %9, align 4, !dbg !1905
  br label %138, !dbg !1906

138:                                              ; preds = %137, %177
  br label %117, !dbg !1888, !llvm.loop !1907

139:                                              ; preds = %126
  store i32 0, ptr %8, align 4, !dbg !1909
  store i32 1, ptr %5, align 4, !dbg !1910
  br label %140, !dbg !1911

140:                                              ; preds = %139, %120
  %141 = load i32, ptr %8, align 4, !dbg !1912
  %142 = icmp eq i32 %141, 10, !dbg !1914
  br i1 %142, label %143, label %144, !dbg !1914

143:                                              ; preds = %140
  store i32 0, ptr %8, align 4, !dbg !1915
  br label %144, !dbg !1916

144:                                              ; preds = %143, %140
  %145 = load i32, ptr %8, align 4, !dbg !1917
  %146 = sext i32 %145 to i64, !dbg !1919
  %147 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %146, !dbg !1919
  %148 = load i8, ptr %147, align 1, !dbg !1919
  %149 = zext i8 %148 to i32, !dbg !1919
  %150 = load i8, ptr @Secondary_weapon, align 1, !dbg !1920
  %151 = sext i8 %150 to i32, !dbg !1920
  %152 = icmp eq i32 %149, %151, !dbg !1921
  br i1 %152, label %153, label %162, !dbg !1921

153:                                              ; preds = %144
  %154 = load i8, ptr @Cycling, align 1, !dbg !1922
  %155 = icmp ne i8 %154, 0, !dbg !1922
  br i1 %155, label %158, label %156, !dbg !1925

156:                                              ; preds = %153
  %157 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.9), !dbg !1926
  br label %161, !dbg !1926

158:                                              ; preds = %153
  %159 = load i8, ptr @Secondary_weapon, align 1, !dbg !1927
  %160 = sext i8 %159 to i32, !dbg !1927
  call void @_Z13select_weaponiiii(i32 noundef %160, i32 noundef 1, i32 noundef 0, i32 noundef 1), !dbg !1928
  br label %161

161:                                              ; preds = %158, %156
  store i32 0, ptr %9, align 4, !dbg !1929
  br label %177, !dbg !1930

162:                                              ; preds = %144
  %163 = load i32, ptr %8, align 4, !dbg !1931
  %164 = sext i32 %163 to i64, !dbg !1933
  %165 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %164, !dbg !1933
  %166 = load i8, ptr %165, align 1, !dbg !1933
  %167 = zext i8 %166 to i32, !dbg !1933
  %168 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %167, i32 noundef 1), !dbg !1934
  %169 = icmp eq i32 %168, 7, !dbg !1935
  br i1 %169, label %170, label %176, !dbg !1935

170:                                              ; preds = %162
  %171 = load i32, ptr %8, align 4, !dbg !1936
  %172 = sext i32 %171 to i64, !dbg !1938
  %173 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %172, !dbg !1938
  %174 = load i8, ptr %173, align 1, !dbg !1938
  %175 = zext i8 %174 to i32, !dbg !1938
  call void @_Z13select_weaponiiii(i32 noundef %175, i32 noundef 1, i32 noundef 1, i32 noundef 1), !dbg !1939
  store i32 0, ptr %9, align 4, !dbg !1940
  br label %176, !dbg !1941

176:                                              ; preds = %170, %162
  br label %177

177:                                              ; preds = %176, %161
  br label %138, !dbg !1887

178:                                              ; preds = %117
  br label %179, !dbg !1942

179:                                              ; preds = %178, %109
  br label %180

180:                                              ; preds = %179, %99
  ret void, !dbg !1943
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14CycleSecondaryv() #1 !dbg !1944 {
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.1), !dbg !1945
  store i8 1, ptr @Cycling, align 1, !dbg !1946
  call void @_Z18auto_select_weaponi(i32 noundef 1), !dbg !1947
  store i8 0, ptr @Cycling, align 1, !dbg !1948
  ret void, !dbg !1949
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13select_weaponiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #1 !dbg !1950 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !1953, !DIExpression(), !1954)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !1955, !DIExpression(), !1956)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1957, !DIExpression(), !1958)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1959, !DIExpression(), !1960)
    #dbg_declare(ptr %9, !1961, !DIExpression(), !1962)
  %10 = load i32, ptr @Newdemo_state, align 4, !dbg !1963
  %11 = icmp eq i32 %10, 1, !dbg !1965
  br i1 %11, label %12, label %15, !dbg !1965

12:                                               ; preds = %4
  %13 = load i32, ptr %6, align 4, !dbg !1966
  %14 = load i32, ptr %5, align 4, !dbg !1967
  call void @_Z28newdemo_record_player_weaponii(i32 noundef %13, i32 noundef %14), !dbg !1968
  br label %15, !dbg !1968

15:                                               ; preds = %12, %4
  %16 = load i32, ptr %6, align 4, !dbg !1969
  %17 = icmp ne i32 %16, 0, !dbg !1969
  br i1 %17, label %60, label %18, !dbg !1971

18:                                               ; preds = %15
  %19 = load i8, ptr @Primary_weapon, align 1, !dbg !1972
  %20 = sext i8 %19 to i32, !dbg !1972
  %21 = load i32, ptr %5, align 4, !dbg !1975
  %22 = icmp ne i32 %20, %21, !dbg !1976
  br i1 %22, label %23, label %35, !dbg !1976

23:                                               ; preds = %18
  %24 = load i32, ptr %8, align 4, !dbg !1977
  %25 = icmp ne i32 %24, 0, !dbg !1977
  br i1 %25, label %26, label %27, !dbg !1977

26:                                               ; preds = %23
  call void @_Z21digi_play_sample_onceii(i32 noundef 153, i32 noundef 65536), !dbg !1980
  br label %27, !dbg !1980

27:                                               ; preds = %26, %23
  %28 = load i32, ptr %8, align 4, !dbg !1981
  %29 = icmp ne i32 %28, 0, !dbg !1981
  br i1 %29, label %30, label %33, !dbg !1981

30:                                               ; preds = %27
  %31 = load i32, ptr @GameTime, align 4, !dbg !1983
  %32 = add nsw i32 %31, 65536, !dbg !1984
  store i32 %32, ptr @Next_laser_fire_time, align 4, !dbg !1985
  br label %34, !dbg !1986

33:                                               ; preds = %27
  store i32 0, ptr @Next_laser_fire_time, align 4, !dbg !1987
  br label %34

34:                                               ; preds = %33, %30
  store i32 0, ptr @Global_laser_firing_count, align 4, !dbg !1988
  br label %45, !dbg !1989

35:                                               ; preds = %18
  %36 = load i32, ptr %8, align 4, !dbg !1990
  %37 = icmp ne i32 %36, 0, !dbg !1990
  br i1 %37, label %38, label %44, !dbg !1990

38:                                               ; preds = %35
  %39 = load i8, ptr @Cycling, align 1, !dbg !1993
  %40 = icmp ne i8 %39, 0, !dbg !1993
  br i1 %40, label %42, label %41, !dbg !1995

41:                                               ; preds = %38
  br label %43, !dbg !1995

42:                                               ; preds = %38
  call void @_Z21digi_play_sample_onceii(i32 noundef 156, i32 noundef 65536), !dbg !1996
  br label %43

43:                                               ; preds = %42, %41
  br label %44, !dbg !1993

44:                                               ; preds = %43, %35
  br label %45

45:                                               ; preds = %44, %34
  %46 = load i32, ptr %5, align 4, !dbg !1997
  %47 = trunc i32 %46 to i8, !dbg !1997
  store i8 %47, ptr @Primary_weapon, align 1, !dbg !1998
  %48 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !1999
  %49 = load i32, ptr %5, align 4, !dbg !1999
  %50 = sext i32 %49 to i64, !dbg !1999
  %51 = getelementptr inbounds ptr, ptr %48, i64 %50, !dbg !1999
  %52 = load ptr, ptr %51, align 8, !dbg !1999
  store ptr %52, ptr %9, align 8, !dbg !2000
  %53 = load i32, ptr %5, align 4, !dbg !2001
  %54 = icmp sge i32 %53, 5, !dbg !2002
  %55 = zext i1 %54 to i8, !dbg !2003
  %56 = load i32, ptr %5, align 4, !dbg !2004
  %57 = srem i32 %56, 5, !dbg !2005
  %58 = sext i32 %57 to i64, !dbg !2006
  %59 = getelementptr inbounds [10 x i8], ptr @Primary_last_was_super, i64 0, i64 %58, !dbg !2006
  store i8 %55, ptr %59, align 1, !dbg !2007
  br label %102, !dbg !2008

60:                                               ; preds = %15
  %61 = load i8, ptr @Secondary_weapon, align 1, !dbg !2009
  %62 = sext i8 %61 to i32, !dbg !2009
  %63 = load i32, ptr %5, align 4, !dbg !2012
  %64 = icmp ne i32 %62, %63, !dbg !2013
  br i1 %64, label %65, label %77, !dbg !2013

65:                                               ; preds = %60
  %66 = load i32, ptr %8, align 4, !dbg !2014
  %67 = icmp ne i32 %66, 0, !dbg !2014
  br i1 %67, label %68, label %69, !dbg !2014

68:                                               ; preds = %65
  call void @_Z21digi_play_sample_onceii(i32 noundef 154, i32 noundef 65536), !dbg !2017
  br label %69, !dbg !2017

69:                                               ; preds = %68, %65
  %70 = load i32, ptr %8, align 4, !dbg !2018
  %71 = icmp ne i32 %70, 0, !dbg !2018
  br i1 %71, label %72, label %75, !dbg !2018

72:                                               ; preds = %69
  %73 = load i32, ptr @GameTime, align 4, !dbg !2020
  %74 = add nsw i32 %73, 65536, !dbg !2021
  store i32 %74, ptr @Next_missile_fire_time, align 4, !dbg !2022
  br label %76, !dbg !2023

75:                                               ; preds = %69
  store i32 0, ptr @Next_missile_fire_time, align 4, !dbg !2024
  br label %76

76:                                               ; preds = %75, %72
  store i32 0, ptr @Global_missile_firing_count, align 4, !dbg !2025
  br label %87, !dbg !2026

77:                                               ; preds = %60
  %78 = load i32, ptr %8, align 4, !dbg !2027
  %79 = icmp ne i32 %78, 0, !dbg !2027
  br i1 %79, label %80, label %86, !dbg !2027

80:                                               ; preds = %77
  %81 = load i8, ptr @Cycling, align 1, !dbg !2030
  %82 = icmp ne i8 %81, 0, !dbg !2030
  br i1 %82, label %84, label %83, !dbg !2032

83:                                               ; preds = %80
  call void @_Z21digi_play_sample_onceii(i32 noundef 155, i32 noundef 65536), !dbg !2033
  br label %85, !dbg !2033

84:                                               ; preds = %80
  call void @_Z21digi_play_sample_onceii(i32 noundef 156, i32 noundef 65536), !dbg !2034
  br label %85

85:                                               ; preds = %84, %83
  br label %86, !dbg !2030

86:                                               ; preds = %85, %77
  br label %87

87:                                               ; preds = %86, %76
  %88 = load i32, ptr %5, align 4, !dbg !2035
  %89 = trunc i32 %88 to i8, !dbg !2035
  store i8 %89, ptr @Secondary_weapon, align 1, !dbg !2036
  %90 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2037
  %91 = load i32, ptr %5, align 4, !dbg !2037
  %92 = sext i32 %91 to i64, !dbg !2037
  %93 = getelementptr inbounds ptr, ptr %90, i64 %92, !dbg !2037
  %94 = load ptr, ptr %93, align 8, !dbg !2037
  store ptr %94, ptr %9, align 8, !dbg !2038
  %95 = load i32, ptr %5, align 4, !dbg !2039
  %96 = icmp sge i32 %95, 5, !dbg !2040
  %97 = zext i1 %96 to i8, !dbg !2041
  %98 = load i32, ptr %5, align 4, !dbg !2042
  %99 = srem i32 %98, 5, !dbg !2043
  %100 = sext i32 %99 to i64, !dbg !2044
  %101 = getelementptr inbounds [10 x i8], ptr @Secondary_last_was_super, i64 0, i64 %100, !dbg !2044
  store i8 %97, ptr %101, align 1, !dbg !2045
  br label %102

102:                                              ; preds = %87, %45
  %103 = load i32, ptr %7, align 4, !dbg !2046
  %104 = icmp ne i32 %103, 0, !dbg !2046
  br i1 %104, label %105, label %129, !dbg !2046

105:                                              ; preds = %102
  %106 = load i32, ptr %5, align 4, !dbg !2048
  %107 = icmp eq i32 %106, 0, !dbg !2050
  br i1 %107, label %108, label %123, !dbg !2051

108:                                              ; preds = %105
  %109 = load i32, ptr %6, align 4, !dbg !2052
  %110 = icmp ne i32 %109, 0, !dbg !2052
  br i1 %110, label %123, label %111, !dbg !2051

111:                                              ; preds = %108
  %112 = load ptr, ptr %9, align 8, !dbg !2053
  %113 = load i32, ptr @Player_num, align 4, !dbg !2054
  %114 = sext i32 %113 to i64, !dbg !2055
  %115 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %114, !dbg !2055
  %116 = getelementptr inbounds nuw %struct.player, ptr %115, i32 0, i32 12, !dbg !2056
  %117 = load i8, ptr %116, align 2, !dbg !2056
  %118 = zext i8 %117 to i32, !dbg !2055
  %119 = add nsw i32 %118, 1, !dbg !2057
  %120 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 144) #5, !dbg !2058
  %121 = load ptr, ptr %120, align 8, !dbg !2058
  %122 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.2, ptr noundef %112, i32 noundef %119, ptr noundef %121), !dbg !2059
  br label %128, !dbg !2059

123:                                              ; preds = %108, %105
  %124 = load ptr, ptr %9, align 8, !dbg !2060
  %125 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 144) #5, !dbg !2061
  %126 = load ptr, ptr %125, align 8, !dbg !2061
  %127 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.3, ptr noundef %124, ptr noundef %126), !dbg !2062
  br label %128

128:                                              ; preds = %123, %111
  br label %129, !dbg !2052

129:                                              ; preds = %128, %102
  ret void, !dbg !2063
}

declare void @_Z28newdemo_record_player_weaponii(i32 noundef, i32 noundef) #2

declare void @_Z21digi_play_sample_onceii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 !dbg !2064 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2417, !DIExpression(), !2419)
  store i64 %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2420, !DIExpression(), !2421)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector", ptr %5, i32 0, i32 0, !dbg !2422
  %7 = load ptr, ptr %6, align 8, !dbg !2422
  %8 = load i64, ptr %4, align 8, !dbg !2423
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8, !dbg !2424
  ret ptr %9, !dbg !2425
}

declare noundef i32 @_Z16HUD_init_messagePKcz(ptr noundef, ...) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16do_weapon_selectii(i32 noundef %0, i32 noundef %1) #1 !dbg !2426 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2429, !DIExpression(), !2430)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2431, !DIExpression(), !2432)
    #dbg_declare(ptr %5, !2433, !DIExpression(), !2434)
  %10 = load i32, ptr %3, align 4, !dbg !2435
  store i32 %10, ptr %5, align 4, !dbg !2434
    #dbg_declare(ptr %6, !2436, !DIExpression(), !2437)
    #dbg_declare(ptr %7, !2438, !DIExpression(), !2439)
    #dbg_declare(ptr %8, !2440, !DIExpression(), !2441)
    #dbg_declare(ptr %9, !2442, !DIExpression(), !2443)
  %11 = load i32, ptr %4, align 4, !dbg !2444
  %12 = icmp ne i32 %11, 0, !dbg !2444
  br i1 %12, label %20, label %13, !dbg !2446

13:                                               ; preds = %2
  %14 = load i8, ptr @Primary_weapon, align 1, !dbg !2447
  %15 = sext i8 %14 to i32, !dbg !2447
  store i32 %15, ptr %7, align 4, !dbg !2449
  %16 = load i32, ptr %3, align 4, !dbg !2450
  %17 = sext i32 %16 to i64, !dbg !2451
  %18 = getelementptr inbounds [10 x i8], ptr @Primary_last_was_super, i64 0, i64 %17, !dbg !2451
  %19 = load i8, ptr %18, align 1, !dbg !2451
  store i8 %19, ptr %9, align 1, !dbg !2452
  store i32 1, ptr %8, align 4, !dbg !2453
  br label %27, !dbg !2454

20:                                               ; preds = %2
  %21 = load i8, ptr @Secondary_weapon, align 1, !dbg !2455
  %22 = sext i8 %21 to i32, !dbg !2455
  store i32 %22, ptr %7, align 4, !dbg !2457
  %23 = load i32, ptr %3, align 4, !dbg !2458
  %24 = sext i32 %23 to i64, !dbg !2459
  %25 = getelementptr inbounds [10 x i8], ptr @Secondary_last_was_super, i64 0, i64 %24, !dbg !2459
  %26 = load i8, ptr %25, align 1, !dbg !2459
  store i8 %26, ptr %9, align 1, !dbg !2460
  store i32 5, ptr %8, align 4, !dbg !2461
  br label %27

27:                                               ; preds = %20, %13
  %28 = load i32, ptr %7, align 4, !dbg !2462
  %29 = load i32, ptr %3, align 4, !dbg !2464
  %30 = icmp eq i32 %28, %29, !dbg !2465
  br i1 %30, label %36, label %31, !dbg !2466

31:                                               ; preds = %27
  %32 = load i32, ptr %7, align 4, !dbg !2467
  %33 = load i32, ptr %3, align 4, !dbg !2468
  %34 = add nsw i32 %33, 5, !dbg !2469
  %35 = icmp eq i32 %32, %34, !dbg !2470
  br i1 %35, label %36, label %46, !dbg !2466

36:                                               ; preds = %31, %27
  %37 = load i32, ptr %3, align 4, !dbg !2471
  %38 = add nsw i32 %37, 5, !dbg !2473
  %39 = load i32, ptr %7, align 4, !dbg !2474
  %40 = sub nsw i32 %38, %39, !dbg !2475
  %41 = load i32, ptr %3, align 4, !dbg !2476
  %42 = add nsw i32 %41, %40, !dbg !2476
  store i32 %42, ptr %3, align 4, !dbg !2476
  %43 = load i32, ptr %3, align 4, !dbg !2477
  %44 = load i32, ptr %4, align 4, !dbg !2478
  %45 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %43, i32 noundef %44), !dbg !2479
  store i32 %45, ptr %6, align 4, !dbg !2480
  br label %83, !dbg !2481

46:                                               ; preds = %31
  %47 = load i8, ptr %9, align 1, !dbg !2482
  %48 = icmp ne i8 %47, 0, !dbg !2482
  br i1 %48, label %49, label %52, !dbg !2482

49:                                               ; preds = %46
  %50 = load i32, ptr %3, align 4, !dbg !2485
  %51 = add nsw i32 %50, 5, !dbg !2485
  store i32 %51, ptr %3, align 4, !dbg !2485
  br label %52, !dbg !2486

52:                                               ; preds = %49, %46
  %53 = load i32, ptr %3, align 4, !dbg !2487
  %54 = load i32, ptr %4, align 4, !dbg !2488
  %55 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %53, i32 noundef %54), !dbg !2489
  store i32 %55, ptr %6, align 4, !dbg !2490
  %56 = load i32, ptr %6, align 4, !dbg !2491
  %57 = load i32, ptr %8, align 4, !dbg !2493
  %58 = and i32 %56, %57, !dbg !2494
  %59 = load i32, ptr %8, align 4, !dbg !2495
  %60 = icmp ne i32 %58, %59, !dbg !2496
  br i1 %60, label %61, label %82, !dbg !2496

61:                                               ; preds = %52
  %62 = load i32, ptr %5, align 4, !dbg !2497
  %63 = mul nsw i32 2, %62, !dbg !2499
  %64 = add nsw i32 %63, 5, !dbg !2500
  %65 = load i32, ptr %3, align 4, !dbg !2501
  %66 = sub nsw i32 %64, %65, !dbg !2502
  store i32 %66, ptr %3, align 4, !dbg !2503
  %67 = load i32, ptr %3, align 4, !dbg !2504
  %68 = load i32, ptr %4, align 4, !dbg !2505
  %69 = call noundef i32 @_Z17player_has_weaponii(i32 noundef %67, i32 noundef %68), !dbg !2506
  store i32 %69, ptr %6, align 4, !dbg !2507
  %70 = load i32, ptr %6, align 4, !dbg !2508
  %71 = load i32, ptr %8, align 4, !dbg !2510
  %72 = and i32 %70, %71, !dbg !2511
  %73 = load i32, ptr %8, align 4, !dbg !2512
  %74 = icmp ne i32 %72, %73, !dbg !2513
  br i1 %74, label %75, label %81, !dbg !2513

75:                                               ; preds = %61
  %76 = load i32, ptr %5, align 4, !dbg !2514
  %77 = mul nsw i32 2, %76, !dbg !2515
  %78 = add nsw i32 %77, 5, !dbg !2516
  %79 = load i32, ptr %3, align 4, !dbg !2517
  %80 = sub nsw i32 %78, %79, !dbg !2518
  store i32 %80, ptr %3, align 4, !dbg !2519
  br label %81, !dbg !2520

81:                                               ; preds = %75, %61
  br label %82, !dbg !2521

82:                                               ; preds = %81, %52
  br label %83

83:                                               ; preds = %82, %36
  %84 = load i32, ptr %6, align 4, !dbg !2522
  %85 = load i32, ptr %8, align 4, !dbg !2524
  %86 = and i32 %84, %85, !dbg !2525
  %87 = load i32, ptr %8, align 4, !dbg !2526
  %88 = icmp ne i32 %86, %87, !dbg !2527
  br i1 %88, label %89, label %117, !dbg !2527

89:                                               ; preds = %83
  %90 = load i32, ptr %4, align 4, !dbg !2528
  %91 = icmp ne i32 %90, 0, !dbg !2528
  br i1 %91, label %105, label %92, !dbg !2531

92:                                               ; preds = %89
  %93 = load i32, ptr %3, align 4, !dbg !2532
  %94 = icmp eq i32 %93, 5, !dbg !2535
  br i1 %94, label %95, label %96, !dbg !2535

95:                                               ; preds = %92
  br label %120, !dbg !2536

96:                                               ; preds = %92
  %97 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 145) #5, !dbg !2537
  %98 = load ptr, ptr %97, align 8, !dbg !2537
  %99 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !2538
  %100 = load i32, ptr %3, align 4, !dbg !2538
  %101 = sext i32 %100 to i64, !dbg !2538
  %102 = getelementptr inbounds ptr, ptr %99, i64 %101, !dbg !2538
  %103 = load ptr, ptr %102, align 8, !dbg !2538
  %104 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.4, ptr noundef %98, ptr noundef %103), !dbg !2539
  br label %116, !dbg !2540

105:                                              ; preds = %89
  %106 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 147) #5, !dbg !2541
  %107 = load ptr, ptr %106, align 8, !dbg !2541
  %108 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2542
  %109 = load i32, ptr %3, align 4, !dbg !2542
  %110 = sext i32 %109 to i64, !dbg !2542
  %111 = getelementptr inbounds ptr, ptr %108, i64 %110, !dbg !2542
  %112 = load ptr, ptr %111, align 8, !dbg !2542
  %113 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 149) #5, !dbg !2543
  %114 = load ptr, ptr %113, align 8, !dbg !2543
  %115 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %107, ptr noundef %112, ptr noundef %114), !dbg !2544
  br label %116

116:                                              ; preds = %105, %96
  call void @_Z16digi_play_sampleii(i32 noundef 156, i32 noundef 65536), !dbg !2545
  br label %120, !dbg !2546

117:                                              ; preds = %83
  %118 = load i32, ptr %3, align 4, !dbg !2547
  %119 = load i32, ptr %4, align 4, !dbg !2548
  call void @_Z13select_weaponiiii(i32 noundef %118, i32 noundef %119, i32 noundef 1, i32 noundef 1), !dbg !2549
  br label %120, !dbg !2550

120:                                              ; preds = %117, %116, %95
  ret void, !dbg !2550
}

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z10POrderListi(i32 noundef %0) #1 !dbg !2551 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2552, !DIExpression(), !2553)
    #dbg_declare(ptr %4, !2554, !DIExpression(), !2555)
  store i32 0, ptr %4, align 4, !dbg !2556
  br label %5, !dbg !2558

5:                                                ; preds = %21, %1
  %6 = load i32, ptr %4, align 4, !dbg !2559
  %7 = icmp slt i32 %6, 11, !dbg !2561
  br i1 %7, label %8, label %24, !dbg !2562

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4, !dbg !2563
  %10 = sext i32 %9 to i64, !dbg !2565
  %11 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %10, !dbg !2565
  %12 = load i8, ptr %11, align 1, !dbg !2565
  %13 = zext i8 %12 to i32, !dbg !2565
  %14 = load i32, ptr %3, align 4, !dbg !2566
  %15 = icmp eq i32 %13, %14, !dbg !2567
  br i1 %15, label %16, label %20, !dbg !2567

16:                                               ; preds = %8
  %17 = load i32, ptr %3, align 4, !dbg !2568
  %18 = load i32, ptr %4, align 4, !dbg !2568
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.21, i32 noundef %17, i32 noundef %18), !dbg !2568
  %19 = load i32, ptr %4, align 4, !dbg !2570
  store i32 %19, ptr %2, align 4, !dbg !2571
  br label %25, !dbg !2571

20:                                               ; preds = %8
  br label %21, !dbg !2566

21:                                               ; preds = %20
  %22 = load i32, ptr %4, align 4, !dbg !2572
  %23 = add nsw i32 %22, 1, !dbg !2572
  store i32 %23, ptr %4, align 4, !dbg !2572
  br label %5, !dbg !2573, !llvm.loop !2574

24:                                               ; preds = %5
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.22), !dbg !2576
  store i32 0, ptr %2, align 4, !dbg !2577
  br label %25, !dbg !2577

25:                                               ; preds = %24, %16
  %26 = load i32, ptr %2, align 4, !dbg !2578
  ret i32 %26, !dbg !2578
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z10SOrderListi(i32 noundef %0) #1 !dbg !2579 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2580, !DIExpression(), !2581)
    #dbg_declare(ptr %4, !2582, !DIExpression(), !2583)
  store i32 0, ptr %4, align 4, !dbg !2584
  br label %5, !dbg !2586

5:                                                ; preds = %21, %1
  %6 = load i32, ptr %4, align 4, !dbg !2587
  %7 = icmp slt i32 %6, 11, !dbg !2589
  br i1 %7, label %8, label %24, !dbg !2590

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4, !dbg !2591
  %10 = sext i32 %9 to i64, !dbg !2593
  %11 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %10, !dbg !2593
  %12 = load i8, ptr %11, align 1, !dbg !2593
  %13 = zext i8 %12 to i32, !dbg !2593
  %14 = load i32, ptr %3, align 4, !dbg !2594
  %15 = icmp eq i32 %13, %14, !dbg !2595
  br i1 %15, label %16, label %20, !dbg !2595

16:                                               ; preds = %8
  %17 = load i32, ptr %3, align 4, !dbg !2596
  %18 = load i32, ptr %4, align 4, !dbg !2596
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.23, i32 noundef %17, i32 noundef %18), !dbg !2596
  %19 = load i32, ptr %4, align 4, !dbg !2598
  store i32 %19, ptr %2, align 4, !dbg !2599
  br label %26, !dbg !2599

20:                                               ; preds = %8
  br label %21, !dbg !2594

21:                                               ; preds = %20
  %22 = load i32, ptr %4, align 4, !dbg !2600
  %23 = add nsw i32 %22, 1, !dbg !2600
  store i32 %23, ptr %4, align 4, !dbg !2600
  br label %5, !dbg !2601, !llvm.loop !2602

24:                                               ; preds = %5
  %25 = load i32, ptr %3, align 4, !dbg !2604
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.24, i32 noundef %25), !dbg !2604
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.25), !dbg !2605
  store i32 0, ptr %2, align 4, !dbg !2606
  br label %26, !dbg !2606

26:                                               ; preds = %24, %16
  %27 = load i32, ptr %2, align 4, !dbg !2607
  ret i32 %27, !dbg !2607
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18show_weapon_statusv() #1 !dbg !2608 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !2609, !DIExpression(), !2610)
  store i32 0, ptr %1, align 4, !dbg !2611
  br label %2, !dbg !2613

2:                                                ; preds = %33, %0
  %3 = load i32, ptr %1, align 4, !dbg !2614
  %4 = icmp slt i32 %3, 10, !dbg !2616
  br i1 %4, label %5, label %36, !dbg !2617

5:                                                ; preds = %2
  %6 = load i32, ptr @Player_num, align 4, !dbg !2618
  %7 = sext i32 %6 to i64, !dbg !2621
  %8 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %7, !dbg !2621
  %9 = getelementptr inbounds nuw %struct.player, ptr %8, i32 0, i32 15, !dbg !2622
  %10 = load i16, ptr %9, align 2, !dbg !2622
  %11 = zext i16 %10 to i32, !dbg !2621
  %12 = load i32, ptr %1, align 4, !dbg !2623
  %13 = shl i32 1, %12, !dbg !2624
  %14 = and i32 %11, %13, !dbg !2625
  %15 = icmp ne i32 %14, 0, !dbg !2621
  br i1 %15, label %16, label %17, !dbg !2621

16:                                               ; preds = %5
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.10), !dbg !2626
  br label %18, !dbg !2626

17:                                               ; preds = %5
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11), !dbg !2627
  br label %18

18:                                               ; preds = %17, %16
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !2628
  %20 = load i32, ptr %1, align 4, !dbg !2628
  %21 = sext i32 %20 to i64, !dbg !2628
  %22 = getelementptr inbounds ptr, ptr %19, i64 %21, !dbg !2628
  %23 = load ptr, ptr %22, align 8, !dbg !2628
  %24 = load i32, ptr @Player_num, align 4, !dbg !2628
  %25 = sext i32 %24 to i64, !dbg !2628
  %26 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %25, !dbg !2628
  %27 = getelementptr inbounds nuw %struct.player, ptr %26, i32 0, i32 17, !dbg !2628
  %28 = load i32, ptr %1, align 4, !dbg !2628
  %29 = sext i32 %28 to i64, !dbg !2628
  %30 = getelementptr inbounds [10 x i16], ptr %27, i64 0, i64 %29, !dbg !2628
  %31 = load i16, ptr %30, align 2, !dbg !2628
  %32 = zext i16 %31 to i32, !dbg !2628
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, ptr noundef %23, i32 noundef %32), !dbg !2628
  br label %33, !dbg !2629

33:                                               ; preds = %18
  %34 = load i32, ptr %1, align 4, !dbg !2630
  %35 = add nsw i32 %34, 1, !dbg !2630
  store i32 %35, ptr %1, align 4, !dbg !2630
  br label %2, !dbg !2631, !llvm.loop !2632

36:                                               ; preds = %2
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13), !dbg !2634
  store i32 0, ptr %1, align 4, !dbg !2635
  br label %37, !dbg !2637

37:                                               ; preds = %68, %36
  %38 = load i32, ptr %1, align 4, !dbg !2638
  %39 = icmp slt i32 %38, 10, !dbg !2640
  br i1 %39, label %40, label %71, !dbg !2641

40:                                               ; preds = %37
  %41 = load i32, ptr @Player_num, align 4, !dbg !2642
  %42 = sext i32 %41 to i64, !dbg !2645
  %43 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %42, !dbg !2645
  %44 = getelementptr inbounds nuw %struct.player, ptr %43, i32 0, i32 16, !dbg !2646
  %45 = load i16, ptr %44, align 4, !dbg !2646
  %46 = zext i16 %45 to i32, !dbg !2645
  %47 = load i32, ptr %1, align 4, !dbg !2647
  %48 = shl i32 1, %47, !dbg !2648
  %49 = and i32 %46, %48, !dbg !2649
  %50 = icmp ne i32 %49, 0, !dbg !2645
  br i1 %50, label %51, label %52, !dbg !2645

51:                                               ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.10), !dbg !2650
  br label %53, !dbg !2650

52:                                               ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11), !dbg !2651
  br label %53

53:                                               ; preds = %52, %51
  %54 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2652
  %55 = load i32, ptr %1, align 4, !dbg !2652
  %56 = sext i32 %55 to i64, !dbg !2652
  %57 = getelementptr inbounds ptr, ptr %54, i64 %56, !dbg !2652
  %58 = load ptr, ptr %57, align 8, !dbg !2652
  %59 = load i32, ptr @Player_num, align 4, !dbg !2652
  %60 = sext i32 %59 to i64, !dbg !2652
  %61 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %60, !dbg !2652
  %62 = getelementptr inbounds nuw %struct.player, ptr %61, i32 0, i32 18, !dbg !2652
  %63 = load i32, ptr %1, align 4, !dbg !2652
  %64 = sext i32 %63 to i64, !dbg !2652
  %65 = getelementptr inbounds [10 x i16], ptr %62, i64 0, i64 %64, !dbg !2652
  %66 = load i16, ptr %65, align 2, !dbg !2652
  %67 = zext i16 %66 to i32, !dbg !2652
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, ptr noundef %58, i32 noundef %67), !dbg !2652
  br label %68, !dbg !2653

68:                                               ; preds = %53
  %69 = load i32, ptr %1, align 4, !dbg !2654
  %70 = add nsw i32 %69, 1, !dbg !2654
  store i32 %70, ptr %1, align 4, !dbg !2654
  br label %37, !dbg !2655, !llvm.loop !2656

71:                                               ; preds = %37
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13), !dbg !2658
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13), !dbg !2659
  ret void, !dbg !2660
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17pick_up_secondaryii(i32 noundef %0, i32 noundef %1) #1 !dbg !2661 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !2662, !DIExpression(), !2663)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2664, !DIExpression(), !2665)
    #dbg_declare(ptr %6, !2666, !DIExpression(), !2667)
    #dbg_declare(ptr %7, !2668, !DIExpression(), !2669)
    #dbg_declare(ptr %8, !2670, !DIExpression(), !2671)
  %10 = load i32, ptr %4, align 4, !dbg !2672
  %11 = sext i32 %10 to i64, !dbg !2673
  %12 = getelementptr inbounds [10 x i8], ptr @Secondary_ammo_max, i64 0, i64 %11, !dbg !2673
  %13 = load i8, ptr %12, align 1, !dbg !2673
  %14 = zext i8 %13 to i32, !dbg !2673
  store i32 %14, ptr %6, align 4, !dbg !2674
  %15 = load i32, ptr @Player_num, align 4, !dbg !2675
  %16 = sext i32 %15 to i64, !dbg !2677
  %17 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %16, !dbg !2677
  %18 = getelementptr inbounds nuw %struct.player, ptr %17, i32 0, i32 7, !dbg !2678
  %19 = load i32, ptr %18, align 4, !dbg !2678
  %20 = and i32 %19, 128, !dbg !2679
  %21 = icmp ne i32 %20, 0, !dbg !2677
  br i1 %21, label %22, label %25, !dbg !2677

22:                                               ; preds = %2
  %23 = load i32, ptr %6, align 4, !dbg !2680
  %24 = mul nsw i32 %23, 2, !dbg !2680
  store i32 %24, ptr %6, align 4, !dbg !2680
  br label %25, !dbg !2681

25:                                               ; preds = %22, %2
  %26 = load i32, ptr @Player_num, align 4, !dbg !2682
  %27 = sext i32 %26 to i64, !dbg !2684
  %28 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %27, !dbg !2684
  %29 = getelementptr inbounds nuw %struct.player, ptr %28, i32 0, i32 18, !dbg !2685
  %30 = load i32, ptr %4, align 4, !dbg !2686
  %31 = sext i32 %30 to i64, !dbg !2684
  %32 = getelementptr inbounds [10 x i16], ptr %29, i64 0, i64 %31, !dbg !2684
  %33 = load i16, ptr %32, align 2, !dbg !2684
  %34 = zext i16 %33 to i32, !dbg !2684
  %35 = load i32, ptr %6, align 4, !dbg !2687
  %36 = icmp sge i32 %34, %35, !dbg !2688
  br i1 %36, label %37, label %55, !dbg !2688

37:                                               ; preds = %25
  %38 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #5, !dbg !2689
  %39 = load ptr, ptr %38, align 8, !dbg !2689
  %40 = load i32, ptr @Player_num, align 4, !dbg !2691
  %41 = sext i32 %40 to i64, !dbg !2692
  %42 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %41, !dbg !2692
  %43 = getelementptr inbounds nuw %struct.player, ptr %42, i32 0, i32 18, !dbg !2693
  %44 = load i32, ptr %4, align 4, !dbg !2694
  %45 = sext i32 %44 to i64, !dbg !2692
  %46 = getelementptr inbounds [10 x i16], ptr %43, i64 0, i64 %45, !dbg !2692
  %47 = load i16, ptr %46, align 2, !dbg !2692
  %48 = zext i16 %47 to i32, !dbg !2692
  %49 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2695
  %50 = load i32, ptr %4, align 4, !dbg !2695
  %51 = sext i32 %50 to i64, !dbg !2695
  %52 = getelementptr inbounds ptr, ptr %49, i64 %51, !dbg !2695
  %53 = load ptr, ptr %52, align 8, !dbg !2695
  %54 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.14, ptr noundef %39, i32 noundef %48, ptr noundef %53), !dbg !2696
  store i32 0, ptr %3, align 4, !dbg !2697
  br label %190, !dbg !2697

55:                                               ; preds = %25
  %56 = load i32, ptr %4, align 4, !dbg !2698
  %57 = shl i32 1, %56, !dbg !2699
  %58 = load i32, ptr @Player_num, align 4, !dbg !2700
  %59 = sext i32 %58 to i64, !dbg !2701
  %60 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %59, !dbg !2701
  %61 = getelementptr inbounds nuw %struct.player, ptr %60, i32 0, i32 16, !dbg !2702
  %62 = load i16, ptr %61, align 4, !dbg !2703
  %63 = zext i16 %62 to i32, !dbg !2703
  %64 = or i32 %63, %57, !dbg !2703
  %65 = trunc i32 %64 to i16, !dbg !2703
  store i16 %65, ptr %61, align 4, !dbg !2703
  %66 = load i32, ptr %5, align 4, !dbg !2704
  %67 = load i32, ptr @Player_num, align 4, !dbg !2705
  %68 = sext i32 %67 to i64, !dbg !2706
  %69 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %68, !dbg !2706
  %70 = getelementptr inbounds nuw %struct.player, ptr %69, i32 0, i32 18, !dbg !2707
  %71 = load i32, ptr %4, align 4, !dbg !2708
  %72 = sext i32 %71 to i64, !dbg !2706
  %73 = getelementptr inbounds [10 x i16], ptr %70, i64 0, i64 %72, !dbg !2706
  %74 = load i16, ptr %73, align 2, !dbg !2709
  %75 = zext i16 %74 to i32, !dbg !2709
  %76 = add nsw i32 %75, %66, !dbg !2709
  %77 = trunc i32 %76 to i16, !dbg !2709
  store i16 %77, ptr %73, align 2, !dbg !2709
  %78 = load i32, ptr %5, align 4, !dbg !2710
  store i32 %78, ptr %7, align 4, !dbg !2711
  %79 = load i32, ptr @Player_num, align 4, !dbg !2712
  %80 = sext i32 %79 to i64, !dbg !2714
  %81 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %80, !dbg !2714
  %82 = getelementptr inbounds nuw %struct.player, ptr %81, i32 0, i32 18, !dbg !2715
  %83 = load i32, ptr %4, align 4, !dbg !2716
  %84 = sext i32 %83 to i64, !dbg !2714
  %85 = getelementptr inbounds [10 x i16], ptr %82, i64 0, i64 %84, !dbg !2714
  %86 = load i16, ptr %85, align 2, !dbg !2714
  %87 = zext i16 %86 to i32, !dbg !2714
  %88 = load i32, ptr %6, align 4, !dbg !2717
  %89 = icmp sgt i32 %87, %88, !dbg !2718
  br i1 %89, label %90, label %113, !dbg !2718

90:                                               ; preds = %55
  %91 = load i32, ptr %5, align 4, !dbg !2719
  %92 = load i32, ptr @Player_num, align 4, !dbg !2721
  %93 = sext i32 %92 to i64, !dbg !2722
  %94 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %93, !dbg !2722
  %95 = getelementptr inbounds nuw %struct.player, ptr %94, i32 0, i32 18, !dbg !2723
  %96 = load i32, ptr %4, align 4, !dbg !2724
  %97 = sext i32 %96 to i64, !dbg !2722
  %98 = getelementptr inbounds [10 x i16], ptr %95, i64 0, i64 %97, !dbg !2722
  %99 = load i16, ptr %98, align 2, !dbg !2722
  %100 = zext i16 %99 to i32, !dbg !2722
  %101 = load i32, ptr %6, align 4, !dbg !2725
  %102 = sub nsw i32 %100, %101, !dbg !2726
  %103 = sub nsw i32 %91, %102, !dbg !2727
  store i32 %103, ptr %7, align 4, !dbg !2728
  %104 = load i32, ptr %6, align 4, !dbg !2729
  %105 = trunc i32 %104 to i16, !dbg !2729
  %106 = load i32, ptr @Player_num, align 4, !dbg !2730
  %107 = sext i32 %106 to i64, !dbg !2731
  %108 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %107, !dbg !2731
  %109 = getelementptr inbounds nuw %struct.player, ptr %108, i32 0, i32 18, !dbg !2732
  %110 = load i32, ptr %4, align 4, !dbg !2733
  %111 = sext i32 %110 to i64, !dbg !2731
  %112 = getelementptr inbounds [10 x i16], ptr %109, i64 0, i64 %111, !dbg !2731
  store i16 %105, ptr %112, align 2, !dbg !2734
  br label %113, !dbg !2735

113:                                              ; preds = %90, %55
  %114 = call noundef i32 @_Z10SOrderListi(i32 noundef 255), !dbg !2736
  store i32 %114, ptr %8, align 4, !dbg !2737
  %115 = load i32, ptr %4, align 4, !dbg !2738
  %116 = call noundef i32 @_Z10SOrderListi(i32 noundef %115), !dbg !2740
  %117 = load i32, ptr %8, align 4, !dbg !2741
  %118 = icmp slt i32 %116, %117, !dbg !2742
  br i1 %118, label %119, label %139, !dbg !2743

119:                                              ; preds = %113
  %120 = load i32, ptr %4, align 4, !dbg !2744
  %121 = call noundef i32 @_Z10SOrderListi(i32 noundef %120), !dbg !2745
  %122 = load i8, ptr @Secondary_weapon, align 1, !dbg !2746
  %123 = sext i8 %122 to i32, !dbg !2746
  %124 = call noundef i32 @_Z10SOrderListi(i32 noundef %123), !dbg !2747
  %125 = icmp slt i32 %121, %124, !dbg !2748
  br i1 %125, label %137, label %126, !dbg !2749

126:                                              ; preds = %119
  %127 = load i32, ptr @Player_num, align 4, !dbg !2750
  %128 = sext i32 %127 to i64, !dbg !2751
  %129 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %128, !dbg !2751
  %130 = getelementptr inbounds nuw %struct.player, ptr %129, i32 0, i32 18, !dbg !2752
  %131 = load i8, ptr @Secondary_weapon, align 1, !dbg !2753
  %132 = sext i8 %131 to i64, !dbg !2751
  %133 = getelementptr inbounds [10 x i16], ptr %130, i64 0, i64 %132, !dbg !2751
  %134 = load i16, ptr %133, align 2, !dbg !2751
  %135 = zext i16 %134 to i32, !dbg !2751
  %136 = icmp eq i32 %135, 0, !dbg !2754
  br i1 %136, label %137, label %139, !dbg !2743

137:                                              ; preds = %126, %119
  %138 = load i32, ptr %4, align 4, !dbg !2755
  call void @_Z13select_weaponiiii(i32 noundef %138, i32 noundef 1, i32 noundef 0, i32 noundef 1), !dbg !2756
  br label %169, !dbg !2756

139:                                              ; preds = %126, %113
  %140 = load i32, ptr %4, align 4, !dbg !2757
  %141 = icmp eq i32 %140, 2, !dbg !2760
  br i1 %141, label %145, label %142, !dbg !2761

142:                                              ; preds = %139
  %143 = load i32, ptr %4, align 4, !dbg !2762
  %144 = icmp eq i32 %143, 7, !dbg !2763
  br i1 %144, label %145, label %168, !dbg !2764

145:                                              ; preds = %142, %139
  %146 = load i8, ptr @Secondary_weapon, align 1, !dbg !2765
  %147 = sext i8 %146 to i32, !dbg !2765
  %148 = icmp eq i32 %147, 2, !dbg !2766
  br i1 %148, label %168, label %149, !dbg !2767

149:                                              ; preds = %145
  %150 = load i8, ptr @Secondary_weapon, align 1, !dbg !2768
  %151 = sext i8 %150 to i32, !dbg !2768
  %152 = icmp eq i32 %151, 7, !dbg !2769
  br i1 %152, label %168, label %153, !dbg !2764

153:                                              ; preds = %149
    #dbg_declare(ptr %9, !2770, !DIExpression(), !2772)
  %154 = load i8, ptr getelementptr inbounds ([10 x i8], ptr @Secondary_last_was_super, i64 0, i64 2), align 1, !dbg !2773
  %155 = icmp ne i8 %154, 0, !dbg !2773
  %156 = zext i1 %155 to i64, !dbg !2773
  %157 = select i1 %155, i32 7, i32 2, !dbg !2773
  store i32 %157, ptr %9, align 4, !dbg !2774
  %158 = load i32, ptr %4, align 4, !dbg !2775
  %159 = call noundef i32 @_Z10SOrderListi(i32 noundef %158), !dbg !2777
  %160 = load i32, ptr %9, align 4, !dbg !2778
  %161 = call noundef i32 @_Z10SOrderListi(i32 noundef %160), !dbg !2779
  %162 = icmp slt i32 %159, %161, !dbg !2780
  br i1 %162, label %163, label %167, !dbg !2780

163:                                              ; preds = %153
  %164 = load i32, ptr %4, align 4, !dbg !2781
  %165 = icmp eq i32 %164, 7, !dbg !2782
  %166 = zext i1 %165 to i8, !dbg !2783
  store i8 %166, ptr getelementptr inbounds ([10 x i8], ptr @Secondary_last_was_super, i64 0, i64 2), align 1, !dbg !2784
  br label %167, !dbg !2785

167:                                              ; preds = %163, %153
  br label %168, !dbg !2786

168:                                              ; preds = %167, %149, %145, %142
  br label %169

169:                                              ; preds = %168, %137
  %170 = load i32, ptr %5, align 4, !dbg !2787
  %171 = icmp sgt i32 %170, 1, !dbg !2789
  br i1 %171, label %172, label %182, !dbg !2789

172:                                              ; preds = %169
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef 15, i32 noundef 15, i32 noundef 15), !dbg !2790
  %173 = load i32, ptr %7, align 4, !dbg !2792
  %174 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2793
  %175 = load i32, ptr %4, align 4, !dbg !2793
  %176 = sext i32 %175 to i64, !dbg !2793
  %177 = getelementptr inbounds ptr, ptr %174, i64 %176, !dbg !2793
  %178 = load ptr, ptr %177, align 8, !dbg !2793
  %179 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 149) #5, !dbg !2794
  %180 = load ptr, ptr %179, align 8, !dbg !2794
  %181 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.15, i32 noundef %173, ptr noundef %178, ptr noundef %180), !dbg !2795
  br label %189, !dbg !2796

182:                                              ; preds = %169
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef 10, i32 noundef 10, i32 noundef 10), !dbg !2797
  %183 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2799
  %184 = load i32, ptr %4, align 4, !dbg !2799
  %185 = sext i32 %184 to i64, !dbg !2799
  %186 = getelementptr inbounds ptr, ptr %183, i64 %185, !dbg !2799
  %187 = load ptr, ptr %186, align 8, !dbg !2799
  %188 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.16, ptr noundef %187), !dbg !2800
  br label %189

189:                                              ; preds = %182, %172
  store i32 1, ptr %3, align 4, !dbg !2801
  br label %190, !dbg !2801

190:                                              ; preds = %189, %37
  %191 = load i32, ptr %3, align 4, !dbg !2802
  ret i32 %191, !dbg !2802
}

declare void @_Z17PALETTE_FLASH_ADDiii(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14ReorderPrimaryv() #1 !dbg !2803 {
  %1 = alloca [11 x %struct.newmenu_item], align 8
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !2804, !DIExpression(), !2827)
    #dbg_declare(ptr %2, !2828, !DIExpression(), !2829)
  store i32 0, ptr %2, align 4, !dbg !2830
  br label %3, !dbg !2832

3:                                                ; preds = %46, %0
  %4 = load i32, ptr %2, align 4, !dbg !2833
  %5 = icmp slt i32 %4, 11, !dbg !2835
  br i1 %5, label %6, label %49, !dbg !2836

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !dbg !2837
  %8 = sext i32 %7 to i64, !dbg !2839
  %9 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %8, !dbg !2839
  %10 = getelementptr inbounds nuw %struct.newmenu_item, ptr %9, i32 0, i32 0, !dbg !2840
  store i32 0, ptr %10, align 8, !dbg !2841
  %11 = load i32, ptr %2, align 4, !dbg !2842
  %12 = sext i32 %11 to i64, !dbg !2844
  %13 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %12, !dbg !2844
  %14 = load i8, ptr %13, align 1, !dbg !2844
  %15 = zext i8 %14 to i32, !dbg !2844
  %16 = icmp eq i32 %15, 255, !dbg !2845
  br i1 %16, label %17, label %22, !dbg !2845

17:                                               ; preds = %6
  %18 = load i32, ptr %2, align 4, !dbg !2846
  %19 = sext i32 %18 to i64, !dbg !2847
  %20 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %19, !dbg !2847
  %21 = getelementptr inbounds nuw %struct.newmenu_item, ptr %20, i32 0, i32 6, !dbg !2848
  store ptr @.str.17, ptr %21, align 8, !dbg !2849
  br label %36, !dbg !2847

22:                                               ; preds = %6
  %23 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !2850
  %24 = load i32, ptr %2, align 4, !dbg !2850
  %25 = sext i32 %24 to i64, !dbg !2850
  %26 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %25, !dbg !2850
  %27 = load i8, ptr %26, align 1, !dbg !2850
  %28 = zext i8 %27 to i32, !dbg !2850
  %29 = sext i32 %28 to i64, !dbg !2850
  %30 = getelementptr inbounds ptr, ptr %23, i64 %29, !dbg !2850
  %31 = load ptr, ptr %30, align 8, !dbg !2850
  %32 = load i32, ptr %2, align 4, !dbg !2851
  %33 = sext i32 %32 to i64, !dbg !2852
  %34 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %33, !dbg !2852
  %35 = getelementptr inbounds nuw %struct.newmenu_item, ptr %34, i32 0, i32 6, !dbg !2853
  store ptr %31, ptr %35, align 8, !dbg !2854
  br label %36

36:                                               ; preds = %22, %17
  %37 = load i32, ptr %2, align 4, !dbg !2855
  %38 = sext i32 %37 to i64, !dbg !2856
  %39 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %38, !dbg !2856
  %40 = load i8, ptr %39, align 1, !dbg !2856
  %41 = zext i8 %40 to i32, !dbg !2856
  %42 = load i32, ptr %2, align 4, !dbg !2857
  %43 = sext i32 %42 to i64, !dbg !2858
  %44 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %43, !dbg !2858
  %45 = getelementptr inbounds nuw %struct.newmenu_item, ptr %44, i32 0, i32 1, !dbg !2859
  store i32 %41, ptr %45, align 4, !dbg !2860
  br label %46, !dbg !2861

46:                                               ; preds = %36
  %47 = load i32, ptr %2, align 4, !dbg !2862
  %48 = add nsw i32 %47, 1, !dbg !2862
  store i32 %48, ptr %2, align 4, !dbg !2862
  br label %3, !dbg !2863, !llvm.loop !2864

49:                                               ; preds = %3
  store i8 1, ptr @MenuReordering, align 1, !dbg !2866
  %50 = load i32, ptr %2, align 4, !dbg !2867
  %51 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 0, !dbg !2868
  %52 = call noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef @.str.18, ptr noundef @.str.19, i32 noundef %50, ptr noundef %51, ptr noundef null), !dbg !2869
  store i32 %52, ptr %2, align 4, !dbg !2870
  store i8 0, ptr @MenuReordering, align 1, !dbg !2871
  store i32 0, ptr %2, align 4, !dbg !2872
  br label %53, !dbg !2874

53:                                               ; preds = %66, %49
  %54 = load i32, ptr %2, align 4, !dbg !2875
  %55 = icmp slt i32 %54, 11, !dbg !2877
  br i1 %55, label %56, label %69, !dbg !2878

56:                                               ; preds = %53
  %57 = load i32, ptr %2, align 4, !dbg !2879
  %58 = sext i32 %57 to i64, !dbg !2880
  %59 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %58, !dbg !2880
  %60 = getelementptr inbounds nuw %struct.newmenu_item, ptr %59, i32 0, i32 1, !dbg !2881
  %61 = load i32, ptr %60, align 4, !dbg !2881
  %62 = trunc i32 %61 to i8, !dbg !2880
  %63 = load i32, ptr %2, align 4, !dbg !2882
  %64 = sext i32 %63 to i64, !dbg !2883
  %65 = getelementptr inbounds [11 x i8], ptr @PrimaryOrder, i64 0, i64 %64, !dbg !2883
  store i8 %62, ptr %65, align 1, !dbg !2884
  br label %66, !dbg !2883

66:                                               ; preds = %56
  %67 = load i32, ptr %2, align 4, !dbg !2885
  %68 = add nsw i32 %67, 1, !dbg !2885
  store i32 %68, ptr %2, align 4, !dbg !2885
  br label %53, !dbg !2886, !llvm.loop !2887

69:                                               ; preds = %53
  ret void, !dbg !2889
}

declare noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16ReorderSecondaryv() #1 !dbg !2890 {
  %1 = alloca [11 x %struct.newmenu_item], align 8
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !2891, !DIExpression(), !2892)
    #dbg_declare(ptr %2, !2893, !DIExpression(), !2894)
  store i32 0, ptr %2, align 4, !dbg !2895
  br label %3, !dbg !2897

3:                                                ; preds = %46, %0
  %4 = load i32, ptr %2, align 4, !dbg !2898
  %5 = icmp slt i32 %4, 11, !dbg !2900
  br i1 %5, label %6, label %49, !dbg !2901

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !dbg !2902
  %8 = sext i32 %7 to i64, !dbg !2904
  %9 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %8, !dbg !2904
  %10 = getelementptr inbounds nuw %struct.newmenu_item, ptr %9, i32 0, i32 0, !dbg !2905
  store i32 0, ptr %10, align 8, !dbg !2906
  %11 = load i32, ptr %2, align 4, !dbg !2907
  %12 = sext i32 %11 to i64, !dbg !2909
  %13 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %12, !dbg !2909
  %14 = load i8, ptr %13, align 1, !dbg !2909
  %15 = zext i8 %14 to i32, !dbg !2909
  %16 = icmp eq i32 %15, 255, !dbg !2910
  br i1 %16, label %17, label %22, !dbg !2910

17:                                               ; preds = %6
  %18 = load i32, ptr %2, align 4, !dbg !2911
  %19 = sext i32 %18 to i64, !dbg !2912
  %20 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %19, !dbg !2912
  %21 = getelementptr inbounds nuw %struct.newmenu_item, ptr %20, i32 0, i32 6, !dbg !2913
  store ptr @.str.17, ptr %21, align 8, !dbg !2914
  br label %36, !dbg !2912

22:                                               ; preds = %6
  %23 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !2915
  %24 = load i32, ptr %2, align 4, !dbg !2915
  %25 = sext i32 %24 to i64, !dbg !2915
  %26 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %25, !dbg !2915
  %27 = load i8, ptr %26, align 1, !dbg !2915
  %28 = zext i8 %27 to i32, !dbg !2915
  %29 = sext i32 %28 to i64, !dbg !2915
  %30 = getelementptr inbounds ptr, ptr %23, i64 %29, !dbg !2915
  %31 = load ptr, ptr %30, align 8, !dbg !2915
  %32 = load i32, ptr %2, align 4, !dbg !2916
  %33 = sext i32 %32 to i64, !dbg !2917
  %34 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %33, !dbg !2917
  %35 = getelementptr inbounds nuw %struct.newmenu_item, ptr %34, i32 0, i32 6, !dbg !2918
  store ptr %31, ptr %35, align 8, !dbg !2919
  br label %36

36:                                               ; preds = %22, %17
  %37 = load i32, ptr %2, align 4, !dbg !2920
  %38 = sext i32 %37 to i64, !dbg !2921
  %39 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %38, !dbg !2921
  %40 = load i8, ptr %39, align 1, !dbg !2921
  %41 = zext i8 %40 to i32, !dbg !2921
  %42 = load i32, ptr %2, align 4, !dbg !2922
  %43 = sext i32 %42 to i64, !dbg !2923
  %44 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %43, !dbg !2923
  %45 = getelementptr inbounds nuw %struct.newmenu_item, ptr %44, i32 0, i32 1, !dbg !2924
  store i32 %41, ptr %45, align 4, !dbg !2925
  br label %46, !dbg !2926

46:                                               ; preds = %36
  %47 = load i32, ptr %2, align 4, !dbg !2927
  %48 = add nsw i32 %47, 1, !dbg !2927
  store i32 %48, ptr %2, align 4, !dbg !2927
  br label %3, !dbg !2928, !llvm.loop !2929

49:                                               ; preds = %3
  store i8 1, ptr @MenuReordering, align 1, !dbg !2931
  %50 = load i32, ptr %2, align 4, !dbg !2932
  %51 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 0, !dbg !2933
  %52 = call noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef @.str.20, ptr noundef @.str.19, i32 noundef %50, ptr noundef %51, ptr noundef null), !dbg !2934
  store i32 %52, ptr %2, align 4, !dbg !2935
  store i8 0, ptr @MenuReordering, align 1, !dbg !2936
  store i32 0, ptr %2, align 4, !dbg !2937
  br label %53, !dbg !2939

53:                                               ; preds = %66, %49
  %54 = load i32, ptr %2, align 4, !dbg !2940
  %55 = icmp slt i32 %54, 11, !dbg !2942
  br i1 %55, label %56, label %69, !dbg !2943

56:                                               ; preds = %53
  %57 = load i32, ptr %2, align 4, !dbg !2944
  %58 = sext i32 %57 to i64, !dbg !2945
  %59 = getelementptr inbounds [11 x %struct.newmenu_item], ptr %1, i64 0, i64 %58, !dbg !2945
  %60 = getelementptr inbounds nuw %struct.newmenu_item, ptr %59, i32 0, i32 1, !dbg !2946
  %61 = load i32, ptr %60, align 4, !dbg !2946
  %62 = trunc i32 %61 to i8, !dbg !2945
  %63 = load i32, ptr %2, align 4, !dbg !2947
  %64 = sext i32 %63 to i64, !dbg !2948
  %65 = getelementptr inbounds [11 x i8], ptr @SecondaryOrder, i64 0, i64 %64, !dbg !2948
  store i8 %62, ptr %65, align 1, !dbg !2949
  br label %66, !dbg !2948

66:                                               ; preds = %56
  %67 = load i32, ptr %2, align 4, !dbg !2950
  %68 = add nsw i32 %67, 1, !dbg !2950
  store i32 %68, ptr %2, align 4, !dbg !2950
  br label %53, !dbg !2951, !llvm.loop !2952

69:                                               ; preds = %53
  ret void, !dbg !2954
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z15pick_up_primaryi(i32 noundef %0) #1 !dbg !2955 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2956, !DIExpression(), !2957)
    #dbg_declare(ptr %4, !2958, !DIExpression(), !2959)
  %7 = load i32, ptr %3, align 4, !dbg !2960
  %8 = shl i32 1, %7, !dbg !2961
  %9 = trunc i32 %8 to i16, !dbg !2962
  store i16 %9, ptr %4, align 2, !dbg !2959
    #dbg_declare(ptr %5, !2963, !DIExpression(), !2964)
    #dbg_declare(ptr %6, !2965, !DIExpression(), !2966)
  %10 = load i8, ptr @Primary_weapon, align 1, !dbg !2967
  %11 = sext i8 %10 to i32, !dbg !2967
  store i32 %11, ptr %6, align 4, !dbg !2966
  %12 = load i32, ptr %3, align 4, !dbg !2968
  %13 = icmp ne i32 %12, 0, !dbg !2970
  br i1 %13, label %14, label %34, !dbg !2971

14:                                               ; preds = %1
  %15 = load i32, ptr @Player_num, align 4, !dbg !2972
  %16 = sext i32 %15 to i64, !dbg !2973
  %17 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %16, !dbg !2973
  %18 = getelementptr inbounds nuw %struct.player, ptr %17, i32 0, i32 15, !dbg !2974
  %19 = load i16, ptr %18, align 2, !dbg !2974
  %20 = zext i16 %19 to i32, !dbg !2973
  %21 = load i16, ptr %4, align 2, !dbg !2975
  %22 = zext i16 %21 to i32, !dbg !2975
  %23 = and i32 %20, %22, !dbg !2976
  %24 = icmp ne i32 %23, 0, !dbg !2973
  br i1 %24, label %25, label %34, !dbg !2971

25:                                               ; preds = %14
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 151) #5, !dbg !2977
  %27 = load ptr, ptr %26, align 8, !dbg !2977
  %28 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !2979
  %29 = load i32, ptr %3, align 4, !dbg !2979
  %30 = sext i32 %29 to i64, !dbg !2979
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30, !dbg !2979
  %32 = load ptr, ptr %31, align 8, !dbg !2979
  %33 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.4, ptr noundef %27, ptr noundef %32), !dbg !2980
  store i32 0, ptr %2, align 4, !dbg !2981
  br label %83, !dbg !2981

34:                                               ; preds = %14, %1
  %35 = load i16, ptr %4, align 2, !dbg !2982
  %36 = zext i16 %35 to i32, !dbg !2982
  %37 = load i32, ptr @Player_num, align 4, !dbg !2983
  %38 = sext i32 %37 to i64, !dbg !2984
  %39 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %38, !dbg !2984
  %40 = getelementptr inbounds nuw %struct.player, ptr %39, i32 0, i32 15, !dbg !2985
  %41 = load i16, ptr %40, align 2, !dbg !2986
  %42 = zext i16 %41 to i32, !dbg !2986
  %43 = or i32 %42, %36, !dbg !2986
  %44 = trunc i32 %43 to i16, !dbg !2986
  store i16 %44, ptr %40, align 2, !dbg !2986
  %45 = call noundef i32 @_Z10POrderListi(i32 noundef 255), !dbg !2987
  store i32 %45, ptr %5, align 4, !dbg !2988
  %46 = load i8, ptr @Primary_weapon, align 1, !dbg !2989
  %47 = sext i8 %46 to i32, !dbg !2989
  %48 = icmp eq i32 %47, 0, !dbg !2991
  br i1 %48, label %49, label %58, !dbg !2992

49:                                               ; preds = %34
  %50 = load i32, ptr @Player_num, align 4, !dbg !2993
  %51 = sext i32 %50 to i64, !dbg !2994
  %52 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %51, !dbg !2994
  %53 = getelementptr inbounds nuw %struct.player, ptr %52, i32 0, i32 12, !dbg !2995
  %54 = load i8, ptr %53, align 2, !dbg !2995
  %55 = zext i8 %54 to i32, !dbg !2994
  %56 = icmp sge i32 %55, 4, !dbg !2996
  br i1 %56, label %57, label %58, !dbg !2992

57:                                               ; preds = %49
  store i32 5, ptr %6, align 4, !dbg !2997
  br label %58, !dbg !2998

58:                                               ; preds = %57, %49, %34
  %59 = load i32, ptr %3, align 4, !dbg !2999
  %60 = call noundef i32 @_Z10POrderListi(i32 noundef %59), !dbg !3001
  %61 = load i32, ptr %5, align 4, !dbg !3002
  %62 = icmp slt i32 %60, %61, !dbg !3003
  br i1 %62, label %63, label %71, !dbg !3004

63:                                               ; preds = %58
  %64 = load i32, ptr %3, align 4, !dbg !3005
  %65 = call noundef i32 @_Z10POrderListi(i32 noundef %64), !dbg !3006
  %66 = load i32, ptr %6, align 4, !dbg !3007
  %67 = call noundef i32 @_Z10POrderListi(i32 noundef %66), !dbg !3008
  %68 = icmp slt i32 %65, %67, !dbg !3009
  br i1 %68, label %69, label %71, !dbg !3004

69:                                               ; preds = %63
  %70 = load i32, ptr %3, align 4, !dbg !3010
  call void @_Z13select_weaponiiii(i32 noundef %70, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !3011
  br label %71, !dbg !3011

71:                                               ; preds = %69, %63, %58
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef 7, i32 noundef 14, i32 noundef 21), !dbg !3012
  %72 = load i32, ptr %3, align 4, !dbg !3013
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.26, i32 noundef %72), !dbg !3013
  %73 = load i32, ptr %3, align 4, !dbg !3014
  %74 = icmp ne i32 %73, 0, !dbg !3016
  br i1 %74, label %75, label %82, !dbg !3016

75:                                               ; preds = %71
  %76 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !3017
  %77 = load i32, ptr %3, align 4, !dbg !3017
  %78 = sext i32 %77 to i64, !dbg !3017
  %79 = getelementptr inbounds ptr, ptr %76, i64 %78, !dbg !3017
  %80 = load ptr, ptr %79, align 8, !dbg !3017
  %81 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.16, ptr noundef %80), !dbg !3018
  br label %82, !dbg !3018

82:                                               ; preds = %75, %71
  store i32 1, ptr %2, align 4, !dbg !3019
  br label %83, !dbg !3019

83:                                               ; preds = %82, %25
  %84 = load i32, ptr %2, align 4, !dbg !3020
  ret i32 %84, !dbg !3020
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z20check_to_use_primaryi(i32 noundef %0) #1 !dbg !3021 {
  %2 = alloca i32, align 4
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !3022, !DIExpression(), !3023)
    #dbg_declare(ptr %3, !3024, !DIExpression(), !3025)
  %6 = load i32, ptr @Player_num, align 4, !dbg !3026
  %7 = sext i32 %6 to i64, !dbg !3027
  %8 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %7, !dbg !3027
  %9 = getelementptr inbounds nuw %struct.player, ptr %8, i32 0, i32 15, !dbg !3028
  %10 = load i16, ptr %9, align 2, !dbg !3028
  store i16 %10, ptr %3, align 2, !dbg !3025
    #dbg_declare(ptr %4, !3029, !DIExpression(), !3030)
  %11 = load i32, ptr %2, align 4, !dbg !3031
  %12 = shl i32 1, %11, !dbg !3032
  %13 = trunc i32 %12 to i16, !dbg !3033
  store i16 %13, ptr %4, align 2, !dbg !3030
    #dbg_declare(ptr %5, !3034, !DIExpression(), !3035)
  %14 = call noundef i32 @_Z10POrderListi(i32 noundef 255), !dbg !3036
  store i32 %14, ptr %5, align 4, !dbg !3037
  %15 = load i16, ptr %3, align 2, !dbg !3038
  %16 = zext i16 %15 to i32, !dbg !3038
  %17 = load i16, ptr %4, align 2, !dbg !3040
  %18 = zext i16 %17 to i32, !dbg !3040
  %19 = and i32 %16, %18, !dbg !3041
  %20 = icmp ne i32 %19, 0, !dbg !3042
  br i1 %20, label %40, label %21, !dbg !3043

21:                                               ; preds = %1
  %22 = load i32, ptr %2, align 4, !dbg !3044
  %23 = call noundef i32 @_Z10POrderListi(i32 noundef %22), !dbg !3045
  %24 = load i32, ptr %5, align 4, !dbg !3046
  %25 = icmp slt i32 %23, %24, !dbg !3047
  br i1 %25, label %26, label %40, !dbg !3048

26:                                               ; preds = %21
  %27 = load i32, ptr %2, align 4, !dbg !3049
  %28 = call noundef i32 @_Z10POrderListi(i32 noundef %27), !dbg !3050
  %29 = load i8, ptr @Primary_weapon, align 1, !dbg !3051
  %30 = sext i8 %29 to i32, !dbg !3051
  %31 = call noundef i32 @_Z10POrderListi(i32 noundef %30), !dbg !3052
  %32 = icmp slt i32 %28, %31, !dbg !3053
  br i1 %32, label %33, label %40, !dbg !3048

33:                                               ; preds = %26
  %34 = load i32, ptr %2, align 4, !dbg !3054
  %35 = icmp eq i32 %34, 5, !dbg !3056
  br i1 %35, label %36, label %37, !dbg !3056

36:                                               ; preds = %33
  call void @_Z13select_weaponiiii(i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !3057
  br label %39, !dbg !3057

37:                                               ; preds = %33
  %38 = load i32, ptr %2, align 4, !dbg !3058
  call void @_Z13select_weaponiiii(i32 noundef %38, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !3059
  br label %39

39:                                               ; preds = %37, %36
  br label %40, !dbg !3060

40:                                               ; preds = %39, %26, %21, %1
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef 7, i32 noundef 14, i32 noundef 21), !dbg !3061
  ret i32 1, !dbg !3062
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z12pick_up_ammoiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #1 !dbg !3063 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !3066, !DIExpression(), !3067)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !3068, !DIExpression(), !3069)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !3070, !DIExpression(), !3071)
    #dbg_declare(ptr %8, !3072, !DIExpression(), !3073)
    #dbg_declare(ptr %9, !3074, !DIExpression(), !3075)
    #dbg_declare(ptr %10, !3076, !DIExpression(), !3077)
  %12 = load i8, ptr @Primary_weapon, align 1, !dbg !3078
  %13 = sext i8 %12 to i32, !dbg !3078
  store i32 %13, ptr %10, align 4, !dbg !3077
    #dbg_declare(ptr %11, !3079, !DIExpression(), !3080)
  %14 = load i32, ptr %5, align 4, !dbg !3081
  store i32 %14, ptr %11, align 4, !dbg !3080
  %15 = load i32, ptr %5, align 4, !dbg !3082
  %16 = icmp eq i32 %15, 0, !dbg !3082
  br i1 %16, label %17, label %20, !dbg !3082

17:                                               ; preds = %3
  %18 = load i32, ptr %6, align 4, !dbg !3082
  %19 = icmp eq i32 %18, 1, !dbg !3082
  br label %20

20:                                               ; preds = %17, %3
  %21 = phi i1 [ false, %3 ], [ %19, %17 ], !dbg !3083
  %22 = zext i1 %21 to i32, !dbg !3082
  call void @_Z7_AssertiPKcS0_i(i32 noundef %22, ptr noundef @.str.27, ptr noundef @.str.7, i32 noundef 816), !dbg !3082
  %23 = load i32, ptr %6, align 4, !dbg !3084
  %24 = sext i32 %23 to i64, !dbg !3085
  %25 = getelementptr inbounds [10 x i32], ptr @Primary_ammo_max, i64 0, i64 %24, !dbg !3085
  %26 = load i32, ptr %25, align 4, !dbg !3085
  store i32 %26, ptr %8, align 4, !dbg !3086
  %27 = load i32, ptr @Player_num, align 4, !dbg !3087
  %28 = sext i32 %27 to i64, !dbg !3089
  %29 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %28, !dbg !3089
  %30 = getelementptr inbounds nuw %struct.player, ptr %29, i32 0, i32 7, !dbg !3090
  %31 = load i32, ptr %30, align 4, !dbg !3090
  %32 = and i32 %31, 128, !dbg !3091
  %33 = icmp ne i32 %32, 0, !dbg !3089
  br i1 %33, label %34, label %37, !dbg !3089

34:                                               ; preds = %20
  %35 = load i32, ptr %8, align 4, !dbg !3092
  %36 = mul nsw i32 %35, 2, !dbg !3092
  store i32 %36, ptr %8, align 4, !dbg !3092
  br label %37, !dbg !3093

37:                                               ; preds = %34, %20
  %38 = load i32, ptr @Player_num, align 4, !dbg !3094
  %39 = sext i32 %38 to i64, !dbg !3096
  %40 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %39, !dbg !3096
  %41 = getelementptr inbounds nuw %struct.player, ptr %40, i32 0, i32 17, !dbg !3097
  %42 = load i32, ptr %6, align 4, !dbg !3098
  %43 = sext i32 %42 to i64, !dbg !3096
  %44 = getelementptr inbounds [10 x i16], ptr %41, i64 0, i64 %43, !dbg !3096
  %45 = load i16, ptr %44, align 2, !dbg !3096
  %46 = zext i16 %45 to i32, !dbg !3096
  %47 = load i32, ptr %8, align 4, !dbg !3099
  %48 = icmp eq i32 %46, %47, !dbg !3100
  br i1 %48, label %49, label %50, !dbg !3100

49:                                               ; preds = %37
  store i32 0, ptr %4, align 4, !dbg !3101
  br label %154, !dbg !3101

50:                                               ; preds = %37
  %51 = load i32, ptr @Player_num, align 4, !dbg !3102
  %52 = sext i32 %51 to i64, !dbg !3103
  %53 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %52, !dbg !3103
  %54 = getelementptr inbounds nuw %struct.player, ptr %53, i32 0, i32 17, !dbg !3104
  %55 = load i32, ptr %6, align 4, !dbg !3105
  %56 = sext i32 %55 to i64, !dbg !3103
  %57 = getelementptr inbounds [10 x i16], ptr %54, i64 0, i64 %56, !dbg !3103
  %58 = load i16, ptr %57, align 2, !dbg !3103
  %59 = zext i16 %58 to i32, !dbg !3103
  store i32 %59, ptr %11, align 4, !dbg !3106
  %60 = load i32, ptr %7, align 4, !dbg !3107
  %61 = load i32, ptr @Player_num, align 4, !dbg !3108
  %62 = sext i32 %61 to i64, !dbg !3109
  %63 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %62, !dbg !3109
  %64 = getelementptr inbounds nuw %struct.player, ptr %63, i32 0, i32 17, !dbg !3110
  %65 = load i32, ptr %6, align 4, !dbg !3111
  %66 = sext i32 %65 to i64, !dbg !3109
  %67 = getelementptr inbounds [10 x i16], ptr %64, i64 0, i64 %66, !dbg !3109
  %68 = load i16, ptr %67, align 2, !dbg !3112
  %69 = zext i16 %68 to i32, !dbg !3112
  %70 = add nsw i32 %69, %60, !dbg !3112
  %71 = trunc i32 %70 to i16, !dbg !3112
  store i16 %71, ptr %67, align 2, !dbg !3112
  %72 = load i32, ptr @Player_num, align 4, !dbg !3113
  %73 = sext i32 %72 to i64, !dbg !3115
  %74 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %73, !dbg !3115
  %75 = getelementptr inbounds nuw %struct.player, ptr %74, i32 0, i32 17, !dbg !3116
  %76 = load i32, ptr %6, align 4, !dbg !3117
  %77 = sext i32 %76 to i64, !dbg !3115
  %78 = getelementptr inbounds [10 x i16], ptr %75, i64 0, i64 %77, !dbg !3115
  %79 = load i16, ptr %78, align 2, !dbg !3115
  %80 = zext i16 %79 to i32, !dbg !3115
  %81 = load i32, ptr %8, align 4, !dbg !3118
  %82 = icmp sgt i32 %80, %81, !dbg !3119
  br i1 %82, label %83, label %106, !dbg !3119

83:                                               ; preds = %50
  %84 = load i32, ptr %8, align 4, !dbg !3120
  %85 = load i32, ptr @Player_num, align 4, !dbg !3122
  %86 = sext i32 %85 to i64, !dbg !3123
  %87 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %86, !dbg !3123
  %88 = getelementptr inbounds nuw %struct.player, ptr %87, i32 0, i32 17, !dbg !3124
  %89 = load i32, ptr %6, align 4, !dbg !3125
  %90 = sext i32 %89 to i64, !dbg !3123
  %91 = getelementptr inbounds [10 x i16], ptr %88, i64 0, i64 %90, !dbg !3123
  %92 = load i16, ptr %91, align 2, !dbg !3123
  %93 = zext i16 %92 to i32, !dbg !3123
  %94 = sub nsw i32 %84, %93, !dbg !3126
  %95 = load i32, ptr %7, align 4, !dbg !3127
  %96 = add nsw i32 %95, %94, !dbg !3127
  store i32 %96, ptr %7, align 4, !dbg !3127
  %97 = load i32, ptr %8, align 4, !dbg !3128
  %98 = trunc i32 %97 to i16, !dbg !3128
  %99 = load i32, ptr @Player_num, align 4, !dbg !3129
  %100 = sext i32 %99 to i64, !dbg !3130
  %101 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %100, !dbg !3130
  %102 = getelementptr inbounds nuw %struct.player, ptr %101, i32 0, i32 17, !dbg !3131
  %103 = load i32, ptr %6, align 4, !dbg !3132
  %104 = sext i32 %103 to i64, !dbg !3130
  %105 = getelementptr inbounds [10 x i16], ptr %102, i64 0, i64 %104, !dbg !3130
  store i16 %98, ptr %105, align 2, !dbg !3133
  br label %106, !dbg !3134

106:                                              ; preds = %83, %50
  %107 = call noundef i32 @_Z10POrderListi(i32 noundef 255), !dbg !3135
  store i32 %107, ptr %9, align 4, !dbg !3136
  %108 = load i8, ptr @Primary_weapon, align 1, !dbg !3137
  %109 = sext i8 %108 to i32, !dbg !3137
  %110 = icmp eq i32 %109, 0, !dbg !3139
  br i1 %110, label %111, label %120, !dbg !3140

111:                                              ; preds = %106
  %112 = load i32, ptr @Player_num, align 4, !dbg !3141
  %113 = sext i32 %112 to i64, !dbg !3142
  %114 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %113, !dbg !3142
  %115 = getelementptr inbounds nuw %struct.player, ptr %114, i32 0, i32 12, !dbg !3143
  %116 = load i8, ptr %115, align 2, !dbg !3143
  %117 = zext i8 %116 to i32, !dbg !3142
  %118 = icmp sge i32 %117, 4, !dbg !3144
  br i1 %118, label %119, label %120, !dbg !3140

119:                                              ; preds = %111
  store i32 5, ptr %10, align 4, !dbg !3145
  br label %120, !dbg !3146

120:                                              ; preds = %119, %111, %106
  %121 = load i32, ptr @Player_num, align 4, !dbg !3147
  %122 = sext i32 %121 to i64, !dbg !3149
  %123 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %122, !dbg !3149
  %124 = getelementptr inbounds nuw %struct.player, ptr %123, i32 0, i32 15, !dbg !3150
  %125 = load i16, ptr %124, align 2, !dbg !3150
  %126 = zext i16 %125 to i32, !dbg !3149
  %127 = load i32, ptr %6, align 4, !dbg !3151
  %128 = shl i32 1, %127, !dbg !3152
  %129 = and i32 %126, %128, !dbg !3153
  %130 = icmp ne i32 %129, 0, !dbg !3149
  br i1 %130, label %131, label %152, !dbg !3154

131:                                              ; preds = %120
  %132 = load i32, ptr %6, align 4, !dbg !3155
  %133 = load i8, ptr @Primary_weapon, align 1, !dbg !3156
  %134 = sext i8 %133 to i32, !dbg !3156
  %135 = icmp sgt i32 %132, %134, !dbg !3157
  br i1 %135, label %136, label %152, !dbg !3158

136:                                              ; preds = %131
  %137 = load i32, ptr %11, align 4, !dbg !3159
  %138 = icmp eq i32 %137, 0, !dbg !3160
  br i1 %138, label %139, label %152, !dbg !3161

139:                                              ; preds = %136
  %140 = load i32, ptr %6, align 4, !dbg !3162
  %141 = call noundef i32 @_Z10POrderListi(i32 noundef %140), !dbg !3163
  %142 = load i32, ptr %9, align 4, !dbg !3164
  %143 = icmp slt i32 %141, %142, !dbg !3165
  br i1 %143, label %144, label %152, !dbg !3166

144:                                              ; preds = %139
  %145 = load i32, ptr %6, align 4, !dbg !3167
  %146 = call noundef i32 @_Z10POrderListi(i32 noundef %145), !dbg !3168
  %147 = load i32, ptr %10, align 4, !dbg !3169
  %148 = call noundef i32 @_Z10POrderListi(i32 noundef %147), !dbg !3170
  %149 = icmp slt i32 %146, %148, !dbg !3171
  br i1 %149, label %150, label %152, !dbg !3166

150:                                              ; preds = %144
  %151 = load i32, ptr %6, align 4, !dbg !3172
  call void @_Z13select_weaponiiii(i32 noundef %151, i32 noundef 0, i32 noundef 0, i32 noundef 1), !dbg !3173
  br label %152, !dbg !3173

152:                                              ; preds = %150, %144, %139, %136, %131, %120
  %153 = load i32, ptr %7, align 4, !dbg !3174
  store i32 %153, ptr %4, align 4, !dbg !3175
  br label %154, !dbg !3175

154:                                              ; preds = %152, %49
  %155 = load i32, ptr %4, align 4, !dbg !3176
  ret i32 %155, !dbg !3176
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z20init_smega_detonatesv() #0 !dbg !3177 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !3178, !DIExpression(), !3179)
  store i32 0, ptr %1, align 4, !dbg !3180
  br label %2, !dbg !3182

2:                                                ; preds = %9, %0
  %3 = load i32, ptr %1, align 4, !dbg !3183
  %4 = icmp slt i32 %3, 4, !dbg !3185
  br i1 %4, label %5, label %12, !dbg !3186

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !3187
  %7 = sext i32 %6 to i64, !dbg !3188
  %8 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %7, !dbg !3188
  store i32 0, ptr %8, align 4, !dbg !3189
  br label %9, !dbg !3188

9:                                                ; preds = %5
  %10 = load i32, ptr %1, align 4, !dbg !3190
  %11 = add nsw i32 %10, 1, !dbg !3190
  store i32 %11, ptr %1, align 4, !dbg !3190
  br label %2, !dbg !3191, !llvm.loop !3192

12:                                               ; preds = %2
  ret void, !dbg !3194
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19rock_the_mine_framev() #1 !dbg !3195 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
    #dbg_declare(ptr %1, !3196, !DIExpression(), !3197)
  store i32 0, ptr %1, align 4, !dbg !3198
  br label %6, !dbg !3200

6:                                                ; preds = %113, %0
  %7 = load i32, ptr %1, align 4, !dbg !3201
  %8 = icmp slt i32 %7, 4, !dbg !3203
  br i1 %8, label %9, label %116, !dbg !3204

9:                                                ; preds = %6
  %10 = load i32, ptr %1, align 4, !dbg !3205
  %11 = sext i32 %10 to i64, !dbg !3208
  %12 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %11, !dbg !3208
  %13 = load i32, ptr %12, align 4, !dbg !3208
  %14 = icmp ne i32 %13, 0, !dbg !3209
  br i1 %14, label %15, label %112, !dbg !3209

15:                                               ; preds = %9
    #dbg_declare(ptr %2, !3210, !DIExpression(), !3212)
  %16 = load i32, ptr @GameTime, align 4, !dbg !3213
  %17 = load i32, ptr %1, align 4, !dbg !3214
  %18 = sext i32 %17 to i64, !dbg !3215
  %19 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %18, !dbg !3215
  %20 = load i32, ptr %19, align 4, !dbg !3215
  %21 = sub nsw i32 %16, %20, !dbg !3216
  store i32 %21, ptr %2, align 4, !dbg !3217
  %22 = load i32, ptr @Seismic_sound_playing, align 4, !dbg !3218
  %23 = icmp ne i32 %22, 0, !dbg !3218
  br i1 %23, label %30, label %24, !dbg !3220

24:                                               ; preds = %15
  %25 = load i32, ptr @Seismic_sound, align 4, !dbg !3221
  call void @_Z24digi_play_sample_loopingiiii(i32 noundef %25, i32 noundef 65536, i32 noundef -1, i32 noundef -1), !dbg !3223
  store i32 1, ptr @Seismic_sound_playing, align 4, !dbg !3224
  %26 = load i32, ptr @GameTime, align 4, !dbg !3225
  %27 = call noundef i32 @_Z6P_Randv(), !dbg !3226
  %28 = sdiv i32 %27, 2, !dbg !3227
  %29 = add nsw i32 %26, %28, !dbg !3228
  store i32 %29, ptr @Next_seismic_sound_time, align 4, !dbg !3229
  br label %30, !dbg !3230

30:                                               ; preds = %24, %15
  %31 = load i32, ptr %2, align 4, !dbg !3231
  %32 = icmp slt i32 %31, 131072, !dbg !3233
  br i1 %32, label %33, label %107, !dbg !3233

33:                                               ; preds = %30
    #dbg_declare(ptr %3, !3234, !DIExpression(), !3236)
    #dbg_declare(ptr %4, !3237, !DIExpression(), !3238)
    #dbg_declare(ptr %5, !3239, !DIExpression(), !3240)
  %34 = load i32, ptr %2, align 4, !dbg !3241
  %35 = sub nsw i32 131072, %34, !dbg !3242
  %36 = sdiv i32 %35, 2, !dbg !3243
  store i32 %36, ptr %3, align 4, !dbg !3244
  %37 = load i32, ptr %3, align 4, !dbg !3245
  %38 = sdiv i32 %37, 4096, !dbg !3245
  store i32 %38, ptr %3, align 4, !dbg !3245
  %39 = load i32, ptr %3, align 4, !dbg !3246
  %40 = icmp sgt i32 %39, 16, !dbg !3248
  br i1 %40, label %41, label %42, !dbg !3248

41:                                               ; preds = %33
  store i32 16, ptr %3, align 4, !dbg !3249
  br label %42, !dbg !3250

42:                                               ; preds = %41, %33
  %43 = load i32, ptr %3, align 4, !dbg !3251
  %44 = icmp eq i32 %43, 0, !dbg !3253
  br i1 %44, label %45, label %46, !dbg !3253

45:                                               ; preds = %42
  store i32 1, ptr %3, align 4, !dbg !3254
  br label %46, !dbg !3255

46:                                               ; preds = %45, %42
  %47 = load i32, ptr %3, align 4, !dbg !3256
  %48 = load i32, ptr @Seismic_tremor_volume, align 4, !dbg !3257
  %49 = add nsw i32 %48, %47, !dbg !3257
  store i32 %49, ptr @Seismic_tremor_volume, align 4, !dbg !3257
  %50 = call noundef i32 @_Z6P_Randv(), !dbg !3258
  %51 = sub nsw i32 %50, 16384, !dbg !3259
  %52 = load i32, ptr %3, align 4, !dbg !3260
  %53 = sub nsw i32 16, %52, !dbg !3261
  %54 = mul nsw i32 65536, %53, !dbg !3262
  %55 = sdiv i32 %54, 32, !dbg !3263
  %56 = add nsw i32 12288, %55, !dbg !3264
  %57 = call noundef i32 @_Z6fixmulii(i32 noundef %51, i32 noundef %56), !dbg !3265
  store i32 %57, ptr %4, align 4, !dbg !3266
  %58 = call noundef i32 @_Z6P_Randv(), !dbg !3267
  %59 = sub nsw i32 %58, 16384, !dbg !3268
  %60 = load i32, ptr %3, align 4, !dbg !3269
  %61 = sub nsw i32 16, %60, !dbg !3270
  %62 = mul nsw i32 65536, %61, !dbg !3271
  %63 = sdiv i32 %62, 32, !dbg !3272
  %64 = add nsw i32 12288, %63, !dbg !3273
  %65 = call noundef i32 @_Z6fixmulii(i32 noundef %59, i32 noundef %64), !dbg !3274
  store i32 %65, ptr %5, align 4, !dbg !3275
  %66 = load i32, ptr %4, align 4, !dbg !3276
  %67 = load ptr, ptr @ConsoleObject, align 8, !dbg !3277
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 21, !dbg !3278
  %69 = getelementptr inbounds nuw %struct.physics_info, ptr %68, i32 0, i32 5, !dbg !3279
  %70 = getelementptr inbounds nuw %struct.vms_vector, ptr %69, i32 0, i32 0, !dbg !3280
  %71 = load i32, ptr %70, align 4, !dbg !3281
  %72 = add nsw i32 %71, %66, !dbg !3281
  store i32 %72, ptr %70, align 4, !dbg !3281
  %73 = load i32, ptr %5, align 4, !dbg !3282
  %74 = load ptr, ptr @ConsoleObject, align 8, !dbg !3283
  %75 = getelementptr inbounds nuw %struct.object, ptr %74, i32 0, i32 21, !dbg !3284
  %76 = getelementptr inbounds nuw %struct.physics_info, ptr %75, i32 0, i32 5, !dbg !3285
  %77 = getelementptr inbounds nuw %struct.vms_vector, ptr %76, i32 0, i32 2, !dbg !3286
  %78 = load i32, ptr %77, align 4, !dbg !3287
  %79 = add nsw i32 %78, %73, !dbg !3287
  store i32 %79, ptr %77, align 4, !dbg !3287
  %80 = load i32, ptr @Buddy_objnum, align 4, !dbg !3288
  %81 = icmp ne i32 %80, -1, !dbg !3290
  br i1 %81, label %82, label %103, !dbg !3290

82:                                               ; preds = %46
  %83 = load i32, ptr %4, align 4, !dbg !3291
  %84 = mul nsw i32 %83, 4, !dbg !3293
  %85 = load i32, ptr @Buddy_objnum, align 4, !dbg !3294
  %86 = sext i32 %85 to i64, !dbg !3295
  %87 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %86, !dbg !3295
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 21, !dbg !3296
  %89 = getelementptr inbounds nuw %struct.physics_info, ptr %88, i32 0, i32 5, !dbg !3297
  %90 = getelementptr inbounds nuw %struct.vms_vector, ptr %89, i32 0, i32 0, !dbg !3298
  %91 = load i32, ptr %90, align 4, !dbg !3299
  %92 = add nsw i32 %91, %84, !dbg !3299
  store i32 %92, ptr %90, align 4, !dbg !3299
  %93 = load i32, ptr %5, align 4, !dbg !3300
  %94 = mul nsw i32 %93, 4, !dbg !3301
  %95 = load i32, ptr @Buddy_objnum, align 4, !dbg !3302
  %96 = sext i32 %95 to i64, !dbg !3303
  %97 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %96, !dbg !3303
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 21, !dbg !3304
  %99 = getelementptr inbounds nuw %struct.physics_info, ptr %98, i32 0, i32 5, !dbg !3305
  %100 = getelementptr inbounds nuw %struct.vms_vector, ptr %99, i32 0, i32 2, !dbg !3306
  %101 = load i32, ptr %100, align 4, !dbg !3307
  %102 = add nsw i32 %101, %94, !dbg !3307
  store i32 %102, ptr %100, align 4, !dbg !3307
  br label %103, !dbg !3308

103:                                              ; preds = %82, %46
  %104 = load i32, ptr %4, align 4, !dbg !3309
  %105 = load i32, ptr @Seismic_tremor_magnitude, align 4, !dbg !3310
  %106 = add nsw i32 %105, %104, !dbg !3310
  store i32 %106, ptr @Seismic_tremor_magnitude, align 4, !dbg !3310
  br label %111, !dbg !3311

107:                                              ; preds = %30
  %108 = load i32, ptr %1, align 4, !dbg !3312
  %109 = sext i32 %108 to i64, !dbg !3313
  %110 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %109, !dbg !3313
  store i32 0, ptr %110, align 4, !dbg !3314
  br label %111

111:                                              ; preds = %107, %103
  br label %112, !dbg !3315

112:                                              ; preds = %111, %9
  br label %113, !dbg !3316

113:                                              ; preds = %112
  %114 = load i32, ptr %1, align 4, !dbg !3317
  %115 = add nsw i32 %114, 1, !dbg !3317
  store i32 %115, ptr %1, align 4, !dbg !3317
  br label %6, !dbg !3318, !llvm.loop !3319

116:                                              ; preds = %6
  ret void, !dbg !3321
}

declare void @_Z24digi_play_sample_loopingiiii(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z6P_Randv() #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #0 !dbg !3322 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3325, !DIExpression(), !3326)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3327, !DIExpression(), !3328)
  %5 = load i32, ptr %3, align 4, !dbg !3329
  %6 = sext i32 %5 to i64, !dbg !3329
  %7 = load i32, ptr %4, align 4, !dbg !3330
  %8 = sext i32 %7 to i64, !dbg !3330
  %9 = mul nsw i64 %6, %8, !dbg !3331
  %10 = ashr i64 %9, 16, !dbg !3332
  %11 = trunc i64 %10 to i32, !dbg !3333
  ret i32 %11, !dbg !3334
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z16on_seismic_levelv() #0 !dbg !3335 {
  %1 = load i32, ptr @Seismic_level, align 4, !dbg !3336
  ret i32 %1, !dbg !3337
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z25init_seismic_disturbancesv() #0 !dbg !3338 {
  store i32 0, ptr @Seismic_disturbance_start_time, align 4, !dbg !3339
  store i32 0, ptr @Seismic_disturbance_end_time, align 4, !dbg !3340
  ret void, !dbg !3341
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z25start_seismic_disturbancev() #1 !dbg !3342 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %2, !3343, !DIExpression(), !3344)
  %3 = load i32, ptr @Level_shake_duration, align 4, !dbg !3345
  %4 = icmp slt i32 %3, 1, !dbg !3347
  br i1 %4, label %5, label %6, !dbg !3347

5:                                                ; preds = %0
  store i32 0, ptr %1, align 4, !dbg !3348
  br label %32, !dbg !3348

6:                                                ; preds = %0
  %7 = call noundef i32 @_Z6P_Randv(), !dbg !3349
  %8 = load i32, ptr @Level_shake_frequency, align 4, !dbg !3350
  %9 = call noundef i32 @_Z6fixmulii(i32 noundef %7, i32 noundef %8), !dbg !3351
  %10 = mul nsw i32 2, %9, !dbg !3352
  %11 = load i32, ptr @FrameTime, align 4, !dbg !3353
  %12 = icmp slt i32 %10, %11, !dbg !3354
  %13 = zext i1 %12 to i32, !dbg !3355
  store i32 %13, ptr %2, align 4, !dbg !3356
  %14 = load i32, ptr %2, align 4, !dbg !3357
  %15 = icmp ne i32 %14, 0, !dbg !3357
  br i1 %15, label %16, label %30, !dbg !3357

16:                                               ; preds = %6
  %17 = load i32, ptr @GameTime, align 4, !dbg !3359
  store i32 %17, ptr @Seismic_disturbance_start_time, align 4, !dbg !3361
  %18 = load i32, ptr @GameTime, align 4, !dbg !3362
  %19 = load i32, ptr @Level_shake_duration, align 4, !dbg !3363
  %20 = add nsw i32 %18, %19, !dbg !3364
  store i32 %20, ptr @Seismic_disturbance_end_time, align 4, !dbg !3365
  %21 = load i32, ptr @Seismic_sound_playing, align 4, !dbg !3366
  %22 = icmp ne i32 %21, 0, !dbg !3366
  br i1 %22, label %29, label %23, !dbg !3368

23:                                               ; preds = %16
  %24 = load i32, ptr @Seismic_sound, align 4, !dbg !3369
  call void @_Z24digi_play_sample_loopingiiii(i32 noundef %24, i32 noundef 65536, i32 noundef -1, i32 noundef -1), !dbg !3371
  store i32 1, ptr @Seismic_sound_playing, align 4, !dbg !3372
  %25 = load i32, ptr @GameTime, align 4, !dbg !3373
  %26 = call noundef i32 @_Z6P_Randv(), !dbg !3374
  %27 = sdiv i32 %26, 2, !dbg !3375
  %28 = add nsw i32 %25, %27, !dbg !3376
  store i32 %28, ptr @Next_seismic_sound_time, align 4, !dbg !3377
  br label %29, !dbg !3378

29:                                               ; preds = %23, %16
  br label %30, !dbg !3379

30:                                               ; preds = %29, %6
  %31 = load i32, ptr %2, align 4, !dbg !3380
  store i32 %31, ptr %1, align 4, !dbg !3381
  br label %32, !dbg !3381

32:                                               ; preds = %30, %5
  %33 = load i32, ptr %1, align 4, !dbg !3382
  ret i32 %33, !dbg !3382
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25seismic_disturbance_framev() #1 !dbg !3383 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = load i32, ptr @Level_shake_frequency, align 4, !dbg !3384
  %6 = icmp ne i32 %5, 0, !dbg !3384
  br i1 %6, label %7, label %100, !dbg !3384

7:                                                ; preds = %0
  %8 = load i32, ptr @Seismic_disturbance_start_time, align 4, !dbg !3386
  %9 = load i32, ptr @GameTime, align 4, !dbg !3389
  %10 = icmp slt i32 %8, %9, !dbg !3390
  br i1 %10, label %11, label %15, !dbg !3391

11:                                               ; preds = %7
  %12 = load i32, ptr @Seismic_disturbance_end_time, align 4, !dbg !3392
  %13 = load i32, ptr @GameTime, align 4, !dbg !3393
  %14 = icmp sgt i32 %12, %13, !dbg !3394
  br i1 %14, label %18, label %15, !dbg !3395

15:                                               ; preds = %11, %7
  %16 = call noundef i32 @_Z25start_seismic_disturbancev(), !dbg !3396
  %17 = icmp ne i32 %16, 0, !dbg !3396
  br i1 %17, label %18, label %99, !dbg !3395

18:                                               ; preds = %15, %11
    #dbg_declare(ptr %1, !3397, !DIExpression(), !3399)
    #dbg_declare(ptr %2, !3400, !DIExpression(), !3401)
    #dbg_declare(ptr %3, !3402, !DIExpression(), !3403)
    #dbg_declare(ptr %4, !3404, !DIExpression(), !3405)
  %19 = load i32, ptr @GameTime, align 4, !dbg !3406
  %20 = load i32, ptr @Seismic_disturbance_start_time, align 4, !dbg !3407
  %21 = sub nsw i32 %19, %20, !dbg !3408
  store i32 %21, ptr %1, align 4, !dbg !3409
  %22 = load i32, ptr %1, align 4, !dbg !3410
  %23 = load i32, ptr @Seismic_disturbance_end_time, align 4, !dbg !3411
  %24 = load i32, ptr @Seismic_disturbance_start_time, align 4, !dbg !3412
  %25 = sub nsw i32 %23, %24, !dbg !3413
  %26 = sdiv i32 %25, 2, !dbg !3414
  %27 = sub nsw i32 %22, %26, !dbg !3415
  %28 = call i32 @llvm.abs.i32(i32 %27, i1 true), !dbg !3416
  store i32 %28, ptr %2, align 4, !dbg !3417
  %29 = load i32, ptr %2, align 4, !dbg !3418
  %30 = sdiv i32 %29, 4096, !dbg !3418
  store i32 %30, ptr %2, align 4, !dbg !3418
  %31 = load i32, ptr %2, align 4, !dbg !3419
  %32 = icmp sgt i32 %31, 16, !dbg !3421
  br i1 %32, label %33, label %34, !dbg !3421

33:                                               ; preds = %18
  store i32 16, ptr %2, align 4, !dbg !3422
  br label %34, !dbg !3423

34:                                               ; preds = %33, %18
  %35 = load i32, ptr %2, align 4, !dbg !3424
  %36 = icmp eq i32 %35, 0, !dbg !3426
  br i1 %36, label %37, label %38, !dbg !3426

37:                                               ; preds = %34
  store i32 1, ptr %2, align 4, !dbg !3427
  br label %38, !dbg !3428

38:                                               ; preds = %37, %34
  %39 = load i32, ptr %2, align 4, !dbg !3429
  %40 = load i32, ptr @Seismic_tremor_volume, align 4, !dbg !3430
  %41 = add nsw i32 %40, %39, !dbg !3430
  store i32 %41, ptr @Seismic_tremor_volume, align 4, !dbg !3430
  %42 = call noundef i32 @_Z6P_Randv(), !dbg !3431
  %43 = sub nsw i32 %42, 16384, !dbg !3432
  %44 = load i32, ptr %2, align 4, !dbg !3433
  %45 = sub nsw i32 16, %44, !dbg !3434
  %46 = mul nsw i32 65536, %45, !dbg !3435
  %47 = sdiv i32 %46, 32, !dbg !3436
  %48 = add nsw i32 12288, %47, !dbg !3437
  %49 = call noundef i32 @_Z6fixmulii(i32 noundef %43, i32 noundef %48), !dbg !3438
  store i32 %49, ptr %3, align 4, !dbg !3439
  %50 = call noundef i32 @_Z6P_Randv(), !dbg !3440
  %51 = sub nsw i32 %50, 16384, !dbg !3441
  %52 = load i32, ptr %2, align 4, !dbg !3442
  %53 = sub nsw i32 16, %52, !dbg !3443
  %54 = mul nsw i32 65536, %53, !dbg !3444
  %55 = sdiv i32 %54, 32, !dbg !3445
  %56 = add nsw i32 12288, %55, !dbg !3446
  %57 = call noundef i32 @_Z6fixmulii(i32 noundef %51, i32 noundef %56), !dbg !3447
  store i32 %57, ptr %4, align 4, !dbg !3448
  %58 = load i32, ptr %3, align 4, !dbg !3449
  %59 = load ptr, ptr @ConsoleObject, align 8, !dbg !3450
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 21, !dbg !3451
  %61 = getelementptr inbounds nuw %struct.physics_info, ptr %60, i32 0, i32 5, !dbg !3452
  %62 = getelementptr inbounds nuw %struct.vms_vector, ptr %61, i32 0, i32 0, !dbg !3453
  %63 = load i32, ptr %62, align 4, !dbg !3454
  %64 = add nsw i32 %63, %58, !dbg !3454
  store i32 %64, ptr %62, align 4, !dbg !3454
  %65 = load i32, ptr %4, align 4, !dbg !3455
  %66 = load ptr, ptr @ConsoleObject, align 8, !dbg !3456
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 21, !dbg !3457
  %68 = getelementptr inbounds nuw %struct.physics_info, ptr %67, i32 0, i32 5, !dbg !3458
  %69 = getelementptr inbounds nuw %struct.vms_vector, ptr %68, i32 0, i32 2, !dbg !3459
  %70 = load i32, ptr %69, align 4, !dbg !3460
  %71 = add nsw i32 %70, %65, !dbg !3460
  store i32 %71, ptr %69, align 4, !dbg !3460
  %72 = load i32, ptr @Buddy_objnum, align 4, !dbg !3461
  %73 = icmp ne i32 %72, -1, !dbg !3463
  br i1 %73, label %74, label %95, !dbg !3463

74:                                               ; preds = %38
  %75 = load i32, ptr %3, align 4, !dbg !3464
  %76 = mul nsw i32 %75, 4, !dbg !3466
  %77 = load i32, ptr @Buddy_objnum, align 4, !dbg !3467
  %78 = sext i32 %77 to i64, !dbg !3468
  %79 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %78, !dbg !3468
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 21, !dbg !3469
  %81 = getelementptr inbounds nuw %struct.physics_info, ptr %80, i32 0, i32 5, !dbg !3470
  %82 = getelementptr inbounds nuw %struct.vms_vector, ptr %81, i32 0, i32 0, !dbg !3471
  %83 = load i32, ptr %82, align 4, !dbg !3472
  %84 = add nsw i32 %83, %76, !dbg !3472
  store i32 %84, ptr %82, align 4, !dbg !3472
  %85 = load i32, ptr %4, align 4, !dbg !3473
  %86 = mul nsw i32 %85, 4, !dbg !3474
  %87 = load i32, ptr @Buddy_objnum, align 4, !dbg !3475
  %88 = sext i32 %87 to i64, !dbg !3476
  %89 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %88, !dbg !3476
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 21, !dbg !3477
  %91 = getelementptr inbounds nuw %struct.physics_info, ptr %90, i32 0, i32 5, !dbg !3478
  %92 = getelementptr inbounds nuw %struct.vms_vector, ptr %91, i32 0, i32 2, !dbg !3479
  %93 = load i32, ptr %92, align 4, !dbg !3480
  %94 = add nsw i32 %93, %86, !dbg !3480
  store i32 %94, ptr %92, align 4, !dbg !3480
  br label %95, !dbg !3481

95:                                               ; preds = %74, %38
  %96 = load i32, ptr %3, align 4, !dbg !3482
  %97 = load i32, ptr @Seismic_tremor_magnitude, align 4, !dbg !3483
  %98 = add nsw i32 %97, %96, !dbg !3483
  store i32 %98, ptr @Seismic_tremor_magnitude, align 4, !dbg !3483
  br label %99, !dbg !3484

99:                                               ; preds = %95, %15
  br label %100, !dbg !3485

100:                                              ; preds = %99, %0
  ret void, !dbg !3486
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z16smega_rock_stuffv() #0 !dbg !3487 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !3488, !DIExpression(), !3489)
  store i32 0, ptr %1, align 4, !dbg !3490
  br label %2, !dbg !3492

2:                                                ; preds = %18, %0
  %3 = load i32, ptr %1, align 4, !dbg !3493
  %4 = icmp slt i32 %3, 4, !dbg !3495
  br i1 %4, label %5, label %21, !dbg !3496

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !3497
  %7 = sext i32 %6 to i64, !dbg !3500
  %8 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %7, !dbg !3500
  %9 = load i32, ptr %8, align 4, !dbg !3500
  %10 = add nsw i32 %9, 131072, !dbg !3501
  %11 = load i32, ptr @GameTime, align 4, !dbg !3502
  %12 = icmp slt i32 %10, %11, !dbg !3503
  br i1 %12, label %13, label %17, !dbg !3503

13:                                               ; preds = %5
  %14 = load i32, ptr %1, align 4, !dbg !3504
  %15 = sext i32 %14 to i64, !dbg !3505
  %16 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %15, !dbg !3505
  store i32 0, ptr %16, align 4, !dbg !3506
  br label %17, !dbg !3505

17:                                               ; preds = %13, %5
  br label %18, !dbg !3507

18:                                               ; preds = %17
  %19 = load i32, ptr %1, align 4, !dbg !3508
  %20 = add nsw i32 %19, 1, !dbg !3508
  store i32 %20, ptr %1, align 4, !dbg !3508
  br label %2, !dbg !3509, !llvm.loop !3510

21:                                               ; preds = %2
  store i32 0, ptr %1, align 4, !dbg !3512
  br label %22, !dbg !3514

22:                                               ; preds = %37, %21
  %23 = load i32, ptr %1, align 4, !dbg !3515
  %24 = icmp slt i32 %23, 4, !dbg !3517
  br i1 %24, label %25, label %40, !dbg !3518

25:                                               ; preds = %22
  %26 = load i32, ptr %1, align 4, !dbg !3519
  %27 = sext i32 %26 to i64, !dbg !3522
  %28 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %27, !dbg !3522
  %29 = load i32, ptr %28, align 4, !dbg !3522
  %30 = icmp eq i32 %29, 0, !dbg !3523
  br i1 %30, label %31, label %36, !dbg !3523

31:                                               ; preds = %25
  %32 = load i32, ptr @GameTime, align 4, !dbg !3524
  %33 = load i32, ptr %1, align 4, !dbg !3526
  %34 = sext i32 %33 to i64, !dbg !3527
  %35 = getelementptr inbounds [4 x i32], ptr @Smega_detonate_times, i64 0, i64 %34, !dbg !3527
  store i32 %32, ptr %35, align 4, !dbg !3528
  br label %41, !dbg !3529

36:                                               ; preds = %25
  br label %37, !dbg !3530

37:                                               ; preds = %36
  %38 = load i32, ptr %1, align 4, !dbg !3531
  %39 = add nsw i32 %38, 1, !dbg !3531
  store i32 %39, ptr %1, align 4, !dbg !3531
  br label %22, !dbg !3532, !llvm.loop !3533

40:                                               ; preds = %22
  br label %41, !dbg !3535

41:                                               ; preds = %40, %31
  ret void, !dbg !3535
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25process_super_mines_framev() #1 !dbg !3536 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.fvi_query, align 8
  %9 = alloca %struct.fvi_info, align 4
  %10 = alloca i32, align 4
    #dbg_declare(ptr %1, !3537, !DIExpression(), !3538)
    #dbg_declare(ptr %2, !3539, !DIExpression(), !3540)
    #dbg_declare(ptr %3, !3541, !DIExpression(), !3542)
    #dbg_declare(ptr %4, !3543, !DIExpression(), !3544)
  %11 = load i32, ptr @Super_mines_yes, align 4, !dbg !3545
  %12 = icmp eq i32 %11, 0, !dbg !3547
  br i1 %12, label %13, label %16, !dbg !3547

13:                                               ; preds = %0
  %14 = load i32, ptr @FrameCount, align 4, !dbg !3548
  %15 = and i32 %14, 7, !dbg !3550
  store i32 %15, ptr %3, align 4, !dbg !3551
  store i32 8, ptr %4, align 4, !dbg !3552
  br label %17, !dbg !3553

16:                                               ; preds = %0
  store i32 0, ptr %3, align 4, !dbg !3554
  store i32 1, ptr %4, align 4, !dbg !3556
  br label %17

17:                                               ; preds = %16, %13
  store i32 0, ptr @Super_mines_yes, align 4, !dbg !3557
  %18 = load i32, ptr %3, align 4, !dbg !3558
  store i32 %18, ptr %1, align 4, !dbg !3560
  br label %19, !dbg !3561

19:                                               ; preds = %190, %17
  %20 = load i32, ptr %1, align 4, !dbg !3562
  %21 = load i32, ptr @Highest_object_index, align 4, !dbg !3564
  %22 = icmp sle i32 %20, %21, !dbg !3565
  br i1 %22, label %23, label %194, !dbg !3566

23:                                               ; preds = %19
  %24 = load i32, ptr %1, align 4, !dbg !3567
  %25 = sext i32 %24 to i64, !dbg !3570
  %26 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %25, !dbg !3570
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 1, !dbg !3571
  %28 = load i8, ptr %27, align 4, !dbg !3571
  %29 = zext i8 %28 to i32, !dbg !3570
  %30 = icmp eq i32 %29, 5, !dbg !3572
  br i1 %30, label %31, label %189, !dbg !3573

31:                                               ; preds = %23
  %32 = load i32, ptr %1, align 4, !dbg !3574
  %33 = sext i32 %32 to i64, !dbg !3575
  %34 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %33, !dbg !3575
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 2, !dbg !3576
  %36 = load i8, ptr %35, align 1, !dbg !3576
  %37 = zext i8 %36 to i32, !dbg !3575
  %38 = icmp eq i32 %37, 38, !dbg !3577
  br i1 %38, label %39, label %189, !dbg !3573

39:                                               ; preds = %31
    #dbg_declare(ptr %5, !3578, !DIExpression(), !3580)
  %40 = load i32, ptr %1, align 4, !dbg !3581
  %41 = sext i32 %40 to i64, !dbg !3582
  %42 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %41, !dbg !3582
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 22, !dbg !3583
  %44 = getelementptr inbounds nuw %struct.laser_info_s, ptr %43, i32 0, i32 1, !dbg !3584
  %45 = load i16, ptr %44, align 2, !dbg !3584
  %46 = sext i16 %45 to i32, !dbg !3582
  store i32 %46, ptr %5, align 4, !dbg !3585
  store i32 1, ptr @Super_mines_yes, align 4, !dbg !3586
  %47 = load i32, ptr %1, align 4, !dbg !3587
  %48 = sext i32 %47 to i64, !dbg !3589
  %49 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %48, !dbg !3589
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 20, !dbg !3590
  %51 = load i32, ptr %50, align 4, !dbg !3590
  %52 = add nsw i32 %51, 131072, !dbg !3591
  %53 = load i32, ptr getelementptr inbounds nuw (%struct.weapon_info, ptr getelementptr inbounds ([70 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 38), i32 0, i32 36), align 4, !dbg !3592
  %54 = icmp slt i32 %52, %53, !dbg !3593
  br i1 %54, label %55, label %188, !dbg !3593

55:                                               ; preds = %39
    #dbg_declare(ptr %6, !3594, !DIExpression(), !3604)
  %56 = load i32, ptr %1, align 4, !dbg !3605
  %57 = sext i32 %56 to i64, !dbg !3606
  %58 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %57, !dbg !3606
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 11, !dbg !3607
  store ptr %59, ptr %6, align 8, !dbg !3608
  store i32 0, ptr %2, align 4, !dbg !3609
  br label %60, !dbg !3611

60:                                               ; preds = %184, %55
  %61 = load i32, ptr %2, align 4, !dbg !3612
  %62 = load i32, ptr @Highest_object_index, align 4, !dbg !3614
  %63 = icmp sle i32 %61, %62, !dbg !3615
  br i1 %63, label %64, label %187, !dbg !3616

64:                                               ; preds = %60
  %65 = load i32, ptr %2, align 4, !dbg !3617
  %66 = sext i32 %65 to i64, !dbg !3620
  %67 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %66, !dbg !3620
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 1, !dbg !3621
  %69 = load i8, ptr %68, align 4, !dbg !3621
  %70 = zext i8 %69 to i32, !dbg !3620
  %71 = icmp eq i32 %70, 4, !dbg !3622
  br i1 %71, label %80, label %72, !dbg !3623

72:                                               ; preds = %64
  %73 = load i32, ptr %2, align 4, !dbg !3624
  %74 = sext i32 %73 to i64, !dbg !3625
  %75 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %74, !dbg !3625
  %76 = getelementptr inbounds nuw %struct.object, ptr %75, i32 0, i32 1, !dbg !3626
  %77 = load i8, ptr %76, align 4, !dbg !3626
  %78 = zext i8 %77 to i32, !dbg !3625
  %79 = icmp eq i32 %78, 2, !dbg !3627
  br i1 %79, label %80, label %183, !dbg !3623

80:                                               ; preds = %72, %64
    #dbg_declare(ptr %7, !3628, !DIExpression(), !3630)
  %81 = load ptr, ptr %6, align 8, !dbg !3631
  %82 = load i32, ptr %2, align 4, !dbg !3632
  %83 = sext i32 %82 to i64, !dbg !3633
  %84 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %83, !dbg !3633
  %85 = getelementptr inbounds nuw %struct.object, ptr %84, i32 0, i32 11, !dbg !3634
  %86 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %81, ptr noundef %85), !dbg !3635
  store i32 %86, ptr %7, align 4, !dbg !3636
  %87 = load i32, ptr %2, align 4, !dbg !3637
  %88 = load i32, ptr %5, align 4, !dbg !3639
  %89 = icmp ne i32 %87, %88, !dbg !3640
  br i1 %89, label %90, label %163, !dbg !3640

90:                                               ; preds = %80
  %91 = load i32, ptr %7, align 4, !dbg !3641
  %92 = load i32, ptr %2, align 4, !dbg !3644
  %93 = sext i32 %92 to i64, !dbg !3645
  %94 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %93, !dbg !3645
  %95 = getelementptr inbounds nuw %struct.object, ptr %94, i32 0, i32 13, !dbg !3646
  %96 = load i32, ptr %95, align 4, !dbg !3646
  %97 = sub nsw i32 %91, %96, !dbg !3647
  %98 = icmp slt i32 %97, 1310720, !dbg !3648
  br i1 %98, label %99, label %162, !dbg !3648

99:                                               ; preds = %90
  %100 = load i32, ptr %1, align 4, !dbg !3649
  %101 = sext i32 %100 to i64, !dbg !3651
  %102 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %101, !dbg !3651
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 9, !dbg !3652
  %104 = load i16, ptr %103, align 2, !dbg !3652
  %105 = sext i16 %104 to i32, !dbg !3651
  %106 = load i32, ptr %2, align 4, !dbg !3653
  %107 = sext i32 %106 to i64, !dbg !3654
  %108 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %107, !dbg !3654
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 9, !dbg !3655
  %110 = load i16, ptr %109, align 2, !dbg !3655
  %111 = sext i16 %110 to i32, !dbg !3654
  %112 = icmp eq i32 %105, %111, !dbg !3656
  br i1 %112, label %113, label %118, !dbg !3656

113:                                              ; preds = %99
  %114 = load i32, ptr %1, align 4, !dbg !3657
  %115 = sext i32 %114 to i64, !dbg !3658
  %116 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %115, !dbg !3658
  %117 = getelementptr inbounds nuw %struct.object, ptr %116, i32 0, i32 20, !dbg !3659
  store i32 1, ptr %117, align 4, !dbg !3660
  br label %161, !dbg !3658

118:                                              ; preds = %99
  %119 = load i32, ptr @FrameCount, align 4, !dbg !3661
  %120 = load i32, ptr %1, align 4, !dbg !3664
  %121 = load i32, ptr %2, align 4, !dbg !3665
  %122 = add nsw i32 %120, %121, !dbg !3666
  %123 = xor i32 %119, %122, !dbg !3667
  %124 = srem i32 %123, 4, !dbg !3668
  %125 = icmp eq i32 %124, 0, !dbg !3669
  br i1 %125, label %126, label %160, !dbg !3669

126:                                              ; preds = %118
    #dbg_declare(ptr %8, !3670, !DIExpression(), !3683)
    #dbg_declare(ptr %9, !3684, !DIExpression(), !3700)
    #dbg_declare(ptr %10, !3701, !DIExpression(), !3702)
  %127 = load i32, ptr @FrameCount, align 4, !dbg !3703
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.28, i32 noundef %127), !dbg !3703
  %128 = load i32, ptr %1, align 4, !dbg !3704
  %129 = sext i32 %128 to i64, !dbg !3705
  %130 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %129, !dbg !3705
  %131 = getelementptr inbounds nuw %struct.object, ptr %130, i32 0, i32 9, !dbg !3706
  %132 = load i16, ptr %131, align 2, !dbg !3706
  %133 = sext i16 %132 to i32, !dbg !3705
  %134 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 2, !dbg !3707
  store i32 %133, ptr %134, align 8, !dbg !3708
  %135 = load i32, ptr %1, align 4, !dbg !3709
  %136 = sext i32 %135 to i64, !dbg !3710
  %137 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %136, !dbg !3710
  %138 = getelementptr inbounds nuw %struct.object, ptr %137, i32 0, i32 11, !dbg !3711
  %139 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 0, !dbg !3712
  store ptr %138, ptr %139, align 8, !dbg !3713
  %140 = load i32, ptr %2, align 4, !dbg !3714
  %141 = sext i32 %140 to i64, !dbg !3715
  %142 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %141, !dbg !3715
  %143 = getelementptr inbounds nuw %struct.object, ptr %142, i32 0, i32 11, !dbg !3716
  %144 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 1, !dbg !3717
  store ptr %143, ptr %144, align 8, !dbg !3718
  %145 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 3, !dbg !3719
  store i32 0, ptr %145, align 4, !dbg !3720
  %146 = load i32, ptr %1, align 4, !dbg !3721
  %147 = trunc i32 %146 to i16, !dbg !3721
  %148 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 4, !dbg !3722
  store i16 %147, ptr %148, align 8, !dbg !3723
  %149 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 5, !dbg !3724
  store ptr null, ptr %149, align 8, !dbg !3725
  %150 = getelementptr inbounds nuw %struct.fvi_query, ptr %8, i32 0, i32 6, !dbg !3726
  store i32 0, ptr %150, align 8, !dbg !3727
  %151 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %8, ptr noundef %9), !dbg !3728
  store i32 %151, ptr %10, align 4, !dbg !3729
  %152 = load i32, ptr %10, align 4, !dbg !3730
  %153 = icmp ne i32 %152, 1, !dbg !3732
  br i1 %153, label %154, label %159, !dbg !3732

154:                                              ; preds = %126
  %155 = load i32, ptr %1, align 4, !dbg !3733
  %156 = sext i32 %155 to i64, !dbg !3734
  %157 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %156, !dbg !3734
  %158 = getelementptr inbounds nuw %struct.object, ptr %157, i32 0, i32 20, !dbg !3735
  store i32 1, ptr %158, align 4, !dbg !3736
  br label %159, !dbg !3734

159:                                              ; preds = %154, %126
  br label %160, !dbg !3737

160:                                              ; preds = %159, %118
  br label %161

161:                                              ; preds = %160, %113
  br label %162, !dbg !3655

162:                                              ; preds = %161, %90
  br label %182, !dbg !3738

163:                                              ; preds = %80
  %164 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3739
  %165 = icmp eq i32 %164, 0, !dbg !3741
  br i1 %165, label %166, label %181, !dbg !3741

166:                                              ; preds = %163
  %167 = load i32, ptr %7, align 4, !dbg !3742
  %168 = load i32, ptr %2, align 4, !dbg !3745
  %169 = sext i32 %168 to i64, !dbg !3746
  %170 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %169, !dbg !3746
  %171 = getelementptr inbounds nuw %struct.object, ptr %170, i32 0, i32 13, !dbg !3747
  %172 = load i32, ptr %171, align 4, !dbg !3747
  %173 = sub nsw i32 %167, %172, !dbg !3748
  %174 = icmp slt i32 %173, 1310720, !dbg !3749
  br i1 %174, label %175, label %180, !dbg !3749

175:                                              ; preds = %166
  %176 = load i32, ptr %1, align 4, !dbg !3750
  %177 = sext i32 %176 to i64, !dbg !3751
  %178 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %177, !dbg !3751
  %179 = getelementptr inbounds nuw %struct.object, ptr %178, i32 0, i32 20, !dbg !3752
  store i32 1, ptr %179, align 4, !dbg !3753
  br label %180, !dbg !3751

180:                                              ; preds = %175, %166
  br label %181, !dbg !3754

181:                                              ; preds = %180, %163
  br label %182

182:                                              ; preds = %181, %162
  br label %183, !dbg !3755

183:                                              ; preds = %182, %72
  br label %184, !dbg !3756

184:                                              ; preds = %183
  %185 = load i32, ptr %2, align 4, !dbg !3757
  %186 = add nsw i32 %185, 1, !dbg !3757
  store i32 %186, ptr %2, align 4, !dbg !3757
  br label %60, !dbg !3758, !llvm.loop !3759

187:                                              ; preds = %60
  br label %188, !dbg !3761

188:                                              ; preds = %187, %39
  br label %189, !dbg !3762

189:                                              ; preds = %188, %31, %23
  br label %190, !dbg !3763

190:                                              ; preds = %189
  %191 = load i32, ptr %4, align 4, !dbg !3764
  %192 = load i32, ptr %1, align 4, !dbg !3765
  %193 = add nsw i32 %192, %191, !dbg !3765
  store i32 %193, ptr %1, align 4, !dbg !3765
  br label %19, !dbg !3766, !llvm.loop !3767

194:                                              ; preds = %19
  ret void, !dbg !3769
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #2

declare noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z12spit_powerupP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #1 !dbg !3770 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !3901, !DIExpression(), !3902)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !3903, !DIExpression(), !3904)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !3905, !DIExpression(), !3906)
    #dbg_declare(ptr %8, !3907, !DIExpression(), !3908)
    #dbg_declare(ptr %9, !3909, !DIExpression(), !3910)
    #dbg_declare(ptr %10, !3911, !DIExpression(), !3912)
    #dbg_declare(ptr %11, !3913, !DIExpression(), !3914)
  %12 = load i32, ptr %7, align 4, !dbg !3915
  call void @_Z7P_SRandi(i32 noundef %12), !dbg !3916
  %13 = load ptr, ptr %5, align 8, !dbg !3917
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 21, !dbg !3918
  %15 = getelementptr inbounds nuw %struct.physics_info, ptr %14, i32 0, i32 0, !dbg !3919
  %16 = load ptr, ptr %5, align 8, !dbg !3920
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 12, !dbg !3921
  %18 = getelementptr inbounds nuw %struct.vms_matrix, ptr %17, i32 0, i32 2, !dbg !3922
  %19 = call noundef i32 @_Z3i2fi(i32 noundef 20), !dbg !3923
  %20 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %10, ptr noundef %15, ptr noundef %18, i32 noundef %19), !dbg !3924
  %21 = call noundef i32 @_Z6P_Randv(), !dbg !3925
  %22 = sub nsw i32 %21, 16384, !dbg !3926
  %23 = mul nsw i32 %22, 20, !dbg !3927
  %24 = mul nsw i32 %23, 2, !dbg !3928
  %25 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !3929
  %26 = load i32, ptr %25, align 4, !dbg !3930
  %27 = add nsw i32 %26, %24, !dbg !3930
  store i32 %27, ptr %25, align 4, !dbg !3930
  %28 = call noundef i32 @_Z6P_Randv(), !dbg !3931
  %29 = sub nsw i32 %28, 16384, !dbg !3932
  %30 = mul nsw i32 %29, 20, !dbg !3933
  %31 = mul nsw i32 %30, 2, !dbg !3934
  %32 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !3935
  %33 = load i32, ptr %32, align 4, !dbg !3936
  %34 = add nsw i32 %33, %31, !dbg !3936
  store i32 %34, ptr %32, align 4, !dbg !3936
  %35 = call noundef i32 @_Z6P_Randv(), !dbg !3937
  %36 = sub nsw i32 %35, 16384, !dbg !3938
  %37 = mul nsw i32 %36, 20, !dbg !3939
  %38 = mul nsw i32 %37, 2, !dbg !3940
  %39 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !3941
  %40 = load i32, ptr %39, align 4, !dbg !3942
  %41 = add nsw i32 %40, %38, !dbg !3942
  store i32 %41, ptr %39, align 4, !dbg !3942
  %42 = load i32, ptr @Game_mode, align 4, !dbg !3943
  %43 = and i32 %42, 38, !dbg !3945
  %44 = icmp ne i32 %43, 0, !dbg !3946
  br i1 %44, label %45, label %55, !dbg !3947

45:                                               ; preds = %3
  %46 = load i32, ptr %6, align 4, !dbg !3948
  %47 = icmp sge i32 %46, 4, !dbg !3949
  br i1 %47, label %48, label %55, !dbg !3950

48:                                               ; preds = %45
  %49 = load i32, ptr %6, align 4, !dbg !3951
  %50 = icmp sle i32 %49, 6, !dbg !3952
  br i1 %50, label %51, label %55, !dbg !3950

51:                                               ; preds = %48
  %52 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !3953
  store i32 0, ptr %52, align 4, !dbg !3953
  %53 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !3953
  store i32 0, ptr %53, align 4, !dbg !3953
  %54 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !3953
  store i32 0, ptr %54, align 4, !dbg !3953
  br label %55, !dbg !3953

55:                                               ; preds = %51, %48, %45, %3
  %56 = load ptr, ptr %5, align 8, !dbg !3954
  %57 = getelementptr inbounds nuw %struct.object, ptr %56, i32 0, i32 11, !dbg !3955
  %58 = load ptr, ptr %5, align 8, !dbg !3956
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 12, !dbg !3957
  %60 = getelementptr inbounds nuw %struct.vms_matrix, ptr %59, i32 0, i32 2, !dbg !3958
  %61 = load ptr, ptr %5, align 8, !dbg !3959
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 13, !dbg !3960
  %63 = load i32, ptr %62, align 4, !dbg !3960
  %64 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %11, ptr noundef %57, ptr noundef %60, i32 noundef %63), !dbg !3961
  %65 = load i32, ptr @Game_mode, align 4, !dbg !3962
  %66 = and i32 %65, 38, !dbg !3964
  %67 = icmp ne i32 %66, 0, !dbg !3962
  br i1 %67, label %68, label %69, !dbg !3962

68:                                               ; preds = %55
  br label %69, !dbg !3965

69:                                               ; preds = %68, %55
  %70 = load i32, ptr %6, align 4, !dbg !3967
  %71 = trunc i32 %70 to i8, !dbg !3967
  %72 = load ptr, ptr %5, align 8, !dbg !3968
  %73 = getelementptr inbounds nuw %struct.object, ptr %72, i32 0, i32 9, !dbg !3969
  %74 = load i16, ptr %73, align 2, !dbg !3969
  %75 = sext i16 %74 to i32, !dbg !3968
  %76 = load i32, ptr %6, align 4, !dbg !3970
  %77 = sext i32 %76 to i64, !dbg !3971
  %78 = getelementptr inbounds [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %77, !dbg !3971
  %79 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %78, i32 0, i32 2, !dbg !3972
  %80 = load i32, ptr %79, align 4, !dbg !3972
  %81 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 7, i8 noundef zeroext %71, i32 noundef %75, ptr noundef %11, ptr noundef @vmd_identity_matrix, i32 noundef %80, i8 noundef zeroext 13, i8 noundef zeroext 1, i8 noundef zeroext 5), !dbg !3973
  store i32 %81, ptr %8, align 4, !dbg !3974
  %82 = load i32, ptr %8, align 4, !dbg !3975
  %83 = icmp slt i32 %82, 0, !dbg !3977
  br i1 %83, label %84, label %86, !dbg !3977

84:                                               ; preds = %69
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.29), !dbg !3978
  call void @_Z4Int3v(), !dbg !3980
  %85 = load i32, ptr %8, align 4, !dbg !3981
  store i32 %85, ptr %4, align 4, !dbg !3982
  br label %158, !dbg !3982

86:                                               ; preds = %69
  %87 = load i32, ptr %8, align 4, !dbg !3983
  %88 = sext i32 %87 to i64, !dbg !3984
  %89 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %88, !dbg !3984
  store ptr %89, ptr %9, align 8, !dbg !3985
  %90 = load ptr, ptr %9, align 8, !dbg !3986
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 21, !dbg !3987
  %92 = getelementptr inbounds nuw %struct.physics_info, ptr %91, i32 0, i32 0, !dbg !3988
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %92, ptr align 4 %10, i64 12, i1 false), !dbg !3989
  %93 = load ptr, ptr %9, align 8, !dbg !3990
  %94 = getelementptr inbounds nuw %struct.object, ptr %93, i32 0, i32 21, !dbg !3991
  %95 = getelementptr inbounds nuw %struct.physics_info, ptr %94, i32 0, i32 3, !dbg !3992
  store i32 512, ptr %95, align 4, !dbg !3993
  %96 = load ptr, ptr %9, align 8, !dbg !3994
  %97 = getelementptr inbounds nuw %struct.object, ptr %96, i32 0, i32 21, !dbg !3995
  %98 = getelementptr inbounds nuw %struct.physics_info, ptr %97, i32 0, i32 2, !dbg !3996
  store i32 65536, ptr %98, align 4, !dbg !3997
  %99 = load ptr, ptr %9, align 8, !dbg !3998
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 21, !dbg !3999
  %101 = getelementptr inbounds nuw %struct.physics_info, ptr %100, i32 0, i32 8, !dbg !4000
  store i16 4, ptr %101, align 2, !dbg !4001
  %102 = load ptr, ptr %9, align 8, !dbg !4002
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 2, !dbg !4003
  %104 = load i8, ptr %103, align 1, !dbg !4003
  %105 = zext i8 %104 to i64, !dbg !4004
  %106 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %105, !dbg !4004
  %107 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %106, i32 0, i32 0, !dbg !4005
  %108 = load i32, ptr %107, align 4, !dbg !4005
  %109 = load ptr, ptr %9, align 8, !dbg !4006
  %110 = getelementptr inbounds nuw %struct.object, ptr %109, i32 0, i32 23, !dbg !4007
  %111 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %110, i32 0, i32 0, !dbg !4008
  store i32 %108, ptr %111, align 4, !dbg !4009
  %112 = load ptr, ptr %9, align 8, !dbg !4010
  %113 = getelementptr inbounds nuw %struct.object, ptr %112, i32 0, i32 23, !dbg !4011
  %114 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %113, i32 0, i32 0, !dbg !4012
  %115 = load i32, ptr %114, align 4, !dbg !4012
  %116 = sext i32 %115 to i64, !dbg !4013
  %117 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %116, !dbg !4013
  %118 = getelementptr inbounds nuw %struct.vclip, ptr %117, i32 0, i32 2, !dbg !4014
  %119 = load i32, ptr %118, align 4, !dbg !4014
  %120 = load ptr, ptr %9, align 8, !dbg !4015
  %121 = getelementptr inbounds nuw %struct.object, ptr %120, i32 0, i32 23, !dbg !4016
  %122 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %121, i32 0, i32 1, !dbg !4017
  store i32 %119, ptr %122, align 4, !dbg !4018
  %123 = load ptr, ptr %9, align 8, !dbg !4019
  %124 = getelementptr inbounds nuw %struct.object, ptr %123, i32 0, i32 23, !dbg !4020
  %125 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %124, i32 0, i32 2, !dbg !4021
  store i8 0, ptr %125, align 4, !dbg !4022
  %126 = load ptr, ptr %5, align 8, !dbg !4023
  %127 = load ptr, ptr @ConsoleObject, align 8, !dbg !4025
  %128 = icmp eq ptr %126, %127, !dbg !4026
  br i1 %128, label %129, label %135, !dbg !4026

129:                                              ; preds = %86
  %130 = load ptr, ptr %9, align 8, !dbg !4027
  %131 = getelementptr inbounds nuw %struct.object, ptr %130, i32 0, i32 22, !dbg !4028
  %132 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %131, i32 0, i32 2, !dbg !4029
  %133 = load i32, ptr %132, align 4, !dbg !4030
  %134 = or i32 %133, 1, !dbg !4030
  store i32 %134, ptr %132, align 4, !dbg !4030
  br label %135, !dbg !4027

135:                                              ; preds = %129, %86
  %136 = load ptr, ptr %9, align 8, !dbg !4031
  %137 = getelementptr inbounds nuw %struct.object, ptr %136, i32 0, i32 2, !dbg !4032
  %138 = load i8, ptr %137, align 1, !dbg !4032
  %139 = zext i8 %138 to i32, !dbg !4031
  switch i32 %139, label %155 [
    i32 10, label %140
    i32 11, label %140
    i32 2, label %140
    i32 1, label %140
  ], !dbg !4033

140:                                              ; preds = %135, %135, %135, %135
  %141 = call noundef i32 @_Z6P_Randv(), !dbg !4034
  %142 = add nsw i32 %141, 196608, !dbg !4036
  %143 = mul nsw i32 %142, 64, !dbg !4037
  %144 = load ptr, ptr %9, align 8, !dbg !4038
  %145 = getelementptr inbounds nuw %struct.object, ptr %144, i32 0, i32 20, !dbg !4039
  store i32 %143, ptr %145, align 4, !dbg !4040
  %146 = load i32, ptr @Game_mode, align 4, !dbg !4041
  %147 = and i32 %146, 38, !dbg !4043
  %148 = icmp ne i32 %147, 0, !dbg !4041
  br i1 %148, label %149, label %154, !dbg !4041

149:                                              ; preds = %140
  %150 = load ptr, ptr %9, align 8, !dbg !4044
  %151 = getelementptr inbounds nuw %struct.object, ptr %150, i32 0, i32 20, !dbg !4045
  %152 = load i32, ptr %151, align 4, !dbg !4046
  %153 = sdiv i32 %152, 2, !dbg !4046
  store i32 %153, ptr %151, align 4, !dbg !4046
  br label %154, !dbg !4044

154:                                              ; preds = %149, %140
  br label %156, !dbg !4047

155:                                              ; preds = %135
  br label %156, !dbg !4048

156:                                              ; preds = %155, %154
  %157 = load i32, ptr %8, align 4, !dbg !4049
  store i32 %157, ptr %4, align 4, !dbg !4050
  br label %158, !dbg !4050

158:                                              ; preds = %156, %84
  %159 = load i32, ptr %4, align 4, !dbg !4051
  ret i32 %159, !dbg !4051
}

declare void @_Z7P_SRandi(i32 noundef) #2

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #0 !dbg !4052 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4055, !DIExpression(), !4056)
  %3 = load i32, ptr %2, align 4, !dbg !4057
  %4 = shl i32 %3, 16, !dbg !4058
  ret i32 %4, !dbg !4059
}

declare noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext, i8 noundef zeroext, i32 noundef, ptr noundef, ptr noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #2

declare void @_Z4Int3v() #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17DropCurrentWeaponv() #1 !dbg !4060 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !4061, !DIExpression(), !4062)
    #dbg_declare(ptr %2, !4063, !DIExpression(), !4064)
  store i32 0, ptr %2, align 4, !dbg !4064
    #dbg_declare(ptr %3, !4065, !DIExpression(), !4066)
  %4 = load i8, ptr @Primary_weapon, align 1, !dbg !4067
  %5 = sext i8 %4 to i32, !dbg !4067
  %6 = icmp eq i32 %5, 0, !dbg !4069
  br i1 %6, label %7, label %9, !dbg !4069

7:                                                ; preds = %0
  %8 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.30), !dbg !4070
  br label %114, !dbg !4072

9:                                                ; preds = %0
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 104) #5, !dbg !4073
  %11 = load i8, ptr @Primary_weapon, align 1, !dbg !4073
  %12 = sext i8 %11 to i32, !dbg !4073
  %13 = sext i32 %12 to i64, !dbg !4073
  %14 = getelementptr inbounds ptr, ptr %10, i64 %13, !dbg !4073
  %15 = load ptr, ptr %14, align 8, !dbg !4073
  %16 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.31, ptr noundef %15), !dbg !4074
  call void @_Z16digi_play_sampleii(i32 noundef 39, i32 noundef 65536), !dbg !4075
  %17 = call noundef i32 @_Z6P_Randv(), !dbg !4076
  store i32 %17, ptr %3, align 4, !dbg !4077
  %18 = load ptr, ptr @ConsoleObject, align 8, !dbg !4078
  %19 = load i8, ptr @Primary_weapon, align 1, !dbg !4079
  %20 = sext i8 %19 to i64, !dbg !4080
  %21 = getelementptr inbounds [10 x i8], ptr @Primary_weapon_to_powerup, i64 0, i64 %20, !dbg !4080
  %22 = load i8, ptr %21, align 1, !dbg !4080
  %23 = zext i8 %22 to i32, !dbg !4080
  %24 = load i32, ptr %3, align 4, !dbg !4081
  %25 = call noundef i32 @_Z12spit_powerupP6objectii(ptr noundef %18, i32 noundef %23, i32 noundef %24), !dbg !4082
  store i32 %25, ptr %1, align 4, !dbg !4083
  %26 = load i32, ptr %1, align 4, !dbg !4084
  %27 = icmp slt i32 %26, 0, !dbg !4086
  br i1 %27, label %28, label %29, !dbg !4086

28:                                               ; preds = %9
  br label %114, !dbg !4087

29:                                               ; preds = %9
  %30 = load i8, ptr @Primary_weapon, align 1, !dbg !4088
  %31 = sext i8 %30 to i32, !dbg !4088
  %32 = icmp eq i32 %31, 1, !dbg !4090
  br i1 %32, label %37, label %33, !dbg !4091

33:                                               ; preds = %29
  %34 = load i8, ptr @Primary_weapon, align 1, !dbg !4092
  %35 = sext i8 %34 to i32, !dbg !4092
  %36 = icmp eq i32 %35, 6, !dbg !4093
  br i1 %36, label %37, label %86, !dbg !4091

37:                                               ; preds = %33, %29
  %38 = load i32, ptr @Player_num, align 4, !dbg !4094
  %39 = sext i32 %38 to i64, !dbg !4096
  %40 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %39, !dbg !4096
  %41 = getelementptr inbounds nuw %struct.player, ptr %40, i32 0, i32 17, !dbg !4097
  %42 = getelementptr inbounds [10 x i16], ptr %41, i64 0, i64 1, !dbg !4096
  %43 = load i16, ptr %42, align 2, !dbg !4096
  %44 = zext i16 %43 to i32, !dbg !4096
  store i32 %44, ptr %2, align 4, !dbg !4098
  %45 = load i32, ptr @Player_num, align 4, !dbg !4099
  %46 = sext i32 %45 to i64, !dbg !4101
  %47 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %46, !dbg !4101
  %48 = getelementptr inbounds nuw %struct.player, ptr %47, i32 0, i32 15, !dbg !4102
  %49 = load i16, ptr %48, align 2, !dbg !4102
  %50 = zext i16 %49 to i32, !dbg !4101
  %51 = and i32 %50, 2, !dbg !4103
  %52 = icmp ne i32 %51, 0, !dbg !4104
  br i1 %52, label %53, label %65, !dbg !4105

53:                                               ; preds = %37
  %54 = load i32, ptr @Player_num, align 4, !dbg !4106
  %55 = sext i32 %54 to i64, !dbg !4107
  %56 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %55, !dbg !4107
  %57 = getelementptr inbounds nuw %struct.player, ptr %56, i32 0, i32 15, !dbg !4108
  %58 = load i16, ptr %57, align 2, !dbg !4108
  %59 = zext i16 %58 to i32, !dbg !4107
  %60 = and i32 %59, 64, !dbg !4109
  %61 = icmp ne i32 %60, 0, !dbg !4110
  br i1 %61, label %62, label %65, !dbg !4105

62:                                               ; preds = %53
  %63 = load i32, ptr %2, align 4, !dbg !4111
  %64 = sdiv i32 %63, 2, !dbg !4111
  store i32 %64, ptr %2, align 4, !dbg !4111
  br label %65, !dbg !4112

65:                                               ; preds = %62, %53, %37
  %66 = load i32, ptr %2, align 4, !dbg !4113
  %67 = load i32, ptr @Player_num, align 4, !dbg !4114
  %68 = sext i32 %67 to i64, !dbg !4115
  %69 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %68, !dbg !4115
  %70 = getelementptr inbounds nuw %struct.player, ptr %69, i32 0, i32 17, !dbg !4116
  %71 = getelementptr inbounds [10 x i16], ptr %70, i64 0, i64 1, !dbg !4115
  %72 = load i16, ptr %71, align 2, !dbg !4117
  %73 = zext i16 %72 to i32, !dbg !4117
  %74 = sub nsw i32 %73, %66, !dbg !4117
  %75 = trunc i32 %74 to i16, !dbg !4117
  store i16 %75, ptr %71, align 2, !dbg !4117
  %76 = load i32, ptr %1, align 4, !dbg !4118
  %77 = icmp ne i32 %76, -1, !dbg !4120
  br i1 %77, label %78, label %85, !dbg !4120

78:                                               ; preds = %65
  %79 = load i32, ptr %2, align 4, !dbg !4121
  %80 = load i32, ptr %1, align 4, !dbg !4122
  %81 = sext i32 %80 to i64, !dbg !4123
  %82 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %81, !dbg !4123
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 22, !dbg !4124
  %84 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %83, i32 0, i32 0, !dbg !4125
  store i32 %79, ptr %84, align 4, !dbg !4126
  br label %85, !dbg !4123

85:                                               ; preds = %78, %65
  br label %86, !dbg !4127

86:                                               ; preds = %85, %33
  %87 = load i8, ptr @Primary_weapon, align 1, !dbg !4128
  %88 = sext i8 %87 to i32, !dbg !4128
  %89 = icmp eq i32 %88, 9, !dbg !4130
  br i1 %89, label %90, label %101, !dbg !4130

90:                                               ; preds = %86
  %91 = load i32, ptr %1, align 4, !dbg !4131
  %92 = icmp ne i32 %91, -1, !dbg !4134
  br i1 %92, label %93, label %100, !dbg !4134

93:                                               ; preds = %90
  %94 = load i32, ptr @Omega_charge, align 4, !dbg !4135
  %95 = load i32, ptr %1, align 4, !dbg !4136
  %96 = sext i32 %95 to i64, !dbg !4137
  %97 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %96, !dbg !4137
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 22, !dbg !4138
  %99 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %98, i32 0, i32 0, !dbg !4139
  store i32 %94, ptr %99, align 4, !dbg !4140
  br label %100, !dbg !4137

100:                                              ; preds = %93, %90
  br label %101, !dbg !4141

101:                                              ; preds = %100, %86
  %102 = load i8, ptr @Primary_weapon, align 1, !dbg !4142
  %103 = sext i8 %102 to i32, !dbg !4142
  %104 = shl i32 1, %103, !dbg !4143
  %105 = xor i32 %104, -1, !dbg !4144
  %106 = load i32, ptr @Player_num, align 4, !dbg !4145
  %107 = sext i32 %106 to i64, !dbg !4146
  %108 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %107, !dbg !4146
  %109 = getelementptr inbounds nuw %struct.player, ptr %108, i32 0, i32 15, !dbg !4147
  %110 = load i16, ptr %109, align 2, !dbg !4148
  %111 = zext i16 %110 to i32, !dbg !4148
  %112 = and i32 %111, %105, !dbg !4148
  %113 = trunc i32 %112 to i16, !dbg !4148
  store i16 %113, ptr %109, align 2, !dbg !4148
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !4149
  br label %114, !dbg !4150

114:                                              ; preds = %101, %28, %7
  ret void, !dbg !4150
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19DropSecondaryWeaponv() #1 !dbg !4151 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !4152, !DIExpression(), !4153)
    #dbg_declare(ptr %2, !4154, !DIExpression(), !4155)
  %3 = load i32, ptr @Player_num, align 4, !dbg !4156
  %4 = sext i32 %3 to i64, !dbg !4158
  %5 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %4, !dbg !4158
  %6 = getelementptr inbounds nuw %struct.player, ptr %5, i32 0, i32 18, !dbg !4159
  %7 = load i8, ptr @Secondary_weapon, align 1, !dbg !4160
  %8 = sext i8 %7 to i64, !dbg !4158
  %9 = getelementptr inbounds [10 x i16], ptr %6, i64 0, i64 %8, !dbg !4158
  %10 = load i16, ptr %9, align 2, !dbg !4158
  %11 = zext i16 %10 to i32, !dbg !4158
  %12 = icmp eq i32 %11, 0, !dbg !4161
  br i1 %12, label %13, label %15, !dbg !4161

13:                                               ; preds = %0
  %14 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.32), !dbg !4162
  br label %122, !dbg !4164

15:                                               ; preds = %0
  %16 = load i8, ptr @Secondary_weapon, align 1, !dbg !4165
  %17 = sext i8 %16 to i64, !dbg !4167
  %18 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %17, !dbg !4167
  %19 = load i8, ptr %18, align 1, !dbg !4167
  %20 = zext i8 %19 to i32, !dbg !4167
  %21 = icmp eq i32 %20, 17, !dbg !4168
  br i1 %21, label %29, label %22, !dbg !4169

22:                                               ; preds = %15
  %23 = load i8, ptr @Secondary_weapon, align 1, !dbg !4170
  %24 = sext i8 %23 to i64, !dbg !4171
  %25 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %24, !dbg !4171
  %26 = load i8, ptr %25, align 1, !dbg !4171
  %27 = zext i8 %26 to i32, !dbg !4171
  %28 = icmp eq i32 %27, 42, !dbg !4172
  br i1 %28, label %29, label %42, !dbg !4173

29:                                               ; preds = %22, %15
  %30 = load i32, ptr @Player_num, align 4, !dbg !4174
  %31 = sext i32 %30 to i64, !dbg !4175
  %32 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %31, !dbg !4175
  %33 = getelementptr inbounds nuw %struct.player, ptr %32, i32 0, i32 18, !dbg !4176
  %34 = load i8, ptr @Secondary_weapon, align 1, !dbg !4177
  %35 = sext i8 %34 to i64, !dbg !4175
  %36 = getelementptr inbounds [10 x i16], ptr %33, i64 0, i64 %35, !dbg !4175
  %37 = load i16, ptr %36, align 2, !dbg !4175
  %38 = zext i16 %37 to i32, !dbg !4175
  %39 = icmp slt i32 %38, 4, !dbg !4178
  br i1 %39, label %40, label %42, !dbg !4173

40:                                               ; preds = %29
  %41 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.33), !dbg !4179
  br label %122, !dbg !4181

42:                                               ; preds = %29, %22
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 114) #5, !dbg !4182
  %44 = load i8, ptr @Secondary_weapon, align 1, !dbg !4182
  %45 = sext i8 %44 to i32, !dbg !4182
  %46 = sext i32 %45 to i64, !dbg !4182
  %47 = getelementptr inbounds ptr, ptr %43, i64 %46, !dbg !4182
  %48 = load ptr, ptr %47, align 8, !dbg !4182
  %49 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.31, ptr noundef %48), !dbg !4183
  call void @_Z16digi_play_sampleii(i32 noundef 39, i32 noundef 65536), !dbg !4184
  %50 = call noundef i32 @_Z6P_Randv(), !dbg !4185
  store i32 %50, ptr %2, align 4, !dbg !4186
  %51 = load ptr, ptr @ConsoleObject, align 8, !dbg !4187
  %52 = load i8, ptr @Secondary_weapon, align 1, !dbg !4188
  %53 = sext i8 %52 to i64, !dbg !4189
  %54 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %53, !dbg !4189
  %55 = load i8, ptr %54, align 1, !dbg !4189
  %56 = zext i8 %55 to i32, !dbg !4189
  %57 = load i32, ptr %2, align 4, !dbg !4190
  %58 = call noundef i32 @_Z12spit_powerupP6objectii(ptr noundef %51, i32 noundef %56, i32 noundef %57), !dbg !4191
  store i32 %58, ptr %1, align 4, !dbg !4192
  %59 = load i32, ptr %1, align 4, !dbg !4193
  %60 = icmp slt i32 %59, 0, !dbg !4195
  br i1 %60, label %61, label %62, !dbg !4195

61:                                               ; preds = %42
  br label %122, !dbg !4196

62:                                               ; preds = %42
  %63 = load i8, ptr @Secondary_weapon, align 1, !dbg !4197
  %64 = sext i8 %63 to i64, !dbg !4199
  %65 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %64, !dbg !4199
  %66 = load i8, ptr %65, align 1, !dbg !4199
  %67 = zext i8 %66 to i32, !dbg !4199
  %68 = icmp eq i32 %67, 17, !dbg !4200
  br i1 %68, label %76, label %69, !dbg !4201

69:                                               ; preds = %62
  %70 = load i8, ptr @Secondary_weapon, align 1, !dbg !4202
  %71 = sext i8 %70 to i64, !dbg !4203
  %72 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %71, !dbg !4203
  %73 = load i8, ptr %72, align 1, !dbg !4203
  %74 = zext i8 %73 to i32, !dbg !4203
  %75 = icmp eq i32 %74, 42, !dbg !4204
  br i1 %75, label %76, label %88, !dbg !4201

76:                                               ; preds = %69, %62
  %77 = load i32, ptr @Player_num, align 4, !dbg !4205
  %78 = sext i32 %77 to i64, !dbg !4206
  %79 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %78, !dbg !4206
  %80 = getelementptr inbounds nuw %struct.player, ptr %79, i32 0, i32 18, !dbg !4207
  %81 = load i8, ptr @Secondary_weapon, align 1, !dbg !4208
  %82 = sext i8 %81 to i64, !dbg !4206
  %83 = getelementptr inbounds [10 x i16], ptr %80, i64 0, i64 %82, !dbg !4206
  %84 = load i16, ptr %83, align 2, !dbg !4209
  %85 = zext i16 %84 to i32, !dbg !4209
  %86 = sub nsw i32 %85, 4, !dbg !4209
  %87 = trunc i32 %86 to i16, !dbg !4209
  store i16 %87, ptr %83, align 2, !dbg !4209
  br label %98, !dbg !4206

88:                                               ; preds = %69
  %89 = load i32, ptr @Player_num, align 4, !dbg !4210
  %90 = sext i32 %89 to i64, !dbg !4211
  %91 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %90, !dbg !4211
  %92 = getelementptr inbounds nuw %struct.player, ptr %91, i32 0, i32 18, !dbg !4212
  %93 = load i8, ptr @Secondary_weapon, align 1, !dbg !4213
  %94 = sext i8 %93 to i64, !dbg !4211
  %95 = getelementptr inbounds [10 x i16], ptr %92, i64 0, i64 %94, !dbg !4211
  %96 = load i16, ptr %95, align 2, !dbg !4214
  %97 = add i16 %96, -1, !dbg !4214
  store i16 %97, ptr %95, align 2, !dbg !4214
  br label %98

98:                                               ; preds = %88, %76
  %99 = load i32, ptr @Player_num, align 4, !dbg !4215
  %100 = sext i32 %99 to i64, !dbg !4217
  %101 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %100, !dbg !4217
  %102 = getelementptr inbounds nuw %struct.player, ptr %101, i32 0, i32 18, !dbg !4218
  %103 = load i8, ptr @Secondary_weapon, align 1, !dbg !4219
  %104 = sext i8 %103 to i64, !dbg !4217
  %105 = getelementptr inbounds [10 x i16], ptr %102, i64 0, i64 %104, !dbg !4217
  %106 = load i16, ptr %105, align 2, !dbg !4217
  %107 = zext i16 %106 to i32, !dbg !4217
  %108 = icmp eq i32 %107, 0, !dbg !4220
  br i1 %108, label %109, label %122, !dbg !4220

109:                                              ; preds = %98
  %110 = load i8, ptr @Secondary_weapon, align 1, !dbg !4221
  %111 = sext i8 %110 to i32, !dbg !4221
  %112 = shl i32 1, %111, !dbg !4223
  %113 = xor i32 %112, -1, !dbg !4224
  %114 = load i32, ptr @Player_num, align 4, !dbg !4225
  %115 = sext i32 %114 to i64, !dbg !4226
  %116 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %115, !dbg !4226
  %117 = getelementptr inbounds nuw %struct.player, ptr %116, i32 0, i32 16, !dbg !4227
  %118 = load i16, ptr %117, align 4, !dbg !4228
  %119 = zext i16 %118 to i32, !dbg !4228
  %120 = and i32 %119, %113, !dbg !4228
  %121 = trunc i32 %120 to i16, !dbg !4228
  store i16 %121, ptr %117, align 4, !dbg !4228
  call void @_Z18auto_select_weaponi(i32 noundef 1), !dbg !4229
  br label %122, !dbg !4230

122:                                              ; preds = %13, %40, %61, %109, %98
  ret void, !dbg !4231
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16do_seismic_stuffv() #1 !dbg !4232 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !4233, !DIExpression(), !4234)
  %3 = load i32, ptr @Seismic_tremor_volume, align 4, !dbg !4235
  store i32 %3, ptr %1, align 4, !dbg !4236
  store i32 0, ptr @Seismic_tremor_magnitude, align 4, !dbg !4237
  store i32 0, ptr @Seismic_tremor_volume, align 4, !dbg !4238
  call void @_Z19rock_the_mine_framev(), !dbg !4239
  call void @_Z25seismic_disturbance_framev(), !dbg !4240
  %4 = load i32, ptr %1, align 4, !dbg !4241
  %5 = icmp ne i32 %4, 0, !dbg !4243
  br i1 %5, label %6, label %31, !dbg !4243

6:                                                ; preds = %0
  %7 = load i32, ptr @Seismic_tremor_volume, align 4, !dbg !4244
  %8 = icmp eq i32 %7, 0, !dbg !4247
  br i1 %8, label %9, label %10, !dbg !4247

9:                                                ; preds = %6
  call void @_Z23digi_stop_looping_soundv(), !dbg !4248
  store i32 0, ptr @Seismic_sound_playing, align 4, !dbg !4250
  br label %10, !dbg !4251

10:                                               ; preds = %9, %6
  %11 = load i32, ptr @GameTime, align 4, !dbg !4252
  %12 = load i32, ptr @Next_seismic_sound_time, align 4, !dbg !4254
  %13 = icmp sgt i32 %11, %12, !dbg !4255
  br i1 %13, label %14, label %30, !dbg !4256

14:                                               ; preds = %10
  %15 = load i32, ptr @Seismic_tremor_volume, align 4, !dbg !4257
  %16 = icmp ne i32 %15, 0, !dbg !4257
  br i1 %16, label %17, label %30, !dbg !4256

17:                                               ; preds = %14
    #dbg_declare(ptr %2, !4258, !DIExpression(), !4260)
  %18 = load i32, ptr @Seismic_tremor_volume, align 4, !dbg !4261
  %19 = mul nsw i32 %18, 2048, !dbg !4262
  store i32 %19, ptr %2, align 4, !dbg !4263
  %20 = load i32, ptr %2, align 4, !dbg !4264
  %21 = icmp sgt i32 %20, 65536, !dbg !4266
  br i1 %21, label %22, label %23, !dbg !4266

22:                                               ; preds = %17
  store i32 65536, ptr %2, align 4, !dbg !4267
  br label %23, !dbg !4268

23:                                               ; preds = %22, %17
  %24 = load i32, ptr %2, align 4, !dbg !4269
  call void @_Z26digi_change_looping_volumei(i32 noundef %24), !dbg !4270
  %25 = load i32, ptr @GameTime, align 4, !dbg !4271
  %26 = call noundef i32 @_Z6P_Randv(), !dbg !4272
  %27 = sdiv i32 %26, 4, !dbg !4273
  %28 = add nsw i32 %25, %27, !dbg !4274
  %29 = add nsw i32 %28, 8192, !dbg !4275
  store i32 %29, ptr @Next_seismic_sound_time, align 4, !dbg !4276
  br label %30, !dbg !4277

30:                                               ; preds = %23, %14, %10
  br label %31, !dbg !4278

31:                                               ; preds = %30, %0
  ret void, !dbg !4279
}

declare void @_Z23digi_stop_looping_soundv() #2

declare void @_Z26digi_change_looping_volumei(i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z23tactile_set_button_joltv() #0 !dbg !4280 {
  ret void, !dbg !4281
}

attributes #0 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!1592, !1593, !1594, !1595, !1596, !1597, !1598}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1599}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Primary_weapon_to_weapon_info", scope: !2, file: !22, line: 50, type: !23, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !19, imports: !308, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/weapon.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "f672bdb9ea97684efd08dcc4baae2181")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "LogicVer", file: !6, line: 56, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS8LogicVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "SHAREWARE", value: 0)
!10 = !DIEnumerator(name: "FULL_1_0", value: 1)
!11 = !DIEnumerator(name: "FULL_1_1", value: 2)
!12 = !DIEnumerator(name: "FULL_1_2", value: 3)
!13 = !{!14, !16}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 30, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!18 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!19 = !{!0, !20, !29, !31, !34, !36, !38, !40, !108, !110, !112, !114, !119, !121, !123, !125, !127, !130, !136, !141, !146, !151, !153, !155, !160, !165, !170, !175, !180, !185, !188, !190, !195, !200, !203, !205, !210, !215, !220, !225, !227, !229, !234, !239, !244, !249, !251, !256, !259, !261, !263, !265, !267, !269, !271, !273, !275, !277, !282, !287, !289, !294, !299, !301, !303, !305}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "Secondary_weapon_to_weapon_info", scope: !2, file: !22, line: 51, type: !23, isLocal: false, isDefinition: true)
!22 = !DIFile(filename: "main_d2/weapon.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f672bdb9ea97684efd08dcc4baae2181")
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 80, elements: !27)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !25, line: 31, baseType: !26)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!26 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "Secondary_weapon_to_gun_num", scope: !2, file: !22, line: 54, type: !23, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "Primary_ammo_max", scope: !2, file: !22, line: 56, type: !33, isLocal: false, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !27)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "Secondary_ammo_max", scope: !2, file: !22, line: 57, type: !23, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "Primary_weapon_to_powerup", scope: !2, file: !22, line: 60, type: !23, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "Secondary_weapon_to_powerup", scope: !2, file: !22, line: 63, type: !23, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "Weapon_info", scope: !2, file: !22, line: 65, type: !42, isLocal: false, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 71680, elements: !106)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "weapon_info", file: !44, line: 80, baseType: !45)
!44 = !DIFile(filename: "main_d2/weapon.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a9e4f8b8f865fefc0854f8f4cf993ef2")
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "weapon_info", file: !44, line: 24, size: 1024, flags: DIFlagTypePassByValue, elements: !46, identifier: "_ZTS11weapon_info")
!46 = !{!47, !51, !52, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !78, !79, !80, !89, !90, !91, !92, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !45, file: !44, line: 26, baseType: !48, size: 8)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !49, line: 30, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!50 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "persistent", scope: !45, file: !44, line: 27, baseType: !48, size: 8, offset: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !45, file: !44, line: 28, baseType: !53, size: 16, offset: 16)
!53 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "model_num_inner", scope: !45, file: !44, line: 29, baseType: !53, size: 16, offset: 32)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "flash_vclip", scope: !45, file: !44, line: 31, baseType: !48, size: 8, offset: 48)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "robot_hit_vclip", scope: !45, file: !44, line: 32, baseType: !48, size: 8, offset: 56)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "flash_sound", scope: !45, file: !44, line: 33, baseType: !53, size: 16, offset: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "wall_hit_vclip", scope: !45, file: !44, line: 35, baseType: !48, size: 8, offset: 80)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "fire_count", scope: !45, file: !44, line: 36, baseType: !48, size: 8, offset: 88)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "robot_hit_sound", scope: !45, file: !44, line: 37, baseType: !53, size: 16, offset: 96)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "ammo_usage", scope: !45, file: !44, line: 39, baseType: !48, size: 8, offset: 112)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_vclip", scope: !45, file: !44, line: 40, baseType: !48, size: 8, offset: 120)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "wall_hit_sound", scope: !45, file: !44, line: 41, baseType: !53, size: 16, offset: 128)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "destroyable", scope: !45, file: !44, line: 43, baseType: !48, size: 8, offset: 144)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "matter", scope: !45, file: !44, line: 44, baseType: !48, size: 8, offset: 152)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "bounce", scope: !45, file: !44, line: 45, baseType: !48, size: 8, offset: 160)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "homing_flag", scope: !45, file: !44, line: 46, baseType: !48, size: 8, offset: 168)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "speedvar", scope: !45, file: !44, line: 48, baseType: !24, size: 8, offset: 176)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !45, file: !44, line: 50, baseType: !24, size: 8, offset: 184)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "flash", scope: !45, file: !44, line: 52, baseType: !48, size: 8, offset: 192)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "afterburner_size", scope: !45, file: !44, line: 53, baseType: !48, size: 8, offset: 200)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !45, file: !44, line: 55, baseType: !48, size: 8, offset: 208)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "energy_usage", scope: !45, file: !44, line: 57, baseType: !74, size: 32, offset: 224)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !75, line: 20, baseType: !76)
!75 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !77, line: 30, baseType: !7)
!77 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!78 = !DIDerivedType(tag: DW_TAG_member, name: "fire_wait", scope: !45, file: !44, line: 58, baseType: !74, size: 32, offset: 256)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "multi_damage_scale", scope: !45, file: !44, line: 60, baseType: !74, size: 32, offset: 288)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "bitmap", scope: !45, file: !44, line: 62, baseType: !81, size: 16, offset: 320)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "bitmap_index", file: !82, line: 40, baseType: !83)
!82 = !DIFile(filename: "./main_shared/piggy.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "5d74a9a5fcd56b04e1df3c49c8d4c571")
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bitmap_index", file: !82, line: 37, size: 16, flags: DIFlagTypePassByValue, elements: !84, identifier: "_ZTS12bitmap_index")
!84 = !{!85}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !83, file: !82, line: 39, baseType: !86, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !87, line: 31, baseType: !88)
!87 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!88 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "blob_size", scope: !45, file: !44, line: 64, baseType: !74, size: 32, offset: 352)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "flash_size", scope: !45, file: !44, line: 65, baseType: !74, size: 32, offset: 384)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "impact_size", scope: !45, file: !44, line: 66, baseType: !74, size: 32, offset: 416)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !45, file: !44, line: 67, baseType: !93, size: 160, offset: 448)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 160, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "speed", scope: !45, file: !44, line: 68, baseType: !93, size: 160, offset: 608)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !45, file: !44, line: 69, baseType: !74, size: 32, offset: 768)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !45, file: !44, line: 70, baseType: !74, size: 32, offset: 800)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !45, file: !44, line: 71, baseType: !74, size: 32, offset: 832)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "po_len_to_width_ratio", scope: !45, file: !44, line: 72, baseType: !74, size: 32, offset: 864)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "light", scope: !45, file: !44, line: 73, baseType: !74, size: 32, offset: 896)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "lifetime", scope: !45, file: !44, line: 74, baseType: !74, size: 32, offset: 928)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "damage_radius", scope: !45, file: !44, line: 75, baseType: !74, size: 32, offset: 960)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "picture", scope: !45, file: !44, line: 78, baseType: !81, size: 16, offset: 992)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "hires_picture", scope: !45, file: !44, line: 79, baseType: !81, size: 16, offset: 1008)
!106 = !{!107}
!107 = !DISubrange(count: 70)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "N_weapon_types", scope: !2, file: !22, line: 66, type: !7, isLocal: false, isDefinition: true)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(name: "Primary_weapon", scope: !2, file: !22, line: 67, type: !48, isLocal: false, isDefinition: true)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "Secondary_weapon", scope: !2, file: !22, line: 67, type: !48, isLocal: false, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "PrimaryOrder", scope: !2, file: !22, line: 71, type: !116, isLocal: false, isDefinition: true)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 88, elements: !117)
!117 = !{!118}
!118 = !DISubrange(count: 11)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression())
!120 = distinct !DIGlobalVariable(name: "SecondaryOrder", scope: !2, file: !22, line: 72, type: !116, isLocal: false, isDefinition: true)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(name: "DefaultPrimaryOrder", scope: !2, file: !22, line: 74, type: !116, isLocal: false, isDefinition: true)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(name: "DefaultSecondaryOrder", scope: !2, file: !22, line: 75, type: !116, isLocal: false, isDefinition: true)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(name: "Cycling", scope: !2, file: !22, line: 79, type: !24, isLocal: false, isDefinition: true)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(name: "Weapon_is_energy", scope: !2, file: !22, line: 116, type: !129, isLocal: false, isDefinition: true)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 560, elements: !106)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(scope: null, file: !22, line: 264, type: !132, isLocal: true, isDefinition: true)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 144, elements: !134)
!133 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!134 = !{!135}
!135 = !DISubrange(count: 18)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(scope: null, file: !22, line: 272, type: !138, isLocal: true, isDefinition: true)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 160, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 20)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(scope: null, file: !22, line: 360, type: !143, isLocal: true, isDefinition: true)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 120, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 15)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(scope: null, file: !22, line: 362, type: !148, isLocal: true, isDefinition: true)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 48, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 6)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(name: "Primary_last_was_super", scope: !2, file: !22, line: 367, type: !23, isLocal: false, isDefinition: true)
!153 = !DIGlobalVariableExpression(var: !154, expr: !DIExpression())
!154 = distinct !DIGlobalVariable(name: "Secondary_last_was_super", scope: !2, file: !22, line: 368, type: !23, isLocal: false, isDefinition: true)
!155 = !DIGlobalVariableExpression(var: !156, expr: !DIExpression())
!156 = distinct !DIGlobalVariable(scope: null, file: !22, line: 425, type: !157, isLocal: true, isDefinition: true)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 56, elements: !158)
!158 = !{!159}
!159 = !DISubrange(count: 7)
!160 = !DIGlobalVariableExpression(var: !161, expr: !DIExpression())
!161 = distinct !DIGlobalVariable(scope: null, file: !22, line: 428, type: !162, isLocal: true, isDefinition: true)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 64, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 8)
!165 = !DIGlobalVariableExpression(var: !166, expr: !DIExpression())
!166 = distinct !DIGlobalVariable(scope: null, file: !22, line: 525, type: !167, isLocal: true, isDefinition: true)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 136, elements: !168)
!168 = !{!169}
!169 = !DISubrange(count: 17)
!170 = !DIGlobalVariableExpression(var: !171, expr: !DIExpression())
!171 = distinct !DIGlobalVariable(scope: null, file: !22, line: 525, type: !172, isLocal: true, isDefinition: true)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 448, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 56)
!175 = !DIGlobalVariableExpression(var: !176, expr: !DIExpression())
!176 = distinct !DIGlobalVariable(scope: null, file: !22, line: 544, type: !177, isLocal: true, isDefinition: true)
!177 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 248, elements: !178)
!178 = !{!179}
!179 = !DISubrange(count: 31)
!180 = !DIGlobalVariableExpression(var: !181, expr: !DIExpression())
!181 = distinct !DIGlobalVariable(scope: null, file: !22, line: 560, type: !182, isLocal: true, isDefinition: true)
!182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 256, elements: !183)
!183 = !{!184}
!184 = !DISubrange(count: 32)
!185 = !DIGlobalVariableExpression(var: !186, expr: !DIExpression())
!186 = distinct !DIGlobalVariable(scope: null, file: !22, line: 587, type: !187, isLocal: true, isDefinition: true)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 40, elements: !94)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !22, line: 589, type: !187, isLocal: true, isDefinition: true)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(scope: null, file: !22, line: 591, type: !192, isLocal: true, isDefinition: true)
!192 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 240, elements: !193)
!193 = !{!194}
!194 = !DISubrange(count: 30)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(scope: null, file: !22, line: 594, type: !197, isLocal: true, isDefinition: true)
!197 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 16, elements: !198)
!198 = !{!199}
!199 = !DISubrange(count: 2)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(scope: null, file: !22, line: 627, type: !202, isLocal: true, isDefinition: true)
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 88, elements: !117)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(scope: null, file: !22, line: 665, type: !162, isLocal: true, isDefinition: true)
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(scope: null, file: !22, line: 670, type: !207, isLocal: true, isDefinition: true)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 32, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 4)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(scope: null, file: !22, line: 685, type: !212, isLocal: true, isDefinition: true)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 488, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 61)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(scope: null, file: !22, line: 691, type: !217, isLocal: true, isDefinition: true)
!217 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 128, elements: !218)
!218 = !{!219}
!219 = !DISubrange(count: 16)
!220 = !DIGlobalVariableExpression(var: !221, expr: !DIExpression())
!221 = distinct !DIGlobalVariable(scope: null, file: !22, line: 691, type: !222, isLocal: true, isDefinition: true)
!222 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 264, elements: !223)
!223 = !{!224}
!224 = !DISubrange(count: 33)
!225 = !DIGlobalVariableExpression(var: !226, expr: !DIExpression())
!226 = distinct !DIGlobalVariable(scope: null, file: !22, line: 713, type: !132, isLocal: true, isDefinition: true)
!227 = !DIGlobalVariableExpression(var: !228, expr: !DIExpression())
!228 = distinct !DIGlobalVariable(scope: null, file: !22, line: 729, type: !182, isLocal: true, isDefinition: true)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !22, line: 732, type: !231, isLocal: true, isDefinition: true)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 312, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 39)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression())
!235 = distinct !DIGlobalVariable(scope: null, file: !22, line: 747, type: !236, isLocal: true, isDefinition: true)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 272, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 34)
!239 = !DIGlobalVariableExpression(var: !240, expr: !DIExpression())
!240 = distinct !DIGlobalVariable(scope: null, file: !22, line: 750, type: !241, isLocal: true, isDefinition: true)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 200, elements: !242)
!242 = !{!243}
!243 = !DISubrange(count: 25)
!244 = !DIGlobalVariableExpression(var: !245, expr: !DIExpression())
!245 = distinct !DIGlobalVariable(scope: null, file: !22, line: 751, type: !246, isLocal: true, isDefinition: true)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 328, elements: !247)
!247 = !{!248}
!248 = !DISubrange(count: 41)
!249 = !DIGlobalVariableExpression(var: !250, expr: !DIExpression())
!250 = distinct !DIGlobalVariable(scope: null, file: !22, line: 783, type: !132, isLocal: true, isDefinition: true)
!251 = !DIGlobalVariableExpression(var: !252, expr: !DIExpression())
!252 = distinct !DIGlobalVariable(scope: null, file: !22, line: 816, type: !253, isLocal: true, isDefinition: true)
!253 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 480, elements: !254)
!254 = !{!255}
!255 = !DISubrange(count: 60)
!256 = !DIGlobalVariableExpression(var: !257, expr: !DIExpression())
!257 = distinct !DIGlobalVariable(name: "Smega_detonate_times", scope: !2, file: !22, line: 848, type: !258, isLocal: false, isDefinition: true)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 128, elements: !208)
!259 = !DIGlobalVariableExpression(var: !260, expr: !DIExpression())
!260 = distinct !DIGlobalVariable(name: "Seismic_tremor_magnitude", scope: !2, file: !22, line: 860, type: !74, isLocal: false, isDefinition: true)
!261 = !DIGlobalVariableExpression(var: !262, expr: !DIExpression())
!262 = distinct !DIGlobalVariable(name: "Next_seismic_sound_time", scope: !2, file: !22, line: 861, type: !74, isLocal: false, isDefinition: true)
!263 = !DIGlobalVariableExpression(var: !264, expr: !DIExpression())
!264 = distinct !DIGlobalVariable(name: "Seismic_sound_playing", scope: !2, file: !22, line: 862, type: !7, isLocal: false, isDefinition: true)
!265 = !DIGlobalVariableExpression(var: !266, expr: !DIExpression())
!266 = distinct !DIGlobalVariable(name: "Seismic_tremor_volume", scope: !2, file: !22, line: 863, type: !7, isLocal: false, isDefinition: true)
!267 = !DIGlobalVariableExpression(var: !268, expr: !DIExpression())
!268 = distinct !DIGlobalVariable(name: "Seismic_sound", scope: !2, file: !22, line: 865, type: !7, isLocal: false, isDefinition: true)
!269 = !DIGlobalVariableExpression(var: !270, expr: !DIExpression())
!270 = distinct !DIGlobalVariable(name: "Seismic_disturbance_start_time", scope: !2, file: !22, line: 932, type: !74, isLocal: false, isDefinition: true)
!271 = !DIGlobalVariableExpression(var: !272, expr: !DIExpression())
!272 = distinct !DIGlobalVariable(name: "Seismic_disturbance_end_time", scope: !2, file: !22, line: 932, type: !74, isLocal: false, isDefinition: true)
!273 = !DIGlobalVariableExpression(var: !274, expr: !DIExpression())
!274 = distinct !DIGlobalVariable(name: "Seismic_level", scope: !2, file: !22, line: 934, type: !7, isLocal: false, isDefinition: true)
!275 = !DIGlobalVariableExpression(var: !276, expr: !DIExpression())
!276 = distinct !DIGlobalVariable(name: "Super_mines_yes", scope: !2, file: !22, line: 1035, type: !7, isLocal: false, isDefinition: true)
!277 = !DIGlobalVariableExpression(var: !278, expr: !DIExpression())
!278 = distinct !DIGlobalVariable(scope: null, file: !22, line: 1152, type: !279, isLocal: true, isDefinition: true)
!279 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 376, elements: !280)
!280 = !{!281}
!281 = !DISubrange(count: 47)
!282 = !DIGlobalVariableExpression(var: !283, expr: !DIExpression())
!283 = distinct !DIGlobalVariable(scope: null, file: !22, line: 1226, type: !284, isLocal: true, isDefinition: true)
!284 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 432, elements: !285)
!285 = !{!286}
!286 = !DISubrange(count: 54)
!287 = !DIGlobalVariableExpression(var: !288, expr: !DIExpression())
!288 = distinct !DIGlobalVariable(scope: null, file: !22, line: 1271, type: !236, isLocal: true, isDefinition: true)
!289 = !DIGlobalVariableExpression(var: !290, expr: !DIExpression())
!290 = distinct !DIGlobalVariable(scope: null, file: !22, line: 1275, type: !291, isLocal: true, isDefinition: true)
!291 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 96, elements: !292)
!292 = !{!293}
!293 = !DISubrange(count: 12)
!294 = !DIGlobalVariableExpression(var: !295, expr: !DIExpression())
!295 = distinct !DIGlobalVariable(scope: null, file: !22, line: 1325, type: !296, isLocal: true, isDefinition: true)
!296 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 232, elements: !297)
!297 = !{!298}
!298 = !DISubrange(count: 29)
!299 = !DIGlobalVariableExpression(var: !300, expr: !DIExpression())
!300 = distinct !DIGlobalVariable(scope: null, file: !22, line: 1333, type: !296, isLocal: true, isDefinition: true)
!301 = !DIGlobalVariableExpression(var: !302, expr: !DIExpression())
!302 = distinct !DIGlobalVariable(name: "tactile_fire_duration", scope: !2, file: !22, line: 1400, type: !33, isLocal: false, isDefinition: true)
!303 = !DIGlobalVariableExpression(var: !304, expr: !DIExpression())
!304 = distinct !DIGlobalVariable(name: "tactile_fire_repeat", scope: !2, file: !22, line: 1401, type: !33, isLocal: false, isDefinition: true)
!305 = !DIGlobalVariableExpression(var: !306, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!306 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !75, line: 18, type: !307, isLocal: true, isDefinition: true)
!307 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!308 = !{!309, !313, !316, !317, !318, !319, !320, !324, !328, !331, !333, !335, !337, !339, !341, !343, !345, !347, !349, !351, !353, !355, !357, !359, !361, !367, !371, !374, !377, !382, !388, !390, !392, !394, !396, !398, !400, !402, !404, !406, !408, !410, !412, !414, !419, !424, !429, !434, !436, !439, !441, !443, !445, !447, !449, !451, !453, !455, !457, !461, !466, !470, !472, !476, !480, !493, !508, !509, !564, !573, !575, !583, !589, !593, !597, !599, !603, !607, !611, !615, !619, !623, !625, !627, !631, !637, !642, !646, !650, !654, !658, !662, !666, !670, !672, !674, !678, !680, !684, !688, !693, !695, !697, !699, !703, !707, !711, !713, !717, !719, !721, !723, !725, !731, !735, !737, !743, !748, !752, !756, !761, !766, !770, !774, !778, !782, !784, !786, !794, !800, !806, !810, !814, !818, !822, !827, !831, !835, !839, !843, !847, !851, !855, !859, !864, !868, !872, !876, !881, !886, !890, !892, !896, !898, !907, !911, !916, !920, !924, !928, !932, !934, !938, !942, !946, !950, !954, !956, !958, !960, !968, !970, !972, !974, !980, !982, !983, !984, !985, !988, !990, !991, !995, !997, !999, !1003, !1005, !1007, !1009, !1011, !1013, !1015, !1017, !1022, !1026, !1028, !1030, !1031, !1036, !1038, !1040, !1042, !1044, !1046, !1048, !1050, !1052, !1054, !1056, !1058, !1060, !1062, !1064, !1066, !1068, !1072, !1074, !1076, !1078, !1082, !1084, !1088, !1090, !1092, !1094, !1096, !1100, !1102, !1104, !1108, !1110, !1112, !1116, !1118, !1122, !1124, !1126, !1130, !1132, !1134, !1136, !1138, !1140, !1142, !1146, !1148, !1150, !1152, !1154, !1156, !1158, !1160, !1164, !1168, !1170, !1172, !1174, !1176, !1178, !1180, !1182, !1184, !1186, !1188, !1190, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1206, !1210, !1212, !1214, !1216, !1220, !1222, !1226, !1228, !1230, !1232, !1234, !1238, !1240, !1244, !1246, !1248, !1250, !1252, !1256, !1258, !1260, !1264, !1266, !1268, !1270, !1276, !1278, !1282, !1286, !1288, !1290, !1294, !1298, !1302, !1304, !1308, !1313, !1317, !1321, !1323, !1325, !1327, !1329, !1331, !1333, !1337, !1341, !1346, !1351, !1355, !1356, !1360, !1364, !1369, !1374, !1378, !1384, !1388, !1390, !1394, !1396, !1397, !1401, !1403, !1407, !1411, !1415, !1417, !1421, !1425, !1429, !1435, !1437, !1441, !1445, !1449, !1451, !1455, !1459, !1463, !1465, !1467, !1469, !1473, !1477, !1482, !1486, !1492, !1496, !1500, !1502, !1504, !1506, !1510, !1514, !1518, !1520, !1522, !1526, !1530, !1532, !1536, !1540, !1543, !1545, !1547, !1549, !1578, !1583, !1588}
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !48, file: !312, line: 158)
!310 = !DINamespace(name: "__1", scope: !311, exportSymbols: true)
!311 = !DINamespace(name: "std", scope: null)
!312 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !314, file: !312, line: 159)
!314 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !315, line: 30, baseType: !53)
!315 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !76, file: !312, line: 160)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !16, file: !312, line: 161)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !24, file: !312, line: 163)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !86, file: !312, line: 164)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !321, file: !312, line: 165)
!321 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !322, line: 31, baseType: !323)
!322 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!323 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !325, file: !312, line: 166)
!325 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !326, line: 31, baseType: !327)
!326 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!327 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !329, file: !312, line: 168)
!329 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !330, line: 29, baseType: !48)
!330 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !332, file: !312, line: 169)
!332 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !330, line: 30, baseType: !314)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !334, file: !312, line: 170)
!334 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !330, line: 31, baseType: !76)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !336, file: !312, line: 171)
!336 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !330, line: 32, baseType: !16)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !338, file: !312, line: 173)
!338 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !330, line: 33, baseType: !24)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !340, file: !312, line: 174)
!340 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !330, line: 34, baseType: !86)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !342, file: !312, line: 175)
!342 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !330, line: 35, baseType: !321)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !344, file: !312, line: 176)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !330, line: 36, baseType: !325)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !346, file: !312, line: 178)
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !330, line: 40, baseType: !48)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !348, file: !312, line: 179)
!348 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !330, line: 41, baseType: !314)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !350, file: !312, line: 180)
!350 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !330, line: 42, baseType: !76)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !352, file: !312, line: 181)
!352 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !330, line: 43, baseType: !16)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !354, file: !312, line: 183)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !330, line: 44, baseType: !24)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !356, file: !312, line: 184)
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !330, line: 45, baseType: !86)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !358, file: !312, line: 185)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !330, line: 46, baseType: !321)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !360, file: !312, line: 186)
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !330, line: 47, baseType: !325)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !362, file: !312, line: 188)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !363, line: 32, baseType: !364)
!363 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !365, line: 40, baseType: !366)
!365 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!366 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !368, file: !312, line: 189)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !369, line: 34, baseType: !370)
!369 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!370 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !372, file: !312, line: 191)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !373, line: 32, baseType: !366)
!373 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !375, file: !312, line: 192)
!375 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !376, line: 32, baseType: !370)
!376 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !378, file: !381, line: 22)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !379, line: 16, baseType: !380)
!379 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!380 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!381 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !383, file: !387, line: 113)
!383 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !384, file: !384, line: 217, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!385 = !DISubroutineType(types: !386)
!386 = !{!7, !7}
!387 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !389, file: !387, line: 114)
!389 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !384, file: !384, line: 223, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !391, file: !387, line: 115)
!391 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !384, file: !384, line: 229, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !393, file: !387, line: 116)
!393 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !384, file: !384, line: 235, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !395, file: !387, line: 117)
!395 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !384, file: !384, line: 242, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !397, file: !387, line: 118)
!397 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !384, file: !384, line: 248, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !399, file: !387, line: 119)
!399 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !384, file: !384, line: 254, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !401, file: !387, line: 120)
!401 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !384, file: !384, line: 260, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !403, file: !387, line: 121)
!403 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !384, file: !384, line: 266, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !405, file: !387, line: 122)
!405 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !384, file: !384, line: 272, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !407, file: !387, line: 123)
!407 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !384, file: !384, line: 278, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !409, file: !387, line: 124)
!409 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !384, file: !384, line: 285, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !411, file: !387, line: 125)
!411 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !384, file: !384, line: 297, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !413, file: !387, line: 126)
!413 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !384, file: !384, line: 303, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !415, file: !418, line: 75)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !416, line: 32, baseType: !417)
!416 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !365, line: 111, baseType: !7)
!418 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !420, file: !418, line: 76)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !421, line: 32, baseType: !422)
!421 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !423, line: 44, baseType: !7)
!423 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !425, file: !418, line: 77)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !426, line: 32, baseType: !427)
!426 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!427 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !423, line: 46, baseType: !428)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !365, line: 36, baseType: !323)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !430, file: !418, line: 78)
!430 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !431, file: !431, line: 84, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!432 = !DISubroutineType(types: !433)
!433 = !{!7, !415}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !435, file: !418, line: 79)
!435 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !431, file: !431, line: 90, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !437, file: !418, line: 80)
!437 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !438, file: !438, line: 53, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !440, file: !418, line: 81)
!440 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !431, file: !431, line: 96, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !442, file: !418, line: 82)
!442 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !431, file: !431, line: 108, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !444, file: !418, line: 83)
!444 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !431, file: !431, line: 114, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !446, file: !418, line: 84)
!446 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !431, file: !431, line: 120, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !448, file: !418, line: 85)
!448 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !431, file: !431, line: 126, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !450, file: !418, line: 86)
!450 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !431, file: !431, line: 132, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !452, file: !418, line: 87)
!452 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !431, file: !431, line: 138, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !454, file: !418, line: 88)
!454 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !431, file: !431, line: 144, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !456, file: !418, line: 89)
!456 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !431, file: !431, line: 150, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !458, file: !418, line: 90)
!458 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !431, file: !431, line: 102, type: !459, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DISubroutineType(types: !460)
!460 = !{!7, !415, !425}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !462, file: !418, line: 91)
!462 = !DISubprogram(name: "wctype", scope: !431, file: !431, line: 190, type: !463, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{!425, !465}
!465 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !467, file: !418, line: 92)
!467 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !431, file: !431, line: 156, type: !468, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DISubroutineType(types: !469)
!469 = !{!415, !415}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !471, file: !418, line: 93)
!471 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !431, file: !431, line: 162, type: !468, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !473, file: !418, line: 94)
!473 = !DISubprogram(name: "towctrans", scope: !438, file: !438, line: 124, type: !474, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DISubroutineType(types: !475)
!475 = !{!415, !415, !420}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !477, file: !418, line: 95)
!477 = !DISubprogram(name: "wctrans", scope: !438, file: !438, line: 126, type: !478, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DISubroutineType(types: !479)
!479 = !{!420, !465}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !481, file: !492, line: 133)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !482, line: 32, baseType: !483)
!482 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !365, line: 72, baseType: !484)
!484 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !365, line: 70, baseType: !485)
!485 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !365, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !486, identifier: "_ZTS11__mbstate_t")
!486 = !{!487, !491}
!487 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !485, file: !365, line: 68, baseType: !488, size: 1024)
!488 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 1024, elements: !489)
!489 = !{!490}
!490 = !DISubrange(count: 128)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !485, file: !365, line: 69, baseType: !18, size: 64)
!492 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !494, file: !492, line: 134)
!494 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !495, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !496, identifier: "_ZTS2tm")
!495 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!496 = !{!497, !498, !499, !500, !501, !502, !503, !504, !505, !506, !507}
!497 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !494, file: !495, line: 79, baseType: !7, size: 32)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !494, file: !495, line: 80, baseType: !7, size: 32, offset: 32)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !494, file: !495, line: 81, baseType: !7, size: 32, offset: 64)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !494, file: !495, line: 82, baseType: !7, size: 32, offset: 96)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !494, file: !495, line: 83, baseType: !7, size: 32, offset: 128)
!502 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !494, file: !495, line: 84, baseType: !7, size: 32, offset: 160)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !494, file: !495, line: 85, baseType: !7, size: 32, offset: 192)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !494, file: !495, line: 86, baseType: !7, size: 32, offset: 224)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !494, file: !495, line: 87, baseType: !7, size: 32, offset: 256)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !494, file: !495, line: 88, baseType: !366, size: 64, offset: 320)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !494, file: !495, line: 89, baseType: !14, size: 64, offset: 384)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !415, file: !492, line: 135)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !510, file: !492, line: 136)
!510 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !511, line: 162, baseType: !512)
!511 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!512 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !511, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !513, identifier: "_ZTS7__sFILE")
!513 = !{!514, !516, !517, !518, !519, !520, !525, !526, !528, !532, !536, !544, !548, !549, !552, !553, !557, !561, !562, !563}
!514 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !512, file: !511, line: 132, baseType: !515, size: 64)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !512, file: !511, line: 133, baseType: !7, size: 32, offset: 64)
!517 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !512, file: !511, line: 134, baseType: !7, size: 32, offset: 96)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !512, file: !511, line: 135, baseType: !53, size: 16, offset: 128)
!519 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !512, file: !511, line: 136, baseType: !53, size: 16, offset: 144)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !512, file: !511, line: 137, baseType: !521, size: 128, offset: 192)
!521 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !511, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !522, identifier: "_ZTS6__sbuf")
!522 = !{!523, !524}
!523 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !521, file: !511, line: 98, baseType: !515, size: 64)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !521, file: !511, line: 99, baseType: !7, size: 32, offset: 64)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !512, file: !511, line: 138, baseType: !7, size: 32, offset: 320)
!526 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !512, file: !511, line: 141, baseType: !527, size: 64, offset: 384)
!527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !512, file: !511, line: 142, baseType: !529, size: 64, offset: 448)
!529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !530, size: 64)
!530 = !DISubroutineType(types: !531)
!531 = !{!7, !527}
!532 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !512, file: !511, line: 143, baseType: !533, size: 64, offset: 512)
!533 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !534, size: 64)
!534 = !DISubroutineType(types: !535)
!535 = !{!7, !527, !14, !7}
!536 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !512, file: !511, line: 144, baseType: !537, size: 64, offset: 576)
!537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !538, size: 64)
!538 = !DISubroutineType(types: !539)
!539 = !{!540, !527, !540, !7}
!540 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !511, line: 86, baseType: !541)
!541 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !542, line: 83, baseType: !543)
!542 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!543 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !365, line: 37, baseType: !18)
!544 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !512, file: !511, line: 145, baseType: !545, size: 64, offset: 640)
!545 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !546, size: 64)
!546 = !DISubroutineType(types: !547)
!547 = !{!7, !527, !465, !7}
!548 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !512, file: !511, line: 148, baseType: !521, size: 128, offset: 704)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !512, file: !511, line: 149, baseType: !550, size: 64, offset: 832)
!550 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !551, size: 64)
!551 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !511, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!552 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !512, file: !511, line: 150, baseType: !7, size: 32, offset: 896)
!553 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !512, file: !511, line: 153, baseType: !554, size: 24, offset: 928)
!554 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 24, elements: !555)
!555 = !{!556}
!556 = !DISubrange(count: 3)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !512, file: !511, line: 154, baseType: !558, size: 8, offset: 952)
!558 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 8, elements: !559)
!559 = !{!560}
!560 = !DISubrange(count: 1)
!561 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !512, file: !511, line: 157, baseType: !521, size: 128, offset: 960)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !512, file: !511, line: 160, baseType: !7, size: 32, offset: 1088)
!563 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !512, file: !511, line: 161, baseType: !540, size: 64, offset: 1152)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !565, file: !492, line: 137)
!565 = !DISubprogram(name: "fwprintf", scope: !566, file: !566, line: 107, type: !567, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!567 = !DISubroutineType(types: !568)
!568 = !{!7, !569, !570, null}
!569 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !510, size: 64)
!570 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !571, size: 64)
!571 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !572)
!572 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !574, file: !492, line: 138)
!574 = !DISubprogram(name: "fwscanf", scope: !566, file: !566, line: 108, type: !567, flags: DIFlagPrototyped, spFlags: 0)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !576, file: !492, line: 139)
!576 = !DISubprogram(name: "swprintf", scope: !566, file: !566, line: 120, type: !577, flags: DIFlagPrototyped, spFlags: 0)
!577 = !DISubroutineType(types: !578)
!578 = !{!7, !579, !580, !570, null}
!579 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !572, size: 64)
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !581, line: 50, baseType: !582)
!581 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!582 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !365, line: 87, baseType: !370)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !584, file: !492, line: 140)
!584 = !DISubprogram(name: "vfwprintf", scope: !566, file: !566, line: 124, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{!7, !569, !570, !587}
!587 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !365, line: 95, baseType: !588)
!588 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !22, baseType: !14)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !590, file: !492, line: 141)
!590 = !DISubprogram(name: "vswprintf", scope: !566, file: !566, line: 126, type: !591, flags: DIFlagPrototyped, spFlags: 0)
!591 = !DISubroutineType(types: !592)
!592 = !{!7, !579, !580, !570, !587}
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !594, file: !492, line: 142)
!594 = !DISubprogram(name: "swscanf", scope: !566, file: !566, line: 122, type: !595, flags: DIFlagPrototyped, spFlags: 0)
!595 = !DISubroutineType(types: !596)
!596 = !{!7, !570, !570, null}
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !598, file: !492, line: 143)
!598 = !DISubprogram(name: "vfwscanf", scope: !566, file: !566, line: 195, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !600, file: !492, line: 144)
!600 = !DISubprogram(name: "vswscanf", scope: !566, file: !566, line: 197, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!7, !570, !570, !587}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !604, file: !492, line: 145)
!604 = !DISubprogram(name: "fgetwc", scope: !566, file: !566, line: 100, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DISubroutineType(types: !606)
!606 = !{!415, !569}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !608, file: !492, line: 146)
!608 = !DISubprogram(name: "fgetws", scope: !566, file: !566, line: 102, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!579, !579, !7, !569}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !612, file: !492, line: 147)
!612 = !DISubprogram(name: "fputwc", scope: !566, file: !566, line: 104, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!415, !572, !569}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !616, file: !492, line: 148)
!616 = !DISubprogram(name: "fputws", scope: !566, file: !566, line: 105, type: !617, flags: DIFlagPrototyped, spFlags: 0)
!617 = !DISubroutineType(types: !618)
!618 = !{!7, !570, !569}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !620, file: !492, line: 149)
!620 = !DISubprogram(name: "fwide", scope: !566, file: !566, line: 106, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!621 = !DISubroutineType(types: !622)
!622 = !{!7, !569, !7}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !624, file: !492, line: 150)
!624 = !DISubprogram(name: "getwc", scope: !566, file: !566, line: 109, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !626, file: !492, line: 151)
!626 = !DISubprogram(name: "putwc", scope: !566, file: !566, line: 118, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !628, file: !492, line: 152)
!628 = !DISubprogram(name: "ungetwc", scope: !566, file: !566, line: 123, type: !629, flags: DIFlagPrototyped, spFlags: 0)
!629 = !DISubroutineType(types: !630)
!630 = !{!415, !415, !569}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !632, file: !492, line: 153)
!632 = !DISubprogram(name: "wcstod", scope: !566, file: !566, line: 160, type: !633, flags: DIFlagPrototyped, spFlags: 0)
!633 = !DISubroutineType(types: !634)
!634 = !{!635, !570, !636}
!635 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !579, size: 64)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !638, file: !492, line: 154)
!638 = !DISubprogram(name: "wcstof", scope: !566, file: !566, line: 200, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!639 = !DISubroutineType(types: !640)
!640 = !{!641, !570, !636}
!641 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !643, file: !492, line: 155)
!643 = !DISubprogram(name: "wcstold", scope: !566, file: !566, line: 202, type: !644, flags: DIFlagPrototyped, spFlags: 0)
!644 = !DISubroutineType(types: !645)
!645 = !{!380, !570, !636}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !647, file: !492, line: 156)
!647 = !DISubprogram(name: "wcstol", scope: !566, file: !566, line: 164, type: !648, flags: DIFlagPrototyped, spFlags: 0)
!648 = !DISubroutineType(types: !649)
!649 = !{!366, !570, !636, !7}
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !651, file: !492, line: 157)
!651 = !DISubprogram(name: "wcstoll", scope: !566, file: !566, line: 205, type: !652, flags: DIFlagPrototyped, spFlags: 0)
!652 = !DISubroutineType(types: !653)
!653 = !{!18, !570, !636, !7}
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !655, file: !492, line: 158)
!655 = !DISubprogram(name: "wcstoul", scope: !566, file: !566, line: 167, type: !656, flags: DIFlagPrototyped, spFlags: 0)
!656 = !DISubroutineType(types: !657)
!657 = !{!370, !570, !636, !7}
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !659, file: !492, line: 159)
!659 = !DISubprogram(name: "wcstoull", scope: !566, file: !566, line: 207, type: !660, flags: DIFlagPrototyped, spFlags: 0)
!660 = !DISubroutineType(types: !661)
!661 = !{!327, !570, !636, !7}
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !663, file: !492, line: 160)
!663 = !DISubprogram(name: "wcscpy", scope: !566, file: !566, line: 134, type: !664, flags: DIFlagPrototyped, spFlags: 0)
!664 = !DISubroutineType(types: !665)
!665 = !{!579, !579, !570}
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !667, file: !492, line: 161)
!667 = !DISubprogram(name: "wcsncpy", scope: !566, file: !566, line: 148, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!668 = !DISubroutineType(types: !669)
!669 = !{!579, !579, !570, !580}
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !671, file: !492, line: 162)
!671 = !DISubprogram(name: "wcscat", scope: !566, file: !566, line: 130, type: !664, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !673, file: !492, line: 163)
!673 = !DISubprogram(name: "wcsncat", scope: !566, file: !566, line: 142, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !675, file: !492, line: 164)
!675 = !DISubprogram(name: "wcscmp", scope: !566, file: !566, line: 132, type: !676, flags: DIFlagPrototyped, spFlags: 0)
!676 = !DISubroutineType(types: !677)
!677 = !{!7, !570, !570}
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !679, file: !492, line: 165)
!679 = !DISubprogram(name: "wcscoll", scope: !566, file: !566, line: 133, type: !676, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !681, file: !492, line: 166)
!681 = !DISubprogram(name: "wcsncmp", scope: !566, file: !566, line: 145, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DISubroutineType(types: !683)
!683 = !{!7, !570, !570, !580}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !685, file: !492, line: 167)
!685 = !DISubprogram(name: "wcsxfrm", scope: !566, file: !566, line: 157, type: !686, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DISubroutineType(types: !687)
!687 = !{!580, !579, !570, !580}
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !689, file: !492, line: 168)
!689 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !690, file: !690, line: 147, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!691 = !DISubroutineType(types: !692)
!692 = !{!579, !579, !572}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !694, file: !492, line: 169)
!694 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !690, file: !690, line: 158, type: !664, flags: DIFlagPrototyped, spFlags: 0)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !696, file: !492, line: 170)
!696 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !690, file: !690, line: 168, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !698, file: !492, line: 171)
!698 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !690, file: !690, line: 179, type: !664, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !700, file: !492, line: 172)
!700 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !690, file: !690, line: 190, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!579, !579, !572, !580}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !704, file: !492, line: 173)
!704 = !DISubprogram(name: "wcscspn", scope: !566, file: !566, line: 136, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!705 = !DISubroutineType(types: !706)
!706 = !{!580, !570, !570}
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !708, file: !492, line: 174)
!708 = !DISubprogram(name: "wcslen", scope: !566, file: !566, line: 140, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DISubroutineType(types: !710)
!710 = !{!580, !570}
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !712, file: !492, line: 175)
!712 = !DISubprogram(name: "wcsspn", scope: !566, file: !566, line: 155, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !714, file: !492, line: 176)
!714 = !DISubprogram(name: "wcstok", scope: !566, file: !566, line: 162, type: !715, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DISubroutineType(types: !716)
!716 = !{!579, !579, !570, !636}
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !718, file: !492, line: 177)
!718 = !DISubprogram(name: "wmemcmp", scope: !566, file: !566, line: 170, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !720, file: !492, line: 178)
!720 = !DISubprogram(name: "wmemcpy", scope: !566, file: !566, line: 173, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !722, file: !492, line: 179)
!722 = !DISubprogram(name: "wmemmove", scope: !566, file: !566, line: 176, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !724, file: !492, line: 180)
!724 = !DISubprogram(name: "wmemset", scope: !566, file: !566, line: 179, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !726, file: !492, line: 181)
!726 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !566, file: !566, line: 137, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!580, !579, !580, !570, !729}
!729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !730, size: 64)
!730 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !494)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !732, file: !492, line: 182)
!732 = !DISubprogram(name: "btowc", scope: !566, file: !566, line: 99, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{!415, !7}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !736, file: !492, line: 183)
!736 = !DISubprogram(name: "wctob", scope: !566, file: !566, line: 159, type: !432, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !738, file: !492, line: 184)
!738 = !DISubprogram(name: "mbsinit", scope: !566, file: !566, line: 115, type: !739, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubroutineType(types: !740)
!740 = !{!7, !741}
!741 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !742, size: 64)
!742 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !481)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !744, file: !492, line: 185)
!744 = !DISubprogram(name: "mbrlen", scope: !566, file: !566, line: 111, type: !745, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DISubroutineType(types: !746)
!746 = !{!580, !465, !580, !747}
!747 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !749, file: !492, line: 186)
!749 = !DISubprogram(name: "mbrtowc", scope: !566, file: !566, line: 113, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!750 = !DISubroutineType(types: !751)
!751 = !{!580, !579, !465, !580, !747}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !753, file: !492, line: 187)
!753 = !DISubprogram(name: "wcrtomb", scope: !566, file: !566, line: 129, type: !754, flags: DIFlagPrototyped, spFlags: 0)
!754 = !DISubroutineType(types: !755)
!755 = !{!580, !14, !572, !747}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !757, file: !492, line: 188)
!757 = !DISubprogram(name: "mbsrtowcs", scope: !566, file: !566, line: 116, type: !758, flags: DIFlagPrototyped, spFlags: 0)
!758 = !DISubroutineType(types: !759)
!759 = !{!580, !579, !760, !580, !747}
!760 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !762, file: !492, line: 189)
!762 = !DISubprogram(name: "wcsrtombs", scope: !566, file: !566, line: 153, type: !763, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DISubroutineType(types: !764)
!764 = !{!580, !14, !765, !580, !747}
!765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !570, size: 64)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !767, file: !492, line: 191)
!767 = !DISubprogram(name: "getwchar", scope: !566, file: !566, line: 110, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!768 = !DISubroutineType(types: !769)
!769 = !{!415}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !771, file: !492, line: 192)
!771 = !DISubprogram(name: "vwscanf", scope: !566, file: !566, line: 199, type: !772, flags: DIFlagPrototyped, spFlags: 0)
!772 = !DISubroutineType(types: !773)
!773 = !{!7, !570, !587}
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !775, file: !492, line: 193)
!775 = !DISubprogram(name: "wscanf", scope: !566, file: !566, line: 181, type: !776, flags: DIFlagPrototyped, spFlags: 0)
!776 = !DISubroutineType(types: !777)
!777 = !{!7, !570, null}
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !779, file: !492, line: 195)
!779 = !DISubprogram(name: "putwchar", scope: !566, file: !566, line: 119, type: !780, flags: DIFlagPrototyped, spFlags: 0)
!780 = !DISubroutineType(types: !781)
!781 = !{!415, !572}
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !783, file: !492, line: 196)
!783 = !DISubprogram(name: "vwprintf", scope: !566, file: !566, line: 128, type: !772, flags: DIFlagPrototyped, spFlags: 0)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !785, file: !492, line: 197)
!785 = !DISubprogram(name: "wprintf", scope: !566, file: !566, line: 180, type: !776, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !787, file: !793, line: 106)
!787 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !788, line: 105, baseType: !789)
!788 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!789 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !788, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !790, identifier: "_ZTS5div_t")
!790 = !{!791, !792}
!791 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !789, file: !788, line: 103, baseType: !7, size: 32)
!792 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !789, file: !788, line: 104, baseType: !7, size: 32, offset: 32)
!793 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !795, file: !793, line: 107)
!795 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !788, line: 110, baseType: !796)
!796 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !788, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !797, identifier: "_ZTS6ldiv_t")
!797 = !{!798, !799}
!798 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !796, file: !788, line: 108, baseType: !366, size: 64)
!799 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !796, file: !788, line: 109, baseType: !366, size: 64, offset: 64)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !801, file: !793, line: 108)
!801 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !788, line: 116, baseType: !802)
!802 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !788, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !803, identifier: "_ZTS7lldiv_t")
!803 = !{!804, !805}
!804 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !802, file: !788, line: 114, baseType: !18, size: 64)
!805 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !802, file: !788, line: 115, baseType: !18, size: 64, offset: 64)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !807, file: !793, line: 109)
!807 = !DISubprogram(name: "atof", scope: !788, file: !788, line: 149, type: !808, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DISubroutineType(types: !809)
!809 = !{!635, !465}
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !811, file: !793, line: 110)
!811 = !DISubprogram(name: "atoi", scope: !788, file: !788, line: 150, type: !812, flags: DIFlagPrototyped, spFlags: 0)
!812 = !DISubroutineType(types: !813)
!813 = !{!7, !465}
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !815, file: !793, line: 111)
!815 = !DISubprogram(name: "atol", scope: !788, file: !788, line: 151, type: !816, flags: DIFlagPrototyped, spFlags: 0)
!816 = !DISubroutineType(types: !817)
!817 = !{!366, !465}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !819, file: !793, line: 112)
!819 = !DISubprogram(name: "atoll", scope: !788, file: !788, line: 154, type: !820, flags: DIFlagPrototyped, spFlags: 0)
!820 = !DISubroutineType(types: !821)
!821 = !{!18, !465}
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !823, file: !793, line: 113)
!823 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !788, file: !788, line: 184, type: !824, flags: DIFlagPrototyped, spFlags: 0)
!824 = !DISubroutineType(types: !825)
!825 = !{!635, !465, !826}
!826 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !828, file: !793, line: 114)
!828 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !788, file: !788, line: 185, type: !829, flags: DIFlagPrototyped, spFlags: 0)
!829 = !DISubroutineType(types: !830)
!830 = !{!641, !465, !826}
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !832, file: !793, line: 115)
!832 = !DISubprogram(name: "strtold", scope: !788, file: !788, line: 188, type: !833, flags: DIFlagPrototyped, spFlags: 0)
!833 = !DISubroutineType(types: !834)
!834 = !{!380, !465, !826}
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !836, file: !793, line: 116)
!836 = !DISubprogram(name: "strtol", scope: !788, file: !788, line: 186, type: !837, flags: DIFlagPrototyped, spFlags: 0)
!837 = !DISubroutineType(types: !838)
!838 = !{!366, !465, !826, !7}
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !840, file: !793, line: 117)
!840 = !DISubprogram(name: "strtoll", scope: !788, file: !788, line: 191, type: !841, flags: DIFlagPrototyped, spFlags: 0)
!841 = !DISubroutineType(types: !842)
!842 = !{!18, !465, !826, !7}
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !844, file: !793, line: 118)
!844 = !DISubprogram(name: "strtoul", scope: !788, file: !788, line: 194, type: !845, flags: DIFlagPrototyped, spFlags: 0)
!845 = !DISubroutineType(types: !846)
!846 = !{!370, !465, !826, !7}
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !848, file: !793, line: 119)
!848 = !DISubprogram(name: "strtoull", scope: !788, file: !788, line: 197, type: !849, flags: DIFlagPrototyped, spFlags: 0)
!849 = !DISubroutineType(types: !850)
!850 = !{!327, !465, !826, !7}
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !852, file: !793, line: 120)
!852 = !DISubprogram(name: "rand", scope: !788, file: !788, line: 181, type: !853, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DISubroutineType(types: !854)
!854 = !{!7}
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !856, file: !793, line: 121)
!856 = !DISubprogram(name: "srand", scope: !788, file: !788, line: 183, type: !857, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DISubroutineType(types: !858)
!858 = !{null, !323}
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !860, file: !793, line: 122)
!860 = !DISubprogram(name: "calloc", scope: !861, file: !861, line: 55, type: !862, flags: DIFlagPrototyped, spFlags: 0)
!861 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!862 = !DISubroutineType(types: !863)
!863 = !{!527, !580, !580}
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !865, file: !793, line: 123)
!865 = !DISubprogram(name: "free", scope: !861, file: !861, line: 56, type: !866, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DISubroutineType(types: !867)
!867 = !{null, !527}
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !869, file: !793, line: 124)
!869 = !DISubprogram(name: "malloc", scope: !861, file: !861, line: 54, type: !870, flags: DIFlagPrototyped, spFlags: 0)
!870 = !DISubroutineType(types: !871)
!871 = !{!527, !580}
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !873, file: !793, line: 125)
!873 = !DISubprogram(name: "realloc", scope: !861, file: !861, line: 57, type: !874, flags: DIFlagPrototyped, spFlags: 0)
!874 = !DISubroutineType(types: !875)
!875 = !{!527, !527, !580}
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !877, file: !793, line: 126)
!877 = !DISubprogram(name: "abort", scope: !878, file: !878, line: 33, type: !879, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!878 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!879 = !DISubroutineType(types: !880)
!880 = !{null}
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !882, file: !793, line: 127)
!882 = !DISubprogram(name: "atexit", scope: !788, file: !788, line: 144, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DISubroutineType(types: !884)
!884 = !{!7, !885}
!885 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !879, size: 64)
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !887, file: !793, line: 128)
!887 = !DISubprogram(name: "exit", scope: !788, file: !788, line: 160, type: !888, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!888 = !DISubroutineType(types: !889)
!889 = !{null, !7}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !891, file: !793, line: 129)
!891 = !DISubprogram(name: "_Exit", scope: !788, file: !788, line: 210, type: !888, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !893, file: !793, line: 130)
!893 = !DISubprogram(name: "getenv", scope: !788, file: !788, line: 162, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!894 = !DISubroutineType(types: !895)
!895 = !{!14, !465}
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !897, file: !793, line: 131)
!897 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !788, file: !788, line: 203, type: !812, flags: DIFlagPrototyped, spFlags: 0)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !899, file: !793, line: 132)
!899 = !DISubprogram(name: "bsearch", scope: !788, file: !788, line: 156, type: !900, flags: DIFlagPrototyped, spFlags: 0)
!900 = !DISubroutineType(types: !901)
!901 = !{!527, !902, !902, !580, !580, !904}
!902 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !903, size: 64)
!903 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!904 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !905, size: 64)
!905 = !DISubroutineType(types: !906)
!906 = !{!7, !902, !902}
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !908, file: !793, line: 133)
!908 = !DISubprogram(name: "qsort", scope: !788, file: !788, line: 175, type: !909, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DISubroutineType(types: !910)
!910 = !{null, !527, !580, !580, !904}
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !912, file: !793, line: 134)
!912 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !913, file: !913, line: 123, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!914 = !DISubroutineType(types: !915)
!915 = !{!380, !380}
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !917, file: !793, line: 135)
!917 = !DISubprogram(name: "labs", scope: !788, file: !788, line: 163, type: !918, flags: DIFlagPrototyped, spFlags: 0)
!918 = !DISubroutineType(types: !919)
!919 = !{!366, !366}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !921, file: !793, line: 136)
!921 = !DISubprogram(name: "llabs", scope: !788, file: !788, line: 167, type: !922, flags: DIFlagPrototyped, spFlags: 0)
!922 = !DISubroutineType(types: !923)
!923 = !{!18, !18}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !925, file: !793, line: 137)
!925 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !913, file: !913, line: 143, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!926 = !DISubroutineType(types: !927)
!927 = !{!801, !18, !18}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !929, file: !793, line: 138)
!929 = !DISubprogram(name: "ldiv", scope: !788, file: !788, line: 164, type: !930, flags: DIFlagPrototyped, spFlags: 0)
!930 = !DISubroutineType(types: !931)
!931 = !{!795, !366, !366}
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !933, file: !793, line: 139)
!933 = !DISubprogram(name: "lldiv", scope: !788, file: !788, line: 168, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !935, file: !793, line: 140)
!935 = !DISubprogram(name: "mblen", scope: !788, file: !788, line: 171, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DISubroutineType(types: !937)
!937 = !{!7, !465, !580}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !939, file: !793, line: 142)
!939 = !DISubprogram(name: "mbtowc", scope: !788, file: !788, line: 173, type: !940, flags: DIFlagPrototyped, spFlags: 0)
!940 = !DISubroutineType(types: !941)
!941 = !{!7, !579, !465, !580}
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !943, file: !793, line: 143)
!943 = !DISubprogram(name: "wctomb", scope: !788, file: !788, line: 207, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!944 = !DISubroutineType(types: !945)
!945 = !{!7, !14, !572}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !947, file: !793, line: 144)
!947 = !DISubprogram(name: "mbstowcs", scope: !788, file: !788, line: 172, type: !948, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DISubroutineType(types: !949)
!949 = !{!580, !579, !465, !580}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !951, file: !793, line: 145)
!951 = !DISubprogram(name: "wcstombs", scope: !788, file: !788, line: 206, type: !952, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DISubroutineType(types: !953)
!953 = !{!580, !14, !570, !580}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !955, file: !793, line: 148)
!955 = !DISubprogram(name: "at_quick_exit", scope: !788, file: !788, line: 147, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !957, file: !793, line: 149)
!957 = !DISubprogram(name: "quick_exit", scope: !788, file: !788, line: 179, type: !888, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !481, file: !959, line: 25)
!959 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !961, file: !967, line: 422)
!961 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !963, file: !962, line: 79, type: !964, flags: DIFlagPrototyped, spFlags: 0)
!962 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!963 = !DINamespace(name: "__math", scope: !310)
!964 = !DISubroutineType(types: !965)
!965 = !{!966, !380}
!966 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!967 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !969, file: !967, line: 425)
!969 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !963, file: !962, line: 103, type: !964, flags: DIFlagPrototyped, spFlags: 0)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !971, file: !967, line: 429)
!971 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !963, file: !962, line: 127, type: !964, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !973, file: !967, line: 430)
!973 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !963, file: !962, line: 146, type: !964, flags: DIFlagPrototyped, spFlags: 0)
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !975, file: !967, line: 485)
!975 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !963, file: !976, line: 55, type: !977, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!977 = !DISubroutineType(types: !978)
!978 = !{!380, !380, !979}
!979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !961, file: !981, line: 352)
!981 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !969, file: !981, line: 353)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !971, file: !981, line: 354)
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !973, file: !981, line: 355)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !986, file: !981, line: 364)
!986 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !987, line: 50, baseType: !641)
!987 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !989, file: !981, line: 365)
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !987, line: 51, baseType: !635)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !912, file: !981, line: 367)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !992, file: !981, line: 370)
!992 = !DISubprogram(name: "acosf", scope: !987, file: !987, line: 314, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DISubroutineType(types: !994)
!994 = !{!641, !641}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !996, file: !981, line: 372)
!996 = !DISubprogram(name: "asinf", scope: !987, file: !987, line: 318, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !998, file: !981, line: 374)
!998 = !DISubprogram(name: "atanf", scope: !987, file: !987, line: 322, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1000, file: !981, line: 376)
!1000 = !DISubprogram(name: "atan2f", scope: !987, file: !987, line: 326, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!641, !641, !641}
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1004, file: !981, line: 378)
!1004 = !DISubprogram(name: "ceilf", scope: !987, file: !987, line: 461, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1006, file: !981, line: 380)
!1006 = !DISubprogram(name: "cosf", scope: !987, file: !987, line: 330, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1008, file: !981, line: 382)
!1008 = !DISubprogram(name: "coshf", scope: !987, file: !987, line: 354, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1010, file: !981, line: 385)
!1010 = !DISubprogram(name: "expf", scope: !987, file: !987, line: 366, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1012, file: !981, line: 388)
!1012 = !DISubprogram(name: "fabsf", scope: !987, file: !987, line: 422, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1014, file: !981, line: 390)
!1014 = !DISubprogram(name: "floorf", scope: !987, file: !987, line: 465, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1016, file: !981, line: 393)
!1016 = !DISubprogram(name: "fmodf", scope: !987, file: !987, line: 505, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1018, file: !981, line: 396)
!1018 = !DISubprogram(name: "frexpf", scope: !987, file: !987, line: 406, type: !1019, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!641, !641, !1021}
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1023, file: !981, line: 398)
!1023 = !DISubprogram(name: "ldexpf", scope: !987, file: !987, line: 402, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!641, !641, !7}
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1027, file: !981, line: 401)
!1027 = !DISubprogram(name: "logf", scope: !987, file: !987, line: 378, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1029, file: !981, line: 404)
!1029 = !DISubprogram(name: "log10f", scope: !987, file: !987, line: 382, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !975, file: !981, line: 405)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1032, file: !981, line: 406)
!1032 = !DISubprogram(name: "modff", scope: !987, file: !987, line: 398, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!641, !641, !1035}
!1035 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !641, size: 64)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1037, file: !981, line: 409)
!1037 = !DISubprogram(name: "powf", scope: !987, file: !987, line: 434, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1039, file: !981, line: 412)
!1039 = !DISubprogram(name: "sinf", scope: !987, file: !987, line: 334, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1041, file: !981, line: 414)
!1041 = !DISubprogram(name: "sinhf", scope: !987, file: !987, line: 358, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1043, file: !981, line: 417)
!1043 = !DISubprogram(name: "sqrtf", scope: !987, file: !987, line: 438, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1045, file: !981, line: 419)
!1045 = !DISubprogram(name: "tanf", scope: !987, file: !987, line: 338, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1047, file: !981, line: 422)
!1047 = !DISubprogram(name: "tanhf", scope: !987, file: !987, line: 362, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1049, file: !981, line: 425)
!1049 = !DISubprogram(name: "acoshf", scope: !987, file: !987, line: 342, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1051, file: !981, line: 427)
!1051 = !DISubprogram(name: "asinhf", scope: !987, file: !987, line: 346, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1053, file: !981, line: 429)
!1053 = !DISubprogram(name: "atanhf", scope: !987, file: !987, line: 350, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1055, file: !981, line: 431)
!1055 = !DISubprogram(name: "cbrtf", scope: !987, file: !987, line: 426, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1057, file: !981, line: 434)
!1057 = !DISubprogram(name: "copysignf", scope: !987, file: !987, line: 517, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1059, file: !981, line: 437)
!1059 = !DISubprogram(name: "erff", scope: !987, file: !987, line: 442, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1061, file: !981, line: 439)
!1061 = !DISubprogram(name: "erfcf", scope: !987, file: !987, line: 446, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1063, file: !981, line: 441)
!1063 = !DISubprogram(name: "exp2f", scope: !987, file: !987, line: 370, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1065, file: !981, line: 443)
!1065 = !DISubprogram(name: "expm1f", scope: !987, file: !987, line: 374, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1067, file: !981, line: 445)
!1067 = !DISubprogram(name: "fdimf", scope: !987, file: !987, line: 533, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1069, file: !981, line: 446)
!1069 = !DISubprogram(name: "fmaf", scope: !987, file: !987, line: 545, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{!641, !641, !641, !641}
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1073, file: !981, line: 449)
!1073 = !DISubprogram(name: "fmaxf", scope: !987, file: !987, line: 537, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1075, file: !981, line: 451)
!1075 = !DISubprogram(name: "fminf", scope: !987, file: !987, line: 541, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1077, file: !981, line: 453)
!1077 = !DISubprogram(name: "hypotf", scope: !987, file: !987, line: 430, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1079, file: !981, line: 455)
!1079 = !DISubprogram(name: "ilogbf", scope: !987, file: !987, line: 410, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!7, !641}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1083, file: !981, line: 457)
!1083 = !DISubprogram(name: "lgammaf", scope: !987, file: !987, line: 453, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1085, file: !981, line: 459)
!1085 = !DISubprogram(name: "llrintf", scope: !987, file: !987, line: 492, type: !1086, flags: DIFlagPrototyped, spFlags: 0)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!18, !641}
!1088 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1089, file: !981, line: 461)
!1089 = !DISubprogram(name: "llroundf", scope: !987, file: !987, line: 496, type: !1086, flags: DIFlagPrototyped, spFlags: 0)
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1091, file: !981, line: 463)
!1091 = !DISubprogram(name: "log1pf", scope: !987, file: !987, line: 390, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1093, file: !981, line: 465)
!1093 = !DISubprogram(name: "log2f", scope: !987, file: !987, line: 386, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1095, file: !981, line: 467)
!1095 = !DISubprogram(name: "logbf", scope: !987, file: !987, line: 394, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1097, file: !981, line: 469)
!1097 = !DISubprogram(name: "lrintf", scope: !987, file: !987, line: 477, type: !1098, flags: DIFlagPrototyped, spFlags: 0)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{!366, !641}
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1101, file: !981, line: 471)
!1101 = !DISubprogram(name: "lroundf", scope: !987, file: !987, line: 485, type: !1098, flags: DIFlagPrototyped, spFlags: 0)
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1103, file: !981, line: 473)
!1103 = !DISubprogram(name: "nan", scope: !987, file: !987, line: 522, type: !808, flags: DIFlagPrototyped, spFlags: 0)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1105, file: !981, line: 474)
!1105 = !DISubprogram(name: "nanf", scope: !987, file: !987, line: 521, type: !1106, flags: DIFlagPrototyped, spFlags: 0)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{!641, !465}
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1109, file: !981, line: 477)
!1109 = !DISubprogram(name: "nearbyintf", scope: !987, file: !987, line: 469, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1111, file: !981, line: 479)
!1111 = !DISubprogram(name: "nextafterf", scope: !987, file: !987, line: 525, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1113, file: !981, line: 481)
!1113 = !DISubprogram(name: "nexttowardf", scope: !987, file: !987, line: 530, type: !1114, flags: DIFlagPrototyped, spFlags: 0)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!641, !641, !380}
!1116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1117, file: !981, line: 483)
!1117 = !DISubprogram(name: "remainderf", scope: !987, file: !987, line: 509, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1119, file: !981, line: 485)
!1119 = !DISubprogram(name: "remquof", scope: !987, file: !987, line: 513, type: !1120, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!641, !641, !641, !1021}
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1123, file: !981, line: 487)
!1123 = !DISubprogram(name: "rintf", scope: !987, file: !987, line: 473, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1125, file: !981, line: 489)
!1125 = !DISubprogram(name: "roundf", scope: !987, file: !987, line: 481, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1127, file: !981, line: 491)
!1127 = !DISubprogram(name: "scalblnf", scope: !987, file: !987, line: 418, type: !1128, flags: DIFlagPrototyped, spFlags: 0)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!641, !641, !366}
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1131, file: !981, line: 493)
!1131 = !DISubprogram(name: "scalbnf", scope: !987, file: !987, line: 414, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1133, file: !981, line: 495)
!1133 = !DISubprogram(name: "tgammaf", scope: !987, file: !987, line: 457, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1135, file: !981, line: 497)
!1135 = !DISubprogram(name: "truncf", scope: !987, file: !987, line: 501, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1137, file: !981, line: 499)
!1137 = !DISubprogram(name: "acosl", scope: !987, file: !987, line: 316, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1139, file: !981, line: 500)
!1139 = !DISubprogram(name: "asinl", scope: !987, file: !987, line: 320, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1141, file: !981, line: 501)
!1141 = !DISubprogram(name: "atanl", scope: !987, file: !987, line: 324, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1143, file: !981, line: 502)
!1143 = !DISubprogram(name: "atan2l", scope: !987, file: !987, line: 328, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!380, !380, !380}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1147, file: !981, line: 503)
!1147 = !DISubprogram(name: "ceill", scope: !987, file: !987, line: 463, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1149, file: !981, line: 504)
!1149 = !DISubprogram(name: "cosl", scope: !987, file: !987, line: 332, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1151, file: !981, line: 505)
!1151 = !DISubprogram(name: "coshl", scope: !987, file: !987, line: 356, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1153, file: !981, line: 506)
!1153 = !DISubprogram(name: "expl", scope: !987, file: !987, line: 368, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1155, file: !981, line: 507)
!1155 = !DISubprogram(name: "fabsl", scope: !987, file: !987, line: 424, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1157, file: !981, line: 508)
!1157 = !DISubprogram(name: "floorl", scope: !987, file: !987, line: 467, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1159, file: !981, line: 509)
!1159 = !DISubprogram(name: "fmodl", scope: !987, file: !987, line: 507, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1161, file: !981, line: 510)
!1161 = !DISubprogram(name: "frexpl", scope: !987, file: !987, line: 408, type: !1162, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!380, !380, !1021}
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1165, file: !981, line: 511)
!1165 = !DISubprogram(name: "ldexpl", scope: !987, file: !987, line: 404, type: !1166, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!380, !380, !7}
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1169, file: !981, line: 512)
!1169 = !DISubprogram(name: "logl", scope: !987, file: !987, line: 380, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1171, file: !981, line: 513)
!1171 = !DISubprogram(name: "log10l", scope: !987, file: !987, line: 384, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1173, file: !981, line: 514)
!1173 = !DISubprogram(name: "modfl", scope: !987, file: !987, line: 400, type: !977, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1175, file: !981, line: 515)
!1175 = !DISubprogram(name: "powl", scope: !987, file: !987, line: 436, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1177, file: !981, line: 516)
!1177 = !DISubprogram(name: "sinl", scope: !987, file: !987, line: 336, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1179, file: !981, line: 517)
!1179 = !DISubprogram(name: "sinhl", scope: !987, file: !987, line: 360, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1181, file: !981, line: 518)
!1181 = !DISubprogram(name: "sqrtl", scope: !987, file: !987, line: 440, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1183, file: !981, line: 519)
!1183 = !DISubprogram(name: "tanl", scope: !987, file: !987, line: 340, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1185, file: !981, line: 521)
!1185 = !DISubprogram(name: "tanhl", scope: !987, file: !987, line: 364, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1187, file: !981, line: 522)
!1187 = !DISubprogram(name: "acoshl", scope: !987, file: !987, line: 344, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1189, file: !981, line: 523)
!1189 = !DISubprogram(name: "asinhl", scope: !987, file: !987, line: 348, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1191, file: !981, line: 524)
!1191 = !DISubprogram(name: "atanhl", scope: !987, file: !987, line: 352, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1193, file: !981, line: 525)
!1193 = !DISubprogram(name: "cbrtl", scope: !987, file: !987, line: 428, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1195, file: !981, line: 527)
!1195 = !DISubprogram(name: "copysignl", scope: !987, file: !987, line: 519, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1197, file: !981, line: 529)
!1197 = !DISubprogram(name: "erfl", scope: !987, file: !987, line: 444, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1199, file: !981, line: 530)
!1199 = !DISubprogram(name: "erfcl", scope: !987, file: !987, line: 448, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1201, file: !981, line: 531)
!1201 = !DISubprogram(name: "exp2l", scope: !987, file: !987, line: 372, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1203, file: !981, line: 532)
!1203 = !DISubprogram(name: "expm1l", scope: !987, file: !987, line: 376, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1205, file: !981, line: 533)
!1205 = !DISubprogram(name: "fdiml", scope: !987, file: !987, line: 535, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1207, file: !981, line: 534)
!1207 = !DISubprogram(name: "fmal", scope: !987, file: !987, line: 547, type: !1208, flags: DIFlagPrototyped, spFlags: 0)
!1208 = !DISubroutineType(types: !1209)
!1209 = !{!380, !380, !380, !380}
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1211, file: !981, line: 535)
!1211 = !DISubprogram(name: "fmaxl", scope: !987, file: !987, line: 539, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1213, file: !981, line: 536)
!1213 = !DISubprogram(name: "fminl", scope: !987, file: !987, line: 543, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1215, file: !981, line: 537)
!1215 = !DISubprogram(name: "hypotl", scope: !987, file: !987, line: 432, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1217, file: !981, line: 538)
!1217 = !DISubprogram(name: "ilogbl", scope: !987, file: !987, line: 412, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!7, !380}
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1221, file: !981, line: 539)
!1221 = !DISubprogram(name: "lgammal", scope: !987, file: !987, line: 455, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1223, file: !981, line: 540)
!1223 = !DISubprogram(name: "llrintl", scope: !987, file: !987, line: 494, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!18, !380}
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1227, file: !981, line: 541)
!1227 = !DISubprogram(name: "llroundl", scope: !987, file: !987, line: 498, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1229, file: !981, line: 542)
!1229 = !DISubprogram(name: "log1pl", scope: !987, file: !987, line: 392, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1231, file: !981, line: 543)
!1231 = !DISubprogram(name: "log2l", scope: !987, file: !987, line: 388, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1233, file: !981, line: 544)
!1233 = !DISubprogram(name: "logbl", scope: !987, file: !987, line: 396, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1235, file: !981, line: 545)
!1235 = !DISubprogram(name: "lrintl", scope: !987, file: !987, line: 479, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{!366, !380}
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1239, file: !981, line: 546)
!1239 = !DISubprogram(name: "lroundl", scope: !987, file: !987, line: 487, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1241, file: !981, line: 547)
!1241 = !DISubprogram(name: "nanl", scope: !987, file: !987, line: 523, type: !1242, flags: DIFlagPrototyped, spFlags: 0)
!1242 = !DISubroutineType(types: !1243)
!1243 = !{!380, !465}
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1245, file: !981, line: 548)
!1245 = !DISubprogram(name: "nearbyintl", scope: !987, file: !987, line: 471, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1247, file: !981, line: 549)
!1247 = !DISubprogram(name: "nextafterl", scope: !987, file: !987, line: 527, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1249, file: !981, line: 550)
!1249 = !DISubprogram(name: "nexttowardl", scope: !987, file: !987, line: 531, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1251, file: !981, line: 551)
!1251 = !DISubprogram(name: "remainderl", scope: !987, file: !987, line: 511, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1253, file: !981, line: 552)
!1253 = !DISubprogram(name: "remquol", scope: !987, file: !987, line: 515, type: !1254, flags: DIFlagPrototyped, spFlags: 0)
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!380, !380, !380, !1021}
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1257, file: !981, line: 553)
!1257 = !DISubprogram(name: "rintl", scope: !987, file: !987, line: 475, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1259, file: !981, line: 554)
!1259 = !DISubprogram(name: "roundl", scope: !987, file: !987, line: 483, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1261, file: !981, line: 555)
!1261 = !DISubprogram(name: "scalblnl", scope: !987, file: !987, line: 420, type: !1262, flags: DIFlagPrototyped, spFlags: 0)
!1262 = !DISubroutineType(types: !1263)
!1263 = !{!380, !380, !366}
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1265, file: !981, line: 556)
!1265 = !DISubprogram(name: "scalbnl", scope: !987, file: !987, line: 416, type: !1166, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1267, file: !981, line: 557)
!1267 = !DISubprogram(name: "tgammal", scope: !987, file: !987, line: 459, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1269, file: !981, line: 558)
!1269 = !DISubprogram(name: "truncl", scope: !987, file: !987, line: 503, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1271, file: !1275, line: 82)
!1271 = !DISubprogram(name: "memcpy", scope: !1272, file: !1272, line: 78, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!527, !527, !902, !580}
!1275 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1277, file: !1275, line: 83)
!1277 = !DISubprogram(name: "memmove", scope: !1272, file: !1272, line: 81, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1279, file: !1275, line: 84)
!1279 = !DISubprogram(name: "strcpy", scope: !1272, file: !1272, line: 92, type: !1280, flags: DIFlagPrototyped, spFlags: 0)
!1280 = !DISubroutineType(types: !1281)
!1281 = !{!14, !14, !465}
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1283, file: !1275, line: 85)
!1283 = !DISubprogram(name: "strncpy", scope: !1272, file: !1272, line: 104, type: !1284, flags: DIFlagPrototyped, spFlags: 0)
!1284 = !DISubroutineType(types: !1285)
!1285 = !{!14, !14, !465, !580}
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1287, file: !1275, line: 86)
!1287 = !DISubprogram(name: "strcat", scope: !1272, file: !1272, line: 86, type: !1280, flags: DIFlagPrototyped, spFlags: 0)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1289, file: !1275, line: 87)
!1289 = !DISubprogram(name: "strncat", scope: !1272, file: !1272, line: 98, type: !1284, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1291, file: !1275, line: 88)
!1291 = !DISubprogram(name: "memcmp", scope: !1272, file: !1272, line: 75, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1292 = !DISubroutineType(types: !1293)
!1293 = !{!7, !902, !902, !580}
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1295, file: !1275, line: 89)
!1295 = !DISubprogram(name: "strcmp", scope: !1272, file: !1272, line: 89, type: !1296, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{!7, !465, !465}
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1299, file: !1275, line: 90)
!1299 = !DISubprogram(name: "strncmp", scope: !1272, file: !1272, line: 101, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!7, !465, !465, !580}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1303, file: !1275, line: 91)
!1303 = !DISubprogram(name: "strcoll", scope: !1272, file: !1272, line: 90, type: !1296, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1305, file: !1275, line: 92)
!1305 = !DISubprogram(name: "strxfrm", scope: !1272, file: !1272, line: 112, type: !1306, flags: DIFlagPrototyped, spFlags: 0)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!580, !14, !465, !580}
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1309, file: !1275, line: 93)
!1309 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !1310, file: !1310, line: 101, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!527, !527, !7, !580}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1314, file: !1275, line: 94)
!1314 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1310, file: !1310, line: 80, type: !1315, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DISubroutineType(types: !1316)
!1316 = !{!14, !14, !7}
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1318, file: !1275, line: 95)
!1318 = !DISubprogram(name: "strcspn", scope: !1272, file: !1272, line: 94, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!580, !465, !465}
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1322, file: !1275, line: 96)
!1322 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1310, file: !1310, line: 87, type: !1280, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1324, file: !1275, line: 97)
!1324 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1310, file: !1310, line: 94, type: !1315, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1326, file: !1275, line: 98)
!1326 = !DISubprogram(name: "strspn", scope: !1272, file: !1272, line: 109, type: !1319, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1328, file: !1275, line: 99)
!1328 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1310, file: !1310, line: 108, type: !1280, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1330, file: !1275, line: 100)
!1330 = !DISubprogram(name: "strtok", scope: !1272, file: !1272, line: 111, type: !1280, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1332, file: !1275, line: 101)
!1332 = !DISubprogram(name: "memset", scope: !1272, file: !1272, line: 84, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1334, file: !1275, line: 102)
!1334 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !1272, file: !1272, line: 95, type: !1335, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DISubroutineType(types: !1336)
!1336 = !{!14, !7}
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1338, file: !1275, line: 103)
!1338 = !DISubprogram(name: "strlen", scope: !1272, file: !1272, line: 96, type: !1339, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DISubroutineType(types: !1340)
!1340 = !{!580, !465}
!1341 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1342, entity: !1343, file: !1345, line: 536)
!1342 = !DINamespace(name: "chrono", scope: !310)
!1343 = !DINamespace(name: "chrono_literals", scope: !1344, exportSymbols: true)
!1344 = !DINamespace(name: "literals", scope: !310, exportSymbols: true)
!1345 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1347, file: !1350, line: 68)
!1347 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1348, line: 31, baseType: !1349)
!1348 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1349 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !365, line: 116, baseType: !370)
!1350 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1352, file: !1350, line: 69)
!1352 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1353, line: 31, baseType: !1354)
!1353 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1354 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !365, line: 119, baseType: !366)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !494, file: !1350, line: 70)
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1357, file: !1350, line: 74)
!1357 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !495, file: !495, line: 112, type: !1358, flags: DIFlagPrototyped, spFlags: 0)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!1347}
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1361, file: !1350, line: 75)
!1361 = !DISubprogram(name: "difftime", scope: !495, file: !495, line: 114, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{!635, !1352, !1352}
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1365, file: !1350, line: 76)
!1365 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !495, file: !495, line: 118, type: !1366, flags: DIFlagPrototyped, spFlags: 0)
!1366 = !DISubroutineType(types: !1367)
!1367 = !{!1352, !1368}
!1368 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !494, size: 64)
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1370, file: !1350, line: 77)
!1370 = !DISubprogram(name: "time", scope: !495, file: !495, line: 121, type: !1371, flags: DIFlagPrototyped, spFlags: 0)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{!1352, !1373}
!1373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1352, size: 64)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1375, file: !1350, line: 78)
!1375 = !DISubprogram(name: "asctime", scope: !495, file: !495, line: 111, type: !1376, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DISubroutineType(types: !1377)
!1377 = !{!14, !729}
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1379, file: !1350, line: 79)
!1379 = !DISubprogram(name: "ctime", scope: !495, file: !495, line: 113, type: !1380, flags: DIFlagPrototyped, spFlags: 0)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!14, !1382}
!1382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1383, size: 64)
!1383 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1352)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1385, file: !1350, line: 80)
!1385 = !DISubprogram(name: "gmtime", scope: !495, file: !495, line: 116, type: !1386, flags: DIFlagPrototyped, spFlags: 0)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!1368, !1382}
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1389, file: !1350, line: 81)
!1389 = !DISubprogram(name: "localtime", scope: !495, file: !495, line: 117, type: !1386, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1391, file: !1350, line: 82)
!1391 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !495, file: !495, line: 119, type: !1392, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DISubroutineType(types: !1393)
!1393 = !{!580, !14, !580, !465, !729}
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !510, file: !1395, line: 120)
!1395 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !540, file: !1395, line: 121)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1398, file: !1395, line: 123)
!1398 = !DISubprogram(name: "fclose", scope: !511, file: !511, line: 233, type: !1399, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DISubroutineType(types: !1400)
!1400 = !{!7, !569}
!1401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1402, file: !1395, line: 124)
!1402 = !DISubprogram(name: "fflush", scope: !511, file: !511, line: 236, type: !1399, flags: DIFlagPrototyped, spFlags: 0)
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1404, file: !1395, line: 125)
!1404 = !DISubprogram(name: "setbuf", scope: !511, file: !511, line: 272, type: !1405, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{null, !569, !14}
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1408, file: !1395, line: 126)
!1408 = !DISubprogram(name: "setvbuf", scope: !511, file: !511, line: 273, type: !1409, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!7, !569, !14, !7, !580}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1412, file: !1395, line: 127)
!1412 = !DISubprogram(name: "fprintf", scope: !511, file: !511, line: 245, type: !1413, flags: DIFlagPrototyped, spFlags: 0)
!1413 = !DISubroutineType(types: !1414)
!1414 = !{!7, !569, !465, null}
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1416, file: !1395, line: 128)
!1416 = !DISubprogram(name: "fscanf", scope: !511, file: !511, line: 251, type: !1413, flags: DIFlagPrototyped, spFlags: 0)
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1418, file: !1395, line: 129)
!1418 = !DISubprogram(name: "snprintf", scope: !511, file: !511, line: 435, type: !1419, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!7, !14, !580, !465, null}
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1422, file: !1395, line: 130)
!1422 = !DISubprogram(name: "sprintf", scope: !511, file: !511, line: 280, type: !1423, flags: DIFlagPrototyped, spFlags: 0)
!1423 = !DISubroutineType(types: !1424)
!1424 = !{!7, !14, !465, null}
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1426, file: !1395, line: 131)
!1426 = !DISubprogram(name: "sscanf", scope: !511, file: !511, line: 282, type: !1427, flags: DIFlagPrototyped, spFlags: 0)
!1427 = !DISubroutineType(types: !1428)
!1428 = !{!7, !465, !465, null}
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1430, file: !1395, line: 132)
!1430 = !DISubprogram(name: "vfprintf", scope: !511, file: !511, line: 292, type: !1431, flags: DIFlagPrototyped, spFlags: 0)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!7, !569, !465, !1433}
!1433 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1434, line: 44, baseType: !587)
!1434 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1436, file: !1395, line: 133)
!1436 = !DISubprogram(name: "vfscanf", scope: !511, file: !511, line: 436, type: !1431, flags: DIFlagPrototyped, spFlags: 0)
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1438, file: !1395, line: 134)
!1438 = !DISubprogram(name: "vsscanf", scope: !511, file: !511, line: 439, type: !1439, flags: DIFlagPrototyped, spFlags: 0)
!1439 = !DISubroutineType(types: !1440)
!1440 = !{!7, !465, !465, !1433}
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1442, file: !1395, line: 135)
!1442 = !DISubprogram(name: "vsnprintf", scope: !511, file: !511, line: 438, type: !1443, flags: DIFlagPrototyped, spFlags: 0)
!1443 = !DISubroutineType(types: !1444)
!1444 = !{!7, !14, !580, !465, !1433}
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1446, file: !1395, line: 136)
!1446 = !DISubprogram(name: "vsprintf", scope: !511, file: !511, line: 300, type: !1447, flags: DIFlagPrototyped, spFlags: 0)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!7, !14, !465, !1433}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1450, file: !1395, line: 137)
!1450 = !DISubprogram(name: "fgetc", scope: !511, file: !511, line: 237, type: !1399, flags: DIFlagPrototyped, spFlags: 0)
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1452, file: !1395, line: 138)
!1452 = !DISubprogram(name: "fgets", scope: !511, file: !511, line: 239, type: !1453, flags: DIFlagPrototyped, spFlags: 0)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!14, !14, !7, !569}
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1456, file: !1395, line: 139)
!1456 = !DISubprogram(name: "fputc", scope: !511, file: !511, line: 246, type: !1457, flags: DIFlagPrototyped, spFlags: 0)
!1457 = !DISubroutineType(types: !1458)
!1458 = !{!7, !7, !569}
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1460, file: !1395, line: 140)
!1460 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !511, file: !511, line: 247, type: !1461, flags: DIFlagPrototyped, spFlags: 0)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{!7, !465, !569}
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1464, file: !1395, line: 141)
!1464 = !DISubprogram(name: "getc", scope: !511, file: !511, line: 256, type: !1399, flags: DIFlagPrototyped, spFlags: 0)
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1466, file: !1395, line: 142)
!1466 = !DISubprogram(name: "putc", scope: !511, file: !511, line: 265, type: !1457, flags: DIFlagPrototyped, spFlags: 0)
!1467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1468, file: !1395, line: 143)
!1468 = !DISubprogram(name: "ungetc", scope: !511, file: !511, line: 291, type: !1457, flags: DIFlagPrototyped, spFlags: 0)
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1470, file: !1395, line: 144)
!1470 = !DISubprogram(name: "fread", scope: !511, file: !511, line: 248, type: !1471, flags: DIFlagPrototyped, spFlags: 0)
!1471 = !DISubroutineType(types: !1472)
!1472 = !{!580, !527, !580, !580, !569}
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1474, file: !1395, line: 145)
!1474 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !511, file: !511, line: 255, type: !1475, flags: DIFlagPrototyped, spFlags: 0)
!1475 = !DISubroutineType(types: !1476)
!1476 = !{!580, !902, !580, !580, !569}
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1478, file: !1395, line: 146)
!1478 = !DISubprogram(name: "fgetpos", scope: !511, file: !511, line: 238, type: !1479, flags: DIFlagPrototyped, spFlags: 0)
!1479 = !DISubroutineType(types: !1480)
!1480 = !{!7, !569, !1481}
!1481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !540, size: 64)
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1483, file: !1395, line: 147)
!1483 = !DISubprogram(name: "fseek", scope: !511, file: !511, line: 252, type: !1484, flags: DIFlagPrototyped, spFlags: 0)
!1484 = !DISubroutineType(types: !1485)
!1485 = !{!7, !569, !366, !7}
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1487, file: !1395, line: 148)
!1487 = !DISubprogram(name: "fsetpos", scope: !511, file: !511, line: 253, type: !1488, flags: DIFlagPrototyped, spFlags: 0)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!7, !569, !1490}
!1490 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1491, size: 64)
!1491 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !540)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1493, file: !1395, line: 149)
!1493 = !DISubprogram(name: "ftell", scope: !511, file: !511, line: 254, type: !1494, flags: DIFlagPrototyped, spFlags: 0)
!1494 = !DISubroutineType(types: !1495)
!1495 = !{!366, !569}
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1497, file: !1395, line: 150)
!1497 = !DISubprogram(name: "rewind", scope: !511, file: !511, line: 270, type: !1498, flags: DIFlagPrototyped, spFlags: 0)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{null, !569}
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1501, file: !1395, line: 151)
!1501 = !DISubprogram(name: "clearerr", scope: !511, file: !511, line: 232, type: !1498, flags: DIFlagPrototyped, spFlags: 0)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1503, file: !1395, line: 152)
!1503 = !DISubprogram(name: "feof", scope: !511, file: !511, line: 234, type: !1399, flags: DIFlagPrototyped, spFlags: 0)
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1505, file: !1395, line: 153)
!1505 = !DISubprogram(name: "ferror", scope: !511, file: !511, line: 235, type: !1399, flags: DIFlagPrototyped, spFlags: 0)
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1507, file: !1395, line: 154)
!1507 = !DISubprogram(name: "perror", scope: !511, file: !511, line: 264, type: !1508, flags: DIFlagPrototyped, spFlags: 0)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{null, !465}
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1511, file: !1395, line: 156)
!1511 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !511, file: !511, line: 243, type: !1512, flags: DIFlagPrototyped, spFlags: 0)
!1512 = !DISubroutineType(types: !1513)
!1513 = !{!569, !465, !465}
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1515, file: !1395, line: 157)
!1515 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !511, file: !511, line: 249, type: !1516, flags: DIFlagPrototyped, spFlags: 0)
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!569, !465, !465, !569}
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1519, file: !1395, line: 158)
!1519 = !DISubprogram(name: "remove", scope: !511, file: !511, line: 268, type: !812, flags: DIFlagPrototyped, spFlags: 0)
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1521, file: !1395, line: 159)
!1521 = !DISubprogram(name: "rename", scope: !511, file: !511, line: 269, type: !1296, flags: DIFlagPrototyped, spFlags: 0)
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1523, file: !1395, line: 160)
!1523 = !DISubprogram(name: "tmpfile", scope: !511, file: !511, line: 283, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!569}
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1527, file: !1395, line: 161)
!1527 = !DISubprogram(name: "tmpnam", scope: !511, file: !511, line: 289, type: !1528, flags: DIFlagPrototyped, spFlags: 0)
!1528 = !DISubroutineType(types: !1529)
!1529 = !{!14, !14}
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1531, file: !1395, line: 163)
!1531 = !DISubprogram(name: "getchar", scope: !511, file: !511, line: 257, type: !853, flags: DIFlagPrototyped, spFlags: 0)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1533, file: !1395, line: 167)
!1533 = !DISubprogram(name: "scanf", scope: !511, file: !511, line: 271, type: !1534, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DISubroutineType(types: !1535)
!1535 = !{!7, !465, null}
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1537, file: !1395, line: 168)
!1537 = !DISubprogram(name: "vscanf", scope: !511, file: !511, line: 437, type: !1538, flags: DIFlagPrototyped, spFlags: 0)
!1538 = !DISubroutineType(types: !1539)
!1539 = !{!7, !465, !1433}
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1541, file: !1395, line: 170)
!1541 = !DISubprogram(name: "printf", scope: !1542, file: !1542, line: 34, type: !1534, flags: DIFlagPrototyped, spFlags: 0)
!1542 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1544, file: !1395, line: 171)
!1544 = !DISubprogram(name: "putchar", scope: !511, file: !511, line: 266, type: !385, flags: DIFlagPrototyped, spFlags: 0)
!1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1546, file: !1395, line: 172)
!1546 = !DISubprogram(name: "puts", scope: !511, file: !511, line: 267, type: !812, flags: DIFlagPrototyped, spFlags: 0)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1548, file: !1395, line: 173)
!1548 = !DISubprogram(name: "vprintf", scope: !511, file: !511, line: 293, type: !1538, flags: DIFlagPrototyped, spFlags: 0)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1550, file: !1577, line: 52)
!1550 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1551, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1552, identifier: "_ZTS5lconv")
!1551 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1552 = !{!1553, !1554, !1555, !1556, !1557, !1558, !1559, !1560, !1561, !1562, !1563, !1564, !1565, !1566, !1567, !1568, !1569, !1570, !1571, !1572, !1573, !1574, !1575, !1576}
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1550, file: !1551, line: 47, baseType: !14, size: 64)
!1554 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1550, file: !1551, line: 48, baseType: !14, size: 64, offset: 64)
!1555 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1550, file: !1551, line: 49, baseType: !14, size: 64, offset: 128)
!1556 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1550, file: !1551, line: 50, baseType: !14, size: 64, offset: 192)
!1557 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1550, file: !1551, line: 51, baseType: !14, size: 64, offset: 256)
!1558 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1550, file: !1551, line: 52, baseType: !14, size: 64, offset: 320)
!1559 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1550, file: !1551, line: 53, baseType: !14, size: 64, offset: 384)
!1560 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1550, file: !1551, line: 54, baseType: !14, size: 64, offset: 448)
!1561 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1550, file: !1551, line: 55, baseType: !14, size: 64, offset: 512)
!1562 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1550, file: !1551, line: 56, baseType: !14, size: 64, offset: 576)
!1563 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1550, file: !1551, line: 57, baseType: !15, size: 8, offset: 640)
!1564 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1550, file: !1551, line: 58, baseType: !15, size: 8, offset: 648)
!1565 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1550, file: !1551, line: 59, baseType: !15, size: 8, offset: 656)
!1566 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1550, file: !1551, line: 60, baseType: !15, size: 8, offset: 664)
!1567 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1550, file: !1551, line: 61, baseType: !15, size: 8, offset: 672)
!1568 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1550, file: !1551, line: 62, baseType: !15, size: 8, offset: 680)
!1569 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1550, file: !1551, line: 63, baseType: !15, size: 8, offset: 688)
!1570 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1550, file: !1551, line: 64, baseType: !15, size: 8, offset: 696)
!1571 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1550, file: !1551, line: 65, baseType: !15, size: 8, offset: 704)
!1572 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1550, file: !1551, line: 66, baseType: !15, size: 8, offset: 712)
!1573 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1550, file: !1551, line: 67, baseType: !15, size: 8, offset: 720)
!1574 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1550, file: !1551, line: 68, baseType: !15, size: 8, offset: 728)
!1575 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1550, file: !1551, line: 69, baseType: !15, size: 8, offset: 736)
!1576 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1550, file: !1551, line: 70, baseType: !15, size: 8, offset: 744)
!1577 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1579, file: !1577, line: 53)
!1579 = !DISubprogram(name: "setlocale", scope: !1580, file: !1580, line: 56, type: !1581, flags: DIFlagPrototyped, spFlags: 0)
!1580 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1581 = !DISubroutineType(types: !1582)
!1582 = !{!14, !7, !465}
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1584, file: !1577, line: 54)
!1584 = !DISubprogram(name: "localeconv", scope: !1551, file: !1551, line: 99, type: !1585, flags: DIFlagPrototyped, spFlags: 0)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!1587}
!1587 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1550, size: 64)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !310, entity: !1589, file: !1591, line: 53)
!1589 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1590, line: 12, baseType: !588)
!1590 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stdarg_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "7bd78a282b99fcfe41a9e3c566d14f7d")
!1591 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1592 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1593 = !{i32 7, !"Dwarf Version", i32 5}
!1594 = !{i32 2, !"Debug Info Version", i32 3}
!1595 = !{i32 1, !"wchar_size", i32 4}
!1596 = !{i32 8, !"PIC Level", i32 2}
!1597 = !{i32 7, !"uwtable", i32 1}
!1598 = !{i32 7, !"frame-pointer", i32 1}
!1599 = !{!"Homebrew clang version 20.1.8"}
!1600 = distinct !DISubprogram(name: "player_has_weapon", linkageName: "_Z17player_has_weaponii", scope: !22, file: !22, line: 171, type: !1601, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!1601 = !DISubroutineType(types: !1602)
!1602 = !{!7, !7, !7}
!1603 = !{}
!1604 = !DILocalVariable(name: "weapon_num", arg: 1, scope: !1600, file: !22, line: 171, type: !7)
!1605 = !DILocation(line: 171, column: 27, scope: !1600)
!1606 = !DILocalVariable(name: "secondary_flag", arg: 2, scope: !1600, file: !22, line: 171, type: !7)
!1607 = !DILocation(line: 171, column: 43, scope: !1600)
!1608 = !DILocation(line: 175, column: 14, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1600, file: !22, line: 175, column: 6)
!1610 = !DILocation(line: 175, column: 6, scope: !1609)
!1611 = !DILocation(line: 175, column: 26, scope: !1609)
!1612 = !DILocation(line: 175, column: 33, scope: !1609)
!1613 = !DILocation(line: 176, column: 11, scope: !1609)
!1614 = !DILocation(line: 176, column: 3, scope: !1609)
!1615 = !DILocation(line: 176, column: 23, scope: !1609)
!1616 = !DILocation(line: 176, column: 30, scope: !1609)
!1617 = !DILocalVariable(name: "return_value", scope: !1618, file: !22, line: 205, type: !7)
!1618 = distinct !DILexicalBlock(scope: !1600, file: !22, line: 204, column: 2)
!1619 = !DILocation(line: 205, column: 7, scope: !1618)
!1620 = !DILocalVariable(name: "weapon_index", scope: !1618, file: !22, line: 206, type: !7)
!1621 = !DILocation(line: 206, column: 7, scope: !1618)
!1622 = !DILocation(line: 208, column: 8, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1618, file: !22, line: 208, column: 7)
!1624 = !DILocation(line: 208, column: 7, scope: !1623)
!1625 = !DILocation(line: 209, column: 49, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1623, file: !22, line: 208, column: 24)
!1627 = !DILocation(line: 209, column: 19, scope: !1626)
!1628 = !DILocation(line: 209, column: 17, scope: !1626)
!1629 = !DILocation(line: 211, column: 16, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1626, file: !22, line: 211, column: 8)
!1631 = !DILocation(line: 211, column: 8, scope: !1630)
!1632 = !DILocation(line: 211, column: 28, scope: !1630)
!1633 = !DILocation(line: 211, column: 57, scope: !1630)
!1634 = !DILocation(line: 211, column: 54, scope: !1630)
!1635 = !DILocation(line: 211, column: 49, scope: !1630)
!1636 = !DILocation(line: 212, column: 18, scope: !1630)
!1637 = !DILocation(line: 212, column: 5, scope: !1630)
!1638 = !DILocation(line: 215, column: 8, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1626, file: !22, line: 215, column: 8)
!1640 = !DILocation(line: 215, column: 19, scope: !1639)
!1641 = !DILocation(line: 216, column: 21, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1643, file: !22, line: 216, column: 9)
!1643 = distinct !DILexicalBlock(scope: !1639, file: !22, line: 215, column: 35)
!1644 = !DILocation(line: 216, column: 9, scope: !1642)
!1645 = !DILocation(line: 216, column: 35, scope: !1642)
!1646 = !DILocation(line: 216, column: 57, scope: !1642)
!1647 = !DILocation(line: 216, column: 49, scope: !1642)
!1648 = !DILocation(line: 216, column: 69, scope: !1642)
!1649 = !DILocation(line: 216, column: 46, scope: !1642)
!1650 = !DILocation(line: 217, column: 19, scope: !1642)
!1651 = !DILocation(line: 217, column: 6, scope: !1642)
!1652 = !DILocation(line: 218, column: 4, scope: !1643)
!1653 = !DILocation(line: 220, column: 21, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1639, file: !22, line: 220, column: 9)
!1655 = !DILocation(line: 220, column: 9, scope: !1654)
!1656 = !DILocation(line: 220, column: 35, scope: !1654)
!1657 = !DILocation(line: 220, column: 57, scope: !1654)
!1658 = !DILocation(line: 220, column: 49, scope: !1654)
!1659 = !DILocation(line: 220, column: 69, scope: !1654)
!1660 = !DILocation(line: 220, column: 82, scope: !1654)
!1661 = !DILocation(line: 220, column: 46, scope: !1654)
!1662 = !DILocation(line: 221, column: 19, scope: !1654)
!1663 = !DILocation(line: 221, column: 6, scope: !1654)
!1664 = !DILocation(line: 223, column: 8, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1626, file: !22, line: 223, column: 8)
!1666 = !DILocation(line: 223, column: 19, scope: !1665)
!1667 = !DILocation(line: 224, column: 17, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1669, file: !22, line: 224, column: 9)
!1669 = distinct !DILexicalBlock(scope: !1665, file: !22, line: 223, column: 35)
!1670 = !DILocation(line: 224, column: 9, scope: !1668)
!1671 = !DILocation(line: 224, column: 29, scope: !1668)
!1672 = !DILocation(line: 224, column: 36, scope: !1668)
!1673 = !DILocation(line: 224, column: 39, scope: !1668)
!1674 = !DILocation(line: 225, column: 19, scope: !1668)
!1675 = !DILocation(line: 225, column: 6, scope: !1668)
!1676 = !DILocation(line: 226, column: 4, scope: !1669)
!1677 = !DILocation(line: 228, column: 21, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1665, file: !22, line: 228, column: 9)
!1679 = !DILocation(line: 228, column: 9, scope: !1678)
!1680 = !DILocation(line: 228, column: 35, scope: !1678)
!1681 = !DILocation(line: 228, column: 59, scope: !1678)
!1682 = !DILocation(line: 228, column: 51, scope: !1678)
!1683 = !DILocation(line: 228, column: 71, scope: !1678)
!1684 = !DILocation(line: 228, column: 48, scope: !1678)
!1685 = !DILocation(line: 229, column: 19, scope: !1678)
!1686 = !DILocation(line: 229, column: 6, scope: !1678)
!1687 = !DILocation(line: 231, column: 3, scope: !1626)
!1688 = !DILocation(line: 233, column: 51, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1623, file: !22, line: 232, column: 8)
!1690 = !DILocation(line: 233, column: 19, scope: !1689)
!1691 = !DILocation(line: 233, column: 17, scope: !1689)
!1692 = !DILocation(line: 235, column: 16, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1689, file: !22, line: 235, column: 8)
!1694 = !DILocation(line: 235, column: 8, scope: !1693)
!1695 = !DILocation(line: 235, column: 28, scope: !1693)
!1696 = !DILocation(line: 235, column: 59, scope: !1693)
!1697 = !DILocation(line: 235, column: 56, scope: !1693)
!1698 = !DILocation(line: 235, column: 51, scope: !1693)
!1699 = !DILocation(line: 236, column: 18, scope: !1693)
!1700 = !DILocation(line: 236, column: 5, scope: !1693)
!1701 = !DILocation(line: 238, column: 20, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1689, file: !22, line: 238, column: 8)
!1703 = !DILocation(line: 238, column: 8, scope: !1702)
!1704 = !DILocation(line: 238, column: 34, scope: !1702)
!1705 = !DILocation(line: 238, column: 56, scope: !1702)
!1706 = !DILocation(line: 238, column: 48, scope: !1702)
!1707 = !DILocation(line: 238, column: 68, scope: !1702)
!1708 = !DILocation(line: 238, column: 83, scope: !1702)
!1709 = !DILocation(line: 238, column: 45, scope: !1702)
!1710 = !DILocation(line: 239, column: 18, scope: !1702)
!1711 = !DILocation(line: 239, column: 5, scope: !1702)
!1712 = !DILocation(line: 241, column: 20, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1689, file: !22, line: 241, column: 8)
!1714 = !DILocation(line: 241, column: 8, scope: !1713)
!1715 = !DILocation(line: 241, column: 34, scope: !1713)
!1716 = !DILocation(line: 241, column: 58, scope: !1713)
!1717 = !DILocation(line: 241, column: 50, scope: !1713)
!1718 = !DILocation(line: 241, column: 70, scope: !1713)
!1719 = !DILocation(line: 241, column: 47, scope: !1713)
!1720 = !DILocation(line: 242, column: 18, scope: !1713)
!1721 = !DILocation(line: 242, column: 5, scope: !1713)
!1722 = !DILocation(line: 245, column: 10, scope: !1618)
!1723 = !DILocation(line: 245, column: 3, scope: !1618)
!1724 = distinct !DISubprogram(name: "InitWeaponOrdering", linkageName: "_Z18InitWeaponOrderingv", scope: !22, file: !22, line: 250, type: !879, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!1725 = !DILocalVariable(name: "i", scope: !1724, file: !22, line: 254, type: !7)
!1726 = !DILocation(line: 254, column: 6, scope: !1724)
!1727 = !DILocation(line: 256, column: 9, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1724, file: !22, line: 256, column: 2)
!1729 = !DILocation(line: 256, column: 7, scope: !1728)
!1730 = !DILocation(line: 256, column: 14, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1728, file: !22, line: 256, column: 2)
!1732 = !DILocation(line: 256, column: 16, scope: !1731)
!1733 = !DILocation(line: 256, column: 2, scope: !1728)
!1734 = !DILocation(line: 257, column: 41, scope: !1731)
!1735 = !DILocation(line: 257, column: 21, scope: !1731)
!1736 = !DILocation(line: 257, column: 16, scope: !1731)
!1737 = !DILocation(line: 257, column: 3, scope: !1731)
!1738 = !DILocation(line: 257, column: 19, scope: !1731)
!1739 = !DILocation(line: 256, column: 44, scope: !1731)
!1740 = !DILocation(line: 256, column: 2, scope: !1731)
!1741 = distinct !{!1741, !1733, !1742, !1743}
!1742 = !DILocation(line: 257, column: 42, scope: !1728)
!1743 = !{!"llvm.loop.mustprogress"}
!1744 = !DILocation(line: 258, column: 9, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1724, file: !22, line: 258, column: 2)
!1746 = !DILocation(line: 258, column: 7, scope: !1745)
!1747 = !DILocation(line: 258, column: 14, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1745, file: !22, line: 258, column: 2)
!1749 = !DILocation(line: 258, column: 16, scope: !1748)
!1750 = !DILocation(line: 258, column: 2, scope: !1745)
!1751 = !DILocation(line: 259, column: 45, scope: !1748)
!1752 = !DILocation(line: 259, column: 23, scope: !1748)
!1753 = !DILocation(line: 259, column: 18, scope: !1748)
!1754 = !DILocation(line: 259, column: 3, scope: !1748)
!1755 = !DILocation(line: 259, column: 21, scope: !1748)
!1756 = !DILocation(line: 258, column: 46, scope: !1748)
!1757 = !DILocation(line: 258, column: 2, scope: !1748)
!1758 = distinct !{!1758, !1750, !1759, !1743}
!1759 = !DILocation(line: 259, column: 46, scope: !1745)
!1760 = !DILocation(line: 260, column: 1, scope: !1724)
!1761 = distinct !DISubprogram(name: "CyclePrimary", linkageName: "_Z12CyclePrimaryv", scope: !22, file: !22, line: 262, type: !879, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!1762 = !DILocation(line: 264, column: 2, scope: !1761)
!1763 = !DILocation(line: 265, column: 10, scope: !1761)
!1764 = !DILocation(line: 266, column: 2, scope: !1761)
!1765 = !DILocation(line: 267, column: 10, scope: !1761)
!1766 = !DILocation(line: 268, column: 1, scope: !1761)
!1767 = distinct !DISubprogram(name: "auto_select_weapon", linkageName: "_Z18auto_select_weaponi", scope: !22, file: !22, line: 443, type: !888, scopeLine: 444, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!1768 = !DILocalVariable(name: "weapon_type", arg: 1, scope: !1767, file: !22, line: 443, type: !7)
!1769 = !DILocation(line: 443, column: 29, scope: !1767)
!1770 = !DILocalVariable(name: "r", scope: !1767, file: !22, line: 445, type: !7)
!1771 = !DILocation(line: 445, column: 6, scope: !1767)
!1772 = !DILocalVariable(name: "cutpoint", scope: !1767, file: !22, line: 446, type: !7)
!1773 = !DILocation(line: 446, column: 6, scope: !1767)
!1774 = !DILocalVariable(name: "looped", scope: !1767, file: !22, line: 447, type: !7)
!1775 = !DILocation(line: 447, column: 6, scope: !1767)
!1776 = !DILocation(line: 449, column: 6, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1767, file: !22, line: 449, column: 6)
!1778 = !DILocation(line: 449, column: 18, scope: !1777)
!1779 = !DILocation(line: 451, column: 25, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1777, file: !22, line: 450, column: 2)
!1781 = !DILocation(line: 451, column: 7, scope: !1780)
!1782 = !DILocation(line: 451, column: 5, scope: !1780)
!1783 = !DILocation(line: 452, column: 7, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1780, file: !22, line: 452, column: 7)
!1785 = !DILocation(line: 452, column: 9, scope: !1784)
!1786 = !DILocation(line: 452, column: 20, scope: !1784)
!1787 = !DILocation(line: 452, column: 23, scope: !1784)
!1788 = !DILocalVariable(name: "cur_weapon", scope: !1789, file: !22, line: 454, type: !7)
!1789 = distinct !DILexicalBlock(scope: !1784, file: !22, line: 453, column: 3)
!1790 = !DILocation(line: 454, column: 8, scope: !1789)
!1791 = !DILocalVariable(name: "try_again", scope: !1789, file: !22, line: 455, type: !7)
!1792 = !DILocation(line: 455, column: 8, scope: !1789)
!1793 = !DILocation(line: 457, column: 28, scope: !1789)
!1794 = !DILocation(line: 457, column: 17, scope: !1789)
!1795 = !DILocation(line: 457, column: 15, scope: !1789)
!1796 = !DILocation(line: 458, column: 15, scope: !1789)
!1797 = !DILocation(line: 458, column: 13, scope: !1789)
!1798 = !DILocation(line: 460, column: 4, scope: !1789)
!1799 = !DILocation(line: 460, column: 11, scope: !1789)
!1800 = !DILocation(line: 462, column: 15, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1789, file: !22, line: 461, column: 4)
!1802 = !DILocation(line: 464, column: 9, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1801, file: !22, line: 464, column: 9)
!1804 = !DILocation(line: 464, column: 23, scope: !1803)
!1805 = !DILocation(line: 464, column: 20, scope: !1803)
!1806 = !DILocation(line: 466, column: 10, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1808, file: !22, line: 466, column: 10)
!1808 = distinct !DILexicalBlock(scope: !1803, file: !22, line: 465, column: 5)
!1809 = !DILocation(line: 468, column: 12, scope: !1810)
!1810 = distinct !DILexicalBlock(scope: !1811, file: !22, line: 468, column: 11)
!1811 = distinct !DILexicalBlock(scope: !1807, file: !22, line: 467, column: 6)
!1812 = !DILocation(line: 468, column: 11, scope: !1810)
!1813 = !DILocation(line: 470, column: 25, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1810, file: !22, line: 469, column: 7)
!1815 = !DILocation(line: 470, column: 8, scope: !1814)
!1816 = !DILocation(line: 475, column: 8, scope: !1814)
!1817 = !DILocation(line: 476, column: 7, scope: !1814)
!1818 = !DILocation(line: 478, column: 22, scope: !1810)
!1819 = !DILocation(line: 478, column: 8, scope: !1810)
!1820 = !DILocation(line: 480, column: 17, scope: !1811)
!1821 = !DILocation(line: 481, column: 7, scope: !1811)
!1822 = distinct !{!1822, !1798, !1823, !1743}
!1823 = !DILocation(line: 519, column: 4, scope: !1789)
!1824 = !DILocation(line: 483, column: 17, scope: !1808)
!1825 = !DILocation(line: 484, column: 13, scope: !1808)
!1826 = !DILocation(line: 485, column: 5, scope: !1808)
!1827 = !DILocation(line: 488, column: 9, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1801, file: !22, line: 488, column: 9)
!1829 = !DILocation(line: 488, column: 20, scope: !1828)
!1830 = !DILocation(line: 489, column: 17, scope: !1828)
!1831 = !DILocation(line: 489, column: 6, scope: !1828)
!1832 = !DILocation(line: 496, column: 22, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1801, file: !22, line: 496, column: 9)
!1834 = !DILocation(line: 496, column: 9, scope: !1833)
!1835 = !DILocation(line: 496, column: 37, scope: !1833)
!1836 = !DILocation(line: 496, column: 34, scope: !1833)
!1837 = !DILocation(line: 498, column: 11, scope: !1838)
!1838 = distinct !DILexicalBlock(scope: !1839, file: !22, line: 498, column: 10)
!1839 = distinct !DILexicalBlock(scope: !1833, file: !22, line: 497, column: 5)
!1840 = !DILocation(line: 498, column: 10, scope: !1838)
!1841 = !DILocation(line: 500, column: 24, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1838, file: !22, line: 499, column: 6)
!1843 = !DILocation(line: 500, column: 7, scope: !1842)
!1844 = !DILocation(line: 507, column: 7, scope: !1842)
!1845 = !DILocation(line: 508, column: 6, scope: !1842)
!1846 = !DILocation(line: 510, column: 21, scope: !1838)
!1847 = !DILocation(line: 510, column: 7, scope: !1838)
!1848 = !DILocation(line: 512, column: 16, scope: !1839)
!1849 = !DILocation(line: 514, column: 5, scope: !1839)
!1850 = !DILocation(line: 515, column: 27, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1833, file: !22, line: 515, column: 14)
!1852 = !DILocation(line: 515, column: 14, scope: !1851)
!1853 = !DILocation(line: 515, column: 39, scope: !1851)
!1854 = !DILocation(line: 515, column: 46, scope: !1851)
!1855 = !DILocation(line: 515, column: 80, scope: !1851)
!1856 = !DILocation(line: 515, column: 67, scope: !1851)
!1857 = !DILocation(line: 515, column: 49, scope: !1851)
!1858 = !DILocation(line: 515, column: 96, scope: !1851)
!1859 = !DILocation(line: 516, column: 33, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1851, file: !22, line: 515, column: 108)
!1861 = !DILocation(line: 516, column: 20, scope: !1860)
!1862 = !DILocation(line: 516, column: 6, scope: !1860)
!1863 = !DILocation(line: 517, column: 16, scope: !1860)
!1864 = !DILocation(line: 518, column: 5, scope: !1860)
!1865 = !DILocation(line: 520, column: 3, scope: !1789)
!1866 = !DILocation(line: 522, column: 2, scope: !1780)
!1867 = !DILocation(line: 525, column: 3, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1777, file: !22, line: 524, column: 2)
!1869 = !DILocation(line: 526, column: 25, scope: !1868)
!1870 = !DILocation(line: 526, column: 7, scope: !1868)
!1871 = !DILocation(line: 526, column: 5, scope: !1868)
!1872 = !DILocation(line: 527, column: 7, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1868, file: !22, line: 527, column: 7)
!1874 = !DILocation(line: 527, column: 9, scope: !1873)
!1875 = !DILocation(line: 527, column: 20, scope: !1873)
!1876 = !DILocation(line: 527, column: 23, scope: !1873)
!1877 = !DILocalVariable(name: "cur_weapon", scope: !1878, file: !22, line: 529, type: !7)
!1878 = distinct !DILexicalBlock(scope: !1873, file: !22, line: 528, column: 3)
!1879 = !DILocation(line: 529, column: 8, scope: !1878)
!1880 = !DILocalVariable(name: "try_again", scope: !1878, file: !22, line: 530, type: !7)
!1881 = !DILocation(line: 530, column: 8, scope: !1878)
!1882 = !DILocation(line: 532, column: 28, scope: !1878)
!1883 = !DILocation(line: 532, column: 17, scope: !1878)
!1884 = !DILocation(line: 532, column: 15, scope: !1878)
!1885 = !DILocation(line: 533, column: 15, scope: !1878)
!1886 = !DILocation(line: 533, column: 13, scope: !1878)
!1887 = !DILocation(line: 535, column: 4, scope: !1878)
!1888 = !DILocation(line: 535, column: 11, scope: !1878)
!1889 = !DILocation(line: 537, column: 15, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1878, file: !22, line: 536, column: 4)
!1891 = !DILocation(line: 539, column: 9, scope: !1892)
!1892 = distinct !DILexicalBlock(scope: !1890, file: !22, line: 539, column: 9)
!1893 = !DILocation(line: 539, column: 23, scope: !1892)
!1894 = !DILocation(line: 539, column: 20, scope: !1892)
!1895 = !DILocation(line: 541, column: 10, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1897, file: !22, line: 541, column: 10)
!1897 = distinct !DILexicalBlock(scope: !1892, file: !22, line: 540, column: 5)
!1898 = !DILocation(line: 543, column: 12, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1900, file: !22, line: 543, column: 11)
!1900 = distinct !DILexicalBlock(scope: !1896, file: !22, line: 542, column: 6)
!1901 = !DILocation(line: 543, column: 11, scope: !1899)
!1902 = !DILocation(line: 544, column: 8, scope: !1899)
!1903 = !DILocation(line: 546, column: 22, scope: !1899)
!1904 = !DILocation(line: 546, column: 8, scope: !1899)
!1905 = !DILocation(line: 547, column: 17, scope: !1900)
!1906 = !DILocation(line: 548, column: 7, scope: !1900)
!1907 = distinct !{!1907, !1887, !1908, !1743}
!1908 = !DILocation(line: 570, column: 4, scope: !1878)
!1909 = !DILocation(line: 550, column: 17, scope: !1897)
!1910 = !DILocation(line: 551, column: 13, scope: !1897)
!1911 = !DILocation(line: 552, column: 5, scope: !1897)
!1912 = !DILocation(line: 554, column: 9, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1890, file: !22, line: 554, column: 9)
!1914 = !DILocation(line: 554, column: 20, scope: !1913)
!1915 = !DILocation(line: 555, column: 17, scope: !1913)
!1916 = !DILocation(line: 555, column: 6, scope: !1913)
!1917 = !DILocation(line: 557, column: 24, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1890, file: !22, line: 557, column: 9)
!1919 = !DILocation(line: 557, column: 9, scope: !1918)
!1920 = !DILocation(line: 557, column: 39, scope: !1918)
!1921 = !DILocation(line: 557, column: 36, scope: !1918)
!1922 = !DILocation(line: 559, column: 11, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1924, file: !22, line: 559, column: 10)
!1924 = distinct !DILexicalBlock(scope: !1918, file: !22, line: 558, column: 5)
!1925 = !DILocation(line: 559, column: 10, scope: !1923)
!1926 = !DILocation(line: 560, column: 7, scope: !1923)
!1927 = !DILocation(line: 562, column: 21, scope: !1923)
!1928 = !DILocation(line: 562, column: 7, scope: !1923)
!1929 = !DILocation(line: 564, column: 16, scope: !1924)
!1930 = !DILocation(line: 565, column: 5, scope: !1924)
!1931 = !DILocation(line: 566, column: 47, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1918, file: !22, line: 566, column: 14)
!1933 = !DILocation(line: 566, column: 32, scope: !1932)
!1934 = !DILocation(line: 566, column: 14, scope: !1932)
!1935 = !DILocation(line: 566, column: 63, scope: !1932)
!1936 = !DILocation(line: 567, column: 35, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1932, file: !22, line: 566, column: 75)
!1938 = !DILocation(line: 567, column: 20, scope: !1937)
!1939 = !DILocation(line: 567, column: 6, scope: !1937)
!1940 = !DILocation(line: 568, column: 16, scope: !1937)
!1941 = !DILocation(line: 569, column: 5, scope: !1937)
!1942 = !DILocation(line: 571, column: 3, scope: !1878)
!1943 = !DILocation(line: 573, column: 1, scope: !1767)
!1944 = distinct !DISubprogram(name: "CycleSecondary", linkageName: "_Z14CycleSecondaryv", scope: !22, file: !22, line: 270, type: !879, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!1945 = !DILocation(line: 272, column: 2, scope: !1944)
!1946 = !DILocation(line: 273, column: 10, scope: !1944)
!1947 = !DILocation(line: 274, column: 2, scope: !1944)
!1948 = !DILocation(line: 275, column: 10, scope: !1944)
!1949 = !DILocation(line: 276, column: 1, scope: !1944)
!1950 = distinct !DISubprogram(name: "select_weapon", linkageName: "_Z13select_weaponiiii", scope: !22, file: !22, line: 281, type: !1951, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!1951 = !DISubroutineType(types: !1952)
!1952 = !{null, !7, !7, !7, !7}
!1953 = !DILocalVariable(name: "weapon_num", arg: 1, scope: !1950, file: !22, line: 281, type: !7)
!1954 = !DILocation(line: 281, column: 24, scope: !1950)
!1955 = !DILocalVariable(name: "secondary_flag", arg: 2, scope: !1950, file: !22, line: 281, type: !7)
!1956 = !DILocation(line: 281, column: 40, scope: !1950)
!1957 = !DILocalVariable(name: "print_message", arg: 3, scope: !1950, file: !22, line: 281, type: !7)
!1958 = !DILocation(line: 281, column: 60, scope: !1950)
!1959 = !DILocalVariable(name: "wait_for_rearm", arg: 4, scope: !1950, file: !22, line: 281, type: !7)
!1960 = !DILocation(line: 281, column: 79, scope: !1950)
!1961 = !DILocalVariable(name: "weapon_name", scope: !1950, file: !22, line: 283, type: !14)
!1962 = !DILocation(line: 283, column: 8, scope: !1950)
!1963 = !DILocation(line: 285, column: 6, scope: !1964)
!1964 = distinct !DILexicalBlock(scope: !1950, file: !22, line: 285, column: 6)
!1965 = !DILocation(line: 285, column: 20, scope: !1964)
!1966 = !DILocation(line: 286, column: 32, scope: !1964)
!1967 = !DILocation(line: 286, column: 48, scope: !1964)
!1968 = !DILocation(line: 286, column: 3, scope: !1964)
!1969 = !DILocation(line: 288, column: 7, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1950, file: !22, line: 288, column: 6)
!1971 = !DILocation(line: 288, column: 6, scope: !1970)
!1972 = !DILocation(line: 290, column: 7, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1974, file: !22, line: 290, column: 7)
!1974 = distinct !DILexicalBlock(scope: !1970, file: !22, line: 289, column: 2)
!1975 = !DILocation(line: 290, column: 25, scope: !1973)
!1976 = !DILocation(line: 290, column: 22, scope: !1973)
!1977 = !DILocation(line: 292, column: 8, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1979, file: !22, line: 292, column: 8)
!1979 = distinct !DILexicalBlock(scope: !1973, file: !22, line: 291, column: 3)
!1980 = !DILocation(line: 292, column: 24, scope: !1978)
!1981 = !DILocation(line: 299, column: 8, scope: !1982)
!1982 = distinct !DILexicalBlock(scope: !1979, file: !22, line: 299, column: 8)
!1983 = !DILocation(line: 300, column: 28, scope: !1982)
!1984 = !DILocation(line: 300, column: 37, scope: !1982)
!1985 = !DILocation(line: 300, column: 26, scope: !1982)
!1986 = !DILocation(line: 300, column: 5, scope: !1982)
!1987 = !DILocation(line: 302, column: 26, scope: !1982)
!1988 = !DILocation(line: 303, column: 30, scope: !1979)
!1989 = !DILocation(line: 304, column: 3, scope: !1979)
!1990 = !DILocation(line: 308, column: 8, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1992, file: !22, line: 308, column: 8)
!1992 = distinct !DILexicalBlock(scope: !1973, file: !22, line: 306, column: 3)
!1993 = !DILocation(line: 309, column: 10, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1991, file: !22, line: 309, column: 9)
!1995 = !DILocation(line: 309, column: 9, scope: !1994)
!1996 = !DILocation(line: 312, column: 6, scope: !1994)
!1997 = !DILocation(line: 314, column: 20, scope: !1974)
!1998 = !DILocation(line: 314, column: 18, scope: !1974)
!1999 = !DILocation(line: 315, column: 17, scope: !1974)
!2000 = !DILocation(line: 315, column: 15, scope: !1974)
!2001 = !DILocation(line: 322, column: 56, scope: !1974)
!2002 = !DILocation(line: 322, column: 67, scope: !1974)
!2003 = !DILocation(line: 322, column: 55, scope: !1974)
!2004 = !DILocation(line: 322, column: 26, scope: !1974)
!2005 = !DILocation(line: 322, column: 37, scope: !1974)
!2006 = !DILocation(line: 322, column: 3, scope: !1974)
!2007 = !DILocation(line: 322, column: 53, scope: !1974)
!2008 = !DILocation(line: 324, column: 2, scope: !1974)
!2009 = !DILocation(line: 327, column: 7, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !2011, file: !22, line: 327, column: 7)
!2011 = distinct !DILexicalBlock(scope: !1970, file: !22, line: 325, column: 7)
!2012 = !DILocation(line: 327, column: 27, scope: !2010)
!2013 = !DILocation(line: 327, column: 24, scope: !2010)
!2014 = !DILocation(line: 329, column: 8, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !2016, file: !22, line: 329, column: 8)
!2016 = distinct !DILexicalBlock(scope: !2010, file: !22, line: 328, column: 3)
!2017 = !DILocation(line: 329, column: 24, scope: !2015)
!2018 = !DILocation(line: 336, column: 8, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !2016, file: !22, line: 336, column: 8)
!2020 = !DILocation(line: 337, column: 30, scope: !2019)
!2021 = !DILocation(line: 337, column: 39, scope: !2019)
!2022 = !DILocation(line: 337, column: 28, scope: !2019)
!2023 = !DILocation(line: 337, column: 5, scope: !2019)
!2024 = !DILocation(line: 339, column: 28, scope: !2019)
!2025 = !DILocation(line: 340, column: 32, scope: !2016)
!2026 = !DILocation(line: 341, column: 3, scope: !2016)
!2027 = !DILocation(line: 344, column: 8, scope: !2028)
!2028 = distinct !DILexicalBlock(scope: !2029, file: !22, line: 344, column: 8)
!2029 = distinct !DILexicalBlock(scope: !2010, file: !22, line: 343, column: 3)
!2030 = !DILocation(line: 345, column: 10, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !2028, file: !22, line: 345, column: 9)
!2032 = !DILocation(line: 345, column: 9, scope: !2031)
!2033 = !DILocation(line: 346, column: 6, scope: !2031)
!2034 = !DILocation(line: 348, column: 6, scope: !2031)
!2035 = !DILocation(line: 351, column: 22, scope: !2011)
!2036 = !DILocation(line: 351, column: 20, scope: !2011)
!2037 = !DILocation(line: 352, column: 17, scope: !2011)
!2038 = !DILocation(line: 352, column: 15, scope: !2011)
!2039 = !DILocation(line: 355, column: 58, scope: !2011)
!2040 = !DILocation(line: 355, column: 69, scope: !2011)
!2041 = !DILocation(line: 355, column: 57, scope: !2011)
!2042 = !DILocation(line: 355, column: 28, scope: !2011)
!2043 = !DILocation(line: 355, column: 39, scope: !2011)
!2044 = !DILocation(line: 355, column: 3, scope: !2011)
!2045 = !DILocation(line: 355, column: 55, scope: !2011)
!2046 = !DILocation(line: 358, column: 6, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !1950, file: !22, line: 358, column: 6)
!2048 = !DILocation(line: 359, column: 7, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2047, file: !22, line: 359, column: 7)
!2050 = !DILocation(line: 359, column: 18, scope: !2049)
!2051 = !DILocation(line: 359, column: 33, scope: !2049)
!2052 = !DILocation(line: 359, column: 37, scope: !2049)
!2053 = !DILocation(line: 360, column: 39, scope: !2049)
!2054 = !DILocation(line: 360, column: 60, scope: !2049)
!2055 = !DILocation(line: 360, column: 52, scope: !2049)
!2056 = !DILocation(line: 360, column: 72, scope: !2049)
!2057 = !DILocation(line: 360, column: 84, scope: !2049)
!2058 = !DILocation(line: 360, column: 89, scope: !2049)
!2059 = !DILocation(line: 360, column: 4, scope: !2049)
!2060 = !DILocation(line: 362, column: 30, scope: !2049)
!2061 = !DILocation(line: 362, column: 43, scope: !2049)
!2062 = !DILocation(line: 362, column: 4, scope: !2049)
!2063 = !DILocation(line: 364, column: 1, scope: !1950)
!2064 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !2066, file: !2065, line: 402, type: !2266, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, declaration: !2265, retainedNodes: !1603)
!2065 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__vector/vector.h", directory: "")
!2066 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<char *, std::__1::allocator<char *> >", scope: !310, file: !2065, line: 86, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2067, templateParams: !2415, identifier: "_ZTSNSt3__16vectorIPcNS_9allocatorIS1_EEEE")
!2067 = !{!2068, !2139, !2140, !2141, !2147, !2149, !2153, !2157, !2162, !2166, !2169, !2175, !2176, !2181, !2191, !2195, !2200, !2203, !2206, !2210, !2213, !2216, !2220, !2221, !2225, !2231, !2236, !2237, !2238, !2244, !2249, !2250, !2251, !2252, !2253, !2254, !2255, !2258, !2259, !2262, !2263, !2264, !2265, !2270, !2273, !2274, !2275, !2278, !2281, !2282, !2283, !2287, !2291, !2294, !2298, !2299, !2302, !2305, !2308, !2311, !2314, !2317, !2318, !2319, !2320, !2323, !2324, !2325, !2326, !2329, !2330, !2331, !2332, !2333, !2336, !2341, !2347, !2350, !2353, !2372, !2388, !2391, !2394, !2397, !2400, !2401, !2402, !2403, !2404, !2405, !2406, !2407, !2410, !2413, !2414}
!2068 = !DIDerivedType(tag: DW_TAG_member, name: "__begin_", scope: !2066, file: !2065, line: 548, baseType: !2069, size: 64)
!2069 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2066, file: !2065, line: 102, baseType: !2070, flags: DIFlagPublic)
!2070 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2072, file: !2071, line: 241, baseType: !2107)
!2071 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator_traits.h", directory: "")
!2072 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::__1::allocator<char *> >", scope: !310, file: !2071, line: 238, size: 8, flags: DIFlagTypePassByValue, elements: !2073, templateParams: !2137, identifier: "_ZTSNSt3__116allocator_traitsINS_9allocatorIPcEEEE")
!2073 = !{!2074, !2134}
!2074 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE8allocateB8ne200100ERS3_m", scope: !2072, file: !2071, line: 269, type: !2075, scopeLine: 269, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2075 = !DISubroutineType(types: !2076)
!2076 = !{!2070, !2077, !2132}
!2077 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2078, size: 64)
!2078 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !2072, file: !2071, line: 239, baseType: !2079)
!2079 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char *>", scope: !310, file: !2080, line: 80, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !2081, templateParams: !2130, identifier: "_ZTSNSt3__19allocatorIPcEE")
!2080 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator.h", directory: "")
!2081 = !{!2082, !2092, !2096, !2101, !2104, !2112, !2120, !2123, !2127}
!2082 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2079, baseType: !2083, extraData: i32 0)
!2083 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__non_trivial_if<true, std::__1::allocator<char *> >", scope: !310, file: !2080, line: 70, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !2084, templateParams: !2089, identifier: "_ZTSNSt3__116__non_trivial_ifILb1ENS_9allocatorIPcEEEE")
!2084 = !{!2085}
!2085 = !DISubprogram(name: "__non_trivial_if", scope: !2083, file: !2080, line: 71, type: !2086, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!2086 = !DISubroutineType(types: !2087)
!2087 = !{null, !2088}
!2088 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2083, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2089 = !{!2090, !2091}
!2090 = !DITemplateValueParameter(name: "_Cond", type: !966, value: i8 1)
!2091 = !DITemplateTypeParameter(name: "_Unique", type: !2079)
!2092 = !DISubprogram(name: "allocator", scope: !2079, file: !2080, line: 93, type: !2093, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2093 = !DISubroutineType(types: !2094)
!2094 = !{null, !2095}
!2095 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2079, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2096 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100Em", scope: !2079, file: !2080, line: 98, type: !2097, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2097 = !DISubroutineType(types: !2098)
!2098 = !{!826, !2095, !2099}
!2099 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !310, file: !2100, line: 20, baseType: !370)
!2100 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/size_t.h", directory: "")
!2101 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__19allocatorIPcE10deallocateB8ne200100EPS1_m", scope: !2079, file: !2080, line: 116, type: !2102, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2102 = !DISubroutineType(types: !2103)
!2103 = !{null, !2095, !826, !2099}
!2104 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERS1_", scope: !2079, file: !2080, line: 136, type: !2105, scopeLine: 136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2105 = !DISubroutineType(types: !2106)
!2106 = !{!2107, !2108, !2110}
!2107 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2079, file: !2080, line: 126, baseType: !826, flags: DIFlagPublic)
!2108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2109, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2109 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2079)
!2110 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !2079, file: !2080, line: 128, baseType: !2111, flags: DIFlagPublic)
!2111 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !14, size: 64)
!2112 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERKS1_", scope: !2079, file: !2080, line: 139, type: !2113, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2113 = !DISubroutineType(types: !2114)
!2114 = !{!2115, !2108, !2118}
!2115 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !2079, file: !2080, line: 127, baseType: !2116, flags: DIFlagPublic)
!2116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2117, size: 64)
!2117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!2118 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !2079, file: !2080, line: 129, baseType: !2119, flags: DIFlagPublic)
!2119 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2117, size: 64)
!2120 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100EmPKv", scope: !2079, file: !2080, line: 143, type: !2121, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2121 = !DISubroutineType(types: !2122)
!2122 = !{!826, !2095, !2099, !902}
!2123 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__19allocatorIPcE8max_sizeB8ne200100Ev", scope: !2079, file: !2080, line: 147, type: !2124, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2124 = !DISubroutineType(types: !2125)
!2125 = !{!2126, !2108}
!2126 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !2080, line: 85, baseType: !2099, flags: DIFlagPublic)
!2127 = !DISubprogram(name: "destroy", linkageName: "_ZNSt3__19allocatorIPcE7destroyB8ne200100EPS1_", scope: !2079, file: !2080, line: 156, type: !2128, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2128 = !DISubroutineType(types: !2129)
!2129 = !{null, !2095, !2107}
!2130 = !{!2131}
!2131 = !DITemplateTypeParameter(name: "_Tp", type: !14)
!2132 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !2072, file: !2071, line: 246, baseType: !2133)
!2133 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !2079, file: !2080, line: 85, baseType: !2099, flags: DIFlagPublic)
!2134 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE10deallocateB8ne200100ERS3_PS2_m", scope: !2072, file: !2071, line: 301, type: !2135, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2135 = !DISubroutineType(types: !2136)
!2136 = !{null, !2077, !2070, !2132}
!2137 = !{!2138}
!2138 = !DITemplateTypeParameter(name: "_Alloc", type: !2079)
!2139 = !DIDerivedType(tag: DW_TAG_member, name: "__end_", scope: !2066, file: !2065, line: 549, baseType: !2069, size: 64, offset: 64)
!2140 = !DIDerivedType(tag: DW_TAG_member, name: "__cap_", scope: !2066, file: !2065, line: 550, baseType: !2069, size: 64, align: 8, offset: 128)
!2141 = !DIDerivedType(tag: DW_TAG_member, name: "__padding1_550_", scope: !2066, file: !2065, line: 550, baseType: !2142, size: 8)
!2142 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<char **, true>", scope: !310, file: !2143, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1603, templateParams: !2144, identifier: "_ZTSNSt3__125__compressed_pair_paddingIPPcLb1EEE")
!2143 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/compressed_pair.h", directory: "")
!2144 = !{!2145, !2146}
!2145 = !DITemplateTypeParameter(name: "_ToPad", type: !826)
!2146 = !DITemplateValueParameter(name: "_Empty", type: !966, defaulted: true, value: i8 1)
!2147 = !DIDerivedType(tag: DW_TAG_member, name: "__alloc_", scope: !2066, file: !2065, line: 550, baseType: !2148, size: 8)
!2148 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !2066, file: !2065, line: 96, baseType: !2079, flags: DIFlagPublic)
!2149 = !DIDerivedType(tag: DW_TAG_member, name: "__padding2_550_", scope: !2066, file: !2065, line: 550, baseType: !2150, size: 8)
!2150 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<std::__1::allocator<char *>, true>", scope: !310, file: !2143, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1603, templateParams: !2151, identifier: "_ZTSNSt3__125__compressed_pair_paddingINS_9allocatorIPcEELb1EEE")
!2151 = !{!2152, !2146}
!2152 = !DITemplateTypeParameter(name: "_ToPad", type: !2079)
!2153 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 133, type: !2154, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2154 = !DISubroutineType(types: !2155)
!2155 = !{null, !2156}
!2156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2066, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2157 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 135, type: !2158, scopeLine: 135, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2158 = !DISubroutineType(types: !2159)
!2159 = !{null, !2156, !2160}
!2160 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2161, size: 64)
!2161 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2148)
!2162 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 144, type: !2163, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2163 = !DISubroutineType(types: !2164)
!2164 = !{null, !2156, !2165}
!2165 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !2066, file: !2065, line: 100, baseType: !2132, flags: DIFlagPublic)
!2166 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 154, type: !2167, scopeLine: 154, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2167 = !DISubroutineType(types: !2168)
!2168 = !{null, !2156, !2165, !2160}
!2169 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 165, type: !2170, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2170 = !DISubroutineType(types: !2171)
!2171 = !{null, !2156, !2165, !2172}
!2172 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2173, size: 64)
!2173 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2174)
!2174 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !2066, file: !2065, line: 95, baseType: !14, flags: DIFlagPublic)
!2175 = !DISubprogram(name: "~vector", scope: !2066, file: !2065, line: 259, type: !2154, scopeLine: 259, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2176 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 261, type: !2177, scopeLine: 261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2177 = !DISubroutineType(types: !2178)
!2178 = !{null, !2156, !2179}
!2179 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2180, size: 64)
!2180 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2066)
!2181 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 266, type: !2182, scopeLine: 266, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2182 = !DISubroutineType(types: !2183)
!2183 = !{null, !2156, !2179, !2184}
!2184 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2185, size: 64)
!2185 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2186)
!2186 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2188, file: !2187, line: 22, baseType: !2079)
!2187 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/type_identity.h", directory: "")
!2188 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__type_identity<std::__1::allocator<char *> >", scope: !310, file: !2187, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !1603, templateParams: !2189, identifier: "_ZTSNSt3__115__type_identityINS_9allocatorIPcEEEE")
!2189 = !{!2190}
!2190 = !DITemplateTypeParameter(name: "_Tp", type: !2079)
!2191 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ERKS4_", scope: !2066, file: !2065, line: 270, type: !2192, scopeLine: 270, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2192 = !DISubroutineType(types: !2193)
!2193 = !{!2194, !2156, !2179}
!2194 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2066, size: 64)
!2195 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 273, type: !2196, scopeLine: 273, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2196 = !DISubroutineType(types: !2197)
!2197 = !{null, !2156, !2198}
!2198 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char *>", scope: !311, file: !2199, line: 62, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIPcE")
!2199 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/initializer_list", directory: "")
!2200 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 278, type: !2201, scopeLine: 278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2201 = !DISubroutineType(types: !2202)
!2202 = !{null, !2156, !2198, !2160}
!2203 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ESt16initializer_listIS1_E", scope: !2066, file: !2065, line: 283, type: !2204, scopeLine: 283, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2204 = !DISubroutineType(types: !2205)
!2205 = !{!2194, !2156, !2198}
!2206 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 289, type: !2207, scopeLine: 289, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2207 = !DISubroutineType(types: !2208)
!2208 = !{null, !2156, !2209}
!2209 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2066, size: 64)
!2210 = !DISubprogram(name: "vector", scope: !2066, file: !2065, line: 297, type: !2211, scopeLine: 297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2211 = !DISubroutineType(types: !2212)
!2212 = !{null, !2156, !2209, !2184}
!2213 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100EOS4_", scope: !2066, file: !2065, line: 298, type: !2214, scopeLine: 298, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2214 = !DISubroutineType(types: !2215)
!2215 = !{!2194, !2156, !2209}
!2216 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignEmRKS1_", scope: !2066, file: !2065, line: 333, type: !2217, scopeLine: 333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2217 = !DISubroutineType(types: !2218)
!2218 = !{null, !2156, !2165, !2219}
!2219 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !2066, file: !2065, line: 99, baseType: !2172, flags: DIFlagPublic)
!2220 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignB8ne200100ESt16initializer_listIS1_E", scope: !2066, file: !2065, line: 336, type: !2196, scopeLine: 336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2221 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE13get_allocatorB8ne200100Ev", scope: !2066, file: !2065, line: 341, type: !2222, scopeLine: 341, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2222 = !DISubroutineType(types: !2223)
!2223 = !{!2148, !2224}
!2224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2180, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2225 = !DISubprogram(name: "begin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !2066, file: !2065, line: 348, type: !2226, scopeLine: 348, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2226 = !DISubroutineType(types: !2227)
!2227 = !{!2228, !2156}
!2228 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !2066, file: !2065, line: 111, baseType: !2229, flags: DIFlagPublic)
!2229 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char **>", scope: !310, file: !2230, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPPcEE")
!2230 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/wrap_iter.h", directory: "")
!2231 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !2066, file: !2065, line: 351, type: !2232, scopeLine: 351, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2232 = !DISubroutineType(types: !2233)
!2233 = !{!2234, !2224}
!2234 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !2066, file: !2065, line: 112, baseType: !2235, flags: DIFlagPublic)
!2235 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char *const *>", scope: !310, file: !2230, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPKPcEE")
!2236 = !DISubprogram(name: "end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !2066, file: !2065, line: 354, type: !2226, scopeLine: 354, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2237 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !2066, file: !2065, line: 357, type: !2232, scopeLine: 357, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2238 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !2066, file: !2065, line: 361, type: !2239, scopeLine: 361, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2239 = !DISubroutineType(types: !2240)
!2240 = !{!2241, !2156}
!2241 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !2066, file: !2065, line: 114, baseType: !2242, flags: DIFlagPublic)
!2242 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char **> >", scope: !310, file: !2243, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPPcEEEE")
!2243 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/reverse_iterator.h", directory: "")
!2244 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !2066, file: !2065, line: 364, type: !2245, scopeLine: 364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2245 = !DISubroutineType(types: !2246)
!2246 = !{!2247, !2224}
!2247 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !2066, file: !2065, line: 115, baseType: !2248, flags: DIFlagPublic)
!2248 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char *const *> >", scope: !310, file: !2243, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPKPcEEEE")
!2249 = !DISubprogram(name: "rend", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !2066, file: !2065, line: 367, type: !2239, scopeLine: 367, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2250 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !2066, file: !2065, line: 370, type: !2245, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2251 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6cbeginB8ne200100Ev", scope: !2066, file: !2065, line: 374, type: !2232, scopeLine: 374, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2252 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4cendB8ne200100Ev", scope: !2066, file: !2065, line: 375, type: !2232, scopeLine: 375, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2253 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE7crbeginB8ne200100Ev", scope: !2066, file: !2065, line: 376, type: !2245, scopeLine: 376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2254 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5crendB8ne200100Ev", scope: !2066, file: !2065, line: 379, type: !2245, scopeLine: 379, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2255 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4sizeB8ne200100Ev", scope: !2066, file: !2065, line: 384, type: !2256, scopeLine: 384, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2256 = !DISubroutineType(types: !2257)
!2257 = !{!2165, !2224}
!2258 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8capacityB8ne200100Ev", scope: !2066, file: !2065, line: 387, type: !2256, scopeLine: 387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2259 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5emptyB8ne200100Ev", scope: !2066, file: !2065, line: 390, type: !2260, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2260 = !DISubroutineType(types: !2261)
!2261 = !{!966, !2224}
!2262 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8max_sizeB8ne200100Ev", scope: !2066, file: !2065, line: 393, type: !2256, scopeLine: 393, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2263 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE7reserveEm", scope: !2066, file: !2065, line: 396, type: !2163, scopeLine: 396, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2264 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13shrink_to_fitEv", scope: !2066, file: !2065, line: 397, type: !2154, scopeLine: 397, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2265 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !2066, file: !2065, line: 402, type: !2266, scopeLine: 402, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2266 = !DISubroutineType(types: !2267)
!2267 = !{!2268, !2156, !2165}
!2268 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !2066, file: !2065, line: 98, baseType: !2269, flags: DIFlagPublic)
!2269 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2174, size: 64)
!2270 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !2066, file: !2065, line: 406, type: !2271, scopeLine: 406, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2271 = !DISubroutineType(types: !2272)
!2272 = !{!2219, !2224, !2165}
!2273 = !DISubprogram(name: "at", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !2066, file: !2065, line: 410, type: !2266, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2274 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !2066, file: !2065, line: 415, type: !2271, scopeLine: 415, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2275 = !DISubprogram(name: "front", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !2066, file: !2065, line: 421, type: !2276, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2276 = !DISubroutineType(types: !2277)
!2277 = !{!2268, !2156}
!2278 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !2066, file: !2065, line: 425, type: !2279, scopeLine: 425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2279 = !DISubroutineType(types: !2280)
!2280 = !{!2219, !2224}
!2281 = !DISubprogram(name: "back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !2066, file: !2065, line: 429, type: !2276, scopeLine: 429, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2282 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !2066, file: !2065, line: 433, type: !2279, scopeLine: 433, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2283 = !DISubprogram(name: "data", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !2066, file: !2065, line: 441, type: !2284, scopeLine: 441, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2284 = !DISubroutineType(types: !2285)
!2285 = !{!2286, !2156}
!2286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2174, size: 64)
!2287 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !2066, file: !2065, line: 445, type: !2288, scopeLine: 445, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2288 = !DISubroutineType(types: !2289)
!2289 = !{!2290, !2224}
!2290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2173, size: 64)
!2291 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100ERKS1_", scope: !2066, file: !2065, line: 452, type: !2292, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2292 = !DISubroutineType(types: !2293)
!2293 = !{null, !2156, !2219}
!2294 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100EOS1_", scope: !2066, file: !2065, line: 454, type: !2295, scopeLine: 454, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2295 = !DISubroutineType(types: !2296)
!2296 = !{null, !2156, !2297}
!2297 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2174, size: 64)
!2298 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8pop_backB8ne200100Ev", scope: !2066, file: !2065, line: 473, type: !2154, scopeLine: 473, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2299 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EERS6_", scope: !2066, file: !2065, line: 478, type: !2300, scopeLine: 478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2300 = !DISubroutineType(types: !2301)
!2301 = !{!2228, !2156, !2234, !2219}
!2302 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEOS1_", scope: !2066, file: !2065, line: 480, type: !2303, scopeLine: 480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2303 = !DISubroutineType(types: !2304)
!2304 = !{!2228, !2156, !2234, !2297}
!2305 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_", scope: !2066, file: !2065, line: 485, type: !2306, scopeLine: 485, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2306 = !DISubroutineType(types: !2307)
!2307 = !{!2228, !2156, !2234, !2165, !2219}
!2308 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertB8ne200100ENS_11__wrap_iterIPKS1_EESt16initializer_listIS1_E", scope: !2066, file: !2065, line: 521, type: !2309, scopeLine: 521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2309 = !DISubroutineType(types: !2310)
!2310 = !{!2228, !2156, !2234, !2198}
!2311 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseB8ne200100ENS_11__wrap_iterIPKS1_EE", scope: !2066, file: !2065, line: 526, type: !2312, scopeLine: 526, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2312 = !DISubroutineType(types: !2313)
!2313 = !{!2228, !2156, !2234}
!2314 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseENS_11__wrap_iterIPKS1_EES8_", scope: !2066, file: !2065, line: 527, type: !2315, scopeLine: 527, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2315 = !DISubroutineType(types: !2316)
!2316 = !{!2228, !2156, !2234, !2234}
!2317 = !DISubprogram(name: "clear", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5clearB8ne200100Ev", scope: !2066, file: !2065, line: 529, type: !2154, scopeLine: 529, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2318 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEm", scope: !2066, file: !2065, line: 535, type: !2163, scopeLine: 535, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2319 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEmRKS1_", scope: !2066, file: !2065, line: 536, type: !2217, scopeLine: 536, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2320 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4swapERS4_", scope: !2066, file: !2065, line: 538, type: !2321, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2321 = !DISubroutineType(types: !2322)
!2322 = !{null, !2156, !2194}
!2323 = !DISubprogram(name: "__invariants", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE12__invariantsEv", scope: !2066, file: !2065, line: 545, type: !2260, scopeLine: 545, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2324 = !DISubprogram(name: "__vallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__vallocateB8ne200100Em", scope: !2066, file: !2065, line: 559, type: !2163, scopeLine: 559, flags: DIFlagPrototyped, spFlags: 0)
!2325 = !DISubprogram(name: "__vdeallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__vdeallocateEv", scope: !2066, file: !2065, line: 569, type: !2154, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!2326 = !DISubprogram(name: "__recommend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__recommendB8ne200100Em", scope: !2066, file: !2065, line: 570, type: !2327, scopeLine: 570, flags: DIFlagPrototyped, spFlags: 0)
!2327 = !DISubroutineType(types: !2328)
!2328 = !{!2165, !2224, !2165}
!2329 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEm", scope: !2066, file: !2065, line: 571, type: !2163, scopeLine: 571, flags: DIFlagPrototyped, spFlags: 0)
!2330 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEmRKS1_", scope: !2066, file: !2065, line: 572, type: !2217, scopeLine: 572, flags: DIFlagPrototyped, spFlags: 0)
!2331 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEm", scope: !2066, file: !2065, line: 620, type: !2163, scopeLine: 620, flags: DIFlagPrototyped, spFlags: 0)
!2332 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEmRKS1_", scope: !2066, file: !2065, line: 621, type: !2217, scopeLine: 621, flags: DIFlagPrototyped, spFlags: 0)
!2333 = !DISubprogram(name: "__make_iter", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPS1_", scope: !2066, file: !2065, line: 623, type: !2334, scopeLine: 623, flags: DIFlagPrototyped, spFlags: 0)
!2334 = !DISubroutineType(types: !2335)
!2335 = !{!2228, !2156, !2069}
!2336 = !DISubprogram(name: "__make_iter", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPKS1_", scope: !2066, file: !2065, line: 643, type: !2337, scopeLine: 643, flags: DIFlagPrototyped, spFlags: 0)
!2337 = !DISubroutineType(types: !2338)
!2338 = !{!2234, !2224, !2339}
!2339 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !2066, file: !2065, line: 103, baseType: !2340, flags: DIFlagPublic)
!2340 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !2072, file: !2071, line: 242, baseType: !2115)
!2341 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE", scope: !2066, file: !2065, line: 656, type: !2342, scopeLine: 656, flags: DIFlagPrototyped, spFlags: 0)
!2342 = !DISubroutineType(types: !2343)
!2343 = !{null, !2156, !2344}
!2344 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2345, size: 64)
!2345 = !DICompositeType(tag: DW_TAG_structure_type, name: "__split_buffer<char *, std::__1::allocator<char *> &>", scope: !310, file: !2346, line: 52, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__114__split_bufferIPcRNS_9allocatorIS1_EEEE")
!2346 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__split_buffer", directory: "")
!2347 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_", scope: !2066, file: !2065, line: 658, type: !2348, scopeLine: 658, flags: DIFlagPrototyped, spFlags: 0)
!2348 = !DISubroutineType(types: !2349)
!2349 = !{!2069, !2156, !2344, !2069}
!2350 = !DISubprogram(name: "__move_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE12__move_rangeEPS1_S5_S5_", scope: !2066, file: !2065, line: 660, type: !2351, scopeLine: 660, flags: DIFlagPrototyped, spFlags: 0)
!2351 = !DISubroutineType(types: !2352)
!2352 = !{null, !2156, !2069, !2069, !2069}
!2353 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE", scope: !2066, file: !2065, line: 661, type: !2354, scopeLine: 661, flags: DIFlagPrototyped, spFlags: 0)
!2354 = !DISubroutineType(types: !2355)
!2355 = !{null, !2156, !2194, !2356}
!2356 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !310, file: !2357, line: 31, baseType: !2358)
!2357 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/integral_constant.h", directory: "")
!2358 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !310, file: !2357, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !2359, templateParams: !2369, identifier: "_ZTSNSt3__117integral_constantIbLb1EEE")
!2359 = !{!2360, !2362, !2368}
!2360 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !2358, file: !2357, line: 22, baseType: !2361, flags: DIFlagStaticMember, extraData: i1 true)
!2361 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !966)
!2362 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb1EEcvbB8ne200100Ev", scope: !2358, file: !2357, line: 25, type: !2363, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!2363 = !DISubroutineType(types: !2364)
!2364 = !{!2365, !2366}
!2365 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !2358, file: !2357, line: 23, baseType: !966)
!2366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2367, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2367 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2358)
!2368 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb1EEclB8ne200100Ev", scope: !2358, file: !2357, line: 27, type: !2363, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!2369 = !{!2370, !2371}
!2370 = !DITemplateTypeParameter(name: "_Tp", type: !966)
!2371 = !DITemplateValueParameter(name: "__v", type: !966, value: i8 1)
!2372 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb0EEE", scope: !2066, file: !2065, line: 663, type: !2373, scopeLine: 663, flags: DIFlagPrototyped, spFlags: 0)
!2373 = !DISubroutineType(types: !2374)
!2374 = !{null, !2156, !2194, !2375}
!2375 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !310, file: !2357, line: 32, baseType: !2376)
!2376 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !310, file: !2357, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !2377, templateParams: !2386, identifier: "_ZTSNSt3__117integral_constantIbLb0EEE")
!2377 = !{!2378, !2379, !2385}
!2378 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !2376, file: !2357, line: 22, baseType: !2361, flags: DIFlagStaticMember, extraData: i1 false)
!2379 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb0EEcvbB8ne200100Ev", scope: !2376, file: !2357, line: 25, type: !2380, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!2380 = !DISubroutineType(types: !2381)
!2381 = !{!2382, !2383}
!2382 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !2376, file: !2357, line: 23, baseType: !966)
!2383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2384, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2384 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2376)
!2385 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb0EEclB8ne200100Ev", scope: !2376, file: !2357, line: 27, type: !2380, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!2386 = !{!2370, !2387}
!2387 = !DITemplateValueParameter(name: "__v", type: !966, value: i8 0)
!2388 = !DISubprogram(name: "__destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_", scope: !2066, file: !2065, line: 665, type: !2389, scopeLine: 665, flags: DIFlagPrototyped, spFlags: 0)
!2389 = !DISubroutineType(types: !2390)
!2390 = !{null, !2156, !2069}
!2391 = !DISubprogram(name: "__annotate_contiguous_container", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE31__annotate_contiguous_containerB8ne200100EPKvS6_", scope: !2066, file: !2065, line: 683, type: !2392, scopeLine: 683, flags: DIFlagPrototyped, spFlags: 0)
!2392 = !DISubroutineType(types: !2393)
!2393 = !{null, !2224, !902, !902}
!2394 = !DISubprogram(name: "__annotate_new", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE14__annotate_newB8ne200100Em", scope: !2066, file: !2065, line: 687, type: !2395, scopeLine: 687, flags: DIFlagPrototyped, spFlags: 0)
!2395 = !DISubroutineType(types: !2396)
!2396 = !{null, !2224, !2165}
!2397 = !DISubprogram(name: "__annotate_delete", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_deleteB8ne200100Ev", scope: !2066, file: !2065, line: 694, type: !2398, scopeLine: 694, flags: DIFlagPrototyped, spFlags: 0)
!2398 = !DISubroutineType(types: !2399)
!2399 = !{null, !2224}
!2400 = !DISubprogram(name: "__annotate_increase", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE19__annotate_increaseB8ne200100Em", scope: !2066, file: !2065, line: 700, type: !2395, scopeLine: 700, flags: DIFlagPrototyped, spFlags: 0)
!2401 = !DISubprogram(name: "__annotate_shrink", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_shrinkB8ne200100Em", scope: !2066, file: !2065, line: 707, type: !2395, scopeLine: 707, flags: DIFlagPrototyped, spFlags: 0)
!2402 = !DISubprogram(name: "__base_destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_", scope: !2066, file: !2065, line: 746, type: !2389, scopeLine: 746, flags: DIFlagPrototyped, spFlags: 0)
!2403 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_", scope: !2066, file: !2065, line: 753, type: !2177, scopeLine: 753, flags: DIFlagPrototyped, spFlags: 0)
!2404 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_", scope: !2066, file: !2065, line: 757, type: !2321, scopeLine: 757, flags: DIFlagPrototyped, spFlags: 0)
!2405 = !DISubprogram(name: "__throw_length_error", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev", scope: !2066, file: !2065, line: 763, type: !879, scopeLine: 763, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!2406 = !DISubprogram(name: "__throw_out_of_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_out_of_rangeB8ne200100Ev", scope: !2066, file: !2065, line: 765, type: !879, scopeLine: 765, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!2407 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb1EEE", scope: !2066, file: !2065, line: 767, type: !2408, scopeLine: 767, flags: DIFlagPrototyped, spFlags: 0)
!2408 = !DISubroutineType(types: !2409)
!2409 = !{null, !2156, !2179, !2356}
!2410 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb0EEE", scope: !2066, file: !2065, line: 777, type: !2411, scopeLine: 777, flags: DIFlagPrototyped, spFlags: 0)
!2411 = !DISubroutineType(types: !2412)
!2412 = !{null, !2156, !2179, !2375}
!2413 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb1EEE", scope: !2066, file: !2065, line: 779, type: !2354, scopeLine: 779, flags: DIFlagPrototyped, spFlags: 0)
!2414 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb0EEE", scope: !2066, file: !2065, line: 784, type: !2373, scopeLine: 784, flags: DIFlagPrototyped, spFlags: 0)
!2415 = !{!2131, !2416}
!2416 = !DITemplateTypeParameter(name: "_Allocator", type: !2079, defaulted: true)
!2417 = !DILocalVariable(name: "this", arg: 1, scope: !2064, type: !2418, flags: DIFlagArtificial | DIFlagObjectPointer)
!2418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2066, size: 64)
!2419 = !DILocation(line: 0, scope: !2064)
!2420 = !DILocalVariable(name: "__n", arg: 2, scope: !2064, file: !2065, line: 402, type: !2165)
!2421 = !DILocation(line: 402, column: 86, scope: !2064)
!2422 = !DILocation(line: 404, column: 18, scope: !2064)
!2423 = !DILocation(line: 404, column: 27, scope: !2064)
!2424 = !DILocation(line: 404, column: 12, scope: !2064)
!2425 = !DILocation(line: 404, column: 5, scope: !2064)
!2426 = distinct !DISubprogram(name: "do_weapon_select", linkageName: "_Z16do_weapon_selectii", scope: !22, file: !22, line: 372, type: !2427, scopeLine: 373, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2427 = !DISubroutineType(types: !2428)
!2428 = !{null, !7, !7}
!2429 = !DILocalVariable(name: "weapon_num", arg: 1, scope: !2426, file: !22, line: 372, type: !7)
!2430 = !DILocation(line: 372, column: 27, scope: !2426)
!2431 = !DILocalVariable(name: "secondary_flag", arg: 2, scope: !2426, file: !22, line: 372, type: !7)
!2432 = !DILocation(line: 372, column: 43, scope: !2426)
!2433 = !DILocalVariable(name: "weapon_num_save", scope: !2426, file: !22, line: 374, type: !7)
!2434 = !DILocation(line: 374, column: 6, scope: !2426)
!2435 = !DILocation(line: 374, column: 24, scope: !2426)
!2436 = !DILocalVariable(name: "weapon_status", scope: !2426, file: !22, line: 375, type: !7)
!2437 = !DILocation(line: 375, column: 6, scope: !2426)
!2438 = !DILocalVariable(name: "current", scope: !2426, file: !22, line: 375, type: !7)
!2439 = !DILocation(line: 375, column: 21, scope: !2426)
!2440 = !DILocalVariable(name: "has_flag", scope: !2426, file: !22, line: 375, type: !7)
!2441 = !DILocation(line: 375, column: 30, scope: !2426)
!2442 = !DILocalVariable(name: "last_was_super", scope: !2426, file: !22, line: 376, type: !24)
!2443 = !DILocation(line: 376, column: 10, scope: !2426)
!2444 = !DILocation(line: 378, column: 7, scope: !2445)
!2445 = distinct !DILexicalBlock(scope: !2426, file: !22, line: 378, column: 6)
!2446 = !DILocation(line: 378, column: 6, scope: !2445)
!2447 = !DILocation(line: 380, column: 13, scope: !2448)
!2448 = distinct !DILexicalBlock(scope: !2445, file: !22, line: 379, column: 2)
!2449 = !DILocation(line: 380, column: 11, scope: !2448)
!2450 = !DILocation(line: 381, column: 43, scope: !2448)
!2451 = !DILocation(line: 381, column: 20, scope: !2448)
!2452 = !DILocation(line: 381, column: 18, scope: !2448)
!2453 = !DILocation(line: 382, column: 12, scope: !2448)
!2454 = !DILocation(line: 383, column: 2, scope: !2448)
!2455 = !DILocation(line: 386, column: 13, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2445, file: !22, line: 385, column: 2)
!2457 = !DILocation(line: 386, column: 11, scope: !2456)
!2458 = !DILocation(line: 387, column: 45, scope: !2456)
!2459 = !DILocation(line: 387, column: 20, scope: !2456)
!2460 = !DILocation(line: 387, column: 18, scope: !2456)
!2461 = !DILocation(line: 388, column: 12, scope: !2456)
!2462 = !DILocation(line: 391, column: 6, scope: !2463)
!2463 = distinct !DILexicalBlock(scope: !2426, file: !22, line: 391, column: 6)
!2464 = !DILocation(line: 391, column: 17, scope: !2463)
!2465 = !DILocation(line: 391, column: 14, scope: !2463)
!2466 = !DILocation(line: 391, column: 28, scope: !2463)
!2467 = !DILocation(line: 391, column: 31, scope: !2463)
!2468 = !DILocation(line: 391, column: 42, scope: !2463)
!2469 = !DILocation(line: 391, column: 53, scope: !2463)
!2470 = !DILocation(line: 391, column: 39, scope: !2463)
!2471 = !DILocation(line: 395, column: 17, scope: !2472)
!2472 = distinct !DILexicalBlock(scope: !2463, file: !22, line: 392, column: 2)
!2473 = !DILocation(line: 395, column: 28, scope: !2472)
!2474 = !DILocation(line: 395, column: 45, scope: !2472)
!2475 = !DILocation(line: 395, column: 43, scope: !2472)
!2476 = !DILocation(line: 395, column: 14, scope: !2472)
!2477 = !DILocation(line: 396, column: 37, scope: !2472)
!2478 = !DILocation(line: 396, column: 49, scope: !2472)
!2479 = !DILocation(line: 396, column: 19, scope: !2472)
!2480 = !DILocation(line: 396, column: 17, scope: !2472)
!2481 = !DILocation(line: 397, column: 2, scope: !2472)
!2482 = !DILocation(line: 402, column: 7, scope: !2483)
!2483 = distinct !DILexicalBlock(scope: !2484, file: !22, line: 402, column: 7)
!2484 = distinct !DILexicalBlock(scope: !2463, file: !22, line: 399, column: 2)
!2485 = !DILocation(line: 403, column: 15, scope: !2483)
!2486 = !DILocation(line: 403, column: 4, scope: !2483)
!2487 = !DILocation(line: 405, column: 37, scope: !2484)
!2488 = !DILocation(line: 405, column: 49, scope: !2484)
!2489 = !DILocation(line: 405, column: 19, scope: !2484)
!2490 = !DILocation(line: 405, column: 17, scope: !2484)
!2491 = !DILocation(line: 409, column: 8, scope: !2492)
!2492 = distinct !DILexicalBlock(scope: !2484, file: !22, line: 409, column: 7)
!2493 = !DILocation(line: 409, column: 24, scope: !2492)
!2494 = !DILocation(line: 409, column: 22, scope: !2492)
!2495 = !DILocation(line: 409, column: 37, scope: !2492)
!2496 = !DILocation(line: 409, column: 34, scope: !2492)
!2497 = !DILocation(line: 411, column: 21, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2492, file: !22, line: 410, column: 3)
!2499 = !DILocation(line: 411, column: 19, scope: !2498)
!2500 = !DILocation(line: 411, column: 37, scope: !2498)
!2501 = !DILocation(line: 411, column: 54, scope: !2498)
!2502 = !DILocation(line: 411, column: 52, scope: !2498)
!2503 = !DILocation(line: 411, column: 15, scope: !2498)
!2504 = !DILocation(line: 412, column: 38, scope: !2498)
!2505 = !DILocation(line: 412, column: 50, scope: !2498)
!2506 = !DILocation(line: 412, column: 20, scope: !2498)
!2507 = !DILocation(line: 412, column: 18, scope: !2498)
!2508 = !DILocation(line: 413, column: 9, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2498, file: !22, line: 413, column: 8)
!2510 = !DILocation(line: 413, column: 25, scope: !2509)
!2511 = !DILocation(line: 413, column: 23, scope: !2509)
!2512 = !DILocation(line: 413, column: 38, scope: !2509)
!2513 = !DILocation(line: 413, column: 35, scope: !2509)
!2514 = !DILocation(line: 414, column: 22, scope: !2509)
!2515 = !DILocation(line: 414, column: 20, scope: !2509)
!2516 = !DILocation(line: 414, column: 38, scope: !2509)
!2517 = !DILocation(line: 414, column: 55, scope: !2509)
!2518 = !DILocation(line: 414, column: 53, scope: !2509)
!2519 = !DILocation(line: 414, column: 16, scope: !2509)
!2520 = !DILocation(line: 414, column: 5, scope: !2509)
!2521 = !DILocation(line: 415, column: 3, scope: !2498)
!2522 = !DILocation(line: 419, column: 7, scope: !2523)
!2523 = distinct !DILexicalBlock(scope: !2426, file: !22, line: 419, column: 6)
!2524 = !DILocation(line: 419, column: 23, scope: !2523)
!2525 = !DILocation(line: 419, column: 21, scope: !2523)
!2526 = !DILocation(line: 419, column: 36, scope: !2523)
!2527 = !DILocation(line: 419, column: 33, scope: !2523)
!2528 = !DILocation(line: 421, column: 8, scope: !2529)
!2529 = distinct !DILexicalBlock(scope: !2530, file: !22, line: 421, column: 7)
!2530 = distinct !DILexicalBlock(scope: !2523, file: !22, line: 420, column: 2)
!2531 = !DILocation(line: 421, column: 7, scope: !2529)
!2532 = !DILocation(line: 423, column: 8, scope: !2533)
!2533 = distinct !DILexicalBlock(scope: !2534, file: !22, line: 423, column: 8)
!2534 = distinct !DILexicalBlock(scope: !2529, file: !22, line: 422, column: 3)
!2535 = !DILocation(line: 423, column: 19, scope: !2533)
!2536 = !DILocation(line: 424, column: 5, scope: !2533)
!2537 = !DILocation(line: 425, column: 31, scope: !2534)
!2538 = !DILocation(line: 425, column: 46, scope: !2534)
!2539 = !DILocation(line: 425, column: 4, scope: !2534)
!2540 = !DILocation(line: 426, column: 3, scope: !2534)
!2541 = !DILocation(line: 428, column: 32, scope: !2529)
!2542 = !DILocation(line: 428, column: 45, scope: !2529)
!2543 = !DILocation(line: 428, column: 81, scope: !2529)
!2544 = !DILocation(line: 428, column: 4, scope: !2529)
!2545 = !DILocation(line: 429, column: 3, scope: !2530)
!2546 = !DILocation(line: 430, column: 3, scope: !2530)
!2547 = !DILocation(line: 434, column: 16, scope: !2426)
!2548 = !DILocation(line: 434, column: 28, scope: !2426)
!2549 = !DILocation(line: 434, column: 2, scope: !2426)
!2550 = !DILocation(line: 435, column: 1, scope: !2426)
!2551 = distinct !DISubprogram(name: "POrderList", linkageName: "_Z10POrderListi", scope: !22, file: !22, line: 719, type: !385, scopeLine: 720, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2552 = !DILocalVariable(name: "num", arg: 1, scope: !2551, file: !22, line: 719, type: !7)
!2553 = !DILocation(line: 719, column: 20, scope: !2551)
!2554 = !DILocalVariable(name: "i", scope: !2551, file: !22, line: 724, type: !7)
!2555 = !DILocation(line: 724, column: 6, scope: !2551)
!2556 = !DILocation(line: 726, column: 9, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2551, file: !22, line: 726, column: 2)
!2558 = !DILocation(line: 726, column: 7, scope: !2557)
!2559 = !DILocation(line: 726, column: 14, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2557, file: !22, line: 726, column: 2)
!2561 = !DILocation(line: 726, column: 16, scope: !2560)
!2562 = !DILocation(line: 726, column: 2, scope: !2557)
!2563 = !DILocation(line: 727, column: 20, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2560, file: !22, line: 727, column: 7)
!2565 = !DILocation(line: 727, column: 7, scope: !2564)
!2566 = !DILocation(line: 727, column: 26, scope: !2564)
!2567 = !DILocation(line: 727, column: 23, scope: !2564)
!2568 = !DILocation(line: 729, column: 4, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2564, file: !22, line: 728, column: 3)
!2570 = !DILocation(line: 730, column: 12, scope: !2569)
!2571 = !DILocation(line: 730, column: 4, scope: !2569)
!2572 = !DILocation(line: 726, column: 44, scope: !2560)
!2573 = !DILocation(line: 726, column: 2, scope: !2560)
!2574 = distinct !{!2574, !2562, !2575, !1743}
!2575 = !DILocation(line: 731, column: 3, scope: !2557)
!2576 = !DILocation(line: 732, column: 2, scope: !2551)
!2577 = !DILocation(line: 733, column: 2, scope: !2551)
!2578 = !DILocation(line: 735, column: 1, scope: !2551)
!2579 = distinct !DISubprogram(name: "SOrderList", linkageName: "_Z10SOrderListi", scope: !22, file: !22, line: 737, type: !385, scopeLine: 738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2580 = !DILocalVariable(name: "num", arg: 1, scope: !2579, file: !22, line: 737, type: !7)
!2581 = !DILocation(line: 737, column: 20, scope: !2579)
!2582 = !DILocalVariable(name: "i", scope: !2579, file: !22, line: 742, type: !7)
!2583 = !DILocation(line: 742, column: 6, scope: !2579)
!2584 = !DILocation(line: 744, column: 9, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2579, file: !22, line: 744, column: 2)
!2586 = !DILocation(line: 744, column: 7, scope: !2585)
!2587 = !DILocation(line: 744, column: 14, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2585, file: !22, line: 744, column: 2)
!2589 = !DILocation(line: 744, column: 16, scope: !2588)
!2590 = !DILocation(line: 744, column: 2, scope: !2585)
!2591 = !DILocation(line: 745, column: 22, scope: !2592)
!2592 = distinct !DILexicalBlock(scope: !2588, file: !22, line: 745, column: 7)
!2593 = !DILocation(line: 745, column: 7, scope: !2592)
!2594 = !DILocation(line: 745, column: 28, scope: !2592)
!2595 = !DILocation(line: 745, column: 25, scope: !2592)
!2596 = !DILocation(line: 747, column: 4, scope: !2597)
!2597 = distinct !DILexicalBlock(scope: !2592, file: !22, line: 746, column: 3)
!2598 = !DILocation(line: 748, column: 12, scope: !2597)
!2599 = !DILocation(line: 748, column: 4, scope: !2597)
!2600 = !DILocation(line: 744, column: 46, scope: !2588)
!2601 = !DILocation(line: 744, column: 2, scope: !2588)
!2602 = distinct !{!2602, !2590, !2603, !1743}
!2603 = !DILocation(line: 749, column: 3, scope: !2585)
!2604 = !DILocation(line: 750, column: 2, scope: !2579)
!2605 = !DILocation(line: 751, column: 2, scope: !2579)
!2606 = !DILocation(line: 752, column: 2, scope: !2579)
!2607 = !DILocation(line: 754, column: 1, scope: !2579)
!2608 = distinct !DISubprogram(name: "show_weapon_status", linkageName: "_Z18show_weapon_statusv", scope: !22, file: !22, line: 580, type: !879, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2609 = !DILocalVariable(name: "i", scope: !2608, file: !22, line: 582, type: !7)
!2610 = !DILocation(line: 582, column: 6, scope: !2608)
!2611 = !DILocation(line: 584, column: 9, scope: !2612)
!2612 = distinct !DILexicalBlock(scope: !2608, file: !22, line: 584, column: 2)
!2613 = !DILocation(line: 584, column: 7, scope: !2612)
!2614 = !DILocation(line: 584, column: 14, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2612, file: !22, line: 584, column: 2)
!2616 = !DILocation(line: 584, column: 16, scope: !2615)
!2617 = !DILocation(line: 584, column: 2, scope: !2612)
!2618 = !DILocation(line: 586, column: 15, scope: !2619)
!2619 = distinct !DILexicalBlock(scope: !2620, file: !22, line: 586, column: 7)
!2620 = distinct !DILexicalBlock(scope: !2615, file: !22, line: 585, column: 2)
!2621 = !DILocation(line: 586, column: 7, scope: !2619)
!2622 = !DILocation(line: 586, column: 27, scope: !2619)
!2623 = !DILocation(line: 586, column: 56, scope: !2619)
!2624 = !DILocation(line: 586, column: 53, scope: !2619)
!2625 = !DILocation(line: 586, column: 48, scope: !2619)
!2626 = !DILocation(line: 587, column: 4, scope: !2619)
!2627 = !DILocation(line: 589, column: 4, scope: !2619)
!2628 = !DILocation(line: 591, column: 3, scope: !2620)
!2629 = !DILocation(line: 592, column: 2, scope: !2620)
!2630 = !DILocation(line: 584, column: 40, scope: !2615)
!2631 = !DILocation(line: 584, column: 2, scope: !2615)
!2632 = distinct !{!2632, !2617, !2633, !1743}
!2633 = !DILocation(line: 592, column: 2, scope: !2612)
!2634 = !DILocation(line: 594, column: 2, scope: !2608)
!2635 = !DILocation(line: 595, column: 9, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2608, file: !22, line: 595, column: 2)
!2637 = !DILocation(line: 595, column: 7, scope: !2636)
!2638 = !DILocation(line: 595, column: 14, scope: !2639)
!2639 = distinct !DILexicalBlock(scope: !2636, file: !22, line: 595, column: 2)
!2640 = !DILocation(line: 595, column: 16, scope: !2639)
!2641 = !DILocation(line: 595, column: 2, scope: !2636)
!2642 = !DILocation(line: 596, column: 15, scope: !2643)
!2643 = distinct !DILexicalBlock(scope: !2644, file: !22, line: 596, column: 7)
!2644 = distinct !DILexicalBlock(scope: !2639, file: !22, line: 595, column: 46)
!2645 = !DILocation(line: 596, column: 7, scope: !2643)
!2646 = !DILocation(line: 596, column: 27, scope: !2643)
!2647 = !DILocation(line: 596, column: 58, scope: !2643)
!2648 = !DILocation(line: 596, column: 55, scope: !2643)
!2649 = !DILocation(line: 596, column: 50, scope: !2643)
!2650 = !DILocation(line: 597, column: 4, scope: !2643)
!2651 = !DILocation(line: 599, column: 4, scope: !2643)
!2652 = !DILocation(line: 601, column: 3, scope: !2644)
!2653 = !DILocation(line: 602, column: 2, scope: !2644)
!2654 = !DILocation(line: 595, column: 42, scope: !2639)
!2655 = !DILocation(line: 595, column: 2, scope: !2639)
!2656 = distinct !{!2656, !2641, !2657, !1743}
!2657 = !DILocation(line: 602, column: 2, scope: !2636)
!2658 = !DILocation(line: 604, column: 2, scope: !2608)
!2659 = !DILocation(line: 605, column: 2, scope: !2608)
!2660 = !DILocation(line: 606, column: 1, scope: !2608)
!2661 = distinct !DISubprogram(name: "pick_up_secondary", linkageName: "_Z17pick_up_secondaryii", scope: !22, file: !22, line: 614, type: !1601, scopeLine: 615, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2662 = !DILocalVariable(name: "weapon_index", arg: 1, scope: !2661, file: !22, line: 614, type: !7)
!2663 = !DILocation(line: 614, column: 27, scope: !2661)
!2664 = !DILocalVariable(name: "count", arg: 2, scope: !2661, file: !22, line: 614, type: !7)
!2665 = !DILocation(line: 614, column: 45, scope: !2661)
!2666 = !DILocalVariable(name: "max", scope: !2661, file: !22, line: 616, type: !7)
!2667 = !DILocation(line: 616, column: 6, scope: !2661)
!2668 = !DILocalVariable(name: "num_picked_up", scope: !2661, file: !22, line: 617, type: !7)
!2669 = !DILocation(line: 617, column: 6, scope: !2661)
!2670 = !DILocalVariable(name: "cutpoint", scope: !2661, file: !22, line: 618, type: !7)
!2671 = !DILocation(line: 618, column: 6, scope: !2661)
!2672 = !DILocation(line: 620, column: 27, scope: !2661)
!2673 = !DILocation(line: 620, column: 8, scope: !2661)
!2674 = !DILocation(line: 620, column: 6, scope: !2661)
!2675 = !DILocation(line: 622, column: 14, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2661, file: !22, line: 622, column: 6)
!2677 = !DILocation(line: 622, column: 6, scope: !2676)
!2678 = !DILocation(line: 622, column: 26, scope: !2676)
!2679 = !DILocation(line: 622, column: 32, scope: !2676)
!2680 = !DILocation(line: 623, column: 7, scope: !2676)
!2681 = !DILocation(line: 623, column: 3, scope: !2676)
!2682 = !DILocation(line: 625, column: 14, scope: !2683)
!2683 = distinct !DILexicalBlock(scope: !2661, file: !22, line: 625, column: 6)
!2684 = !DILocation(line: 625, column: 6, scope: !2683)
!2685 = !DILocation(line: 625, column: 26, scope: !2683)
!2686 = !DILocation(line: 625, column: 41, scope: !2683)
!2687 = !DILocation(line: 625, column: 58, scope: !2683)
!2688 = !DILocation(line: 625, column: 55, scope: !2683)
!2689 = !DILocation(line: 627, column: 34, scope: !2690)
!2690 = distinct !DILexicalBlock(scope: !2683, file: !22, line: 626, column: 2)
!2691 = !DILocation(line: 627, column: 60, scope: !2690)
!2692 = !DILocation(line: 627, column: 52, scope: !2690)
!2693 = !DILocation(line: 627, column: 72, scope: !2690)
!2694 = !DILocation(line: 627, column: 87, scope: !2690)
!2695 = !DILocation(line: 627, column: 102, scope: !2690)
!2696 = !DILocation(line: 627, column: 3, scope: !2690)
!2697 = !DILocation(line: 628, column: 3, scope: !2690)
!2698 = !DILocation(line: 631, column: 54, scope: !2661)
!2699 = !DILocation(line: 631, column: 51, scope: !2661)
!2700 = !DILocation(line: 631, column: 10, scope: !2661)
!2701 = !DILocation(line: 631, column: 2, scope: !2661)
!2702 = !DILocation(line: 631, column: 22, scope: !2661)
!2703 = !DILocation(line: 631, column: 45, scope: !2661)
!2704 = !DILocation(line: 632, column: 54, scope: !2661)
!2705 = !DILocation(line: 632, column: 10, scope: !2661)
!2706 = !DILocation(line: 632, column: 2, scope: !2661)
!2707 = !DILocation(line: 632, column: 22, scope: !2661)
!2708 = !DILocation(line: 632, column: 37, scope: !2661)
!2709 = !DILocation(line: 632, column: 51, scope: !2661)
!2710 = !DILocation(line: 634, column: 18, scope: !2661)
!2711 = !DILocation(line: 634, column: 16, scope: !2661)
!2712 = !DILocation(line: 635, column: 14, scope: !2713)
!2713 = distinct !DILexicalBlock(scope: !2661, file: !22, line: 635, column: 6)
!2714 = !DILocation(line: 635, column: 6, scope: !2713)
!2715 = !DILocation(line: 635, column: 26, scope: !2713)
!2716 = !DILocation(line: 635, column: 41, scope: !2713)
!2717 = !DILocation(line: 635, column: 57, scope: !2713)
!2718 = !DILocation(line: 635, column: 55, scope: !2713)
!2719 = !DILocation(line: 637, column: 19, scope: !2720)
!2720 = distinct !DILexicalBlock(scope: !2713, file: !22, line: 636, column: 2)
!2721 = !DILocation(line: 637, column: 36, scope: !2720)
!2722 = !DILocation(line: 637, column: 28, scope: !2720)
!2723 = !DILocation(line: 637, column: 48, scope: !2720)
!2724 = !DILocation(line: 637, column: 63, scope: !2720)
!2725 = !DILocation(line: 637, column: 79, scope: !2720)
!2726 = !DILocation(line: 637, column: 77, scope: !2720)
!2727 = !DILocation(line: 637, column: 25, scope: !2720)
!2728 = !DILocation(line: 637, column: 17, scope: !2720)
!2729 = !DILocation(line: 638, column: 54, scope: !2720)
!2730 = !DILocation(line: 638, column: 11, scope: !2720)
!2731 = !DILocation(line: 638, column: 3, scope: !2720)
!2732 = !DILocation(line: 638, column: 23, scope: !2720)
!2733 = !DILocation(line: 638, column: 38, scope: !2720)
!2734 = !DILocation(line: 638, column: 52, scope: !2720)
!2735 = !DILocation(line: 639, column: 2, scope: !2720)
!2736 = !DILocation(line: 641, column: 13, scope: !2661)
!2737 = !DILocation(line: 641, column: 11, scope: !2661)
!2738 = !DILocation(line: 642, column: 17, scope: !2739)
!2739 = distinct !DILexicalBlock(scope: !2661, file: !22, line: 642, column: 6)
!2740 = !DILocation(line: 642, column: 6, scope: !2739)
!2741 = !DILocation(line: 642, column: 33, scope: !2739)
!2742 = !DILocation(line: 642, column: 31, scope: !2739)
!2743 = !DILocation(line: 642, column: 42, scope: !2739)
!2744 = !DILocation(line: 642, column: 58, scope: !2739)
!2745 = !DILocation(line: 642, column: 47, scope: !2739)
!2746 = !DILocation(line: 642, column: 85, scope: !2739)
!2747 = !DILocation(line: 642, column: 74, scope: !2739)
!2748 = !DILocation(line: 642, column: 72, scope: !2739)
!2749 = !DILocation(line: 642, column: 104, scope: !2739)
!2750 = !DILocation(line: 642, column: 116, scope: !2739)
!2751 = !DILocation(line: 642, column: 108, scope: !2739)
!2752 = !DILocation(line: 642, column: 128, scope: !2739)
!2753 = !DILocation(line: 642, column: 143, scope: !2739)
!2754 = !DILocation(line: 642, column: 161, scope: !2739)
!2755 = !DILocation(line: 643, column: 17, scope: !2739)
!2756 = !DILocation(line: 643, column: 3, scope: !2739)
!2757 = !DILocation(line: 649, column: 8, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2759, file: !22, line: 649, column: 7)
!2759 = distinct !DILexicalBlock(scope: !2739, file: !22, line: 645, column: 2)
!2760 = !DILocation(line: 649, column: 21, scope: !2758)
!2761 = !DILocation(line: 649, column: 40, scope: !2758)
!2762 = !DILocation(line: 649, column: 43, scope: !2758)
!2763 = !DILocation(line: 649, column: 56, scope: !2758)
!2764 = !DILocation(line: 649, column: 77, scope: !2758)
!2765 = !DILocation(line: 650, column: 6, scope: !2758)
!2766 = !DILocation(line: 650, column: 23, scope: !2758)
!2767 = !DILocation(line: 650, column: 42, scope: !2758)
!2768 = !DILocation(line: 650, column: 45, scope: !2758)
!2769 = !DILocation(line: 650, column: 62, scope: !2758)
!2770 = !DILocalVariable(name: "cur", scope: !2771, file: !22, line: 652, type: !7)
!2771 = distinct !DILexicalBlock(scope: !2758, file: !22, line: 651, column: 3)
!2772 = !DILocation(line: 652, column: 8, scope: !2771)
!2773 = !DILocation(line: 654, column: 10, scope: !2771)
!2774 = !DILocation(line: 654, column: 8, scope: !2771)
!2775 = !DILocation(line: 656, column: 19, scope: !2776)
!2776 = distinct !DILexicalBlock(scope: !2771, file: !22, line: 656, column: 8)
!2777 = !DILocation(line: 656, column: 8, scope: !2776)
!2778 = !DILocation(line: 656, column: 46, scope: !2776)
!2779 = !DILocation(line: 656, column: 35, scope: !2776)
!2780 = !DILocation(line: 656, column: 33, scope: !2776)
!2781 = !DILocation(line: 657, column: 50, scope: !2776)
!2782 = !DILocation(line: 657, column: 63, scope: !2776)
!2783 = !DILocation(line: 657, column: 49, scope: !2776)
!2784 = !DILocation(line: 657, column: 47, scope: !2776)
!2785 = !DILocation(line: 657, column: 5, scope: !2776)
!2786 = !DILocation(line: 658, column: 3, scope: !2771)
!2787 = !DILocation(line: 662, column: 6, scope: !2788)
!2788 = distinct !DILexicalBlock(scope: !2661, file: !22, line: 662, column: 6)
!2789 = !DILocation(line: 662, column: 12, scope: !2788)
!2790 = !DILocation(line: 664, column: 3, scope: !2791)
!2791 = distinct !DILexicalBlock(scope: !2788, file: !22, line: 663, column: 2)
!2792 = !DILocation(line: 665, column: 31, scope: !2791)
!2793 = !DILocation(line: 665, column: 46, scope: !2791)
!2794 = !DILocation(line: 665, column: 84, scope: !2791)
!2795 = !DILocation(line: 665, column: 3, scope: !2791)
!2796 = !DILocation(line: 666, column: 2, scope: !2791)
!2797 = !DILocation(line: 669, column: 3, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2788, file: !22, line: 668, column: 2)
!2799 = !DILocation(line: 670, column: 27, scope: !2798)
!2800 = !DILocation(line: 670, column: 3, scope: !2798)
!2801 = !DILocation(line: 673, column: 2, scope: !2661)
!2802 = !DILocation(line: 674, column: 1, scope: !2661)
!2803 = distinct !DISubprogram(name: "ReorderPrimary", linkageName: "_Z14ReorderPrimaryv", scope: !22, file: !22, line: 676, type: !879, scopeLine: 677, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2804 = !DILocalVariable(name: "m", scope: !2803, file: !22, line: 678, type: !2805)
!2805 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2806, size: 8448, elements: !117)
!2806 = !DIDerivedType(tag: DW_TAG_typedef, name: "newmenu_item", file: !2807, line: 43, baseType: !2808)
!2807 = !DIFile(filename: "main_d2/newmenu.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "4605fd1e125e01ec40c07444141cd888")
!2808 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "newmenu_item", file: !2807, line: 30, size: 768, flags: DIFlagTypePassByValue, elements: !2809, identifier: "_ZTS12newmenu_item")
!2809 = !{!2810, !2811, !2812, !2813, !2814, !2815, !2816, !2817, !2818, !2819, !2820, !2821, !2822, !2823}
!2810 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2808, file: !2807, line: 31, baseType: !7, size: 32)
!2811 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !2808, file: !2807, line: 32, baseType: !7, size: 32, offset: 32)
!2812 = !DIDerivedType(tag: DW_TAG_member, name: "min_value", scope: !2808, file: !2807, line: 33, baseType: !7, size: 32, offset: 64)
!2813 = !DIDerivedType(tag: DW_TAG_member, name: "max_value", scope: !2808, file: !2807, line: 33, baseType: !7, size: 32, offset: 96)
!2814 = !DIDerivedType(tag: DW_TAG_member, name: "group", scope: !2808, file: !2807, line: 34, baseType: !7, size: 32, offset: 128)
!2815 = !DIDerivedType(tag: DW_TAG_member, name: "text_len", scope: !2808, file: !2807, line: 35, baseType: !7, size: 32, offset: 160)
!2816 = !DIDerivedType(tag: DW_TAG_member, name: "text", scope: !2808, file: !2807, line: 36, baseType: !14, size: 64, offset: 192)
!2817 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !2808, file: !2807, line: 38, baseType: !53, size: 16, offset: 256)
!2818 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !2808, file: !2807, line: 38, baseType: !53, size: 16, offset: 272)
!2819 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !2808, file: !2807, line: 39, baseType: !53, size: 16, offset: 288)
!2820 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !2808, file: !2807, line: 39, baseType: !53, size: 16, offset: 304)
!2821 = !DIDerivedType(tag: DW_TAG_member, name: "right_offset", scope: !2808, file: !2807, line: 40, baseType: !53, size: 16, offset: 320)
!2822 = !DIDerivedType(tag: DW_TAG_member, name: "redraw", scope: !2808, file: !2807, line: 41, baseType: !24, size: 8, offset: 336)
!2823 = !DIDerivedType(tag: DW_TAG_member, name: "saved_text", scope: !2808, file: !2807, line: 42, baseType: !2824, size: 408, offset: 344)
!2824 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 408, elements: !2825)
!2825 = !{!2826}
!2826 = !DISubrange(count: 51)
!2827 = !DILocation(line: 678, column: 15, scope: !2803)
!2828 = !DILocalVariable(name: "i", scope: !2803, file: !22, line: 679, type: !7)
!2829 = !DILocation(line: 679, column: 6, scope: !2803)
!2830 = !DILocation(line: 681, column: 9, scope: !2831)
!2831 = distinct !DILexicalBlock(scope: !2803, file: !22, line: 681, column: 2)
!2832 = !DILocation(line: 681, column: 7, scope: !2831)
!2833 = !DILocation(line: 681, column: 14, scope: !2834)
!2834 = distinct !DILexicalBlock(scope: !2831, file: !22, line: 681, column: 2)
!2835 = !DILocation(line: 681, column: 16, scope: !2834)
!2836 = !DILocation(line: 681, column: 2, scope: !2831)
!2837 = !DILocation(line: 683, column: 5, scope: !2838)
!2838 = distinct !DILexicalBlock(scope: !2834, file: !22, line: 682, column: 2)
!2839 = !DILocation(line: 683, column: 3, scope: !2838)
!2840 = !DILocation(line: 683, column: 8, scope: !2838)
!2841 = !DILocation(line: 683, column: 13, scope: !2838)
!2842 = !DILocation(line: 684, column: 20, scope: !2843)
!2843 = distinct !DILexicalBlock(scope: !2838, file: !22, line: 684, column: 7)
!2844 = !DILocation(line: 684, column: 7, scope: !2843)
!2845 = !DILocation(line: 684, column: 23, scope: !2843)
!2846 = !DILocation(line: 685, column: 6, scope: !2843)
!2847 = !DILocation(line: 685, column: 4, scope: !2843)
!2848 = !DILocation(line: 685, column: 9, scope: !2843)
!2849 = !DILocation(line: 685, column: 14, scope: !2843)
!2850 = !DILocation(line: 687, column: 23, scope: !2843)
!2851 = !DILocation(line: 687, column: 6, scope: !2843)
!2852 = !DILocation(line: 687, column: 4, scope: !2843)
!2853 = !DILocation(line: 687, column: 9, scope: !2843)
!2854 = !DILocation(line: 687, column: 14, scope: !2843)
!2855 = !DILocation(line: 688, column: 29, scope: !2838)
!2856 = !DILocation(line: 688, column: 16, scope: !2838)
!2857 = !DILocation(line: 688, column: 5, scope: !2838)
!2858 = !DILocation(line: 688, column: 3, scope: !2838)
!2859 = !DILocation(line: 688, column: 8, scope: !2838)
!2860 = !DILocation(line: 688, column: 14, scope: !2838)
!2861 = !DILocation(line: 689, column: 2, scope: !2838)
!2862 = !DILocation(line: 681, column: 44, scope: !2834)
!2863 = !DILocation(line: 681, column: 2, scope: !2834)
!2864 = distinct !{!2864, !2836, !2865, !1743}
!2865 = !DILocation(line: 689, column: 2, scope: !2831)
!2866 = !DILocation(line: 690, column: 17, scope: !2803)
!2867 = !DILocation(line: 691, column: 72, scope: !2803)
!2868 = !DILocation(line: 691, column: 75, scope: !2803)
!2869 = !DILocation(line: 691, column: 6, scope: !2803)
!2870 = !DILocation(line: 691, column: 4, scope: !2803)
!2871 = !DILocation(line: 692, column: 17, scope: !2803)
!2872 = !DILocation(line: 694, column: 9, scope: !2873)
!2873 = distinct !DILexicalBlock(scope: !2803, file: !22, line: 694, column: 2)
!2874 = !DILocation(line: 694, column: 7, scope: !2873)
!2875 = !DILocation(line: 694, column: 14, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2873, file: !22, line: 694, column: 2)
!2877 = !DILocation(line: 694, column: 16, scope: !2876)
!2878 = !DILocation(line: 694, column: 2, scope: !2873)
!2879 = !DILocation(line: 695, column: 23, scope: !2876)
!2880 = !DILocation(line: 695, column: 21, scope: !2876)
!2881 = !DILocation(line: 695, column: 26, scope: !2876)
!2882 = !DILocation(line: 695, column: 16, scope: !2876)
!2883 = !DILocation(line: 695, column: 3, scope: !2876)
!2884 = !DILocation(line: 695, column: 19, scope: !2876)
!2885 = !DILocation(line: 694, column: 44, scope: !2876)
!2886 = !DILocation(line: 694, column: 2, scope: !2876)
!2887 = distinct !{!2887, !2878, !2888, !1743}
!2888 = !DILocation(line: 695, column: 26, scope: !2873)
!2889 = !DILocation(line: 696, column: 1, scope: !2803)
!2890 = distinct !DISubprogram(name: "ReorderSecondary", linkageName: "_Z16ReorderSecondaryv", scope: !22, file: !22, line: 698, type: !879, scopeLine: 699, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2891 = !DILocalVariable(name: "m", scope: !2890, file: !22, line: 700, type: !2805)
!2892 = !DILocation(line: 700, column: 15, scope: !2890)
!2893 = !DILocalVariable(name: "i", scope: !2890, file: !22, line: 701, type: !7)
!2894 = !DILocation(line: 701, column: 6, scope: !2890)
!2895 = !DILocation(line: 703, column: 9, scope: !2896)
!2896 = distinct !DILexicalBlock(scope: !2890, file: !22, line: 703, column: 2)
!2897 = !DILocation(line: 703, column: 7, scope: !2896)
!2898 = !DILocation(line: 703, column: 14, scope: !2899)
!2899 = distinct !DILexicalBlock(scope: !2896, file: !22, line: 703, column: 2)
!2900 = !DILocation(line: 703, column: 16, scope: !2899)
!2901 = !DILocation(line: 703, column: 2, scope: !2896)
!2902 = !DILocation(line: 705, column: 5, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2899, file: !22, line: 704, column: 2)
!2904 = !DILocation(line: 705, column: 3, scope: !2903)
!2905 = !DILocation(line: 705, column: 8, scope: !2903)
!2906 = !DILocation(line: 705, column: 13, scope: !2903)
!2907 = !DILocation(line: 706, column: 22, scope: !2908)
!2908 = distinct !DILexicalBlock(scope: !2903, file: !22, line: 706, column: 7)
!2909 = !DILocation(line: 706, column: 7, scope: !2908)
!2910 = !DILocation(line: 706, column: 25, scope: !2908)
!2911 = !DILocation(line: 707, column: 6, scope: !2908)
!2912 = !DILocation(line: 707, column: 4, scope: !2908)
!2913 = !DILocation(line: 707, column: 9, scope: !2908)
!2914 = !DILocation(line: 707, column: 14, scope: !2908)
!2915 = !DILocation(line: 709, column: 23, scope: !2908)
!2916 = !DILocation(line: 709, column: 6, scope: !2908)
!2917 = !DILocation(line: 709, column: 4, scope: !2908)
!2918 = !DILocation(line: 709, column: 9, scope: !2908)
!2919 = !DILocation(line: 709, column: 14, scope: !2908)
!2920 = !DILocation(line: 710, column: 31, scope: !2903)
!2921 = !DILocation(line: 710, column: 16, scope: !2903)
!2922 = !DILocation(line: 710, column: 5, scope: !2903)
!2923 = !DILocation(line: 710, column: 3, scope: !2903)
!2924 = !DILocation(line: 710, column: 8, scope: !2903)
!2925 = !DILocation(line: 710, column: 14, scope: !2903)
!2926 = !DILocation(line: 711, column: 2, scope: !2903)
!2927 = !DILocation(line: 703, column: 46, scope: !2899)
!2928 = !DILocation(line: 703, column: 2, scope: !2899)
!2929 = distinct !{!2929, !2901, !2930, !1743}
!2930 = !DILocation(line: 711, column: 2, scope: !2896)
!2931 = !DILocation(line: 712, column: 17, scope: !2890)
!2932 = !DILocation(line: 713, column: 74, scope: !2890)
!2933 = !DILocation(line: 713, column: 77, scope: !2890)
!2934 = !DILocation(line: 713, column: 6, scope: !2890)
!2935 = !DILocation(line: 713, column: 4, scope: !2890)
!2936 = !DILocation(line: 714, column: 17, scope: !2890)
!2937 = !DILocation(line: 715, column: 9, scope: !2938)
!2938 = distinct !DILexicalBlock(scope: !2890, file: !22, line: 715, column: 2)
!2939 = !DILocation(line: 715, column: 7, scope: !2938)
!2940 = !DILocation(line: 715, column: 14, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2938, file: !22, line: 715, column: 2)
!2942 = !DILocation(line: 715, column: 16, scope: !2941)
!2943 = !DILocation(line: 715, column: 2, scope: !2938)
!2944 = !DILocation(line: 716, column: 25, scope: !2941)
!2945 = !DILocation(line: 716, column: 23, scope: !2941)
!2946 = !DILocation(line: 716, column: 28, scope: !2941)
!2947 = !DILocation(line: 716, column: 18, scope: !2941)
!2948 = !DILocation(line: 716, column: 3, scope: !2941)
!2949 = !DILocation(line: 716, column: 21, scope: !2941)
!2950 = !DILocation(line: 715, column: 46, scope: !2941)
!2951 = !DILocation(line: 715, column: 2, scope: !2941)
!2952 = distinct !{!2952, !2943, !2953, !1743}
!2953 = !DILocation(line: 716, column: 28, scope: !2938)
!2954 = !DILocation(line: 717, column: 1, scope: !2890)
!2955 = distinct !DISubprogram(name: "pick_up_primary", linkageName: "_Z15pick_up_primaryi", scope: !22, file: !22, line: 759, type: !385, scopeLine: 760, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!2956 = !DILocalVariable(name: "weapon_index", arg: 1, scope: !2955, file: !22, line: 759, type: !7)
!2957 = !DILocation(line: 759, column: 25, scope: !2955)
!2958 = !DILocalVariable(name: "flag", scope: !2955, file: !22, line: 762, type: !86)
!2959 = !DILocation(line: 762, column: 11, scope: !2955)
!2960 = !DILocation(line: 762, column: 23, scope: !2955)
!2961 = !DILocation(line: 762, column: 20, scope: !2955)
!2962 = !DILocation(line: 762, column: 18, scope: !2955)
!2963 = !DILocalVariable(name: "cutpoint", scope: !2955, file: !22, line: 763, type: !7)
!2964 = !DILocation(line: 763, column: 6, scope: !2955)
!2965 = !DILocalVariable(name: "supposed_weapon", scope: !2955, file: !22, line: 764, type: !7)
!2966 = !DILocation(line: 764, column: 6, scope: !2955)
!2967 = !DILocation(line: 764, column: 24, scope: !2955)
!2968 = !DILocation(line: 766, column: 6, scope: !2969)
!2969 = distinct !DILexicalBlock(scope: !2955, file: !22, line: 766, column: 6)
!2970 = !DILocation(line: 766, column: 19, scope: !2969)
!2971 = !DILocation(line: 766, column: 34, scope: !2969)
!2972 = !DILocation(line: 766, column: 45, scope: !2969)
!2973 = !DILocation(line: 766, column: 37, scope: !2969)
!2974 = !DILocation(line: 766, column: 57, scope: !2969)
!2975 = !DILocation(line: 766, column: 80, scope: !2969)
!2976 = !DILocation(line: 766, column: 78, scope: !2969)
!2977 = !DILocation(line: 768, column: 30, scope: !2978)
!2978 = distinct !DILexicalBlock(scope: !2969, file: !22, line: 767, column: 2)
!2979 = !DILocation(line: 768, column: 52, scope: !2978)
!2980 = !DILocation(line: 768, column: 3, scope: !2978)
!2981 = !DILocation(line: 769, column: 3, scope: !2978)
!2982 = !DILocation(line: 772, column: 46, scope: !2955)
!2983 = !DILocation(line: 772, column: 10, scope: !2955)
!2984 = !DILocation(line: 772, column: 2, scope: !2955)
!2985 = !DILocation(line: 772, column: 22, scope: !2955)
!2986 = !DILocation(line: 772, column: 43, scope: !2955)
!2987 = !DILocation(line: 774, column: 13, scope: !2955)
!2988 = !DILocation(line: 774, column: 11, scope: !2955)
!2989 = !DILocation(line: 776, column: 6, scope: !2990)
!2990 = distinct !DILexicalBlock(scope: !2955, file: !22, line: 776, column: 6)
!2991 = !DILocation(line: 776, column: 21, scope: !2990)
!2992 = !DILocation(line: 776, column: 36, scope: !2990)
!2993 = !DILocation(line: 776, column: 47, scope: !2990)
!2994 = !DILocation(line: 776, column: 39, scope: !2990)
!2995 = !DILocation(line: 776, column: 59, scope: !2990)
!2996 = !DILocation(line: 776, column: 71, scope: !2990)
!2997 = !DILocation(line: 777, column: 19, scope: !2990)
!2998 = !DILocation(line: 777, column: 3, scope: !2990)
!2999 = !DILocation(line: 779, column: 17, scope: !3000)
!3000 = distinct !DILexicalBlock(scope: !2955, file: !22, line: 779, column: 6)
!3001 = !DILocation(line: 779, column: 6, scope: !3000)
!3002 = !DILocation(line: 779, column: 33, scope: !3000)
!3003 = !DILocation(line: 779, column: 31, scope: !3000)
!3004 = !DILocation(line: 779, column: 42, scope: !3000)
!3005 = !DILocation(line: 779, column: 56, scope: !3000)
!3006 = !DILocation(line: 779, column: 45, scope: !3000)
!3007 = !DILocation(line: 779, column: 83, scope: !3000)
!3008 = !DILocation(line: 779, column: 72, scope: !3000)
!3009 = !DILocation(line: 779, column: 70, scope: !3000)
!3010 = !DILocation(line: 780, column: 17, scope: !3000)
!3011 = !DILocation(line: 780, column: 3, scope: !3000)
!3012 = !DILocation(line: 782, column: 2, scope: !2955)
!3013 = !DILocation(line: 783, column: 2, scope: !2955)
!3014 = !DILocation(line: 785, column: 6, scope: !3015)
!3015 = distinct !DILexicalBlock(scope: !2955, file: !22, line: 785, column: 6)
!3016 = !DILocation(line: 785, column: 19, scope: !3015)
!3017 = !DILocation(line: 786, column: 27, scope: !3015)
!3018 = !DILocation(line: 786, column: 3, scope: !3015)
!3019 = !DILocation(line: 788, column: 2, scope: !2955)
!3020 = !DILocation(line: 789, column: 1, scope: !2955)
!3021 = distinct !DISubprogram(name: "check_to_use_primary", linkageName: "_Z20check_to_use_primaryi", scope: !22, file: !22, line: 790, type: !385, scopeLine: 791, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3022 = !DILocalVariable(name: "weapon_index", arg: 1, scope: !3021, file: !22, line: 790, type: !7)
!3023 = !DILocation(line: 790, column: 30, scope: !3021)
!3024 = !DILocalVariable(name: "old_flags", scope: !3021, file: !22, line: 792, type: !86)
!3025 = !DILocation(line: 792, column: 11, scope: !3021)
!3026 = !DILocation(line: 792, column: 31, scope: !3021)
!3027 = !DILocation(line: 792, column: 23, scope: !3021)
!3028 = !DILocation(line: 792, column: 43, scope: !3021)
!3029 = !DILocalVariable(name: "flag", scope: !3021, file: !22, line: 793, type: !86)
!3030 = !DILocation(line: 793, column: 11, scope: !3021)
!3031 = !DILocation(line: 793, column: 23, scope: !3021)
!3032 = !DILocation(line: 793, column: 20, scope: !3021)
!3033 = !DILocation(line: 793, column: 18, scope: !3021)
!3034 = !DILocalVariable(name: "cutpoint", scope: !3021, file: !22, line: 794, type: !7)
!3035 = !DILocation(line: 794, column: 6, scope: !3021)
!3036 = !DILocation(line: 796, column: 13, scope: !3021)
!3037 = !DILocation(line: 796, column: 11, scope: !3021)
!3038 = !DILocation(line: 798, column: 8, scope: !3039)
!3039 = distinct !DILexicalBlock(scope: !3021, file: !22, line: 798, column: 6)
!3040 = !DILocation(line: 798, column: 20, scope: !3039)
!3041 = !DILocation(line: 798, column: 18, scope: !3039)
!3042 = !DILocation(line: 798, column: 7, scope: !3039)
!3043 = !DILocation(line: 798, column: 26, scope: !3039)
!3044 = !DILocation(line: 798, column: 40, scope: !3039)
!3045 = !DILocation(line: 798, column: 29, scope: !3039)
!3046 = !DILocation(line: 798, column: 56, scope: !3039)
!3047 = !DILocation(line: 798, column: 54, scope: !3039)
!3048 = !DILocation(line: 798, column: 65, scope: !3039)
!3049 = !DILocation(line: 798, column: 79, scope: !3039)
!3050 = !DILocation(line: 798, column: 68, scope: !3039)
!3051 = !DILocation(line: 798, column: 106, scope: !3039)
!3052 = !DILocation(line: 798, column: 95, scope: !3039)
!3053 = !DILocation(line: 798, column: 93, scope: !3039)
!3054 = !DILocation(line: 799, column: 7, scope: !3055)
!3055 = distinct !DILexicalBlock(scope: !3039, file: !22, line: 799, column: 7)
!3056 = !DILocation(line: 799, column: 20, scope: !3055)
!3057 = !DILocation(line: 800, column: 4, scope: !3055)
!3058 = !DILocation(line: 802, column: 18, scope: !3055)
!3059 = !DILocation(line: 802, column: 4, scope: !3055)
!3060 = !DILocation(line: 799, column: 23, scope: !3055)
!3061 = !DILocation(line: 804, column: 2, scope: !3021)
!3062 = !DILocation(line: 806, column: 2, scope: !3021)
!3063 = distinct !DISubprogram(name: "pick_up_ammo", linkageName: "_Z12pick_up_ammoiii", scope: !22, file: !22, line: 811, type: !3064, scopeLine: 812, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3064 = !DISubroutineType(types: !3065)
!3065 = !{!7, !7, !7, !7}
!3066 = !DILocalVariable(name: "class_flag", arg: 1, scope: !3063, file: !22, line: 811, type: !7)
!3067 = !DILocation(line: 811, column: 22, scope: !3063)
!3068 = !DILocalVariable(name: "weapon_index", arg: 2, scope: !3063, file: !22, line: 811, type: !7)
!3069 = !DILocation(line: 811, column: 38, scope: !3063)
!3070 = !DILocalVariable(name: "ammo_count", arg: 3, scope: !3063, file: !22, line: 811, type: !7)
!3071 = !DILocation(line: 811, column: 56, scope: !3063)
!3072 = !DILocalVariable(name: "max", scope: !3063, file: !22, line: 813, type: !7)
!3073 = !DILocation(line: 813, column: 6, scope: !3063)
!3074 = !DILocalVariable(name: "cutpoint", scope: !3063, file: !22, line: 813, type: !7)
!3075 = !DILocation(line: 813, column: 11, scope: !3063)
!3076 = !DILocalVariable(name: "supposed_weapon", scope: !3063, file: !22, line: 813, type: !7)
!3077 = !DILocation(line: 813, column: 21, scope: !3063)
!3078 = !DILocation(line: 813, column: 39, scope: !3063)
!3079 = !DILocalVariable(name: "old_ammo", scope: !3063, file: !22, line: 814, type: !7)
!3080 = !DILocation(line: 814, column: 6, scope: !3063)
!3081 = !DILocation(line: 814, column: 17, scope: !3063)
!3082 = !DILocation(line: 816, column: 2, scope: !3063)
!3083 = !DILocation(line: 0, scope: !3063)
!3084 = !DILocation(line: 818, column: 25, scope: !3063)
!3085 = !DILocation(line: 818, column: 8, scope: !3063)
!3086 = !DILocation(line: 818, column: 6, scope: !3063)
!3087 = !DILocation(line: 819, column: 14, scope: !3088)
!3088 = distinct !DILexicalBlock(scope: !3063, file: !22, line: 819, column: 6)
!3089 = !DILocation(line: 819, column: 6, scope: !3088)
!3090 = !DILocation(line: 819, column: 26, scope: !3088)
!3091 = !DILocation(line: 819, column: 32, scope: !3088)
!3092 = !DILocation(line: 820, column: 7, scope: !3088)
!3093 = !DILocation(line: 820, column: 3, scope: !3088)
!3094 = !DILocation(line: 822, column: 14, scope: !3095)
!3095 = distinct !DILexicalBlock(scope: !3063, file: !22, line: 822, column: 6)
!3096 = !DILocation(line: 822, column: 6, scope: !3095)
!3097 = !DILocation(line: 822, column: 26, scope: !3095)
!3098 = !DILocation(line: 822, column: 39, scope: !3095)
!3099 = !DILocation(line: 822, column: 56, scope: !3095)
!3100 = !DILocation(line: 822, column: 53, scope: !3095)
!3101 = !DILocation(line: 823, column: 3, scope: !3095)
!3102 = !DILocation(line: 825, column: 21, scope: !3063)
!3103 = !DILocation(line: 825, column: 13, scope: !3063)
!3104 = !DILocation(line: 825, column: 33, scope: !3063)
!3105 = !DILocation(line: 825, column: 46, scope: !3063)
!3106 = !DILocation(line: 825, column: 11, scope: !3063)
!3107 = !DILocation(line: 827, column: 52, scope: !3063)
!3108 = !DILocation(line: 827, column: 10, scope: !3063)
!3109 = !DILocation(line: 827, column: 2, scope: !3063)
!3110 = !DILocation(line: 827, column: 22, scope: !3063)
!3111 = !DILocation(line: 827, column: 35, scope: !3063)
!3112 = !DILocation(line: 827, column: 49, scope: !3063)
!3113 = !DILocation(line: 829, column: 14, scope: !3114)
!3114 = distinct !DILexicalBlock(scope: !3063, file: !22, line: 829, column: 6)
!3115 = !DILocation(line: 829, column: 6, scope: !3114)
!3116 = !DILocation(line: 829, column: 26, scope: !3114)
!3117 = !DILocation(line: 829, column: 39, scope: !3114)
!3118 = !DILocation(line: 829, column: 55, scope: !3114)
!3119 = !DILocation(line: 829, column: 53, scope: !3114)
!3120 = !DILocation(line: 831, column: 18, scope: !3121)
!3121 = distinct !DILexicalBlock(scope: !3114, file: !22, line: 830, column: 2)
!3122 = !DILocation(line: 831, column: 32, scope: !3121)
!3123 = !DILocation(line: 831, column: 24, scope: !3121)
!3124 = !DILocation(line: 831, column: 44, scope: !3121)
!3125 = !DILocation(line: 831, column: 57, scope: !3121)
!3126 = !DILocation(line: 831, column: 22, scope: !3121)
!3127 = !DILocation(line: 831, column: 14, scope: !3121)
!3128 = !DILocation(line: 832, column: 52, scope: !3121)
!3129 = !DILocation(line: 832, column: 11, scope: !3121)
!3130 = !DILocation(line: 832, column: 3, scope: !3121)
!3131 = !DILocation(line: 832, column: 23, scope: !3121)
!3132 = !DILocation(line: 832, column: 36, scope: !3121)
!3133 = !DILocation(line: 832, column: 50, scope: !3121)
!3134 = !DILocation(line: 833, column: 2, scope: !3121)
!3135 = !DILocation(line: 834, column: 13, scope: !3063)
!3136 = !DILocation(line: 834, column: 11, scope: !3063)
!3137 = !DILocation(line: 836, column: 6, scope: !3138)
!3138 = distinct !DILexicalBlock(scope: !3063, file: !22, line: 836, column: 6)
!3139 = !DILocation(line: 836, column: 21, scope: !3138)
!3140 = !DILocation(line: 836, column: 36, scope: !3138)
!3141 = !DILocation(line: 836, column: 47, scope: !3138)
!3142 = !DILocation(line: 836, column: 39, scope: !3138)
!3143 = !DILocation(line: 836, column: 59, scope: !3138)
!3144 = !DILocation(line: 836, column: 71, scope: !3138)
!3145 = !DILocation(line: 837, column: 19, scope: !3138)
!3146 = !DILocation(line: 837, column: 3, scope: !3138)
!3147 = !DILocation(line: 839, column: 14, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3063, file: !22, line: 839, column: 6)
!3149 = !DILocation(line: 839, column: 6, scope: !3148)
!3150 = !DILocation(line: 839, column: 26, scope: !3148)
!3151 = !DILocation(line: 839, column: 55, scope: !3148)
!3152 = !DILocation(line: 839, column: 52, scope: !3148)
!3153 = !DILocation(line: 839, column: 47, scope: !3148)
!3154 = !DILocation(line: 839, column: 69, scope: !3148)
!3155 = !DILocation(line: 839, column: 72, scope: !3148)
!3156 = !DILocation(line: 839, column: 87, scope: !3148)
!3157 = !DILocation(line: 839, column: 85, scope: !3148)
!3158 = !DILocation(line: 839, column: 102, scope: !3148)
!3159 = !DILocation(line: 839, column: 105, scope: !3148)
!3160 = !DILocation(line: 839, column: 114, scope: !3148)
!3161 = !DILocation(line: 839, column: 119, scope: !3148)
!3162 = !DILocation(line: 840, column: 14, scope: !3148)
!3163 = !DILocation(line: 840, column: 3, scope: !3148)
!3164 = !DILocation(line: 840, column: 30, scope: !3148)
!3165 = !DILocation(line: 840, column: 28, scope: !3148)
!3166 = !DILocation(line: 840, column: 39, scope: !3148)
!3167 = !DILocation(line: 840, column: 53, scope: !3148)
!3168 = !DILocation(line: 840, column: 42, scope: !3148)
!3169 = !DILocation(line: 840, column: 80, scope: !3148)
!3170 = !DILocation(line: 840, column: 69, scope: !3148)
!3171 = !DILocation(line: 840, column: 67, scope: !3148)
!3172 = !DILocation(line: 841, column: 17, scope: !3148)
!3173 = !DILocation(line: 841, column: 3, scope: !3148)
!3174 = !DILocation(line: 843, column: 9, scope: !3063)
!3175 = !DILocation(line: 843, column: 2, scope: !3063)
!3176 = !DILocation(line: 844, column: 1, scope: !3063)
!3177 = distinct !DISubprogram(name: "init_smega_detonates", linkageName: "_Z20init_smega_detonatesv", scope: !22, file: !22, line: 852, type: !879, scopeLine: 853, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3178 = !DILocalVariable(name: "i", scope: !3177, file: !22, line: 854, type: !7)
!3179 = !DILocation(line: 854, column: 6, scope: !3177)
!3180 = !DILocation(line: 856, column: 9, scope: !3181)
!3181 = distinct !DILexicalBlock(scope: !3177, file: !22, line: 856, column: 2)
!3182 = !DILocation(line: 856, column: 7, scope: !3181)
!3183 = !DILocation(line: 856, column: 14, scope: !3184)
!3184 = distinct !DILexicalBlock(scope: !3181, file: !22, line: 856, column: 2)
!3185 = !DILocation(line: 856, column: 16, scope: !3184)
!3186 = !DILocation(line: 856, column: 2, scope: !3181)
!3187 = !DILocation(line: 857, column: 24, scope: !3184)
!3188 = !DILocation(line: 857, column: 3, scope: !3184)
!3189 = !DILocation(line: 857, column: 27, scope: !3184)
!3190 = !DILocation(line: 856, column: 40, scope: !3184)
!3191 = !DILocation(line: 856, column: 2, scope: !3184)
!3192 = distinct !{!3192, !3186, !3193, !1743}
!3193 = !DILocation(line: 857, column: 29, scope: !3181)
!3194 = !DILocation(line: 858, column: 1, scope: !3177)
!3195 = distinct !DISubprogram(name: "rock_the_mine_frame", linkageName: "_Z19rock_the_mine_framev", scope: !22, file: !22, line: 870, type: !879, scopeLine: 871, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3196 = !DILocalVariable(name: "i", scope: !3195, file: !22, line: 872, type: !7)
!3197 = !DILocation(line: 872, column: 6, scope: !3195)
!3198 = !DILocation(line: 874, column: 9, scope: !3199)
!3199 = distinct !DILexicalBlock(scope: !3195, file: !22, line: 874, column: 2)
!3200 = !DILocation(line: 874, column: 7, scope: !3199)
!3201 = !DILocation(line: 874, column: 14, scope: !3202)
!3202 = distinct !DILexicalBlock(scope: !3199, file: !22, line: 874, column: 2)
!3203 = !DILocation(line: 874, column: 16, scope: !3202)
!3204 = !DILocation(line: 874, column: 2, scope: !3199)
!3205 = !DILocation(line: 876, column: 28, scope: !3206)
!3206 = distinct !DILexicalBlock(scope: !3207, file: !22, line: 876, column: 7)
!3207 = distinct !DILexicalBlock(scope: !3202, file: !22, line: 875, column: 2)
!3208 = !DILocation(line: 876, column: 7, scope: !3206)
!3209 = !DILocation(line: 876, column: 31, scope: !3206)
!3210 = !DILocalVariable(name: "delta_time", scope: !3211, file: !22, line: 878, type: !74)
!3211 = distinct !DILexicalBlock(scope: !3206, file: !22, line: 877, column: 3)
!3212 = !DILocation(line: 878, column: 8, scope: !3211)
!3213 = !DILocation(line: 879, column: 17, scope: !3211)
!3214 = !DILocation(line: 879, column: 49, scope: !3211)
!3215 = !DILocation(line: 879, column: 28, scope: !3211)
!3216 = !DILocation(line: 879, column: 26, scope: !3211)
!3217 = !DILocation(line: 879, column: 15, scope: !3211)
!3218 = !DILocation(line: 881, column: 9, scope: !3219)
!3219 = distinct !DILexicalBlock(scope: !3211, file: !22, line: 881, column: 8)
!3220 = !DILocation(line: 881, column: 8, scope: !3219)
!3221 = !DILocation(line: 883, column: 30, scope: !3222)
!3222 = distinct !DILexicalBlock(scope: !3219, file: !22, line: 882, column: 4)
!3223 = !DILocation(line: 883, column: 5, scope: !3222)
!3224 = !DILocation(line: 884, column: 27, scope: !3222)
!3225 = !DILocation(line: 885, column: 31, scope: !3222)
!3226 = !DILocation(line: 885, column: 42, scope: !3222)
!3227 = !DILocation(line: 885, column: 51, scope: !3222)
!3228 = !DILocation(line: 885, column: 40, scope: !3222)
!3229 = !DILocation(line: 885, column: 29, scope: !3222)
!3230 = !DILocation(line: 886, column: 4, scope: !3222)
!3231 = !DILocation(line: 888, column: 8, scope: !3232)
!3232 = distinct !DILexicalBlock(scope: !3211, file: !22, line: 888, column: 8)
!3233 = !DILocation(line: 888, column: 19, scope: !3232)
!3234 = !DILocalVariable(name: "fc", scope: !3235, file: !22, line: 891, type: !7)
!3235 = distinct !DILexicalBlock(scope: !3232, file: !22, line: 889, column: 4)
!3236 = !DILocation(line: 891, column: 9, scope: !3235)
!3237 = !DILocalVariable(name: "rx", scope: !3235, file: !22, line: 891, type: !7)
!3238 = !DILocation(line: 891, column: 13, scope: !3235)
!3239 = !DILocalVariable(name: "rz", scope: !3235, file: !22, line: 891, type: !7)
!3240 = !DILocation(line: 891, column: 17, scope: !3235)
!3241 = !DILocation(line: 894, column: 30, scope: !3235)
!3242 = !DILocation(line: 894, column: 28, scope: !3235)
!3243 = !DILocation(line: 894, column: 42, scope: !3235)
!3244 = !DILocation(line: 894, column: 8, scope: !3235)
!3245 = !DILocation(line: 895, column: 8, scope: !3235)
!3246 = !DILocation(line: 896, column: 9, scope: !3247)
!3247 = distinct !DILexicalBlock(scope: !3235, file: !22, line: 896, column: 9)
!3248 = !DILocation(line: 896, column: 12, scope: !3247)
!3249 = !DILocation(line: 897, column: 9, scope: !3247)
!3250 = !DILocation(line: 897, column: 6, scope: !3247)
!3251 = !DILocation(line: 899, column: 9, scope: !3252)
!3252 = distinct !DILexicalBlock(scope: !3235, file: !22, line: 899, column: 9)
!3253 = !DILocation(line: 899, column: 12, scope: !3252)
!3254 = !DILocation(line: 900, column: 9, scope: !3252)
!3255 = !DILocation(line: 900, column: 6, scope: !3252)
!3256 = !DILocation(line: 902, column: 30, scope: !3235)
!3257 = !DILocation(line: 902, column: 27, scope: !3235)
!3258 = !DILocation(line: 904, column: 17, scope: !3235)
!3259 = !DILocation(line: 904, column: 26, scope: !3235)
!3260 = !DILocation(line: 904, column: 65, scope: !3235)
!3261 = !DILocation(line: 904, column: 63, scope: !3235)
!3262 = !DILocation(line: 904, column: 57, scope: !3235)
!3263 = !DILocation(line: 904, column: 70, scope: !3235)
!3264 = !DILocation(line: 904, column: 49, scope: !3235)
!3265 = !DILocation(line: 904, column: 10, scope: !3235)
!3266 = !DILocation(line: 904, column: 8, scope: !3235)
!3267 = !DILocation(line: 905, column: 17, scope: !3235)
!3268 = !DILocation(line: 905, column: 26, scope: !3235)
!3269 = !DILocation(line: 905, column: 65, scope: !3235)
!3270 = !DILocation(line: 905, column: 63, scope: !3235)
!3271 = !DILocation(line: 905, column: 57, scope: !3235)
!3272 = !DILocation(line: 905, column: 70, scope: !3235)
!3273 = !DILocation(line: 905, column: 49, scope: !3235)
!3274 = !DILocation(line: 905, column: 10, scope: !3235)
!3275 = !DILocation(line: 905, column: 8, scope: !3235)
!3276 = !DILocation(line: 907, column: 48, scope: !3235)
!3277 = !DILocation(line: 907, column: 5, scope: !3235)
!3278 = !DILocation(line: 907, column: 20, scope: !3235)
!3279 = !DILocation(line: 907, column: 36, scope: !3235)
!3280 = !DILocation(line: 907, column: 43, scope: !3235)
!3281 = !DILocation(line: 907, column: 45, scope: !3235)
!3282 = !DILocation(line: 908, column: 48, scope: !3235)
!3283 = !DILocation(line: 908, column: 5, scope: !3235)
!3284 = !DILocation(line: 908, column: 20, scope: !3235)
!3285 = !DILocation(line: 908, column: 36, scope: !3235)
!3286 = !DILocation(line: 908, column: 43, scope: !3235)
!3287 = !DILocation(line: 908, column: 45, scope: !3235)
!3288 = !DILocation(line: 911, column: 9, scope: !3289)
!3289 = distinct !DILexicalBlock(scope: !3235, file: !22, line: 911, column: 9)
!3290 = !DILocation(line: 911, column: 22, scope: !3289)
!3291 = !DILocation(line: 913, column: 56, scope: !3292)
!3292 = distinct !DILexicalBlock(scope: !3289, file: !22, line: 912, column: 5)
!3293 = !DILocation(line: 913, column: 59, scope: !3292)
!3294 = !DILocation(line: 913, column: 14, scope: !3292)
!3295 = !DILocation(line: 913, column: 6, scope: !3292)
!3296 = !DILocation(line: 913, column: 28, scope: !3292)
!3297 = !DILocation(line: 913, column: 44, scope: !3292)
!3298 = !DILocation(line: 913, column: 51, scope: !3292)
!3299 = !DILocation(line: 913, column: 53, scope: !3292)
!3300 = !DILocation(line: 914, column: 56, scope: !3292)
!3301 = !DILocation(line: 914, column: 59, scope: !3292)
!3302 = !DILocation(line: 914, column: 14, scope: !3292)
!3303 = !DILocation(line: 914, column: 6, scope: !3292)
!3304 = !DILocation(line: 914, column: 28, scope: !3292)
!3305 = !DILocation(line: 914, column: 44, scope: !3292)
!3306 = !DILocation(line: 914, column: 51, scope: !3292)
!3307 = !DILocation(line: 914, column: 53, scope: !3292)
!3308 = !DILocation(line: 915, column: 5, scope: !3292)
!3309 = !DILocation(line: 918, column: 33, scope: !3235)
!3310 = !DILocation(line: 918, column: 30, scope: !3235)
!3311 = !DILocation(line: 920, column: 4, scope: !3235)
!3312 = !DILocation(line: 922, column: 26, scope: !3232)
!3313 = !DILocation(line: 922, column: 5, scope: !3232)
!3314 = !DILocation(line: 922, column: 29, scope: !3232)
!3315 = !DILocation(line: 923, column: 3, scope: !3211)
!3316 = !DILocation(line: 924, column: 2, scope: !3207)
!3317 = !DILocation(line: 874, column: 40, scope: !3202)
!3318 = !DILocation(line: 874, column: 2, scope: !3202)
!3319 = distinct !{!3319, !3204, !3320, !1743}
!3320 = !DILocation(line: 924, column: 2, scope: !3199)
!3321 = !DILocation(line: 926, column: 1, scope: !3195)
!3322 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !75, file: !75, line: 83, type: !3323, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3323 = !DISubroutineType(types: !3324)
!3324 = !{!74, !74, !74}
!3325 = !DILocalVariable(name: "a", arg: 1, scope: !3322, file: !75, line: 83, type: !74)
!3326 = !DILocation(line: 83, column: 26, scope: !3322)
!3327 = !DILocalVariable(name: "b", arg: 2, scope: !3322, file: !75, line: 83, type: !74)
!3328 = !DILocation(line: 83, column: 33, scope: !3322)
!3329 = !DILocation(line: 85, column: 19, scope: !3322)
!3330 = !DILocation(line: 85, column: 32, scope: !3322)
!3331 = !DILocation(line: 85, column: 21, scope: !3322)
!3332 = !DILocation(line: 85, column: 35, scope: !3322)
!3333 = !DILocation(line: 85, column: 9, scope: !3322)
!3334 = !DILocation(line: 85, column: 2, scope: !3322)
!3335 = distinct !DISubprogram(name: "on_seismic_level", linkageName: "_Z16on_seismic_levelv", scope: !22, file: !22, line: 936, type: !853, scopeLine: 937, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!3336 = !DILocation(line: 938, column: 9, scope: !3335)
!3337 = !DILocation(line: 938, column: 2, scope: !3335)
!3338 = distinct !DISubprogram(name: "init_seismic_disturbances", linkageName: "_Z25init_seismic_disturbancesv", scope: !22, file: !22, line: 941, type: !879, scopeLine: 942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!3339 = !DILocation(line: 943, column: 33, scope: !3338)
!3340 = !DILocation(line: 944, column: 31, scope: !3338)
!3341 = !DILocation(line: 945, column: 1, scope: !3338)
!3342 = distinct !DISubprogram(name: "start_seismic_disturbance", linkageName: "_Z25start_seismic_disturbancev", scope: !22, file: !22, line: 948, type: !853, scopeLine: 949, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3343 = !DILocalVariable(name: "rval", scope: !3342, file: !22, line: 950, type: !7)
!3344 = !DILocation(line: 950, column: 6, scope: !3342)
!3345 = !DILocation(line: 952, column: 6, scope: !3346)
!3346 = distinct !DILexicalBlock(scope: !3342, file: !22, line: 952, column: 6)
!3347 = !DILocation(line: 952, column: 27, scope: !3346)
!3348 = !DILocation(line: 953, column: 3, scope: !3346)
!3349 = !DILocation(line: 955, column: 21, scope: !3342)
!3350 = !DILocation(line: 955, column: 31, scope: !3342)
!3351 = !DILocation(line: 955, column: 14, scope: !3342)
!3352 = !DILocation(line: 955, column: 12, scope: !3342)
!3353 = !DILocation(line: 955, column: 57, scope: !3342)
!3354 = !DILocation(line: 955, column: 55, scope: !3342)
!3355 = !DILocation(line: 955, column: 9, scope: !3342)
!3356 = !DILocation(line: 955, column: 7, scope: !3342)
!3357 = !DILocation(line: 957, column: 6, scope: !3358)
!3358 = distinct !DILexicalBlock(scope: !3342, file: !22, line: 957, column: 6)
!3359 = !DILocation(line: 958, column: 36, scope: !3360)
!3360 = distinct !DILexicalBlock(scope: !3358, file: !22, line: 957, column: 12)
!3361 = !DILocation(line: 958, column: 34, scope: !3360)
!3362 = !DILocation(line: 959, column: 34, scope: !3360)
!3363 = !DILocation(line: 959, column: 45, scope: !3360)
!3364 = !DILocation(line: 959, column: 43, scope: !3360)
!3365 = !DILocation(line: 959, column: 32, scope: !3360)
!3366 = !DILocation(line: 960, column: 8, scope: !3367)
!3367 = distinct !DILexicalBlock(scope: !3360, file: !22, line: 960, column: 7)
!3368 = !DILocation(line: 960, column: 7, scope: !3367)
!3369 = !DILocation(line: 961, column: 29, scope: !3370)
!3370 = distinct !DILexicalBlock(scope: !3367, file: !22, line: 960, column: 31)
!3371 = !DILocation(line: 961, column: 4, scope: !3370)
!3372 = !DILocation(line: 962, column: 26, scope: !3370)
!3373 = !DILocation(line: 963, column: 30, scope: !3370)
!3374 = !DILocation(line: 963, column: 41, scope: !3370)
!3375 = !DILocation(line: 963, column: 50, scope: !3370)
!3376 = !DILocation(line: 963, column: 39, scope: !3370)
!3377 = !DILocation(line: 963, column: 28, scope: !3370)
!3378 = !DILocation(line: 964, column: 3, scope: !3370)
!3379 = !DILocation(line: 969, column: 2, scope: !3360)
!3380 = !DILocation(line: 971, column: 9, scope: !3342)
!3381 = !DILocation(line: 971, column: 2, scope: !3342)
!3382 = !DILocation(line: 972, column: 1, scope: !3342)
!3383 = distinct !DISubprogram(name: "seismic_disturbance_frame", linkageName: "_Z25seismic_disturbance_framev", scope: !22, file: !22, line: 974, type: !879, scopeLine: 975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3384 = !DILocation(line: 976, column: 6, scope: !3385)
!3385 = distinct !DILexicalBlock(scope: !3383, file: !22, line: 976, column: 6)
!3386 = !DILocation(line: 978, column: 9, scope: !3387)
!3387 = distinct !DILexicalBlock(scope: !3388, file: !22, line: 978, column: 7)
!3388 = distinct !DILexicalBlock(scope: !3385, file: !22, line: 977, column: 2)
!3389 = !DILocation(line: 978, column: 42, scope: !3387)
!3390 = !DILocation(line: 978, column: 40, scope: !3387)
!3391 = !DILocation(line: 978, column: 52, scope: !3387)
!3392 = !DILocation(line: 978, column: 56, scope: !3387)
!3393 = !DILocation(line: 978, column: 87, scope: !3387)
!3394 = !DILocation(line: 978, column: 85, scope: !3387)
!3395 = !DILocation(line: 978, column: 98, scope: !3387)
!3396 = !DILocation(line: 978, column: 101, scope: !3387)
!3397 = !DILocalVariable(name: "delta_time", scope: !3398, file: !22, line: 979, type: !74)
!3398 = distinct !DILexicalBlock(scope: !3387, file: !22, line: 978, column: 130)
!3399 = !DILocation(line: 979, column: 8, scope: !3398)
!3400 = !DILocalVariable(name: "fc", scope: !3398, file: !22, line: 980, type: !7)
!3401 = !DILocation(line: 980, column: 8, scope: !3398)
!3402 = !DILocalVariable(name: "rx", scope: !3398, file: !22, line: 980, type: !7)
!3403 = !DILocation(line: 980, column: 12, scope: !3398)
!3404 = !DILocalVariable(name: "rz", scope: !3398, file: !22, line: 980, type: !7)
!3405 = !DILocation(line: 980, column: 16, scope: !3398)
!3406 = !DILocation(line: 982, column: 17, scope: !3398)
!3407 = !DILocation(line: 982, column: 28, scope: !3398)
!3408 = !DILocation(line: 982, column: 26, scope: !3398)
!3409 = !DILocation(line: 982, column: 15, scope: !3398)
!3410 = !DILocation(line: 984, column: 13, scope: !3398)
!3411 = !DILocation(line: 984, column: 27, scope: !3398)
!3412 = !DILocation(line: 984, column: 58, scope: !3398)
!3413 = !DILocation(line: 984, column: 56, scope: !3398)
!3414 = !DILocation(line: 984, column: 90, scope: !3398)
!3415 = !DILocation(line: 984, column: 24, scope: !3398)
!3416 = !DILocation(line: 984, column: 9, scope: !3398)
!3417 = !DILocation(line: 984, column: 7, scope: !3398)
!3418 = !DILocation(line: 985, column: 7, scope: !3398)
!3419 = !DILocation(line: 986, column: 8, scope: !3420)
!3420 = distinct !DILexicalBlock(scope: !3398, file: !22, line: 986, column: 8)
!3421 = !DILocation(line: 986, column: 11, scope: !3420)
!3422 = !DILocation(line: 987, column: 8, scope: !3420)
!3423 = !DILocation(line: 987, column: 5, scope: !3420)
!3424 = !DILocation(line: 989, column: 8, scope: !3425)
!3425 = distinct !DILexicalBlock(scope: !3398, file: !22, line: 989, column: 8)
!3426 = !DILocation(line: 989, column: 11, scope: !3425)
!3427 = !DILocation(line: 990, column: 8, scope: !3425)
!3428 = !DILocation(line: 990, column: 5, scope: !3425)
!3429 = !DILocation(line: 992, column: 29, scope: !3398)
!3430 = !DILocation(line: 992, column: 26, scope: !3398)
!3431 = !DILocation(line: 994, column: 16, scope: !3398)
!3432 = !DILocation(line: 994, column: 25, scope: !3398)
!3433 = !DILocation(line: 994, column: 64, scope: !3398)
!3434 = !DILocation(line: 994, column: 62, scope: !3398)
!3435 = !DILocation(line: 994, column: 56, scope: !3398)
!3436 = !DILocation(line: 994, column: 69, scope: !3398)
!3437 = !DILocation(line: 994, column: 48, scope: !3398)
!3438 = !DILocation(line: 994, column: 9, scope: !3398)
!3439 = !DILocation(line: 994, column: 7, scope: !3398)
!3440 = !DILocation(line: 995, column: 16, scope: !3398)
!3441 = !DILocation(line: 995, column: 25, scope: !3398)
!3442 = !DILocation(line: 995, column: 64, scope: !3398)
!3443 = !DILocation(line: 995, column: 62, scope: !3398)
!3444 = !DILocation(line: 995, column: 56, scope: !3398)
!3445 = !DILocation(line: 995, column: 69, scope: !3398)
!3446 = !DILocation(line: 995, column: 48, scope: !3398)
!3447 = !DILocation(line: 995, column: 9, scope: !3398)
!3448 = !DILocation(line: 995, column: 7, scope: !3398)
!3449 = !DILocation(line: 997, column: 47, scope: !3398)
!3450 = !DILocation(line: 997, column: 4, scope: !3398)
!3451 = !DILocation(line: 997, column: 19, scope: !3398)
!3452 = !DILocation(line: 997, column: 35, scope: !3398)
!3453 = !DILocation(line: 997, column: 42, scope: !3398)
!3454 = !DILocation(line: 997, column: 44, scope: !3398)
!3455 = !DILocation(line: 998, column: 47, scope: !3398)
!3456 = !DILocation(line: 998, column: 4, scope: !3398)
!3457 = !DILocation(line: 998, column: 19, scope: !3398)
!3458 = !DILocation(line: 998, column: 35, scope: !3398)
!3459 = !DILocation(line: 998, column: 42, scope: !3398)
!3460 = !DILocation(line: 998, column: 44, scope: !3398)
!3461 = !DILocation(line: 1001, column: 8, scope: !3462)
!3462 = distinct !DILexicalBlock(scope: !3398, file: !22, line: 1001, column: 8)
!3463 = !DILocation(line: 1001, column: 21, scope: !3462)
!3464 = !DILocation(line: 1003, column: 55, scope: !3465)
!3465 = distinct !DILexicalBlock(scope: !3462, file: !22, line: 1002, column: 4)
!3466 = !DILocation(line: 1003, column: 58, scope: !3465)
!3467 = !DILocation(line: 1003, column: 13, scope: !3465)
!3468 = !DILocation(line: 1003, column: 5, scope: !3465)
!3469 = !DILocation(line: 1003, column: 27, scope: !3465)
!3470 = !DILocation(line: 1003, column: 43, scope: !3465)
!3471 = !DILocation(line: 1003, column: 50, scope: !3465)
!3472 = !DILocation(line: 1003, column: 52, scope: !3465)
!3473 = !DILocation(line: 1004, column: 55, scope: !3465)
!3474 = !DILocation(line: 1004, column: 58, scope: !3465)
!3475 = !DILocation(line: 1004, column: 13, scope: !3465)
!3476 = !DILocation(line: 1004, column: 5, scope: !3465)
!3477 = !DILocation(line: 1004, column: 27, scope: !3465)
!3478 = !DILocation(line: 1004, column: 43, scope: !3465)
!3479 = !DILocation(line: 1004, column: 50, scope: !3465)
!3480 = !DILocation(line: 1004, column: 52, scope: !3465)
!3481 = !DILocation(line: 1005, column: 4, scope: !3465)
!3482 = !DILocation(line: 1008, column: 32, scope: !3398)
!3483 = !DILocation(line: 1008, column: 29, scope: !3398)
!3484 = !DILocation(line: 1009, column: 3, scope: !3398)
!3485 = !DILocation(line: 1010, column: 2, scope: !3388)
!3486 = !DILocation(line: 1011, column: 1, scope: !3383)
!3487 = distinct !DISubprogram(name: "smega_rock_stuff", linkageName: "_Z16smega_rock_stuffv", scope: !22, file: !22, line: 1015, type: !879, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3488 = !DILocalVariable(name: "i", scope: !3487, file: !22, line: 1017, type: !7)
!3489 = !DILocation(line: 1017, column: 6, scope: !3487)
!3490 = !DILocation(line: 1019, column: 9, scope: !3491)
!3491 = distinct !DILexicalBlock(scope: !3487, file: !22, line: 1019, column: 2)
!3492 = !DILocation(line: 1019, column: 7, scope: !3491)
!3493 = !DILocation(line: 1019, column: 14, scope: !3494)
!3494 = distinct !DILexicalBlock(scope: !3491, file: !22, line: 1019, column: 2)
!3495 = !DILocation(line: 1019, column: 16, scope: !3494)
!3496 = !DILocation(line: 1019, column: 2, scope: !3491)
!3497 = !DILocation(line: 1021, column: 28, scope: !3498)
!3498 = distinct !DILexicalBlock(scope: !3499, file: !22, line: 1021, column: 7)
!3499 = distinct !DILexicalBlock(scope: !3494, file: !22, line: 1020, column: 2)
!3500 = !DILocation(line: 1021, column: 7, scope: !3498)
!3501 = !DILocation(line: 1021, column: 31, scope: !3498)
!3502 = !DILocation(line: 1021, column: 52, scope: !3498)
!3503 = !DILocation(line: 1021, column: 50, scope: !3498)
!3504 = !DILocation(line: 1022, column: 25, scope: !3498)
!3505 = !DILocation(line: 1022, column: 4, scope: !3498)
!3506 = !DILocation(line: 1022, column: 28, scope: !3498)
!3507 = !DILocation(line: 1023, column: 2, scope: !3499)
!3508 = !DILocation(line: 1019, column: 40, scope: !3494)
!3509 = !DILocation(line: 1019, column: 2, scope: !3494)
!3510 = distinct !{!3510, !3496, !3511, !1743}
!3511 = !DILocation(line: 1023, column: 2, scope: !3491)
!3512 = !DILocation(line: 1025, column: 9, scope: !3513)
!3513 = distinct !DILexicalBlock(scope: !3487, file: !22, line: 1025, column: 2)
!3514 = !DILocation(line: 1025, column: 7, scope: !3513)
!3515 = !DILocation(line: 1025, column: 14, scope: !3516)
!3516 = distinct !DILexicalBlock(scope: !3513, file: !22, line: 1025, column: 2)
!3517 = !DILocation(line: 1025, column: 16, scope: !3516)
!3518 = !DILocation(line: 1025, column: 2, scope: !3513)
!3519 = !DILocation(line: 1027, column: 28, scope: !3520)
!3520 = distinct !DILexicalBlock(scope: !3521, file: !22, line: 1027, column: 7)
!3521 = distinct !DILexicalBlock(scope: !3516, file: !22, line: 1026, column: 2)
!3522 = !DILocation(line: 1027, column: 7, scope: !3520)
!3523 = !DILocation(line: 1027, column: 31, scope: !3520)
!3524 = !DILocation(line: 1029, column: 30, scope: !3525)
!3525 = distinct !DILexicalBlock(scope: !3520, file: !22, line: 1028, column: 3)
!3526 = !DILocation(line: 1029, column: 25, scope: !3525)
!3527 = !DILocation(line: 1029, column: 4, scope: !3525)
!3528 = !DILocation(line: 1029, column: 28, scope: !3525)
!3529 = !DILocation(line: 1030, column: 4, scope: !3525)
!3530 = !DILocation(line: 1032, column: 2, scope: !3521)
!3531 = !DILocation(line: 1025, column: 40, scope: !3516)
!3532 = !DILocation(line: 1025, column: 2, scope: !3516)
!3533 = distinct !{!3533, !3518, !3534, !1743}
!3534 = !DILocation(line: 1032, column: 2, scope: !3513)
!3535 = !DILocation(line: 1033, column: 1, scope: !3487)
!3536 = distinct !DISubprogram(name: "process_super_mines_frame", linkageName: "_Z25process_super_mines_framev", scope: !22, file: !22, line: 1038, type: !879, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3537 = !DILocalVariable(name: "i", scope: !3536, file: !22, line: 1096, type: !7)
!3538 = !DILocation(line: 1096, column: 6, scope: !3536)
!3539 = !DILocalVariable(name: "j", scope: !3536, file: !22, line: 1096, type: !7)
!3540 = !DILocation(line: 1096, column: 9, scope: !3536)
!3541 = !DILocalVariable(name: "start", scope: !3536, file: !22, line: 1097, type: !7)
!3542 = !DILocation(line: 1097, column: 6, scope: !3536)
!3543 = !DILocalVariable(name: "add", scope: !3536, file: !22, line: 1097, type: !7)
!3544 = !DILocation(line: 1097, column: 13, scope: !3536)
!3545 = !DILocation(line: 1101, column: 6, scope: !3546)
!3546 = distinct !DILexicalBlock(scope: !3536, file: !22, line: 1101, column: 6)
!3547 = !DILocation(line: 1101, column: 22, scope: !3546)
!3548 = !DILocation(line: 1103, column: 11, scope: !3549)
!3549 = distinct !DILexicalBlock(scope: !3546, file: !22, line: 1102, column: 2)
!3550 = !DILocation(line: 1103, column: 22, scope: !3549)
!3551 = !DILocation(line: 1103, column: 9, scope: !3549)
!3552 = !DILocation(line: 1104, column: 7, scope: !3549)
!3553 = !DILocation(line: 1105, column: 2, scope: !3549)
!3554 = !DILocation(line: 1108, column: 9, scope: !3555)
!3555 = distinct !DILexicalBlock(scope: !3546, file: !22, line: 1107, column: 2)
!3556 = !DILocation(line: 1109, column: 7, scope: !3555)
!3557 = !DILocation(line: 1112, column: 18, scope: !3536)
!3558 = !DILocation(line: 1114, column: 11, scope: !3559)
!3559 = distinct !DILexicalBlock(scope: !3536, file: !22, line: 1114, column: 2)
!3560 = !DILocation(line: 1114, column: 9, scope: !3559)
!3561 = !DILocation(line: 1114, column: 7, scope: !3559)
!3562 = !DILocation(line: 1114, column: 18, scope: !3563)
!3563 = distinct !DILexicalBlock(scope: !3559, file: !22, line: 1114, column: 2)
!3564 = !DILocation(line: 1114, column: 23, scope: !3563)
!3565 = !DILocation(line: 1114, column: 20, scope: !3563)
!3566 = !DILocation(line: 1114, column: 2, scope: !3559)
!3567 = !DILocation(line: 1116, column: 16, scope: !3568)
!3568 = distinct !DILexicalBlock(scope: !3569, file: !22, line: 1116, column: 7)
!3569 = distinct !DILexicalBlock(scope: !3563, file: !22, line: 1115, column: 2)
!3570 = !DILocation(line: 1116, column: 8, scope: !3568)
!3571 = !DILocation(line: 1116, column: 19, scope: !3568)
!3572 = !DILocation(line: 1116, column: 24, scope: !3568)
!3573 = !DILocation(line: 1116, column: 39, scope: !3568)
!3574 = !DILocation(line: 1116, column: 51, scope: !3568)
!3575 = !DILocation(line: 1116, column: 43, scope: !3568)
!3576 = !DILocation(line: 1116, column: 54, scope: !3568)
!3577 = !DILocation(line: 1116, column: 57, scope: !3568)
!3578 = !DILocalVariable(name: "parent_num", scope: !3579, file: !22, line: 1118, type: !7)
!3579 = distinct !DILexicalBlock(scope: !3568, file: !22, line: 1117, column: 3)
!3580 = !DILocation(line: 1118, column: 8, scope: !3579)
!3581 = !DILocation(line: 1120, column: 25, scope: !3579)
!3582 = !DILocation(line: 1120, column: 17, scope: !3579)
!3583 = !DILocation(line: 1120, column: 28, scope: !3579)
!3584 = !DILocation(line: 1120, column: 45, scope: !3579)
!3585 = !DILocation(line: 1120, column: 15, scope: !3579)
!3586 = !DILocation(line: 1122, column: 20, scope: !3579)
!3587 = !DILocation(line: 1123, column: 16, scope: !3588)
!3588 = distinct !DILexicalBlock(scope: !3579, file: !22, line: 1123, column: 8)
!3589 = !DILocation(line: 1123, column: 8, scope: !3588)
!3590 = !DILocation(line: 1123, column: 19, scope: !3588)
!3591 = !DILocation(line: 1123, column: 28, scope: !3588)
!3592 = !DILocation(line: 1123, column: 67, scope: !3588)
!3593 = !DILocation(line: 1123, column: 39, scope: !3588)
!3594 = !DILocalVariable(name: "bombpos", scope: !3595, file: !22, line: 1125, type: !3596)
!3595 = distinct !DILexicalBlock(scope: !3588, file: !22, line: 1124, column: 4)
!3596 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3597, size: 64)
!3597 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !3598, line: 22, baseType: !3599)
!3598 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!3599 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !3598, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !3600, identifier: "_ZTS10vms_vector")
!3600 = !{!3601, !3602, !3603}
!3601 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !3599, file: !3598, line: 21, baseType: !74, size: 32)
!3602 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !3599, file: !3598, line: 21, baseType: !74, size: 32, offset: 32)
!3603 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !3599, file: !3598, line: 21, baseType: !74, size: 32, offset: 64)
!3604 = !DILocation(line: 1125, column: 17, scope: !3595)
!3605 = !DILocation(line: 1127, column: 24, scope: !3595)
!3606 = !DILocation(line: 1127, column: 16, scope: !3595)
!3607 = !DILocation(line: 1127, column: 27, scope: !3595)
!3608 = !DILocation(line: 1127, column: 13, scope: !3595)
!3609 = !DILocation(line: 1129, column: 12, scope: !3610)
!3610 = distinct !DILexicalBlock(scope: !3595, file: !22, line: 1129, column: 5)
!3611 = !DILocation(line: 1129, column: 10, scope: !3610)
!3612 = !DILocation(line: 1129, column: 17, scope: !3613)
!3613 = distinct !DILexicalBlock(scope: !3610, file: !22, line: 1129, column: 5)
!3614 = !DILocation(line: 1129, column: 22, scope: !3613)
!3615 = !DILocation(line: 1129, column: 19, scope: !3613)
!3616 = !DILocation(line: 1129, column: 5, scope: !3610)
!3617 = !DILocation(line: 1131, column: 19, scope: !3618)
!3618 = distinct !DILexicalBlock(scope: !3619, file: !22, line: 1131, column: 10)
!3619 = distinct !DILexicalBlock(scope: !3613, file: !22, line: 1130, column: 5)
!3620 = !DILocation(line: 1131, column: 11, scope: !3618)
!3621 = !DILocation(line: 1131, column: 22, scope: !3618)
!3622 = !DILocation(line: 1131, column: 27, scope: !3618)
!3623 = !DILocation(line: 1131, column: 42, scope: !3618)
!3624 = !DILocation(line: 1131, column: 54, scope: !3618)
!3625 = !DILocation(line: 1131, column: 46, scope: !3618)
!3626 = !DILocation(line: 1131, column: 57, scope: !3618)
!3627 = !DILocation(line: 1131, column: 62, scope: !3618)
!3628 = !DILocalVariable(name: "dist", scope: !3629, file: !22, line: 1133, type: !74)
!3629 = distinct !DILexicalBlock(scope: !3618, file: !22, line: 1132, column: 6)
!3630 = !DILocation(line: 1133, column: 11, scope: !3629)
!3631 = !DILocation(line: 1135, column: 32, scope: !3629)
!3632 = !DILocation(line: 1135, column: 50, scope: !3629)
!3633 = !DILocation(line: 1135, column: 42, scope: !3629)
!3634 = !DILocation(line: 1135, column: 53, scope: !3629)
!3635 = !DILocation(line: 1135, column: 14, scope: !3629)
!3636 = !DILocation(line: 1135, column: 12, scope: !3629)
!3637 = !DILocation(line: 1137, column: 11, scope: !3638)
!3638 = distinct !DILexicalBlock(scope: !3629, file: !22, line: 1137, column: 11)
!3639 = !DILocation(line: 1137, column: 16, scope: !3638)
!3640 = !DILocation(line: 1137, column: 13, scope: !3638)
!3641 = !DILocation(line: 1139, column: 12, scope: !3642)
!3642 = distinct !DILexicalBlock(scope: !3643, file: !22, line: 1139, column: 12)
!3643 = distinct !DILexicalBlock(scope: !3638, file: !22, line: 1138, column: 7)
!3644 = !DILocation(line: 1139, column: 27, scope: !3642)
!3645 = !DILocation(line: 1139, column: 19, scope: !3642)
!3646 = !DILocation(line: 1139, column: 30, scope: !3642)
!3647 = !DILocation(line: 1139, column: 17, scope: !3642)
!3648 = !DILocation(line: 1139, column: 35, scope: !3642)
!3649 = !DILocation(line: 1140, column: 21, scope: !3650)
!3650 = distinct !DILexicalBlock(scope: !3642, file: !22, line: 1140, column: 13)
!3651 = !DILocation(line: 1140, column: 13, scope: !3650)
!3652 = !DILocation(line: 1140, column: 24, scope: !3650)
!3653 = !DILocation(line: 1140, column: 42, scope: !3650)
!3654 = !DILocation(line: 1140, column: 34, scope: !3650)
!3655 = !DILocation(line: 1140, column: 45, scope: !3650)
!3656 = !DILocation(line: 1140, column: 31, scope: !3650)
!3657 = !DILocation(line: 1141, column: 18, scope: !3650)
!3658 = !DILocation(line: 1141, column: 10, scope: !3650)
!3659 = !DILocation(line: 1141, column: 21, scope: !3650)
!3660 = !DILocation(line: 1141, column: 30, scope: !3650)
!3661 = !DILocation(line: 1146, column: 16, scope: !3662)
!3662 = distinct !DILexicalBlock(scope: !3663, file: !22, line: 1146, column: 14)
!3663 = distinct !DILexicalBlock(scope: !3650, file: !22, line: 1143, column: 9)
!3664 = !DILocation(line: 1146, column: 30, scope: !3662)
!3665 = !DILocation(line: 1146, column: 34, scope: !3662)
!3666 = !DILocation(line: 1146, column: 32, scope: !3662)
!3667 = !DILocation(line: 1146, column: 27, scope: !3662)
!3668 = !DILocation(line: 1146, column: 38, scope: !3662)
!3669 = !DILocation(line: 1146, column: 43, scope: !3662)
!3670 = !DILocalVariable(name: "fq", scope: !3671, file: !22, line: 1148, type: !3672)
!3671 = distinct !DILexicalBlock(scope: !3662, file: !22, line: 1147, column: 10)
!3672 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_query", file: !3673, line: 58, baseType: !3674)
!3673 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!3674 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_query", file: !3673, line: 50, size: 384, flags: DIFlagTypePassByValue, elements: !3675, identifier: "_ZTS9fvi_query")
!3675 = !{!3676, !3677, !3678, !3679, !3680, !3681, !3682}
!3676 = !DIDerivedType(tag: DW_TAG_member, name: "p0", scope: !3674, file: !3673, line: 52, baseType: !3596, size: 64)
!3677 = !DIDerivedType(tag: DW_TAG_member, name: "p1", scope: !3674, file: !3673, line: 52, baseType: !3596, size: 64, offset: 64)
!3678 = !DIDerivedType(tag: DW_TAG_member, name: "startseg", scope: !3674, file: !3673, line: 53, baseType: !7, size: 32, offset: 128)
!3679 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !3674, file: !3673, line: 54, baseType: !74, size: 32, offset: 160)
!3680 = !DIDerivedType(tag: DW_TAG_member, name: "thisobjnum", scope: !3674, file: !3673, line: 55, baseType: !53, size: 16, offset: 192)
!3681 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_obj_list", scope: !3674, file: !3673, line: 56, baseType: !1021, size: 64, offset: 256)
!3682 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3674, file: !3673, line: 57, baseType: !7, size: 32, offset: 320)
!3683 = !DILocation(line: 1148, column: 21, scope: !3671)
!3684 = !DILocalVariable(name: "hit_data", scope: !3671, file: !22, line: 1149, type: !3685)
!3685 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !3673, line: 40, baseType: !3686)
!3686 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !3673, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !3687, identifier: "_ZTS8fvi_info")
!3687 = !{!3688, !3689, !3690, !3691, !3692, !3693, !3694, !3695, !3696}
!3688 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !3686, file: !3673, line: 31, baseType: !7, size: 32)
!3689 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !3686, file: !3673, line: 32, baseType: !3597, size: 96, offset: 32)
!3690 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !3686, file: !3673, line: 33, baseType: !7, size: 32, offset: 128)
!3691 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !3686, file: !3673, line: 34, baseType: !7, size: 32, offset: 160)
!3692 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !3686, file: !3673, line: 35, baseType: !7, size: 32, offset: 192)
!3693 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !3686, file: !3673, line: 36, baseType: !7, size: 32, offset: 224)
!3694 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !3686, file: !3673, line: 37, baseType: !3597, size: 96, offset: 256)
!3695 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !3686, file: !3673, line: 38, baseType: !7, size: 32, offset: 352)
!3696 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !3686, file: !3673, line: 39, baseType: !3697, size: 3200, offset: 384)
!3697 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !3698)
!3698 = !{!3699}
!3699 = !DISubrange(count: 100)
!3700 = !DILocation(line: 1149, column: 21, scope: !3671)
!3701 = !DILocalVariable(name: "fate", scope: !3671, file: !22, line: 1150, type: !7)
!3702 = !DILocation(line: 1150, column: 17, scope: !3671)
!3703 = !DILocation(line: 1152, column: 11, scope: !3671)
!3704 = !DILocation(line: 1154, column: 33, scope: !3671)
!3705 = !DILocation(line: 1154, column: 25, scope: !3671)
!3706 = !DILocation(line: 1154, column: 36, scope: !3671)
!3707 = !DILocation(line: 1154, column: 14, scope: !3671)
!3708 = !DILocation(line: 1154, column: 23, scope: !3671)
!3709 = !DILocation(line: 1155, column: 28, scope: !3671)
!3710 = !DILocation(line: 1155, column: 20, scope: !3671)
!3711 = !DILocation(line: 1155, column: 31, scope: !3671)
!3712 = !DILocation(line: 1155, column: 14, scope: !3671)
!3713 = !DILocation(line: 1155, column: 17, scope: !3671)
!3714 = !DILocation(line: 1156, column: 28, scope: !3671)
!3715 = !DILocation(line: 1156, column: 20, scope: !3671)
!3716 = !DILocation(line: 1156, column: 31, scope: !3671)
!3717 = !DILocation(line: 1156, column: 14, scope: !3671)
!3718 = !DILocation(line: 1156, column: 17, scope: !3671)
!3719 = !DILocation(line: 1157, column: 14, scope: !3671)
!3720 = !DILocation(line: 1157, column: 18, scope: !3671)
!3721 = !DILocation(line: 1158, column: 27, scope: !3671)
!3722 = !DILocation(line: 1158, column: 14, scope: !3671)
!3723 = !DILocation(line: 1158, column: 25, scope: !3671)
!3724 = !DILocation(line: 1159, column: 14, scope: !3671)
!3725 = !DILocation(line: 1159, column: 30, scope: !3671)
!3726 = !DILocation(line: 1160, column: 14, scope: !3671)
!3727 = !DILocation(line: 1160, column: 20, scope: !3671)
!3728 = !DILocation(line: 1162, column: 18, scope: !3671)
!3729 = !DILocation(line: 1162, column: 16, scope: !3671)
!3730 = !DILocation(line: 1163, column: 15, scope: !3731)
!3731 = distinct !DILexicalBlock(scope: !3671, file: !22, line: 1163, column: 15)
!3732 = !DILocation(line: 1163, column: 20, scope: !3731)
!3733 = !DILocation(line: 1164, column: 20, scope: !3731)
!3734 = !DILocation(line: 1164, column: 12, scope: !3731)
!3735 = !DILocation(line: 1164, column: 23, scope: !3731)
!3736 = !DILocation(line: 1164, column: 32, scope: !3731)
!3737 = !DILocation(line: 1165, column: 10, scope: !3671)
!3738 = !DILocation(line: 1167, column: 7, scope: !3643)
!3739 = !DILocation(line: 1168, column: 16, scope: !3740)
!3740 = distinct !DILexicalBlock(scope: !3638, file: !22, line: 1168, column: 16)
!3741 = !DILocation(line: 1168, column: 36, scope: !3740)
!3742 = !DILocation(line: 1170, column: 12, scope: !3743)
!3743 = distinct !DILexicalBlock(scope: !3744, file: !22, line: 1170, column: 12)
!3744 = distinct !DILexicalBlock(scope: !3740, file: !22, line: 1169, column: 7)
!3745 = !DILocation(line: 1170, column: 27, scope: !3743)
!3746 = !DILocation(line: 1170, column: 19, scope: !3743)
!3747 = !DILocation(line: 1170, column: 30, scope: !3743)
!3748 = !DILocation(line: 1170, column: 17, scope: !3743)
!3749 = !DILocation(line: 1170, column: 35, scope: !3743)
!3750 = !DILocation(line: 1171, column: 17, scope: !3743)
!3751 = !DILocation(line: 1171, column: 9, scope: !3743)
!3752 = !DILocation(line: 1171, column: 20, scope: !3743)
!3753 = !DILocation(line: 1171, column: 29, scope: !3743)
!3754 = !DILocation(line: 1172, column: 7, scope: !3744)
!3755 = !DILocation(line: 1173, column: 6, scope: !3629)
!3756 = !DILocation(line: 1174, column: 5, scope: !3619)
!3757 = !DILocation(line: 1129, column: 45, scope: !3613)
!3758 = !DILocation(line: 1129, column: 5, scope: !3613)
!3759 = distinct !{!3759, !3616, !3760, !1743}
!3760 = !DILocation(line: 1174, column: 5, scope: !3610)
!3761 = !DILocation(line: 1175, column: 4, scope: !3595)
!3762 = !DILocation(line: 1176, column: 3, scope: !3579)
!3763 = !DILocation(line: 1177, column: 2, scope: !3569)
!3764 = !DILocation(line: 1114, column: 50, scope: !3563)
!3765 = !DILocation(line: 1114, column: 47, scope: !3563)
!3766 = !DILocation(line: 1114, column: 2, scope: !3563)
!3767 = distinct !{!3767, !3566, !3768, !1743}
!3768 = !DILocation(line: 1177, column: 2, scope: !3559)
!3769 = !DILocation(line: 1179, column: 1, scope: !3536)
!3770 = distinct !DISubprogram(name: "spit_powerup", linkageName: "_Z12spit_powerupP6objectii", scope: !22, file: !22, line: 1185, type: !3771, scopeLine: 1186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!3771 = !DISubroutineType(types: !3772)
!3772 = !{!7, !3773, !7, !7}
!3773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3774, size: 64)
!3774 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !3775, line: 259, baseType: !3776)
!3775 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!3776 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !3775, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !3777, identifier: "_ZTS6object")
!3777 = !{!3778, !3779, !3780, !3781, !3782, !3783, !3784, !3785, !3786, !3787, !3788, !3789, !3790, !3797, !3798, !3799, !3800, !3801, !3802, !3803, !3804, !3805, !3823, !3875}
!3778 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !3776, file: !3775, line: 212, baseType: !7, size: 32)
!3779 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !3776, file: !3775, line: 213, baseType: !24, size: 8, offset: 32)
!3780 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !3776, file: !3775, line: 214, baseType: !24, size: 8, offset: 40)
!3781 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !3776, file: !3775, line: 215, baseType: !53, size: 16, offset: 48)
!3782 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !3776, file: !3775, line: 215, baseType: !53, size: 16, offset: 64)
!3783 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !3776, file: !3775, line: 216, baseType: !24, size: 8, offset: 80)
!3784 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !3776, file: !3775, line: 217, baseType: !24, size: 8, offset: 88)
!3785 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !3776, file: !3775, line: 218, baseType: !24, size: 8, offset: 96)
!3786 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3776, file: !3775, line: 219, baseType: !24, size: 8, offset: 104)
!3787 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !3776, file: !3775, line: 220, baseType: !53, size: 16, offset: 112)
!3788 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !3776, file: !3775, line: 221, baseType: !53, size: 16, offset: 128)
!3789 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !3776, file: !3775, line: 222, baseType: !3597, size: 96, offset: 160)
!3790 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !3776, file: !3775, line: 223, baseType: !3791, size: 288, offset: 256)
!3791 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !3598, line: 47, baseType: !3792)
!3792 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !3598, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !3793, identifier: "_ZTS10vms_matrix")
!3793 = !{!3794, !3795, !3796}
!3794 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !3792, file: !3598, line: 46, baseType: !3597, size: 96)
!3795 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !3792, file: !3598, line: 46, baseType: !3597, size: 96, offset: 96)
!3796 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !3792, file: !3598, line: 46, baseType: !3597, size: 96, offset: 192)
!3797 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !3776, file: !3775, line: 224, baseType: !74, size: 32, offset: 544)
!3798 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !3776, file: !3775, line: 225, baseType: !74, size: 32, offset: 576)
!3799 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !3776, file: !3775, line: 226, baseType: !3597, size: 96, offset: 608)
!3800 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !3776, file: !3775, line: 227, baseType: !48, size: 8, offset: 704)
!3801 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !3776, file: !3775, line: 228, baseType: !48, size: 8, offset: 712)
!3802 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !3776, file: !3775, line: 229, baseType: !48, size: 8, offset: 720)
!3803 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !3776, file: !3775, line: 230, baseType: !48, size: 8, offset: 728)
!3804 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !3776, file: !3775, line: 231, baseType: !74, size: 32, offset: 736)
!3805 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !3776, file: !3775, line: 240, baseType: !3806, size: 512, offset: 768)
!3806 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3776, file: !3775, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !3807, identifier: "_ZTSN6objectUt_E")
!3807 = !{!3808, !3822}
!3808 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !3806, file: !3775, line: 238, baseType: !3809, size: 512)
!3809 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !3775, line: 153, baseType: !3810)
!3810 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !3775, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !3811, identifier: "_ZTS12physics_info")
!3811 = !{!3812, !3813, !3814, !3815, !3816, !3817, !3818, !3819, !3821}
!3812 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !3810, file: !3775, line: 144, baseType: !3597, size: 96)
!3813 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !3810, file: !3775, line: 145, baseType: !3597, size: 96, offset: 96)
!3814 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !3810, file: !3775, line: 146, baseType: !74, size: 32, offset: 192)
!3815 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !3810, file: !3775, line: 147, baseType: !74, size: 32, offset: 224)
!3816 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !3810, file: !3775, line: 148, baseType: !74, size: 32, offset: 256)
!3817 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !3810, file: !3775, line: 149, baseType: !3597, size: 96, offset: 288)
!3818 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !3810, file: !3775, line: 150, baseType: !3597, size: 96, offset: 384)
!3819 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !3810, file: !3775, line: 151, baseType: !3820, size: 16, offset: 480)
!3820 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !75, line: 21, baseType: !53)
!3821 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3810, file: !3775, line: 152, baseType: !86, size: 16, offset: 496)
!3822 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !3806, file: !3775, line: 239, baseType: !3597, size: 96)
!3823 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !3776, file: !3775, line: 250, baseType: !3824, size: 256, offset: 1280)
!3824 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3776, file: !3775, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !3825, identifier: "_ZTSN6objectUt0_E")
!3825 = !{!3826, !3837, !3847, !3863, !3868}
!3826 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !3824, file: !3775, line: 245, baseType: !3827, size: 160)
!3827 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !3775, line: 166, baseType: !3828)
!3828 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !3775, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !3829, identifier: "_ZTS12laser_info_s")
!3829 = !{!3830, !3831, !3832, !3833, !3834, !3835, !3836}
!3830 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !3828, file: !3775, line: 159, baseType: !53, size: 16)
!3831 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !3828, file: !3775, line: 160, baseType: !53, size: 16, offset: 16)
!3832 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !3828, file: !3775, line: 161, baseType: !7, size: 32, offset: 32)
!3833 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !3828, file: !3775, line: 162, baseType: !74, size: 32, offset: 64)
!3834 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !3828, file: !3775, line: 163, baseType: !53, size: 16, offset: 96)
!3835 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !3828, file: !3775, line: 164, baseType: !53, size: 16, offset: 112)
!3836 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !3828, file: !3775, line: 165, baseType: !74, size: 32, offset: 128)
!3837 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !3824, file: !3775, line: 246, baseType: !3838, size: 128)
!3838 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !3775, line: 176, baseType: !3839)
!3839 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !3775, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !3840, identifier: "_ZTS14explosion_info")
!3840 = !{!3841, !3842, !3843, !3844, !3845, !3846}
!3841 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !3839, file: !3775, line: 170, baseType: !74, size: 32)
!3842 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !3839, file: !3775, line: 171, baseType: !74, size: 32, offset: 32)
!3843 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !3839, file: !3775, line: 172, baseType: !53, size: 16, offset: 64)
!3844 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !3839, file: !3775, line: 173, baseType: !53, size: 16, offset: 80)
!3845 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !3839, file: !3775, line: 174, baseType: !53, size: 16, offset: 96)
!3846 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !3839, file: !3775, line: 175, baseType: !53, size: 16, offset: 112)
!3847 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !3824, file: !3775, line: 247, baseType: !3848, size: 256)
!3848 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !3849, line: 144, baseType: !3850)
!3849 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!3850 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !3849, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !3851, identifier: "_ZTS9ai_static")
!3851 = !{!3852, !3853, !3855, !3856, !3857, !3858, !3859, !3860, !3861, !3862}
!3852 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !3850, file: !3849, line: 128, baseType: !24, size: 8)
!3853 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3850, file: !3849, line: 129, baseType: !3854, size: 88, offset: 8)
!3854 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 88, elements: !117)
!3855 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !3850, file: !3849, line: 130, baseType: !53, size: 16, offset: 96)
!3856 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !3850, file: !3849, line: 131, baseType: !53, size: 16, offset: 112)
!3857 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !3850, file: !3849, line: 132, baseType: !53, size: 16, offset: 128)
!3858 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !3850, file: !3849, line: 133, baseType: !48, size: 8, offset: 144)
!3859 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !3850, file: !3849, line: 134, baseType: !48, size: 8, offset: 152)
!3860 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !3850, file: !3849, line: 139, baseType: !53, size: 16, offset: 160)
!3861 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !3850, file: !3849, line: 140, baseType: !7, size: 32, offset: 192)
!3862 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !3850, file: !3849, line: 141, baseType: !74, size: 32, offset: 224)
!3863 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !3824, file: !3775, line: 248, baseType: !3864, size: 32)
!3864 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !3775, line: 181, baseType: !3865)
!3865 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !3775, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !3866, identifier: "_ZTS12light_info_s")
!3866 = !{!3867}
!3867 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !3865, file: !3775, line: 180, baseType: !74, size: 32)
!3868 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !3824, file: !3775, line: 249, baseType: !3869, size: 96)
!3869 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !3775, line: 190, baseType: !3870)
!3870 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !3775, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !3871, identifier: "_ZTS14powerup_info_s")
!3871 = !{!3872, !3873, !3874}
!3872 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !3870, file: !3775, line: 187, baseType: !7, size: 32)
!3873 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !3870, file: !3775, line: 188, baseType: !74, size: 32, offset: 32)
!3874 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3870, file: !3775, line: 189, baseType: !7, size: 32, offset: 64)
!3875 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !3776, file: !3775, line: 257, baseType: !3876, size: 608, offset: 1536)
!3876 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3776, file: !3775, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !3877, identifier: "_ZTSN6objectUt1_E")
!3877 = !{!3878, !3894}
!3878 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !3876, file: !3775, line: 255, baseType: !3879, size: 608)
!3879 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !3775, line: 208, baseType: !3880)
!3880 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !3775, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !3881, identifier: "_ZTS12polyobj_info")
!3881 = !{!3882, !3883, !3891, !3892, !3893}
!3882 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !3880, file: !3775, line: 203, baseType: !7, size: 32)
!3883 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !3880, file: !3775, line: 204, baseType: !3884, size: 480, offset: 32)
!3884 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3885, size: 480, elements: !27)
!3885 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !3598, line: 40, baseType: !3886)
!3886 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !3598, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !3887, identifier: "_ZTS10vms_angvec")
!3887 = !{!3888, !3889, !3890}
!3888 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !3886, file: !3598, line: 39, baseType: !3820, size: 16)
!3889 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !3886, file: !3598, line: 39, baseType: !3820, size: 16, offset: 16)
!3890 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !3886, file: !3598, line: 39, baseType: !3820, size: 16, offset: 32)
!3891 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !3880, file: !3775, line: 205, baseType: !7, size: 32, offset: 512)
!3892 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !3880, file: !3775, line: 206, baseType: !7, size: 32, offset: 544)
!3893 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !3880, file: !3775, line: 207, baseType: !7, size: 32, offset: 576)
!3894 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !3876, file: !3775, line: 256, baseType: !3895, size: 96)
!3895 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !3775, line: 197, baseType: !3896)
!3896 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !3775, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !3897, identifier: "_ZTS12vclip_info_s")
!3897 = !{!3898, !3899, !3900}
!3898 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !3896, file: !3775, line: 194, baseType: !7, size: 32)
!3899 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !3896, file: !3775, line: 195, baseType: !74, size: 32, offset: 32)
!3900 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !3896, file: !3775, line: 196, baseType: !48, size: 8, offset: 64)
!3901 = !DILocalVariable(name: "spitter", arg: 1, scope: !3770, file: !22, line: 1185, type: !3773)
!3902 = !DILocation(line: 1185, column: 27, scope: !3770)
!3903 = !DILocalVariable(name: "id", arg: 2, scope: !3770, file: !22, line: 1185, type: !7)
!3904 = !DILocation(line: 1185, column: 40, scope: !3770)
!3905 = !DILocalVariable(name: "seed", arg: 3, scope: !3770, file: !22, line: 1185, type: !7)
!3906 = !DILocation(line: 1185, column: 48, scope: !3770)
!3907 = !DILocalVariable(name: "objnum", scope: !3770, file: !22, line: 1187, type: !7)
!3908 = !DILocation(line: 1187, column: 7, scope: !3770)
!3909 = !DILocalVariable(name: "obj", scope: !3770, file: !22, line: 1188, type: !3773)
!3910 = !DILocation(line: 1188, column: 10, scope: !3770)
!3911 = !DILocalVariable(name: "new_velocity", scope: !3770, file: !22, line: 1189, type: !3597)
!3912 = !DILocation(line: 1189, column: 13, scope: !3770)
!3913 = !DILocalVariable(name: "new_pos", scope: !3770, file: !22, line: 1189, type: !3597)
!3914 = !DILocation(line: 1189, column: 27, scope: !3770)
!3915 = !DILocation(line: 1191, column: 10, scope: !3770)
!3916 = !DILocation(line: 1191, column: 2, scope: !3770)
!3917 = !DILocation(line: 1193, column: 35, scope: !3770)
!3918 = !DILocation(line: 1193, column: 44, scope: !3770)
!3919 = !DILocation(line: 1193, column: 60, scope: !3770)
!3920 = !DILocation(line: 1193, column: 71, scope: !3770)
!3921 = !DILocation(line: 1193, column: 80, scope: !3770)
!3922 = !DILocation(line: 1193, column: 87, scope: !3770)
!3923 = !DILocation(line: 1193, column: 93, scope: !3770)
!3924 = !DILocation(line: 1193, column: 2, scope: !3770)
!3925 = !DILocation(line: 1195, column: 21, scope: !3770)
!3926 = !DILocation(line: 1195, column: 30, scope: !3770)
!3927 = !DILocation(line: 1195, column: 39, scope: !3770)
!3928 = !DILocation(line: 1195, column: 52, scope: !3770)
!3929 = !DILocation(line: 1195, column: 15, scope: !3770)
!3930 = !DILocation(line: 1195, column: 17, scope: !3770)
!3931 = !DILocation(line: 1196, column: 21, scope: !3770)
!3932 = !DILocation(line: 1196, column: 30, scope: !3770)
!3933 = !DILocation(line: 1196, column: 39, scope: !3770)
!3934 = !DILocation(line: 1196, column: 52, scope: !3770)
!3935 = !DILocation(line: 1196, column: 15, scope: !3770)
!3936 = !DILocation(line: 1196, column: 17, scope: !3770)
!3937 = !DILocation(line: 1197, column: 21, scope: !3770)
!3938 = !DILocation(line: 1197, column: 30, scope: !3770)
!3939 = !DILocation(line: 1197, column: 39, scope: !3770)
!3940 = !DILocation(line: 1197, column: 52, scope: !3770)
!3941 = !DILocation(line: 1197, column: 15, scope: !3770)
!3942 = !DILocation(line: 1197, column: 17, scope: !3770)
!3943 = !DILocation(line: 1201, column: 7, scope: !3944)
!3944 = distinct !DILexicalBlock(scope: !3770, file: !22, line: 1201, column: 6)
!3945 = !DILocation(line: 1201, column: 17, scope: !3944)
!3946 = !DILocation(line: 1201, column: 6, scope: !3944)
!3947 = !DILocation(line: 1201, column: 29, scope: !3944)
!3948 = !DILocation(line: 1201, column: 33, scope: !3944)
!3949 = !DILocation(line: 1201, column: 36, scope: !3944)
!3950 = !DILocation(line: 1201, column: 53, scope: !3944)
!3951 = !DILocation(line: 1201, column: 57, scope: !3944)
!3952 = !DILocation(line: 1201, column: 60, scope: !3944)
!3953 = !DILocation(line: 1202, column: 3, scope: !3944)
!3954 = !DILocation(line: 1209, column: 30, scope: !3770)
!3955 = !DILocation(line: 1209, column: 39, scope: !3770)
!3956 = !DILocation(line: 1209, column: 45, scope: !3770)
!3957 = !DILocation(line: 1209, column: 54, scope: !3770)
!3958 = !DILocation(line: 1209, column: 61, scope: !3770)
!3959 = !DILocation(line: 1209, column: 67, scope: !3770)
!3960 = !DILocation(line: 1209, column: 76, scope: !3770)
!3961 = !DILocation(line: 1209, column: 2, scope: !3770)
!3962 = !DILocation(line: 1211, column: 6, scope: !3963)
!3963 = distinct !DILexicalBlock(scope: !3770, file: !22, line: 1211, column: 6)
!3964 = !DILocation(line: 1211, column: 16, scope: !3963)
!3965 = !DILocation(line: 1220, column: 2, scope: !3966)
!3966 = distinct !DILexicalBlock(scope: !3963, file: !22, line: 1212, column: 2)
!3967 = !DILocation(line: 1222, column: 35, scope: !3770)
!3968 = !DILocation(line: 1222, column: 39, scope: !3770)
!3969 = !DILocation(line: 1222, column: 48, scope: !3770)
!3970 = !DILocation(line: 1222, column: 101, scope: !3770)
!3971 = !DILocation(line: 1222, column: 88, scope: !3770)
!3972 = !DILocation(line: 1222, column: 105, scope: !3770)
!3973 = !DILocation(line: 1222, column: 11, scope: !3770)
!3974 = !DILocation(line: 1222, column: 9, scope: !3770)
!3975 = !DILocation(line: 1224, column: 6, scope: !3976)
!3976 = distinct !DILexicalBlock(scope: !3770, file: !22, line: 1224, column: 6)
!3977 = !DILocation(line: 1224, column: 13, scope: !3976)
!3978 = !DILocation(line: 1226, column: 3, scope: !3979)
!3979 = distinct !DILexicalBlock(scope: !3976, file: !22, line: 1225, column: 2)
!3980 = !DILocation(line: 1227, column: 3, scope: !3979)
!3981 = !DILocation(line: 1228, column: 10, scope: !3979)
!3982 = !DILocation(line: 1228, column: 3, scope: !3979)
!3983 = !DILocation(line: 1231, column: 17, scope: !3770)
!3984 = !DILocation(line: 1231, column: 9, scope: !3770)
!3985 = !DILocation(line: 1231, column: 6, scope: !3770)
!3986 = !DILocation(line: 1233, column: 2, scope: !3770)
!3987 = !DILocation(line: 1233, column: 7, scope: !3770)
!3988 = !DILocation(line: 1233, column: 23, scope: !3770)
!3989 = !DILocation(line: 1233, column: 32, scope: !3770)
!3990 = !DILocation(line: 1234, column: 2, scope: !3770)
!3991 = !DILocation(line: 1234, column: 7, scope: !3770)
!3992 = !DILocation(line: 1234, column: 23, scope: !3770)
!3993 = !DILocation(line: 1234, column: 28, scope: !3770)
!3994 = !DILocation(line: 1235, column: 2, scope: !3770)
!3995 = !DILocation(line: 1235, column: 7, scope: !3770)
!3996 = !DILocation(line: 1235, column: 23, scope: !3770)
!3997 = !DILocation(line: 1235, column: 28, scope: !3770)
!3998 = !DILocation(line: 1237, column: 2, scope: !3770)
!3999 = !DILocation(line: 1237, column: 7, scope: !3770)
!4000 = !DILocation(line: 1237, column: 23, scope: !3770)
!4001 = !DILocation(line: 1237, column: 29, scope: !3770)
!4002 = !DILocation(line: 1239, column: 49, scope: !3770)
!4003 = !DILocation(line: 1239, column: 54, scope: !3770)
!4004 = !DILocation(line: 1239, column: 36, scope: !3770)
!4005 = !DILocation(line: 1239, column: 58, scope: !3770)
!4006 = !DILocation(line: 1239, column: 2, scope: !3770)
!4007 = !DILocation(line: 1239, column: 7, scope: !3770)
!4008 = !DILocation(line: 1239, column: 24, scope: !3770)
!4009 = !DILocation(line: 1239, column: 34, scope: !3770)
!4010 = !DILocation(line: 1240, column: 42, scope: !3770)
!4011 = !DILocation(line: 1240, column: 47, scope: !3770)
!4012 = !DILocation(line: 1240, column: 64, scope: !3770)
!4013 = !DILocation(line: 1240, column: 36, scope: !3770)
!4014 = !DILocation(line: 1240, column: 75, scope: !3770)
!4015 = !DILocation(line: 1240, column: 2, scope: !3770)
!4016 = !DILocation(line: 1240, column: 7, scope: !3770)
!4017 = !DILocation(line: 1240, column: 24, scope: !3770)
!4018 = !DILocation(line: 1240, column: 34, scope: !3770)
!4019 = !DILocation(line: 1241, column: 2, scope: !3770)
!4020 = !DILocation(line: 1241, column: 7, scope: !3770)
!4021 = !DILocation(line: 1241, column: 24, scope: !3770)
!4022 = !DILocation(line: 1241, column: 33, scope: !3770)
!4023 = !DILocation(line: 1243, column: 6, scope: !4024)
!4024 = distinct !DILexicalBlock(scope: !3770, file: !22, line: 1243, column: 6)
!4025 = !DILocation(line: 1243, column: 17, scope: !4024)
!4026 = !DILocation(line: 1243, column: 14, scope: !4024)
!4027 = !DILocation(line: 1244, column: 3, scope: !4024)
!4028 = !DILocation(line: 1244, column: 8, scope: !4024)
!4029 = !DILocation(line: 1244, column: 27, scope: !4024)
!4030 = !DILocation(line: 1244, column: 33, scope: !4024)
!4031 = !DILocation(line: 1246, column: 10, scope: !3770)
!4032 = !DILocation(line: 1246, column: 15, scope: !3770)
!4033 = !DILocation(line: 1246, column: 2, scope: !3770)
!4034 = !DILocation(line: 1252, column: 20, scope: !4035)
!4035 = distinct !DILexicalBlock(scope: !3770, file: !22, line: 1247, column: 2)
!4036 = !DILocation(line: 1252, column: 29, scope: !4035)
!4037 = !DILocation(line: 1252, column: 41, scope: !4035)
!4038 = !DILocation(line: 1252, column: 3, scope: !4035)
!4039 = !DILocation(line: 1252, column: 8, scope: !4035)
!4040 = !DILocation(line: 1252, column: 17, scope: !4035)
!4041 = !DILocation(line: 1253, column: 7, scope: !4042)
!4042 = distinct !DILexicalBlock(scope: !4035, file: !22, line: 1253, column: 7)
!4043 = !DILocation(line: 1253, column: 17, scope: !4042)
!4044 = !DILocation(line: 1254, column: 4, scope: !4042)
!4045 = !DILocation(line: 1254, column: 9, scope: !4042)
!4046 = !DILocation(line: 1254, column: 18, scope: !4042)
!4047 = !DILocation(line: 1255, column: 3, scope: !4035)
!4048 = !DILocation(line: 1259, column: 3, scope: !4035)
!4049 = !DILocation(line: 1262, column: 9, scope: !3770)
!4050 = !DILocation(line: 1262, column: 2, scope: !3770)
!4051 = !DILocation(line: 1263, column: 1, scope: !3770)
!4052 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !75, file: !75, line: 49, type: !4053, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!4053 = !DISubroutineType(types: !4054)
!4054 = !{!74, !7}
!4055 = !DILocalVariable(name: "i", arg: 1, scope: !4052, file: !75, line: 49, type: !7)
!4056 = !DILocation(line: 49, column: 23, scope: !4052)
!4057 = !DILocation(line: 51, column: 9, scope: !4052)
!4058 = !DILocation(line: 51, column: 11, scope: !4052)
!4059 = !DILocation(line: 51, column: 2, scope: !4052)
!4060 = distinct !DISubprogram(name: "DropCurrentWeapon", linkageName: "_Z17DropCurrentWeaponv", scope: !22, file: !22, line: 1265, type: !879, scopeLine: 1266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!4061 = !DILocalVariable(name: "objnum", scope: !4060, file: !22, line: 1267, type: !7)
!4062 = !DILocation(line: 1267, column: 6, scope: !4060)
!4063 = !DILocalVariable(name: "ammo", scope: !4060, file: !22, line: 1267, type: !7)
!4064 = !DILocation(line: 1267, column: 14, scope: !4060)
!4065 = !DILocalVariable(name: "seed", scope: !4060, file: !22, line: 1267, type: !7)
!4066 = !DILocation(line: 1267, column: 24, scope: !4060)
!4067 = !DILocation(line: 1269, column: 6, scope: !4068)
!4068 = distinct !DILexicalBlock(scope: !4060, file: !22, line: 1269, column: 6)
!4069 = !DILocation(line: 1269, column: 21, scope: !4068)
!4070 = !DILocation(line: 1271, column: 3, scope: !4071)
!4071 = distinct !DILexicalBlock(scope: !4068, file: !22, line: 1270, column: 2)
!4072 = !DILocation(line: 1272, column: 3, scope: !4071)
!4073 = !DILocation(line: 1275, column: 34, scope: !4060)
!4074 = !DILocation(line: 1275, column: 2, scope: !4060)
!4075 = !DILocation(line: 1276, column: 2, scope: !4060)
!4076 = !DILocation(line: 1278, column: 9, scope: !4060)
!4077 = !DILocation(line: 1278, column: 7, scope: !4060)
!4078 = !DILocation(line: 1280, column: 24, scope: !4060)
!4079 = !DILocation(line: 1280, column: 65, scope: !4060)
!4080 = !DILocation(line: 1280, column: 39, scope: !4060)
!4081 = !DILocation(line: 1280, column: 82, scope: !4060)
!4082 = !DILocation(line: 1280, column: 11, scope: !4060)
!4083 = !DILocation(line: 1280, column: 9, scope: !4060)
!4084 = !DILocation(line: 1282, column: 6, scope: !4085)
!4085 = distinct !DILexicalBlock(scope: !4060, file: !22, line: 1282, column: 6)
!4086 = !DILocation(line: 1282, column: 13, scope: !4085)
!4087 = !DILocation(line: 1283, column: 3, scope: !4085)
!4088 = !DILocation(line: 1285, column: 6, scope: !4089)
!4089 = distinct !DILexicalBlock(scope: !4060, file: !22, line: 1285, column: 6)
!4090 = !DILocation(line: 1285, column: 21, scope: !4089)
!4091 = !DILocation(line: 1285, column: 37, scope: !4089)
!4092 = !DILocation(line: 1285, column: 40, scope: !4089)
!4093 = !DILocation(line: 1285, column: 55, scope: !4089)
!4094 = !DILocation(line: 1289, column: 18, scope: !4095)
!4095 = distinct !DILexicalBlock(scope: !4089, file: !22, line: 1286, column: 2)
!4096 = !DILocation(line: 1289, column: 10, scope: !4095)
!4097 = !DILocation(line: 1289, column: 30, scope: !4095)
!4098 = !DILocation(line: 1289, column: 8, scope: !4095)
!4099 = !DILocation(line: 1291, column: 16, scope: !4100)
!4100 = distinct !DILexicalBlock(scope: !4095, file: !22, line: 1291, column: 7)
!4101 = !DILocation(line: 1291, column: 8, scope: !4100)
!4102 = !DILocation(line: 1291, column: 28, scope: !4100)
!4103 = !DILocation(line: 1291, column: 49, scope: !4100)
!4104 = !DILocation(line: 1291, column: 7, scope: !4100)
!4105 = !DILocation(line: 1291, column: 75, scope: !4100)
!4106 = !DILocation(line: 1291, column: 87, scope: !4100)
!4107 = !DILocation(line: 1291, column: 79, scope: !4100)
!4108 = !DILocation(line: 1291, column: 99, scope: !4100)
!4109 = !DILocation(line: 1291, column: 120, scope: !4100)
!4110 = !DILocation(line: 1291, column: 78, scope: !4100)
!4111 = !DILocation(line: 1292, column: 9, scope: !4100)
!4112 = !DILocation(line: 1292, column: 4, scope: !4100)
!4113 = !DILocation(line: 1294, column: 53, scope: !4095)
!4114 = !DILocation(line: 1294, column: 11, scope: !4095)
!4115 = !DILocation(line: 1294, column: 3, scope: !4095)
!4116 = !DILocation(line: 1294, column: 23, scope: !4095)
!4117 = !DILocation(line: 1294, column: 50, scope: !4095)
!4118 = !DILocation(line: 1296, column: 7, scope: !4119)
!4119 = distinct !DILexicalBlock(scope: !4095, file: !22, line: 1296, column: 7)
!4120 = !DILocation(line: 1296, column: 14, scope: !4119)
!4121 = !DILocation(line: 1297, column: 47, scope: !4119)
!4122 = !DILocation(line: 1297, column: 12, scope: !4119)
!4123 = !DILocation(line: 1297, column: 4, scope: !4119)
!4124 = !DILocation(line: 1297, column: 20, scope: !4119)
!4125 = !DILocation(line: 1297, column: 39, scope: !4119)
!4126 = !DILocation(line: 1297, column: 45, scope: !4119)
!4127 = !DILocation(line: 1298, column: 2, scope: !4095)
!4128 = !DILocation(line: 1300, column: 6, scope: !4129)
!4129 = distinct !DILexicalBlock(scope: !4060, file: !22, line: 1300, column: 6)
!4130 = !DILocation(line: 1300, column: 21, scope: !4129)
!4131 = !DILocation(line: 1305, column: 7, scope: !4132)
!4132 = distinct !DILexicalBlock(scope: !4133, file: !22, line: 1305, column: 7)
!4133 = distinct !DILexicalBlock(scope: !4129, file: !22, line: 1301, column: 2)
!4134 = !DILocation(line: 1305, column: 14, scope: !4132)
!4135 = !DILocation(line: 1306, column: 47, scope: !4132)
!4136 = !DILocation(line: 1306, column: 12, scope: !4132)
!4137 = !DILocation(line: 1306, column: 4, scope: !4132)
!4138 = !DILocation(line: 1306, column: 20, scope: !4132)
!4139 = !DILocation(line: 1306, column: 39, scope: !4132)
!4140 = !DILocation(line: 1306, column: 45, scope: !4132)
!4141 = !DILocation(line: 1307, column: 2, scope: !4133)
!4142 = !DILocation(line: 1314, column: 54, scope: !4060)
!4143 = !DILocation(line: 1314, column: 51, scope: !4060)
!4144 = !DILocation(line: 1314, column: 47, scope: !4060)
!4145 = !DILocation(line: 1314, column: 10, scope: !4060)
!4146 = !DILocation(line: 1314, column: 2, scope: !4060)
!4147 = !DILocation(line: 1314, column: 22, scope: !4060)
!4148 = !DILocation(line: 1314, column: 43, scope: !4060)
!4149 = !DILocation(line: 1315, column: 2, scope: !4060)
!4150 = !DILocation(line: 1316, column: 1, scope: !4060)
!4151 = distinct !DISubprogram(name: "DropSecondaryWeapon", linkageName: "_Z19DropSecondaryWeaponv", scope: !22, file: !22, line: 1319, type: !879, scopeLine: 1320, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!4152 = !DILocalVariable(name: "objnum", scope: !4151, file: !22, line: 1321, type: !7)
!4153 = !DILocation(line: 1321, column: 6, scope: !4151)
!4154 = !DILocalVariable(name: "seed", scope: !4151, file: !22, line: 1321, type: !7)
!4155 = !DILocation(line: 1321, column: 14, scope: !4151)
!4156 = !DILocation(line: 1323, column: 14, scope: !4157)
!4157 = distinct !DILexicalBlock(scope: !4151, file: !22, line: 1323, column: 6)
!4158 = !DILocation(line: 1323, column: 6, scope: !4157)
!4159 = !DILocation(line: 1323, column: 26, scope: !4157)
!4160 = !DILocation(line: 1323, column: 41, scope: !4157)
!4161 = !DILocation(line: 1323, column: 59, scope: !4157)
!4162 = !DILocation(line: 1325, column: 3, scope: !4163)
!4163 = distinct !DILexicalBlock(scope: !4157, file: !22, line: 1324, column: 2)
!4164 = !DILocation(line: 1326, column: 3, scope: !4163)
!4165 = !DILocation(line: 1329, column: 35, scope: !4166)
!4166 = distinct !DILexicalBlock(scope: !4151, file: !22, line: 1329, column: 6)
!4167 = !DILocation(line: 1329, column: 7, scope: !4166)
!4168 = !DILocation(line: 1329, column: 53, scope: !4166)
!4169 = !DILocation(line: 1329, column: 77, scope: !4166)
!4170 = !DILocation(line: 1330, column: 31, scope: !4166)
!4171 = !DILocation(line: 1330, column: 3, scope: !4166)
!4172 = !DILocation(line: 1330, column: 49, scope: !4166)
!4173 = !DILocation(line: 1330, column: 68, scope: !4166)
!4174 = !DILocation(line: 1331, column: 11, scope: !4166)
!4175 = !DILocation(line: 1331, column: 3, scope: !4166)
!4176 = !DILocation(line: 1331, column: 23, scope: !4166)
!4177 = !DILocation(line: 1331, column: 38, scope: !4166)
!4178 = !DILocation(line: 1331, column: 56, scope: !4166)
!4179 = !DILocation(line: 1333, column: 3, scope: !4180)
!4180 = distinct !DILexicalBlock(scope: !4166, file: !22, line: 1332, column: 2)
!4181 = !DILocation(line: 1334, column: 3, scope: !4180)
!4182 = !DILocation(line: 1337, column: 34, scope: !4151)
!4183 = !DILocation(line: 1337, column: 2, scope: !4151)
!4184 = !DILocation(line: 1338, column: 2, scope: !4151)
!4185 = !DILocation(line: 1340, column: 9, scope: !4151)
!4186 = !DILocation(line: 1340, column: 7, scope: !4151)
!4187 = !DILocation(line: 1342, column: 24, scope: !4151)
!4188 = !DILocation(line: 1342, column: 67, scope: !4151)
!4189 = !DILocation(line: 1342, column: 39, scope: !4151)
!4190 = !DILocation(line: 1342, column: 86, scope: !4151)
!4191 = !DILocation(line: 1342, column: 11, scope: !4151)
!4192 = !DILocation(line: 1342, column: 9, scope: !4151)
!4193 = !DILocation(line: 1344, column: 6, scope: !4194)
!4194 = distinct !DILexicalBlock(scope: !4151, file: !22, line: 1344, column: 6)
!4195 = !DILocation(line: 1344, column: 13, scope: !4194)
!4196 = !DILocation(line: 1345, column: 3, scope: !4194)
!4197 = !DILocation(line: 1352, column: 34, scope: !4198)
!4198 = distinct !DILexicalBlock(scope: !4151, file: !22, line: 1352, column: 6)
!4199 = !DILocation(line: 1352, column: 6, scope: !4198)
!4200 = !DILocation(line: 1352, column: 52, scope: !4198)
!4201 = !DILocation(line: 1352, column: 76, scope: !4198)
!4202 = !DILocation(line: 1353, column: 31, scope: !4198)
!4203 = !DILocation(line: 1353, column: 3, scope: !4198)
!4204 = !DILocation(line: 1353, column: 49, scope: !4198)
!4205 = !DILocation(line: 1354, column: 11, scope: !4198)
!4206 = !DILocation(line: 1354, column: 3, scope: !4198)
!4207 = !DILocation(line: 1354, column: 23, scope: !4198)
!4208 = !DILocation(line: 1354, column: 38, scope: !4198)
!4209 = !DILocation(line: 1354, column: 56, scope: !4198)
!4210 = !DILocation(line: 1356, column: 11, scope: !4198)
!4211 = !DILocation(line: 1356, column: 3, scope: !4198)
!4212 = !DILocation(line: 1356, column: 23, scope: !4198)
!4213 = !DILocation(line: 1356, column: 38, scope: !4198)
!4214 = !DILocation(line: 1356, column: 55, scope: !4198)
!4215 = !DILocation(line: 1358, column: 14, scope: !4216)
!4216 = distinct !DILexicalBlock(scope: !4151, file: !22, line: 1358, column: 6)
!4217 = !DILocation(line: 1358, column: 6, scope: !4216)
!4218 = !DILocation(line: 1358, column: 26, scope: !4216)
!4219 = !DILocation(line: 1358, column: 41, scope: !4216)
!4220 = !DILocation(line: 1358, column: 59, scope: !4216)
!4221 = !DILocation(line: 1360, column: 57, scope: !4222)
!4222 = distinct !DILexicalBlock(scope: !4216, file: !22, line: 1359, column: 2)
!4223 = !DILocation(line: 1360, column: 54, scope: !4222)
!4224 = !DILocation(line: 1360, column: 50, scope: !4222)
!4225 = !DILocation(line: 1360, column: 11, scope: !4222)
!4226 = !DILocation(line: 1360, column: 3, scope: !4222)
!4227 = !DILocation(line: 1360, column: 23, scope: !4222)
!4228 = !DILocation(line: 1360, column: 46, scope: !4222)
!4229 = !DILocation(line: 1361, column: 3, scope: !4222)
!4230 = !DILocation(line: 1362, column: 2, scope: !4222)
!4231 = !DILocation(line: 1363, column: 1, scope: !4151)
!4232 = distinct !DISubprogram(name: "do_seismic_stuff", linkageName: "_Z16do_seismic_stuffv", scope: !22, file: !22, line: 1367, type: !879, scopeLine: 1368, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1603)
!4233 = !DILocalVariable(name: "stv_save", scope: !4232, file: !22, line: 1369, type: !7)
!4234 = !DILocation(line: 1369, column: 6, scope: !4232)
!4235 = !DILocation(line: 1371, column: 13, scope: !4232)
!4236 = !DILocation(line: 1371, column: 11, scope: !4232)
!4237 = !DILocation(line: 1372, column: 27, scope: !4232)
!4238 = !DILocation(line: 1373, column: 24, scope: !4232)
!4239 = !DILocation(line: 1375, column: 2, scope: !4232)
!4240 = !DILocation(line: 1376, column: 2, scope: !4232)
!4241 = !DILocation(line: 1378, column: 6, scope: !4242)
!4242 = distinct !DILexicalBlock(scope: !4232, file: !22, line: 1378, column: 6)
!4243 = !DILocation(line: 1378, column: 15, scope: !4242)
!4244 = !DILocation(line: 1380, column: 7, scope: !4245)
!4245 = distinct !DILexicalBlock(scope: !4246, file: !22, line: 1380, column: 7)
!4246 = distinct !DILexicalBlock(scope: !4242, file: !22, line: 1379, column: 2)
!4247 = !DILocation(line: 1380, column: 29, scope: !4245)
!4248 = !DILocation(line: 1382, column: 4, scope: !4249)
!4249 = distinct !DILexicalBlock(scope: !4245, file: !22, line: 1381, column: 3)
!4250 = !DILocation(line: 1383, column: 26, scope: !4249)
!4251 = !DILocation(line: 1384, column: 3, scope: !4249)
!4252 = !DILocation(line: 1386, column: 8, scope: !4253)
!4253 = distinct !DILexicalBlock(scope: !4246, file: !22, line: 1386, column: 7)
!4254 = !DILocation(line: 1386, column: 19, scope: !4253)
!4255 = !DILocation(line: 1386, column: 17, scope: !4253)
!4256 = !DILocation(line: 1386, column: 44, scope: !4253)
!4257 = !DILocation(line: 1386, column: 47, scope: !4253)
!4258 = !DILocalVariable(name: "volume", scope: !4259, file: !22, line: 1388, type: !7)
!4259 = distinct !DILexicalBlock(scope: !4253, file: !22, line: 1387, column: 3)
!4260 = !DILocation(line: 1388, column: 8, scope: !4259)
!4261 = !DILocation(line: 1390, column: 13, scope: !4259)
!4262 = !DILocation(line: 1390, column: 35, scope: !4259)
!4263 = !DILocation(line: 1390, column: 11, scope: !4259)
!4264 = !DILocation(line: 1391, column: 8, scope: !4265)
!4265 = distinct !DILexicalBlock(scope: !4259, file: !22, line: 1391, column: 8)
!4266 = !DILocation(line: 1391, column: 15, scope: !4265)
!4267 = !DILocation(line: 1392, column: 12, scope: !4265)
!4268 = !DILocation(line: 1392, column: 5, scope: !4265)
!4269 = !DILocation(line: 1393, column: 31, scope: !4259)
!4270 = !DILocation(line: 1393, column: 4, scope: !4259)
!4271 = !DILocation(line: 1394, column: 30, scope: !4259)
!4272 = !DILocation(line: 1394, column: 41, scope: !4259)
!4273 = !DILocation(line: 1394, column: 50, scope: !4259)
!4274 = !DILocation(line: 1394, column: 39, scope: !4259)
!4275 = !DILocation(line: 1394, column: 54, scope: !4259)
!4276 = !DILocation(line: 1394, column: 28, scope: !4259)
!4277 = !DILocation(line: 1395, column: 3, scope: !4259)
!4278 = !DILocation(line: 1396, column: 2, scope: !4246)
!4279 = !DILocation(line: 1398, column: 1, scope: !4232)
!4280 = distinct !DISubprogram(name: "tactile_set_button_jolt", linkageName: "_Z23tactile_set_button_joltv", scope: !22, file: !22, line: 1403, type: !879, scopeLine: 1404, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4281 = !DILocation(line: 1438, column: 2, scope: !4280)
