

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aquarium_diary/style/color.dart';

extension EasyPush on Widget {
  Future<T?> pushAsPage<T>(
    BuildContext context, {
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (ctx) => this,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  Future<T?> pushAsActionSheet<T>(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: StColor.clear,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      builder: (ctx) => this,
    );
  }

  Future<T?> pushAsBlurDialog<T>(
    BuildContext context,
  ) {
    return Navigator.of(context).push<T>(
      BlurDialogRoute(
        builder: (ctx) => this,
      ),
    );
  }
}

class BlurDialogRoute<T> extends RawDialogRoute<T> {
  BlurDialogRoute({
    required Widget Function(BuildContext) builder,
  }) : super(
          barrierColor: StColor.clear,
          transitionDuration: Duration(milliseconds: 300),
          transitionBuilder: (
            BuildContext context,
            Animation<double> ani1,
            Animation<double> ani2,
            Widget child,
          ) {
            var ani = CurvedAnimation(
              parent: ani1, //动画样式
              curve: Curves.fastOutSlowIn, //动画曲线
            );
            //左右滑动
            return FadeTransition(
              //渐变过渡 0.0-1.0
              opacity: Tween(begin: 0.0, end: 1.0).animate(ani),
              child: child,
            );
          },
          pageBuilder: (context, ani1, ani2) {
            return AnimatedBlur(
              child: builder(context),
            );
          },
        );
}

class AnimatedBlur extends StatefulWidget {
  const AnimatedBlur({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<AnimatedBlur> createState() => _AnimatedBlurState();
}

class _AnimatedBlurState extends State<AnimatedBlur>
    with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    controller.addListener(_update);
    controller.animateTo(
      1,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  _update() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4 + 2 * controller.value,
        sigmaY: 4 + 2 * controller.value,
      ),
      child: Opacity(
        opacity: 0.4 + controller.value * 0.6,
        child: widget.child,
      ),
    );
  }
}
