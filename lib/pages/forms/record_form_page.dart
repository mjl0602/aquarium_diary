// lib/pages/forms/record_form_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/pages/forms/widgets/form_tools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazy_push.dart';
import 'package:aquarium_diary/tools/input_helper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class RecordFormPage extends StatefulWidget {
  final Record? record; // 传入 null 表示新建，否则编辑
  final int? aquariumId; // 可选：预填充的鱼缸ID

  RecordFormPage({Key? key, this.record, this.aquariumId}) : super(key: key);

  static Future<Record?> add(BuildContext context, {int? aquariumId}) async {
    final targetItem = await RecordFormPage(
      aquariumId: aquariumId,
    ).pushAsPage<Record>(context);
    if (targetItem is! Record) return null;

    await isar.writeTxn(() async {
      final id = await isar.records.put(targetItem);
      targetItem.id = id;
    });
    return targetItem;
  }

  @override
  _RecordFormPageState createState() => _RecordFormPageState();
}

class _RecordFormPageState extends State<RecordFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _descriptionHelper;
  late InputHelper _valueTypeHelper;
  late InputHelper _numericValueHelper;
  late InputHelper _notesHelper;
  late InputHelper _aquariumIdHelper;
  late InputHelper _relatedIdHelper;

  // 枚举选择状态
  RecordType _selectedRecordType = RecordType.aquarium;
  OperationType _selectedOperationType = OperationType.create;

  // 时间选择状态
  DateTime? _recordTime;

  // 其他状态
  List<int>? _photoMediaIds;
  String? _iconPath;

  // 表单验证错误
  String? _nameError;
  String? _numericValueError;

  @override
  void initState() {
    super.initState();
    final record = widget.record;

    // 初始化 InputHelper
    _nameHelper = InputHelper(defaultText: record?.name ?? '');
    _descriptionHelper = InputHelper(defaultText: record?.description ?? '');
    _valueTypeHelper = InputHelper(defaultText: record?.valueType ?? '');
    _numericValueHelper = InputHelper(
      defaultText: record?.numericValue?.toString() ?? '',
    );
    _notesHelper = InputHelper(defaultText: record?.notes ?? '');
    _aquariumIdHelper = InputHelper(
      defaultText: (widget.aquariumId ?? record?.aquariumId)?.toString() ?? '',
    );
    _relatedIdHelper = InputHelper(
      defaultText: record?.relatedId?.toString() ?? '',
    );

    // 初始化枚举和日期
    _selectedRecordType = record?.recordType ?? RecordType.aquarium;
    _selectedOperationType = record?.operationType ?? OperationType.create;
    _recordTime = record?.recordTime ?? DateTime.now();
    _photoMediaIds = record?.photoMediaIds;
    _iconPath = record?.iconPath;

    // 方便第一次填写
    if (_nameHelper.text.isEmpty) _nameHelper.focusNode.requestFocus();
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '请输入记录名称';
      });
      return;
    }

    // 验证鱼缸ID（可选）
    int? aquariumId;
    if (_aquariumIdHelper.text.isNotEmpty) {
      aquariumId = int.tryParse(_aquariumIdHelper.text);
      if (aquariumId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('鱼缸ID必须是整数')));
        return;
      }
    }

    // 验证关联ID（可选）
    int? relatedId;
    if (_relatedIdHelper.text.isNotEmpty) {
      relatedId = int.tryParse(_relatedIdHelper.text);
      if (relatedId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('关联ID必须是整数')));
        return;
      }
    }

    // 验证数值
    double? numericValue;
    if (_numericValueHelper.text.isNotEmpty) {
      numericValue = double.tryParse(_numericValueHelper.text);
      if (numericValue == null) {
        setState(() {
          _numericValueError = '数值必须是有效的数字';
        });
        return;
      }
    }

    // 构建 Record 对象
    final now = DateTime.now();
    final newRecord = Record(
      aquariumId: aquariumId,
      recordType: _selectedRecordType,
      relatedId: relatedId,
      operationType: _selectedOperationType,
      photoMediaIds: _photoMediaIds,
      iconPath: _iconPath,
      name: _nameHelper.text.trim(),
      description: _descriptionHelper.text.trim().isEmpty
          ? null
          : _descriptionHelper.text.trim(),
      valueType: _valueTypeHelper.text.trim().isEmpty
          ? null
          : _valueTypeHelper.text.trim(),
      numericValue: numericValue,
      recordTime: _recordTime ?? now,
      createdAt: widget.record?.createdAt ?? now,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.record?.id != null) newRecord.id = widget.record!.id;

    // 返回上一页并传递结果
    Navigator.pop(context, newRecord);
  }

  // 构建记录类型相关的提示文本
  String _getRecordTypeHint() {
    switch (_selectedRecordType) {
      case RecordType.aquarium:
        return '鱼缸相关记录，如开缸、水质测试等';
      case RecordType.creature:
        return '生物相关记录，如喂食、状态变化等';
      case RecordType.equipment:
        return '设备相关记录，如购买、维护、卖出等';
      case RecordType.maintenance:
        return '维护相关记录，如换水、清洗等';
    }
  }

  // 构建操作类型相关的提示文本
  String _getOperationTypeHint() {
    switch (_selectedOperationType) {
      case OperationType.create:
        return '创建新的实体';
      case OperationType.sell:
        return '卖出实体';
      case OperationType.statusChange:
        return '实体状态发生变化';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.record != null;
    return TapToCancelFocus(
      child: Scaffold(
        appBar: AppBar(
          title: StText.medium(
            isEditing ? '编辑记录' : '新建记录',
            style: const TextStyle(color: StColor.darkGray),
          ),
          backgroundColor: StColor.lightGray,
          iconTheme: const IconThemeData(color: StColor.darkGray),
        ),
        body: TapToCancelFocus(
          child: SafeArea(
            child: Column(
              children: [
                // 可滑动的卡片区域
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: StColor.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 提示信息
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: StColor.lightGray.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: StText.small(
                              '记录信息：${_getRecordTypeHint()}\n操作类型：${_getOperationTypeHint()}',
                              style: TextStyle(
                                color: StColor.gray,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // 记录类型选择
                          FormGridPicker<RecordType>(
                            label: '记录类型',
                            value: _selectedRecordType,
                            items: RecordType.values,
                            itemDisplayName: (e) => e.label,
                            onChanged: (v) => setState(
                              () => _selectedRecordType =
                                  v ?? RecordType.aquarium,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // 操作类型选择
                          FormGridPicker<OperationType>(
                            label: '操作类型',
                            value: _selectedOperationType,
                            items: OperationType.values,
                            itemDisplayName: (e) => e.label,
                            onChanged: (v) => setState(
                              () => _selectedOperationType =
                                  v ?? OperationType.create,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // 记录名称
                          FormInput(
                            label: '记录名称',
                            hintText: '请输入记录名称，如"水质测试"、"喂食记录"等',
                            helper: _nameHelper,
                            errorText: _nameError,
                            onChanged: (_) {
                              if (_nameError != null) {
                                setState(() => _nameError = null);
                              }
                            },
                          ),
                          const SizedBox(height: 20),

                          // 描述
                          FormInput(
                            label: '描述',
                            hintText: '请输入详细描述',
                            helper: _descriptionHelper,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 20),

                          // 鱼缸ID
                          FormInput(
                            label: '鱼缸ID（可选）',
                            hintText: '关联鱼缸ID，如1、2等',
                            helper: _aquariumIdHelper,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20),

                          // 关联对象ID
                          FormInput(
                            label: '关联对象ID（可选）',
                            hintText: '根据记录类型填写对应ID',
                            helper: _relatedIdHelper,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20),

                          // 数值类型
                          FormInput(
                            label: '数值类型（可选）',
                            hintText: '如L、g、ppm、℃等',
                            helper: _valueTypeHelper,
                          ),
                          const SizedBox(height: 20),

                          // 数值
                          FormInput(
                            label: '数值（可选）',
                            hintText: '填写具体数值，如200、5.5等',
                            helper: _numericValueHelper,
                            errorText: _numericValueError,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            onChanged: (_) {
                              if (_numericValueError != null) {
                                setState(() => _numericValueError = null);
                              }
                            },
                          ),
                          const SizedBox(height: 20),

                          // 记录时间
                          FormDatePicker(
                            label: '记录时间',
                            date: _recordTime,
                            onChanged: (d) => setState(() => _recordTime = d),
                          ),
                          const SizedBox(height: 20),

                          // 备注
                          FormInput(
                            label: '备注',
                            helper: _notesHelper,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 固定在底部的保存按钮
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Tapped(
                    onTap: _handleSave,
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: StColor.primary,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: StText.medium(
                          '保存',
                          style: const TextStyle(
                            color: StColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
