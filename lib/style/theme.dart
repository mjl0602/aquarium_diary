import 'package:flutter/services.dart';

import 'color.dart';
import 'size.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData standard() => ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    hintColor: ColorPlate.primary,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      //设置Material的默认字体样式
      // bodyText2: TextStyle(
      //   color: ColorPlate.darkGray,
      //   fontSize: SysSize.normal,
      // ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: ColorPlate.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: ColorPlate.darkGray),
    ),
    primaryColor: ColorPlate.primary,
    scaffoldBackgroundColor: ColorPlate.lightGray,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPlate.primary,
      selectionColor: ColorPlate.primary.withOpacity(0.5),
      selectionHandleColor: ColorPlate.primary,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorPlate.primary,
    ),
  );
}
