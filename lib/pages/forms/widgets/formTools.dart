
// ---------- 现代风格组件 ----------

import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

/// 无边框文本输入框（底部细线）
class FormInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final InputHelper helper;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onChanged;

  const FormInput({
    Key? key,
    required this.label,
    required this.helper,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StText.small(
          label,
          style: TextStyle(
            color: StColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: helper.controller,
          focusNode: helper.focusNode,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,

          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: StandardTextStyle.small,
            isDense: true,
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: StColor.halfGray.withOpacity(0.5),
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: StColor.primary, width: 1.5),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: StColor.error, width: 1),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: StColor.error, width: 1.5),
            ),
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
          style: TextStyle(color: StColor.black, fontSize: 16),
        ),
      ],
    );
  }
}

/// 无边框下拉选择器（底部细线）
class FormDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) itemDisplayName;
  final void Function(T?) onChanged;

  const FormDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.itemDisplayName,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StText.small(
          label,
          style: TextStyle(
            color: StColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: StColor.halfGray.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: StText.normal(
                '请选择',
                style: TextStyle(color: StColor.halfGray),
              ),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, color: StColor.gray),
              items: items.map((e) {
                return DropdownMenuItem<T>(
                  value: e,
                  child: StText.normal(itemDisplayName(e)),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

/// 无边框日期选择器（iOS 滚轮风格）
class FormDatePicker extends StatelessWidget {
  final String label;
  final DateTime? date;
  final void Function(DateTime?) onChanged;

  const FormDatePicker({
    Key? key,
    required this.label,
    required this.date,
    required this.onChanged,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    // 使用 Cupertino 底部弹窗 + 滚轮选择器
    final DateTime? picked = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 260,
          padding: const EdgeInsets.only(top: 6.0),
          // 底部圆角背景
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              initialDateTime: date ?? DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              // 日期范围（可自定义）
              minimumDate: DateTime(2000),
              maximumDate: DateTime.now().add(const Duration(days: 365)),
              onDateTimeChanged: (DateTime newDate) {
                // 注意：滚轮滚动时会实时回调，但我们只需在用户点击“完成”时返回
                // 所以这里暂不处理，而是通过弹出路由返回值
              },
            ),
          ),
        );
      },
    );

    if (picked != null) {
      onChanged(picked);
    }
  }

  // 改进版：带确认栏的底部滚轮
  Future<void> _selectDateImproved(BuildContext context) async {
    // final FixedExtentScrollController scrollController =
    //     FixedExtentScrollController();
    DateTime tempDate = date ?? DateTime.now();

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: Column(
            children: [
              // 顶部操作栏
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.separator.resolveFrom(context),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Tapped(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 8,
                        ),
                        child: StText.normal('取消'),
                      ),
                    ),
                    Tapped(
                      onTap: () => Navigator.of(context).pop(tempDate),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 8,
                        ),
                        child: StText.medium(
                          '确定',
                          style: TextStyle(color: StColor.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 滚轮选择器
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: date ?? DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  minimumDate: DateTime(2000),
                  maximumDate: DateTime.now().add(const Duration(days: 365)),
                  onDateTimeChanged: (DateTime newDate) {
                    tempDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    ).then((picked) {
      if (picked != null) onChanged(picked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StText.small(
          label,
          style: TextStyle(
            color: StColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Tapped(
          onTap: () => _selectDateImproved(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: StColor.halfGray.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StText.normal(
                  date == null ? '未选择' : _formatDate(date!),
                  style: TextStyle(
                    color: date == null ? StColor.halfGray : StColor.black,
                  ),
                ),
                Icon(Icons.calendar_today, size: 16, color: StColor.gray),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

/// 现代开关（保持原样，但标签样式统一）
class FormSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool) onChanged;

  const FormSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StText.medium(label, style: const TextStyle(color: StColor.darkGray)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: StColor.primary,
          activeTrackColor: StColor.primary.withOpacity(0.3),
        ),
      ],
    );
  }
}
