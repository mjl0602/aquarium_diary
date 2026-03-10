// lib/style/color.dart
import 'package:flutter/material.dart';

class StColor {
  //
  // 层次灰色
  //
  static const Color black = Color(0xff1A2B3C);        // 深海黑蓝
  static const Color darkGray = Color(0xff2E4A5E);     // 深海灰蓝
  static const Color gray = Color(0xff5B7A8C);          // 海水灰蓝
  static const Color halfGray = Color(0xff8FB0C1);     // 浅海蓝灰
  static const Color lightGray = Color(0xffE8F4F8);    // 泡沫白蓝
  static const Color white = Color(0xffF5FBFF);        // 浪花白
  static const Color clear = Color(0x00000000);

  //
  // 专属色 - 海洋主题
  //
  static const Color primary = deepBlue;

  // 海水色系
  static const Color deepBlue = Color(0xff0A4F6B);     // 深海蓝
  static const Color oceanBlue = Color(0xff1A8BB0);   // 海洋蓝
  static const Color waveBlue = Color(0xff4ECDC4);     // 波浪青
  static const Color foamBlue = Color(0xffA8E6CF);     // 泡沫薄荷
  
  // 珊瑚色系
  static const Color coral = Color(0xffFF6B6B);       // 珊瑚红
  static const Color coralPink = Color(0xffFF8E8E);   // 珊瑚粉
  static const Color coralOrange = Color(0xffFFA07A);  // 珊瑚橙
  static const Color coralYellow = Color(0xffFFD93D);  // 珊瑚黄
  
  // 海藻与沙
  static const Color seaweed = Color(0xff2D5A3D);     // 海藻绿
  static const Color sand = Color(0xffF4E4C1);        // 沙滩金
  static const Color pearl = Color(0xffE8F0E8);        // 珍珠白

  // 功能色
  static const Color warning = Color(0xffFF9F43);      // 警示橙
  static const Color success = Color(0xff10AC84);      // 成功绿
  static const Color error = Color(0xffEE5253);        // 错误红

  //
  // 渐变
  //
  // 深海渐变
  static List<Color> get gradientDeepOcean => [
    const Color(0xff0A4F6B),
    const Color(0xff1A8BB0),
    const Color(0xff4ECDC4),
  ];

  // 珊瑚渐变
  static List<Color> get gradientCoral => [
    const Color(0xffFF6B6B),
    const Color(0xffFFA07A),
    const Color(0xffFFD93D),
  ];

  // 沙滩渐变
  static List<Color> get gradientSand => [
    const Color(0xffF4E4C1),
    const Color(0xffE8F4F8),
  ];

  // 气泡渐变
  static List<Color> get gradientBubble => [
    const Color(0xffA8E6CF),
    const Color(0xff4ECDC4),
    const Color(0xff1A8BB0),
  ];
}