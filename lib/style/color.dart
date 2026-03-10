import 'package:flutter/material.dart';

class StColor {
  // 层次灰色 - 明亮柔和，带蓝色倾向
  static const Color black = Color(0xff1F2A3A); // 深海黑（柔和）
  static const Color darkGray = Color(0xff2E405B); // 深海灰蓝
  static const Color gray = Color(0xff5C7A9A); // 海水灰蓝
  static const Color halfGray = Color(0xff9BB7D4); // 浅海蓝灰
  static const Color lightGray = Color(0xffE3F0FA); // 泡沫蓝白
  static const Color white = Color(0xffF9FCFF); // 浪花白（微蓝）
  static const Color clear = Color(0x00000000);

  // 专属色 - 海洋主题，明亮活力
  static const Color primary = oceanBlue; // 主色采用海洋蓝

  // 海水色系 - 明亮的蓝色调
  static const Color deepBlue = Color(0xff1E5F9E); // 深海亮蓝
  static const Color oceanBlue = Color(0xff3A9BDC); // 海洋蓝（鲜艳）
  static const Color waveBlue = Color(0xff56C8D8); // 波浪青（明亮青蓝）
  static const Color foamBlue = Color(0xffA2E0F0); // 泡沫薄荷（浅蓝）

  // 珊瑚色系 - 充满活力的暖色
  static const Color coral = Color(0xffFF6F61); // 珊瑚橙红
  static const Color coralPink = Color(0xffFF8A80); // 珊瑚粉
  static const Color coralOrange = Color(0xffFFAB76); // 珊瑚橙
  static const Color coralYellow = Color(0xffFFD166); // 珊瑚黄（明亮）

  // 海藻与沙 - 自然点缀
  static const Color seaweed = Color(0xff32B87A); // 海藻绿（鲜绿）
  static const Color sand = Color(0xffF9E79F); // 沙滩金（淡黄）
  static const Color pearl = Color(0xffF0F5FA); // 珍珠白（暖白）

  // 功能色 - 醒目且清晰
  static const Color warning = Color(0xffFFA726); // 警示橙
  static const Color success = Color(0xff4CD964); // 成功绿（鲜亮）
  static const Color error = Color(0xffFF3B30); // 错误红（亮红）

  // 渐变 - 组合明亮色彩
  // 深海渐变（深蓝→海洋蓝→波浪青）
  static List<Color> get gradientDeepOcean => [
    const Color(0xff1E5F9E),
    const Color(0xff3A9BDC),
    const Color(0xff56C8D8),
  ];

  // 珊瑚渐变（珊瑚橙红→珊瑚橙→珊瑚黄）
  static List<Color> get gradientCoral => [
    const Color(0xffFF6F61),
    const Color(0xffFFAB76),
    const Color(0xffFFD166),
  ];

  // 沙滩渐变（沙滩金→珍珠白）
  static List<Color> get gradientSand => [
    const Color(0xffF9E79F),
    const Color(0xffF0F5FA),
  ];

  // 气泡渐变（泡沫薄荷→波浪青→海洋蓝）
  static List<Color> get gradientBubble => [
    const Color(0xffA2E0F0),
    const Color(0xff56C8D8),
    const Color(0xff3A9BDC),
  ];
}
