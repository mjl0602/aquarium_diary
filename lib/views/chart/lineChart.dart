import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/views/chart/model/chartSummaryData.dart';
import 'package:aquarium_diary/views/chart/tools/YAxisScal.dart';

import 'dart:math' as math;
import 'model/chartData.dart';

get _lineColor => StColor.halfGray.withOpacity(0.5);

class LineChart extends StatefulWidget {
  final List<ChartData> list;
  final String unit;
  final int xDesity;
  final int valueCountMax;
  final int valueCountMin;
  final double leftWidth;
  final double minValue;
  final bool fillArea;
  final Color color;
  const LineChart({
    Key? key,
    required this.list,
    this.color = StColor.primary,
    this.minValue = 0,
    this.fillArea = true,
    required this.unit,
    required this.leftWidth,
    required this.xDesity,
    required this.valueCountMax,
    required this.valueCountMin,
  }) : super(key: key);

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> with TickerProviderStateMixin {
  List<ChartData> get list => widget.list;

  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 600),
  );

  /// 实际上的最小值
  double minValue = 0;

  @override
  void initState() {
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
    animationController.animateTo(1, curve: Curves.easeInOutCubic);
    setUpMinValue();
  }

  @override
  void didUpdateWidget(covariant LineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    setUpMinValue();
  }

  setUpMinValue() {
    double min = widget.minValue;
    for (var children in list) {
      for (var child in children.values) {
        if (child < min) min = 0;
      }
    }
    minValue = min;
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
          //     for (final item in widget.summaryDatas ?? [])
          //       Expanded(child: SummaryCell(item: item)),
          //   ],
          // ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                child: CustomPaint(
                  painter: LineChartPainter(
                    list: list,
                    minY: minValue,
                    heightScale: animationController.value,
                    color: widget.color,
                    fillArea: widget.fillArea,
                    unit: widget.unit,
                    leftWidth: widget.leftWidth,
                    xDesity: widget.xDesity,
                    valueCountMax: widget.valueCountMax,
                    valueCountMin: widget.valueCountMin,
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
class LineChartPainter extends CustomPainter {
  final List<ChartData> list;
  final Color color;
  final double heightScale;
  final double minY;
  final bool fillArea;
  final String unit;
  final double leftWidth;
  final int xDesity;
  final int valueCountMax;
  final int valueCountMin;

  LineChartPainter({
    required this.minY,
    required this.fillArea,
    required this.list,
    required this.color,
    required this.heightScale,
    required this.unit,
    required this.leftWidth,
    required this.xDesity,
    required this.valueCountMax,
    required this.valueCountMin,
  });

  List<ChartData?> get targetList {
    // 如果 list 为空，用 null 填充到 min 数量
    if (list.isEmpty) {
      return List<ChartData?>.filled(valueCountMin, null);
    }

    // 截取最多 max 数量
    final truncated = list.length > valueCountMax
        ? list.sublist(list.length - valueCountMax) // 取最后 max 个（最新的数据）
        : List<ChartData>.from(list);

    // 如果不足 min 数量，前面用 null 填充
    if (truncated.length < valueCountMin) {
      final padding = List<ChartData?>.filled(
        valueCountMin - truncated.length,
        null,
      );
      return [...truncated, ...padding];
    }

    return truncated;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // 初始化到全局
    _canvas = canvas;
    // _size = size;

    padding = EdgeInsets.fromLTRB(leftWidth, 14, 12, 32);
    tableHeight = size.height - padding.top - padding.bottom;
    tableWidth = size.width - padding.left - padding.right;

    /// 绘制表格背景
    drawChartBgTable();

    /// 绘制数据
    drawData();
  }

  /// 曲线与版边之间留出的空白
  double get chartPaddingH => 0;

  /// 绘制数据
  drawData() {
    var step = (tableWidth - chartPaddingH * 2) / valueCountMax;
    var _w = 6.0;
    // if (list.length > 20) _w = 5.0;

    List<Offset?> targets = [];

    Offset? maxPointPosition;
    String? maxPointPositionText;
    Offset? minPointPosition;
    String? minPointPositionText;

    for (var index = 0; index < targetList.length; index++) {
      ChartData? data = targetList[index];
      var positionOffset = Offset(
        padding.left + chartPaddingH + index * step,
        tableHeight + padding.top,
      );
      if (data?.value == null) {
        targets.add(null);
      } else {
        /// 计算坐标点
        var valueHeight =
            ((data!.value! - minY) / (chartMax - minY)) *
            tableHeight *
            heightScale;
        final offset = Offset(
          positionOffset.dx,
          positionOffset.dy - valueHeight,
        );
        targets.add(offset);

        // 找到最大和最小
        if (minPointPosition == null) minPointPosition = offset;
        if (maxPointPosition == null) maxPointPosition = offset;
        if (offset.dy <= minPointPosition.dy) {
          minPointPositionText = data.value?.toStringAsFixed(0);
          minPointPosition = offset;
        }
        if (offset.dy >= maxPointPosition.dy) {
          maxPointPositionText = data.value?.toStringAsFixed(0);
          maxPointPosition = offset;
        }
        // 让点看上去比较稀疏
        if (targetList.length > 10) {
          if (index % xDesity != xDesity - 1 && index > 0) continue;
        }

        drawTextBottom(
          '${data.label}',
          Offset(positionOffset.dx, positionOffset.dy + 16),
        );
      }
    }

    List<List<Offset>> lines = [[]];
    // 按null切割线
    for (var offset in targets) {
      if (offset == null) {
        lines.add([]);
      } else {
        lines.last.add(offset);
      }
    }
    for (var eachLine in lines) {
      // 画线
      drawMainLine(
        _canvas,
        fillArea: fillArea,
        values: eachLine,
        lineColor: color,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1],
          colors: <Color>[color.withOpacity(0.2), color.withOpacity(0)],
        ),
      );
      if (targets.length > 3) {
        // 绘制点
        for (var offset in eachLine) {
          if (offset == maxPointPosition) {
            drawBorderDot(offset, _w, _w / 2, color);
            drawBubbleForPoint(
              maxPointPosition!,
              maxPointPositionText ?? '--',
              false,
            );
          } else if (offset == minPointPosition) {
            drawBorderDot(offset, _w, _w / 2, color);
            drawBubbleForPoint(
              minPointPosition!,
              minPointPositionText ?? '--',
              true,
            );
          }
        }
      }
      // if (targets.length <= 20 || eachLine.length == 1) {
      //   // 绘制点
      //   for (var offset in eachLine) {
      //     drawDot(
      //       offset,
      //       _w,
      //       color,
      //     );
      //     drawDot(
      //       offset,
      //       _w - 4,
      //       StColor.white,
      //     );
      //   }
      // }
    }
  }

  drawBubbleForPoint(Offset pt, String msg, bool bottom) {
    // 创建一个TextPainter对象
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: msg,
        style: TextStyle(
          color: StColor.white,
          height: oneLineH,
          fontSize: 12,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    // 调用layout方法来计算文本的尺寸
    textPainter.layout();
    // 调用paint方法来绘制文本
    final textPadding = EdgeInsets.symmetric(horizontal: 4, vertical: 1);
    final textBubbleSize = Size(
      textPainter.width + textPadding.left + textPadding.right,
      textPainter.height + textPadding.top + textPadding.bottom,
    );

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.8 * color.opacity);
    final yAxis = bottom ? -1 : 1;
    final basicPoint = Offset(pt.dx, pt.dy + 4 * yAxis);
    final arrowSize = Size(6, 4);

    Path linePath = Path()..moveTo(basicPoint.dx, basicPoint.dy);
    linePath.lineTo(
      basicPoint.dx + arrowSize.width / 2,
      basicPoint.dy + (arrowSize.height) * yAxis,
    );
    linePath.lineTo(
      basicPoint.dx + textBubbleSize.width / 2,
      basicPoint.dy + (arrowSize.height) * yAxis,
    );
    linePath.lineTo(
      basicPoint.dx + textBubbleSize.width / 2,
      basicPoint.dy + (arrowSize.height + textBubbleSize.height) * yAxis,
    );
    linePath.lineTo(
      basicPoint.dx - textBubbleSize.width / 2,
      basicPoint.dy + (arrowSize.height + textBubbleSize.height) * yAxis,
    );
    linePath.lineTo(
      basicPoint.dx - textBubbleSize.width / 2,
      basicPoint.dy + (arrowSize.height) * yAxis,
    );
    linePath.lineTo(
      basicPoint.dx - arrowSize.width / 2,
      basicPoint.dy + (arrowSize.height) * yAxis,
    );
    _canvas.drawPath(linePath, paint);
    textPainter.paint(
      _canvas,
      Offset(
        basicPoint.dx - textBubbleSize.width / 2 + textPadding.left,
        basicPoint.dy +
            textPadding.top +
            (arrowSize.height) * yAxis -
            (bottom ? textBubbleSize.height : 0),
      ),
    );
  }

  drawBorderDot(Offset offset, double size, double border, Color color) {
    drawDot(offset, size, color);
    drawDot(offset, size - border, StColor.white);
  }

  /// 绘制关键点
  drawDot(Offset offset, double size, Color color) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    final realRect = Rect.fromLTWH(
      offset.dx - size / 2,
      offset.dy - size / 2,
      size,
      size,
    );
    _canvas.drawOval(
      Rect.fromLTRB(
        realRect.left,
        realRect.top,
        realRect.right,
        realRect.bottom,
      ),
      paint,
    );
  }

  /// 绘制曲线并填充曲线区域
  void drawMainLine(
    Canvas canvas, {
    required bool fillArea,
    required List<Offset> values,
    required Color lineColor,
    required LinearGradient gradient,
  }) {
    if (values.length == 0) return;
    if (values.length == 1) {
      drawBorderDot(values.single, 4, 2, lineColor);
      return;
    }
    final Offset first = values.first;

    final double smooth = 0.4;

    late final Path linePath;

    // By https://github.com/apache/echarts/blob/master/src/chart/line/poly.ts
    if (values.length > 2 && smooth > 0.0) {
      // Is first coordinate
      linePath = Path()..moveTo(first.dx, first.dy);
      Offset controlPoint0 = Offset(first.dx, first.dy);
      Offset prev = Offset(first.dx, first.dy);

      late Offset controlPoint1;

      for (int index = 1; index < values.length - 1; index++) {
        final Offset current = values[index];
        final Offset next = values[index + 1];

        double ratio = 0.5;
        Offset vector = Offset.zero;
        late Offset nextControlPoint0;

        vector = Offset(next.dx - prev.dx, next.dy - prev.dy);

        final Offset d0 = Offset(current.dx - prev.dx, current.dy - prev.dy);
        final Offset d1 = Offset(next.dx - current.dx, next.dy - current.dy);

        final double lenPrevSeg = d0.distance;
        final double lenNextSeg = d1.distance;

        // Use ratio of segment length.
        ratio = lenNextSeg / (lenNextSeg + lenPrevSeg);

        controlPoint1 = Offset(
          current.dx - vector.dx * smooth * (1 - ratio),
          current.dy - vector.dy * smooth * (1 - ratio),
        );

        // controlPoint0 of next segment.
        nextControlPoint0 = Offset(
          current.dx + vector.dx * smooth * ratio,
          current.dy + vector.dy * smooth * ratio,
        );

        // Smooth constraint between point and next point.
        // Avoid exceeding extreme after smoothing.
        nextControlPoint0 = Offset(
          nextControlPoint0.dx.clamp(
            math.min(next.dx, current.dx),
            math.max(next.dx, current.dx),
          ),
          nextControlPoint0.dy.clamp(
            math.min(next.dy, current.dy),
            math.max(next.dy, current.dy),
          ),
        );

        // Recalculate controlPoint1 based on the adjusted controlPoint0 of next
        // segment.
        vector = Offset(
          nextControlPoint0.dx - current.dx,
          nextControlPoint0.dy - current.dy,
        );

        controlPoint1 = Offset(
          current.dx - vector.dx * lenPrevSeg / lenNextSeg,
          current.dy - vector.dy * lenPrevSeg / lenNextSeg,
        );

        // Smooth constraint between point and pre point.
        // Avoid exceeding extreme after smoothing.
        controlPoint1 = Offset(
          controlPoint1.dx.clamp(
            math.min(prev.dx, current.dx),
            math.max(prev.dx, current.dx),
          ),
          controlPoint1.dy.clamp(
            math.min(prev.dy, current.dy),
            math.max(prev.dy, current.dy),
          ),
        );

        // Adjust nextControlPoint0 again.
        vector = Offset(
          current.dx - controlPoint1.dx,
          current.dy - controlPoint1.dy,
        );
        nextControlPoint0 = Offset(
          current.dx + vector.dx * lenNextSeg / lenPrevSeg,
          current.dy + vector.dy * lenNextSeg / lenPrevSeg,
        );

        linePath.cubicTo(
          controlPoint0.dx,
          controlPoint0.dy,
          controlPoint1.dx,
          controlPoint1.dy,
          current.dx,
          current.dy,
        );

        controlPoint0 = Offset(nextControlPoint0.dx, nextControlPoint0.dy);
        prev = Offset(current.dx, current.dy);
      }

      // Is last coordinate
      final Offset last = values.last;
      linePath.cubicTo(
        controlPoint0.dx,
        controlPoint0.dy,
        last.dx,
        last.dy,
        last.dx,
        last.dy,
      );
    } else {
      linePath = values
          .skip(1)
          .fold<Path>(
            Path()..moveTo(first.dx, first.dy),
            (Path path, Offset offset) => path..lineTo(offset.dx, offset.dy),
          );
    }

    final _linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // _canvas.drawPath(linePath , _linePaint);

    final PathMetrics pathMetrics = linePath.computeMetrics();

    for (final PathMetric pathMetric in pathMetrics) {
      final double progress = pathMetric.length * heightScale;

      final Tangent? tangent = pathMetric.getTangentForOffset(progress);

      final Path fillAreaPath;

      final Path path = pathMetric.extractPath(0, progress);

      canvas.drawPath(path, _linePaint..color = lineColor);
      if (!fillArea) continue;
      fillAreaPath = Path.from(path)
        ..lineTo(tangent?.position.dx ?? 0.0, tableHeight + padding.top)
        ..lineTo(first.dx, tableHeight + padding.top)
        ..close();
      final topDy = values.map((e) => e.dy).minDouble;

      canvas.drawPath(
        fillAreaPath,
        Paint()
          ..shader = gradient.createShader(
            Rect.fromLTWH(
              first.dx,
              topDy,
              values.last.dx - first.dx,
              tableHeight + padding.top - topDy,
            ),
          ),
      );
    }
  }

  late Canvas _canvas;
  // late Size _size;
  late double tableHeight;
  late double tableWidth;
  late EdgeInsets padding;
  late double chartMax = 0.0;

  /// 绘制表格背景
  drawChartBgTable() {
    /// 绘制边框

    _canvas.drawPath(
      Path()
        ..moveTo(padding.left, padding.top)
        ..lineTo(padding.left, padding.top + tableHeight),
      Paint()
        ..color = _lineColor
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
    _canvas.drawPath(
      Path()
        ..moveTo(tableWidth + padding.left, padding.top)
        ..lineTo(tableWidth + padding.left, padding.top + tableHeight),
      Paint()
        ..color = _lineColor
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );

    // 绘制
    double maxValue = targetList.asMap()[0]?.values.maxDouble ?? 0;
    for (ChartData? data in targetList) {
      if (data == null) continue;
      for (var item in data.values) {
        if (item > maxValue) maxValue = item;
      }
    }
    final yAxisScale = YAxisData.calculateYScale(maxValue - minY);
    chartMax =
        yAxisScale.gridCount * yAxisScale.stepSize.clamp(1, double.infinity) +
        minY; // 计算出真正的最大值

    var lines = List.generate(
      yAxisScale.gridCount + 1,
      (index) => tableHeight / (yAxisScale.gridCount).clamp(1, 100) * index,
    );

    for (int i = 0; i < lines.length; i++) {
      var offsetY = lines[i];

      drawDashLine(
        start: Offset(padding.left, padding.top + offsetY),
        end: Offset(tableWidth + padding.left, padding.top + offsetY),
        dashPattern: [5.0, 5.0],
      );
      drawTextRight(
        '${(yAxisScale.stepSize * (lines.length - 1 - i) + minY).toInt()}${unit}',
        Offset(0, padding.top + offsetY),
      );
    }
  }

  drawTextRight(String text, Offset offset) {
    // 创建一个TextPainter对象
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: StColor.black, fontSize: 12),
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

  drawTextBottom(String text, Offset offset) {
    // 创建一个TextPainter对象
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: StColor.black, fontSize: 12),
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
      ..color = _lineColor
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
