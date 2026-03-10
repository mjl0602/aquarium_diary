import 'package:flutter/cupertino.dart';

class Disabled extends StatelessWidget {
  final bool disabled;
  final double disabledOpacity;
  final Widget? loading;
  final Widget child;

  const Disabled({
    Key? key,
    required this.child,
    this.disabled= true,
    this.loading,
    this.disabledOpacity = 0.3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (!disabled) {
      return child;
    }
    Widget body = AbsorbPointer(
      absorbing: true,
      child: Opacity(
        opacity: disabledOpacity,
        child: child,
      ),
    );
    if (loading != null) {
      body = Stack(
        alignment: Alignment.center,
        children: [
          body,
          Center(
            child: loading ?? CupertinoActivityIndicator(),
          ),
        ],
      );
    }
    return body;
  }
}
