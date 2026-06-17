// lib/pages/forms/base_record_form_page.dart
import 'package:aquarium_diary/database/models/record.dart';
import 'package:flutter/material.dart';

abstract class BaseRecordFormPage extends StatefulWidget {
  final Record? record; // 传入 null 表示新建，否则编辑
  final int? aquariumId; // 可选：预填充的鱼缸ID
  final void Function(Record?)? onSave; // Modal模式下的保存回调

  const BaseRecordFormPage({
    Key? key,
    this.record,
    this.aquariumId,
    this.onSave,
  }) : super(key: key);

  // 表单标题
  String getFormTitle(bool isEditing);

  // 构建表单内容
  Widget buildForm(BuildContext context);

  // 预填充记录（可选）
  Record? getPreconfiguredRecord() => null;

  // 获取表单类型名称（用于调试和日志）
  String getFormTypeName();
}
