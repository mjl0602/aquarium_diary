import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
    required this.buttonText,
    this.onTap,
    this.isLoading = false,
    this.primary = false,
    this.margin,
    this.height,
    this.backgoundColor,
    this.shadow = false,
  }) : super(key: key);

  final String buttonText;
  final Function? onTap;
  final bool isLoading;
  final bool primary;
  final bool shadow;
  final EdgeInsets? margin;
  final double? height;
  final Color? backgoundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (!isLoading) {
            onTap?.call();
          }
        },
        child: Container(
          height: height ?? 44,
          width: double.infinity,
          padding: margin ?? EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              shadows: shadow
                  ? [BoxShadow(color: ColorPlate.primary.withOpacity(0.1))]
                  : [],
              color:
                  backgoundColor ??
                  (primary ? ColorPlate.primary : ColorPlate.lightGray),
            ),
            child: IndexedStack(
              alignment: Alignment.center,
              index: isLoading ? 0 : 1,
              children: <Widget>[
                CupertinoActivityIndicator(),
                Container(
                  child: StText.big(
                    buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary ? ColorPlate.white : ColorPlate.primary,
                    ),
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
