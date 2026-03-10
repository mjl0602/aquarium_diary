import 'package:flutter/material.dart';

/// 表格数据
abstract class ChartData {
  double? get value;
  List<double> get values;
  Color get color;
  String get label;
  bool get isMuti;

  ChartData();

  /// 单点的数据，适用于柱状图，折线图
  factory ChartData.formSingle({
    required String label,
    required Color color,
    required double? value,
  }) {
    return ChartSinglePointData(value: value, label: label, color: color);
  }
}

/// 单点的数据，适用于柱状图，折线图
class ChartSinglePointData extends ChartData {
  final double? value;
  final Color color;
  final String label;

  bool get isMuti => false;
  List<double> get values => value == null ? [] : [value!];

  ChartSinglePointData({
    required this.value,
    required this.label,
    required this.color,
  });
}
