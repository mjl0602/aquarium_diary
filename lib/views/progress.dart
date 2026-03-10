import 'package:aquarium_diary/style/color.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final double progress;
  final double height;
  final Color color;
  final bool reversed;

  const Progress({
    Key? key,
    this.progress = 1.0,
    this.height = 8,
    this.color = StColor.primary,
    this.reversed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(color: StColor.lightGray),
            Container(
              width: double.infinity,
              child: FractionallySizedBox(
                alignment: !reversed
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                heightFactor: 1,
                widthFactor: progress,
                child: Container(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
