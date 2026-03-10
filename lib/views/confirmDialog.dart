import 'package:flutter/material.dart';
import 'package:aquarium_diary/l10n/generated/l10n.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:aquarium_diary/views/input.dart';
import 'package:tapped/tapped.dart';

const String titleText = 'Result';
const String cancelText = 'Cancel';
const String closeText = 'Close';
const String okText = 'OK';

enum ConfirmType {
  info,
  success,
  warning,
  danger,
}

textOfConfirmType(ConfirmType type) => [
      'Info',
      'Success',
      'Warn',
      'Error',
    ][type.index];

/// 输入多行文本，可以通过onWillConfirm方法检查
Future<String?> inputMutiLineText(
  BuildContext context, {
  ConfirmType? type,
  String? text,
  String? title,
  String? hintText,
  String? ok,
  String? cancel,
  Future<bool> Function(String)? onWillConfirm,
}) async {
  InputHelper temp = InputHelper(defaultText: text);
  var res = await confirm(
    context,
    type: ConfirmType.warning,
    title: title,
    ok: ok,
    cancel: cancel,
    onWillConfirm: () async => (await onWillConfirm?.call(temp.text)) ?? true,
    contentBuilder: (ctx) => StTextField(
      autofocus: true,
      max: 10000000,
      maxLines: 10,
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      helper: temp,
      hintText: hintText,
    ),
  );
  if (res == true) {
    return temp.text;
  }
  return null;
}

/// 输入文本，可以通过onWillConfirm方法检查
Future<String?> inputText(
  BuildContext context, {
  ConfirmType? type,
  String? text,
  int? maxLength,
  String? title,
  String? hintText,
  String? tips,
  String? ok,
  String? cancel,
  TextInputType? textInputType,
  Future<bool> Function(String)? onWillConfirm,
}) async {
  InputHelper temp = InputHelper(defaultText: text);
  var res = await confirm(
    context,
    type: type,
    title: title,
    ok: ok,
    cancel: cancel,
    onWillConfirm: () async => (await onWillConfirm?.call(temp.text)) ?? true,
    contentBuilder: (ctx) => Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      child: Column(
        children: [
          if (tips != null)
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 12,
                left: 6,
                right: 6,
              ),
              child: StText.small(tips),
            ),
          Container(
            decoration: BoxDecoration(
              color: ColorPlate.lightGray,
              borderRadius: BorderRadius.circular(6),
            ),
            child: StInput.helper(
              autofocus: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              inputType: textInputType,
              maxLength: maxLength ?? 64,
              clearable: true,
              helper: temp,
              hintText: hintText,
            ),
          ),
        ],
      ),
    ),
  );
  if (res == true) {
    return temp.text;
  }
  return null;
}

/// 显示对话窗口
Future<bool?> confirm(
  BuildContext context, {
  String? title,
  String? content,
  Widget Function(BuildContext)? contentBuilder,
  Future<bool> Function()? onWillConfirm,
  String? ok,
  String? cancel,
  ConfirmType? type,
  double? width,
  bool onlyCloseButton = false,
  bool onlyContent = false,
  bool barrierDismissible = true,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => _ConfirmDialog(
      title: title,
      content: content,
      contentWidgetBuilder: contentBuilder,
      onWillConfirm: onWillConfirm,
      ok: ok,
      cancel: cancel,
      type: type ?? ConfirmType.info,
      width: width ?? 300,
      onlyCloseButton: onlyCloseButton,
      onlyContent: onlyContent,
    ),
  );
}

class ResMsg<T> {
  final bool success;
  final String msg;
  final T? data;

  ResMsg(this.success, this.msg, this.data);
  ResMsg.success(String msg, [data]) : this(true, msg, data);
  ResMsg.fail(String msg, [data]) : this(false, msg, data);

  @override
  String toString() {
    return 'ResMsg:$success $msg $data';
  }
}

/// 使用ResMsg显示对话窗口
Future<bool?> confirmResMsg(context, ResMsg<dynamic> msg, [String? title]) {
  return confirm(
    context,
    title: title,
    content: msg.msg,
    type: msg.success ? ConfirmType.success : ConfirmType.danger,
  );
}

class _ConfirmDialog extends StatelessWidget {
  final ConfirmType type;
  final String? title;
  final String? content;
  final Widget Function(BuildContext)? contentWidgetBuilder;
  final double width;
  final String? ok;
  final String? cancel;
  final bool onlyCloseButton;
  final bool onlyContent;
  final Future<bool> Function()? onWillConfirm;

  const _ConfirmDialog({
    Key? key,
    this.title,
    this.content,
    this.ok,
    this.cancel,
    this.type = ConfirmType.info,
    this.width = 300,
    this.onlyCloseButton = false,
    this.contentWidgetBuilder,
    this.onWillConfirm,
    this.onlyContent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData? iconData;
    Color? color;
    switch (type) {
      case ConfirmType.danger:
        iconData = Icons.info;
        color = ColorPlate.error;
        break;
      case ConfirmType.info:
        iconData = Icons.info;
        color = ColorPlate.primary;
        break;
      case ConfirmType.success:
        iconData = Icons.info_outline;
        color = ColorPlate.primary;
        break;
      case ConfirmType.warning:
        iconData = Icons.warning;
        color = Colors.orange;
        break;
    }

    Widget icon = Container(
      padding: EdgeInsets.only(right: 8),
      child: Icon(
        iconData,
        color: color,
        size: 30,
      ),
    );

    return TapToCancelFocus(
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        titlePadding: EdgeInsets.fromLTRB(20, 16, 20, 0),
        contentPadding: EdgeInsets.fromLTRB(2, 0, 2, 8),
        title: Row(
          children: <Widget>[
            Expanded(
              child: StText.medium(
                title ?? textOfConfirmType(type),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            icon,
          ],
        ),
        children: <Widget>[
          contentWidgetBuilder?.call(context) ??
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                width: width,
                constraints: BoxConstraints(minHeight: 120),
                child: StText.normal(
                  content ?? '',
                  maxLines: 999,
                ),
              ),
          if (!onlyContent)
            Container(
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _DialogButton(
                      title: cancel ??
                          (onlyCloseButton
                              ? S.of(context).close
                              : S.of(context).cancel),
                      pimary: false,
                      onTap: () {
                        Navigator.of(context)
                            .pop(onlyCloseButton ? null : false);
                      },
                    ),
                  ),
                  onlyCloseButton
                      ? Container()
                      : Expanded(
                          child: _DialogButton(
                            title: ok ?? S.of(context).ok,
                            color: color,
                            onTap: () async {
                              var refuse = await onWillConfirm?.call();
                              if (refuse == false) {
                                return;
                              }
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final Color? color;
  final bool pimary;
  final double? height;
  final double? width;

  const _DialogButton({
    Key? key,
    this.onTap,
    this.title,
    this.pimary = true,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration d;
    if (pimary) {
      d = BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      );
    } else {
      d = BoxDecoration(
        color: ColorPlate.lightGray,
        borderRadius: BorderRadius.circular(6),
      );
    }
    return Tapped(
      onTap: onTap,
      child: Container(
        height: height ?? 36,
        width: width ?? 368,
        margin: EdgeInsets.fromLTRB(6, 8, 6, 8),
        alignment: Alignment.center,
        decoration: d,
        child: StText.medium(
          title,
          style: TextStyle(
            height: oneLineH,
            color: pimary ? ColorPlate.white : null,
          ),
        ),
      ),
    );
  }
}
