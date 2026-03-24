extension StDateFormat on DateTime {
  String get yyyyMMddhhmmss => TimeFormatter.formatReportDate(this)!;
  String get yyyyMMdd => TimeFormatter.formatBasicDay(this)!;
  String get mmss => TimeFormatter.formatMMSS(this)!;
}

extension StDurationFormat on Duration {
  String get hhmmss {
    var microseconds = inMicroseconds;
    var sign = "";
    var negative = microseconds < 0;

    var hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);

    // Correcting for being negative after first division, instead of before,
    // to avoid negating min-int, -(2^31-1), of a native int64.
    if (negative) {
      hours = 0 - hours; // Not using `-hours` to avoid creating -0.0 on web.
      microseconds = 0 - microseconds;
      sign = "-";
    }

    var minutes = microseconds ~/ Duration.microsecondsPerMinute;
    microseconds = microseconds.remainder(Duration.microsecondsPerMinute);

    var seconds = microseconds ~/ Duration.microsecondsPerSecond;
    microseconds = microseconds.remainder(Duration.microsecondsPerSecond);

    // Padding up to six digits for microseconds.
    var microsecondsText = microseconds.toString().padLeft(6, "0");

    return [
      if (hours != 0)
        "$sign$hours"
            'h',
      "$minutes"
          'min',
      "$seconds"
          's',
      if (microseconds > 0) ".$microsecondsText",
    ].join('');
  }
}

class TimeFormatter {
  /// 2020/02/02 20:20:00
  static String? formatReportDate(DateTime? old) {
    if (old == null) return null;
    return '${_f2(old.year)}-${_f2(old.month)}-${_f2(old.day)} ${_f2(old.hour)}:${_f2(old.minute)}:${_f2(old.second)}';
  }

  static int? ageOf(DateTime? birth) {
    if (birth == null) return null;
    final now = DateTime.now();
    int age = now.year - birth.year;
    // 如果当前日期还没有到达出生日期的月份和日子，则年龄减1
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age;
  }

  /// 2020-02-02
  static String? formatBasicDay(DateTime? old) {
    if (old == null) return null;
    return '${_f2(old.year)}-${_f2(old.month)}-${_f2(old.day)}';
  }

  static String? formatMMSS(DateTime? old) {
    if (old == null) return null;
    return '${_f2(old.minute)}M${_f2(old.second)}S';
  }

  /// 补足到两位
  static String _f2(int i) {
    return '$i'.padLeft(2, '0');
  }
}
