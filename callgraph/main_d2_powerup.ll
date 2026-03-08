; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/powerup.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/powerup.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.powerup_type_info = type { i32, i32, i32, i32 }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.bitmap_index = type { i16 }
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
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%"class.std::__1::vector" = type { ptr, ptr, ptr }
%struct.vclip_info_s = type { i32, i32, i8 }
%struct.powerup_info_s = type { i32, i32, i32 }

@N_powerup_types = global i32 0, align 4, !dbg !0
@Powerup_info = global [50 x %struct.powerup_type_info] zeroinitializer, align 4, !dbg !7
@Vclip = external global [110 x %struct.vclip], align 4
@FrameTime = external global i32, align 4
@Objects = external global [0 x %struct.object], align 4
@.str = private unnamed_addr constant [18 x i8] c"MEGA-WOWIE-ZOWIE!\00", align 1, !dbg !26
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Newdemo_state = external global i32, align 4
@Game_mode = external global i32, align 4
@Difficulty_level = external global i32, align 4
@.str.1 = private unnamed_addr constant [9 x i8] c"%s %s %d\00", align 1, !dbg !33
@Text_string = external global %"class.std::__1::vector", align 8
@Primary_weapon = external global i8, align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s!\00", align 1, !dbg !38
@Primary_ammo_max = external global [10 x i32], align 4
@.str.3 = private unnamed_addr constant [10 x i8] c"%s %d %s!\00", align 1, !dbg !43
@Headlight_active_default = global i32 1, align 4, !dbg !48
@Player_is_dead = external global i32, align 4
@ConsoleObject = external global ptr, align 8
@GameTime = external global i32, align 4
@PlayerMessage = external global i32, align 4
@.str.4 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1, !dbg !50
@.str.5 = private unnamed_addr constant [7 x i8] c"%s %s!\00", align 1, !dbg !55
@Omega_charge = external global i32, align 4
@.str.6 = private unnamed_addr constant [13 x i8] c"the FULL MAP\00", align 1, !dbg !60
@.str.7 = private unnamed_addr constant [10 x i8] c"FULL MAP!\00", align 1, !dbg !65
@.str.8 = private unnamed_addr constant [14 x i8] c"the Converter\00", align 1, !dbg !67
@.str.9 = private unnamed_addr constant [44 x i8] c"Energy->Shield converter! (Press %c to use)\00", align 1, !dbg !72
@.str.10 = private unnamed_addr constant [28 x i8] c"Energy -> shield converter!\00", align 1, !dbg !77
@.str.11 = private unnamed_addr constant [23 x i8] c"SUPER LASER MAXED OUT!\00", align 1, !dbg !82
@.str.12 = private unnamed_addr constant [30 x i8] c"Super Boost to Laser level %d\00", align 1, !dbg !87
@.str.13 = private unnamed_addr constant [14 x i8] c"the Ammo rack\00", align 1, !dbg !92
@.str.14 = private unnamed_addr constant [11 x i8] c"AMMO RACK!\00", align 1, !dbg !94
@.str.15 = private unnamed_addr constant [16 x i8] c"the Afterburner\00", align 1, !dbg !99
@.str.16 = private unnamed_addr constant [13 x i8] c"AFTERBURNER!\00", align 1, !dbg !104
@Afterburner_charge = external global i32, align 4
@.str.17 = private unnamed_addr constant [20 x i8] c"the Headlight boost\00", align 1, !dbg !106
@.str.18 = private unnamed_addr constant [35 x i8] c"HEADLIGHT BOOST! (Headlight is %s)\00", align 1, !dbg !111
@.str.19 = private unnamed_addr constant [3 x i8] c"ON\00", align 1, !dbg !116
@.str.20 = private unnamed_addr constant [4 x i8] c"OFF\00", align 1, !dbg !121

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16do_powerup_frameP6object(ptr noundef %0) #0 !dbg !1427 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1566, !DIExpression(), !1567)
    #dbg_declare(ptr %3, !1568, !DIExpression(), !1569)
    #dbg_declare(ptr %4, !1570, !DIExpression(), !1572)
  %6 = load ptr, ptr %2, align 8, !dbg !1573
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 23, !dbg !1574
  store ptr %7, ptr %4, align 8, !dbg !1572
    #dbg_declare(ptr %5, !1575, !DIExpression(), !1594)
  %8 = load ptr, ptr %4, align 8, !dbg !1595
  %9 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %8, i32 0, i32 0, !dbg !1596
  %10 = load i32, ptr %9, align 4, !dbg !1596
  %11 = sext i32 %10 to i64, !dbg !1597
  %12 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %11, !dbg !1597
  store ptr %12, ptr %5, align 8, !dbg !1594
  %13 = load i32, ptr @FrameTime, align 4, !dbg !1598
  %14 = sext i32 %13 to i64, !dbg !1598
  %15 = load ptr, ptr %2, align 8, !dbg !1599
  %16 = ptrtoint ptr %15 to i64, !dbg !1600
  %17 = sub i64 %16, ptrtoint (ptr @Objects to i64), !dbg !1600
  %18 = sdiv exact i64 %17, 268, !dbg !1600
  %19 = and i64 %18, 3, !dbg !1601
  %20 = mul nsw i64 %14, %19, !dbg !1602
  %21 = ashr i64 %20, 4, !dbg !1603
  %22 = trunc i64 %21 to i32, !dbg !1604
  store i32 %22, ptr %3, align 4, !dbg !1605
  %23 = load i32, ptr @FrameTime, align 4, !dbg !1606
  %24 = load i32, ptr %3, align 4, !dbg !1607
  %25 = add nsw i32 %23, %24, !dbg !1608
  %26 = load ptr, ptr %4, align 8, !dbg !1609
  %27 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %26, i32 0, i32 1, !dbg !1610
  %28 = load i32, ptr %27, align 4, !dbg !1611
  %29 = sub nsw i32 %28, %25, !dbg !1611
  store i32 %29, ptr %27, align 4, !dbg !1611
  br label %30, !dbg !1612

30:                                               ; preds = %85, %1
  %31 = load ptr, ptr %4, align 8, !dbg !1613
  %32 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %31, i32 0, i32 1, !dbg !1614
  %33 = load i32, ptr %32, align 4, !dbg !1614
  %34 = icmp slt i32 %33, 0, !dbg !1615
  br i1 %34, label %35, label %86, !dbg !1612

35:                                               ; preds = %30
  %36 = load ptr, ptr %5, align 8, !dbg !1616
  %37 = getelementptr inbounds nuw %struct.vclip, ptr %36, i32 0, i32 2, !dbg !1618
  %38 = load i32, ptr %37, align 4, !dbg !1618
  %39 = load ptr, ptr %4, align 8, !dbg !1619
  %40 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %39, i32 0, i32 1, !dbg !1620
  %41 = load i32, ptr %40, align 4, !dbg !1621
  %42 = add nsw i32 %41, %38, !dbg !1621
  store i32 %42, ptr %40, align 4, !dbg !1621
  %43 = load ptr, ptr %2, align 8, !dbg !1622
  %44 = ptrtoint ptr %43 to i64, !dbg !1624
  %45 = sub i64 %44, ptrtoint (ptr @Objects to i64), !dbg !1624
  %46 = sdiv exact i64 %45, 268, !dbg !1624
  %47 = and i64 %46, 1, !dbg !1625
  %48 = icmp ne i64 %47, 0, !dbg !1626
  br i1 %48, label %49, label %54, !dbg !1626

49:                                               ; preds = %35
  %50 = load ptr, ptr %4, align 8, !dbg !1627
  %51 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %50, i32 0, i32 2, !dbg !1628
  %52 = load i8, ptr %51, align 4, !dbg !1629
  %53 = add i8 %52, -1, !dbg !1629
  store i8 %53, ptr %51, align 4, !dbg !1629
  br label %59, !dbg !1627

54:                                               ; preds = %35
  %55 = load ptr, ptr %4, align 8, !dbg !1630
  %56 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %55, i32 0, i32 2, !dbg !1631
  %57 = load i8, ptr %56, align 4, !dbg !1632
  %58 = add i8 %57, 1, !dbg !1632
  store i8 %58, ptr %56, align 4, !dbg !1632
  br label %59

59:                                               ; preds = %54, %49
  %60 = load ptr, ptr %4, align 8, !dbg !1633
  %61 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %60, i32 0, i32 2, !dbg !1635
  %62 = load i8, ptr %61, align 4, !dbg !1635
  %63 = sext i8 %62 to i32, !dbg !1633
  %64 = load ptr, ptr %5, align 8, !dbg !1636
  %65 = getelementptr inbounds nuw %struct.vclip, ptr %64, i32 0, i32 1, !dbg !1637
  %66 = load i32, ptr %65, align 4, !dbg !1637
  %67 = icmp sge i32 %63, %66, !dbg !1638
  br i1 %67, label %68, label %71, !dbg !1638

68:                                               ; preds = %59
  %69 = load ptr, ptr %4, align 8, !dbg !1639
  %70 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %69, i32 0, i32 2, !dbg !1640
  store i8 0, ptr %70, align 4, !dbg !1641
  br label %71, !dbg !1639

71:                                               ; preds = %68, %59
  %72 = load ptr, ptr %4, align 8, !dbg !1642
  %73 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %72, i32 0, i32 2, !dbg !1644
  %74 = load i8, ptr %73, align 4, !dbg !1644
  %75 = sext i8 %74 to i32, !dbg !1642
  %76 = icmp slt i32 %75, 0, !dbg !1645
  br i1 %76, label %77, label %85, !dbg !1645

77:                                               ; preds = %71
  %78 = load ptr, ptr %5, align 8, !dbg !1646
  %79 = getelementptr inbounds nuw %struct.vclip, ptr %78, i32 0, i32 1, !dbg !1647
  %80 = load i32, ptr %79, align 4, !dbg !1647
  %81 = sub nsw i32 %80, 1, !dbg !1648
  %82 = trunc i32 %81 to i8, !dbg !1646
  %83 = load ptr, ptr %4, align 8, !dbg !1649
  %84 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %83, i32 0, i32 2, !dbg !1650
  store i8 %82, ptr %84, align 4, !dbg !1651
  br label %85, !dbg !1649

85:                                               ; preds = %77, %71
  br label %30, !dbg !1612, !llvm.loop !1652

86:                                               ; preds = %30
  %87 = load ptr, ptr %2, align 8, !dbg !1655
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 20, !dbg !1657
  %89 = load i32, ptr %88, align 4, !dbg !1657
  %90 = icmp sle i32 %89, 0, !dbg !1658
  br i1 %90, label %91, label %111, !dbg !1658

91:                                               ; preds = %86
  %92 = load ptr, ptr %2, align 8, !dbg !1659
  %93 = getelementptr inbounds nuw %struct.object, ptr %92, i32 0, i32 9, !dbg !1661
  %94 = load i16, ptr %93, align 2, !dbg !1661
  %95 = load ptr, ptr %2, align 8, !dbg !1662
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 11, !dbg !1663
  %97 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %94, ptr noundef %96, i32 noundef 229376, i32 noundef 62), !dbg !1664
  %98 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 62), i32 0, i32 4), align 4, !dbg !1665
  %99 = sext i16 %98 to i32, !dbg !1667
  %100 = icmp sgt i32 %99, -1, !dbg !1668
  br i1 %100, label %101, label %110, !dbg !1668

101:                                              ; preds = %91
  %102 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 62), i32 0, i32 4), align 4, !dbg !1669
  %103 = sext i16 %102 to i32, !dbg !1670
  %104 = load ptr, ptr %2, align 8, !dbg !1671
  %105 = ptrtoint ptr %104 to i64, !dbg !1672
  %106 = sub i64 %105, ptrtoint (ptr @Objects to i64), !dbg !1672
  %107 = sdiv exact i64 %106, 268, !dbg !1672
  %108 = trunc i64 %107 to i16, !dbg !1671
  %109 = call noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef %103, i16 noundef signext %108, i32 noundef 0, i32 noundef 65536), !dbg !1673
  br label %110, !dbg !1673

110:                                              ; preds = %101, %91
  br label %111, !dbg !1674

111:                                              ; preds = %110, %86
  ret void, !dbg !1675
}

declare noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef, i16 noundef signext, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12draw_powerupP6object(ptr noundef %0) #0 !dbg !1676 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.bitmap_index, align 2
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1677, !DIExpression(), !1678)
  %4 = load ptr, ptr %2, align 8, !dbg !1679
  %5 = load ptr, ptr %2, align 8, !dbg !1680
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 23, !dbg !1681
  %7 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %6, i32 0, i32 0, !dbg !1682
  %8 = load i32, ptr %7, align 4, !dbg !1682
  %9 = sext i32 %8 to i64, !dbg !1683
  %10 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %9, !dbg !1683
  %11 = getelementptr inbounds nuw %struct.vclip, ptr %10, i32 0, i32 5, !dbg !1684
  %12 = load ptr, ptr %2, align 8, !dbg !1685
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 23, !dbg !1686
  %14 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %13, i32 0, i32 2, !dbg !1687
  %15 = load i8, ptr %14, align 4, !dbg !1687
  %16 = sext i8 %15 to i64, !dbg !1683
  %17 = getelementptr inbounds [30 x %struct.bitmap_index], ptr %11, i64 0, i64 %16, !dbg !1683
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %3, ptr align 2 %17, i64 2, i1 false), !dbg !1683
  %18 = getelementptr inbounds nuw %struct.bitmap_index, ptr %3, i32 0, i32 0, !dbg !1688
  %19 = load i16, ptr %18, align 2, !dbg !1688
  %20 = zext i16 %19 to i64, !dbg !1688
  call void @_Z16draw_object_blobP6object12bitmap_index(ptr noundef %4, i64 %20), !dbg !1688
  ret void, !dbg !1689
}

declare void @_Z16draw_object_blobP6object12bitmap_index(ptr noundef, i64) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13powerup_basiciiiiPKcz(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4, ...) #0 !dbg !1690 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca [120 x i8], align 1
  %12 = alloca ptr, align 8
  store i32 %0, ptr %6, align 4
    #dbg_declare(ptr %6, !1693, !DIExpression(), !1694)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !1695, !DIExpression(), !1696)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !1697, !DIExpression(), !1698)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !1699, !DIExpression(), !1700)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !1701, !DIExpression(), !1702)
    #dbg_declare(ptr %11, !1703, !DIExpression(), !1707)
    #dbg_declare(ptr %12, !1708, !DIExpression(), !1709)
  call void @llvm.va_start.p0(ptr %12), !dbg !1710
  %13 = getelementptr inbounds [120 x i8], ptr %11, i64 0, i64 0, !dbg !1711
  %14 = load ptr, ptr %10, align 8, !dbg !1712
  %15 = load ptr, ptr %12, align 8, !dbg !1713
  %16 = call i32 @vsprintf(ptr noundef %13, ptr noundef %14, ptr noundef %15) #6, !dbg !1714
  call void @llvm.va_end.p0(ptr %12), !dbg !1715
  %17 = load i32, ptr %6, align 4, !dbg !1716
  %18 = load i32, ptr %7, align 4, !dbg !1717
  %19 = load i32, ptr %8, align 4, !dbg !1718
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef %17, i32 noundef %18, i32 noundef %19), !dbg !1719
  %20 = getelementptr inbounds [120 x i8], ptr %11, i64 0, i64 0, !dbg !1720
  %21 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %20), !dbg !1721
  %22 = load i32, ptr %9, align 4, !dbg !1722
  call void @_Z19add_points_to_scorei(i32 noundef %22), !dbg !1723
  ret void, !dbg !1724
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #3

; Function Attrs: nounwind
declare i32 @vsprintf(ptr noundef, ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #3

declare void @_Z17PALETTE_FLASH_ADDiii(i32 noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z16HUD_init_messagePKcz(ptr noundef, ...) #1

declare void @_Z19add_points_to_scorei(i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18do_megawow_powerupi(i32 noundef %0) #0 !dbg !1725 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !1726, !DIExpression(), !1727)
    #dbg_declare(ptr %3, !1728, !DIExpression(), !1729)
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 30, i32 noundef 0, i32 noundef 30, i32 noundef 1, ptr noundef @.str), !dbg !1730
  %4 = load i32, ptr @Player_num, align 4, !dbg !1731
  %5 = sext i32 %4 to i64, !dbg !1732
  %6 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %5, !dbg !1732
  %7 = getelementptr inbounds nuw %struct.player, ptr %6, i32 0, i32 15, !dbg !1733
  store i16 -33, ptr %7, align 2, !dbg !1734
  %8 = load i32, ptr @Player_num, align 4, !dbg !1735
  %9 = sext i32 %8 to i64, !dbg !1736
  %10 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %9, !dbg !1736
  %11 = getelementptr inbounds nuw %struct.player, ptr %10, i32 0, i32 16, !dbg !1737
  store i16 -1, ptr %11, align 4, !dbg !1738
  store i32 0, ptr %3, align 4, !dbg !1739
  br label %12, !dbg !1741

12:                                               ; preds = %23, %1
  %13 = load i32, ptr %3, align 4, !dbg !1742
  %14 = icmp slt i32 %13, 10, !dbg !1744
  br i1 %14, label %15, label %26, !dbg !1745

15:                                               ; preds = %12
  %16 = load i32, ptr @Player_num, align 4, !dbg !1746
  %17 = sext i32 %16 to i64, !dbg !1747
  %18 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %17, !dbg !1747
  %19 = getelementptr inbounds nuw %struct.player, ptr %18, i32 0, i32 17, !dbg !1748
  %20 = load i32, ptr %3, align 4, !dbg !1749
  %21 = sext i32 %20 to i64, !dbg !1747
  %22 = getelementptr inbounds [10 x i16], ptr %19, i64 0, i64 %21, !dbg !1747
  store i16 1568, ptr %22, align 2, !dbg !1750
  br label %23, !dbg !1747

23:                                               ; preds = %15
  %24 = load i32, ptr %3, align 4, !dbg !1751
  %25 = add nsw i32 %24, 1, !dbg !1751
  store i32 %25, ptr %3, align 4, !dbg !1751
  br label %12, !dbg !1752, !llvm.loop !1753

26:                                               ; preds = %12
  store i32 0, ptr %3, align 4, !dbg !1755
  br label %27, !dbg !1757

27:                                               ; preds = %40, %26
  %28 = load i32, ptr %3, align 4, !dbg !1758
  %29 = icmp slt i32 %28, 3, !dbg !1760
  br i1 %29, label %30, label %43, !dbg !1761

30:                                               ; preds = %27
  %31 = load i32, ptr %2, align 4, !dbg !1762
  %32 = trunc i32 %31 to i16, !dbg !1762
  %33 = load i32, ptr @Player_num, align 4, !dbg !1763
  %34 = sext i32 %33 to i64, !dbg !1764
  %35 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %34, !dbg !1764
  %36 = getelementptr inbounds nuw %struct.player, ptr %35, i32 0, i32 18, !dbg !1765
  %37 = load i32, ptr %3, align 4, !dbg !1766
  %38 = sext i32 %37 to i64, !dbg !1764
  %39 = getelementptr inbounds [10 x i16], ptr %36, i64 0, i64 %38, !dbg !1764
  store i16 %32, ptr %39, align 2, !dbg !1767
  br label %40, !dbg !1764

40:                                               ; preds = %30
  %41 = load i32, ptr %3, align 4, !dbg !1768
  %42 = add nsw i32 %41, 1, !dbg !1768
  store i32 %42, ptr %3, align 4, !dbg !1768
  br label %27, !dbg !1769, !llvm.loop !1770

43:                                               ; preds = %27
  store i32 3, ptr %3, align 4, !dbg !1772
  br label %44, !dbg !1774

44:                                               ; preds = %58, %43
  %45 = load i32, ptr %3, align 4, !dbg !1775
  %46 = icmp slt i32 %45, 10, !dbg !1777
  br i1 %46, label %47, label %61, !dbg !1778

47:                                               ; preds = %44
  %48 = load i32, ptr %2, align 4, !dbg !1779
  %49 = sdiv i32 %48, 5, !dbg !1780
  %50 = trunc i32 %49 to i16, !dbg !1779
  %51 = load i32, ptr @Player_num, align 4, !dbg !1781
  %52 = sext i32 %51 to i64, !dbg !1782
  %53 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %52, !dbg !1782
  %54 = getelementptr inbounds nuw %struct.player, ptr %53, i32 0, i32 18, !dbg !1783
  %55 = load i32, ptr %3, align 4, !dbg !1784
  %56 = sext i32 %55 to i64, !dbg !1782
  %57 = getelementptr inbounds [10 x i16], ptr %54, i64 0, i64 %56, !dbg !1782
  store i16 %50, ptr %57, align 2, !dbg !1785
  br label %58, !dbg !1782

58:                                               ; preds = %47
  %59 = load i32, ptr %3, align 4, !dbg !1786
  %60 = add nsw i32 %59, 1, !dbg !1786
  store i32 %60, ptr %3, align 4, !dbg !1786
  br label %44, !dbg !1787, !llvm.loop !1788

61:                                               ; preds = %44
  %62 = load i32, ptr @Newdemo_state, align 4, !dbg !1790
  %63 = icmp eq i32 %62, 1, !dbg !1792
  br i1 %63, label %64, label %70, !dbg !1792

64:                                               ; preds = %61
  %65 = load i32, ptr @Player_num, align 4, !dbg !1793
  %66 = sext i32 %65 to i64, !dbg !1794
  %67 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %66, !dbg !1794
  %68 = getelementptr inbounds nuw %struct.player, ptr %67, i32 0, i32 12, !dbg !1795
  %69 = load i8, ptr %68, align 2, !dbg !1795
  call void @_Z26newdemo_record_laser_levelaa(i8 noundef signext %69, i8 noundef signext 3), !dbg !1796
  br label %70, !dbg !1796

70:                                               ; preds = %64, %61
  %71 = load i32, ptr @Player_num, align 4, !dbg !1797
  %72 = sext i32 %71 to i64, !dbg !1798
  %73 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %72, !dbg !1798
  %74 = getelementptr inbounds nuw %struct.player, ptr %73, i32 0, i32 8, !dbg !1799
  store i32 13107200, ptr %74, align 4, !dbg !1800
  %75 = load i32, ptr @Player_num, align 4, !dbg !1801
  %76 = sext i32 %75 to i64, !dbg !1802
  %77 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %76, !dbg !1802
  %78 = getelementptr inbounds nuw %struct.player, ptr %77, i32 0, i32 9, !dbg !1803
  store i32 13107200, ptr %78, align 4, !dbg !1804
  %79 = load i32, ptr @Player_num, align 4, !dbg !1805
  %80 = sext i32 %79 to i64, !dbg !1806
  %81 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %80, !dbg !1806
  %82 = getelementptr inbounds nuw %struct.player, ptr %81, i32 0, i32 7, !dbg !1807
  %83 = load i32, ptr %82, align 4, !dbg !1808
  %84 = or i32 %83, 1024, !dbg !1808
  store i32 %84, ptr %82, align 4, !dbg !1808
  %85 = load i32, ptr @Player_num, align 4, !dbg !1809
  %86 = sext i32 %85 to i64, !dbg !1810
  %87 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %86, !dbg !1810
  %88 = getelementptr inbounds nuw %struct.player, ptr %87, i32 0, i32 12, !dbg !1811
  store i8 5, ptr %88, align 2, !dbg !1812
  %89 = load i32, ptr @Game_mode, align 4, !dbg !1813
  %90 = and i32 %89, 1024, !dbg !1815
  %91 = icmp ne i32 %90, 0, !dbg !1813
  br i1 %91, label %92, label %98, !dbg !1813

92:                                               ; preds = %70
  %93 = load i32, ptr @Player_num, align 4, !dbg !1816
  %94 = sext i32 %93 to i64, !dbg !1817
  %95 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %94, !dbg !1817
  %96 = getelementptr inbounds nuw %struct.player, ptr %95, i32 0, i32 18, !dbg !1818
  %97 = getelementptr inbounds [10 x i16], ptr %96, i64 0, i64 2, !dbg !1817
  store i16 12, ptr %97, align 2, !dbg !1819
  br label %98, !dbg !1817

98:                                               ; preds = %92, %70
  call void @_Z24update_laser_weapon_infov(), !dbg !1820
  ret void, !dbg !1821
}

declare void @_Z26newdemo_record_laser_levelaa(i8 noundef signext, i8 noundef signext) #1

declare void @_Z24update_laser_weapon_infov() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z14pick_up_energyv() #0 !dbg !1822 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !1823, !DIExpression(), !1824)
  store i32 0, ptr %1, align 4, !dbg !1824
  %3 = load i32, ptr @Player_num, align 4, !dbg !1825
  %4 = sext i32 %3 to i64, !dbg !1827
  %5 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %4, !dbg !1827
  %6 = getelementptr inbounds nuw %struct.player, ptr %5, i32 0, i32 8, !dbg !1828
  %7 = load i32, ptr %6, align 4, !dbg !1828
  %8 = call noundef i32 @_Z3i2fi(i32 noundef 200), !dbg !1829
  %9 = icmp slt i32 %7, %8, !dbg !1830
  br i1 %9, label %10, label %54, !dbg !1830

10:                                               ; preds = %0
    #dbg_declare(ptr %2, !1831, !DIExpression(), !1833)
  %11 = load i32, ptr @Difficulty_level, align 4, !dbg !1834
  %12 = sub nsw i32 5, %11, !dbg !1835
  %13 = mul nsw i32 196608, %12, !dbg !1836
  %14 = add nsw i32 196608, %13, !dbg !1837
  store i32 %14, ptr %2, align 4, !dbg !1838
  %15 = load i32, ptr @Difficulty_level, align 4, !dbg !1839
  %16 = icmp eq i32 %15, 0, !dbg !1841
  br i1 %16, label %17, label %22, !dbg !1841

17:                                               ; preds = %10
  %18 = load i32, ptr %2, align 4, !dbg !1842
  %19 = sdiv i32 %18, 2, !dbg !1843
  %20 = load i32, ptr %2, align 4, !dbg !1844
  %21 = add nsw i32 %20, %19, !dbg !1844
  store i32 %21, ptr %2, align 4, !dbg !1844
  br label %22, !dbg !1845

22:                                               ; preds = %17, %10
  %23 = load i32, ptr %2, align 4, !dbg !1846
  %24 = load i32, ptr @Player_num, align 4, !dbg !1847
  %25 = sext i32 %24 to i64, !dbg !1848
  %26 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %25, !dbg !1848
  %27 = getelementptr inbounds nuw %struct.player, ptr %26, i32 0, i32 8, !dbg !1849
  %28 = load i32, ptr %27, align 4, !dbg !1850
  %29 = add nsw i32 %28, %23, !dbg !1850
  store i32 %29, ptr %27, align 4, !dbg !1850
  %30 = load i32, ptr @Player_num, align 4, !dbg !1851
  %31 = sext i32 %30 to i64, !dbg !1853
  %32 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %31, !dbg !1853
  %33 = getelementptr inbounds nuw %struct.player, ptr %32, i32 0, i32 8, !dbg !1854
  %34 = load i32, ptr %33, align 4, !dbg !1854
  %35 = call noundef i32 @_Z3i2fi(i32 noundef 200), !dbg !1855
  %36 = icmp sgt i32 %34, %35, !dbg !1856
  br i1 %36, label %37, label %43, !dbg !1856

37:                                               ; preds = %22
  %38 = call noundef i32 @_Z3i2fi(i32 noundef 200), !dbg !1857
  %39 = load i32, ptr @Player_num, align 4, !dbg !1858
  %40 = sext i32 %39 to i64, !dbg !1859
  %41 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %40, !dbg !1859
  %42 = getelementptr inbounds nuw %struct.player, ptr %41, i32 0, i32 8, !dbg !1860
  store i32 %38, ptr %42, align 4, !dbg !1861
  br label %43, !dbg !1859

43:                                               ; preds = %37, %22
  %44 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 18) #6, !dbg !1862
  %45 = load ptr, ptr %44, align 8, !dbg !1862
  %46 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 17) #6, !dbg !1863
  %47 = load ptr, ptr %46, align 8, !dbg !1863
  %48 = load i32, ptr @Player_num, align 4, !dbg !1864
  %49 = sext i32 %48 to i64, !dbg !1865
  %50 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %49, !dbg !1865
  %51 = getelementptr inbounds nuw %struct.player, ptr %50, i32 0, i32 8, !dbg !1866
  %52 = load i32, ptr %51, align 4, !dbg !1866
  %53 = call noundef i32 @_Z4f2iri(i32 noundef %52), !dbg !1867
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 15, i32 noundef 7, i32 noundef 0, ptr noundef @.str.1, ptr noundef %45, ptr noundef %47, i32 noundef %53), !dbg !1868
  store i32 1, ptr %1, align 4, !dbg !1869
  br label %60, !dbg !1870

54:                                               ; preds = %0
  %55 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 21) #6, !dbg !1871
  %56 = load ptr, ptr %55, align 8, !dbg !1871
  %57 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 18) #6, !dbg !1872
  %58 = load ptr, ptr %57, align 8, !dbg !1872
  %59 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %56, ptr noundef %58), !dbg !1873
  br label %60

60:                                               ; preds = %54, %43
  %61 = load i32, ptr %1, align 4, !dbg !1874
  ret i32 %61, !dbg !1875
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #5 !dbg !1876 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !1879, !DIExpression(), !1880)
  %3 = load i32, ptr %2, align 4, !dbg !1881
  %4 = shl i32 %3, 16, !dbg !1882
  ret i32 %4, !dbg !1883
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #5 !dbg !1884 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2237, !DIExpression(), !2239)
  store i64 %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2240, !DIExpression(), !2241)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector", ptr %5, i32 0, i32 0, !dbg !2242
  %7 = load ptr, ptr %6, align 8, !dbg !2242
  %8 = load i64, ptr %4, align 8, !dbg !2243
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8, !dbg !2244
  ret ptr %9, !dbg !2245
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z4f2iri(i32 noundef %0) #5 !dbg !2246 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2247, !DIExpression(), !2248)
  %3 = load i32, ptr %2, align 4, !dbg !2249
  %4 = add nsw i32 %3, 32768, !dbg !2250
  %5 = ashr i32 %4, 16, !dbg !2251
  ret i32 %5, !dbg !2252
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19pick_up_vulcan_ammov() #0 !dbg !2253 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !2254, !DIExpression(), !2255)
  store i32 0, ptr %1, align 4, !dbg !2255
    #dbg_declare(ptr %2, !2256, !DIExpression(), !2257)
    #dbg_declare(ptr %3, !2258, !DIExpression(), !2259)
  %4 = load i8, ptr @Primary_weapon, align 1, !dbg !2260
  %5 = sext i8 %4 to i32, !dbg !2260
  store i32 %5, ptr %3, align 4, !dbg !2259
  %6 = call noundef i32 @_Z12pick_up_ammoiii(i32 noundef 0, i32 noundef 1, i32 noundef 98), !dbg !2261
  %7 = icmp ne i32 %6, 0, !dbg !2261
  br i1 %7, label %8, label %11, !dbg !2261

8:                                                ; preds = %0
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 24) #6, !dbg !2263
  %10 = load ptr, ptr %9, align 8, !dbg !2263
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 7, i32 noundef 14, i32 noundef 21, i32 noundef 0, ptr noundef @.str.2, ptr noundef %10), !dbg !2265
  store i32 1, ptr %1, align 4, !dbg !2266
  br label %32, !dbg !2267

11:                                               ; preds = %0
  %12 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @Primary_ammo_max, i64 0, i64 1), align 4, !dbg !2268
  store i32 %12, ptr %2, align 4, !dbg !2270
  %13 = load i32, ptr @Player_num, align 4, !dbg !2271
  %14 = sext i32 %13 to i64, !dbg !2273
  %15 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %14, !dbg !2273
  %16 = getelementptr inbounds nuw %struct.player, ptr %15, i32 0, i32 7, !dbg !2274
  %17 = load i32, ptr %16, align 4, !dbg !2274
  %18 = and i32 %17, 128, !dbg !2275
  %19 = icmp ne i32 %18, 0, !dbg !2273
  br i1 %19, label %20, label %23, !dbg !2273

20:                                               ; preds = %11
  %21 = load i32, ptr %2, align 4, !dbg !2276
  %22 = mul nsw i32 %21, 2, !dbg !2276
  store i32 %22, ptr %2, align 4, !dbg !2276
  br label %23, !dbg !2277

23:                                               ; preds = %20, %11
  %24 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2278
  %25 = load ptr, ptr %24, align 8, !dbg !2278
  %26 = load i32, ptr %2, align 4, !dbg !2279
  %27 = mul i32 835939, %26, !dbg !2280
  %28 = call noundef i32 @_Z4f2iuj(i32 noundef %27), !dbg !2281
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 25) #6, !dbg !2282
  %30 = load ptr, ptr %29, align 8, !dbg !2282
  %31 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.3, ptr noundef %25, i32 noundef %28, ptr noundef %30), !dbg !2283
  store i32 0, ptr %1, align 4, !dbg !2284
  br label %32

32:                                               ; preds = %23, %8
  %33 = load i32, ptr %3, align 4, !dbg !2285
  %34 = trunc i32 %33 to i8, !dbg !2285
  store i8 %34, ptr @Primary_weapon, align 1, !dbg !2286
  %35 = load i32, ptr %1, align 4, !dbg !2287
  ret i32 %35, !dbg !2288
}

declare noundef i32 @_Z12pick_up_ammoiii(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z4f2iuj(i32 noundef %0) #5 !dbg !2289 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2292, !DIExpression(), !2293)
  %3 = load i32, ptr %2, align 4, !dbg !2294
  %4 = lshr i32 %3, 16, !dbg !2295
  ret i32 %4, !dbg !2296
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z10do_powerupP6object(ptr noundef %0) #0 !dbg !2297 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [50 x i8], align 1
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [100 x i8], align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2300, !DIExpression(), !2301)
    #dbg_declare(ptr %4, !2302, !DIExpression(), !2303)
  store i32 0, ptr %4, align 4, !dbg !2303
    #dbg_declare(ptr %5, !2304, !DIExpression(), !2305)
  store i32 0, ptr %5, align 4, !dbg !2305
    #dbg_declare(ptr %6, !2306, !DIExpression(), !2308)
    #dbg_declare(ptr %7, !2309, !DIExpression(), !2310)
  %13 = load ptr, ptr %3, align 8, !dbg !2311
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 2, !dbg !2312
  %15 = load i8, ptr %14, align 1, !dbg !2312
  %16 = zext i8 %15 to i32, !dbg !2311
  store i32 %16, ptr %7, align 4, !dbg !2310
  %17 = load i32, ptr @Player_is_dead, align 4, !dbg !2313
  %18 = icmp ne i32 %17, 0, !dbg !2315
  br i1 %18, label %32, label %19, !dbg !2316

19:                                               ; preds = %1
  %20 = load ptr, ptr @ConsoleObject, align 8, !dbg !2317
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 1, !dbg !2318
  %22 = load i8, ptr %21, align 4, !dbg !2318
  %23 = zext i8 %22 to i32, !dbg !2317
  %24 = icmp eq i32 %23, 12, !dbg !2319
  br i1 %24, label %32, label %25, !dbg !2320

25:                                               ; preds = %19
  %26 = load i32, ptr @Player_num, align 4, !dbg !2321
  %27 = sext i32 %26 to i64, !dbg !2322
  %28 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %27, !dbg !2322
  %29 = getelementptr inbounds nuw %struct.player, ptr %28, i32 0, i32 9, !dbg !2323
  %30 = load i32, ptr %29, align 4, !dbg !2323
  %31 = icmp slt i32 %30, 0, !dbg !2324
  br i1 %31, label %32, label %33, !dbg !2320

32:                                               ; preds = %25, %19, %1
  store i32 0, ptr %2, align 4, !dbg !2325
  br label %834, !dbg !2325

33:                                               ; preds = %25
  %34 = load ptr, ptr %3, align 8, !dbg !2326
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 22, !dbg !2328
  %36 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %35, i32 0, i32 1, !dbg !2329
  %37 = load i32, ptr %36, align 4, !dbg !2329
  %38 = load i32, ptr @GameTime, align 4, !dbg !2330
  %39 = icmp sgt i32 %37, %38, !dbg !2331
  br i1 %39, label %40, label %44, !dbg !2331

40:                                               ; preds = %33
  %41 = load ptr, ptr %3, align 8, !dbg !2332
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 22, !dbg !2333
  %43 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %42, i32 0, i32 1, !dbg !2334
  store i32 0, ptr %43, align 4, !dbg !2335
  br label %44, !dbg !2332

44:                                               ; preds = %40, %33
  %45 = load ptr, ptr %3, align 8, !dbg !2336
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 22, !dbg !2338
  %47 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %46, i32 0, i32 2, !dbg !2339
  %48 = load i32, ptr %47, align 4, !dbg !2339
  %49 = and i32 %48, 1, !dbg !2340
  %50 = icmp ne i32 %49, 0, !dbg !2341
  br i1 %50, label %51, label %67, !dbg !2342

