import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/size.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tapped/tapped.dart';

class StButton extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Color color;
  final bool background;
  final bool tailIcon;
  final Color? backgroundColor;
  final bool medium;
  final bool primary;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double space;
  final double radius;
  final Function? onTap;

  const StButton({
    Key? key,
    this.icon,
    required this.title,
    this.onTap,
    this.color = ColorPlate.primary,
    this.background = true,
    this.primary = false,
    this.medium = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.margin = EdgeInsets.zero,
    this.space = 4,
    this.radius = 8,
    this.backgroundColor,
    this.tailIcon = false,
  }) : super(key: key);

  Color get textColor {
    return primary ? ColorPlate.white : color;
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      if (icon != null)
        Container(
          child: Icon(
            icon,
            size: medium ? SysSize.huge : SysSize.normal,
            color: textColor,
          ),
        ),
      if (icon != null) Container(width: space),
      Flexible(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: StText.medium(
            title,
            style: TextStyle(
              height: oneLineH,
              color: textColor,
              fontWeight: medium ? FontWeight.bold : FontWeight.normal,
              fontSize: medium ? SysSize.normal : SysSize.small,
            ),
          ),
        ),
      ),
    ];
    return Tapped(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: background ? color.withOpacity(primary ? 1 : 0.1) : null,
          borderRadius: BorderRadius.circular(radius),
        ).copyWith(color: backgroundColor),
        padding: padding,
        margin: margin,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: tailIcon ? children.reversed.toList() : children,
        ),
      ),
    );
  }
}
