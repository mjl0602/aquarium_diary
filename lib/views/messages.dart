import 'dart:async';
import 'dart:math';

import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';

Set<void Function(String)> _callers = {};

class ToastMessageView extends StatefulWidget {
  static showToast(String str) {
    _callers.last.call(str);
  }

  const ToastMessageView({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<ToastMessageView> createState() => _ToastMessageViewState();
}

class _ToastMessageViewState extends State<ToastMessageView> {
  @override
  void initState() {
    super.initState();
    _callers.add(_showMessage);
  }

  _showMessage(String msg) {
    setState(() {
      msgs.add(_Msg(msg));
    });
  }

  Set<_Msg> msgs = {};

  @override
  void dispose() {
    _callers.remove(_showMessage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        widget.child,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var msg in msgs)
                _MsgTag(
                  key: Key(msg.key),
                  title: msg.content,
                  onRemove: () {
                    setState(() {
                      msgs.remove(msg);
                    });
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Msg {
  final String content;
  final String key;

  _Msg(this.content)
    : this.key =
          content +
          '${DateTime.now().millisecondsSinceEpoch}' +
          '${Random().nextInt(9999)}';
}

class _MsgTag extends StatefulWidget {
  const _MsgTag({Key? key, required this.title, required this.onRemove})
    : super(key: key);

  final String title;
  final Function onRemove;

  @override
  State<_MsgTag> createState() => _MsgTagState();
}

class _MsgTagState extends State<_MsgTag> {
  bool isShow = false;
  bool dismiss = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((s) {
      setState(() {
        isShow = true;
      });
    });
    Timer(Duration(milliseconds: 1600), () {
      setState(() {
        dismiss = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 330),
      curve: Curves.easeInOutCubic,
      opacity: (isShow && !dismiss) ? 1 : 0,
      child: AnimatedAlign(
        duration: Duration(milliseconds: 330),
        curve: Curves.easeInOutCubic,
        alignment: Alignment.bottomCenter,
        heightFactor: dismiss ? 0 : 1,
        onEnd: () {
          widget.onRemove();
        },
        child: Container(
          decoration: ShapeDecoration(
            color: ColorPlate.black.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4000),
            ),
          ),
          constraints: BoxConstraints(maxWidth: 280),
          margin: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          child: StText.small(
            widget.title,
            style: TextStyle(color: ColorPlate.white),
          ),
        ),
      ),
    );
  }
}