51:                                               ; preds = %44
  %52 = load ptr, ptr %3, align 8, !dbg !2343
  %53 = getelementptr inbounds nuw %struct.object, ptr %52, i32 0, i32 22, !dbg !2344
  %54 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %53, i32 0, i32 1, !dbg !2345
  %55 = load i32, ptr %54, align 4, !dbg !2345
  %56 = icmp sgt i32 %55, 0, !dbg !2346
  br i1 %56, label %57, label %67, !dbg !2347

57:                                               ; preds = %51
  %58 = load i32, ptr @GameTime, align 4, !dbg !2348
  %59 = load ptr, ptr %3, align 8, !dbg !2349
  %60 = getelementptr inbounds nuw %struct.object, ptr %59, i32 0, i32 22, !dbg !2350
  %61 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %60, i32 0, i32 1, !dbg !2351
  %62 = load i32, ptr %61, align 4, !dbg !2351
  %63 = call noundef i32 @_Z3i2fi(i32 noundef 2), !dbg !2352
  %64 = add nsw i32 %62, %63, !dbg !2353
  %65 = icmp slt i32 %58, %64, !dbg !2354
  br i1 %65, label %66, label %67, !dbg !2347

66:                                               ; preds = %57
  store i32 0, ptr %2, align 4, !dbg !2355
  br label %834, !dbg !2355

67:                                               ; preds = %57, %51, %44
  store i32 0, ptr @PlayerMessage, align 4, !dbg !2356
  %68 = load ptr, ptr %3, align 8, !dbg !2357
  %69 = getelementptr inbounds nuw %struct.object, ptr %68, i32 0, i32 2, !dbg !2358
  %70 = load i8, ptr %69, align 1, !dbg !2358
  %71 = zext i8 %70 to i32, !dbg !2357
  switch i32 %71, label %807 [
    i32 0, label %72
    i32 1, label %81
    i32 2, label %83
    i32 3, label %142
    i32 10, label %202
    i32 11, label %204
    i32 4, label %206
    i32 5, label %239
    i32 6, label %272
    i32 12, label %305
    i32 13, label %338
    i32 28, label %338
    i32 14, label %390
    i32 15, label %401
    i32 16, label %412
    i32 29, label %423
    i32 30, label %434
    i32 31, label %445
    i32 17, label %464
    i32 20, label %466
    i32 21, label %468
    i32 38, label %470
    i32 39, label %472
    i32 40, label %474
    i32 41, label %476
    i32 42, label %478
    i32 43, label %480
    i32 44, label %482
    i32 45, label %484
    i32 22, label %486
    i32 18, label %488
    i32 19, label %490
    i32 23, label %492
    i32 25, label %520
    i32 27, label %548
    i32 33, label %549
    i32 34, label %575
    i32 32, label %614
    i32 35, label %688
    i32 36, label %721
    i32 37, label %754
    i32 46, label %804
    i32 7, label %805
    i32 47, label %806
  ], !dbg !2359

72:                                               ; preds = %67
  %73 = load i32, ptr @Player_num, align 4, !dbg !2360
  %74 = sext i32 %73 to i64, !dbg !2362
  %75 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %74, !dbg !2362
  %76 = getelementptr inbounds nuw %struct.player, ptr %75, i32 0, i32 10, !dbg !2363
  %77 = load i8, ptr %76, align 4, !dbg !2364
  %78 = add i8 %77, 1, !dbg !2364
  store i8 %78, ptr %76, align 4, !dbg !2364
  %79 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 10) #6, !dbg !2365
  %80 = load ptr, ptr %79, align 8, !dbg !2365
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 15, i32 noundef 15, i32 noundef 0, ptr noundef %80), !dbg !2366
  store i32 1, ptr %4, align 4, !dbg !2367
  br label %808, !dbg !2368

81:                                               ; preds = %67
  %82 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2369
  store i32 %82, ptr %4, align 4, !dbg !2370
  br label %808, !dbg !2371

83:                                               ; preds = %67
  %84 = load i32, ptr @Player_num, align 4, !dbg !2372
  %85 = sext i32 %84 to i64, !dbg !2374
  %86 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %85, !dbg !2374
  %87 = getelementptr inbounds nuw %struct.player, ptr %86, i32 0, i32 9, !dbg !2375
  %88 = load i32, ptr %87, align 4, !dbg !2375
  %89 = call noundef i32 @_Z3i2fi(i32 noundef 200), !dbg !2376
  %90 = icmp slt i32 %88, %89, !dbg !2377
  br i1 %90, label %91, label %135, !dbg !2377

91:                                               ; preds = %83
    #dbg_declare(ptr %8, !2378, !DIExpression(), !2380)
  %92 = load i32, ptr @Difficulty_level, align 4, !dbg !2381
  %93 = sub nsw i32 5, %92, !dbg !2382
  %94 = mul nsw i32 196608, %93, !dbg !2383
  %95 = add nsw i32 196608, %94, !dbg !2384
  store i32 %95, ptr %8, align 4, !dbg !2380
  %96 = load i32, ptr @Difficulty_level, align 4, !dbg !2385
  %97 = icmp eq i32 %96, 0, !dbg !2387
  br i1 %97, label %98, label %103, !dbg !2387

98:                                               ; preds = %91
  %99 = load i32, ptr %8, align 4, !dbg !2388
  %100 = sdiv i32 %99, 2, !dbg !2389
  %101 = load i32, ptr %8, align 4, !dbg !2390
  %102 = add nsw i32 %101, %100, !dbg !2390
  store i32 %102, ptr %8, align 4, !dbg !2390
  br label %103, !dbg !2391

103:                                              ; preds = %98, %91
  %104 = load i32, ptr %8, align 4, !dbg !2392
  %105 = load i32, ptr @Player_num, align 4, !dbg !2393
  %106 = sext i32 %105 to i64, !dbg !2394
  %107 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %106, !dbg !2394
  %108 = getelementptr inbounds nuw %struct.player, ptr %107, i32 0, i32 9, !dbg !2395
  %109 = load i32, ptr %108, align 4, !dbg !2396
  %110 = add nsw i32 %109, %104, !dbg !2396
  store i32 %110, ptr %108, align 4, !dbg !2396
  %111 = load i32, ptr @Player_num, align 4, !dbg !2397
  %112 = sext i32 %111 to i64, !dbg !2399
  %113 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %112, !dbg !2399
  %114 = getelementptr inbounds nuw %struct.player, ptr %113, i32 0, i32 9, !dbg !2400
  %115 = load i32, ptr %114, align 4, !dbg !2400
  %116 = call noundef i32 @_Z3i2fi(i32 noundef 200), !dbg !2401
  %117 = icmp sgt i32 %115, %116, !dbg !2402
  br i1 %117, label %118, label %124, !dbg !2402

118:                                              ; preds = %103
  %119 = call noundef i32 @_Z3i2fi(i32 noundef 200), !dbg !2403
  %120 = load i32, ptr @Player_num, align 4, !dbg !2404
  %121 = sext i32 %120 to i64, !dbg !2405
  %122 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %121, !dbg !2405
  %123 = getelementptr inbounds nuw %struct.player, ptr %122, i32 0, i32 9, !dbg !2406
  store i32 %119, ptr %123, align 4, !dbg !2407
  br label %124, !dbg !2405

124:                                              ; preds = %118, %103
  %125 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 19) #6, !dbg !2408
  %126 = load ptr, ptr %125, align 8, !dbg !2408
  %127 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 17) #6, !dbg !2409
  %128 = load ptr, ptr %127, align 8, !dbg !2409
  %129 = load i32, ptr @Player_num, align 4, !dbg !2410
  %130 = sext i32 %129 to i64, !dbg !2411
  %131 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %130, !dbg !2411
  %132 = getelementptr inbounds nuw %struct.player, ptr %131, i32 0, i32 9, !dbg !2412
  %133 = load i32, ptr %132, align 4, !dbg !2412
  %134 = call noundef i32 @_Z4f2iri(i32 noundef %133), !dbg !2413
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 0, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef @.str.1, ptr noundef %126, ptr noundef %128, i32 noundef %134), !dbg !2414
  store i32 1, ptr %4, align 4, !dbg !2415
  br label %141, !dbg !2416

135:                                              ; preds = %83
  %136 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 21) #6, !dbg !2417
  %137 = load ptr, ptr %136, align 8, !dbg !2417
  %138 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 19) #6, !dbg !2418
  %139 = load ptr, ptr %138, align 8, !dbg !2418
  %140 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %137, ptr noundef %139), !dbg !2419
  br label %141

141:                                              ; preds = %135, %124
  br label %808, !dbg !2420

142:                                              ; preds = %67
  %143 = load i32, ptr @Player_num, align 4, !dbg !2421
  %144 = sext i32 %143 to i64, !dbg !2423
  %145 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %144, !dbg !2423
  %146 = getelementptr inbounds nuw %struct.player, ptr %145, i32 0, i32 12, !dbg !2424
  %147 = load i8, ptr %146, align 2, !dbg !2424
  %148 = zext i8 %147 to i32, !dbg !2423
  %149 = icmp sge i32 %148, 3, !dbg !2425
  br i1 %149, label %150, label %156, !dbg !2425

150:                                              ; preds = %142
  %151 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 21) #6, !dbg !2426
  %152 = load ptr, ptr %151, align 8, !dbg !2426
  %153 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 20) #6, !dbg !2428
  %154 = load ptr, ptr %153, align 8, !dbg !2428
  %155 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %152, ptr noundef %154), !dbg !2429
  br label %192, !dbg !2430

156:                                              ; preds = %142
  %157 = load i32, ptr @Newdemo_state, align 4, !dbg !2431
  %158 = icmp eq i32 %157, 1, !dbg !2434
  br i1 %158, label %159, label %173, !dbg !2434

159:                                              ; preds = %156
  %160 = load i32, ptr @Player_num, align 4, !dbg !2435
  %161 = sext i32 %160 to i64, !dbg !2436
  %162 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %161, !dbg !2436
  %163 = getelementptr inbounds nuw %struct.player, ptr %162, i32 0, i32 12, !dbg !2437
  %164 = load i8, ptr %163, align 2, !dbg !2437
  %165 = load i32, ptr @Player_num, align 4, !dbg !2438
  %166 = sext i32 %165 to i64, !dbg !2439
  %167 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %166, !dbg !2439
  %168 = getelementptr inbounds nuw %struct.player, ptr %167, i32 0, i32 12, !dbg !2440
  %169 = load i8, ptr %168, align 2, !dbg !2440
  %170 = zext i8 %169 to i32, !dbg !2439
  %171 = add nsw i32 %170, 1, !dbg !2441
  %172 = trunc i32 %171 to i8, !dbg !2439
  call void @_Z26newdemo_record_laser_levelaa(i8 noundef signext %164, i8 noundef signext %172), !dbg !2442
  br label %173, !dbg !2442

173:                                              ; preds = %159, %156
  %174 = load i32, ptr @Player_num, align 4, !dbg !2443
  %175 = sext i32 %174 to i64, !dbg !2444
  %176 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %175, !dbg !2444
  %177 = getelementptr inbounds nuw %struct.player, ptr %176, i32 0, i32 12, !dbg !2445
  %178 = load i8, ptr %177, align 2, !dbg !2446
  %179 = add i8 %178, 1, !dbg !2446
  store i8 %179, ptr %177, align 2, !dbg !2446
  %180 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 20) #6, !dbg !2447
  %181 = load ptr, ptr %180, align 8, !dbg !2447
  %182 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 17) #6, !dbg !2448
  %183 = load ptr, ptr %182, align 8, !dbg !2448
  %184 = load i32, ptr @Player_num, align 4, !dbg !2449
  %185 = sext i32 %184 to i64, !dbg !2450
  %186 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %185, !dbg !2450
  %187 = getelementptr inbounds nuw %struct.player, ptr %186, i32 0, i32 12, !dbg !2451
  %188 = load i8, ptr %187, align 2, !dbg !2451
  %189 = zext i8 %188 to i32, !dbg !2450
  %190 = add nsw i32 %189, 1, !dbg !2452
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 10, i32 noundef 0, i32 noundef 10, i32 noundef 0, ptr noundef @.str.1, ptr noundef %181, ptr noundef %183, i32 noundef %190), !dbg !2453
  call void @_Z24update_laser_weapon_infov(), !dbg !2454
  %191 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 0), !dbg !2455
  store i32 1, ptr %4, align 4, !dbg !2456
  br label %192

192:                                              ; preds = %173, %150
  %193 = load i32, ptr %4, align 4, !dbg !2457
  %194 = icmp ne i32 %193, 0, !dbg !2457
  br i1 %194, label %201, label %195, !dbg !2459

195:                                              ; preds = %192
  %196 = load i32, ptr @Game_mode, align 4, !dbg !2460
  %197 = and i32 %196, 38, !dbg !2461
  %198 = icmp ne i32 %197, 0, !dbg !2462
  br i1 %198, label %201, label %199, !dbg !2459

199:                                              ; preds = %195
  %200 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2463
  store i32 %200, ptr %4, align 4, !dbg !2464
  br label %201, !dbg !2465

201:                                              ; preds = %199, %195, %192
  br label %808, !dbg !2466

202:                                              ; preds = %67
  %203 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 0, i32 noundef 1), !dbg !2467
  store i32 %203, ptr %4, align 4, !dbg !2468
  br label %808, !dbg !2469

204:                                              ; preds = %67
  %205 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 0, i32 noundef 4), !dbg !2470
  store i32 %205, ptr %4, align 4, !dbg !2471
  br label %808, !dbg !2472

206:                                              ; preds = %67
  %207 = load i32, ptr @Player_num, align 4, !dbg !2473
  %208 = sext i32 %207 to i64, !dbg !2475
  %209 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %208, !dbg !2475
  %210 = getelementptr inbounds nuw %struct.player, ptr %209, i32 0, i32 7, !dbg !2476
  %211 = load i32, ptr %210, align 4, !dbg !2476
  %212 = and i32 %211, 2, !dbg !2477
  %213 = icmp ne i32 %212, 0, !dbg !2475
  br i1 %213, label %214, label %215, !dbg !2475

214:                                              ; preds = %206
  br label %808, !dbg !2478

215:                                              ; preds = %206
  %216 = load ptr, ptr %3, align 8, !dbg !2479
  %217 = getelementptr inbounds nuw %struct.object, ptr %216, i32 0, i32 2, !dbg !2480
  %218 = load i8, ptr %217, align 1, !dbg !2480
  %219 = zext i8 %218 to i64, !dbg !2481
  %220 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %219, !dbg !2481
  %221 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %220, i32 0, i32 1, !dbg !2482
  %222 = load i32, ptr %221, align 4, !dbg !2482
  call void @_Z16digi_play_sampleii(i32 noundef %222, i32 noundef 65536), !dbg !2483
  %223 = load i32, ptr @Player_num, align 4, !dbg !2484
  %224 = sext i32 %223 to i64, !dbg !2485
  %225 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %224, !dbg !2485
  %226 = getelementptr inbounds nuw %struct.player, ptr %225, i32 0, i32 7, !dbg !2486
  %227 = load i32, ptr %226, align 4, !dbg !2487
  %228 = or i32 %227, 2, !dbg !2487
  store i32 %228, ptr %226, align 4, !dbg !2487
  %229 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 12) #6, !dbg !2488
  %230 = load ptr, ptr %229, align 8, !dbg !2488
  %231 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 16) #6, !dbg !2489
  %232 = load ptr, ptr %231, align 8, !dbg !2489
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 0, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef @.str.4, ptr noundef %230, ptr noundef %232), !dbg !2490
  %233 = load i32, ptr @Game_mode, align 4, !dbg !2491
  %234 = and i32 %233, 38, !dbg !2493
  %235 = icmp ne i32 %234, 0, !dbg !2491
  br i1 %235, label %236, label %237, !dbg !2491

236:                                              ; preds = %215
  store i32 0, ptr %4, align 4, !dbg !2494
  br label %238, !dbg !2495

237:                                              ; preds = %215
  store i32 1, ptr %4, align 4, !dbg !2496
  br label %238

238:                                              ; preds = %237, %236
  call void @_Z22invalidate_escort_goalv(), !dbg !2497
  br label %808, !dbg !2498

239:                                              ; preds = %67
  %240 = load i32, ptr @Player_num, align 4, !dbg !2499
  %241 = sext i32 %240 to i64, !dbg !2501
  %242 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %241, !dbg !2501
  %243 = getelementptr inbounds nuw %struct.player, ptr %242, i32 0, i32 7, !dbg !2502
  %244 = load i32, ptr %243, align 4, !dbg !2502
  %245 = and i32 %244, 4, !dbg !2503
  %246 = icmp ne i32 %245, 0, !dbg !2501
  br i1 %246, label %247, label %248, !dbg !2501

247:                                              ; preds = %239
  br label %808, !dbg !2504

248:                                              ; preds = %239
  %249 = load ptr, ptr %3, align 8, !dbg !2505
  %250 = getelementptr inbounds nuw %struct.object, ptr %249, i32 0, i32 2, !dbg !2506
  %251 = load i8, ptr %250, align 1, !dbg !2506
  %252 = zext i8 %251 to i64, !dbg !2507
  %253 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %252, !dbg !2507
  %254 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %253, i32 0, i32 1, !dbg !2508
  %255 = load i32, ptr %254, align 4, !dbg !2508
  call void @_Z16digi_play_sampleii(i32 noundef %255, i32 noundef 65536), !dbg !2509
  %256 = load i32, ptr @Player_num, align 4, !dbg !2510
  %257 = sext i32 %256 to i64, !dbg !2511
  %258 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %257, !dbg !2511
  %259 = getelementptr inbounds nuw %struct.player, ptr %258, i32 0, i32 7, !dbg !2512
  %260 = load i32, ptr %259, align 4, !dbg !2513
  %261 = or i32 %260, 4, !dbg !2513
  store i32 %261, ptr %259, align 4, !dbg !2513
  %262 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 13) #6, !dbg !2514
  %263 = load ptr, ptr %262, align 8, !dbg !2514
  %264 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 16) #6, !dbg !2515
  %265 = load ptr, ptr %264, align 8, !dbg !2515
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 0, i32 noundef 0, i32 noundef 0, ptr noundef @.str.4, ptr noundef %263, ptr noundef %265), !dbg !2516
  %266 = load i32, ptr @Game_mode, align 4, !dbg !2517
  %267 = and i32 %266, 38, !dbg !2519
  %268 = icmp ne i32 %267, 0, !dbg !2517
  br i1 %268, label %269, label %270, !dbg !2517

269:                                              ; preds = %248
  store i32 0, ptr %4, align 4, !dbg !2520
  br label %271, !dbg !2521

270:                                              ; preds = %248
  store i32 1, ptr %4, align 4, !dbg !2522
  br label %271

271:                                              ; preds = %270, %269
  call void @_Z22invalidate_escort_goalv(), !dbg !2523
  br label %808, !dbg !2524

272:                                              ; preds = %67
  %273 = load i32, ptr @Player_num, align 4, !dbg !2525
  %274 = sext i32 %273 to i64, !dbg !2527
  %275 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %274, !dbg !2527
  %276 = getelementptr inbounds nuw %struct.player, ptr %275, i32 0, i32 7, !dbg !2528
  %277 = load i32, ptr %276, align 4, !dbg !2528
  %278 = and i32 %277, 8, !dbg !2529
  %279 = icmp ne i32 %278, 0, !dbg !2527
  br i1 %279, label %280, label %281, !dbg !2527

280:                                              ; preds = %272
  br label %808, !dbg !2530

281:                                              ; preds = %272
  %282 = load ptr, ptr %3, align 8, !dbg !2531
  %283 = getelementptr inbounds nuw %struct.object, ptr %282, i32 0, i32 2, !dbg !2532
  %284 = load i8, ptr %283, align 1, !dbg !2532
  %285 = zext i8 %284 to i64, !dbg !2533
  %286 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %285, !dbg !2533
  %287 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %286, i32 0, i32 1, !dbg !2534
  %288 = load i32, ptr %287, align 4, !dbg !2534
  call void @_Z16digi_play_sampleii(i32 noundef %288, i32 noundef 65536), !dbg !2535
  %289 = load i32, ptr @Player_num, align 4, !dbg !2536
  %290 = sext i32 %289 to i64, !dbg !2537
  %291 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %290, !dbg !2537
  %292 = getelementptr inbounds nuw %struct.player, ptr %291, i32 0, i32 7, !dbg !2538
  %293 = load i32, ptr %292, align 4, !dbg !2539
  %294 = or i32 %293, 8, !dbg !2539
  store i32 %294, ptr %292, align 4, !dbg !2539
  %295 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 14) #6, !dbg !2540
  %296 = load ptr, ptr %295, align 8, !dbg !2540
  %297 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 16) #6, !dbg !2541
  %298 = load ptr, ptr %297, align 8, !dbg !2541
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 15, i32 noundef 7, i32 noundef 0, ptr noundef @.str.4, ptr noundef %296, ptr noundef %298), !dbg !2542
  %299 = load i32, ptr @Game_mode, align 4, !dbg !2543
  %300 = and i32 %299, 38, !dbg !2545
  %301 = icmp ne i32 %300, 0, !dbg !2543
  br i1 %301, label %302, label %303, !dbg !2543

302:                                              ; preds = %281
  store i32 0, ptr %4, align 4, !dbg !2546
  br label %304, !dbg !2547

303:                                              ; preds = %281
  store i32 1, ptr %4, align 4, !dbg !2548
  br label %304

304:                                              ; preds = %303, %302
  call void @_Z22invalidate_escort_goalv(), !dbg !2549
  br label %808, !dbg !2550

305:                                              ; preds = %67
  %306 = load i32, ptr @Player_num, align 4, !dbg !2551
  %307 = sext i32 %306 to i64, !dbg !2553
  %308 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %307, !dbg !2553
  %309 = getelementptr inbounds nuw %struct.player, ptr %308, i32 0, i32 7, !dbg !2554
  %310 = load i32, ptr %309, align 4, !dbg !2554
  %311 = and i32 %310, 1024, !dbg !2555
  %312 = icmp ne i32 %311, 0, !dbg !2556
  br i1 %312, label %322, label %313, !dbg !2557

313:                                              ; preds = %305
  %314 = load i32, ptr @Player_num, align 4, !dbg !2558
  %315 = sext i32 %314 to i64, !dbg !2560
  %316 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %315, !dbg !2560
  %317 = getelementptr inbounds nuw %struct.player, ptr %316, i32 0, i32 7, !dbg !2561
  %318 = load i32, ptr %317, align 4, !dbg !2562
  %319 = or i32 %318, 1024, !dbg !2562
  store i32 %319, ptr %317, align 4, !dbg !2562
  %320 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 22) #6, !dbg !2563
  %321 = load ptr, ptr %320, align 8, !dbg !2563
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 15, i32 noundef 7, i32 noundef 0, ptr noundef @.str.2, ptr noundef %321), !dbg !2564
  call void @_Z24update_laser_weapon_infov(), !dbg !2565
  store i32 1, ptr %4, align 4, !dbg !2566
  br label %328, !dbg !2567

322:                                              ; preds = %305
  %323 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2568
  %324 = load ptr, ptr %323, align 8, !dbg !2568
  %325 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 22) #6, !dbg !2569
  %326 = load ptr, ptr %325, align 8, !dbg !2569
  %327 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %324, ptr noundef %326), !dbg !2570
  br label %328

328:                                              ; preds = %322, %313
  %329 = load i32, ptr %4, align 4, !dbg !2571
  %330 = icmp ne i32 %329, 0, !dbg !2571
  br i1 %330, label %337, label %331, !dbg !2573

331:                                              ; preds = %328
  %332 = load i32, ptr @Game_mode, align 4, !dbg !2574
  %333 = and i32 %332, 38, !dbg !2575
  %334 = icmp ne i32 %333, 0, !dbg !2576
  br i1 %334, label %337, label %335, !dbg !2573

335:                                              ; preds = %331
  %336 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2577
  store i32 %336, ptr %4, align 4, !dbg !2578
  br label %337, !dbg !2579

337:                                              ; preds = %335, %331, %328
  br label %808, !dbg !2580

338:                                              ; preds = %67, %67
    #dbg_declare(ptr %9, !2581, !DIExpression(), !2583)
  %339 = load ptr, ptr %3, align 8, !dbg !2584
  %340 = getelementptr inbounds nuw %struct.object, ptr %339, i32 0, i32 22, !dbg !2585
  %341 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %340, i32 0, i32 0, !dbg !2586
  %342 = load i32, ptr %341, align 4, !dbg !2586
  store i32 %342, ptr %9, align 4, !dbg !2583
  %343 = load ptr, ptr %3, align 8, !dbg !2587
  %344 = getelementptr inbounds nuw %struct.object, ptr %343, i32 0, i32 2, !dbg !2588
  %345 = load i8, ptr %344, align 1, !dbg !2588
  %346 = zext i8 %345 to i32, !dbg !2587
  %347 = icmp eq i32 %346, 13, !dbg !2589
  %348 = zext i1 %347 to i64, !dbg !2590
  %349 = select i1 %347, i32 1, i32 6, !dbg !2590
  %350 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef %349), !dbg !2591
  store i32 %350, ptr %4, align 4, !dbg !2592
  %351 = load i32, ptr %4, align 4, !dbg !2593
  %352 = icmp ne i32 %351, 0, !dbg !2593
  br i1 %352, label %361, label %353, !dbg !2595

353:                                              ; preds = %338
  %354 = load i32, ptr @Game_mode, align 4, !dbg !2596
  %355 = and i32 %354, 38, !dbg !2598
  %356 = icmp ne i32 %355, 0, !dbg !2599
  br i1 %356, label %357, label %360, !dbg !2599

357:                                              ; preds = %353
  %358 = load i32, ptr %9, align 4, !dbg !2600
  %359 = sub nsw i32 %358, 98, !dbg !2600
  store i32 %359, ptr %9, align 4, !dbg !2600
  br label %360, !dbg !2601

360:                                              ; preds = %357, %353
  br label %361, !dbg !2602

361:                                              ; preds = %360, %338
  %362 = load i32, ptr %9, align 4, !dbg !2603
  %363 = icmp sgt i32 %362, 0, !dbg !2605
  br i1 %363, label %364, label %389, !dbg !2605

364:                                              ; preds = %361
    #dbg_declare(ptr %10, !2606, !DIExpression(), !2608)
  %365 = load i32, ptr %9, align 4, !dbg !2609
  %366 = call noundef i32 @_Z12pick_up_ammoiii(i32 noundef 0, i32 noundef 1, i32 noundef %365), !dbg !2610
  store i32 %366, ptr %10, align 4, !dbg !2611
  %367 = load i32, ptr %10, align 4, !dbg !2612
  %368 = load ptr, ptr %3, align 8, !dbg !2613
  %369 = getelementptr inbounds nuw %struct.object, ptr %368, i32 0, i32 22, !dbg !2614
  %370 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %369, i32 0, i32 0, !dbg !2615
  %371 = load i32, ptr %370, align 4, !dbg !2616
  %372 = sub nsw i32 %371, %367, !dbg !2616
  store i32 %372, ptr %370, align 4, !dbg !2616
  %373 = load i32, ptr %4, align 4, !dbg !2617
  %374 = icmp ne i32 %373, 0, !dbg !2617
  br i1 %374, label %388, label %375, !dbg !2619

375:                                              ; preds = %364
  %376 = load i32, ptr %10, align 4, !dbg !2620
  %377 = icmp ne i32 %376, 0, !dbg !2620
  br i1 %377, label %378, label %388, !dbg !2619

378:                                              ; preds = %375
  %379 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 24) #6, !dbg !2621
  %380 = load ptr, ptr %379, align 8, !dbg !2621
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 7, i32 noundef 14, i32 noundef 21, i32 noundef 0, ptr noundef @.str.2, ptr noundef %380), !dbg !2623
  store i32 1, ptr %5, align 4, !dbg !2624
  store i32 22, ptr %7, align 4, !dbg !2625
  %381 = load ptr, ptr %3, align 8, !dbg !2626
  %382 = getelementptr inbounds nuw %struct.object, ptr %381, i32 0, i32 22, !dbg !2628
  %383 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %382, i32 0, i32 0, !dbg !2629
  %384 = load i32, ptr %383, align 4, !dbg !2629
  %385 = icmp eq i32 %384, 0, !dbg !2630
  br i1 %385, label %386, label %387, !dbg !2630

386:                                              ; preds = %378
  store i32 1, ptr %4, align 4, !dbg !2631
  br label %387, !dbg !2632

387:                                              ; preds = %386, %378
  br label %388, !dbg !2633

388:                                              ; preds = %387, %375, %364
  br label %389, !dbg !2634

389:                                              ; preds = %388, %361
  br label %808, !dbg !2635

390:                                              ; preds = %67
  %391 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 2), !dbg !2636
  store i32 %391, ptr %4, align 4, !dbg !2637
  %392 = load i32, ptr %4, align 4, !dbg !2638
  %393 = icmp ne i32 %392, 0, !dbg !2638
  br i1 %393, label %400, label %394, !dbg !2640

394:                                              ; preds = %390
  %395 = load i32, ptr @Game_mode, align 4, !dbg !2641
  %396 = and i32 %395, 38, !dbg !2642
  %397 = icmp ne i32 %396, 0, !dbg !2643
  br i1 %397, label %400, label %398, !dbg !2640

398:                                              ; preds = %394
  %399 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2644
  store i32 %399, ptr %4, align 4, !dbg !2645
  br label %400, !dbg !2646

400:                                              ; preds = %398, %394, %390
  br label %808, !dbg !2647

401:                                              ; preds = %67
  %402 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 3), !dbg !2648
  store i32 %402, ptr %4, align 4, !dbg !2649
  %403 = load i32, ptr %4, align 4, !dbg !2650
  %404 = icmp ne i32 %403, 0, !dbg !2650
  br i1 %404, label %411, label %405, !dbg !2652

405:                                              ; preds = %401
  %406 = load i32, ptr @Game_mode, align 4, !dbg !2653
  %407 = and i32 %406, 38, !dbg !2654
  %408 = icmp ne i32 %407, 0, !dbg !2655
  br i1 %408, label %411, label %409, !dbg !2652

409:                                              ; preds = %405
  %410 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2656
  store i32 %410, ptr %4, align 4, !dbg !2657
  br label %411, !dbg !2658

411:                                              ; preds = %409, %405, %401
  br label %808, !dbg !2659

412:                                              ; preds = %67
  %413 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 4), !dbg !2660
  store i32 %413, ptr %4, align 4, !dbg !2661
  %414 = load i32, ptr %4, align 4, !dbg !2662
  %415 = icmp ne i32 %414, 0, !dbg !2662
  br i1 %415, label %422, label %416, !dbg !2664

416:                                              ; preds = %412
  %417 = load i32, ptr @Game_mode, align 4, !dbg !2665
  %418 = and i32 %417, 38, !dbg !2666
  %419 = icmp ne i32 %418, 0, !dbg !2667
  br i1 %419, label %422, label %420, !dbg !2664

420:                                              ; preds = %416
  %421 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2668
  store i32 %421, ptr %4, align 4, !dbg !2669
  br label %422, !dbg !2670

422:                                              ; preds = %420, %416, %412
  br label %808, !dbg !2671

423:                                              ; preds = %67
  %424 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 7), !dbg !2672
  store i32 %424, ptr %4, align 4, !dbg !2673
  %425 = load i32, ptr %4, align 4, !dbg !2674
  %426 = icmp ne i32 %425, 0, !dbg !2674
  br i1 %426, label %433, label %427, !dbg !2676

427:                                              ; preds = %423
  %428 = load i32, ptr @Game_mode, align 4, !dbg !2677
  %429 = and i32 %428, 38, !dbg !2678
  %430 = icmp ne i32 %429, 0, !dbg !2679
  br i1 %430, label %433, label %431, !dbg !2676

431:                                              ; preds = %427
  %432 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2680
  store i32 %432, ptr %4, align 4, !dbg !2681
  br label %433, !dbg !2682

433:                                              ; preds = %431, %427, %423
  br label %808, !dbg !2683

434:                                              ; preds = %67
  %435 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 8), !dbg !2684
  store i32 %435, ptr %4, align 4, !dbg !2685
  %436 = load i32, ptr %4, align 4, !dbg !2686
  %437 = icmp ne i32 %436, 0, !dbg !2686
  br i1 %437, label %444, label %438, !dbg !2688

438:                                              ; preds = %434
  %439 = load i32, ptr @Game_mode, align 4, !dbg !2689
  %440 = and i32 %439, 38, !dbg !2690
  %441 = icmp ne i32 %440, 0, !dbg !2691
  br i1 %441, label %444, label %442, !dbg !2688

442:                                              ; preds = %438
  %443 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2692
  store i32 %443, ptr %4, align 4, !dbg !2693
  br label %444, !dbg !2694

444:                                              ; preds = %442, %438, %434
  br label %808, !dbg !2695

445:                                              ; preds = %67
  %446 = call noundef i32 @_Z15pick_up_primaryi(i32 noundef 9), !dbg !2696
  store i32 %446, ptr %4, align 4, !dbg !2697
  %447 = load i32, ptr %4, align 4, !dbg !2698
  %448 = icmp ne i32 %447, 0, !dbg !2698
  br i1 %448, label %449, label %454, !dbg !2698

449:                                              ; preds = %445
  %450 = load ptr, ptr %3, align 8, !dbg !2700
  %451 = getelementptr inbounds nuw %struct.object, ptr %450, i32 0, i32 22, !dbg !2701
  %452 = getelementptr inbounds nuw %struct.powerup_info_s, ptr %451, i32 0, i32 0, !dbg !2702
  %453 = load i32, ptr %452, align 4, !dbg !2702
  store i32 %453, ptr @Omega_charge, align 4, !dbg !2703
  br label %454, !dbg !2704

454:                                              ; preds = %449, %445
  %455 = load i32, ptr %4, align 4, !dbg !2705
  %456 = icmp ne i32 %455, 0, !dbg !2705
  br i1 %456, label %463, label %457, !dbg !2707

457:                                              ; preds = %454
  %458 = load i32, ptr @Game_mode, align 4, !dbg !2708
  %459 = and i32 %458, 38, !dbg !2709
  %460 = icmp ne i32 %459, 0, !dbg !2710
  br i1 %460, label %463, label %461, !dbg !2707

461:                                              ; preds = %457
  %462 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2711
  store i32 %462, ptr %4, align 4, !dbg !2712
  br label %463, !dbg !2713

463:                                              ; preds = %461, %457, %454
  br label %808, !dbg !2714

464:                                              ; preds = %67
  %465 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 2, i32 noundef 4), !dbg !2715
  store i32 %465, ptr %4, align 4, !dbg !2716
  br label %808, !dbg !2717

466:                                              ; preds = %67
  %467 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 3, i32 noundef 1), !dbg !2718
  store i32 %467, ptr %4, align 4, !dbg !2719
  br label %808, !dbg !2720

468:                                              ; preds = %67
  %469 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 4, i32 noundef 1), !dbg !2721
  store i32 %469, ptr %4, align 4, !dbg !2722
  br label %808, !dbg !2723

470:                                              ; preds = %67
  %471 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 5, i32 noundef 1), !dbg !2724
  store i32 %471, ptr %4, align 4, !dbg !2725
  br label %808, !dbg !2726

472:                                              ; preds = %67
  %473 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 5, i32 noundef 4), !dbg !2727
  store i32 %473, ptr %4, align 4, !dbg !2728
  br label %808, !dbg !2729

474:                                              ; preds = %67
  %475 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 6, i32 noundef 1), !dbg !2730
  store i32 %475, ptr %4, align 4, !dbg !2731
  br label %808, !dbg !2732

476:                                              ; preds = %67
  %477 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 6, i32 noundef 4), !dbg !2733
  store i32 %477, ptr %4, align 4, !dbg !2734
  br label %808, !dbg !2735

478:                                              ; preds = %67
  %479 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 7, i32 noundef 4), !dbg !2736
  store i32 %479, ptr %4, align 4, !dbg !2737
  br label %808, !dbg !2738

480:                                              ; preds = %67
  %481 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 8, i32 noundef 1), !dbg !2739
  store i32 %481, ptr %4, align 4, !dbg !2740
  br label %808, !dbg !2741

482:                                              ; preds = %67
  %483 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 8, i32 noundef 4), !dbg !2742
  store i32 %483, ptr %4, align 4, !dbg !2743
  br label %808, !dbg !2744

484:                                              ; preds = %67
  %485 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 9, i32 noundef 1), !dbg !2745
  store i32 %485, ptr %4, align 4, !dbg !2746
  br label %808, !dbg !2747

486:                                              ; preds = %67
  %487 = call noundef i32 @_Z19pick_up_vulcan_ammov(), !dbg !2748
  store i32 %487, ptr %4, align 4, !dbg !2749
  br label %808, !dbg !2750

488:                                              ; preds = %67
  %489 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 1, i32 noundef 1), !dbg !2751
  store i32 %489, ptr %4, align 4, !dbg !2752
  br label %808, !dbg !2753

490:                                              ; preds = %67
  %491 = call noundef i32 @_Z17pick_up_secondaryii(i32 noundef 1, i32 noundef 4), !dbg !2754
  store i32 %491, ptr %4, align 4, !dbg !2755
  br label %808, !dbg !2756

