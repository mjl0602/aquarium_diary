import 'package:aquarium_diary/style/color.dart';
import 'package:flutter/material.dart';

const double _kBodyRadius = 10;
const double _kDotViewHeight = 30;
const double _kDotViewWidth = 15;
const double _kDotTouchExpandedSize = 6;
const double _kDotSize = _kDotViewHeight + _kDotTouchExpandedSize;

class VolumnSlider extends StatefulWidget {
  final double value;
  final int max;
  final Color color;
  final Widget Function(BuildContext, double)? dotBuilder;
  final IconData Function(double)? iconBuilder;
  final Function(int)? onEnd;
  final Function(double)? onScroll;

  const VolumnSlider({
    Key? key,
    required this.value,
    this.onEnd,
    this.color = StColor.primary,
    this.iconBuilder,
    this.onScroll,
    this.max = 4,
    this.dotBuilder,
  }) : super(key: key);

  @override
  State<VolumnSlider> createState() => _VolumnSliderState();
}

extension _FindRenderObject on GlobalKey {
  RenderBox? get renderObject =>
      currentContext?.findRenderObject() as RenderBox?;
}

class _VolumnSliderState extends State<VolumnSlider>
    with TickerProviderStateMixin {
  var bodyKey = GlobalKey();
  var bodyWidth = 375.0;

  int get max => widget.max;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        bodyWidth = bodyKey.renderObject?.paintBounds.width ?? 0;
        controller.value = widget.value / max;
      });
    });
  }

  @override
  void didUpdateWidget(covariant VolumnSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      bodyWidth = bodyKey.renderObject?.paintBounds.width ?? 375;
      controller.value = widget.value / max;
    });
  }

  double get left {
    return ((bodyWidth - _kBodyRadius) * controller.value).clamp(
          0.0,
          bodyWidth - _kBodyRadius,
        ) +
        _kDotViewWidth / 2;
  }

  double startOffset = 0;
  double startValue = 0;

  late AnimationController controller = AnimationController(vsync: this);

  slideEnd() async {
    var target = (controller.value * max).round();
    widget.onEnd?.call(target);
    await controller.animateTo(
      target / max,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: _kDotSize / 2),
            child: _SliderBody(
              key: bodyKey,
              value: controller.value * max,
              bodyWidth: bodyWidth,
              max: max / 1,
              color: widget.color,
            ),
          ),
          GestureDetector(
            onPanDown: (details) {
              startOffset = details.globalPosition.dx;
              startValue = controller.value;
            },
            onHorizontalDragUpdate: (details) {
              var dx = details.globalPosition.dx - startOffset;
              setState(() {
                controller.value = (startValue + dx / bodyWidth).clamp(0, 1);
                widget.onScroll?.call(controller.value);
              });
            },
            onHorizontalDragEnd: (details) {
              slideEnd();
            },
            onHorizontalDragCancel: () {
              slideEnd();
            },
            child: Container(
              margin: EdgeInsets.only(left: left),
              child: _Dot(
                bodyWidth: bodyWidth,
                color: widget.color,
                icon:
                    widget.iconBuilder?.call(controller.value * max) ??
                    Icons.help_outline,
                childBuilder: (ctx) =>
                    widget.dotBuilder?.call(ctx, controller.value * max),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.bodyWidth,
    required this.color,
    required this.icon,
    this.childBuilder,
  }) : super(key: key);

  final double bodyWidth;
  final Color color;
  final IconData icon;
  final Widget? Function(BuildContext)? childBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_kDotTouchExpandedSize),
      color: StColor.clear,
      child: Container(
        height: _kDotViewHeight,
        width: _kDotViewWidth,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999),
          ),
          shadows: [
            BoxShadow(
              color: StColor.black.withOpacity(0.12),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
          color: color,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(color: StColor.white, width: 3),
          ),
          // child: ,
        ),
      ),
    );
  }
}

class _SliderBody extends StatelessWidget {
  const _SliderBody({
    Key? key,
    required this.value,
    required this.max,
    required this.bodyWidth,
    required this.color,
  }) : super(key: key);

  final double value;
  final double max;
  final double bodyWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 8,
        child: Stack(
          children: <Widget>[
            Container(color: StColor.lightGray),
            Container(
              width:
                  (bodyWidth - _kBodyRadius * 2) * value / max + _kBodyRadius,
              color: color,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _kBodyRadius),
              height: _kBodyRadius * 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // for (var i = 0; i < max - 1; i++) ...[
                  //   Spacer(),
                  //   Container(
                  //     height: 14,
                  //     width: 4,
                  //     decoration: BoxDecoration(
                  //       color: value < i + 1
                  //           ? color.withOpacity(0.1)
                  //           : StColor.white.withOpacity(0.20),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ],
                  // Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
