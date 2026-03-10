import 'dart:ui';

import 'package:flutter/material.dart';

class OffstageIfKeyboardShow extends StatefulWidget {
  final Widget? child;

  const OffstageIfKeyboardShow({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  _OffstageIfKeyboardShowState createState() => _OffstageIfKeyboardShowState();
}

class _OffstageIfKeyboardShowState extends State<OffstageIfKeyboardShow>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    setState(() {});
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: MediaQueryData.fromWindow(window).viewInsets.bottom > 0,
      child: widget.child,
    );
  }
}
