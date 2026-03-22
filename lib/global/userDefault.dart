import 'dart:io';
import 'dart:ui';

import 'package:local_cache_sync/local_cache_sync.dart';

const kApiCacheChannel = 'api_cache';

class UserDefault {
  /// 判断第一次进入App
  static var notFirstOpen = DefaultValueCache<bool>('notFirstOpen', false);

  static var homePageAQ = DefaultValueCache<int?>('homePageAQ', null);

  /// 可调试
  static var canDebug = DefaultValueCache('canDebug', false);
  static var fconsoleShow = DefaultValueCache('fconsoleShow', false);
  static var debugHomePage = DefaultValueCache('debugHomePage', false);

  static var isAgreePrivacy = DefaultValueCache<bool>('isAgreePrivacy', false);

  static Locale? get locale {
    String? str = LocalCacheSync.userDefault['locale'];
    if (str == null || str == '') return null;
    var l = str.split('-');
    return Locale(l.first, l.last);
  }

  static set locale(Locale? locale) {
    if (locale == null) {
      LocalCacheSync.userDefault['locale'] = Locale('en', 'US').toLanguageTag();
      return;
    }
    LocalCacheSync.userDefault['locale'] = locale.toLanguageTag();
  }
}
