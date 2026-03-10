import 'package:flutter/services.dart';

import 'color.dart';
import 'size.dart';
import 'package:flutter/material.dart';

// lib/style/theme.dart
import 'package:flutter/material.dart';
import 'color.dart';

ThemeData buildOceanTheme() {
  return ThemeData(
    // 主色调
    primaryColor: StColor.deepBlue,
    primaryColorLight: StColor.oceanBlue,
    primaryColorDark: StColor.black,

    // 强调色 - 珊瑚色
    colorScheme: ColorScheme.light(
      primary: StColor.deepBlue,
      secondary: StColor.coral,
      surface: StColor.white,
      background: StColor.lightGray,
      error: StColor.error,
      onPrimary: StColor.white,
      onSecondary: StColor.white,
      onSurface: StColor.black,
      onBackground: StColor.black,
      onError: StColor.white,
    ),

    // 背景色
    scaffoldBackgroundColor: StColor.lightGray,
    canvasColor: StColor.white,

    // AppBar主题
    appBarTheme: AppBarTheme(
      backgroundColor: StColor.white,
      foregroundColor: StColor.deepBlue,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: StColor.deepBlue,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(color: StColor.oceanBlue),
    ),

    // 卡片主题 - 不使用阴影，使用边框
    cardTheme: CardThemeData(
      color: StColor.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: StColor.halfGray.withOpacity(0.3), width: 1),
      ),
      margin: EdgeInsets.zero,
    ),

    // 按钮主题
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: StColor.deepBlue,
        foregroundColor: StColor.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // 文本按钮
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: StColor.oceanBlue,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // 输入框主题
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: StColor.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: StColor.halfGray, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: StColor.halfGray, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: StColor.oceanBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: StColor.error, width: 1),
      ),
      labelStyle: TextStyle(color: StColor.gray),
      hintStyle: TextStyle(color: StColor.halfGray),
    ),

    // 底部导航栏
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: StColor.white,
      selectedItemColor: StColor.coral,
      unselectedItemColor: StColor.gray,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),

    // 浮动按钮
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: StColor.coral,
      foregroundColor: StColor.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // 分割线
    dividerTheme: DividerThemeData(
      color: StColor.halfGray.withOpacity(0.5),
      thickness: 1,
      space: 1,
    ),

    // Chip主题
    chipTheme: ChipThemeData(
      backgroundColor: StColor.lightGray,
      disabledColor: StColor.halfGray,
      selectedColor: StColor.oceanBlue.withOpacity(0.1),
      secondarySelectedColor: StColor.coral.withOpacity(0.1),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.transparent),
      ),
      labelStyle: TextStyle(color: StColor.darkGray, fontSize: 14),
      secondaryLabelStyle: TextStyle(
        color: StColor.coral,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),

    // 文字主题
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: StColor.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: StColor.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: StColor.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: StColor.darkGray,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: StColor.darkGray, fontSize: 16, height: 1.5),
      bodyMedium: TextStyle(color: StColor.gray, fontSize: 14, height: 1.5),
      bodySmall: TextStyle(color: StColor.halfGray, fontSize: 12),
    ),

    // 对话框
    dialogTheme: DialogThemeData(
      backgroundColor: StColor.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: TextStyle(
        color: StColor.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // 底部Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: StColor.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),

    // 列表瓦片
    listTileTheme: ListTileThemeData(
      iconColor: StColor.oceanBlue,
      textColor: StColor.darkGray,
      tileColor: StColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // 开关
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StColor.coral;
        }
        return StColor.halfGray;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StColor.coral.withOpacity(0.3);
        }
        return StColor.halfGray.withOpacity(0.3);
      }),
    ),

    // 滑块
    sliderTheme: SliderThemeData(
      activeTrackColor: StColor.oceanBlue,
      inactiveTrackColor: StColor.halfGray.withOpacity(0.3),
      thumbColor: StColor.coral,
      overlayColor: StColor.coral.withOpacity(0.2),
    ),

    // 指示器
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: StColor.oceanBlue,
      circularTrackColor: StColor.halfGray.withOpacity(0.3),
    ),
  );
}
