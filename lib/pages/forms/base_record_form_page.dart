// lib/pages/forms/base_record_form_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/pages/forms/widgets/form_tools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/input_helper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

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

abstract class _BaseRecordFormPageState extends State<BaseRecordFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _descriptionHelper;
  late InputHelper _valueTypeHelper;
  late InputHelper _numericValueHelper;
  late InputHelper _notesHelper;
  late InputHelper _sourceIdHelper;

  // 枚举选择状态
  RecordType _selectedRecordType = RecordType.aquarium;
  OperationType _selectedOperationType = OperationType.create;

  // 时间选择状态
  DateTime? _recordTime;

  // 其他状态
  List<int>? _photoMediaIds;
  String? _iconPath;

  // 鱼缸信息
  Aquarium? _aquarium;

  // 表单验证错误
  String? _nameError;
  String? _numericValueError;

  @override
  void initState() {
    super.initState();
    final record = widget.record ?? widget.getPreconfiguredRecord();

    // 初始化 InputHelper
    _nameHelper = InputHelper(defaultText: record?.name ?? '');
    _descriptionHelper = InputHelper(defaultText: record?.description ?? '');
    _valueTypeHelper = InputHelper(defaultText: record?.valueType ?? '');
    _numericValueHelper = InputHelper(
      defaultText: record?.numericValue?.toString() ?? '',
    );
    _notesHelper = InputHelper(defaultText: record?.notes ?? '');
    _sourceIdHelper = InputHelper(
      defaultText: record?.sourceId?.toString() ?? '',
    );

    // 初始化枚举和日期
    _selectedRecordType = record?.recordType ?? RecordType.aquarium;
    _selectedOperationType = record?.operationType ?? OperationType.create;
    _recordTime = record?.recordTime ?? DateTime.now();
    _photoMediaIds = record?.photoMediaIds;
    _iconPath = record?.iconPath;

    // 加载鱼缸信息
    _loadAquariumInfo();

    // 延迟请求焦点，确保Widget已经构建完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestFocus();
    });
  }

  // 请求焦点（子类可以重写）
  void _requestFocus() {
    if (_nameHelper.text.isEmpty) {
      _nameHelper.focusNode.requestFocus();
    }
  }

  // 加载鱼缸信息
  Future<void> _loadAquariumInfo() async {
    final aquariumId = widget.aquariumId ?? widget.record?.aquariumId;
    if (aquariumId != null) {
      final aquarium = await isar.aquariums.get(aquariumId);
      if (aquarium != null) {
        setState(() {
          _aquarium = aquarium;
        });
      }
    }
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

    // 获取鱼缸ID
    int? aquariumId;
    if (widget.aquariumId != null) {
      aquariumId = widget.aquariumId;
    } else if (_aquarium != null) {
      aquariumId = _aquarium!.id;
    } else if (widget.record?.aquariumId != null) {
      aquariumId = widget.record!.aquariumId;
    }

    // 验证关联创建时的记录ID（可选）
    int? sourceId;
    if (_sourceIdHelper.text.isNotEmpty) {
      sourceId = int.tryParse(_sourceIdHelper.text);
      if (sourceId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('关联创建记录ID必须是整数')));
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
      sourceId: sourceId,
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

    // 处理保存逻辑
    if (widget.onSave != null) {
      // Modal模式：调用保存回调
      widget.onSave!(newRecord);
    } else {
      // 页面模式：返回上一页并传递结果
      Navigator.pop(context, newRecord);
    }
  }

  // 获取状态对象的方法
  InputHelper get nameHelper => _nameHelper;
  InputHelper get descriptionHelper => _descriptionHelper;
  InputHelper get valueTypeHelper => _valueTypeHelper;
  InputHelper get numericValueHelper => _numericValueHelper;
  InputHelper get notesHelper => _notesHelper;
  InputHelper get sourceIdHelper => _sourceIdHelper;

  RecordType get selectedRecordType => _selectedRecordType;
  OperationType get selectedOperationType => _selectedOperationType;
  DateTime? get recordTime => _recordTime;
  Aquarium? get aquarium => _aquarium;
  String? get nameError => _nameError;
  String? get numericValueError => _numericValueError;

  set selectedRecordType(RecordType value) {
    setState(() => _selectedRecordType = value);
  }

  set selectedOperationType(OperationType value) {
    setState(() => _selectedOperationType = value);
  }

  set recordTime(DateTime? value) {
    setState(() => _recordTime = value);
  }

  set nameError(String? value) {
    setState(() => _nameError = value);
  }

  set numericValueError(String? value) {
    setState(() => _numericValueError = value);
  }

  // 构建通用表单元素的方法
  Widget buildRecordTypePicker() {
    return FormGridPicker<RecordType>(
      label: '记录类型',
      value: _selectedRecordType,
      items: RecordType.values,
      itemDisplayName: (e) => e.label,
      onChanged: (v) =>
          setState(() => _selectedRecordType = v ?? RecordType.aquarium),
    );
  }

  Widget buildOperationTypePicker() {
    return FormGridPicker<OperationType>(
      label: '操作类型',
      value: _selectedOperationType,
      items: OperationType.values,
      itemDisplayName: (e) => e.label,
      onChanged: (v) =>
          setState(() => _selectedOperationType = v ?? OperationType.create),
    );
  }

  Widget buildNameInput({String? errorText, String? hintText}) {
    return FormInput(
      label: '记录名称',
      hintText: hintText ?? '请输入记录名称',
      helper: _nameHelper,
      errorText: errorText ?? _nameError,
      onChanged: (_) {
        if (_nameError != null) {
          setState(() => _nameError = null);
        }
      },
    );
  }

  Widget buildDescriptionInput({String? hintText}) {
    return FormInput(
      label: '描述',
      hintText: hintText ?? '请输入详细描述',
      helper: _descriptionHelper,
      maxLines: 3,
    );
  }

  Widget buildSourceIdInput() {
    return FormInput(
      label: '关联创建记录ID（可选）',
      hintText: '在记录生物变化等情况时使用',
      helper: _sourceIdHelper,
      keyboardType: TextInputType.number,
    );
  }

  Widget buildValueTypeInput({String? hintText}) {
    return FormInput(
      label: '数值类型（可选）',
      hintText: hintText ?? '如L、g、ppm、℃等',
      helper: _valueTypeHelper,
    );
  }

  Widget buildNumericValueInput({
    String? label,
    String? hintText,
    String? errorText,
  }) {
    return FormInput(
      label: label ?? '数值（可选）',
      hintText: hintText ?? '填写具体数值，如200、5.5等',
      helper: _numericValueHelper,
      errorText: errorText ?? _numericValueError,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (_) {
        if (_numericValueError != null) {
          setState(() => _numericValueError = null);
        }
      },
    );
  }

  Widget buildRecordTimePicker({String? label}) {
    return FormDatePicker(
      label: label ?? '记录时间',
      date: _recordTime,
      onChanged: (d) => setState(() => _recordTime = d),
    );
  }

  Widget buildNotesInput() {
    return FormInput(label: '备注', helper: _notesHelper, maxLines: 3);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.record != null;
    final isBottomSheet = widget.onSave != null;

    // 底部弹窗模式：不需要AppBar，使用更紧凑的布局
    if (isBottomSheet) {
      return TapToCancelFocus(
        child: SafeArea(
          child: Container(
            color: StColor.lightGray,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 底部弹窗顶部拖动指示器
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: StColor.gray.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                ),
                // 顶部标题和鱼缸信息
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: StText.medium(
                          widget.getFormTitle(isEditing),
                          style: const TextStyle(color: StColor.darkGray),
                        ),
                      ),
                      if (_aquarium != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: StColor.lightGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: StText.small(
                            _aquarium!.name,
                            style: TextStyle(color: StColor.gray, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
                // 可滑动的表单区域
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
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: widget.buildForm(context),
                    ),
                  ),
                ),
                // 底部保存按钮
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Tapped(
                    onTap: _handleSave,
                    child: Container(
                      width: double.infinity,
                      height: 48,
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
      );
    }

    // 页面模式：完整的Scaffold布局
    return TapToCancelFocus(
      child: Scaffold(
        appBar: AppBar(
          title: StText.medium(
            widget.getFormTitle(isEditing),
            style: const TextStyle(color: StColor.darkGray),
          ),
          backgroundColor: StColor.lightGray,
          iconTheme: const IconThemeData(color: StColor.darkGray),
        ),
        body: TapToCancelFocus(
          child: SafeArea(
            child: Column(
              children: [
                // 鱼缸信息显示在顶部
                if (_aquarium != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        StText.small(
                          '鱼缸：',
                          style: TextStyle(color: StColor.gray),
                        ),
                        const SizedBox(width: 8),
                        StText.small(
                          _aquarium!.name,
                          style: const TextStyle(color: StColor.darkGray),
                        ),
                      ],
                    ),
                  ),
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
                      child: widget.buildForm(context),
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
