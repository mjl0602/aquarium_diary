// lib/pages/views/record_add_button.dart

import 'package:aquarium_diary/pages/forms/record_form_page.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

/// 添加记录按钮组件
/// 可以在任何页面中使用这个按钮来添加记录
class RecordAddButton extends StatelessWidget {
  final int? aquariumId; // 预填充的鱼缸ID
  final String label; // 按钮文字
  final IconData? icon; // 按钮图标
  final Color? backgroundColor; // 背景色
  final Color? textColor; // 文字颜色
  final EdgeInsets? padding; // 内边距
  final VoidCallback? onRecordAdded; // 记录添加成功后的回调

  const RecordAddButton({
    Key? key,
    this.aquariumId,
    this.label = '添加记录',
    this.icon = Icons.add,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.onRecordAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tapped(
      onTap: () => _showRecordForm(context),
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? StColor.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(icon, size: 20, color: textColor ?? StColor.white),
            if (icon != null) const SizedBox(width: 8),
            StText.medium(
              label,
              style: TextStyle(
                color: textColor ?? StColor.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRecordForm(BuildContext context) async {
    final record = await RecordFormPage.add(context, aquariumId: aquariumId);

    if (record != null && onRecordAdded != null) {
      onRecordAdded!();
    }
  }
}

/// 浮动添加记录按钮
class RecordFloatingButton extends StatelessWidget {
  final int? aquariumId;
  final VoidCallback? onRecordAdded;

  const RecordFloatingButton({Key? key, this.aquariumId, this.onRecordAdded})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showRecordForm(context),
      backgroundColor: StColor.primary,
      child: const Icon(Icons.note_add, color: StColor.white),
    );
  }

  Future<void> _showRecordForm(BuildContext context) async {
    final record = await RecordFormPage.add(context, aquariumId: aquariumId);

    if (record != null && onRecordAdded != null) {
      onRecordAdded!();
    }
  }
}

/// 使用示例代码
class RecordButtonExamples {
  static String getUsageExamples() {
    return '''
    // 1. 基本的添加记录按钮
    RecordAddButton(
      label: '添加记录',
      onRecordAdded: () {
        // 记录添加成功后的操作
        print('记录添加成功');
      },
    ),

    // 2. 预填鱼缸ID的按钮
    RecordAddButton(
      aquariumId: 1,
      label: '添加鱼缸记录',
      icon: Icons.water,
    ),

    // 3. 浮动按钮
    RecordFloatingButton(
      aquariumId: 1,
      onRecordAdded: () {
        // 刷新页面或显示提示
      },
    ),

    // 4. 自定义样式的按钮
    RecordAddButton(
      label: '记录水质',
      icon: Icons.science,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      padding: const EdgeInsets.all(16),
    ),

    // 5. 直接调用表单页面（不使用按钮组件）
    Tapped(
      onTap: () async {
        final record = await RecordFormPage.add(
          context,
          aquariumId: 1,
        );
        if (record != null) {
          // 处理添加的记录
        }
      },
      child: Container(...),
    ),
    ''';
  }
}
