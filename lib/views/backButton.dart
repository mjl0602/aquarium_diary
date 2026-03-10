import 'package:flutter/material.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/views/shape.dart';
import 'package:tapped/tapped.dart';

class StBackButton extends StatelessWidget {
  final Future<bool> Function()? onWillPop;

  const StBackButton({Key? key, this.onWillPop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tapped(
      onTap: () async {
        if (await onWillPop?.call() == true) {
          Navigator.of(context).pop();
        } else if (onWillPop == null) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 4),
        color: ColorPlate.clear,
        child: Arrow(direction: ArrowDirection.left),
      ),
    );
  }
}