492:                                              ; preds = %67
  %493 = load i32, ptr @Player_num, align 4, !dbg !2757
  %494 = sext i32 %493 to i64, !dbg !2759
  %495 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %494, !dbg !2759
  %496 = getelementptr inbounds nuw %struct.player, ptr %495, i32 0, i32 7, !dbg !2760
  %497 = load i32, ptr %496, align 4, !dbg !2760
  %498 = and i32 %497, 2048, !dbg !2761
  %499 = icmp ne i32 %498, 0, !dbg !2759
  br i1 %499, label %500, label %506, !dbg !2759

500:                                              ; preds = %492
  %501 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 26) #6, !dbg !2762
  %502 = load ptr, ptr %501, align 8, !dbg !2762
  %503 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 27) #6, !dbg !2764
  %504 = load ptr, ptr %503, align 8, !dbg !2764
  %505 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %502, ptr noundef %504), !dbg !2765
  br label %808, !dbg !2766

506:                                              ; preds = %492
  %507 = load i32, ptr @GameTime, align 4, !dbg !2767
  %508 = load i32, ptr @Player_num, align 4, !dbg !2769
  %509 = sext i32 %508 to i64, !dbg !2770
  %510 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %509, !dbg !2770
  %511 = getelementptr inbounds nuw %struct.player, ptr %510, i32 0, i32 24, !dbg !2771
  store i32 %507, ptr %511, align 4, !dbg !2772
  %512 = load i32, ptr @Player_num, align 4, !dbg !2773
  %513 = sext i32 %512 to i64, !dbg !2774
  %514 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %513, !dbg !2774
  %515 = getelementptr inbounds nuw %struct.player, ptr %514, i32 0, i32 7, !dbg !2775
  %516 = load i32, ptr %515, align 4, !dbg !2776
  %517 = or i32 %516, 2048, !dbg !2776
  store i32 %517, ptr %515, align 4, !dbg !2776
  call void @_Z17ai_do_cloak_stuffv(), !dbg !2777
  %518 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 28) #6, !dbg !2778
  %519 = load ptr, ptr %518, align 8, !dbg !2778
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef -10, i32 noundef -10, i32 noundef -10, i32 noundef 0, ptr noundef @.str.2, ptr noundef %519), !dbg !2779
  store i32 1, ptr %4, align 4, !dbg !2780
  br label %808, !dbg !2781

520:                                              ; preds = %67
  %521 = load i32, ptr @Player_num, align 4, !dbg !2782
  %522 = sext i32 %521 to i64, !dbg !2784
  %523 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %522, !dbg !2784
  %524 = getelementptr inbounds nuw %struct.player, ptr %523, i32 0, i32 7, !dbg !2785
  %525 = load i32, ptr %524, align 4, !dbg !2785
  %526 = and i32 %525, 1, !dbg !2786
  %527 = icmp ne i32 %526, 0, !dbg !2784
  br i1 %527, label %528, label %534, !dbg !2784

528:                                              ; preds = %520
  %529 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 26) #6, !dbg !2787
  %530 = load ptr, ptr %529, align 8, !dbg !2787
  %531 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 29) #6, !dbg !2789
  %532 = load ptr, ptr %531, align 8, !dbg !2789
  %533 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %530, ptr noundef %532), !dbg !2790
  br label %808, !dbg !2791

534:                                              ; preds = %520
  %535 = load i32, ptr @GameTime, align 4, !dbg !2792
  %536 = load i32, ptr @Player_num, align 4, !dbg !2794
  %537 = sext i32 %536 to i64, !dbg !2795
  %538 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %537, !dbg !2795
  %539 = getelementptr inbounds nuw %struct.player, ptr %538, i32 0, i32 25, !dbg !2796
  store i32 %535, ptr %539, align 4, !dbg !2797
  %540 = load i32, ptr @Player_num, align 4, !dbg !2798
  %541 = sext i32 %540 to i64, !dbg !2799
  %542 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %541, !dbg !2799
  %543 = getelementptr inbounds nuw %struct.player, ptr %542, i32 0, i32 7, !dbg !2800
  %544 = load i32, ptr %543, align 4, !dbg !2801
  %545 = or i32 %544, 1, !dbg !2801
  store i32 %545, ptr %543, align 4, !dbg !2801
  %546 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 30) #6, !dbg !2802
  %547 = load ptr, ptr %546, align 8, !dbg !2802
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 7, i32 noundef 14, i32 noundef 21, i32 noundef 0, ptr noundef @.str.2, ptr noundef %547), !dbg !2803
  store i32 1, ptr %4, align 4, !dbg !2804
  br label %808, !dbg !2805

548:                                              ; preds = %67
  call void @_Z18do_megawow_powerupi(i32 noundef 50), !dbg !2806
  store i32 1, ptr %4, align 4, !dbg !2807
  br label %808, !dbg !2808

549:                                              ; preds = %67
  %550 = load i32, ptr @Player_num, align 4, !dbg !2809
  %551 = sext i32 %550 to i64, !dbg !2811
  %552 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %551, !dbg !2811
  %553 = getelementptr inbounds nuw %struct.player, ptr %552, i32 0, i32 7, !dbg !2812
  %554 = load i32, ptr %553, align 4, !dbg !2812
  %555 = and i32 %554, 64, !dbg !2813
  %556 = icmp ne i32 %555, 0, !dbg !2811
  br i1 %556, label %557, label %567, !dbg !2811

557:                                              ; preds = %549
  %558 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2814
  %559 = load ptr, ptr %558, align 8, !dbg !2814
  %560 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %559, ptr noundef @.str.6), !dbg !2816
  %561 = load i32, ptr @Game_mode, align 4, !dbg !2817
  %562 = and i32 %561, 38, !dbg !2819
  %563 = icmp ne i32 %562, 0, !dbg !2820
  br i1 %563, label %566, label %564, !dbg !2821

564:                                              ; preds = %557
  %565 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2822
  store i32 %565, ptr %4, align 4, !dbg !2823
  br label %566, !dbg !2824

566:                                              ; preds = %564, %557
  br label %574, !dbg !2825

567:                                              ; preds = %549
  %568 = load i32, ptr @Player_num, align 4, !dbg !2826
  %569 = sext i32 %568 to i64, !dbg !2828
  %570 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %569, !dbg !2828
  %571 = getelementptr inbounds nuw %struct.player, ptr %570, i32 0, i32 7, !dbg !2829
  %572 = load i32, ptr %571, align 4, !dbg !2830
  %573 = or i32 %572, 64, !dbg !2830
  store i32 %573, ptr %571, align 4, !dbg !2830
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef @.str.7), !dbg !2831
  store i32 1, ptr %4, align 4, !dbg !2832
  br label %574

574:                                              ; preds = %567, %566
  br label %808, !dbg !2833

575:                                              ; preds = %67
  %576 = load i32, ptr @Player_num, align 4, !dbg !2834
  %577 = sext i32 %576 to i64, !dbg !2836
  %578 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %577, !dbg !2836
  %579 = getelementptr inbounds nuw %struct.player, ptr %578, i32 0, i32 7, !dbg !2837
  %580 = load i32, ptr %579, align 4, !dbg !2837
  %581 = and i32 %580, 256, !dbg !2838
  %582 = icmp ne i32 %581, 0, !dbg !2836
  br i1 %582, label %583, label %593, !dbg !2836

583:                                              ; preds = %575
  %584 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2839
  %585 = load ptr, ptr %584, align 8, !dbg !2839
  %586 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %585, ptr noundef @.str.8), !dbg !2841
  %587 = load i32, ptr @Game_mode, align 4, !dbg !2842
  %588 = and i32 %587, 38, !dbg !2844
  %589 = icmp ne i32 %588, 0, !dbg !2845
  br i1 %589, label %592, label %590, !dbg !2846

590:                                              ; preds = %583
  %591 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2847
  store i32 %591, ptr %4, align 4, !dbg !2848
  br label %592, !dbg !2849

592:                                              ; preds = %590, %583
  br label %613, !dbg !2850

593:                                              ; preds = %575
  %594 = load i32, ptr @Player_num, align 4, !dbg !2851
  %595 = sext i32 %594 to i64, !dbg !2853
  %596 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %595, !dbg !2853
  %597 = getelementptr inbounds nuw %struct.player, ptr %596, i32 0, i32 7, !dbg !2854
  %598 = load i32, ptr %597, align 4, !dbg !2855
  %599 = or i32 %598, 256, !dbg !2855
  store i32 %599, ptr %597, align 4, !dbg !2855
  %600 = call noundef signext i8 @_Z11GetKeyValuec(i8 noundef signext 54), !dbg !2856
  %601 = sext i8 %600 to i32, !dbg !2858
  %602 = icmp slt i32 %601, 255, !dbg !2859
  br i1 %602, label %603, label %611, !dbg !2859

603:                                              ; preds = %593
  %604 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0, !dbg !2860
  %605 = call noundef signext i8 @_Z11GetKeyValuec(i8 noundef signext 54), !dbg !2862
  %606 = sext i8 %605 to i32, !dbg !2862
  %607 = call noundef zeroext i8 @_Z12key_to_asciii(i32 noundef %606), !dbg !2863
  %608 = zext i8 %607 to i32, !dbg !2863
  %609 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %604, ptr noundef @.str.9, i32 noundef %608) #6, !dbg !2864
  %610 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0, !dbg !2865
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef %610), !dbg !2866
  br label %612, !dbg !2867

611:                                              ; preds = %593
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef @.str.10), !dbg !2868
  br label %612

612:                                              ; preds = %611, %603
  store i32 1, ptr %4, align 4, !dbg !2869
  br label %613

613:                                              ; preds = %612, %592
  br label %808, !dbg !2870

614:                                              ; preds = %67
  %615 = load i32, ptr @Player_num, align 4, !dbg !2871
  %616 = sext i32 %615 to i64, !dbg !2873
  %617 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %616, !dbg !2873
  %618 = getelementptr inbounds nuw %struct.player, ptr %617, i32 0, i32 12, !dbg !2874
  %619 = load i8, ptr %618, align 2, !dbg !2874
  %620 = zext i8 %619 to i32, !dbg !2873
  %621 = icmp sge i32 %620, 5, !dbg !2875
  br i1 %621, label %622, label %628, !dbg !2875

622:                                              ; preds = %614
  %623 = load i32, ptr @Player_num, align 4, !dbg !2876
  %624 = sext i32 %623 to i64, !dbg !2878
  %625 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %624, !dbg !2878
  %626 = getelementptr inbounds nuw %struct.player, ptr %625, i32 0, i32 12, !dbg !2879
  store i8 5, ptr %626, align 2, !dbg !2880
  %627 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.11), !dbg !2881
  br label %678, !dbg !2882

628:                                              ; preds = %614
    #dbg_declare(ptr %11, !2883, !DIExpression(), !2885)
  %629 = load i32, ptr @Player_num, align 4, !dbg !2886
  %630 = sext i32 %629 to i64, !dbg !2887
  %631 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %630, !dbg !2887
  %632 = getelementptr inbounds nuw %struct.player, ptr %631, i32 0, i32 12, !dbg !2888
  %633 = load i8, ptr %632, align 2, !dbg !2888
  %634 = zext i8 %633 to i32, !dbg !2887
  store i32 %634, ptr %11, align 4, !dbg !2885
  %635 = load i32, ptr @Player_num, align 4, !dbg !2889
  %636 = sext i32 %635 to i64, !dbg !2891
  %637 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %636, !dbg !2891
  %638 = getelementptr inbounds nuw %struct.player, ptr %637, i32 0, i32 12, !dbg !2892
  %639 = load i8, ptr %638, align 2, !dbg !2892
  %640 = zext i8 %639 to i32, !dbg !2891
  %641 = icmp sle i32 %640, 3, !dbg !2893
  br i1 %641, label %642, label %647, !dbg !2893

642:                                              ; preds = %628
  %643 = load i32, ptr @Player_num, align 4, !dbg !2894
  %644 = sext i32 %643 to i64, !dbg !2895
  %645 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %644, !dbg !2895
  %646 = getelementptr inbounds nuw %struct.player, ptr %645, i32 0, i32 12, !dbg !2896
  store i8 3, ptr %646, align 2, !dbg !2897
  br label %647, !dbg !2895

647:                                              ; preds = %642, %628
  %648 = load i32, ptr @Player_num, align 4, !dbg !2898
  %649 = sext i32 %648 to i64, !dbg !2899
  %650 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %649, !dbg !2899
  %651 = getelementptr inbounds nuw %struct.player, ptr %650, i32 0, i32 12, !dbg !2900
  %652 = load i8, ptr %651, align 2, !dbg !2901
  %653 = add i8 %652, 1, !dbg !2901
  store i8 %653, ptr %651, align 2, !dbg !2901
  %654 = load i32, ptr @Newdemo_state, align 4, !dbg !2902
  %655 = icmp eq i32 %654, 1, !dbg !2904
  br i1 %655, label %656, label %664, !dbg !2904

656:                                              ; preds = %647
  %657 = load i32, ptr %11, align 4, !dbg !2905
  %658 = trunc i32 %657 to i8, !dbg !2905
  %659 = load i32, ptr @Player_num, align 4, !dbg !2906
  %660 = sext i32 %659 to i64, !dbg !2907
  %661 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %660, !dbg !2907
  %662 = getelementptr inbounds nuw %struct.player, ptr %661, i32 0, i32 12, !dbg !2908
  %663 = load i8, ptr %662, align 2, !dbg !2908
  call void @_Z26newdemo_record_laser_levelaa(i8 noundef signext %658, i8 noundef signext %663), !dbg !2909
  br label %664, !dbg !2909

664:                                              ; preds = %656, %647
  %665 = load i32, ptr @Player_num, align 4, !dbg !2910
  %666 = sext i32 %665 to i64, !dbg !2911
  %667 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %666, !dbg !2911
  %668 = getelementptr inbounds nuw %struct.player, ptr %667, i32 0, i32 12, !dbg !2912
  %669 = load i8, ptr %668, align 2, !dbg !2912
  %670 = zext i8 %669 to i32, !dbg !2911
  %671 = add nsw i32 %670, 1, !dbg !2913
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 10, i32 noundef 0, i32 noundef 10, i32 noundef 0, ptr noundef @.str.12, i32 noundef %671), !dbg !2914
  call void @_Z24update_laser_weapon_infov(), !dbg !2915
  %672 = load i8, ptr @Primary_weapon, align 1, !dbg !2916
  %673 = sext i8 %672 to i32, !dbg !2916
  %674 = icmp ne i32 %673, 0, !dbg !2918
  br i1 %674, label %675, label %677, !dbg !2918

675:                                              ; preds = %664
  %676 = call noundef i32 @_Z20check_to_use_primaryi(i32 noundef 5), !dbg !2919
  br label %677, !dbg !2919

677:                                              ; preds = %675, %664
  store i32 1, ptr %4, align 4, !dbg !2920
  br label %678

678:                                              ; preds = %677, %622
  %679 = load i32, ptr %4, align 4, !dbg !2921
  %680 = icmp ne i32 %679, 0, !dbg !2921
  br i1 %680, label %687, label %681, !dbg !2923

681:                                              ; preds = %678
  %682 = load i32, ptr @Game_mode, align 4, !dbg !2924
  %683 = and i32 %682, 38, !dbg !2925
  %684 = icmp ne i32 %683, 0, !dbg !2926
  br i1 %684, label %687, label %685, !dbg !2923

685:                                              ; preds = %681
  %686 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2927
  store i32 %686, ptr %4, align 4, !dbg !2928
  br label %687, !dbg !2929

687:                                              ; preds = %685, %681, %678
  br label %808, !dbg !2930

688:                                              ; preds = %67
  %689 = load i32, ptr @Player_num, align 4, !dbg !2931
  %690 = sext i32 %689 to i64, !dbg !2933
  %691 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %690, !dbg !2933
  %692 = getelementptr inbounds nuw %struct.player, ptr %691, i32 0, i32 7, !dbg !2934
  %693 = load i32, ptr %692, align 4, !dbg !2934
  %694 = and i32 %693, 128, !dbg !2935
  %695 = icmp ne i32 %694, 0, !dbg !2933
  br i1 %695, label %696, label %706, !dbg !2933

696:                                              ; preds = %688
  %697 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2936
  %698 = load ptr, ptr %697, align 8, !dbg !2936
  %699 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %698, ptr noundef @.str.13), !dbg !2938
  %700 = load i32, ptr @Game_mode, align 4, !dbg !2939
  %701 = and i32 %700, 38, !dbg !2941
  %702 = icmp ne i32 %701, 0, !dbg !2942
  br i1 %702, label %705, label %703, !dbg !2943

703:                                              ; preds = %696
  %704 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2944
  store i32 %704, ptr %4, align 4, !dbg !2945
  br label %705, !dbg !2946

705:                                              ; preds = %703, %696
  br label %720, !dbg !2947

706:                                              ; preds = %688
  %707 = load i32, ptr @Player_num, align 4, !dbg !2948
  %708 = sext i32 %707 to i64, !dbg !2950
  %709 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %708, !dbg !2950
  %710 = getelementptr inbounds nuw %struct.player, ptr %709, i32 0, i32 7, !dbg !2951
  %711 = load i32, ptr %710, align 4, !dbg !2952
  %712 = or i32 %711, 128, !dbg !2952
  store i32 %712, ptr %710, align 4, !dbg !2952
  %713 = load ptr, ptr %3, align 8, !dbg !2953
  %714 = getelementptr inbounds nuw %struct.object, ptr %713, i32 0, i32 2, !dbg !2954
  %715 = load i8, ptr %714, align 1, !dbg !2954
  %716 = zext i8 %715 to i64, !dbg !2955
  %717 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %716, !dbg !2955
  %718 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %717, i32 0, i32 1, !dbg !2956
  %719 = load i32, ptr %718, align 4, !dbg !2956
  call void @_Z16digi_play_sampleii(i32 noundef %719, i32 noundef 65536), !dbg !2957
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef @.str.14), !dbg !2958
  store i32 1, ptr %4, align 4, !dbg !2959
  br label %720

720:                                              ; preds = %706, %705
  br label %808, !dbg !2960

721:                                              ; preds = %67
  %722 = load i32, ptr @Player_num, align 4, !dbg !2961
  %723 = sext i32 %722 to i64, !dbg !2963
  %724 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %723, !dbg !2963
  %725 = getelementptr inbounds nuw %struct.player, ptr %724, i32 0, i32 7, !dbg !2964
  %726 = load i32, ptr %725, align 4, !dbg !2964
  %727 = and i32 %726, 4096, !dbg !2965
  %728 = icmp ne i32 %727, 0, !dbg !2963
  br i1 %728, label %729, label %739, !dbg !2963

729:                                              ; preds = %721
  %730 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2966
  %731 = load ptr, ptr %730, align 8, !dbg !2966
  %732 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %731, ptr noundef @.str.15), !dbg !2968
  %733 = load i32, ptr @Game_mode, align 4, !dbg !2969
  %734 = and i32 %733, 38, !dbg !2971
  %735 = icmp ne i32 %734, 0, !dbg !2972
  br i1 %735, label %738, label %736, !dbg !2973

736:                                              ; preds = %729
  %737 = call noundef i32 @_Z14pick_up_energyv(), !dbg !2974
  store i32 %737, ptr %4, align 4, !dbg !2975
  br label %738, !dbg !2976

738:                                              ; preds = %736, %729
  br label %753, !dbg !2977

739:                                              ; preds = %721
  %740 = load i32, ptr @Player_num, align 4, !dbg !2978
  %741 = sext i32 %740 to i64, !dbg !2980
  %742 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %741, !dbg !2980
  %743 = getelementptr inbounds nuw %struct.player, ptr %742, i32 0, i32 7, !dbg !2981
  %744 = load i32, ptr %743, align 4, !dbg !2982
  %745 = or i32 %744, 4096, !dbg !2982
  store i32 %745, ptr %743, align 4, !dbg !2982
  %746 = load ptr, ptr %3, align 8, !dbg !2983
  %747 = getelementptr inbounds nuw %struct.object, ptr %746, i32 0, i32 2, !dbg !2984
  %748 = load i8, ptr %747, align 1, !dbg !2984
  %749 = zext i8 %748 to i64, !dbg !2985
  %750 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %749, !dbg !2985
  %751 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %750, i32 0, i32 1, !dbg !2986
  %752 = load i32, ptr %751, align 4, !dbg !2986
  call void @_Z16digi_play_sampleii(i32 noundef %752, i32 noundef 65536), !dbg !2987
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 15, i32 noundef 15, i32 noundef 0, ptr noundef @.str.16), !dbg !2988
  store i32 65536, ptr @Afterburner_charge, align 4, !dbg !2989
  store i32 1, ptr %4, align 4, !dbg !2990
  br label %753

753:                                              ; preds = %739, %738
  br label %808, !dbg !2991

754:                                              ; preds = %67
  %755 = load i32, ptr @Player_num, align 4, !dbg !2992
  %756 = sext i32 %755 to i64, !dbg !2994
  %757 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %756, !dbg !2994
  %758 = getelementptr inbounds nuw %struct.player, ptr %757, i32 0, i32 7, !dbg !2995
  %759 = load i32, ptr %758, align 4, !dbg !2995
  %760 = and i32 %759, 8192, !dbg !2996
  %761 = icmp ne i32 %760, 0, !dbg !2994
  br i1 %761, label %762, label %772, !dbg !2994

762:                                              ; preds = %754
  %763 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 23) #6, !dbg !2997
  %764 = load ptr, ptr %763, align 8, !dbg !2997
  %765 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.5, ptr noundef %764, ptr noundef @.str.17), !dbg !2999
  %766 = load i32, ptr @Game_mode, align 4, !dbg !3000
  %767 = and i32 %766, 38, !dbg !3002
  %768 = icmp ne i32 %767, 0, !dbg !3003
  br i1 %768, label %771, label %769, !dbg !3004

769:                                              ; preds = %762
  %770 = call noundef i32 @_Z14pick_up_energyv(), !dbg !3005
  store i32 %770, ptr %4, align 4, !dbg !3006
  br label %771, !dbg !3007

771:                                              ; preds = %769, %762
  br label %803, !dbg !3008

772:                                              ; preds = %754
    #dbg_declare(ptr %12, !3009, !DIExpression(), !3014)
  %773 = load i32, ptr @Player_num, align 4, !dbg !3015
  %774 = sext i32 %773 to i64, !dbg !3016
  %775 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %774, !dbg !3016
  %776 = getelementptr inbounds nuw %struct.player, ptr %775, i32 0, i32 7, !dbg !3017
  %777 = load i32, ptr %776, align 4, !dbg !3018
  %778 = or i32 %777, 8192, !dbg !3018
  store i32 %778, ptr %776, align 4, !dbg !3018
  %779 = load ptr, ptr %3, align 8, !dbg !3019
  %780 = getelementptr inbounds nuw %struct.object, ptr %779, i32 0, i32 2, !dbg !3020
  %781 = load i8, ptr %780, align 1, !dbg !3020
  %782 = zext i8 %781 to i64, !dbg !3021
  %783 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %782, !dbg !3021
  %784 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %783, i32 0, i32 1, !dbg !3022
  %785 = load i32, ptr %784, align 4, !dbg !3022
  call void @_Z16digi_play_sampleii(i32 noundef %785, i32 noundef 65536), !dbg !3023
  %786 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0, !dbg !3024
  %787 = load i32, ptr @Headlight_active_default, align 4, !dbg !3025
  %788 = icmp ne i32 %787, 0, !dbg !3025
  %789 = zext i1 %788 to i64, !dbg !3025
  %790 = select i1 %788, ptr @.str.19, ptr @.str.20, !dbg !3025
  %791 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %786, ptr noundef @.str.18, ptr noundef %790) #6, !dbg !3026
  %792 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0, !dbg !3027
  call void (i32, i32, i32, i32, ptr, ...) @_Z13powerup_basiciiiiPKcz(i32 noundef 15, i32 noundef 0, i32 noundef 15, i32 noundef 0, ptr noundef %792), !dbg !3028
  %793 = load i32, ptr @Headlight_active_default, align 4, !dbg !3029
  %794 = icmp ne i32 %793, 0, !dbg !3029
  br i1 %794, label %795, label %802, !dbg !3029

795:                                              ; preds = %772
  %796 = load i32, ptr @Player_num, align 4, !dbg !3031
  %797 = sext i32 %796 to i64, !dbg !3032
  %798 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %797, !dbg !3032
  %799 = getelementptr inbounds nuw %struct.player, ptr %798, i32 0, i32 7, !dbg !3033
  %800 = load i32, ptr %799, align 4, !dbg !3034
  %801 = or i32 %800, 16384, !dbg !3034
  store i32 %801, ptr %799, align 4, !dbg !3034
  br label %802, !dbg !3032

802:                                              ; preds = %795, %772
  store i32 1, ptr %4, align 4, !dbg !3035
  br label %803

803:                                              ; preds = %802, %771
  br label %808, !dbg !3036

804:                                              ; preds = %67
  br label %808, !dbg !3037

805:                                              ; preds = %67
  br label %808, !dbg !3038

806:                                              ; preds = %67
  br label %808, !dbg !3039

807:                                              ; preds = %67
  br label %808, !dbg !3040

808:                                              ; preds = %807, %806, %805, %804, %803, %753, %720, %687, %613, %574, %548, %534, %528, %506, %500, %490, %488, %486, %484, %482, %480, %478, %476, %474, %472, %470, %468, %466, %464, %463, %444, %433, %422, %411, %400, %389, %337, %304, %280, %271, %247, %238, %214, %204, %202, %201, %141, %81, %72
  %809 = load i32, ptr %4, align 4, !dbg !3041
  %810 = icmp ne i32 %809, 0, !dbg !3041
  br i1 %810, label %814, label %811, !dbg !3043

811:                                              ; preds = %808
  %812 = load i32, ptr %5, align 4, !dbg !3044
  %813 = icmp ne i32 %812, 0, !dbg !3044
  br i1 %813, label %814, label %832, !dbg !3045

