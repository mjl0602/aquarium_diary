import 'dart:ui';

import 'package:aquarium_diary/views/chart/lineChart.dart';
import 'package:aquarium_diary/views/chart/model/chartData.dart';
import 'package:flutter/material.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/views/chart/model/chartSummaryData.dart';
import 'package:aquarium_diary/views/chart/tools/YAxisScal.dart';

class BarChart extends StatefulWidget {
  final List<ChartData> list;
  final Color? color;
  final Color Function(int)? xTagColorBuilder;
  final Color Function(int index, int value)? barColorBuilder;
  const BarChart({
    Key? key,
    required this.list,
    this.color,
    this.xTagColorBuilder,
    this.barColorBuilder,
  }) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> with TickerProviderStateMixin {
  // List<>
  List<ChartData> get list => widget.list;

  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 400),
  );

  @override
  void initState() {
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
    animationController.animateTo(1, curve: Curves.easeInOutCubic);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Row(
          //   children: [
          //     for (final item in widget.summaryDatas)
          //       Expanded(child: SummaryCell(item: item)),
          //   ],
          // ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                child: CustomPaint(
                  painter: BarChartPainter(
                    list: list,
                    heightScale: animationController.value,
                    color: widget.color,
                    xTagColorBuilder: widget.xTagColorBuilder,
                    barColorBuilder: widget.barColorBuilder,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 绘制表格
class BarChartPainter extends CustomPainter {
  final List<ChartData> list;
  final Color? color;
  final double heightScale;
  final Color Function(int)? xTagColorBuilder;
  final Color Function(int index, int value)? barColorBuilder;

  BarChartPainter({
    this.color,
    required this.list,
    required this.heightScale,
    this.xTagColorBuilder,
    this.barColorBuilder,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 初始化到全局
    _canvas = canvas;
    // _size = size;
    padding = EdgeInsets.fromLTRB(12, 14, 40, 40);
    tableHeight = size.height - padding.top - padding.bottom;
    tableWidth = size.width - padding.left - padding.right;

    /// 绘制表格背景
    drawChartBgTable();

    /// 绘制数据
    drawData();
  }

  /// 绘制数据
  drawData() {
    var chartPaddingH = list.length > 10 ? 12 : 22;
    var step =
        (tableWidth - chartPaddingH * 2) / (list.length - 1).clamp(1, 100);
    var valueWidth = list.length > 10 ? 8.0 : 20.0;
    for (var index = 0; index < list.length; index++) {
      ChartData data = list[index];
      if (data.value == null) continue;
      var positionOffset = Offset(
        padding.left + chartPaddingH + index * step,
        tableHeight + padding.top,
      );
      var valueHeight1 = (data.value! / chartMax) * tableHeight * heightScale;
      bool blank = valueHeight1 == 0;
      var _color =
          barColorBuilder?.call(index, data.value! ~/ 1) ??
          color ??
          StColor.primary;
      if (blank) {
        valueHeight1 = 4;
        _color = _color.withOpacity(_color.opacity * 0.2);
      }
      drawGradientRect(
        Rect.fromLTWH(
          positionOffset.dx - valueWidth / 2,
          positionOffset.dy - valueHeight1,
          valueWidth,
          valueHeight1,
        ),
        [_color, _color],
        2,
      );
      if (list.length == 24) {
        if (![0, 6, 12, 18, 24].contains(index)) continue;
      } else if ([28, 29, 30, 31].contains(list.length)) {
        if (![0, 7, 14, 21, 28].contains(index)) continue;
      } else {
        if (list.length > 20) {
          if (index % 5 != 0) continue;
        }
      }
      drawTextValue(
        '${data.label}',
        Offset(positionOffset.dx, positionOffset.dy + 16),
        xTagColorBuilder?.call(index),
      );
    }
  }

  drawGradientRect(Rect rect, List<Color> colors, double radius) {
    // 创建一个LinearGradient对象
    LinearGradient gradient = LinearGradient(
      colors: colors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // stops: [0.0, 0.5],
    );

    // 创建一个Paint对象
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect);

    // 使用Canvas对象的drawRect方法来绘制矩形
    _canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        rect.left,
        rect.top,
        rect.right,
        rect.bottom,
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        // bottomLeft: Radius.circular(radius),
        // bottomRight: Radius.circular(radius),
      ),
      paint,
    );
  }

  late Canvas _canvas;
  // late Size _size;
  late double tableHeight;
  late double tableWidth;
  late EdgeInsets padding;
  late int chartMax = 0;

  /// 绘制表格背景
  drawChartBgTable() {
    /// 绘制边框
    _canvas.drawPath(
      Path()
        ..moveTo(padding.left, padding.top)
        ..lineTo(padding.left, padding.top + tableHeight),
      Paint()
        ..color = StColor.lightGray
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
    _canvas.drawPath(
      Path()
        ..moveTo(tableWidth + padding.left, padding.top)
        ..lineTo(tableWidth + padding.left, padding.top + tableHeight),
      Paint()
        ..color = StColor.lightGray
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );

    // 绘制
    double max = list.asMap()[0]?.value ?? 0.0;
    double min = list.asMap()[0]?.value ?? 0.0;
    for (var data in list) {
      if (data.value == null) continue;
      if (data.value! < min) min = data.value!;
      if (data.value! > max) max = data.value!;
    }

    final yAxisScale = YAxisData.calculateYScale(max / 1);
    chartMax = yAxisScale.gridCount * yAxisScale.stepSize ~/ 1; // 计算出真正的最大值

    var lines = List.generate(
      yAxisScale.gridCount + 1,
      (index) => tableHeight / (yAxisScale.gridCount).clamp(1, 100) * index,
    );

    for (int i = 0; i < lines.length; i++) {
      var offsetY = lines[i];
      // if (padding.top + offsetY > tableHeight + padding.top) continue;
      // drawDashLine(
      //   start: Offset(padding.left, padding.top + offsetY),
      //   end: Offset(tableWidth + padding.left, padding.top + offsetY),
      //   dashPattern: [5.0, 5.0],
      // );
      drawTextRight(
        '${yAxisScale.stepSize * (lines.length - 1 - i)}',
        Offset(tableWidth + padding.left + 8, padding.top + offsetY),
      );
    }
  }

  drawTextRight(String text, Offset offset) {
    // 创建一个TextPainter对象
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: StColor.gray, fontSize: 12),
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    // 调用layout方法来计算文本的尺寸
    textPainter.layout();
    // 调用paint方法来绘制文本
    textPainter.paint(
      _canvas,
      Offset(offset.dx, offset.dy - textPainter.height / 2),
    );
  }

  drawTextValue(String text, Offset offset, Color? color) {
    // 创建一个TextPainter对象
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color ?? StColor.halfGray, fontSize: 12),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    // 调用layout方法来计算文本的尺寸
    textPainter.layout();
    // 调用paint方法来绘制文本
    textPainter.paint(
      _canvas,
      Offset(
        offset.dx - textPainter.width / 2,
        offset.dy - textPainter.height / 2,
      ),
    );
  }

  /// 画一条虚线
  drawDashLine({
    required Offset start,
    required Offset end,
    required List<double> dashPattern,
  }) {
    Paint paint = Paint()
      ..color = StColor.lightGray
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);

    // 计算虚线的路径
    Path dashedPath = Path();
    double dashOffset = 0;
    bool draw = true;
    for (PathMetric metric in path.computeMetrics()) {
      while (dashOffset < metric.length) {
        double dashLength = dashPattern[dashOffset ~/ 1 % dashPattern.length];
        if (draw) {
          // 绘制实线部分
          dashedPath.addPath(
            metric.extractPath(dashOffset / 1, dashOffset + dashLength),
            Offset.zero,
          );
        }
        // 切换实线和空白部分
        draw = !draw;
        // 增加偏移量
        dashOffset += dashLength;
      }
    }
    // 使用canvas.drawPath方法来绘制虚线
    _canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
