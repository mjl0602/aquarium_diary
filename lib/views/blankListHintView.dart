import 'package:flutter/material.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';

class BlankListHintView extends StatelessWidget {
  final bool isBlank;
  final Widget? action;
  final Widget? replacement;
  final Widget child;
  const BlankListHintView({
    Key? key,
    required this.isBlank,
    required this.child,
    this.action,
    this.replacement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isBlank) return child;
    return Center(
      child:
          replacement ??
          Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.list,
                    size: 120,
                    color: StColor.gray.withOpacity(0.1),
                  ),
                ),
                StText.small('List is empty'),
                action ?? Container(),
              ],
            ),
          ),
    );
  }
}
