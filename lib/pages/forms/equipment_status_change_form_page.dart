// lib/pages/forms/equipment_status_change_form_page.dart

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

class EquipmentStatusChangeFormPage extends StatefulWidget {
  final Record? record; // 传入 null 表示新建，否则编辑
  final int? aquariumId; // 可选：预填充的鱼缸ID
  final void Function(Record?)? onSave; // Modal模式下的保存回调

  EquipmentStatusChangeFormPage({
    Key? key,
    this.record,
    this.aquariumId,
    this.onSave,
  }) : super(key: key);

  // 静态方法：创建设备状态变化记录
  static Future<Record?> addEquipmentStatusChange(
    BuildContext context, {
    required int aquariumId,
    required int sourceId, // 关联的设备ID
    required String equipmentName,
    required String statusChange,
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    // 创建预配置的Record对象
    final preconfiguredRecord = Record(
      aquariumId: aquariumId,
      recordType: RecordType.equipment,
      operationType: OperationType.statusChange,
      name: '$equipmentName 状态变化',
      sourceId: sourceId,
      description: statusChange,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );

    if (isBottomSheet) {
      // Bottom Sheet模式：使用pushAsActionSheet
      final result = await EquipmentStatusChangeFormPage(
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
      final targetItem = await EquipmentStatusChangeFormPage(
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
  _EquipmentStatusChangeFormPageState createState() =>
      _EquipmentStatusChangeFormPageState();
}

class _EquipmentStatusChangeFormPageState
    extends State<EquipmentStatusChangeFormPage> {
  // 输入辅助器
  late InputHelper _sourceIdHelper;
  late InputHelper _nameHelper;
  late InputHelper _descriptionHelper;
  late InputHelper _notesHelper;

  // 时间选择状态
  DateTime? _recordTime;

  // 表单验证错误
  String? _nameError;

  // 鱼缸信息
  Aquarium? _aquarium;

  @override
  void initState() {
    super.initState();
    final record = widget.record;

    // 初始化 InputHelper
    _sourceIdHelper = InputHelper(
      defaultText: record?.sourceId?.toString() ?? '',
    );
    _nameHelper = InputHelper(defaultText: record?.name ?? '');
    _descriptionHelper = InputHelper(defaultText: record?.description ?? '');
    _notesHelper = InputHelper(defaultText: record?.notes ?? '');

    // 初始化日期
    _recordTime = record?.recordTime ?? DateTime.now();

    // 加载鱼缸信息
    _loadAquariumInfo();

    // 延迟请求焦点，确保Widget已经构建完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_sourceIdHelper.text.isEmpty) {
        _sourceIdHelper.focusNode.requestFocus();
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
    // 验证关联ID
    int? sourceId;
    if (_sourceIdHelper.text.isNotEmpty) {
      sourceId = int.tryParse(_sourceIdHelper.text);
      if (sourceId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('关联设备ID必须是整数')));
        return;
      }
    }

    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '请输入设备名称';
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

    if (aquariumId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择鱼缸')));
      return;
    }

    // 构建记录名称
    String name = '${_nameHelper.text.trim()} 状态变化';

    // 构建 Record 对象
    final now = DateTime.now();
    final newRecord = Record(
      aquariumId: aquariumId,
      recordType: RecordType.equipment,
      operationType: OperationType.statusChange,
      sourceId: sourceId,
      name: name,
      description: _descriptionHelper.text.trim().isEmpty
          ? null
          : _descriptionHelper.text.trim(),
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
        // 关联设备ID
        FormInput(
          label: '关联设备ID',
          hintText: '请输入设备ID',
          helper: _sourceIdHelper,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),

        // 设备名称
        FormInput(
          label: '设备名称',
          hintText: '请输入设备名称',
          helper: _nameHelper,
          errorText: _nameError,
          onChanged: (_) {
            if (_nameError != null) {
              setState(() => _nameError = null);
            }
          },
        ),
        const SizedBox(height: 20),

        // 状态变化描述
        FormInput(
          label: '状态变化描述',
          hintText: '描述状态变化情况，如"故障，不加热"、"更换滤棉"、"维修完成"等',
          helper: _descriptionHelper,
          maxLines: 3,
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
                          isEditing ? '编辑设备状态变化' : '记录设备状态变化',
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
            isEditing ? '编辑设备状态变化' : '记录设备状态变化',
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