814:                                              ; preds = %811, %808
  %815 = load i32, ptr %7, align 4, !dbg !3046
  %816 = sext i32 %815 to i64, !dbg !3047
  %817 = getelementptr inbounds [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %816, !dbg !3047
  %818 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %817, i32 0, i32 1, !dbg !3048
  %819 = load i32, ptr %818, align 4, !dbg !3048
  %820 = icmp sgt i32 %819, -1, !dbg !3049
  br i1 %820, label %821, label %832, !dbg !3045

821:                                              ; preds = %814
  %822 = load i32, ptr %7, align 4, !dbg !3050
  %823 = sext i32 %822 to i64, !dbg !3052
  %824 = getelementptr inbounds [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %823, !dbg !3052
  %825 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %824, i32 0, i32 1, !dbg !3053
  %826 = load i32, ptr %825, align 4, !dbg !3053
  call void @_Z16digi_play_sampleii(i32 noundef %826, i32 noundef 65536), !dbg !3054
  %827 = load ptr, ptr %3, align 8, !dbg !3055
  %828 = ptrtoint ptr %827 to i64, !dbg !3056
  %829 = sub i64 %828, ptrtoint (ptr @Objects to i64), !dbg !3056
  %830 = sdiv exact i64 %829, 268, !dbg !3056
  %831 = trunc i64 %830 to i32, !dbg !3055
  call void @_Z31detect_escort_goal_accomplishedi(i32 noundef %831), !dbg !3057
  br label %832, !dbg !3058

832:                                              ; preds = %821, %814, %811
  store i32 1, ptr @PlayerMessage, align 4, !dbg !3059
  %833 = load i32, ptr %4, align 4, !dbg !3060
  store i32 %833, ptr %2, align 4, !dbg !3061
  br label %834, !dbg !3061

834:                                              ; preds = %832, %66, %32
  %835 = load i32, ptr %2, align 4, !dbg !3062
  ret i32 %835, !dbg !3062
}

declare noundef i32 @_Z15pick_up_primaryi(i32 noundef) #1

declare noundef i32 @_Z17pick_up_secondaryii(i32 noundef, i32 noundef) #1

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #1

declare void @_Z22invalidate_escort_goalv() #1

declare void @_Z17ai_do_cloak_stuffv() #1

declare noundef signext i8 @_Z11GetKeyValuec(i8 noundef signext) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #4

declare noundef zeroext i8 @_Z12key_to_asciii(i32 noundef) #1

declare noundef i32 @_Z20check_to_use_primaryi(i32 noundef) #1

declare void @_Z31detect_escort_goal_accomplishedi(i32 noundef) #1

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!1419, !1420, !1421, !1422, !1423, !1424, !1425}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1426}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "N_powerup_types", scope: !2, file: !9, line: 52, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, imports: !126, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/powerup.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "a827d850150495f3479b518add536cdc")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7, !26, !33, !38, !43, !48, !50, !55, !60, !65, !67, !72, !77, !82, !87, !92, !94, !99, !104, !106, !111, !116, !121, !123}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "Powerup_info", scope: !2, file: !9, line: 53, type: !10, isLocal: false, isDefinition: true)
!9 = !DIFile(filename: "main_d2/powerup.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a827d850150495f3479b518add536cdc")
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 6400, elements: !24)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_type_info", file: !12, line: 95, baseType: !13)
!12 = !DIFile(filename: "main_d2/powerup.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "7d5f9aa6418a09b187c2d314becfbdca")
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_type_info", file: !12, line: 89, size: 128, flags: DIFlagTypePassByValue, elements: !14, identifier: "_ZTS17powerup_type_info")
!14 = !{!15, !17, !18, !23}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !13, file: !12, line: 91, baseType: !16, size: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "hit_sound", scope: !13, file: !12, line: 92, baseType: !16, size: 32, offset: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !13, file: !12, line: 93, baseType: !19, size: 32, offset: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !20, line: 20, baseType: !21)
!20 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !22, line: 30, baseType: !16)
!22 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!23 = !DIDerivedType(tag: DW_TAG_member, name: "light", scope: !13, file: !12, line: 94, baseType: !19, size: 32, offset: 96)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !9, line: 154, type: !28, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 144, elements: !31)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 18)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(scope: null, file: !9, line: 195, type: !35, isLocal: true, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 72, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 9)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !9, line: 210, type: !40, isLocal: true, isDefinition: true)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 32, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 4)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !9, line: 218, type: !45, isLocal: true, isDefinition: true)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 80, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 10)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "Headlight_active_default", scope: !2, file: !9, line: 231, type: !16, isLocal: false, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !9, line: 312, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 48, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 6)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !9, line: 358, type: !57, isLocal: true, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 56, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 7)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !9, line: 517, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 104, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 13)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(scope: null, file: !9, line: 524, type: !45, isLocal: true, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !9, line: 532, type: !69, isLocal: true, isDefinition: true)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 112, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 14)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(scope: null, file: !9, line: 541, type: !74, isLocal: true, isDefinition: true)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 352, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 44)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(scope: null, file: !9, line: 545, type: !79, isLocal: true, isDefinition: true)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 224, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 28)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(scope: null, file: !9, line: 556, type: !84, isLocal: true, isDefinition: true)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 184, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 23)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(scope: null, file: !9, line: 567, type: !89, isLocal: true, isDefinition: true)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 240, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 30)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(scope: null, file: !9, line: 580, type: !69, isLocal: true, isDefinition: true)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(scope: null, file: !9, line: 591, type: !96, isLocal: true, isDefinition: true)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 88, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 11)
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(scope: null, file: !9, line: 599, type: !101, isLocal: true, isDefinition: true)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 128, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 16)
!104 = !DIGlobalVariableExpression(var: !105, expr: !DIExpression())
!105 = distinct !DIGlobalVariable(scope: null, file: !9, line: 610, type: !62, isLocal: true, isDefinition: true)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(scope: null, file: !9, line: 619, type: !108, isLocal: true, isDefinition: true)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 160, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 20)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(scope: null, file: !9, line: 631, type: !113, isLocal: true, isDefinition: true)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 280, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 35)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(scope: null, file: !9, line: 631, type: !118, isLocal: true, isDefinition: true)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 24, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 3)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(scope: null, file: !9, line: 631, type: !40, isLocal: true, isDefinition: true)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!124 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !20, line: 18, type: !125, isLocal: true, isDefinition: true)
!125 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!126 = !{!127, !134, !138, !139, !143, !147, !151, !154, !158, !161, !163, !165, !167, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !189, !191, !197, !201, !204, !207, !212, !218, !220, !222, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !244, !249, !254, !259, !264, !266, !269, !271, !273, !275, !277, !279, !281, !283, !285, !287, !291, !296, !300, !302, !306, !310, !323, !339, !340, !393, !402, !404, !412, !418, !422, !426, !428, !432, !436, !440, !444, !448, !452, !454, !456, !460, !466, !471, !475, !479, !483, !487, !491, !495, !499, !501, !503, !507, !509, !513, !517, !522, !524, !526, !528, !532, !536, !540, !542, !546, !548, !550, !552, !554, !560, !564, !566, !572, !577, !581, !585, !590, !595, !599, !603, !607, !611, !613, !615, !623, !629, !635, !639, !643, !647, !651, !656, !660, !664, !668, !672, !676, !680, !684, !688, !693, !697, !701, !705, !710, !715, !719, !721, !725, !727, !736, !740, !745, !749, !753, !757, !761, !763, !767, !771, !775, !779, !783, !785, !787, !789, !797, !799, !801, !803, !809, !811, !812, !813, !814, !817, !819, !820, !824, !826, !828, !832, !834, !836, !838, !840, !842, !844, !846, !851, !855, !857, !859, !860, !865, !867, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !901, !903, !905, !907, !911, !913, !917, !919, !921, !923, !925, !929, !931, !933, !937, !939, !941, !945, !947, !951, !953, !955, !959, !961, !963, !965, !967, !969, !971, !975, !977, !979, !981, !983, !985, !987, !989, !993, !997, !999, !1001, !1003, !1005, !1007, !1009, !1011, !1013, !1015, !1017, !1019, !1021, !1023, !1025, !1027, !1029, !1031, !1033, !1035, !1039, !1041, !1043, !1045, !1049, !1051, !1055, !1057, !1059, !1061, !1063, !1067, !1069, !1073, !1075, !1077, !1079, !1081, !1085, !1087, !1089, !1093, !1095, !1097, !1099, !1105, !1107, !1111, !1115, !1117, !1119, !1123, !1127, !1131, !1133, !1137, !1142, !1146, !1150, !1152, !1154, !1156, !1158, !1160, !1162, !1166, !1170, !1175, !1180, !1184, !1185, !1189, !1193, !1198, !1203, !1207, !1213, !1217, !1219, !1223, !1225, !1226, !1230, !1232, !1236, !1240, !1244, !1246, !1250, !1254, !1258, !1264, !1266, !1270, !1274, !1278, !1280, !1284, !1288, !1292, !1294, !1296, !1298, !1302, !1306, !1311, !1315, !1321, !1325, !1329, !1331, !1333, !1335, !1339, !1343, !1347, !1349, !1351, !1355, !1359, !1361, !1365, !1369, !1372, !1374, !1376, !1378, !1407, !1412, !1417}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !130, file: !133, line: 158)
!128 = !DINamespace(name: "__1", scope: !129, exportSymbols: true)
!129 = !DINamespace(name: "std", scope: null)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !131, line: 30, baseType: !132)
!131 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!132 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!133 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !135, file: !133, line: 159)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !136, line: 30, baseType: !137)
!136 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!137 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !21, file: !133, line: 160)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !140, file: !133, line: 161)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !141, line: 30, baseType: !142)
!141 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!142 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !144, file: !133, line: 163)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !145, line: 31, baseType: !146)
!145 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!146 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !148, file: !133, line: 164)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !149, line: 31, baseType: !150)
!149 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!150 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !152, file: !133, line: 165)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !153, line: 31, baseType: !5)
!153 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !155, file: !133, line: 166)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !156, line: 31, baseType: !157)
!156 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!157 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !159, file: !133, line: 168)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !160, line: 29, baseType: !130)
!160 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !162, file: !133, line: 169)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !160, line: 30, baseType: !135)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !164, file: !133, line: 170)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !160, line: 31, baseType: !21)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !166, file: !133, line: 171)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !160, line: 32, baseType: !140)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !168, file: !133, line: 173)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !160, line: 33, baseType: !144)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !170, file: !133, line: 174)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !160, line: 34, baseType: !148)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !172, file: !133, line: 175)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !160, line: 35, baseType: !152)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !174, file: !133, line: 176)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !160, line: 36, baseType: !155)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !176, file: !133, line: 178)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !160, line: 40, baseType: !130)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !178, file: !133, line: 179)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !160, line: 41, baseType: !135)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !180, file: !133, line: 180)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !160, line: 42, baseType: !21)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !182, file: !133, line: 181)
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !160, line: 43, baseType: !140)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !184, file: !133, line: 183)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !160, line: 44, baseType: !144)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !186, file: !133, line: 184)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !160, line: 45, baseType: !148)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !188, file: !133, line: 185)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !160, line: 46, baseType: !152)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !190, file: !133, line: 186)
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !160, line: 47, baseType: !155)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !192, file: !133, line: 188)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !193, line: 32, baseType: !194)
!193 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !195, line: 40, baseType: !196)
!195 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!196 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !198, file: !133, line: 189)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !199, line: 34, baseType: !200)
!199 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!200 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !202, file: !133, line: 191)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !203, line: 32, baseType: !196)
!203 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !205, file: !133, line: 192)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !206, line: 32, baseType: !200)
!206 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !208, file: !211, line: 22)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !209, line: 16, baseType: !210)
!209 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!210 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!211 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !213, file: !217, line: 113)
!213 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !214, file: !214, line: 217, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!214 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!215 = !DISubroutineType(types: !216)
!216 = !{!16, !16}
!217 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !219, file: !217, line: 114)
!219 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !214, file: !214, line: 223, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !221, file: !217, line: 115)
!221 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !214, file: !214, line: 229, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !223, file: !217, line: 116)
!223 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !214, file: !214, line: 235, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !225, file: !217, line: 117)
!225 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !214, file: !214, line: 242, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !227, file: !217, line: 118)
!227 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !214, file: !214, line: 248, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !229, file: !217, line: 119)
!229 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !214, file: !214, line: 254, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !231, file: !217, line: 120)
!231 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !214, file: !214, line: 260, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !233, file: !217, line: 121)
!233 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !214, file: !214, line: 266, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !235, file: !217, line: 122)
!235 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !214, file: !214, line: 272, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !237, file: !217, line: 123)
!237 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !214, file: !214, line: 278, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !239, file: !217, line: 124)
!239 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !214, file: !214, line: 285, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !241, file: !217, line: 125)
!241 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !214, file: !214, line: 297, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !243, file: !217, line: 126)
!243 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !214, file: !214, line: 303, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !245, file: !248, line: 75)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !246, line: 32, baseType: !247)
!246 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !195, line: 111, baseType: !16)
!248 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !250, file: !248, line: 76)
!250 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !251, line: 32, baseType: !252)
!251 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !253, line: 44, baseType: !16)
!253 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !255, file: !248, line: 77)
!255 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !256, line: 32, baseType: !257)
!256 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !253, line: 46, baseType: !258)
!258 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !195, line: 36, baseType: !5)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !260, file: !248, line: 78)
!260 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !261, file: !261, line: 84, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!262 = !DISubroutineType(types: !263)
!263 = !{!16, !245}
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !265, file: !248, line: 79)
!265 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !261, file: !261, line: 90, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !267, file: !248, line: 80)
!267 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !268, file: !268, line: 53, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!268 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !270, file: !248, line: 81)
!270 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !261, file: !261, line: 96, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !272, file: !248, line: 82)
!272 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !261, file: !261, line: 108, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !274, file: !248, line: 83)
!274 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !261, file: !261, line: 114, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !276, file: !248, line: 84)
!276 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !261, file: !261, line: 120, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !278, file: !248, line: 85)
!278 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !261, file: !261, line: 126, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !280, file: !248, line: 86)
!280 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !261, file: !261, line: 132, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !282, file: !248, line: 87)
!282 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !261, file: !261, line: 138, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !284, file: !248, line: 88)
!284 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !261, file: !261, line: 144, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !286, file: !248, line: 89)
!286 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !261, file: !261, line: 150, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !288, file: !248, line: 90)
!288 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !261, file: !261, line: 102, type: !289, flags: DIFlagPrototyped, spFlags: 0)
!289 = !DISubroutineType(types: !290)
!290 = !{!16, !245, !255}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !292, file: !248, line: 91)
!292 = !DISubprogram(name: "wctype", scope: !261, file: !261, line: 190, type: !293, flags: DIFlagPrototyped, spFlags: 0)
!293 = !DISubroutineType(types: !294)
!294 = !{!255, !295}
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !297, file: !248, line: 92)
!297 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !261, file: !261, line: 156, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!298 = !DISubroutineType(types: !299)
!299 = !{!245, !245}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !301, file: !248, line: 93)
!301 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !261, file: !261, line: 162, type: !298, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !303, file: !248, line: 94)
!303 = !DISubprogram(name: "towctrans", scope: !268, file: !268, line: 124, type: !304, flags: DIFlagPrototyped, spFlags: 0)
!304 = !DISubroutineType(types: !305)
!305 = !{!245, !245, !250}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !307, file: !248, line: 95)
!307 = !DISubprogram(name: "wctrans", scope: !268, file: !268, line: 126, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!308 = !DISubroutineType(types: !309)
!309 = !{!250, !295}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !311, file: !322, line: 133)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !312, line: 32, baseType: !313)
!312 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !195, line: 72, baseType: !314)
!314 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !195, line: 70, baseType: !315)
!315 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !195, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !316, identifier: "_ZTS11__mbstate_t")
!316 = !{!317, !321}
!317 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !315, file: !195, line: 68, baseType: !318, size: 1024)
!318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 1024, elements: !319)
!319 = !{!320}
!320 = !DISubrange(count: 128)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !315, file: !195, line: 69, baseType: !142, size: 64)
!322 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !324, file: !322, line: 134)
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !325, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !326, identifier: "_ZTS2tm")
!325 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!326 = !{!327, !328, !329, !330, !331, !332, !333, !334, !335, !336, !337}
!327 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !324, file: !325, line: 79, baseType: !16, size: 32)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !324, file: !325, line: 80, baseType: !16, size: 32, offset: 32)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !324, file: !325, line: 81, baseType: !16, size: 32, offset: 64)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !324, file: !325, line: 82, baseType: !16, size: 32, offset: 96)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !324, file: !325, line: 83, baseType: !16, size: 32, offset: 128)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !324, file: !325, line: 84, baseType: !16, size: 32, offset: 160)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !324, file: !325, line: 85, baseType: !16, size: 32, offset: 192)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !324, file: !325, line: 86, baseType: !16, size: 32, offset: 224)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !324, file: !325, line: 87, baseType: !16, size: 32, offset: 256)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !324, file: !325, line: 88, baseType: !196, size: 64, offset: 320)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !324, file: !325, line: 89, baseType: !338, size: 64, offset: 384)
!338 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !245, file: !322, line: 135)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !341, file: !322, line: 136)
!341 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !342, line: 162, baseType: !343)
!342 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!343 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !342, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !344, identifier: "_ZTS7__sFILE")
!344 = !{!345, !347, !348, !349, !350, !351, !356, !357, !359, !363, !367, !375, !379, !380, !383, !384, !386, !390, !391, !392}
!345 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !343, file: !342, line: 132, baseType: !346, size: 64)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !146, size: 64)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !343, file: !342, line: 133, baseType: !16, size: 32, offset: 64)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !343, file: !342, line: 134, baseType: !16, size: 32, offset: 96)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !343, file: !342, line: 135, baseType: !137, size: 16, offset: 128)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !343, file: !342, line: 136, baseType: !137, size: 16, offset: 144)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !343, file: !342, line: 137, baseType: !352, size: 128, offset: 192)
!352 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !342, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !353, identifier: "_ZTS6__sbuf")
!353 = !{!354, !355}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !352, file: !342, line: 98, baseType: !346, size: 64)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !352, file: !342, line: 99, baseType: !16, size: 32, offset: 64)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !343, file: !342, line: 138, baseType: !16, size: 32, offset: 320)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !343, file: !342, line: 141, baseType: !358, size: 64, offset: 384)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !343, file: !342, line: 142, baseType: !360, size: 64, offset: 448)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64)
!361 = !DISubroutineType(types: !362)
!362 = !{!16, !358}
!363 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !343, file: !342, line: 143, baseType: !364, size: 64, offset: 512)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!365 = !DISubroutineType(types: !366)
!366 = !{!16, !358, !338, !16}
!367 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !343, file: !342, line: 144, baseType: !368, size: 64, offset: 576)
!368 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !369, size: 64)
!369 = !DISubroutineType(types: !370)
!370 = !{!371, !358, !371, !16}
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !342, line: 86, baseType: !372)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !373, line: 83, baseType: !374)
!373 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !195, line: 37, baseType: !142)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !343, file: !342, line: 145, baseType: !376, size: 64, offset: 640)
!376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !377, size: 64)
!377 = !DISubroutineType(types: !378)
!378 = !{!16, !358, !295, !16}
!379 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !343, file: !342, line: 148, baseType: !352, size: 128, offset: 704)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !343, file: !342, line: 149, baseType: !381, size: 64, offset: 832)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!382 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !342, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!383 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !343, file: !342, line: 150, baseType: !16, size: 32, offset: 896)
!384 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !343, file: !342, line: 153, baseType: !385, size: 24, offset: 928)
!385 = !DICompositeType(tag: DW_TAG_array_type, baseType: !146, size: 24, elements: !119)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !343, file: !342, line: 154, baseType: !387, size: 8, offset: 952)
!387 = !DICompositeType(tag: DW_TAG_array_type, baseType: !146, size: 8, elements: !388)
!388 = !{!389}
!389 = !DISubrange(count: 1)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !343, file: !342, line: 157, baseType: !352, size: 128, offset: 960)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !343, file: !342, line: 160, baseType: !16, size: 32, offset: 1088)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !343, file: !342, line: 161, baseType: !371, size: 64, offset: 1152)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !394, file: !322, line: 137)
!394 = !DISubprogram(name: "fwprintf", scope: !395, file: !395, line: 107, type: !396, flags: DIFlagPrototyped, spFlags: 0)
!395 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!396 = !DISubroutineType(types: !397)
!397 = !{!16, !398, !399, null}
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !400, size: 64)
!400 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !401)
!401 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !403, file: !322, line: 138)
!403 = !DISubprogram(name: "fwscanf", scope: !395, file: !395, line: 108, type: !396, flags: DIFlagPrototyped, spFlags: 0)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !405, file: !322, line: 139)
!405 = !DISubprogram(name: "swprintf", scope: !395, file: !395, line: 120, type: !406, flags: DIFlagPrototyped, spFlags: 0)
!406 = !DISubroutineType(types: !407)
!407 = !{!16, !408, !409, !399, null}
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !401, size: 64)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !410, line: 50, baseType: !411)
!410 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !195, line: 87, baseType: !200)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !413, file: !322, line: 140)
!413 = !DISubprogram(name: "vfwprintf", scope: !395, file: !395, line: 124, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!414 = !DISubroutineType(types: !415)
!415 = !{!16, !398, !399, !416}
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !195, line: 95, baseType: !417)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !9, baseType: !338)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !419, file: !322, line: 141)
!419 = !DISubprogram(name: "vswprintf", scope: !395, file: !395, line: 126, type: !420, flags: DIFlagPrototyped, spFlags: 0)
!420 = !DISubroutineType(types: !421)
!421 = !{!16, !408, !409, !399, !416}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !423, file: !322, line: 142)
!423 = !DISubprogram(name: "swscanf", scope: !395, file: !395, line: 122, type: !424, flags: DIFlagPrototyped, spFlags: 0)
!424 = !DISubroutineType(types: !425)
!425 = !{!16, !399, !399, null}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !427, file: !322, line: 143)
!427 = !DISubprogram(name: "vfwscanf", scope: !395, file: !395, line: 195, type: !414, flags: DIFlagPrototyped, spFlags: 0)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !429, file: !322, line: 144)
!429 = !DISubprogram(name: "vswscanf", scope: !395, file: !395, line: 197, type: !430, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DISubroutineType(types: !431)
!431 = !{!16, !399, !399, !416}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !433, file: !322, line: 145)
!433 = !DISubprogram(name: "fgetwc", scope: !395, file: !395, line: 100, type: !434, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DISubroutineType(types: !435)
!435 = !{!245, !398}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !437, file: !322, line: 146)
!437 = !DISubprogram(name: "fgetws", scope: !395, file: !395, line: 102, type: !438, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DISubroutineType(types: !439)
!439 = !{!408, !408, !16, !398}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !441, file: !322, line: 147)
!441 = !DISubprogram(name: "fputwc", scope: !395, file: !395, line: 104, type: !442, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DISubroutineType(types: !443)
!443 = !{!245, !401, !398}
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !445, file: !322, line: 148)
!445 = !DISubprogram(name: "fputws", scope: !395, file: !395, line: 105, type: !446, flags: DIFlagPrototyped, spFlags: 0)
!446 = !DISubroutineType(types: !447)
!447 = !{!16, !399, !398}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !449, file: !322, line: 149)
!449 = !DISubprogram(name: "fwide", scope: !395, file: !395, line: 106, type: !450, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DISubroutineType(types: !451)
!451 = !{!16, !398, !16}
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !453, file: !322, line: 150)
!453 = !DISubprogram(name: "getwc", scope: !395, file: !395, line: 109, type: !434, flags: DIFlagPrototyped, spFlags: 0)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !455, file: !322, line: 151)
!455 = !DISubprogram(name: "putwc", scope: !395, file: !395, line: 118, type: !442, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !457, file: !322, line: 152)
!457 = !DISubprogram(name: "ungetwc", scope: !395, file: !395, line: 123, type: !458, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DISubroutineType(types: !459)
!459 = !{!245, !245, !398}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !461, file: !322, line: 153)
!461 = !DISubprogram(name: "wcstod", scope: !395, file: !395, line: 160, type: !462, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DISubroutineType(types: !463)
!463 = !{!464, !399, !465}
!464 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!465 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !408, size: 64)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !467, file: !322, line: 154)
!467 = !DISubprogram(name: "wcstof", scope: !395, file: !395, line: 200, type: !468, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DISubroutineType(types: !469)
!469 = !{!470, !399, !465}
!470 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !472, file: !322, line: 155)
!472 = !DISubprogram(name: "wcstold", scope: !395, file: !395, line: 202, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!210, !399, !465}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !476, file: !322, line: 156)
!476 = !DISubprogram(name: "wcstol", scope: !395, file: !395, line: 164, type: !477, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DISubroutineType(types: !478)
!478 = !{!196, !399, !465, !16}
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !480, file: !322, line: 157)
!480 = !DISubprogram(name: "wcstoll", scope: !395, file: !395, line: 205, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DISubroutineType(types: !482)
!482 = !{!142, !399, !465, !16}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !484, file: !322, line: 158)
!484 = !DISubprogram(name: "wcstoul", scope: !395, file: !395, line: 167, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DISubroutineType(types: !486)
!486 = !{!200, !399, !465, !16}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !488, file: !322, line: 159)
!488 = !DISubprogram(name: "wcstoull", scope: !395, file: !395, line: 207, type: !489, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DISubroutineType(types: !490)
!490 = !{!157, !399, !465, !16}
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !492, file: !322, line: 160)
!492 = !DISubprogram(name: "wcscpy", scope: !395, file: !395, line: 134, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DISubroutineType(types: !494)
!494 = !{!408, !408, !399}
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !496, file: !322, line: 161)
!496 = !DISubprogram(name: "wcsncpy", scope: !395, file: !395, line: 148, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DISubroutineType(types: !498)
!498 = !{!408, !408, !399, !409}
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !500, file: !322, line: 162)
!500 = !DISubprogram(name: "wcscat", scope: !395, file: !395, line: 130, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !502, file: !322, line: 163)
!502 = !DISubprogram(name: "wcsncat", scope: !395, file: !395, line: 142, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !504, file: !322, line: 164)
!504 = !DISubprogram(name: "wcscmp", scope: !395, file: !395, line: 132, type: !505, flags: DIFlagPrototyped, spFlags: 0)
!505 = !DISubroutineType(types: !506)
!506 = !{!16, !399, !399}
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !508, file: !322, line: 165)
!508 = !DISubprogram(name: "wcscoll", scope: !395, file: !395, line: 133, type: !505, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !510, file: !322, line: 166)
!510 = !DISubprogram(name: "wcsncmp", scope: !395, file: !395, line: 145, type: !511, flags: DIFlagPrototyped, spFlags: 0)
!511 = !DISubroutineType(types: !512)
!512 = !{!16, !399, !399, !409}
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !514, file: !322, line: 167)
!514 = !DISubprogram(name: "wcsxfrm", scope: !395, file: !395, line: 157, type: !515, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DISubroutineType(types: !516)
!516 = !{!409, !408, !399, !409}
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !518, file: !322, line: 168)
!518 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !519, file: !519, line: 147, type: !520, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!520 = !DISubroutineType(types: !521)
!521 = !{!408, !408, !401}
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !523, file: !322, line: 169)
!523 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !519, file: !519, line: 158, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !525, file: !322, line: 170)
!525 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !519, file: !519, line: 168, type: !520, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !527, file: !322, line: 171)
!527 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !519, file: !519, line: 179, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !529, file: !322, line: 172)
!529 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !519, file: !519, line: 190, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DISubroutineType(types: !531)
!531 = !{!408, !408, !401, !409}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !533, file: !322, line: 173)
!533 = !DISubprogram(name: "wcscspn", scope: !395, file: !395, line: 136, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{!409, !399, !399}
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !537, file: !322, line: 174)
!537 = !DISubprogram(name: "wcslen", scope: !395, file: !395, line: 140, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DISubroutineType(types: !539)
!539 = !{!409, !399}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !541, file: !322, line: 175)
!541 = !DISubprogram(name: "wcsspn", scope: !395, file: !395, line: 155, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !543, file: !322, line: 176)
!543 = !DISubprogram(name: "wcstok", scope: !395, file: !395, line: 162, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!408, !408, !399, !465}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !547, file: !322, line: 177)
!547 = !DISubprogram(name: "wmemcmp", scope: !395, file: !395, line: 170, type: !511, flags: DIFlagPrototyped, spFlags: 0)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !549, file: !322, line: 178)
!549 = !DISubprogram(name: "wmemcpy", scope: !395, file: !395, line: 173, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !551, file: !322, line: 179)
!551 = !DISubprogram(name: "wmemmove", scope: !395, file: !395, line: 176, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !553, file: !322, line: 180)
!553 = !DISubprogram(name: "wmemset", scope: !395, file: !395, line: 179, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !555, file: !322, line: 181)
!555 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !395, file: !395, line: 137, type: !556, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DISubroutineType(types: !557)
!557 = !{!409, !408, !409, !399, !558}
!558 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !559, size: 64)
!559 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !324)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !561, file: !322, line: 182)
!561 = !DISubprogram(name: "btowc", scope: !395, file: !395, line: 99, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!245, !16}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !565, file: !322, line: 183)
!565 = !DISubprogram(name: "wctob", scope: !395, file: !395, line: 159, type: !262, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !567, file: !322, line: 184)
!567 = !DISubprogram(name: "mbsinit", scope: !395, file: !395, line: 115, type: !568, flags: DIFlagPrototyped, spFlags: 0)
!568 = !DISubroutineType(types: !569)
!569 = !{!16, !570}
!570 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !571, size: 64)
!571 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !311)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !573, file: !322, line: 185)
!573 = !DISubprogram(name: "mbrlen", scope: !395, file: !395, line: 111, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!409, !295, !409, !576}
!576 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !578, file: !322, line: 186)
!578 = !DISubprogram(name: "mbrtowc", scope: !395, file: !395, line: 113, type: !579, flags: DIFlagPrototyped, spFlags: 0)
!579 = !DISubroutineType(types: !580)
!580 = !{!409, !408, !295, !409, !576}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !582, file: !322, line: 187)
!582 = !DISubprogram(name: "wcrtomb", scope: !395, file: !395, line: 129, type: !583, flags: DIFlagPrototyped, spFlags: 0)
!583 = !DISubroutineType(types: !584)
!584 = !{!409, !338, !401, !576}
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !586, file: !322, line: 188)
!586 = !DISubprogram(name: "mbsrtowcs", scope: !395, file: !395, line: 116, type: !587, flags: DIFlagPrototyped, spFlags: 0)
!587 = !DISubroutineType(types: !588)
!588 = !{!409, !408, !589, !409, !576}
!589 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !591, file: !322, line: 189)
!591 = !DISubprogram(name: "wcsrtombs", scope: !395, file: !395, line: 153, type: !592, flags: DIFlagPrototyped, spFlags: 0)
!592 = !DISubroutineType(types: !593)
!593 = !{!409, !338, !594, !409, !576}
!594 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !596, file: !322, line: 191)
!596 = !DISubprogram(name: "getwchar", scope: !395, file: !395, line: 110, type: !597, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DISubroutineType(types: !598)
!598 = !{!245}
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !600, file: !322, line: 192)
!600 = !DISubprogram(name: "vwscanf", scope: !395, file: !395, line: 199, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!16, !399, !416}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !604, file: !322, line: 193)
!604 = !DISubprogram(name: "wscanf", scope: !395, file: !395, line: 181, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DISubroutineType(types: !606)
!606 = !{!16, !399, null}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !608, file: !322, line: 195)
!608 = !DISubprogram(name: "putwchar", scope: !395, file: !395, line: 119, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!245, !401}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !612, file: !322, line: 196)
!612 = !DISubprogram(name: "vwprintf", scope: !395, file: !395, line: 128, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !614, file: !322, line: 197)
!614 = !DISubprogram(name: "wprintf", scope: !395, file: !395, line: 180, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !616, file: !622, line: 106)
!616 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !617, line: 105, baseType: !618)
!617 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!618 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !617, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !619, identifier: "_ZTS5div_t")
!619 = !{!620, !621}
!620 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !618, file: !617, line: 103, baseType: !16, size: 32)
!621 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !618, file: !617, line: 104, baseType: !16, size: 32, offset: 32)
!622 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !624, file: !622, line: 107)
!624 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !617, line: 110, baseType: !625)
!625 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !617, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !626, identifier: "_ZTS6ldiv_t")
!626 = !{!627, !628}
!627 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !625, file: !617, line: 108, baseType: !196, size: 64)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !625, file: !617, line: 109, baseType: !196, size: 64, offset: 64)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !630, file: !622, line: 108)
!630 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !617, line: 116, baseType: !631)
!631 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !617, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !632, identifier: "_ZTS7lldiv_t")
!632 = !{!633, !634}
!633 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !631, file: !617, line: 114, baseType: !142, size: 64)
!634 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !631, file: !617, line: 115, baseType: !142, size: 64, offset: 64)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !636, file: !622, line: 109)
!636 = !DISubprogram(name: "atof", scope: !617, file: !617, line: 149, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DISubroutineType(types: !638)
!638 = !{!464, !295}
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !640, file: !622, line: 110)
!640 = !DISubprogram(name: "atoi", scope: !617, file: !617, line: 150, type: !641, flags: DIFlagPrototyped, spFlags: 0)
!641 = !DISubroutineType(types: !642)
!642 = !{!16, !295}
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !644, file: !622, line: 111)
!644 = !DISubprogram(name: "atol", scope: !617, file: !617, line: 151, type: !645, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!196, !295}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !648, file: !622, line: 112)
!648 = !DISubprogram(name: "atoll", scope: !617, file: !617, line: 154, type: !649, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DISubroutineType(types: !650)
!650 = !{!142, !295}
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !652, file: !622, line: 113)
!652 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !617, file: !617, line: 184, type: !653, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DISubroutineType(types: !654)
!654 = !{!464, !295, !655}
!655 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !657, file: !622, line: 114)
!657 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !617, file: !617, line: 185, type: !658, flags: DIFlagPrototyped, spFlags: 0)
!658 = !DISubroutineType(types: !659)
!659 = !{!470, !295, !655}
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !661, file: !622, line: 115)
!661 = !DISubprogram(name: "strtold", scope: !617, file: !617, line: 188, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DISubroutineType(types: !663)
!663 = !{!210, !295, !655}
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !665, file: !622, line: 116)
!665 = !DISubprogram(name: "strtol", scope: !617, file: !617, line: 186, type: !666, flags: DIFlagPrototyped, spFlags: 0)
!666 = !DISubroutineType(types: !667)
!667 = !{!196, !295, !655, !16}
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !669, file: !622, line: 117)
!669 = !DISubprogram(name: "strtoll", scope: !617, file: !617, line: 191, type: !670, flags: DIFlagPrototyped, spFlags: 0)
!670 = !DISubroutineType(types: !671)
!671 = !{!142, !295, !655, !16}
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !673, file: !622, line: 118)
!673 = !DISubprogram(name: "strtoul", scope: !617, file: !617, line: 194, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{!200, !295, !655, !16}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !677, file: !622, line: 119)
!677 = !DISubprogram(name: "strtoull", scope: !617, file: !617, line: 197, type: !678, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DISubroutineType(types: !679)
!679 = !{!157, !295, !655, !16}
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !681, file: !622, line: 120)
!681 = !DISubprogram(name: "rand", scope: !617, file: !617, line: 181, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DISubroutineType(types: !683)
!683 = !{!16}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !685, file: !622, line: 121)
!685 = !DISubprogram(name: "srand", scope: !617, file: !617, line: 183, type: !686, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DISubroutineType(types: !687)
!687 = !{null, !5}
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !689, file: !622, line: 122)
!689 = !DISubprogram(name: "calloc", scope: !690, file: !690, line: 55, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!691 = !DISubroutineType(types: !692)
!692 = !{!358, !409, !409}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !694, file: !622, line: 123)
!694 = !DISubprogram(name: "free", scope: !690, file: !690, line: 56, type: !695, flags: DIFlagPrototyped, spFlags: 0)
!695 = !DISubroutineType(types: !696)
!696 = !{null, !358}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !698, file: !622, line: 124)
!698 = !DISubprogram(name: "malloc", scope: !690, file: !690, line: 54, type: !699, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{!358, !409}
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !702, file: !622, line: 125)
!702 = !DISubprogram(name: "realloc", scope: !690, file: !690, line: 57, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{!358, !358, !409}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !706, file: !622, line: 126)
!706 = !DISubprogram(name: "abort", scope: !707, file: !707, line: 33, type: !708, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!707 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!708 = !DISubroutineType(types: !709)
!709 = !{null}
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !711, file: !622, line: 127)
!711 = !DISubprogram(name: "atexit", scope: !617, file: !617, line: 144, type: !712, flags: DIFlagPrototyped, spFlags: 0)
!712 = !DISubroutineType(types: !713)
!713 = !{!16, !714}
!714 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !716, file: !622, line: 128)
!716 = !DISubprogram(name: "exit", scope: !617, file: !617, line: 160, type: !717, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!717 = !DISubroutineType(types: !718)
!718 = !{null, !16}
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !720, file: !622, line: 129)
!720 = !DISubprogram(name: "_Exit", scope: !617, file: !617, line: 210, type: !717, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !722, file: !622, line: 130)
!722 = !DISubprogram(name: "getenv", scope: !617, file: !617, line: 162, type: !723, flags: DIFlagPrototyped, spFlags: 0)
!723 = !DISubroutineType(types: !724)
!724 = !{!338, !295}
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !726, file: !622, line: 131)
!726 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !617, file: !617, line: 203, type: !641, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !728, file: !622, line: 132)
!728 = !DISubprogram(name: "bsearch", scope: !617, file: !617, line: 156, type: !729, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DISubroutineType(types: !730)
!730 = !{!358, !731, !731, !409, !409, !733}
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64)
!732 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !734, size: 64)
!734 = !DISubroutineType(types: !735)
!735 = !{!16, !731, !731}
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !737, file: !622, line: 133)
!737 = !DISubprogram(name: "qsort", scope: !617, file: !617, line: 175, type: !738, flags: DIFlagPrototyped, spFlags: 0)
!738 = !DISubroutineType(types: !739)
!739 = !{null, !358, !409, !409, !733}
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !741, file: !622, line: 134)
!741 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !742, file: !742, line: 123, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!742 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!743 = !DISubroutineType(types: !744)
!744 = !{!210, !210}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !746, file: !622, line: 135)
!746 = !DISubprogram(name: "labs", scope: !617, file: !617, line: 163, type: !747, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DISubroutineType(types: !748)
!748 = !{!196, !196}
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !750, file: !622, line: 136)
!750 = !DISubprogram(name: "llabs", scope: !617, file: !617, line: 167, type: !751, flags: DIFlagPrototyped, spFlags: 0)
!751 = !DISubroutineType(types: !752)
!752 = !{!142, !142}
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !754, file: !622, line: 137)
!754 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !742, file: !742, line: 143, type: !755, flags: DIFlagPrototyped, spFlags: 0)
!755 = !DISubroutineType(types: !756)
!756 = !{!630, !142, !142}
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !758, file: !622, line: 138)
!758 = !DISubprogram(name: "ldiv", scope: !617, file: !617, line: 164, type: !759, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DISubroutineType(types: !760)
!760 = !{!624, !196, !196}
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !762, file: !622, line: 139)
!762 = !DISubprogram(name: "lldiv", scope: !617, file: !617, line: 168, type: !755, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !764, file: !622, line: 140)
!764 = !DISubprogram(name: "mblen", scope: !617, file: !617, line: 171, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!16, !295, !409}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !768, file: !622, line: 142)
!768 = !DISubprogram(name: "mbtowc", scope: !617, file: !617, line: 173, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DISubroutineType(types: !770)
!770 = !{!16, !408, !295, !409}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !772, file: !622, line: 143)
!772 = !DISubprogram(name: "wctomb", scope: !617, file: !617, line: 207, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DISubroutineType(types: !774)
!774 = !{!16, !338, !401}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !776, file: !622, line: 144)
!776 = !DISubprogram(name: "mbstowcs", scope: !617, file: !617, line: 172, type: !777, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DISubroutineType(types: !778)
!778 = !{!409, !408, !295, !409}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !780, file: !622, line: 145)
!780 = !DISubprogram(name: "wcstombs", scope: !617, file: !617, line: 206, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DISubroutineType(types: !782)
!782 = !{!409, !338, !399, !409}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !784, file: !622, line: 148)
!784 = !DISubprogram(name: "at_quick_exit", scope: !617, file: !617, line: 147, type: !712, flags: DIFlagPrototyped, spFlags: 0)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !786, file: !622, line: 149)
!786 = !DISubprogram(name: "quick_exit", scope: !617, file: !617, line: 179, type: !717, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !311, file: !788, line: 25)
!788 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !790, file: !796, line: 422)
!790 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !792, file: !791, line: 79, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!792 = !DINamespace(name: "__math", scope: !128)
!793 = !DISubroutineType(types: !794)
!794 = !{!795, !210}
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
!807 = !{!210, !210, !808}
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !790, file: !810, line: 352)
!810 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !798, file: !810, line: 353)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !800, file: !810, line: 354)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !802, file: !810, line: 355)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !815, file: !810, line: 364)
!815 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !816, line: 50, baseType: !470)
!816 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !818, file: !810, line: 365)
!818 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !816, line: 51, baseType: !464)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !741, file: !810, line: 367)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !821, file: !810, line: 370)
!821 = !DISubprogram(name: "acosf", scope: !816, file: !816, line: 314, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!822 = !DISubroutineType(types: !823)
!823 = !{!470, !470}
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !825, file: !810, line: 372)
!825 = !DISubprogram(name: "asinf", scope: !816, file: !816, line: 318, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !827, file: !810, line: 374)
!827 = !DISubprogram(name: "atanf", scope: !816, file: !816, line: 322, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !829, file: !810, line: 376)
!829 = !DISubprogram(name: "atan2f", scope: !816, file: !816, line: 326, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DISubroutineType(types: !831)
!831 = !{!470, !470, !470}
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !833, file: !810, line: 378)
!833 = !DISubprogram(name: "ceilf", scope: !816, file: !816, line: 461, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !835, file: !810, line: 380)
!835 = !DISubprogram(name: "cosf", scope: !816, file: !816, line: 330, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !837, file: !810, line: 382)
!837 = !DISubprogram(name: "coshf", scope: !816, file: !816, line: 354, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !839, file: !810, line: 385)
!839 = !DISubprogram(name: "expf", scope: !816, file: !816, line: 366, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !841, file: !810, line: 388)
!841 = !DISubprogram(name: "fabsf", scope: !816, file: !816, line: 422, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !843, file: !810, line: 390)
!843 = !DISubprogram(name: "floorf", scope: !816, file: !816, line: 465, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !845, file: !810, line: 393)
!845 = !DISubprogram(name: "fmodf", scope: !816, file: !816, line: 505, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !847, file: !810, line: 396)
!847 = !DISubprogram(name: "frexpf", scope: !816, file: !816, line: 406, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DISubroutineType(types: !849)
!849 = !{!470, !470, !850}
!850 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !852, file: !810, line: 398)
!852 = !DISubprogram(name: "ldexpf", scope: !816, file: !816, line: 402, type: !853, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DISubroutineType(types: !854)
!854 = !{!470, !470, !16}
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !856, file: !810, line: 401)
!856 = !DISubprogram(name: "logf", scope: !816, file: !816, line: 378, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !858, file: !810, line: 404)
!858 = !DISubprogram(name: "log10f", scope: !816, file: !816, line: 382, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !804, file: !810, line: 405)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !861, file: !810, line: 406)
!861 = !DISubprogram(name: "modff", scope: !816, file: !816, line: 398, type: !862, flags: DIFlagPrototyped, spFlags: 0)
!862 = !DISubroutineType(types: !863)
!863 = !{!470, !470, !864}
!864 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !866, file: !810, line: 409)
!866 = !DISubprogram(name: "powf", scope: !816, file: !816, line: 434, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !868, file: !810, line: 412)
!868 = !DISubprogram(name: "sinf", scope: !816, file: !816, line: 334, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !870, file: !810, line: 414)
!870 = !DISubprogram(name: "sinhf", scope: !816, file: !816, line: 358, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !872, file: !810, line: 417)
!872 = !DISubprogram(name: "sqrtf", scope: !816, file: !816, line: 438, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !874, file: !810, line: 419)
!874 = !DISubprogram(name: "tanf", scope: !816, file: !816, line: 338, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !876, file: !810, line: 422)
!876 = !DISubprogram(name: "tanhf", scope: !816, file: !816, line: 362, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !878, file: !810, line: 425)
!878 = !DISubprogram(name: "acoshf", scope: !816, file: !816, line: 342, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !880, file: !810, line: 427)
!880 = !DISubprogram(name: "asinhf", scope: !816, file: !816, line: 346, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !882, file: !810, line: 429)
!882 = !DISubprogram(name: "atanhf", scope: !816, file: !816, line: 350, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !884, file: !810, line: 431)
!884 = !DISubprogram(name: "cbrtf", scope: !816, file: !816, line: 426, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !886, file: !810, line: 434)
!886 = !DISubprogram(name: "copysignf", scope: !816, file: !816, line: 517, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !888, file: !810, line: 437)
!888 = !DISubprogram(name: "erff", scope: !816, file: !816, line: 442, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !890, file: !810, line: 439)
!890 = !DISubprogram(name: "erfcf", scope: !816, file: !816, line: 446, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !892, file: !810, line: 441)
!892 = !DISubprogram(name: "exp2f", scope: !816, file: !816, line: 370, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !894, file: !810, line: 443)
!894 = !DISubprogram(name: "expm1f", scope: !816, file: !816, line: 374, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !896, file: !810, line: 445)
!896 = !DISubprogram(name: "fdimf", scope: !816, file: !816, line: 533, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !898, file: !810, line: 446)
!898 = !DISubprogram(name: "fmaf", scope: !816, file: !816, line: 545, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DISubroutineType(types: !900)
!900 = !{!470, !470, !470, !470}
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !902, file: !810, line: 449)
!902 = !DISubprogram(name: "fmaxf", scope: !816, file: !816, line: 537, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !904, file: !810, line: 451)
!904 = !DISubprogram(name: "fminf", scope: !816, file: !816, line: 541, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !906, file: !810, line: 453)
!906 = !DISubprogram(name: "hypotf", scope: !816, file: !816, line: 430, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !908, file: !810, line: 455)
!908 = !DISubprogram(name: "ilogbf", scope: !816, file: !816, line: 410, type: !909, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DISubroutineType(types: !910)
!910 = !{!16, !470}
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !912, file: !810, line: 457)
!912 = !DISubprogram(name: "lgammaf", scope: !816, file: !816, line: 453, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !914, file: !810, line: 459)
!914 = !DISubprogram(name: "llrintf", scope: !816, file: !816, line: 492, type: !915, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DISubroutineType(types: !916)
!916 = !{!142, !470}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !918, file: !810, line: 461)
!918 = !DISubprogram(name: "llroundf", scope: !816, file: !816, line: 496, type: !915, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !920, file: !810, line: 463)
!920 = !DISubprogram(name: "log1pf", scope: !816, file: !816, line: 390, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !922, file: !810, line: 465)
!922 = !DISubprogram(name: "log2f", scope: !816, file: !816, line: 386, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !924, file: !810, line: 467)
!924 = !DISubprogram(name: "logbf", scope: !816, file: !816, line: 394, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !926, file: !810, line: 469)
!926 = !DISubprogram(name: "lrintf", scope: !816, file: !816, line: 477, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DISubroutineType(types: !928)
!928 = !{!196, !470}
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !930, file: !810, line: 471)
!930 = !DISubprogram(name: "lroundf", scope: !816, file: !816, line: 485, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !932, file: !810, line: 473)
!932 = !DISubprogram(name: "nan", scope: !816, file: !816, line: 522, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !934, file: !810, line: 474)
!934 = !DISubprogram(name: "nanf", scope: !816, file: !816, line: 521, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DISubroutineType(types: !936)
!936 = !{!470, !295}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !938, file: !810, line: 477)
!938 = !DISubprogram(name: "nearbyintf", scope: !816, file: !816, line: 469, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !940, file: !810, line: 479)
!940 = !DISubprogram(name: "nextafterf", scope: !816, file: !816, line: 525, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !942, file: !810, line: 481)
!942 = !DISubprogram(name: "nexttowardf", scope: !816, file: !816, line: 530, type: !943, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DISubroutineType(types: !944)
!944 = !{!470, !470, !210}
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !946, file: !810, line: 483)
!946 = !DISubprogram(name: "remainderf", scope: !816, file: !816, line: 509, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !948, file: !810, line: 485)
!948 = !DISubprogram(name: "remquof", scope: !816, file: !816, line: 513, type: !949, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DISubroutineType(types: !950)
!950 = !{!470, !470, !470, !850}
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !952, file: !810, line: 487)
!952 = !DISubprogram(name: "rintf", scope: !816, file: !816, line: 473, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !954, file: !810, line: 489)
!954 = !DISubprogram(name: "roundf", scope: !816, file: !816, line: 481, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !956, file: !810, line: 491)
!956 = !DISubprogram(name: "scalblnf", scope: !816, file: !816, line: 418, type: !957, flags: DIFlagPrototyped, spFlags: 0)
!957 = !DISubroutineType(types: !958)
!958 = !{!470, !470, !196}
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !960, file: !810, line: 493)
!960 = !DISubprogram(name: "scalbnf", scope: !816, file: !816, line: 414, type: !853, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !962, file: !810, line: 495)
!962 = !DISubprogram(name: "tgammaf", scope: !816, file: !816, line: 457, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !964, file: !810, line: 497)
!964 = !DISubprogram(name: "truncf", scope: !816, file: !816, line: 501, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !966, file: !810, line: 499)
!966 = !DISubprogram(name: "acosl", scope: !816, file: !816, line: 316, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !968, file: !810, line: 500)
!968 = !DISubprogram(name: "asinl", scope: !816, file: !816, line: 320, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !970, file: !810, line: 501)
!970 = !DISubprogram(name: "atanl", scope: !816, file: !816, line: 324, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !972, file: !810, line: 502)
!972 = !DISubprogram(name: "atan2l", scope: !816, file: !816, line: 328, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DISubroutineType(types: !974)
!974 = !{!210, !210, !210}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !976, file: !810, line: 503)
!976 = !DISubprogram(name: "ceill", scope: !816, file: !816, line: 463, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !978, file: !810, line: 504)
!978 = !DISubprogram(name: "cosl", scope: !816, file: !816, line: 332, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !980, file: !810, line: 505)
!980 = !DISubprogram(name: "coshl", scope: !816, file: !816, line: 356, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !982, file: !810, line: 506)
!982 = !DISubprogram(name: "expl", scope: !816, file: !816, line: 368, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !984, file: !810, line: 507)
!984 = !DISubprogram(name: "fabsl", scope: !816, file: !816, line: 424, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !986, file: !810, line: 508)
!986 = !DISubprogram(name: "floorl", scope: !816, file: !816, line: 467, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !988, file: !810, line: 509)
!988 = !DISubprogram(name: "fmodl", scope: !816, file: !816, line: 507, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !990, file: !810, line: 510)
!990 = !DISubprogram(name: "frexpl", scope: !816, file: !816, line: 408, type: !991, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DISubroutineType(types: !992)
!992 = !{!210, !210, !850}
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !994, file: !810, line: 511)
!994 = !DISubprogram(name: "ldexpl", scope: !816, file: !816, line: 404, type: !995, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DISubroutineType(types: !996)
!996 = !{!210, !210, !16}
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !998, file: !810, line: 512)
!998 = !DISubprogram(name: "logl", scope: !816, file: !816, line: 380, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1000, file: !810, line: 513)
!1000 = !DISubprogram(name: "log10l", scope: !816, file: !816, line: 384, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1002, file: !810, line: 514)
!1002 = !DISubprogram(name: "modfl", scope: !816, file: !816, line: 400, type: !806, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1004, file: !810, line: 515)
!1004 = !DISubprogram(name: "powl", scope: !816, file: !816, line: 436, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1006, file: !810, line: 516)
!1006 = !DISubprogram(name: "sinl", scope: !816, file: !816, line: 336, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1008, file: !810, line: 517)
!1008 = !DISubprogram(name: "sinhl", scope: !816, file: !816, line: 360, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1010, file: !810, line: 518)
!1010 = !DISubprogram(name: "sqrtl", scope: !816, file: !816, line: 440, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1012, file: !810, line: 519)
!1012 = !DISubprogram(name: "tanl", scope: !816, file: !816, line: 340, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1014, file: !810, line: 521)
!1014 = !DISubprogram(name: "tanhl", scope: !816, file: !816, line: 364, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1016, file: !810, line: 522)
!1016 = !DISubprogram(name: "acoshl", scope: !816, file: !816, line: 344, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1018, file: !810, line: 523)
!1018 = !DISubprogram(name: "asinhl", scope: !816, file: !816, line: 348, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1020, file: !810, line: 524)
!1020 = !DISubprogram(name: "atanhl", scope: !816, file: !816, line: 352, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1022, file: !810, line: 525)
!1022 = !DISubprogram(name: "cbrtl", scope: !816, file: !816, line: 428, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1024, file: !810, line: 527)
!1024 = !DISubprogram(name: "copysignl", scope: !816, file: !816, line: 519, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1026, file: !810, line: 529)
!1026 = !DISubprogram(name: "erfl", scope: !816, file: !816, line: 444, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1028, file: !810, line: 530)
!1028 = !DISubprogram(name: "erfcl", scope: !816, file: !816, line: 448, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1030, file: !810, line: 531)
!1030 = !DISubprogram(name: "exp2l", scope: !816, file: !816, line: 372, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1032, file: !810, line: 532)
!1032 = !DISubprogram(name: "expm1l", scope: !816, file: !816, line: 376, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1034, file: !810, line: 533)
!1034 = !DISubprogram(name: "fdiml", scope: !816, file: !816, line: 535, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1036, file: !810, line: 534)
!1036 = !DISubprogram(name: "fmal", scope: !816, file: !816, line: 547, type: !1037, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!210, !210, !210, !210}
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1040, file: !810, line: 535)
!1040 = !DISubprogram(name: "fmaxl", scope: !816, file: !816, line: 539, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1042, file: !810, line: 536)
!1042 = !DISubprogram(name: "fminl", scope: !816, file: !816, line: 543, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1044, file: !810, line: 537)
!1044 = !DISubprogram(name: "hypotl", scope: !816, file: !816, line: 432, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1046, file: !810, line: 538)
!1046 = !DISubprogram(name: "ilogbl", scope: !816, file: !816, line: 412, type: !1047, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!16, !210}
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1050, file: !810, line: 539)
!1050 = !DISubprogram(name: "lgammal", scope: !816, file: !816, line: 455, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1052, file: !810, line: 540)
!1052 = !DISubprogram(name: "llrintl", scope: !816, file: !816, line: 494, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!142, !210}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1056, file: !810, line: 541)
!1056 = !DISubprogram(name: "llroundl", scope: !816, file: !816, line: 498, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1058, file: !810, line: 542)
!1058 = !DISubprogram(name: "log1pl", scope: !816, file: !816, line: 392, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1060, file: !810, line: 543)
!1060 = !DISubprogram(name: "log2l", scope: !816, file: !816, line: 388, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1062, file: !810, line: 544)
!1062 = !DISubprogram(name: "logbl", scope: !816, file: !816, line: 396, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1064, file: !810, line: 545)
!1064 = !DISubprogram(name: "lrintl", scope: !816, file: !816, line: 479, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!196, !210}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1068, file: !810, line: 546)
!1068 = !DISubprogram(name: "lroundl", scope: !816, file: !816, line: 487, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1070, file: !810, line: 547)
!1070 = !DISubprogram(name: "nanl", scope: !816, file: !816, line: 523, type: !1071, flags: DIFlagPrototyped, spFlags: 0)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!210, !295}
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1074, file: !810, line: 548)
!1074 = !DISubprogram(name: "nearbyintl", scope: !816, file: !816, line: 471, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1076, file: !810, line: 549)
!1076 = !DISubprogram(name: "nextafterl", scope: !816, file: !816, line: 527, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1078, file: !810, line: 550)
!1078 = !DISubprogram(name: "nexttowardl", scope: !816, file: !816, line: 531, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1080, file: !810, line: 551)
!1080 = !DISubprogram(name: "remainderl", scope: !816, file: !816, line: 511, type: !973, flags: DIFlagPrototyped, spFlags: 0)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1082, file: !810, line: 552)
!1082 = !DISubprogram(name: "remquol", scope: !816, file: !816, line: 515, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!210, !210, !210, !850}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1086, file: !810, line: 553)
!1086 = !DISubprogram(name: "rintl", scope: !816, file: !816, line: 475, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1088, file: !810, line: 554)
!1088 = !DISubprogram(name: "roundl", scope: !816, file: !816, line: 483, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1090, file: !810, line: 555)
!1090 = !DISubprogram(name: "scalblnl", scope: !816, file: !816, line: 420, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!210, !210, !196}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1094, file: !810, line: 556)
!1094 = !DISubprogram(name: "scalbnl", scope: !816, file: !816, line: 416, type: !995, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1096, file: !810, line: 557)
!1096 = !DISubprogram(name: "tgammal", scope: !816, file: !816, line: 459, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1098, file: !810, line: 558)
!1098 = !DISubprogram(name: "truncl", scope: !816, file: !816, line: 503, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1100, file: !1104, line: 82)
!1100 = !DISubprogram(name: "memcpy", scope: !1101, file: !1101, line: 78, type: !1102, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!358, !358, !731, !409}
!1104 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1106, file: !1104, line: 83)
!1106 = !DISubprogram(name: "memmove", scope: !1101, file: !1101, line: 81, type: !1102, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1108, file: !1104, line: 84)
!1108 = !DISubprogram(name: "strcpy", scope: !1101, file: !1101, line: 92, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!338, !338, !295}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1112, file: !1104, line: 85)
!1112 = !DISubprogram(name: "strncpy", scope: !1101, file: !1101, line: 104, type: !1113, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DISubroutineType(types: !1114)
!1114 = !{!338, !338, !295, !409}
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1116, file: !1104, line: 86)
!1116 = !DISubprogram(name: "strcat", scope: !1101, file: !1101, line: 86, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1118, file: !1104, line: 87)
!1118 = !DISubprogram(name: "strncat", scope: !1101, file: !1101, line: 98, type: !1113, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1120, file: !1104, line: 88)
!1120 = !DISubprogram(name: "memcmp", scope: !1101, file: !1101, line: 75, type: !1121, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!16, !731, !731, !409}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1124, file: !1104, line: 89)
!1124 = !DISubprogram(name: "strcmp", scope: !1101, file: !1101, line: 89, type: !1125, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!16, !295, !295}
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1128, file: !1104, line: 90)
!1128 = !DISubprogram(name: "strncmp", scope: !1101, file: !1101, line: 101, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!16, !295, !295, !409}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1132, file: !1104, line: 91)
!1132 = !DISubprogram(name: "strcoll", scope: !1101, file: !1101, line: 90, type: !1125, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1134, file: !1104, line: 92)
!1134 = !DISubprogram(name: "strxfrm", scope: !1101, file: !1101, line: 112, type: !1135, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!409, !338, !295, !409}
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1138, file: !1104, line: 93)
!1138 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !1139, file: !1139, line: 101, type: !1140, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!358, !358, !16, !409}
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1143, file: !1104, line: 94)
!1143 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1139, file: !1139, line: 80, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!338, !338, !16}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1147, file: !1104, line: 95)
!1147 = !DISubprogram(name: "strcspn", scope: !1101, file: !1101, line: 94, type: !1148, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!409, !295, !295}
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1151, file: !1104, line: 96)
!1151 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1139, file: !1139, line: 87, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1153, file: !1104, line: 97)
!1153 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1139, file: !1139, line: 94, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1155, file: !1104, line: 98)
!1155 = !DISubprogram(name: "strspn", scope: !1101, file: !1101, line: 109, type: !1148, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1157, file: !1104, line: 99)
!1157 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1139, file: !1139, line: 108, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1159, file: !1104, line: 100)
!1159 = !DISubprogram(name: "strtok", scope: !1101, file: !1101, line: 111, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1161, file: !1104, line: 101)
!1161 = !DISubprogram(name: "memset", scope: !1101, file: !1101, line: 84, type: !1140, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1163, file: !1104, line: 102)
!1163 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !1101, file: !1101, line: 95, type: !1164, flags: DIFlagPrototyped, spFlags: 0)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!338, !16}
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1167, file: !1104, line: 103)
!1167 = !DISubprogram(name: "strlen", scope: !1101, file: !1101, line: 96, type: !1168, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!409, !295}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1171, entity: !1172, file: !1174, line: 536)
!1171 = !DINamespace(name: "chrono", scope: !128)
!1172 = !DINamespace(name: "chrono_literals", scope: !1173, exportSymbols: true)
!1173 = !DINamespace(name: "literals", scope: !128, exportSymbols: true)
!1174 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1176, file: !1179, line: 68)
!1176 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1177, line: 31, baseType: !1178)
!1177 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1178 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !195, line: 116, baseType: !200)
!1179 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1181, file: !1179, line: 69)
!1181 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1182, line: 31, baseType: !1183)
!1182 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1183 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !195, line: 119, baseType: !196)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !324, file: !1179, line: 70)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1186, file: !1179, line: 74)
!1186 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !325, file: !325, line: 112, type: !1187, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!1176}
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1190, file: !1179, line: 75)
!1190 = !DISubprogram(name: "difftime", scope: !325, file: !325, line: 114, type: !1191, flags: DIFlagPrototyped, spFlags: 0)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!464, !1181, !1181}
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1194, file: !1179, line: 76)
!1194 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !325, file: !325, line: 118, type: !1195, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!1181, !1197}
!1197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1199, file: !1179, line: 77)
!1199 = !DISubprogram(name: "time", scope: !325, file: !325, line: 121, type: !1200, flags: DIFlagPrototyped, spFlags: 0)
!1200 = !DISubroutineType(types: !1201)
!1201 = !{!1181, !1202}
!1202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1181, size: 64)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1204, file: !1179, line: 78)
!1204 = !DISubprogram(name: "asctime", scope: !325, file: !325, line: 111, type: !1205, flags: DIFlagPrototyped, spFlags: 0)
!1205 = !DISubroutineType(types: !1206)
!1206 = !{!338, !558}
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1208, file: !1179, line: 79)
!1208 = !DISubprogram(name: "ctime", scope: !325, file: !325, line: 113, type: !1209, flags: DIFlagPrototyped, spFlags: 0)
!1209 = !DISubroutineType(types: !1210)
!1210 = !{!338, !1211}
!1211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1212, size: 64)
!1212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1181)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1214, file: !1179, line: 80)
!1214 = !DISubprogram(name: "gmtime", scope: !325, file: !325, line: 116, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{!1197, !1211}
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1218, file: !1179, line: 81)
!1218 = !DISubprogram(name: "localtime", scope: !325, file: !325, line: 117, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1220, file: !1179, line: 82)
!1220 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !325, file: !325, line: 119, type: !1221, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DISubroutineType(types: !1222)
!1222 = !{!409, !338, !409, !295, !558}
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !341, file: !1224, line: 120)
!1224 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !371, file: !1224, line: 121)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1227, file: !1224, line: 123)
!1227 = !DISubprogram(name: "fclose", scope: !342, file: !342, line: 233, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!16, !398}
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1231, file: !1224, line: 124)
!1231 = !DISubprogram(name: "fflush", scope: !342, file: !342, line: 236, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1233, file: !1224, line: 125)
!1233 = !DISubprogram(name: "setbuf", scope: !342, file: !342, line: 272, type: !1234, flags: DIFlagPrototyped, spFlags: 0)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{null, !398, !338}
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1237, file: !1224, line: 126)
!1237 = !DISubprogram(name: "setvbuf", scope: !342, file: !342, line: 273, type: !1238, flags: DIFlagPrototyped, spFlags: 0)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!16, !398, !338, !16, !409}
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1241, file: !1224, line: 127)
!1241 = !DISubprogram(name: "fprintf", scope: !342, file: !342, line: 245, type: !1242, flags: DIFlagPrototyped, spFlags: 0)
!1242 = !DISubroutineType(types: !1243)
!1243 = !{!16, !398, !295, null}
!1244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1245, file: !1224, line: 128)
!1245 = !DISubprogram(name: "fscanf", scope: !342, file: !342, line: 251, type: !1242, flags: DIFlagPrototyped, spFlags: 0)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1247, file: !1224, line: 129)
!1247 = !DISubprogram(name: "snprintf", scope: !342, file: !342, line: 435, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1248 = !DISubroutineType(types: !1249)
!1249 = !{!16, !338, !409, !295, null}
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1251, file: !1224, line: 130)
!1251 = !DISubprogram(name: "sprintf", scope: !342, file: !342, line: 280, type: !1252, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!16, !338, !295, null}
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1255, file: !1224, line: 131)
!1255 = !DISubprogram(name: "sscanf", scope: !342, file: !342, line: 282, type: !1256, flags: DIFlagPrototyped, spFlags: 0)
!1256 = !DISubroutineType(types: !1257)
!1257 = !{!16, !295, !295, null}
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1259, file: !1224, line: 132)
!1259 = !DISubprogram(name: "vfprintf", scope: !342, file: !342, line: 292, type: !1260, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!16, !398, !295, !1262}
!1262 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1263, line: 44, baseType: !416)
!1263 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1265, file: !1224, line: 133)
!1265 = !DISubprogram(name: "vfscanf", scope: !342, file: !342, line: 436, type: !1260, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1267, file: !1224, line: 134)
!1267 = !DISubprogram(name: "vsscanf", scope: !342, file: !342, line: 439, type: !1268, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DISubroutineType(types: !1269)
!1269 = !{!16, !295, !295, !1262}
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1271, file: !1224, line: 135)
!1271 = !DISubprogram(name: "vsnprintf", scope: !342, file: !342, line: 438, type: !1272, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DISubroutineType(types: !1273)
!1273 = !{!16, !338, !409, !295, !1262}
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1275, file: !1224, line: 136)
!1275 = !DISubprogram(name: "vsprintf", scope: !342, file: !342, line: 300, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!16, !338, !295, !1262}
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1279, file: !1224, line: 137)
!1279 = !DISubprogram(name: "fgetc", scope: !342, file: !342, line: 237, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1281, file: !1224, line: 138)
!1281 = !DISubprogram(name: "fgets", scope: !342, file: !342, line: 239, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!338, !338, !16, !398}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1285, file: !1224, line: 139)
!1285 = !DISubprogram(name: "fputc", scope: !342, file: !342, line: 246, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!16, !16, !398}
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1289, file: !1224, line: 140)
!1289 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !342, file: !342, line: 247, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!16, !295, !398}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1293, file: !1224, line: 141)
!1293 = !DISubprogram(name: "getc", scope: !342, file: !342, line: 256, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1295, file: !1224, line: 142)
!1295 = !DISubprogram(name: "putc", scope: !342, file: !342, line: 265, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1297, file: !1224, line: 143)
!1297 = !DISubprogram(name: "ungetc", scope: !342, file: !342, line: 291, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1299, file: !1224, line: 144)
!1299 = !DISubprogram(name: "fread", scope: !342, file: !342, line: 248, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!409, !358, !409, !409, !398}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1303, file: !1224, line: 145)
!1303 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !342, file: !342, line: 255, type: !1304, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{!409, !731, !409, !409, !398}
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1307, file: !1224, line: 146)
!1307 = !DISubprogram(name: "fgetpos", scope: !342, file: !342, line: 238, type: !1308, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DISubroutineType(types: !1309)
!1309 = !{!16, !398, !1310}
!1310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1312, file: !1224, line: 147)
!1312 = !DISubprogram(name: "fseek", scope: !342, file: !342, line: 252, type: !1313, flags: DIFlagPrototyped, spFlags: 0)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!16, !398, !196, !16}
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1316, file: !1224, line: 148)
!1316 = !DISubprogram(name: "fsetpos", scope: !342, file: !342, line: 253, type: !1317, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DISubroutineType(types: !1318)
!1318 = !{!16, !398, !1319}
!1319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1320, size: 64)
!1320 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !371)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1322, file: !1224, line: 149)
!1322 = !DISubprogram(name: "ftell", scope: !342, file: !342, line: 254, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!196, !398}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1326, file: !1224, line: 150)
!1326 = !DISubprogram(name: "rewind", scope: !342, file: !342, line: 270, type: !1327, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DISubroutineType(types: !1328)
!1328 = !{null, !398}
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1330, file: !1224, line: 151)
!1330 = !DISubprogram(name: "clearerr", scope: !342, file: !342, line: 232, type: !1327, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1332, file: !1224, line: 152)
!1332 = !DISubprogram(name: "feof", scope: !342, file: !342, line: 234, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1334, file: !1224, line: 153)
!1334 = !DISubprogram(name: "ferror", scope: !342, file: !342, line: 235, type: !1228, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1336, file: !1224, line: 154)
!1336 = !DISubprogram(name: "perror", scope: !342, file: !342, line: 264, type: !1337, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{null, !295}
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1340, file: !1224, line: 156)
!1340 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !342, file: !342, line: 243, type: !1341, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DISubroutineType(types: !1342)
!1342 = !{!398, !295, !295}
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1344, file: !1224, line: 157)
!1344 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !342, file: !342, line: 249, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!398, !295, !295, !398}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1348, file: !1224, line: 158)
!1348 = !DISubprogram(name: "remove", scope: !342, file: !342, line: 268, type: !641, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1350, file: !1224, line: 159)
!1350 = !DISubprogram(name: "rename", scope: !342, file: !342, line: 269, type: !1125, flags: DIFlagPrototyped, spFlags: 0)
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1352, file: !1224, line: 160)
!1352 = !DISubprogram(name: "tmpfile", scope: !342, file: !342, line: 283, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!398}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1356, file: !1224, line: 161)
!1356 = !DISubprogram(name: "tmpnam", scope: !342, file: !342, line: 289, type: !1357, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!338, !338}
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1360, file: !1224, line: 163)
!1360 = !DISubprogram(name: "getchar", scope: !342, file: !342, line: 257, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1362, file: !1224, line: 167)
!1362 = !DISubprogram(name: "scanf", scope: !342, file: !342, line: 271, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{!16, !295, null}
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1366, file: !1224, line: 168)
!1366 = !DISubprogram(name: "vscanf", scope: !342, file: !342, line: 437, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!16, !295, !1262}
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1370, file: !1224, line: 170)
!1370 = !DISubprogram(name: "printf", scope: !1371, file: !1371, line: 34, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1371 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1373, file: !1224, line: 171)
!1373 = !DISubprogram(name: "putchar", scope: !342, file: !342, line: 266, type: !215, flags: DIFlagPrototyped, spFlags: 0)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1375, file: !1224, line: 172)
!1375 = !DISubprogram(name: "puts", scope: !342, file: !342, line: 267, type: !641, flags: DIFlagPrototyped, spFlags: 0)
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1377, file: !1224, line: 173)
!1377 = !DISubprogram(name: "vprintf", scope: !342, file: !342, line: 293, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1379, file: !1406, line: 52)
!1379 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1380, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1381, identifier: "_ZTS5lconv")
!1380 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1381 = !{!1382, !1383, !1384, !1385, !1386, !1387, !1388, !1389, !1390, !1391, !1392, !1393, !1394, !1395, !1396, !1397, !1398, !1399, !1400, !1401, !1402, !1403, !1404, !1405}
!1382 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1379, file: !1380, line: 47, baseType: !338, size: 64)
!1383 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1379, file: !1380, line: 48, baseType: !338, size: 64, offset: 64)
!1384 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1379, file: !1380, line: 49, baseType: !338, size: 64, offset: 128)
!1385 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1379, file: !1380, line: 50, baseType: !338, size: 64, offset: 192)
!1386 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1379, file: !1380, line: 51, baseType: !338, size: 64, offset: 256)
!1387 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1379, file: !1380, line: 52, baseType: !338, size: 64, offset: 320)
!1388 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1379, file: !1380, line: 53, baseType: !338, size: 64, offset: 384)
!1389 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1379, file: !1380, line: 54, baseType: !338, size: 64, offset: 448)
!1390 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1379, file: !1380, line: 55, baseType: !338, size: 64, offset: 512)
!1391 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1379, file: !1380, line: 56, baseType: !338, size: 64, offset: 576)
!1392 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1379, file: !1380, line: 57, baseType: !30, size: 8, offset: 640)
!1393 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1379, file: !1380, line: 58, baseType: !30, size: 8, offset: 648)
!1394 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1379, file: !1380, line: 59, baseType: !30, size: 8, offset: 656)
!1395 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1379, file: !1380, line: 60, baseType: !30, size: 8, offset: 664)
!1396 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1379, file: !1380, line: 61, baseType: !30, size: 8, offset: 672)
!1397 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1379, file: !1380, line: 62, baseType: !30, size: 8, offset: 680)
!1398 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1379, file: !1380, line: 63, baseType: !30, size: 8, offset: 688)
!1399 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1379, file: !1380, line: 64, baseType: !30, size: 8, offset: 696)
!1400 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1379, file: !1380, line: 65, baseType: !30, size: 8, offset: 704)
!1401 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1379, file: !1380, line: 66, baseType: !30, size: 8, offset: 712)
!1402 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1379, file: !1380, line: 67, baseType: !30, size: 8, offset: 720)
!1403 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1379, file: !1380, line: 68, baseType: !30, size: 8, offset: 728)
!1404 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1379, file: !1380, line: 69, baseType: !30, size: 8, offset: 736)
!1405 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1379, file: !1380, line: 70, baseType: !30, size: 8, offset: 744)
!1406 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1408, file: !1406, line: 53)
!1408 = !DISubprogram(name: "setlocale", scope: !1409, file: !1409, line: 56, type: !1410, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1410 = !DISubroutineType(types: !1411)
!1411 = !{!338, !16, !295}
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1413, file: !1406, line: 54)
!1413 = !DISubprogram(name: "localeconv", scope: !1380, file: !1380, line: 99, type: !1414, flags: DIFlagPrototyped, spFlags: 0)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!1416}
!1416 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1379, size: 64)
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !128, entity: !1262, file: !1418, line: 53)
!1418 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1419 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1420 = !{i32 7, !"Dwarf Version", i32 5}
!1421 = !{i32 2, !"Debug Info Version", i32 3}
!1422 = !{i32 1, !"wchar_size", i32 4}
!1423 = !{i32 8, !"PIC Level", i32 2}
!1424 = !{i32 7, !"uwtable", i32 1}
!1425 = !{i32 7, !"frame-pointer", i32 1}
!1426 = !{!"Homebrew clang version 20.1.8"}
!1427 = distinct !DISubprogram(name: "do_powerup_frame", linkageName: "_Z16do_powerup_frameP6object", scope: !9, file: !9, line: 56, type: !1428, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{null, !1430}
!1430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1431, size: 64)
!1431 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !1432, line: 259, baseType: !1433)
!1432 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!1433 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !1432, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !1434, identifier: "_ZTS6object")
!1434 = !{!1435, !1436, !1437, !1438, !1439, !1440, !1441, !1442, !1443, !1444, !1445, !1446, !1454, !1461, !1462, !1463, !1464, !1465, !1466, !1467, !1468, !1469, !1487, !1539}
!1435 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !1433, file: !1432, line: 212, baseType: !16, size: 32)
!1436 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1433, file: !1432, line: 213, baseType: !144, size: 8, offset: 32)
!1437 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !1433, file: !1432, line: 214, baseType: !144, size: 8, offset: 40)
!1438 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !1433, file: !1432, line: 215, baseType: !137, size: 16, offset: 48)
!1439 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !1433, file: !1432, line: 215, baseType: !137, size: 16, offset: 64)
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !1433, file: !1432, line: 216, baseType: !144, size: 8, offset: 80)
!1441 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !1433, file: !1432, line: 217, baseType: !144, size: 8, offset: 88)
!1442 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !1433, file: !1432, line: 218, baseType: !144, size: 8, offset: 96)
!1443 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1433, file: !1432, line: 219, baseType: !144, size: 8, offset: 104)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1433, file: !1432, line: 220, baseType: !137, size: 16, offset: 112)
!1445 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !1433, file: !1432, line: 221, baseType: !137, size: 16, offset: 128)
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1433, file: !1432, line: 222, baseType: !1447, size: 96, offset: 160)
!1447 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !1448, line: 22, baseType: !1449)
!1448 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!1449 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !1448, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !1450, identifier: "_ZTS10vms_vector")
!1450 = !{!1451, !1452, !1453}
!1451 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1449, file: !1448, line: 21, baseType: !19, size: 32)
!1452 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1449, file: !1448, line: 21, baseType: !19, size: 32, offset: 32)
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1449, file: !1448, line: 21, baseType: !19, size: 32, offset: 64)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !1433, file: !1432, line: 223, baseType: !1455, size: 288, offset: 256)
!1455 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !1448, line: 47, baseType: !1456)
!1456 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !1448, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !1457, identifier: "_ZTS10vms_matrix")
!1457 = !{!1458, !1459, !1460}
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !1456, file: !1448, line: 46, baseType: !1447, size: 96)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !1456, file: !1448, line: 46, baseType: !1447, size: 96, offset: 96)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !1456, file: !1448, line: 46, baseType: !1447, size: 96, offset: 192)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1433, file: !1432, line: 224, baseType: !19, size: 32, offset: 544)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !1433, file: !1432, line: 225, baseType: !19, size: 32, offset: 576)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !1433, file: !1432, line: 226, baseType: !1447, size: 96, offset: 608)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !1433, file: !1432, line: 227, baseType: !130, size: 8, offset: 704)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !1433, file: !1432, line: 228, baseType: !130, size: 8, offset: 712)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !1433, file: !1432, line: 229, baseType: !130, size: 8, offset: 720)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !1433, file: !1432, line: 230, baseType: !130, size: 8, offset: 728)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !1433, file: !1432, line: 231, baseType: !19, size: 32, offset: 736)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !1433, file: !1432, line: 240, baseType: !1470, size: 512, offset: 768)
!1470 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1433, file: !1432, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !1471, identifier: "_ZTSN6objectUt_E")
!1471 = !{!1472, !1486}
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !1470, file: !1432, line: 238, baseType: !1473, size: 512)
!1473 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !1432, line: 153, baseType: !1474)
!1474 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !1432, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !1475, identifier: "_ZTS12physics_info")
!1475 = !{!1476, !1477, !1478, !1479, !1480, !1481, !1482, !1483, !1485}
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !1474, file: !1432, line: 144, baseType: !1447, size: 96)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !1474, file: !1432, line: 145, baseType: !1447, size: 96, offset: 96)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !1474, file: !1432, line: 146, baseType: !19, size: 32, offset: 192)
!1479 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !1474, file: !1432, line: 147, baseType: !19, size: 32, offset: 224)
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !1474, file: !1432, line: 148, baseType: !19, size: 32, offset: 256)
!1481 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !1474, file: !1432, line: 149, baseType: !1447, size: 96, offset: 288)
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !1474, file: !1432, line: 150, baseType: !1447, size: 96, offset: 384)
!1483 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !1474, file: !1432, line: 151, baseType: !1484, size: 16, offset: 480)
!1484 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !20, line: 21, baseType: !137)
!1485 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1474, file: !1432, line: 152, baseType: !148, size: 16, offset: 496)
!1486 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !1470, file: !1432, line: 239, baseType: !1447, size: 96)
!1487 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !1433, file: !1432, line: 250, baseType: !1488, size: 256, offset: 1280)
!1488 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1433, file: !1432, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !1489, identifier: "_ZTSN6objectUt0_E")
!1489 = !{!1490, !1501, !1511, !1527, !1532}
!1490 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !1488, file: !1432, line: 245, baseType: !1491, size: 160)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !1432, line: 166, baseType: !1492)
!1492 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !1432, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !1493, identifier: "_ZTS12laser_info_s")
!1493 = !{!1494, !1495, !1496, !1497, !1498, !1499, !1500}
!1494 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !1492, file: !1432, line: 159, baseType: !137, size: 16)
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !1492, file: !1432, line: 160, baseType: !137, size: 16, offset: 16)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !1492, file: !1432, line: 161, baseType: !16, size: 32, offset: 32)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1492, file: !1432, line: 162, baseType: !19, size: 32, offset: 64)
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !1492, file: !1432, line: 163, baseType: !137, size: 16, offset: 96)
!1499 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !1492, file: !1432, line: 164, baseType: !137, size: 16, offset: 112)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !1492, file: !1432, line: 165, baseType: !19, size: 32, offset: 128)
!1501 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !1488, file: !1432, line: 246, baseType: !1502, size: 128)
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !1432, line: 176, baseType: !1503)
!1503 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !1432, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !1504, identifier: "_ZTS14explosion_info")
!1504 = !{!1505, !1506, !1507, !1508, !1509, !1510}
!1505 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !1503, file: !1432, line: 170, baseType: !19, size: 32)
!1506 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !1503, file: !1432, line: 171, baseType: !19, size: 32, offset: 32)
!1507 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !1503, file: !1432, line: 172, baseType: !137, size: 16, offset: 64)
!1508 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !1503, file: !1432, line: 173, baseType: !137, size: 16, offset: 80)
!1509 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !1503, file: !1432, line: 174, baseType: !137, size: 16, offset: 96)
!1510 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !1503, file: !1432, line: 175, baseType: !137, size: 16, offset: 112)
!1511 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !1488, file: !1432, line: 247, baseType: !1512, size: 256)
!1512 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !1513, line: 144, baseType: !1514)
!1513 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!1514 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !1513, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !1515, identifier: "_ZTS9ai_static")
!1515 = !{!1516, !1517, !1519, !1520, !1521, !1522, !1523, !1524, !1525, !1526}
!1516 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !1514, file: !1513, line: 128, baseType: !144, size: 8)
!1517 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1514, file: !1513, line: 129, baseType: !1518, size: 88, offset: 8)
!1518 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 88, elements: !97)
!1519 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !1514, file: !1513, line: 130, baseType: !137, size: 16, offset: 96)
!1520 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !1514, file: !1513, line: 131, baseType: !137, size: 16, offset: 112)
!1521 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !1514, file: !1513, line: 132, baseType: !137, size: 16, offset: 128)
!1522 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !1514, file: !1513, line: 133, baseType: !130, size: 8, offset: 144)
!1523 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !1514, file: !1513, line: 134, baseType: !130, size: 8, offset: 152)
!1524 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !1514, file: !1513, line: 139, baseType: !137, size: 16, offset: 160)
!1525 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !1514, file: !1513, line: 140, baseType: !16, size: 32, offset: 192)
!1526 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !1514, file: !1513, line: 141, baseType: !19, size: 32, offset: 224)
!1527 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !1488, file: !1432, line: 248, baseType: !1528, size: 32)
!1528 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !1432, line: 181, baseType: !1529)
!1529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !1432, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !1530, identifier: "_ZTS12light_info_s")
!1530 = !{!1531}
!1531 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !1529, file: !1432, line: 180, baseType: !19, size: 32)
!1532 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !1488, file: !1432, line: 249, baseType: !1533, size: 96)
!1533 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !1432, line: 190, baseType: !1534)
!1534 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !1432, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !1535, identifier: "_ZTS14powerup_info_s")
!1535 = !{!1536, !1537, !1538}
!1536 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !1534, file: !1432, line: 187, baseType: !16, size: 32)
!1537 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1534, file: !1432, line: 188, baseType: !19, size: 32, offset: 32)
!1538 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1534, file: !1432, line: 189, baseType: !16, size: 32, offset: 64)
!1539 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !1433, file: !1432, line: 257, baseType: !1540, size: 608, offset: 1536)
!1540 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1433, file: !1432, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !1541, identifier: "_ZTSN6objectUt1_E")
!1541 = !{!1542, !1558}
!1542 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !1540, file: !1432, line: 255, baseType: !1543, size: 608)
!1543 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !1432, line: 208, baseType: !1544)
!1544 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !1432, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !1545, identifier: "_ZTS12polyobj_info")
!1545 = !{!1546, !1547, !1555, !1556, !1557}
!1546 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !1544, file: !1432, line: 203, baseType: !16, size: 32)
!1547 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !1544, file: !1432, line: 204, baseType: !1548, size: 480, offset: 32)
!1548 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1549, size: 480, elements: !46)
!1549 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !1448, line: 40, baseType: !1550)
!1550 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !1448, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !1551, identifier: "_ZTS10vms_angvec")
!1551 = !{!1552, !1553, !1554}
!1552 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1550, file: !1448, line: 39, baseType: !1484, size: 16)
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !1550, file: !1448, line: 39, baseType: !1484, size: 16, offset: 16)
!1554 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !1550, file: !1448, line: 39, baseType: !1484, size: 16, offset: 32)
!1555 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !1544, file: !1432, line: 205, baseType: !16, size: 32, offset: 512)
!1556 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !1544, file: !1432, line: 206, baseType: !16, size: 32, offset: 544)
!1557 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !1544, file: !1432, line: 207, baseType: !16, size: 32, offset: 576)
!1558 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !1540, file: !1432, line: 256, baseType: !1559, size: 96)
!1559 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !1432, line: 197, baseType: !1560)
!1560 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !1432, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !1561, identifier: "_ZTS12vclip_info_s")
!1561 = !{!1562, !1563, !1564}
!1562 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !1560, file: !1432, line: 194, baseType: !16, size: 32)
!1563 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !1560, file: !1432, line: 195, baseType: !19, size: 32, offset: 32)
!1564 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !1560, file: !1432, line: 196, baseType: !130, size: 8, offset: 64)
!1565 = !{}
!1566 = !DILocalVariable(name: "obj", arg: 1, scope: !1427, file: !9, line: 56, type: !1430)
!1567 = !DILocation(line: 56, column: 31, scope: !1427)
!1568 = !DILocalVariable(name: "fudge", scope: !1427, file: !9, line: 58, type: !19)
!1569 = !DILocation(line: 58, column: 6, scope: !1427)
!1570 = !DILocalVariable(name: "vci", scope: !1427, file: !9, line: 59, type: !1571)
!1571 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1559, size: 64)
!1572 = !DILocation(line: 59, column: 16, scope: !1427)
!1573 = !DILocation(line: 59, column: 23, scope: !1427)
!1574 = !DILocation(line: 59, column: 28, scope: !1427)
!1575 = !DILocalVariable(name: "vc", scope: !1427, file: !9, line: 60, type: !1576)
!1576 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1577, size: 64)
!1577 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip", file: !1578, line: 45, baseType: !1579)
!1578 = !DIFile(filename: "main_d2/vclip.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "56f7fb862081e56816e9555a5e64040f")
!1579 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1578, line: 36, size: 672, flags: DIFlagTypePassByValue, elements: !1580, identifier: "_ZTS5vclip")
!1580 = !{!1581, !1582, !1583, !1584, !1585, !1586, !1593}
!1581 = !DIDerivedType(tag: DW_TAG_member, name: "play_time", scope: !1579, file: !1578, line: 38, baseType: !19, size: 32)
!1582 = !DIDerivedType(tag: DW_TAG_member, name: "num_frames", scope: !1579, file: !1578, line: 39, baseType: !16, size: 32, offset: 32)
!1583 = !DIDerivedType(tag: DW_TAG_member, name: "frame_time", scope: !1579, file: !1578, line: 40, baseType: !19, size: 32, offset: 64)
!1584 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1579, file: !1578, line: 41, baseType: !16, size: 32, offset: 96)
!1585 = !DIDerivedType(tag: DW_TAG_member, name: "sound_num", scope: !1579, file: !1578, line: 42, baseType: !137, size: 16, offset: 128)
!1586 = !DIDerivedType(tag: DW_TAG_member, name: "frames", scope: !1579, file: !1578, line: 43, baseType: !1587, size: 480, offset: 144)
!1587 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1588, size: 480, elements: !90)
!1588 = !DIDerivedType(tag: DW_TAG_typedef, name: "bitmap_index", file: !1589, line: 40, baseType: !1590)
!1589 = !DIFile(filename: "./main_shared/piggy.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "5d74a9a5fcd56b04e1df3c49c8d4c571")
!1590 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bitmap_index", file: !1589, line: 37, size: 16, flags: DIFlagTypePassByValue, elements: !1591, identifier: "_ZTS12bitmap_index")
!1591 = !{!1592}
!1592 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !1590, file: !1589, line: 39, baseType: !148, size: 16)
!1593 = !DIDerivedType(tag: DW_TAG_member, name: "light_value", scope: !1579, file: !1578, line: 44, baseType: !19, size: 32, offset: 640)
!1594 = !DILocation(line: 60, column: 9, scope: !1427)
!1595 = !DILocation(line: 60, column: 21, scope: !1427)
!1596 = !DILocation(line: 60, column: 26, scope: !1427)
!1597 = !DILocation(line: 60, column: 15, scope: !1427)
!1598 = !DILocation(line: 62, column: 11, scope: !1427)
!1599 = !DILocation(line: 62, column: 25, scope: !1427)
!1600 = !DILocation(line: 62, column: 29, scope: !1427)
!1601 = !DILocation(line: 62, column: 40, scope: !1427)
!1602 = !DILocation(line: 62, column: 21, scope: !1427)
!1603 = !DILocation(line: 62, column: 46, scope: !1427)
!1604 = !DILocation(line: 62, column: 10, scope: !1427)
!1605 = !DILocation(line: 62, column: 8, scope: !1427)
!1606 = !DILocation(line: 64, column: 20, scope: !1427)
!1607 = !DILocation(line: 64, column: 32, scope: !1427)
!1608 = !DILocation(line: 64, column: 30, scope: !1427)
!1609 = !DILocation(line: 64, column: 2, scope: !1427)
!1610 = !DILocation(line: 64, column: 7, scope: !1427)
!1611 = !DILocation(line: 64, column: 17, scope: !1427)
!1612 = !DILocation(line: 66, column: 2, scope: !1427)
!1613 = !DILocation(line: 66, column: 9, scope: !1427)
!1614 = !DILocation(line: 66, column: 14, scope: !1427)
!1615 = !DILocation(line: 66, column: 24, scope: !1427)
!1616 = !DILocation(line: 68, column: 21, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1427, file: !9, line: 67, column: 2)
!1618 = !DILocation(line: 68, column: 25, scope: !1617)
!1619 = !DILocation(line: 68, column: 3, scope: !1617)
!1620 = !DILocation(line: 68, column: 8, scope: !1617)
!1621 = !DILocation(line: 68, column: 18, scope: !1617)
!1622 = !DILocation(line: 70, column: 8, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1617, file: !9, line: 70, column: 7)
!1624 = !DILocation(line: 70, column: 12, scope: !1623)
!1625 = !DILocation(line: 70, column: 23, scope: !1623)
!1626 = !DILocation(line: 70, column: 7, scope: !1623)
!1627 = !DILocation(line: 71, column: 4, scope: !1623)
!1628 = !DILocation(line: 71, column: 9, scope: !1623)
!1629 = !DILocation(line: 71, column: 17, scope: !1623)
!1630 = !DILocation(line: 73, column: 4, scope: !1623)
!1631 = !DILocation(line: 73, column: 9, scope: !1623)
!1632 = !DILocation(line: 73, column: 17, scope: !1623)
!1633 = !DILocation(line: 75, column: 7, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1617, file: !9, line: 75, column: 7)
!1635 = !DILocation(line: 75, column: 12, scope: !1634)
!1636 = !DILocation(line: 75, column: 24, scope: !1634)
!1637 = !DILocation(line: 75, column: 28, scope: !1634)
!1638 = !DILocation(line: 75, column: 21, scope: !1634)
!1639 = !DILocation(line: 76, column: 4, scope: !1634)
!1640 = !DILocation(line: 76, column: 9, scope: !1634)
!1641 = !DILocation(line: 76, column: 18, scope: !1634)
!1642 = !DILocation(line: 78, column: 7, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1617, file: !9, line: 78, column: 7)
!1644 = !DILocation(line: 78, column: 12, scope: !1643)
!1645 = !DILocation(line: 78, column: 21, scope: !1643)
!1646 = !DILocation(line: 79, column: 20, scope: !1643)
!1647 = !DILocation(line: 79, column: 24, scope: !1643)
!1648 = !DILocation(line: 79, column: 35, scope: !1643)
!1649 = !DILocation(line: 79, column: 4, scope: !1643)
!1650 = !DILocation(line: 79, column: 9, scope: !1643)
!1651 = !DILocation(line: 79, column: 18, scope: !1643)
!1652 = distinct !{!1652, !1612, !1653, !1654}
!1653 = !DILocation(line: 80, column: 2, scope: !1427)
!1654 = !{!"llvm.loop.mustprogress"}
!1655 = !DILocation(line: 82, column: 6, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1427, file: !9, line: 82, column: 6)
!1657 = !DILocation(line: 82, column: 11, scope: !1656)
!1658 = !DILocation(line: 82, column: 20, scope: !1656)
!1659 = !DILocation(line: 84, column: 27, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1656, file: !9, line: 83, column: 2)
!1661 = !DILocation(line: 84, column: 32, scope: !1660)
!1662 = !DILocation(line: 84, column: 41, scope: !1660)
!1663 = !DILocation(line: 84, column: 46, scope: !1660)
!1664 = !DILocation(line: 84, column: 3, scope: !1660)
!1665 = !DILocation(line: 86, column: 42, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1660, file: !9, line: 86, column: 7)
!1667 = !DILocation(line: 86, column: 7, scope: !1666)
!1668 = !DILocation(line: 86, column: 52, scope: !1666)
!1669 = !DILocation(line: 87, column: 65, scope: !1666)
!1670 = !DILocation(line: 87, column: 30, scope: !1666)
!1671 = !DILocation(line: 87, column: 76, scope: !1666)
!1672 = !DILocation(line: 87, column: 80, scope: !1666)
!1673 = !DILocation(line: 87, column: 4, scope: !1666)
!1674 = !DILocation(line: 88, column: 2, scope: !1660)
!1675 = !DILocation(line: 89, column: 1, scope: !1427)
!1676 = distinct !DISubprogram(name: "draw_powerup", linkageName: "_Z12draw_powerupP6object", scope: !9, file: !9, line: 116, type: !1428, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!1677 = !DILocalVariable(name: "obj", arg: 1, scope: !1676, file: !9, line: 116, type: !1430)
!1678 = !DILocation(line: 116, column: 27, scope: !1676)
!1679 = !DILocation(line: 122, column: 19, scope: !1676)
!1680 = !DILocation(line: 122, column: 30, scope: !1676)
!1681 = !DILocation(line: 122, column: 35, scope: !1676)
!1682 = !DILocation(line: 122, column: 52, scope: !1676)
!1683 = !DILocation(line: 122, column: 24, scope: !1676)
!1684 = !DILocation(line: 122, column: 63, scope: !1676)
!1685 = !DILocation(line: 122, column: 70, scope: !1676)
!1686 = !DILocation(line: 122, column: 75, scope: !1676)
!1687 = !DILocation(line: 122, column: 92, scope: !1676)
!1688 = !DILocation(line: 122, column: 2, scope: !1676)
!1689 = !DILocation(line: 130, column: 1, scope: !1676)
!1690 = distinct !DISubprogram(name: "powerup_basic", linkageName: "_Z13powerup_basiciiiiPKcz", scope: !9, file: !9, line: 132, type: !1691, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!1691 = !DISubroutineType(types: !1692)
!1692 = !{null, !16, !16, !16, !16, !295, null}
!1693 = !DILocalVariable(name: "redadd", arg: 1, scope: !1690, file: !9, line: 132, type: !16)
!1694 = !DILocation(line: 132, column: 24, scope: !1690)
!1695 = !DILocalVariable(name: "greenadd", arg: 2, scope: !1690, file: !9, line: 132, type: !16)
!1696 = !DILocation(line: 132, column: 36, scope: !1690)
!1697 = !DILocalVariable(name: "blueadd", arg: 3, scope: !1690, file: !9, line: 132, type: !16)
!1698 = !DILocation(line: 132, column: 50, scope: !1690)
!1699 = !DILocalVariable(name: "score", arg: 4, scope: !1690, file: !9, line: 132, type: !16)
!1700 = !DILocation(line: 132, column: 63, scope: !1690)
!1701 = !DILocalVariable(name: "format", arg: 5, scope: !1690, file: !9, line: 132, type: !295)
!1702 = !DILocation(line: 132, column: 82, scope: !1690)
!1703 = !DILocalVariable(name: "text", scope: !1690, file: !9, line: 134, type: !1704)
!1704 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 960, elements: !1705)
!1705 = !{!1706}
!1706 = !DISubrange(count: 120)
!1707 = !DILocation(line: 134, column: 8, scope: !1690)
!1708 = !DILocalVariable(name: "args", scope: !1690, file: !9, line: 135, type: !1262)
!1709 = !DILocation(line: 135, column: 10, scope: !1690)
!1710 = !DILocation(line: 137, column: 2, scope: !1690)
!1711 = !DILocation(line: 138, column: 11, scope: !1690)
!1712 = !DILocation(line: 138, column: 17, scope: !1690)
!1713 = !DILocation(line: 138, column: 25, scope: !1690)
!1714 = !DILocation(line: 138, column: 2, scope: !1690)
!1715 = !DILocation(line: 139, column: 2, scope: !1690)
!1716 = !DILocation(line: 141, column: 20, scope: !1690)
!1717 = !DILocation(line: 141, column: 28, scope: !1690)
!1718 = !DILocation(line: 141, column: 38, scope: !1690)
!1719 = !DILocation(line: 141, column: 2, scope: !1690)
!1720 = !DILocation(line: 143, column: 19, scope: !1690)
!1721 = !DILocation(line: 143, column: 2, scope: !1690)
!1722 = !DILocation(line: 145, column: 22, scope: !1690)
!1723 = !DILocation(line: 145, column: 2, scope: !1690)
!1724 = !DILocation(line: 146, column: 1, scope: !1690)
!1725 = distinct !DISubprogram(name: "do_megawow_powerup", linkageName: "_Z18do_megawow_powerupi", scope: !9, file: !9, line: 150, type: !717, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!1726 = !DILocalVariable(name: "quantity", arg: 1, scope: !1725, file: !9, line: 150, type: !16)
!1727 = !DILocation(line: 150, column: 29, scope: !1725)
!1728 = !DILocalVariable(name: "i", scope: !1725, file: !9, line: 152, type: !16)
!1729 = !DILocation(line: 152, column: 6, scope: !1725)
!1730 = !DILocation(line: 154, column: 2, scope: !1725)
!1731 = !DILocation(line: 155, column: 10, scope: !1725)
!1732 = !DILocation(line: 155, column: 2, scope: !1725)
!1733 = !DILocation(line: 155, column: 22, scope: !1725)
!1734 = !DILocation(line: 155, column: 43, scope: !1725)
!1735 = !DILocation(line: 156, column: 10, scope: !1725)
!1736 = !DILocation(line: 156, column: 2, scope: !1725)
!1737 = !DILocation(line: 156, column: 22, scope: !1725)
!1738 = !DILocation(line: 156, column: 45, scope: !1725)
!1739 = !DILocation(line: 158, column: 9, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1725, file: !9, line: 158, column: 2)
!1741 = !DILocation(line: 158, column: 7, scope: !1740)
!1742 = !DILocation(line: 158, column: 14, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1740, file: !9, line: 158, column: 2)
!1744 = !DILocation(line: 158, column: 16, scope: !1743)
!1745 = !DILocation(line: 158, column: 2, scope: !1740)
!1746 = !DILocation(line: 159, column: 11, scope: !1743)
!1747 = !DILocation(line: 159, column: 3, scope: !1743)
!1748 = !DILocation(line: 159, column: 23, scope: !1743)
!1749 = !DILocation(line: 159, column: 36, scope: !1743)
!1750 = !DILocation(line: 159, column: 39, scope: !1743)
!1751 = !DILocation(line: 158, column: 40, scope: !1743)
!1752 = !DILocation(line: 158, column: 2, scope: !1743)
!1753 = distinct !{!1753, !1745, !1754, !1654}
!1754 = !DILocation(line: 159, column: 41, scope: !1740)
!1755 = !DILocation(line: 161, column: 9, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1725, file: !9, line: 161, column: 2)
!1757 = !DILocation(line: 161, column: 7, scope: !1756)
!1758 = !DILocation(line: 161, column: 14, scope: !1759)
!1759 = distinct !DILexicalBlock(scope: !1756, file: !9, line: 161, column: 2)
!1760 = !DILocation(line: 161, column: 16, scope: !1759)
!1761 = !DILocation(line: 161, column: 2, scope: !1756)
!1762 = !DILocation(line: 162, column: 43, scope: !1759)
!1763 = !DILocation(line: 162, column: 11, scope: !1759)
!1764 = !DILocation(line: 162, column: 3, scope: !1759)
!1765 = !DILocation(line: 162, column: 23, scope: !1759)
!1766 = !DILocation(line: 162, column: 38, scope: !1759)
!1767 = !DILocation(line: 162, column: 41, scope: !1759)
!1768 = !DILocation(line: 161, column: 22, scope: !1759)
!1769 = !DILocation(line: 161, column: 2, scope: !1759)
!1770 = distinct !{!1770, !1761, !1771, !1654}
!1771 = !DILocation(line: 162, column: 43, scope: !1756)
!1772 = !DILocation(line: 164, column: 9, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1725, file: !9, line: 164, column: 2)
!1774 = !DILocation(line: 164, column: 7, scope: !1773)
!1775 = !DILocation(line: 164, column: 14, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1773, file: !9, line: 164, column: 2)
!1777 = !DILocation(line: 164, column: 16, scope: !1776)
!1778 = !DILocation(line: 164, column: 2, scope: !1773)
!1779 = !DILocation(line: 165, column: 43, scope: !1776)
!1780 = !DILocation(line: 165, column: 52, scope: !1776)
!1781 = !DILocation(line: 165, column: 11, scope: !1776)
!1782 = !DILocation(line: 165, column: 3, scope: !1776)
!1783 = !DILocation(line: 165, column: 23, scope: !1776)
!1784 = !DILocation(line: 165, column: 38, scope: !1776)
!1785 = !DILocation(line: 165, column: 41, scope: !1776)
!1786 = !DILocation(line: 164, column: 42, scope: !1776)
!1787 = !DILocation(line: 164, column: 2, scope: !1776)
!1788 = distinct !{!1788, !1778, !1789, !1654}
!1789 = !DILocation(line: 165, column: 54, scope: !1773)
!1790 = !DILocation(line: 167, column: 6, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1725, file: !9, line: 167, column: 6)
!1792 = !DILocation(line: 167, column: 20, scope: !1791)
!1793 = !DILocation(line: 168, column: 38, scope: !1791)
!1794 = !DILocation(line: 168, column: 30, scope: !1791)
!1795 = !DILocation(line: 168, column: 50, scope: !1791)
!1796 = !DILocation(line: 168, column: 3, scope: !1791)
!1797 = !DILocation(line: 170, column: 10, scope: !1725)
!1798 = !DILocation(line: 170, column: 2, scope: !1725)
!1799 = !DILocation(line: 170, column: 22, scope: !1725)
!1800 = !DILocation(line: 170, column: 29, scope: !1725)
!1801 = !DILocation(line: 171, column: 10, scope: !1725)
!1802 = !DILocation(line: 171, column: 2, scope: !1725)
!1803 = !DILocation(line: 171, column: 22, scope: !1725)
!1804 = !DILocation(line: 171, column: 30, scope: !1725)
!1805 = !DILocation(line: 172, column: 10, scope: !1725)
!1806 = !DILocation(line: 172, column: 2, scope: !1725)
!1807 = !DILocation(line: 172, column: 22, scope: !1725)
!1808 = !DILocation(line: 172, column: 28, scope: !1725)
!1809 = !DILocation(line: 173, column: 10, scope: !1725)
!1810 = !DILocation(line: 173, column: 2, scope: !1725)
!1811 = !DILocation(line: 173, column: 22, scope: !1725)
!1812 = !DILocation(line: 173, column: 34, scope: !1725)
!1813 = !DILocation(line: 175, column: 6, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1725, file: !9, line: 175, column: 6)
!1815 = !DILocation(line: 175, column: 16, scope: !1814)
!1816 = !DILocation(line: 176, column: 11, scope: !1814)
!1817 = !DILocation(line: 176, column: 3, scope: !1814)
!1818 = !DILocation(line: 176, column: 23, scope: !1814)
!1819 = !DILocation(line: 176, column: 55, scope: !1814)
!1820 = !DILocation(line: 178, column: 2, scope: !1725)
!1821 = !DILocation(line: 179, column: 1, scope: !1725)
!1822 = distinct !DISubprogram(name: "pick_up_energy", linkageName: "_Z14pick_up_energyv", scope: !9, file: !9, line: 182, type: !682, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!1823 = !DILocalVariable(name: "used", scope: !1822, file: !9, line: 184, type: !16)
!1824 = !DILocation(line: 184, column: 6, scope: !1822)
!1825 = !DILocation(line: 186, column: 14, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1822, file: !9, line: 186, column: 6)
!1827 = !DILocation(line: 186, column: 6, scope: !1826)
!1828 = !DILocation(line: 186, column: 26, scope: !1826)
!1829 = !DILocation(line: 186, column: 35, scope: !1826)
!1830 = !DILocation(line: 186, column: 33, scope: !1826)
!1831 = !DILocalVariable(name: "boost", scope: !1832, file: !9, line: 188, type: !19)
!1832 = distinct !DILexicalBlock(scope: !1826, file: !9, line: 187, column: 2)
!1833 = !DILocation(line: 188, column: 7, scope: !1832)
!1834 = !DILocation(line: 189, column: 40, scope: !1832)
!1835 = !DILocation(line: 189, column: 38, scope: !1832)
!1836 = !DILocation(line: 189, column: 31, scope: !1832)
!1837 = !DILocation(line: 189, column: 20, scope: !1832)
!1838 = !DILocation(line: 189, column: 9, scope: !1832)
!1839 = !DILocation(line: 190, column: 7, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1832, file: !9, line: 190, column: 7)
!1841 = !DILocation(line: 190, column: 24, scope: !1840)
!1842 = !DILocation(line: 191, column: 13, scope: !1840)
!1843 = !DILocation(line: 191, column: 19, scope: !1840)
!1844 = !DILocation(line: 191, column: 10, scope: !1840)
!1845 = !DILocation(line: 191, column: 4, scope: !1840)
!1846 = !DILocation(line: 192, column: 33, scope: !1832)
!1847 = !DILocation(line: 192, column: 11, scope: !1832)
!1848 = !DILocation(line: 192, column: 3, scope: !1832)
!1849 = !DILocation(line: 192, column: 23, scope: !1832)
!1850 = !DILocation(line: 192, column: 30, scope: !1832)
!1851 = !DILocation(line: 193, column: 15, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1832, file: !9, line: 193, column: 7)
!1853 = !DILocation(line: 193, column: 7, scope: !1852)
!1854 = !DILocation(line: 193, column: 27, scope: !1852)
!1855 = !DILocation(line: 193, column: 36, scope: !1852)
!1856 = !DILocation(line: 193, column: 34, scope: !1852)
!1857 = !DILocation(line: 194, column: 33, scope: !1852)
!1858 = !DILocation(line: 194, column: 12, scope: !1852)
!1859 = !DILocation(line: 194, column: 4, scope: !1852)
!1860 = !DILocation(line: 194, column: 24, scope: !1852)
!1861 = !DILocation(line: 194, column: 31, scope: !1852)
!1862 = !DILocation(line: 195, column: 54, scope: !1832)
!1863 = !DILocation(line: 195, column: 66, scope: !1832)
!1864 = !DILocation(line: 195, column: 95, scope: !1832)
!1865 = !DILocation(line: 195, column: 87, scope: !1832)
!1866 = !DILocation(line: 195, column: 107, scope: !1832)
!1867 = !DILocation(line: 195, column: 82, scope: !1832)
!1868 = !DILocation(line: 195, column: 3, scope: !1832)
!1869 = !DILocation(line: 196, column: 8, scope: !1832)
!1870 = !DILocation(line: 197, column: 2, scope: !1832)
!1871 = !DILocation(line: 199, column: 20, scope: !1826)
!1872 = !DILocation(line: 199, column: 35, scope: !1826)
!1873 = !DILocation(line: 199, column: 3, scope: !1826)
!1874 = !DILocation(line: 201, column: 9, scope: !1822)
!1875 = !DILocation(line: 201, column: 2, scope: !1822)
!1876 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !20, file: !20, line: 49, type: !1877, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!1877 = !DISubroutineType(types: !1878)
!1878 = !{!19, !16}
!1879 = !DILocalVariable(name: "i", arg: 1, scope: !1876, file: !20, line: 49, type: !16)
!1880 = !DILocation(line: 49, column: 23, scope: !1876)
!1881 = !DILocation(line: 51, column: 9, scope: !1876)
!1882 = !DILocation(line: 51, column: 11, scope: !1876)
!1883 = !DILocation(line: 51, column: 2, scope: !1876)
!1884 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !1886, file: !1885, line: 402, type: !2086, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, declaration: !2085, retainedNodes: !1565)
!1885 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__vector/vector.h", directory: "")
!1886 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<char *, std::__1::allocator<char *> >", scope: !128, file: !1885, line: 86, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1887, templateParams: !2235, identifier: "_ZTSNSt3__16vectorIPcNS_9allocatorIS1_EEEE")
!1887 = !{!1888, !1959, !1960, !1961, !1967, !1969, !1973, !1977, !1982, !1986, !1989, !1995, !1996, !2001, !2011, !2015, !2020, !2023, !2026, !2030, !2033, !2036, !2040, !2041, !2045, !2051, !2056, !2057, !2058, !2064, !2069, !2070, !2071, !2072, !2073, !2074, !2075, !2078, !2079, !2082, !2083, !2084, !2085, !2090, !2093, !2094, !2095, !2098, !2101, !2102, !2103, !2107, !2111, !2114, !2118, !2119, !2122, !2125, !2128, !2131, !2134, !2137, !2138, !2139, !2140, !2143, !2144, !2145, !2146, !2149, !2150, !2151, !2152, !2153, !2156, !2161, !2167, !2170, !2173, !2192, !2208, !2211, !2214, !2217, !2220, !2221, !2222, !2223, !2224, !2225, !2226, !2227, !2230, !2233, !2234}
!1888 = !DIDerivedType(tag: DW_TAG_member, name: "__begin_", scope: !1886, file: !1885, line: 548, baseType: !1889, size: 64)
!1889 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !1886, file: !1885, line: 102, baseType: !1890, flags: DIFlagPublic)
!1890 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !1892, file: !1891, line: 241, baseType: !1927)
!1891 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator_traits.h", directory: "")
!1892 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::__1::allocator<char *> >", scope: !128, file: !1891, line: 238, size: 8, flags: DIFlagTypePassByValue, elements: !1893, templateParams: !1957, identifier: "_ZTSNSt3__116allocator_traitsINS_9allocatorIPcEEEE")
!1893 = !{!1894, !1954}
!1894 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE8allocateB8ne200100ERS3_m", scope: !1892, file: !1891, line: 269, type: !1895, scopeLine: 269, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1895 = !DISubroutineType(types: !1896)
!1896 = !{!1890, !1897, !1952}
!1897 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1898, size: 64)
!1898 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !1892, file: !1891, line: 239, baseType: !1899)
!1899 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char *>", scope: !128, file: !1900, line: 80, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1901, templateParams: !1950, identifier: "_ZTSNSt3__19allocatorIPcEE")
!1900 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator.h", directory: "")
!1901 = !{!1902, !1912, !1916, !1921, !1924, !1932, !1940, !1943, !1947}
!1902 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1899, baseType: !1903, extraData: i32 0)
!1903 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__non_trivial_if<true, std::__1::allocator<char *> >", scope: !128, file: !1900, line: 70, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1904, templateParams: !1909, identifier: "_ZTSNSt3__116__non_trivial_ifILb1ENS_9allocatorIPcEEEE")
!1904 = !{!1905}
!1905 = !DISubprogram(name: "__non_trivial_if", scope: !1903, file: !1900, line: 71, type: !1906, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!1906 = !DISubroutineType(types: !1907)
!1907 = !{null, !1908}
!1908 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1903, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1909 = !{!1910, !1911}
!1910 = !DITemplateValueParameter(name: "_Cond", type: !795, value: i8 1)
!1911 = !DITemplateTypeParameter(name: "_Unique", type: !1899)
!1912 = !DISubprogram(name: "allocator", scope: !1899, file: !1900, line: 93, type: !1913, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1913 = !DISubroutineType(types: !1914)
!1914 = !{null, !1915}
!1915 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1899, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1916 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100Em", scope: !1899, file: !1900, line: 98, type: !1917, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1917 = !DISubroutineType(types: !1918)
!1918 = !{!655, !1915, !1919}
!1919 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !128, file: !1920, line: 20, baseType: !200)
!1920 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/size_t.h", directory: "")
!1921 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__19allocatorIPcE10deallocateB8ne200100EPS1_m", scope: !1899, file: !1900, line: 116, type: !1922, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1922 = !DISubroutineType(types: !1923)
!1923 = !{null, !1915, !655, !1919}
!1924 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERS1_", scope: !1899, file: !1900, line: 136, type: !1925, scopeLine: 136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1925 = !DISubroutineType(types: !1926)
!1926 = !{!1927, !1928, !1930}
!1927 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !1899, file: !1900, line: 126, baseType: !655, flags: DIFlagPublic)
!1928 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1929, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1929 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1899)
!1930 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !1899, file: !1900, line: 128, baseType: !1931, flags: DIFlagPublic)
!1931 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !338, size: 64)
!1932 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERKS1_", scope: !1899, file: !1900, line: 139, type: !1933, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1933 = !DISubroutineType(types: !1934)
!1934 = !{!1935, !1928, !1938}
!1935 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !1899, file: !1900, line: 127, baseType: !1936, flags: DIFlagPublic)
!1936 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1937, size: 64)
!1937 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !338)
!1938 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !1899, file: !1900, line: 129, baseType: !1939, flags: DIFlagPublic)
!1939 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1937, size: 64)
!1940 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100EmPKv", scope: !1899, file: !1900, line: 143, type: !1941, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1941 = !DISubroutineType(types: !1942)
!1942 = !{!655, !1915, !1919, !731}
!1943 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__19allocatorIPcE8max_sizeB8ne200100Ev", scope: !1899, file: !1900, line: 147, type: !1944, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1944 = !DISubroutineType(types: !1945)
!1945 = !{!1946, !1928}
!1946 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !1900, line: 85, baseType: !1919, flags: DIFlagPublic)
!1947 = !DISubprogram(name: "destroy", linkageName: "_ZNSt3__19allocatorIPcE7destroyB8ne200100EPS1_", scope: !1899, file: !1900, line: 156, type: !1948, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1948 = !DISubroutineType(types: !1949)
!1949 = !{null, !1915, !1927}
!1950 = !{!1951}
!1951 = !DITemplateTypeParameter(name: "_Tp", type: !338)
!1952 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !1892, file: !1891, line: 246, baseType: !1953)
!1953 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !1899, file: !1900, line: 85, baseType: !1919, flags: DIFlagPublic)
!1954 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE10deallocateB8ne200100ERS3_PS2_m", scope: !1892, file: !1891, line: 301, type: !1955, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!1955 = !DISubroutineType(types: !1956)
!1956 = !{null, !1897, !1890, !1952}
!1957 = !{!1958}
!1958 = !DITemplateTypeParameter(name: "_Alloc", type: !1899)
!1959 = !DIDerivedType(tag: DW_TAG_member, name: "__end_", scope: !1886, file: !1885, line: 549, baseType: !1889, size: 64, offset: 64)
!1960 = !DIDerivedType(tag: DW_TAG_member, name: "__cap_", scope: !1886, file: !1885, line: 550, baseType: !1889, size: 64, align: 8, offset: 128)
!1961 = !DIDerivedType(tag: DW_TAG_member, name: "__padding1_550_", scope: !1886, file: !1885, line: 550, baseType: !1962, size: 8)
!1962 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<char **, true>", scope: !128, file: !1963, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1565, templateParams: !1964, identifier: "_ZTSNSt3__125__compressed_pair_paddingIPPcLb1EEE")
!1963 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/compressed_pair.h", directory: "")
!1964 = !{!1965, !1966}
!1965 = !DITemplateTypeParameter(name: "_ToPad", type: !655)
!1966 = !DITemplateValueParameter(name: "_Empty", type: !795, defaulted: true, value: i8 1)
!1967 = !DIDerivedType(tag: DW_TAG_member, name: "__alloc_", scope: !1886, file: !1885, line: 550, baseType: !1968, size: 8)
!1968 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !1886, file: !1885, line: 96, baseType: !1899, flags: DIFlagPublic)
!1969 = !DIDerivedType(tag: DW_TAG_member, name: "__padding2_550_", scope: !1886, file: !1885, line: 550, baseType: !1970, size: 8)
!1970 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<std::__1::allocator<char *>, true>", scope: !128, file: !1963, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1565, templateParams: !1971, identifier: "_ZTSNSt3__125__compressed_pair_paddingINS_9allocatorIPcEELb1EEE")
!1971 = !{!1972, !1966}
!1972 = !DITemplateTypeParameter(name: "_ToPad", type: !1899)
!1973 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 133, type: !1974, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1974 = !DISubroutineType(types: !1975)
!1975 = !{null, !1976}
!1976 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1886, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1977 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 135, type: !1978, scopeLine: 135, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!1978 = !DISubroutineType(types: !1979)
!1979 = !{null, !1976, !1980}
!1980 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1981, size: 64)
!1981 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1968)
!1982 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 144, type: !1983, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!1983 = !DISubroutineType(types: !1984)
!1984 = !{null, !1976, !1985}
!1985 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !1886, file: !1885, line: 100, baseType: !1952, flags: DIFlagPublic)
!1986 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 154, type: !1987, scopeLine: 154, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!1987 = !DISubroutineType(types: !1988)
!1988 = !{null, !1976, !1985, !1980}
!1989 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 165, type: !1990, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1990 = !DISubroutineType(types: !1991)
!1991 = !{null, !1976, !1985, !1992}
!1992 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1993, size: 64)
!1993 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1994)
!1994 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !1886, file: !1885, line: 95, baseType: !338, flags: DIFlagPublic)
!1995 = !DISubprogram(name: "~vector", scope: !1886, file: !1885, line: 259, type: !1974, scopeLine: 259, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1996 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 261, type: !1997, scopeLine: 261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1997 = !DISubroutineType(types: !1998)
!1998 = !{null, !1976, !1999}
!1999 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2000, size: 64)
!2000 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1886)
!2001 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 266, type: !2002, scopeLine: 266, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2002 = !DISubroutineType(types: !2003)
!2003 = !{null, !1976, !1999, !2004}
!2004 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2005, size: 64)
!2005 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2006)
!2006 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2008, file: !2007, line: 22, baseType: !1899)
!2007 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/type_identity.h", directory: "")
!2008 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__type_identity<std::__1::allocator<char *> >", scope: !128, file: !2007, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !1565, templateParams: !2009, identifier: "_ZTSNSt3__115__type_identityINS_9allocatorIPcEEEE")
!2009 = !{!2010}
!2010 = !DITemplateTypeParameter(name: "_Tp", type: !1899)
!2011 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ERKS4_", scope: !1886, file: !1885, line: 270, type: !2012, scopeLine: 270, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2012 = !DISubroutineType(types: !2013)
!2013 = !{!2014, !1976, !1999}
!2014 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1886, size: 64)
!2015 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 273, type: !2016, scopeLine: 273, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2016 = !DISubroutineType(types: !2017)
!2017 = !{null, !1976, !2018}
!2018 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char *>", scope: !129, file: !2019, line: 62, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIPcE")
!2019 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/initializer_list", directory: "")
!2020 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 278, type: !2021, scopeLine: 278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2021 = !DISubroutineType(types: !2022)
!2022 = !{null, !1976, !2018, !1980}
!2023 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ESt16initializer_listIS1_E", scope: !1886, file: !1885, line: 283, type: !2024, scopeLine: 283, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2024 = !DISubroutineType(types: !2025)
!2025 = !{!2014, !1976, !2018}
!2026 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 289, type: !2027, scopeLine: 289, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2027 = !DISubroutineType(types: !2028)
!2028 = !{null, !1976, !2029}
!2029 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !1886, size: 64)
!2030 = !DISubprogram(name: "vector", scope: !1886, file: !1885, line: 297, type: !2031, scopeLine: 297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2031 = !DISubroutineType(types: !2032)
!2032 = !{null, !1976, !2029, !2004}
!2033 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100EOS4_", scope: !1886, file: !1885, line: 298, type: !2034, scopeLine: 298, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2034 = !DISubroutineType(types: !2035)
!2035 = !{!2014, !1976, !2029}
!2036 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignEmRKS1_", scope: !1886, file: !1885, line: 333, type: !2037, scopeLine: 333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2037 = !DISubroutineType(types: !2038)
!2038 = !{null, !1976, !1985, !2039}
!2039 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !1886, file: !1885, line: 99, baseType: !1992, flags: DIFlagPublic)
!2040 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignB8ne200100ESt16initializer_listIS1_E", scope: !1886, file: !1885, line: 336, type: !2016, scopeLine: 336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2041 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE13get_allocatorB8ne200100Ev", scope: !1886, file: !1885, line: 341, type: !2042, scopeLine: 341, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2042 = !DISubroutineType(types: !2043)
!2043 = !{!1968, !2044}
!2044 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2000, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2045 = !DISubprogram(name: "begin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !1886, file: !1885, line: 348, type: !2046, scopeLine: 348, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2046 = !DISubroutineType(types: !2047)
!2047 = !{!2048, !1976}
!2048 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !1886, file: !1885, line: 111, baseType: !2049, flags: DIFlagPublic)
!2049 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char **>", scope: !128, file: !2050, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPPcEE")
!2050 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/wrap_iter.h", directory: "")
!2051 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !1886, file: !1885, line: 351, type: !2052, scopeLine: 351, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2052 = !DISubroutineType(types: !2053)
!2053 = !{!2054, !2044}
!2054 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !1886, file: !1885, line: 112, baseType: !2055, flags: DIFlagPublic)
!2055 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char *const *>", scope: !128, file: !2050, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPKPcEE")
!2056 = !DISubprogram(name: "end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !1886, file: !1885, line: 354, type: !2046, scopeLine: 354, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2057 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !1886, file: !1885, line: 357, type: !2052, scopeLine: 357, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2058 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !1886, file: !1885, line: 361, type: !2059, scopeLine: 361, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2059 = !DISubroutineType(types: !2060)
!2060 = !{!2061, !1976}
!2061 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !1886, file: !1885, line: 114, baseType: !2062, flags: DIFlagPublic)
!2062 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char **> >", scope: !128, file: !2063, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPPcEEEE")
!2063 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/reverse_iterator.h", directory: "")
!2064 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !1886, file: !1885, line: 364, type: !2065, scopeLine: 364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2065 = !DISubroutineType(types: !2066)
!2066 = !{!2067, !2044}
!2067 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !1886, file: !1885, line: 115, baseType: !2068, flags: DIFlagPublic)
!2068 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char *const *> >", scope: !128, file: !2063, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPKPcEEEE")
!2069 = !DISubprogram(name: "rend", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !1886, file: !1885, line: 367, type: !2059, scopeLine: 367, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2070 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !1886, file: !1885, line: 370, type: !2065, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2071 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6cbeginB8ne200100Ev", scope: !1886, file: !1885, line: 374, type: !2052, scopeLine: 374, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2072 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4cendB8ne200100Ev", scope: !1886, file: !1885, line: 375, type: !2052, scopeLine: 375, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2073 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE7crbeginB8ne200100Ev", scope: !1886, file: !1885, line: 376, type: !2065, scopeLine: 376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2074 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5crendB8ne200100Ev", scope: !1886, file: !1885, line: 379, type: !2065, scopeLine: 379, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2075 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4sizeB8ne200100Ev", scope: !1886, file: !1885, line: 384, type: !2076, scopeLine: 384, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2076 = !DISubroutineType(types: !2077)
!2077 = !{!1985, !2044}
!2078 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8capacityB8ne200100Ev", scope: !1886, file: !1885, line: 387, type: !2076, scopeLine: 387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2079 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5emptyB8ne200100Ev", scope: !1886, file: !1885, line: 390, type: !2080, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2080 = !DISubroutineType(types: !2081)
!2081 = !{!795, !2044}
!2082 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8max_sizeB8ne200100Ev", scope: !1886, file: !1885, line: 393, type: !2076, scopeLine: 393, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2083 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE7reserveEm", scope: !1886, file: !1885, line: 396, type: !1983, scopeLine: 396, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2084 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13shrink_to_fitEv", scope: !1886, file: !1885, line: 397, type: !1974, scopeLine: 397, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2085 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !1886, file: !1885, line: 402, type: !2086, scopeLine: 402, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2086 = !DISubroutineType(types: !2087)
!2087 = !{!2088, !1976, !1985}
!2088 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !1886, file: !1885, line: 98, baseType: !2089, flags: DIFlagPublic)
!2089 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1994, size: 64)
!2090 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !1886, file: !1885, line: 406, type: !2091, scopeLine: 406, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2091 = !DISubroutineType(types: !2092)
!2092 = !{!2039, !2044, !1985}
!2093 = !DISubprogram(name: "at", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !1886, file: !1885, line: 410, type: !2086, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2094 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !1886, file: !1885, line: 415, type: !2091, scopeLine: 415, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2095 = !DISubprogram(name: "front", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !1886, file: !1885, line: 421, type: !2096, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2096 = !DISubroutineType(types: !2097)
!2097 = !{!2088, !1976}
!2098 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !1886, file: !1885, line: 425, type: !2099, scopeLine: 425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2099 = !DISubroutineType(types: !2100)
!2100 = !{!2039, !2044}
!2101 = !DISubprogram(name: "back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !1886, file: !1885, line: 429, type: !2096, scopeLine: 429, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2102 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !1886, file: !1885, line: 433, type: !2099, scopeLine: 433, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2103 = !DISubprogram(name: "data", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !1886, file: !1885, line: 441, type: !2104, scopeLine: 441, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2104 = !DISubroutineType(types: !2105)
!2105 = !{!2106, !1976}
!2106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1994, size: 64)
!2107 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !1886, file: !1885, line: 445, type: !2108, scopeLine: 445, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2108 = !DISubroutineType(types: !2109)
!2109 = !{!2110, !2044}
!2110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1993, size: 64)
!2111 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100ERKS1_", scope: !1886, file: !1885, line: 452, type: !2112, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2112 = !DISubroutineType(types: !2113)
!2113 = !{null, !1976, !2039}
!2114 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100EOS1_", scope: !1886, file: !1885, line: 454, type: !2115, scopeLine: 454, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2115 = !DISubroutineType(types: !2116)
!2116 = !{null, !1976, !2117}
!2117 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !1994, size: 64)
!2118 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8pop_backB8ne200100Ev", scope: !1886, file: !1885, line: 473, type: !1974, scopeLine: 473, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2119 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EERS6_", scope: !1886, file: !1885, line: 478, type: !2120, scopeLine: 478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2120 = !DISubroutineType(types: !2121)
!2121 = !{!2048, !1976, !2054, !2039}
!2122 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEOS1_", scope: !1886, file: !1885, line: 480, type: !2123, scopeLine: 480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2123 = !DISubroutineType(types: !2124)
!2124 = !{!2048, !1976, !2054, !2117}
!2125 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_", scope: !1886, file: !1885, line: 485, type: !2126, scopeLine: 485, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2126 = !DISubroutineType(types: !2127)
!2127 = !{!2048, !1976, !2054, !1985, !2039}
!2128 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertB8ne200100ENS_11__wrap_iterIPKS1_EESt16initializer_listIS1_E", scope: !1886, file: !1885, line: 521, type: !2129, scopeLine: 521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2129 = !DISubroutineType(types: !2130)
!2130 = !{!2048, !1976, !2054, !2018}
!2131 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseB8ne200100ENS_11__wrap_iterIPKS1_EE", scope: !1886, file: !1885, line: 526, type: !2132, scopeLine: 526, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2132 = !DISubroutineType(types: !2133)
!2133 = !{!2048, !1976, !2054}
!2134 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseENS_11__wrap_iterIPKS1_EES8_", scope: !1886, file: !1885, line: 527, type: !2135, scopeLine: 527, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2135 = !DISubroutineType(types: !2136)
!2136 = !{!2048, !1976, !2054, !2054}
!2137 = !DISubprogram(name: "clear", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5clearB8ne200100Ev", scope: !1886, file: !1885, line: 529, type: !1974, scopeLine: 529, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2138 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEm", scope: !1886, file: !1885, line: 535, type: !1983, scopeLine: 535, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2139 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEmRKS1_", scope: !1886, file: !1885, line: 536, type: !2037, scopeLine: 536, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2140 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4swapERS4_", scope: !1886, file: !1885, line: 538, type: !2141, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2141 = !DISubroutineType(types: !2142)
!2142 = !{null, !1976, !2014}
!2143 = !DISubprogram(name: "__invariants", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE12__invariantsEv", scope: !1886, file: !1885, line: 545, type: !2080, scopeLine: 545, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2144 = !DISubprogram(name: "__vallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__vallocateB8ne200100Em", scope: !1886, file: !1885, line: 559, type: !1983, scopeLine: 559, flags: DIFlagPrototyped, spFlags: 0)
!2145 = !DISubprogram(name: "__vdeallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__vdeallocateEv", scope: !1886, file: !1885, line: 569, type: !1974, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!2146 = !DISubprogram(name: "__recommend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__recommendB8ne200100Em", scope: !1886, file: !1885, line: 570, type: !2147, scopeLine: 570, flags: DIFlagPrototyped, spFlags: 0)
!2147 = !DISubroutineType(types: !2148)
!2148 = !{!1985, !2044, !1985}
!2149 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEm", scope: !1886, file: !1885, line: 571, type: !1983, scopeLine: 571, flags: DIFlagPrototyped, spFlags: 0)
!2150 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEmRKS1_", scope: !1886, file: !1885, line: 572, type: !2037, scopeLine: 572, flags: DIFlagPrototyped, spFlags: 0)
!2151 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEm", scope: !1886, file: !1885, line: 620, type: !1983, scopeLine: 620, flags: DIFlagPrototyped, spFlags: 0)
!2152 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEmRKS1_", scope: !1886, file: !1885, line: 621, type: !2037, scopeLine: 621, flags: DIFlagPrototyped, spFlags: 0)
!2153 = !DISubprogram(name: "__make_iter", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPS1_", scope: !1886, file: !1885, line: 623, type: !2154, scopeLine: 623, flags: DIFlagPrototyped, spFlags: 0)
!2154 = !DISubroutineType(types: !2155)
!2155 = !{!2048, !1976, !1889}
!2156 = !DISubprogram(name: "__make_iter", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPKS1_", scope: !1886, file: !1885, line: 643, type: !2157, scopeLine: 643, flags: DIFlagPrototyped, spFlags: 0)
!2157 = !DISubroutineType(types: !2158)
!2158 = !{!2054, !2044, !2159}
!2159 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !1886, file: !1885, line: 103, baseType: !2160, flags: DIFlagPublic)
!2160 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !1892, file: !1891, line: 242, baseType: !1935)
!2161 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE", scope: !1886, file: !1885, line: 656, type: !2162, scopeLine: 656, flags: DIFlagPrototyped, spFlags: 0)
!2162 = !DISubroutineType(types: !2163)
!2163 = !{null, !1976, !2164}
!2164 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2165, size: 64)
!2165 = !DICompositeType(tag: DW_TAG_structure_type, name: "__split_buffer<char *, std::__1::allocator<char *> &>", scope: !128, file: !2166, line: 52, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__114__split_bufferIPcRNS_9allocatorIS1_EEEE")
!2166 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__split_buffer", directory: "")
!2167 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_", scope: !1886, file: !1885, line: 658, type: !2168, scopeLine: 658, flags: DIFlagPrototyped, spFlags: 0)
!2168 = !DISubroutineType(types: !2169)
!2169 = !{!1889, !1976, !2164, !1889}
!2170 = !DISubprogram(name: "__move_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE12__move_rangeEPS1_S5_S5_", scope: !1886, file: !1885, line: 660, type: !2171, scopeLine: 660, flags: DIFlagPrototyped, spFlags: 0)
!2171 = !DISubroutineType(types: !2172)
!2172 = !{null, !1976, !1889, !1889, !1889}
!2173 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE", scope: !1886, file: !1885, line: 661, type: !2174, scopeLine: 661, flags: DIFlagPrototyped, spFlags: 0)
!2174 = !DISubroutineType(types: !2175)
!2175 = !{null, !1976, !2014, !2176}
!2176 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !128, file: !2177, line: 31, baseType: !2178)
!2177 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/integral_constant.h", directory: "")
!2178 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !128, file: !2177, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !2179, templateParams: !2189, identifier: "_ZTSNSt3__117integral_constantIbLb1EEE")
!2179 = !{!2180, !2182, !2188}
!2180 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !2178, file: !2177, line: 22, baseType: !2181, flags: DIFlagStaticMember, extraData: i1 true)
!2181 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !795)
!2182 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb1EEcvbB8ne200100Ev", scope: !2178, file: !2177, line: 25, type: !2183, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!2183 = !DISubroutineType(types: !2184)
!2184 = !{!2185, !2186}
!2185 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !2178, file: !2177, line: 23, baseType: !795)
!2186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2187, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2187 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2178)
!2188 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb1EEclB8ne200100Ev", scope: !2178, file: !2177, line: 27, type: !2183, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!2189 = !{!2190, !2191}
!2190 = !DITemplateTypeParameter(name: "_Tp", type: !795)
!2191 = !DITemplateValueParameter(name: "__v", type: !795, value: i8 1)
!2192 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb0EEE", scope: !1886, file: !1885, line: 663, type: !2193, scopeLine: 663, flags: DIFlagPrototyped, spFlags: 0)
!2193 = !DISubroutineType(types: !2194)
!2194 = !{null, !1976, !2014, !2195}
!2195 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !128, file: !2177, line: 32, baseType: !2196)
!2196 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !128, file: !2177, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !2197, templateParams: !2206, identifier: "_ZTSNSt3__117integral_constantIbLb0EEE")
!2197 = !{!2198, !2199, !2205}
!2198 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !2196, file: !2177, line: 22, baseType: !2181, flags: DIFlagStaticMember, extraData: i1 false)
!2199 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb0EEcvbB8ne200100Ev", scope: !2196, file: !2177, line: 25, type: !2200, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!2200 = !DISubroutineType(types: !2201)
!2201 = !{!2202, !2203}
!2202 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !2196, file: !2177, line: 23, baseType: !795)
!2203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2204, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2204 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2196)
!2205 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb0EEclB8ne200100Ev", scope: !2196, file: !2177, line: 27, type: !2200, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!2206 = !{!2190, !2207}
!2207 = !DITemplateValueParameter(name: "__v", type: !795, value: i8 0)
!2208 = !DISubprogram(name: "__destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_", scope: !1886, file: !1885, line: 665, type: !2209, scopeLine: 665, flags: DIFlagPrototyped, spFlags: 0)
!2209 = !DISubroutineType(types: !2210)
!2210 = !{null, !1976, !1889}
!2211 = !DISubprogram(name: "__annotate_contiguous_container", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE31__annotate_contiguous_containerB8ne200100EPKvS6_", scope: !1886, file: !1885, line: 683, type: !2212, scopeLine: 683, flags: DIFlagPrototyped, spFlags: 0)
!2212 = !DISubroutineType(types: !2213)
!2213 = !{null, !2044, !731, !731}
!2214 = !DISubprogram(name: "__annotate_new", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE14__annotate_newB8ne200100Em", scope: !1886, file: !1885, line: 687, type: !2215, scopeLine: 687, flags: DIFlagPrototyped, spFlags: 0)
!2215 = !DISubroutineType(types: !2216)
!2216 = !{null, !2044, !1985}
!2217 = !DISubprogram(name: "__annotate_delete", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_deleteB8ne200100Ev", scope: !1886, file: !1885, line: 694, type: !2218, scopeLine: 694, flags: DIFlagPrototyped, spFlags: 0)
!2218 = !DISubroutineType(types: !2219)
!2219 = !{null, !2044}
!2220 = !DISubprogram(name: "__annotate_increase", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE19__annotate_increaseB8ne200100Em", scope: !1886, file: !1885, line: 700, type: !2215, scopeLine: 700, flags: DIFlagPrototyped, spFlags: 0)
!2221 = !DISubprogram(name: "__annotate_shrink", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_shrinkB8ne200100Em", scope: !1886, file: !1885, line: 707, type: !2215, scopeLine: 707, flags: DIFlagPrototyped, spFlags: 0)
!2222 = !DISubprogram(name: "__base_destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_", scope: !1886, file: !1885, line: 746, type: !2209, scopeLine: 746, flags: DIFlagPrototyped, spFlags: 0)
!2223 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_", scope: !1886, file: !1885, line: 753, type: !1997, scopeLine: 753, flags: DIFlagPrototyped, spFlags: 0)
!2224 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_", scope: !1886, file: !1885, line: 757, type: !2141, scopeLine: 757, flags: DIFlagPrototyped, spFlags: 0)
!2225 = !DISubprogram(name: "__throw_length_error", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev", scope: !1886, file: !1885, line: 763, type: !708, scopeLine: 763, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!2226 = !DISubprogram(name: "__throw_out_of_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_out_of_rangeB8ne200100Ev", scope: !1886, file: !1885, line: 765, type: !708, scopeLine: 765, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!2227 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb1EEE", scope: !1886, file: !1885, line: 767, type: !2228, scopeLine: 767, flags: DIFlagPrototyped, spFlags: 0)
!2228 = !DISubroutineType(types: !2229)
!2229 = !{null, !1976, !1999, !2176}
!2230 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb0EEE", scope: !1886, file: !1885, line: 777, type: !2231, scopeLine: 777, flags: DIFlagPrototyped, spFlags: 0)
!2231 = !DISubroutineType(types: !2232)
!2232 = !{null, !1976, !1999, !2195}
!2233 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb1EEE", scope: !1886, file: !1885, line: 779, type: !2174, scopeLine: 779, flags: DIFlagPrototyped, spFlags: 0)
!2234 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb0EEE", scope: !1886, file: !1885, line: 784, type: !2193, scopeLine: 784, flags: DIFlagPrototyped, spFlags: 0)
!2235 = !{!1951, !2236}
!2236 = !DITemplateTypeParameter(name: "_Allocator", type: !1899, defaulted: true)
!2237 = !DILocalVariable(name: "this", arg: 1, scope: !1884, type: !2238, flags: DIFlagArtificial | DIFlagObjectPointer)
!2238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1886, size: 64)
!2239 = !DILocation(line: 0, scope: !1884)
!2240 = !DILocalVariable(name: "__n", arg: 2, scope: !1884, file: !1885, line: 402, type: !1985)
!2241 = !DILocation(line: 402, column: 86, scope: !1884)
!2242 = !DILocation(line: 404, column: 18, scope: !1884)
!2243 = !DILocation(line: 404, column: 27, scope: !1884)
!2244 = !DILocation(line: 404, column: 12, scope: !1884)
!2245 = !DILocation(line: 404, column: 5, scope: !1884)
!2246 = distinct !DISubprogram(name: "f2ir", linkageName: "_Z4f2iri", scope: !20, file: !20, line: 66, type: !215, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!2247 = !DILocalVariable(name: "f", arg: 1, scope: !2246, file: !20, line: 66, type: !16)
!2248 = !DILocation(line: 66, column: 24, scope: !2246)
!2249 = !DILocation(line: 68, column: 10, scope: !2246)
!2250 = !DILocation(line: 68, column: 12, scope: !2246)
!2251 = !DILocation(line: 68, column: 20, scope: !2246)
!2252 = !DILocation(line: 68, column: 2, scope: !2246)
!2253 = distinct !DISubprogram(name: "pick_up_vulcan_ammo", linkageName: "_Z19pick_up_vulcan_ammov", scope: !9, file: !9, line: 204, type: !682, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!2254 = !DILocalVariable(name: "used", scope: !2253, file: !9, line: 206, type: !16)
!2255 = !DILocation(line: 206, column: 6, scope: !2253)
!2256 = !DILocalVariable(name: "max", scope: !2253, file: !9, line: 206, type: !16)
!2257 = !DILocation(line: 206, column: 16, scope: !2253)
!2258 = !DILocalVariable(name: "pwsave", scope: !2253, file: !9, line: 208, type: !16)
!2259 = !DILocation(line: 208, column: 6, scope: !2253)
!2260 = !DILocation(line: 208, column: 15, scope: !2253)
!2261 = !DILocation(line: 209, column: 6, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2253, file: !9, line: 209, column: 6)
!2263 = !DILocation(line: 210, column: 54, scope: !2264)
!2264 = distinct !DILexicalBlock(scope: !2262, file: !9, line: 209, column: 69)
!2265 = !DILocation(line: 210, column: 3, scope: !2264)
!2266 = !DILocation(line: 211, column: 8, scope: !2264)
!2267 = !DILocation(line: 212, column: 2, scope: !2264)
!2268 = !DILocation(line: 215, column: 9, scope: !2269)
!2269 = distinct !DILexicalBlock(scope: !2262, file: !9, line: 214, column: 2)
!2270 = !DILocation(line: 215, column: 7, scope: !2269)
!2271 = !DILocation(line: 216, column: 15, scope: !2272)
!2272 = distinct !DILexicalBlock(scope: !2269, file: !9, line: 216, column: 7)
!2273 = !DILocation(line: 216, column: 7, scope: !2272)
!2274 = !DILocation(line: 216, column: 27, scope: !2272)
!2275 = !DILocation(line: 216, column: 33, scope: !2272)
!2276 = !DILocation(line: 217, column: 8, scope: !2272)
!2277 = !DILocation(line: 217, column: 4, scope: !2272)
!2278 = !DILocation(line: 218, column: 33, scope: !2269)
!2279 = !DILocation(line: 218, column: 96, scope: !2269)
!2280 = !DILocation(line: 218, column: 84, scope: !2269)
!2281 = !DILocation(line: 218, column: 51, scope: !2269)
!2282 = !DILocation(line: 218, column: 102, scope: !2269)
!2283 = !DILocation(line: 218, column: 3, scope: !2269)
!2284 = !DILocation(line: 219, column: 8, scope: !2269)
!2285 = !DILocation(line: 221, column: 19, scope: !2253)
!2286 = !DILocation(line: 221, column: 17, scope: !2253)
!2287 = !DILocation(line: 223, column: 9, scope: !2253)
!2288 = !DILocation(line: 223, column: 2, scope: !2253)
!2289 = distinct !DISubprogram(name: "f2iu", linkageName: "_Z4f2iuj", scope: !20, file: !20, line: 60, type: !2290, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!2290 = !DISubroutineType(types: !2291)
!2291 = !{!16, !5}
!2292 = !DILocalVariable(name: "f", arg: 1, scope: !2289, file: !20, line: 60, type: !5)
!2293 = !DILocation(line: 60, column: 33, scope: !2289)
!2294 = !DILocation(line: 62, column: 9, scope: !2289)
!2295 = !DILocation(line: 62, column: 11, scope: !2289)
!2296 = !DILocation(line: 62, column: 2, scope: !2289)
!2297 = distinct !DISubprogram(name: "do_powerup", linkageName: "_Z10do_powerupP6object", scope: !9, file: !9, line: 235, type: !2298, scopeLine: 236, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1565)
!2298 = !DISubroutineType(types: !2299)
!2299 = !{!16, !1430}
!2300 = !DILocalVariable(name: "obj", arg: 1, scope: !2297, file: !9, line: 235, type: !1430)
!2301 = !DILocation(line: 235, column: 24, scope: !2297)
!2302 = !DILocalVariable(name: "used", scope: !2297, file: !9, line: 237, type: !16)
!2303 = !DILocation(line: 237, column: 6, scope: !2297)
!2304 = !DILocalVariable(name: "special_used", scope: !2297, file: !9, line: 238, type: !16)
!2305 = !DILocation(line: 238, column: 6, scope: !2297)
!2306 = !DILocalVariable(name: "temp_string", scope: !2297, file: !9, line: 239, type: !2307)
!2307 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 400, elements: !24)
!2308 = !DILocation(line: 239, column: 7, scope: !2297)
!2309 = !DILocalVariable(name: "id", scope: !2297, file: !9, line: 240, type: !16)
!2310 = !DILocation(line: 240, column: 6, scope: !2297)
!2311 = !DILocation(line: 240, column: 11, scope: !2297)
!2312 = !DILocation(line: 240, column: 16, scope: !2297)
!2313 = !DILocation(line: 242, column: 7, scope: !2314)
!2314 = distinct !DILexicalBlock(scope: !2297, file: !9, line: 242, column: 6)
!2315 = !DILocation(line: 242, column: 6, scope: !2314)
!2316 = !DILocation(line: 242, column: 23, scope: !2314)
!2317 = !DILocation(line: 242, column: 27, scope: !2314)
!2318 = !DILocation(line: 242, column: 42, scope: !2314)
!2319 = !DILocation(line: 242, column: 47, scope: !2314)
!2320 = !DILocation(line: 242, column: 61, scope: !2314)
!2321 = !DILocation(line: 242, column: 73, scope: !2314)
!2322 = !DILocation(line: 242, column: 65, scope: !2314)
!2323 = !DILocation(line: 242, column: 85, scope: !2314)
!2324 = !DILocation(line: 242, column: 93, scope: !2314)
!2325 = !DILocation(line: 243, column: 3, scope: !2314)
!2326 = !DILocation(line: 245, column: 6, scope: !2327)
!2327 = distinct !DILexicalBlock(scope: !2297, file: !9, line: 245, column: 6)
!2328 = !DILocation(line: 245, column: 11, scope: !2327)
!2329 = !DILocation(line: 245, column: 30, scope: !2327)
!2330 = !DILocation(line: 245, column: 46, scope: !2327)
!2331 = !DILocation(line: 245, column: 44, scope: !2327)
!2332 = !DILocation(line: 246, column: 3, scope: !2327)
!2333 = !DILocation(line: 246, column: 8, scope: !2327)
!2334 = !DILocation(line: 246, column: 27, scope: !2327)
!2335 = !DILocation(line: 246, column: 41, scope: !2327)
!2336 = !DILocation(line: 248, column: 7, scope: !2337)
!2337 = distinct !DILexicalBlock(scope: !2297, file: !9, line: 248, column: 6)
!2338 = !DILocation(line: 248, column: 12, scope: !2337)
!2339 = !DILocation(line: 248, column: 31, scope: !2337)
!2340 = !DILocation(line: 248, column: 37, scope: !2337)
!2341 = !DILocation(line: 248, column: 6, scope: !2337)
!2342 = !DILocation(line: 248, column: 58, scope: !2337)
!2343 = !DILocation(line: 248, column: 61, scope: !2337)
!2344 = !DILocation(line: 248, column: 66, scope: !2337)
!2345 = !DILocation(line: 248, column: 85, scope: !2337)
!2346 = !DILocation(line: 248, column: 99, scope: !2337)
!2347 = !DILocation(line: 248, column: 103, scope: !2337)
!2348 = !DILocation(line: 248, column: 106, scope: !2337)
!2349 = !DILocation(line: 248, column: 117, scope: !2337)
!2350 = !DILocation(line: 248, column: 122, scope: !2337)
!2351 = !DILocation(line: 248, column: 141, scope: !2337)
!2352 = !DILocation(line: 248, column: 157, scope: !2337)
!2353 = !DILocation(line: 248, column: 155, scope: !2337)
!2354 = !DILocation(line: 248, column: 115, scope: !2337)
!2355 = !DILocation(line: 249, column: 3, scope: !2337)
!2356 = !DILocation(line: 251, column: 16, scope: !2297)
!2357 = !DILocation(line: 253, column: 10, scope: !2297)
!2358 = !DILocation(line: 253, column: 15, scope: !2297)
!2359 = !DILocation(line: 253, column: 2, scope: !2297)
!2360 = !DILocation(line: 256, column: 11, scope: !2361)
!2361 = distinct !DILexicalBlock(scope: !2297, file: !9, line: 254, column: 2)
!2362 = !DILocation(line: 256, column: 3, scope: !2361)
!2363 = !DILocation(line: 256, column: 23, scope: !2361)
!2364 = !DILocation(line: 256, column: 28, scope: !2361)
!2365 = !DILocation(line: 257, column: 32, scope: !2361)
!2366 = !DILocation(line: 257, column: 3, scope: !2361)
!2367 = !DILocation(line: 258, column: 8, scope: !2361)
!2368 = !DILocation(line: 259, column: 3, scope: !2361)
!2369 = !DILocation(line: 261, column: 10, scope: !2361)
!2370 = !DILocation(line: 261, column: 8, scope: !2361)
!2371 = !DILocation(line: 262, column: 3, scope: !2361)
!2372 = !DILocation(line: 264, column: 15, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 264, column: 7)
!2374 = !DILocation(line: 264, column: 7, scope: !2373)
!2375 = !DILocation(line: 264, column: 27, scope: !2373)
!2376 = !DILocation(line: 264, column: 37, scope: !2373)
!2377 = !DILocation(line: 264, column: 35, scope: !2373)
!2378 = !DILocalVariable(name: "boost", scope: !2379, file: !9, line: 266, type: !19)
!2379 = distinct !DILexicalBlock(scope: !2373, file: !9, line: 265, column: 3)
!2380 = !DILocation(line: 266, column: 8, scope: !2379)
!2381 = !DILocation(line: 266, column: 45, scope: !2379)
!2382 = !DILocation(line: 266, column: 43, scope: !2379)
!2383 = !DILocation(line: 266, column: 36, scope: !2379)
!2384 = !DILocation(line: 266, column: 25, scope: !2379)
!2385 = !DILocation(line: 267, column: 8, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2379, file: !9, line: 267, column: 8)
!2387 = !DILocation(line: 267, column: 25, scope: !2386)
!2388 = !DILocation(line: 268, column: 14, scope: !2386)
!2389 = !DILocation(line: 268, column: 20, scope: !2386)
!2390 = !DILocation(line: 268, column: 11, scope: !2386)
!2391 = !DILocation(line: 268, column: 5, scope: !2386)
!2392 = !DILocation(line: 269, column: 35, scope: !2379)
!2393 = !DILocation(line: 269, column: 12, scope: !2379)
!2394 = !DILocation(line: 269, column: 4, scope: !2379)
!2395 = !DILocation(line: 269, column: 24, scope: !2379)
!2396 = !DILocation(line: 269, column: 32, scope: !2379)
!2397 = !DILocation(line: 270, column: 16, scope: !2398)
!2398 = distinct !DILexicalBlock(scope: !2379, file: !9, line: 270, column: 8)
!2399 = !DILocation(line: 270, column: 8, scope: !2398)
!2400 = !DILocation(line: 270, column: 28, scope: !2398)
!2401 = !DILocation(line: 270, column: 38, scope: !2398)
!2402 = !DILocation(line: 270, column: 36, scope: !2398)
!2403 = !DILocation(line: 271, column: 35, scope: !2398)
!2404 = !DILocation(line: 271, column: 13, scope: !2398)
!2405 = !DILocation(line: 271, column: 5, scope: !2398)
!2406 = !DILocation(line: 271, column: 25, scope: !2398)
!2407 = !DILocation(line: 271, column: 33, scope: !2398)
!2408 = !DILocation(line: 272, column: 54, scope: !2379)
!2409 = !DILocation(line: 272, column: 66, scope: !2379)
!2410 = !DILocation(line: 272, column: 95, scope: !2379)
!2411 = !DILocation(line: 272, column: 87, scope: !2379)
!2412 = !DILocation(line: 272, column: 107, scope: !2379)
!2413 = !DILocation(line: 272, column: 82, scope: !2379)
!2414 = !DILocation(line: 272, column: 4, scope: !2379)
!2415 = !DILocation(line: 273, column: 9, scope: !2379)
!2416 = !DILocation(line: 274, column: 3, scope: !2379)
!2417 = !DILocation(line: 276, column: 21, scope: !2373)
!2418 = !DILocation(line: 276, column: 36, scope: !2373)
!2419 = !DILocation(line: 276, column: 4, scope: !2373)
!2420 = !DILocation(line: 277, column: 3, scope: !2361)
!2421 = !DILocation(line: 279, column: 15, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 279, column: 7)
!2423 = !DILocation(line: 279, column: 7, scope: !2422)
!2424 = !DILocation(line: 279, column: 27, scope: !2422)
!2425 = !DILocation(line: 279, column: 39, scope: !2422)
!2426 = !DILocation(line: 282, column: 21, scope: !2427)
!2427 = distinct !DILexicalBlock(scope: !2422, file: !9, line: 280, column: 3)
!2428 = !DILocation(line: 282, column: 36, scope: !2427)
!2429 = !DILocation(line: 282, column: 4, scope: !2427)
!2430 = !DILocation(line: 283, column: 3, scope: !2427)
!2431 = !DILocation(line: 286, column: 8, scope: !2432)
!2432 = distinct !DILexicalBlock(scope: !2433, file: !9, line: 286, column: 8)
!2433 = distinct !DILexicalBlock(scope: !2422, file: !9, line: 285, column: 3)
!2434 = !DILocation(line: 286, column: 22, scope: !2432)
!2435 = !DILocation(line: 287, column: 40, scope: !2432)
!2436 = !DILocation(line: 287, column: 32, scope: !2432)
!2437 = !DILocation(line: 287, column: 52, scope: !2432)
!2438 = !DILocation(line: 287, column: 73, scope: !2432)
!2439 = !DILocation(line: 287, column: 65, scope: !2432)
!2440 = !DILocation(line: 287, column: 85, scope: !2432)
!2441 = !DILocation(line: 287, column: 97, scope: !2432)
!2442 = !DILocation(line: 287, column: 5, scope: !2432)
!2443 = !DILocation(line: 288, column: 12, scope: !2433)
!2444 = !DILocation(line: 288, column: 4, scope: !2433)
!2445 = !DILocation(line: 288, column: 24, scope: !2433)
!2446 = !DILocation(line: 288, column: 35, scope: !2433)
!2447 = !DILocation(line: 289, column: 54, scope: !2433)
!2448 = !DILocation(line: 289, column: 65, scope: !2433)
!2449 = !DILocation(line: 289, column: 89, scope: !2433)
!2450 = !DILocation(line: 289, column: 81, scope: !2433)
!2451 = !DILocation(line: 289, column: 101, scope: !2433)
!2452 = !DILocation(line: 289, column: 113, scope: !2433)
!2453 = !DILocation(line: 289, column: 4, scope: !2433)
!2454 = !DILocation(line: 290, column: 4, scope: !2433)
!2455 = !DILocation(line: 291, column: 4, scope: !2433)
!2456 = !DILocation(line: 292, column: 9, scope: !2433)
!2457 = !DILocation(line: 294, column: 8, scope: !2458)
!2458 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 294, column: 7)
!2459 = !DILocation(line: 294, column: 13, scope: !2458)
!2460 = !DILocation(line: 294, column: 18, scope: !2458)
!2461 = !DILocation(line: 294, column: 28, scope: !2458)
!2462 = !DILocation(line: 294, column: 17, scope: !2458)
!2463 = !DILocation(line: 295, column: 11, scope: !2458)
!2464 = !DILocation(line: 295, column: 9, scope: !2458)
!2465 = !DILocation(line: 295, column: 4, scope: !2458)
!2466 = !DILocation(line: 296, column: 3, scope: !2361)
!2467 = !DILocation(line: 298, column: 10, scope: !2361)
!2468 = !DILocation(line: 298, column: 8, scope: !2361)
!2469 = !DILocation(line: 299, column: 3, scope: !2361)
!2470 = !DILocation(line: 301, column: 10, scope: !2361)
!2471 = !DILocation(line: 301, column: 8, scope: !2361)
!2472 = !DILocation(line: 302, column: 3, scope: !2361)
!2473 = !DILocation(line: 305, column: 15, scope: !2474)
!2474 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 305, column: 7)
!2475 = !DILocation(line: 305, column: 7, scope: !2474)
!2476 = !DILocation(line: 305, column: 27, scope: !2474)
!2477 = !DILocation(line: 305, column: 33, scope: !2474)
!2478 = !DILocation(line: 306, column: 4, scope: !2474)
!2479 = !DILocation(line: 310, column: 33, scope: !2361)
!2480 = !DILocation(line: 310, column: 38, scope: !2361)
!2481 = !DILocation(line: 310, column: 20, scope: !2361)
!2482 = !DILocation(line: 310, column: 42, scope: !2361)
!2483 = !DILocation(line: 310, column: 3, scope: !2361)
!2484 = !DILocation(line: 311, column: 11, scope: !2361)
!2485 = !DILocation(line: 311, column: 3, scope: !2361)
!2486 = !DILocation(line: 311, column: 23, scope: !2361)
!2487 = !DILocation(line: 311, column: 29, scope: !2361)
!2488 = !DILocation(line: 312, column: 47, scope: !2361)
!2489 = !DILocation(line: 312, column: 57, scope: !2361)
!2490 = !DILocation(line: 312, column: 3, scope: !2361)
!2491 = !DILocation(line: 313, column: 7, scope: !2492)
!2492 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 313, column: 7)
!2493 = !DILocation(line: 313, column: 17, scope: !2492)
!2494 = !DILocation(line: 314, column: 9, scope: !2492)
!2495 = !DILocation(line: 314, column: 4, scope: !2492)
!2496 = !DILocation(line: 316, column: 9, scope: !2492)
!2497 = !DILocation(line: 317, column: 3, scope: !2361)
!2498 = !DILocation(line: 318, column: 3, scope: !2361)
!2499 = !DILocation(line: 320, column: 15, scope: !2500)
!2500 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 320, column: 7)
!2501 = !DILocation(line: 320, column: 7, scope: !2500)
!2502 = !DILocation(line: 320, column: 27, scope: !2500)
!2503 = !DILocation(line: 320, column: 33, scope: !2500)
!2504 = !DILocation(line: 321, column: 4, scope: !2500)
!2505 = !DILocation(line: 325, column: 33, scope: !2361)
!2506 = !DILocation(line: 325, column: 38, scope: !2361)
!2507 = !DILocation(line: 325, column: 20, scope: !2361)
!2508 = !DILocation(line: 325, column: 42, scope: !2361)
!2509 = !DILocation(line: 325, column: 3, scope: !2361)
!2510 = !DILocation(line: 326, column: 11, scope: !2361)
!2511 = !DILocation(line: 326, column: 3, scope: !2361)
!2512 = !DILocation(line: 326, column: 23, scope: !2361)
!2513 = !DILocation(line: 326, column: 29, scope: !2361)
!2514 = !DILocation(line: 327, column: 47, scope: !2361)
!2515 = !DILocation(line: 327, column: 56, scope: !2361)
!2516 = !DILocation(line: 327, column: 3, scope: !2361)
!2517 = !DILocation(line: 328, column: 7, scope: !2518)
!2518 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 328, column: 7)
!2519 = !DILocation(line: 328, column: 17, scope: !2518)
!2520 = !DILocation(line: 329, column: 9, scope: !2518)
!2521 = !DILocation(line: 329, column: 4, scope: !2518)
!2522 = !DILocation(line: 331, column: 9, scope: !2518)
!2523 = !DILocation(line: 332, column: 3, scope: !2361)
!2524 = !DILocation(line: 333, column: 3, scope: !2361)
!2525 = !DILocation(line: 335, column: 15, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 335, column: 7)
!2527 = !DILocation(line: 335, column: 7, scope: !2526)
!2528 = !DILocation(line: 335, column: 27, scope: !2526)
!2529 = !DILocation(line: 335, column: 33, scope: !2526)
!2530 = !DILocation(line: 336, column: 4, scope: !2526)
!2531 = !DILocation(line: 340, column: 33, scope: !2361)
!2532 = !DILocation(line: 340, column: 38, scope: !2361)
!2533 = !DILocation(line: 340, column: 20, scope: !2361)
!2534 = !DILocation(line: 340, column: 42, scope: !2361)
!2535 = !DILocation(line: 340, column: 3, scope: !2361)
!2536 = !DILocation(line: 341, column: 11, scope: !2361)
!2537 = !DILocation(line: 341, column: 3, scope: !2361)
!2538 = !DILocation(line: 341, column: 23, scope: !2361)
!2539 = !DILocation(line: 341, column: 29, scope: !2361)
!2540 = !DILocation(line: 342, column: 48, scope: !2361)
!2541 = !DILocation(line: 342, column: 60, scope: !2361)
!2542 = !DILocation(line: 342, column: 3, scope: !2361)
!2543 = !DILocation(line: 343, column: 7, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 343, column: 7)
!2545 = !DILocation(line: 343, column: 17, scope: !2544)
!2546 = !DILocation(line: 344, column: 9, scope: !2544)
!2547 = !DILocation(line: 344, column: 4, scope: !2544)
!2548 = !DILocation(line: 346, column: 9, scope: !2544)
!2549 = !DILocation(line: 347, column: 3, scope: !2361)
!2550 = !DILocation(line: 348, column: 3, scope: !2361)
!2551 = !DILocation(line: 350, column: 17, scope: !2552)
!2552 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 350, column: 7)
!2553 = !DILocation(line: 350, column: 9, scope: !2552)
!2554 = !DILocation(line: 350, column: 29, scope: !2552)
!2555 = !DILocation(line: 350, column: 35, scope: !2552)
!2556 = !DILocation(line: 350, column: 8, scope: !2552)
!2557 = !DILocation(line: 350, column: 7, scope: !2552)
!2558 = !DILocation(line: 352, column: 12, scope: !2559)
!2559 = distinct !DILexicalBlock(scope: !2552, file: !9, line: 351, column: 3)
!2560 = !DILocation(line: 352, column: 4, scope: !2559)
!2561 = !DILocation(line: 352, column: 24, scope: !2559)
!2562 = !DILocation(line: 352, column: 30, scope: !2559)
!2563 = !DILocation(line: 353, column: 53, scope: !2559)
!2564 = !DILocation(line: 353, column: 4, scope: !2559)
!2565 = !DILocation(line: 354, column: 4, scope: !2559)
!2566 = !DILocation(line: 355, column: 9, scope: !2559)
!2567 = !DILocation(line: 356, column: 3, scope: !2559)
!2568 = !DILocation(line: 358, column: 31, scope: !2552)
!2569 = !DILocation(line: 358, column: 49, scope: !2552)
!2570 = !DILocation(line: 358, column: 4, scope: !2552)
!2571 = !DILocation(line: 359, column: 8, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 359, column: 7)
!2573 = !DILocation(line: 359, column: 13, scope: !2572)
!2574 = !DILocation(line: 359, column: 18, scope: !2572)
!2575 = !DILocation(line: 359, column: 28, scope: !2572)
!2576 = !DILocation(line: 359, column: 17, scope: !2572)
!2577 = !DILocation(line: 360, column: 11, scope: !2572)
!2578 = !DILocation(line: 360, column: 9, scope: !2572)
!2579 = !DILocation(line: 360, column: 4, scope: !2572)
!2580 = !DILocation(line: 361, column: 3, scope: !2361)
!2581 = !DILocalVariable(name: "ammo", scope: !2582, file: !9, line: 366, type: !16)
!2582 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 365, column: 2)
!2583 = !DILocation(line: 366, column: 7, scope: !2582)
!2584 = !DILocation(line: 366, column: 14, scope: !2582)
!2585 = !DILocation(line: 366, column: 19, scope: !2582)
!2586 = !DILocation(line: 366, column: 38, scope: !2582)
!2587 = !DILocation(line: 368, column: 27, scope: !2582)
!2588 = !DILocation(line: 368, column: 32, scope: !2582)
!2589 = !DILocation(line: 368, column: 35, scope: !2582)
!2590 = !DILocation(line: 368, column: 26, scope: !2582)
!2591 = !DILocation(line: 368, column: 10, scope: !2582)
!2592 = !DILocation(line: 368, column: 8, scope: !2582)
!2593 = !DILocation(line: 374, column: 8, scope: !2594)
!2594 = distinct !DILexicalBlock(scope: !2582, file: !9, line: 374, column: 7)
!2595 = !DILocation(line: 374, column: 7, scope: !2594)
!2596 = !DILocation(line: 375, column: 9, scope: !2597)
!2597 = distinct !DILexicalBlock(scope: !2594, file: !9, line: 375, column: 8)
!2598 = !DILocation(line: 375, column: 19, scope: !2597)
!2599 = !DILocation(line: 375, column: 8, scope: !2597)
!2600 = !DILocation(line: 376, column: 10, scope: !2597)
!2601 = !DILocation(line: 376, column: 5, scope: !2597)
!2602 = !DILocation(line: 375, column: 29, scope: !2597)
!2603 = !DILocation(line: 378, column: 7, scope: !2604)
!2604 = distinct !DILexicalBlock(scope: !2582, file: !9, line: 378, column: 7)
!2605 = !DILocation(line: 378, column: 12, scope: !2604)
!2606 = !DILocalVariable(name: "ammo_used", scope: !2607, file: !9, line: 380, type: !16)
!2607 = distinct !DILexicalBlock(scope: !2604, file: !9, line: 379, column: 3)
!2608 = !DILocation(line: 380, column: 8, scope: !2607)
!2609 = !DILocation(line: 381, column: 58, scope: !2607)
!2610 = !DILocation(line: 381, column: 16, scope: !2607)
!2611 = !DILocation(line: 381, column: 14, scope: !2607)
!2612 = !DILocation(line: 382, column: 37, scope: !2607)
!2613 = !DILocation(line: 382, column: 4, scope: !2607)
!2614 = !DILocation(line: 382, column: 9, scope: !2607)
!2615 = !DILocation(line: 382, column: 28, scope: !2607)
!2616 = !DILocation(line: 382, column: 34, scope: !2607)
!2617 = !DILocation(line: 383, column: 9, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2607, file: !9, line: 383, column: 8)
!2619 = !DILocation(line: 383, column: 14, scope: !2618)
!2620 = !DILocation(line: 383, column: 17, scope: !2618)
!2621 = !DILocation(line: 385, column: 56, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2618, file: !9, line: 384, column: 4)
!2623 = !DILocation(line: 385, column: 5, scope: !2622)
!2624 = !DILocation(line: 386, column: 18, scope: !2622)
!2625 = !DILocation(line: 387, column: 8, scope: !2622)
!2626 = !DILocation(line: 388, column: 9, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2622, file: !9, line: 388, column: 9)
!2628 = !DILocation(line: 388, column: 14, scope: !2627)
!2629 = !DILocation(line: 388, column: 33, scope: !2627)
!2630 = !DILocation(line: 388, column: 39, scope: !2627)
!2631 = !DILocation(line: 389, column: 11, scope: !2627)
!2632 = !DILocation(line: 389, column: 6, scope: !2627)
!2633 = !DILocation(line: 390, column: 4, scope: !2622)
!2634 = !DILocation(line: 391, column: 3, scope: !2607)
!2635 = !DILocation(line: 393, column: 3, scope: !2582)
!2636 = !DILocation(line: 397, column: 10, scope: !2361)
!2637 = !DILocation(line: 397, column: 8, scope: !2361)
!2638 = !DILocation(line: 398, column: 8, scope: !2639)
!2639 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 398, column: 7)
!2640 = !DILocation(line: 398, column: 13, scope: !2639)
!2641 = !DILocation(line: 398, column: 18, scope: !2639)
!2642 = !DILocation(line: 398, column: 28, scope: !2639)
!2643 = !DILocation(line: 398, column: 17, scope: !2639)
!2644 = !DILocation(line: 399, column: 11, scope: !2639)
!2645 = !DILocation(line: 399, column: 9, scope: !2639)
!2646 = !DILocation(line: 399, column: 4, scope: !2639)
!2647 = !DILocation(line: 400, column: 3, scope: !2361)
!2648 = !DILocation(line: 402, column: 10, scope: !2361)
!2649 = !DILocation(line: 402, column: 8, scope: !2361)
!2650 = !DILocation(line: 403, column: 8, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 403, column: 7)
!2652 = !DILocation(line: 403, column: 13, scope: !2651)
!2653 = !DILocation(line: 403, column: 18, scope: !2651)
!2654 = !DILocation(line: 403, column: 28, scope: !2651)
!2655 = !DILocation(line: 403, column: 17, scope: !2651)
!2656 = !DILocation(line: 404, column: 11, scope: !2651)
!2657 = !DILocation(line: 404, column: 9, scope: !2651)
!2658 = !DILocation(line: 404, column: 4, scope: !2651)
!2659 = !DILocation(line: 405, column: 3, scope: !2361)
!2660 = !DILocation(line: 407, column: 10, scope: !2361)
!2661 = !DILocation(line: 407, column: 8, scope: !2361)
!2662 = !DILocation(line: 408, column: 8, scope: !2663)
!2663 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 408, column: 7)
!2664 = !DILocation(line: 408, column: 13, scope: !2663)
!2665 = !DILocation(line: 408, column: 18, scope: !2663)
!2666 = !DILocation(line: 408, column: 28, scope: !2663)
!2667 = !DILocation(line: 408, column: 17, scope: !2663)
!2668 = !DILocation(line: 409, column: 11, scope: !2663)
!2669 = !DILocation(line: 409, column: 9, scope: !2663)
!2670 = !DILocation(line: 409, column: 4, scope: !2663)
!2671 = !DILocation(line: 410, column: 3, scope: !2361)
!2672 = !DILocation(line: 413, column: 10, scope: !2361)
!2673 = !DILocation(line: 413, column: 8, scope: !2361)
!2674 = !DILocation(line: 414, column: 8, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 414, column: 7)
!2676 = !DILocation(line: 414, column: 13, scope: !2675)
!2677 = !DILocation(line: 414, column: 18, scope: !2675)
!2678 = !DILocation(line: 414, column: 28, scope: !2675)
!2679 = !DILocation(line: 414, column: 17, scope: !2675)
!2680 = !DILocation(line: 415, column: 11, scope: !2675)
!2681 = !DILocation(line: 415, column: 9, scope: !2675)
!2682 = !DILocation(line: 415, column: 4, scope: !2675)
!2683 = !DILocation(line: 416, column: 3, scope: !2361)
!2684 = !DILocation(line: 419, column: 10, scope: !2361)
!2685 = !DILocation(line: 419, column: 8, scope: !2361)
!2686 = !DILocation(line: 420, column: 8, scope: !2687)
!2687 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 420, column: 7)
!2688 = !DILocation(line: 420, column: 13, scope: !2687)
!2689 = !DILocation(line: 420, column: 18, scope: !2687)
!2690 = !DILocation(line: 420, column: 28, scope: !2687)
!2691 = !DILocation(line: 420, column: 17, scope: !2687)
!2692 = !DILocation(line: 421, column: 11, scope: !2687)
!2693 = !DILocation(line: 421, column: 9, scope: !2687)
!2694 = !DILocation(line: 421, column: 4, scope: !2687)
!2695 = !DILocation(line: 422, column: 3, scope: !2361)
!2696 = !DILocation(line: 425, column: 10, scope: !2361)
!2697 = !DILocation(line: 425, column: 8, scope: !2361)
!2698 = !DILocation(line: 426, column: 7, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 426, column: 7)
!2700 = !DILocation(line: 427, column: 19, scope: !2699)
!2701 = !DILocation(line: 427, column: 24, scope: !2699)
!2702 = !DILocation(line: 427, column: 43, scope: !2699)
!2703 = !DILocation(line: 427, column: 17, scope: !2699)
!2704 = !DILocation(line: 427, column: 4, scope: !2699)
!2705 = !DILocation(line: 428, column: 8, scope: !2706)
!2706 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 428, column: 7)
!2707 = !DILocation(line: 428, column: 13, scope: !2706)
!2708 = !DILocation(line: 428, column: 18, scope: !2706)
!2709 = !DILocation(line: 428, column: 28, scope: !2706)
!2710 = !DILocation(line: 428, column: 17, scope: !2706)
!2711 = !DILocation(line: 429, column: 11, scope: !2706)
!2712 = !DILocation(line: 429, column: 9, scope: !2706)
!2713 = !DILocation(line: 429, column: 4, scope: !2706)
!2714 = !DILocation(line: 430, column: 3, scope: !2361)
!2715 = !DILocation(line: 433, column: 10, scope: !2361)
!2716 = !DILocation(line: 433, column: 8, scope: !2361)
!2717 = !DILocation(line: 434, column: 3, scope: !2361)
!2718 = !DILocation(line: 436, column: 10, scope: !2361)
!2719 = !DILocation(line: 436, column: 8, scope: !2361)
!2720 = !DILocation(line: 437, column: 3, scope: !2361)
!2721 = !DILocation(line: 439, column: 10, scope: !2361)
!2722 = !DILocation(line: 439, column: 8, scope: !2361)
!2723 = !DILocation(line: 440, column: 3, scope: !2361)
!2724 = !DILocation(line: 442, column: 10, scope: !2361)
!2725 = !DILocation(line: 442, column: 8, scope: !2361)
!2726 = !DILocation(line: 443, column: 3, scope: !2361)
!2727 = !DILocation(line: 445, column: 10, scope: !2361)
!2728 = !DILocation(line: 445, column: 8, scope: !2361)
!2729 = !DILocation(line: 446, column: 3, scope: !2361)
!2730 = !DILocation(line: 448, column: 10, scope: !2361)
!2731 = !DILocation(line: 448, column: 8, scope: !2361)
!2732 = !DILocation(line: 449, column: 3, scope: !2361)
!2733 = !DILocation(line: 451, column: 10, scope: !2361)
!2734 = !DILocation(line: 451, column: 8, scope: !2361)
!2735 = !DILocation(line: 452, column: 3, scope: !2361)
!2736 = !DILocation(line: 454, column: 10, scope: !2361)
!2737 = !DILocation(line: 454, column: 8, scope: !2361)
!2738 = !DILocation(line: 455, column: 3, scope: !2361)
!2739 = !DILocation(line: 457, column: 10, scope: !2361)
!2740 = !DILocation(line: 457, column: 8, scope: !2361)
!2741 = !DILocation(line: 458, column: 3, scope: !2361)
!2742 = !DILocation(line: 460, column: 10, scope: !2361)
!2743 = !DILocation(line: 460, column: 8, scope: !2361)
!2744 = !DILocation(line: 461, column: 3, scope: !2361)
!2745 = !DILocation(line: 463, column: 10, scope: !2361)
!2746 = !DILocation(line: 463, column: 8, scope: !2361)
!2747 = !DILocation(line: 464, column: 3, scope: !2361)
!2748 = !DILocation(line: 466, column: 10, scope: !2361)
!2749 = !DILocation(line: 466, column: 8, scope: !2361)
!2750 = !DILocation(line: 467, column: 3, scope: !2361)
!2751 = !DILocation(line: 469, column: 10, scope: !2361)
!2752 = !DILocation(line: 469, column: 8, scope: !2361)
!2753 = !DILocation(line: 470, column: 3, scope: !2361)
!2754 = !DILocation(line: 472, column: 10, scope: !2361)
!2755 = !DILocation(line: 472, column: 8, scope: !2361)
!2756 = !DILocation(line: 473, column: 3, scope: !2361)
!2757 = !DILocation(line: 475, column: 15, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 475, column: 7)
!2759 = !DILocation(line: 475, column: 7, scope: !2758)
!2760 = !DILocation(line: 475, column: 27, scope: !2758)
!2761 = !DILocation(line: 475, column: 33, scope: !2758)
!2762 = !DILocation(line: 477, column: 31, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2758, file: !9, line: 476, column: 3)
!2764 = !DILocation(line: 477, column: 48, scope: !2763)
!2765 = !DILocation(line: 477, column: 4, scope: !2763)
!2766 = !DILocation(line: 478, column: 4, scope: !2763)
!2767 = !DILocation(line: 482, column: 37, scope: !2768)
!2768 = distinct !DILexicalBlock(scope: !2758, file: !9, line: 481, column: 3)
!2769 = !DILocation(line: 482, column: 12, scope: !2768)
!2770 = !DILocation(line: 482, column: 4, scope: !2768)
!2771 = !DILocation(line: 482, column: 24, scope: !2768)
!2772 = !DILocation(line: 482, column: 35, scope: !2768)
!2773 = !DILocation(line: 483, column: 12, scope: !2768)
!2774 = !DILocation(line: 483, column: 4, scope: !2768)
!2775 = !DILocation(line: 483, column: 24, scope: !2768)
!2776 = !DILocation(line: 483, column: 30, scope: !2768)
!2777 = !DILocation(line: 484, column: 4, scope: !2768)
!2778 = !DILocation(line: 489, column: 53, scope: !2768)
!2779 = !DILocation(line: 489, column: 4, scope: !2768)
!2780 = !DILocation(line: 490, column: 9, scope: !2768)
!2781 = !DILocation(line: 491, column: 4, scope: !2768)
!2782 = !DILocation(line: 494, column: 15, scope: !2783)
!2783 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 494, column: 7)
!2784 = !DILocation(line: 494, column: 7, scope: !2783)
!2785 = !DILocation(line: 494, column: 27, scope: !2783)
!2786 = !DILocation(line: 494, column: 33, scope: !2783)
!2787 = !DILocation(line: 496, column: 31, scope: !2788)
!2788 = distinct !DILexicalBlock(scope: !2783, file: !9, line: 495, column: 3)
!2789 = !DILocation(line: 496, column: 48, scope: !2788)
!2790 = !DILocation(line: 496, column: 4, scope: !2788)
!2791 = !DILocation(line: 497, column: 4, scope: !2788)
!2792 = !DILocation(line: 501, column: 44, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2783, file: !9, line: 500, column: 3)
!2794 = !DILocation(line: 501, column: 12, scope: !2793)
!2795 = !DILocation(line: 501, column: 4, scope: !2793)
!2796 = !DILocation(line: 501, column: 24, scope: !2793)
!2797 = !DILocation(line: 501, column: 42, scope: !2793)
!2798 = !DILocation(line: 502, column: 12, scope: !2793)
!2799 = !DILocation(line: 502, column: 4, scope: !2793)
!2800 = !DILocation(line: 502, column: 24, scope: !2793)
!2801 = !DILocation(line: 502, column: 30, scope: !2793)
!2802 = !DILocation(line: 503, column: 59, scope: !2793)
!2803 = !DILocation(line: 503, column: 4, scope: !2793)
!2804 = !DILocation(line: 504, column: 9, scope: !2793)
!2805 = !DILocation(line: 505, column: 4, scope: !2793)
!2806 = !DILocation(line: 509, column: 3, scope: !2361)
!2807 = !DILocation(line: 510, column: 8, scope: !2361)
!2808 = !DILocation(line: 511, column: 3, scope: !2361)
!2809 = !DILocation(line: 515, column: 15, scope: !2810)
!2810 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 515, column: 7)
!2811 = !DILocation(line: 515, column: 7, scope: !2810)
!2812 = !DILocation(line: 515, column: 27, scope: !2810)
!2813 = !DILocation(line: 515, column: 33, scope: !2810)
!2814 = !DILocation(line: 517, column: 31, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2810, file: !9, line: 516, column: 3)
!2816 = !DILocation(line: 517, column: 4, scope: !2815)
!2817 = !DILocation(line: 518, column: 10, scope: !2818)
!2818 = distinct !DILexicalBlock(scope: !2815, file: !9, line: 518, column: 8)
!2819 = !DILocation(line: 518, column: 20, scope: !2818)
!2820 = !DILocation(line: 518, column: 9, scope: !2818)
!2821 = !DILocation(line: 518, column: 8, scope: !2818)
!2822 = !DILocation(line: 519, column: 12, scope: !2818)
!2823 = !DILocation(line: 519, column: 10, scope: !2818)
!2824 = !DILocation(line: 519, column: 5, scope: !2818)
!2825 = !DILocation(line: 520, column: 3, scope: !2815)
!2826 = !DILocation(line: 523, column: 12, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2810, file: !9, line: 522, column: 3)
!2828 = !DILocation(line: 523, column: 4, scope: !2827)
!2829 = !DILocation(line: 523, column: 24, scope: !2827)
!2830 = !DILocation(line: 523, column: 30, scope: !2827)
!2831 = !DILocation(line: 524, column: 4, scope: !2827)
!2832 = !DILocation(line: 525, column: 9, scope: !2827)
!2833 = !DILocation(line: 527, column: 3, scope: !2361)
!2834 = !DILocation(line: 530, column: 15, scope: !2835)
!2835 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 530, column: 7)
!2836 = !DILocation(line: 530, column: 7, scope: !2835)
!2837 = !DILocation(line: 530, column: 27, scope: !2835)
!2838 = !DILocation(line: 530, column: 33, scope: !2835)
!2839 = !DILocation(line: 532, column: 31, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2835, file: !9, line: 531, column: 3)
!2841 = !DILocation(line: 532, column: 4, scope: !2840)
!2842 = !DILocation(line: 533, column: 10, scope: !2843)
!2843 = distinct !DILexicalBlock(scope: !2840, file: !9, line: 533, column: 8)
!2844 = !DILocation(line: 533, column: 20, scope: !2843)
!2845 = !DILocation(line: 533, column: 9, scope: !2843)
!2846 = !DILocation(line: 533, column: 8, scope: !2843)
!2847 = !DILocation(line: 534, column: 12, scope: !2843)
!2848 = !DILocation(line: 534, column: 10, scope: !2843)
!2849 = !DILocation(line: 534, column: 5, scope: !2843)
!2850 = !DILocation(line: 535, column: 3, scope: !2840)
!2851 = !DILocation(line: 538, column: 12, scope: !2852)
!2852 = distinct !DILexicalBlock(scope: !2835, file: !9, line: 537, column: 3)
!2853 = !DILocation(line: 538, column: 4, scope: !2852)
!2854 = !DILocation(line: 538, column: 24, scope: !2852)
!2855 = !DILocation(line: 538, column: 30, scope: !2852)
!2856 = !DILocation(line: 539, column: 9, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2852, file: !9, line: 539, column: 8)
!2858 = !DILocation(line: 539, column: 8, scope: !2857)
!2859 = !DILocation(line: 539, column: 26, scope: !2857)
!2860 = !DILocation(line: 541, column: 13, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2857, file: !9, line: 540, column: 4)
!2862 = !DILocation(line: 541, column: 86, scope: !2861)
!2863 = !DILocation(line: 541, column: 73, scope: !2861)
!2864 = !DILocation(line: 541, column: 5, scope: !2861)
!2865 = !DILocation(line: 542, column: 33, scope: !2861)
!2866 = !DILocation(line: 542, column: 5, scope: !2861)
!2867 = !DILocation(line: 543, column: 4, scope: !2861)
!2868 = !DILocation(line: 545, column: 5, scope: !2857)
!2869 = !DILocation(line: 548, column: 9, scope: !2852)
!2870 = !DILocation(line: 550, column: 3, scope: !2361)
!2871 = !DILocation(line: 553, column: 15, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 553, column: 7)
!2873 = !DILocation(line: 553, column: 7, scope: !2872)
!2874 = !DILocation(line: 553, column: 27, scope: !2872)
!2875 = !DILocation(line: 553, column: 39, scope: !2872)
!2876 = !DILocation(line: 555, column: 12, scope: !2877)
!2877 = distinct !DILexicalBlock(scope: !2872, file: !9, line: 554, column: 3)
!2878 = !DILocation(line: 555, column: 4, scope: !2877)
!2879 = !DILocation(line: 555, column: 24, scope: !2877)
!2880 = !DILocation(line: 555, column: 36, scope: !2877)
!2881 = !DILocation(line: 556, column: 4, scope: !2877)
!2882 = !DILocation(line: 557, column: 3, scope: !2877)
!2883 = !DILocalVariable(name: "old_level", scope: !2884, file: !9, line: 560, type: !16)
!2884 = distinct !DILexicalBlock(scope: !2872, file: !9, line: 559, column: 3)
!2885 = !DILocation(line: 560, column: 8, scope: !2884)
!2886 = !DILocation(line: 560, column: 28, scope: !2884)
!2887 = !DILocation(line: 560, column: 20, scope: !2884)
!2888 = !DILocation(line: 560, column: 40, scope: !2884)
!2889 = !DILocation(line: 562, column: 16, scope: !2890)
!2890 = distinct !DILexicalBlock(scope: !2884, file: !9, line: 562, column: 8)
!2891 = !DILocation(line: 562, column: 8, scope: !2890)
!2892 = !DILocation(line: 562, column: 28, scope: !2890)
!2893 = !DILocation(line: 562, column: 40, scope: !2890)
!2894 = !DILocation(line: 563, column: 13, scope: !2890)
!2895 = !DILocation(line: 563, column: 5, scope: !2890)
!2896 = !DILocation(line: 563, column: 25, scope: !2890)
!2897 = !DILocation(line: 563, column: 37, scope: !2890)
!2898 = !DILocation(line: 564, column: 12, scope: !2884)
!2899 = !DILocation(line: 564, column: 4, scope: !2884)
!2900 = !DILocation(line: 564, column: 24, scope: !2884)
!2901 = !DILocation(line: 564, column: 35, scope: !2884)
!2902 = !DILocation(line: 565, column: 8, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2884, file: !9, line: 565, column: 8)
!2904 = !DILocation(line: 565, column: 22, scope: !2903)
!2905 = !DILocation(line: 566, column: 32, scope: !2903)
!2906 = !DILocation(line: 566, column: 51, scope: !2903)
!2907 = !DILocation(line: 566, column: 43, scope: !2903)
!2908 = !DILocation(line: 566, column: 63, scope: !2903)
!2909 = !DILocation(line: 566, column: 5, scope: !2903)
!2910 = !DILocation(line: 567, column: 83, scope: !2884)
!2911 = !DILocation(line: 567, column: 75, scope: !2884)
!2912 = !DILocation(line: 567, column: 95, scope: !2884)
!2913 = !DILocation(line: 567, column: 107, scope: !2884)
!2914 = !DILocation(line: 567, column: 4, scope: !2884)
!2915 = !DILocation(line: 568, column: 4, scope: !2884)
!2916 = !DILocation(line: 569, column: 8, scope: !2917)
!2917 = distinct !DILexicalBlock(scope: !2884, file: !9, line: 569, column: 8)
!2918 = !DILocation(line: 569, column: 23, scope: !2917)
!2919 = !DILocation(line: 570, column: 5, scope: !2917)
!2920 = !DILocation(line: 571, column: 9, scope: !2884)
!2921 = !DILocation(line: 573, column: 8, scope: !2922)
!2922 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 573, column: 7)
!2923 = !DILocation(line: 573, column: 13, scope: !2922)
!2924 = !DILocation(line: 573, column: 18, scope: !2922)
!2925 = !DILocation(line: 573, column: 28, scope: !2922)
!2926 = !DILocation(line: 573, column: 17, scope: !2922)
!2927 = !DILocation(line: 574, column: 11, scope: !2922)
!2928 = !DILocation(line: 574, column: 9, scope: !2922)
!2929 = !DILocation(line: 574, column: 4, scope: !2922)
!2930 = !DILocation(line: 575, column: 3, scope: !2361)
!2931 = !DILocation(line: 578, column: 15, scope: !2932)
!2932 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 578, column: 7)
!2933 = !DILocation(line: 578, column: 7, scope: !2932)
!2934 = !DILocation(line: 578, column: 27, scope: !2932)
!2935 = !DILocation(line: 578, column: 33, scope: !2932)
!2936 = !DILocation(line: 580, column: 31, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2932, file: !9, line: 579, column: 3)
!2938 = !DILocation(line: 580, column: 4, scope: !2937)
!2939 = !DILocation(line: 581, column: 10, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2937, file: !9, line: 581, column: 8)
!2941 = !DILocation(line: 581, column: 20, scope: !2940)
!2942 = !DILocation(line: 581, column: 9, scope: !2940)
!2943 = !DILocation(line: 581, column: 8, scope: !2940)
!2944 = !DILocation(line: 582, column: 12, scope: !2940)
!2945 = !DILocation(line: 582, column: 10, scope: !2940)
!2946 = !DILocation(line: 582, column: 5, scope: !2940)
!2947 = !DILocation(line: 583, column: 3, scope: !2937)
!2948 = !DILocation(line: 586, column: 12, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2932, file: !9, line: 585, column: 3)
!2950 = !DILocation(line: 586, column: 4, scope: !2949)
!2951 = !DILocation(line: 586, column: 24, scope: !2949)
!2952 = !DILocation(line: 586, column: 30, scope: !2949)
!2953 = !DILocation(line: 590, column: 34, scope: !2949)
!2954 = !DILocation(line: 590, column: 39, scope: !2949)
!2955 = !DILocation(line: 590, column: 21, scope: !2949)
!2956 = !DILocation(line: 590, column: 43, scope: !2949)
!2957 = !DILocation(line: 590, column: 4, scope: !2949)
!2958 = !DILocation(line: 591, column: 4, scope: !2949)
!2959 = !DILocation(line: 592, column: 9, scope: !2949)
!2960 = !DILocation(line: 594, column: 3, scope: !2361)
!2961 = !DILocation(line: 597, column: 15, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 597, column: 7)
!2963 = !DILocation(line: 597, column: 7, scope: !2962)
!2964 = !DILocation(line: 597, column: 27, scope: !2962)
!2965 = !DILocation(line: 597, column: 33, scope: !2962)
!2966 = !DILocation(line: 599, column: 31, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2962, file: !9, line: 598, column: 3)
!2968 = !DILocation(line: 599, column: 4, scope: !2967)
!2969 = !DILocation(line: 600, column: 10, scope: !2970)
!2970 = distinct !DILexicalBlock(scope: !2967, file: !9, line: 600, column: 8)
!2971 = !DILocation(line: 600, column: 20, scope: !2970)
!2972 = !DILocation(line: 600, column: 9, scope: !2970)
!2973 = !DILocation(line: 600, column: 8, scope: !2970)
!2974 = !DILocation(line: 601, column: 12, scope: !2970)
!2975 = !DILocation(line: 601, column: 10, scope: !2970)
!2976 = !DILocation(line: 601, column: 5, scope: !2970)
!2977 = !DILocation(line: 602, column: 3, scope: !2967)
!2978 = !DILocation(line: 605, column: 12, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2962, file: !9, line: 604, column: 3)
!2980 = !DILocation(line: 605, column: 4, scope: !2979)
!2981 = !DILocation(line: 605, column: 24, scope: !2979)
!2982 = !DILocation(line: 605, column: 30, scope: !2979)
!2983 = !DILocation(line: 609, column: 34, scope: !2979)
!2984 = !DILocation(line: 609, column: 39, scope: !2979)
!2985 = !DILocation(line: 609, column: 21, scope: !2979)
!2986 = !DILocation(line: 609, column: 43, scope: !2979)
!2987 = !DILocation(line: 609, column: 4, scope: !2979)
!2988 = !DILocation(line: 610, column: 4, scope: !2979)
!2989 = !DILocation(line: 611, column: 23, scope: !2979)
!2990 = !DILocation(line: 612, column: 9, scope: !2979)
!2991 = !DILocation(line: 614, column: 3, scope: !2361)
!2992 = !DILocation(line: 617, column: 15, scope: !2993)
!2993 = distinct !DILexicalBlock(scope: !2361, file: !9, line: 617, column: 7)
!2994 = !DILocation(line: 617, column: 7, scope: !2993)
!2995 = !DILocation(line: 617, column: 27, scope: !2993)
!2996 = !DILocation(line: 617, column: 33, scope: !2993)
!2997 = !DILocation(line: 619, column: 31, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2993, file: !9, line: 618, column: 3)
!2999 = !DILocation(line: 619, column: 4, scope: !2998)
!3000 = !DILocation(line: 620, column: 10, scope: !3001)
!3001 = distinct !DILexicalBlock(scope: !2998, file: !9, line: 620, column: 8)
!3002 = !DILocation(line: 620, column: 20, scope: !3001)
!3003 = !DILocation(line: 620, column: 9, scope: !3001)
!3004 = !DILocation(line: 620, column: 8, scope: !3001)
!3005 = !DILocation(line: 621, column: 12, scope: !3001)
!3006 = !DILocation(line: 621, column: 10, scope: !3001)
!3007 = !DILocation(line: 621, column: 5, scope: !3001)
!3008 = !DILocation(line: 622, column: 3, scope: !2998)
!3009 = !DILocalVariable(name: "msg", scope: !3010, file: !9, line: 625, type: !3011)
!3010 = distinct !DILexicalBlock(scope: !2993, file: !9, line: 624, column: 3)
!3011 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 800, elements: !3012)
!3012 = !{!3013}
!3013 = !DISubrange(count: 100)
!3014 = !DILocation(line: 625, column: 9, scope: !3010)
!3015 = !DILocation(line: 626, column: 12, scope: !3010)
!3016 = !DILocation(line: 626, column: 4, scope: !3010)
!3017 = !DILocation(line: 626, column: 24, scope: !3010)
!3018 = !DILocation(line: 626, column: 30, scope: !3010)
!3019 = !DILocation(line: 630, column: 34, scope: !3010)
!3020 = !DILocation(line: 630, column: 39, scope: !3010)
!3021 = !DILocation(line: 630, column: 21, scope: !3010)
!3022 = !DILocation(line: 630, column: 43, scope: !3010)
!3023 = !DILocation(line: 630, column: 4, scope: !3010)
!3024 = !DILocation(line: 631, column: 12, scope: !3010)
!3025 = !DILocation(line: 631, column: 55, scope: !3010)
!3026 = !DILocation(line: 631, column: 4, scope: !3010)
!3027 = !DILocation(line: 632, column: 32, scope: !3010)
!3028 = !DILocation(line: 632, column: 4, scope: !3010)
!3029 = !DILocation(line: 633, column: 8, scope: !3030)
!3030 = distinct !DILexicalBlock(scope: !3010, file: !9, line: 633, column: 8)
!3031 = !DILocation(line: 634, column: 13, scope: !3030)
!3032 = !DILocation(line: 634, column: 5, scope: !3030)
!3033 = !DILocation(line: 634, column: 25, scope: !3030)
!3034 = !DILocation(line: 634, column: 31, scope: !3030)
!3035 = !DILocation(line: 635, column: 9, scope: !3010)
!3036 = !DILocation(line: 641, column: 3, scope: !2361)
!3037 = !DILocation(line: 654, column: 3, scope: !2361)
!3038 = !DILocation(line: 667, column: 3, scope: !2361)
!3039 = !DILocation(line: 679, column: 3, scope: !2361)
!3040 = !DILocation(line: 685, column: 3, scope: !2361)
!3041 = !DILocation(line: 692, column: 7, scope: !3042)
!3042 = distinct !DILexicalBlock(scope: !2297, file: !9, line: 692, column: 6)
!3043 = !DILocation(line: 692, column: 12, scope: !3042)
!3044 = !DILocation(line: 692, column: 15, scope: !3042)
!3045 = !DILocation(line: 692, column: 29, scope: !3042)
!3046 = !DILocation(line: 692, column: 45, scope: !3042)
!3047 = !DILocation(line: 692, column: 32, scope: !3042)
!3048 = !DILocation(line: 692, column: 49, scope: !3042)
!3049 = !DILocation(line: 692, column: 59, scope: !3042)
!3050 = !DILocation(line: 697, column: 33, scope: !3051)
!3051 = distinct !DILexicalBlock(scope: !3042, file: !9, line: 692, column: 65)
!3052 = !DILocation(line: 697, column: 20, scope: !3051)
!3053 = !DILocation(line: 697, column: 37, scope: !3051)
!3054 = !DILocation(line: 697, column: 3, scope: !3051)
!3055 = !DILocation(line: 698, column: 35, scope: !3051)
!3056 = !DILocation(line: 698, column: 39, scope: !3051)
!3057 = !DILocation(line: 698, column: 3, scope: !3051)
!3058 = !DILocation(line: 699, column: 2, scope: !3051)
!3059 = !DILocation(line: 701, column: 16, scope: !2297)
!3060 = !DILocation(line: 702, column: 9, scope: !2297)
!3061 = !DILocation(line: 702, column: 2, scope: !2297)
!3062 = !DILocation(line: 703, column: 1, scope: !2297)
