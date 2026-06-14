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
    BuildContext context, {
    double maxHeightRatio = 0.85,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: StColor.clear,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeightRatio,
      ),
      builder: (ctx) {
        Widget content = this;
        return content;
      },
    );
  }

  Future<T?> pushAsDialog<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    Color? barrierColor,
    EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16, 24, 16, 24),
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(12),
    ),
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (ctx) {
        Widget dialogContent = this;
        dialogContent = ClipRRect(
          borderRadius: borderRadius,
          child: dialogContent,
        );
        return Padding(padding: padding, child: dialogContent);
      },
    );
  }
}
