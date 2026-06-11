// lib/pages/forms/water_change_form_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/pages/forms/widgets/form_tools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazy_push.dart';
import 'package:aquarium_diary/tools/input_helper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class WaterChangeFormPage extends StatefulWidget {
  final Record? record; // 传入 null 表示新建，否则编辑
  final int? aquariumId; // 可选：预填充的鱼缸ID
  final void Function(Record?)? onSave; // Modal模式下的保存回调

  WaterChangeFormPage({Key? key, this.record, this.aquariumId, this.onSave})
    : super(key: key);

  // 静态方法：创建换水记录
  static Future<Record?> addWaterChange(
    BuildContext context, {
    int? aquariumId,
    double? waterVolume, // 换水量(L)
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    // 创建预配置的Record对象
    final preconfiguredRecord = Record(
      aquariumId: aquariumId,
      recordType: RecordType.maintenance,
      operationType: OperationType.statusChange,
      name: '换水记录',
      valueType: waterVolume != null ? 'L' : null,
      numericValue: waterVolume,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );

    if (isBottomSheet) {
      // Bottom Sheet模式：使用pushAsActionSheet
      final result = await WaterChangeFormPage(
        record: preconfiguredRecord,
        aquariumId: aquariumId,
        onSave: (savedRecord) {
          // 关闭bottom sheet并返回结果
          Navigator.of(context).pop(savedRecord);
        },
      ).pushAsActionSheet<Record?>(context);

      if (result != null) {
        await isar.writeTxn(() async {
          final id = await isar.records.put(result);
          result.id = id;
        });
      }
      return result;
    } else {
      // 页面模式：正常页面跳转
      final targetItem = await WaterChangeFormPage(
        record: preconfiguredRecord,
        aquariumId: aquariumId,
      ).pushAsPage<Record>(context);

      if (targetItem is! Record) return null;

      await isar.writeTxn(() async {
        final id = await isar.records.put(targetItem);
        targetItem.id = id;
      });
      return targetItem;
    }
  }

  @override
  _WaterChangeFormPageState createState() => _WaterChangeFormPageState();
}

class _WaterChangeFormPageState extends State<WaterChangeFormPage> {
  // 输入辅助器
  late InputHelper _numericValueHelper;
  late InputHelper _notesHelper;

  // 时间选择状态
  DateTime? _recordTime;

  // 表单验证错误
  String? _numericValueError;

  // 鱼缸信息
  Aquarium? _aquarium;

  @override
  void initState() {
    super.initState();
    final record = widget.record;

    // 初始化 InputHelper
    _numericValueHelper = InputHelper(
      defaultText: record?.numericValue?.toString() ?? '',
    );
    _notesHelper = InputHelper(defaultText: record?.notes ?? '');

    // 初始化日期
    _recordTime = record?.recordTime ?? DateTime.now();

    // 加载鱼缸信息
    _loadAquariumInfo();

    // 延迟请求焦点，确保Widget已经构建完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_numericValueHelper.text.isEmpty) {
        _numericValueHelper.focusNode.requestFocus();
      }
    });
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

    // 获取鱼缸ID
    int? aquariumId;
    if (widget.aquariumId != null) {
      aquariumId = widget.aquariumId;
    } else if (_aquarium != null) {
      aquariumId = _aquarium!.id;
    } else if (widget.record?.aquariumId != null) {
      aquariumId = widget.record!.aquariumId;
    }

    // 构建 Record 对象
    final now = DateTime.now();
    final newRecord = Record(
      aquariumId: aquariumId,
      recordType: RecordType.maintenance,
      operationType: OperationType.statusChange,
      name: '换水记录',
      valueType: 'L',
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

  // 构建表单
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 换水量
        FormInput(
          label: '换水量(L)',
          hintText: '请输入换水量，如20.5、10等',
          helper: _numericValueHelper,
          errorText: _numericValueError,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (_) {
            if (_numericValueError != null) {
              setState(() => _numericValueError = null);
            }
          },
        ),
        const SizedBox(height: 20),

        // 记录时间
        FormDatePicker(
          label: '换水时间',
          date: _recordTime,
          onChanged: (d) => setState(() => _recordTime = d),
        ),
        const SizedBox(height: 20),

        // 备注
        FormInput(label: '备注', helper: _notesHelper, maxLines: 3),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.record != null;
    final isBottomSheet =
        widget.onSave != null; // 如果有onSave回调，说明是bottom sheet模式

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
                          isEditing ? '编辑换水记录' : '新建换水记录',
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
                      child: _buildForm(),
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
            isEditing ? '编辑换水记录' : '新建换水记录',
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
                      child: _buildForm(),
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
