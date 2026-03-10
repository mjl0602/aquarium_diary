import 'dart:math';

import 'package:flutter/material.dart';

enum ArrowDirection {
  up,
  right,
  down,
  left,
}

// 画个箭头
class Arrow extends StatelessWidget {
  final double size;
  final double weight;
  final Color? color;
  final bool round;
  final ArrowDirection direction;

  const Arrow({
    Key? key,
    this.weight = 2,
    this.size = 16,
    this.color,
    this.round = true,
    this.direction = ArrowDirection.right,
  }) : super(key: key);

  const Arrow.left({
    Key? key,
    this.weight = 2,
    this.size = 16,
    this.color,
    this.round = true,
  })  : this.direction = ArrowDirection.left,
        super(key: key);
  const Arrow.right({
    Key? key,
    this.weight = 2,
    this.size = 16,
    this.color,
    this.round = true,
  })  : this.direction = ArrowDirection.right,
        super(key: key);

  const Arrow.up({
    Key? key,
    this.weight = 2,
    this.size = 16,
    this.color,
    this.round = true,
  })  : this.direction = ArrowDirection.up,
        super(key: key);

  const Arrow.down({
    Key? key,
    this.weight = 2,
    this.size = 16,
    this.color,
    this.round = true,
  })  : this.direction = ArrowDirection.down,
        super(key: key);

  double? get _angel {
    double? a;
    switch (direction) {
      case ArrowDirection.up:
        a = pi * 0.25;
        break;
      case ArrowDirection.right:
        a = pi * 0.75 * 1;
        break;
      case ArrowDirection.down:
        a = pi * -0.75;
        break;
      case ArrowDirection.left:
        a = pi * -0.25;
        break;
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size,
        width: size,
        child: Transform.rotate(
          angle: _angel!,
          child: Container(
            margin: EdgeInsets.fromLTRB(size / 4, size / 4, 0, 0),
            child: Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: weight,
                  decoration: BoxDecoration(
                    color: color ?? Colors.black,
                    borderRadius: BorderRadius.circular(weight / 2),
                  ),
                ),
                Container(
                  width: weight,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: color ?? Colors.black,
                    borderRadius:
                        round ? BorderRadius.circular(weight / 2) : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
