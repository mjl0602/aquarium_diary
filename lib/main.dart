import 'dart:async';
import 'dart:io';

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/global/userDefault.dart';
import 'package:aquarium_diary/pages/homePage.dart';
import 'package:aquarium_diary/style/theme.dart';
import 'package:fconsole/fconsole.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_cache_sync/local_cache_sync.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

typedef ErrHandler =
    void Function(Zone, ZoneDelegate, Zone, Object, StackTrace);

void main() async {
  runAppWithFConsole(
    OKToast(
      radius: 4,
      backgroundColor: StColor.black.withOpacity(0.6),
      dismissOtherOnShow: true,
      child: MyApp(),
    ),
    beforeRun: () async {
      WidgetsFlutterBinding.ensureInitialized();
      LocalCacheSync.instance!.setCachePath(
        await getApplicationSupportDirectory(),
        'TangSonicCache/',
      );
      UserDefaultSync.setCachePath(
        await getApplicationSupportDirectory(),
        'TangSonicCache/',
      );
      await DataBase.init();
      if (kReleaseMode) {
        /// 自定义报错页面
        ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
          debugPrint(flutterErrorDetails.toString());
          return Material(
            child: Center(child: Text('页面崩溃了', textAlign: TextAlign.center)),
          );
        };
      } else {
        WakelockPlus.enable();
      }
    },
  );

  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (UserDefault.fconsoleShow.value == true || kDebugMode) {
        showConsole();
      } else {
        hideConsole();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquarium Diary',
      theme: buildOceanTheme(),
      home: HomePage(),
    );
  }
}
