// lib/pages/maintenance_record_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/consumable.dart';
import 'package:aquarium_diary/database/models/maintenance_record.dart';
import 'package:aquarium_diary/pages/forms/widgets/form_tools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/input_helper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class MaintenanceRecordFormPage extends StatefulWidget {
  final MaintenanceRecord? record; // 传入 null 表示新建，否则编辑
  final int? initialAquariumId; // 可选，预选鱼缸ID（例如从鱼缸详情页进入时）

  const MaintenanceRecordFormPage({
    Key? key,
    this.record,
    this.initialAquariumId,
  }) : super(key: key);

  @override
  _MaintenanceRecordFormPageState createState() =>
      _MaintenanceRecordFormPageState();
}

class _MaintenanceRecordFormPageState extends State<MaintenanceRecordFormPage> {
  // 输入辅助器
  late InputHelper _consumableAmountHelper;
  late InputHelper _notesHelper;

  // 其他状态变量
  Aquarium? _selectedAquarium;
  MaintenanceOperation? _selectedOperation;
  Consumable? _selectedConsumable;
  DateTime? _operationDate;
  DateTime? _nextReminderDate;
  bool _isReminded = false;

  // 下拉列表数据
  List<Aquarium> _aquariums = [];
  List<Consumable> _consumables = [];

  @override
  void initState() {
    super.initState();
    final record = widget.record;

    _consumableAmountHelper = InputHelper(
      defaultText: record?.consumableAmount?.toString() ?? '',
    );
    _notesHelper = InputHelper(defaultText: record?.notes ?? '');

    _selectedOperation = record?.operation;
    _operationDate = record?.operationDate;
    _nextReminderDate = record?.nextReminderDate;
    _isReminded = record?.isReminded ?? false;

    _loadData();
  }

  // 加载鱼缸和耗材列表
  Future<void> _loadData() async {
    // 模拟数据库查询，实际项目中替换为真实查询
    // final isar = await Isar.getInstance();
    // final aquariums = await isar.aquariums.where().findAll();
    // final consumables = await isar.consumables.where().findAll();
    await Future.delayed(Duration.zero);
    final mockAquariums = <Aquarium>[];
    final mockConsumables = <Consumable>[];

    setState(() {
      _aquariums = mockAquariums;
      _consumables = mockConsumables;

      // 预选鱼缸
      if (widget.initialAquariumId != null) {
        _selectedAquarium = _aquariums.firstWhere(
          (a) => a.id == widget.initialAquariumId,
          orElse: () => null as Aquarium,
        );
      } else if (widget.record?.aquariumId != null) {
        _selectedAquarium = _aquariums.firstWhere(
          (a) => a.id == widget.record!.aquariumId,
          orElse: () => null as Aquarium,
        );
      }

      // 预选耗材
      if (widget.record?.consumableId != null) {
        _selectedConsumable = _consumables.firstWhere(
          (c) => c.id == widget.record!.consumableId,
          orElse: () => null as Consumable,
        );
      }
    });
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证必填
    if (_selectedAquarium == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择关联鱼缸')));
      return;
    }
    if (_selectedOperation == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择操作类型')));
      return;
    }
    if (_operationDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择操作时间')));
      return;
    }

    // 解析耗材数量（如果填写了耗材但数量为空，则设为 null）
    double? consumableAmount;
    if (_selectedConsumable != null &&
        _consumableAmountHelper.text.isNotEmpty) {
      consumableAmount = double.tryParse(_consumableAmountHelper.text);
      if (consumableAmount == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('耗材数量必须为数字')));
        return;
      }
    } else if (_selectedConsumable != null &&
        _consumableAmountHelper.text.isEmpty) {
      // 如果选择了耗材但没填数量，允许为空（null）
    }

    // 构建 MaintenanceRecord 对象
    final now = DateTime.now();
    final newRecord = MaintenanceRecord(
      // id: widget.record?.id,
      aquariumId: _selectedAquarium!.id!,
      operation: _selectedOperation!,
      consumableId: _selectedConsumable?.id,
      consumableAmount: consumableAmount,
      operationDate: _operationDate!,
      nextReminderDate: _nextReminderDate,
      isReminded: _isReminded,
      createdAt: widget.record?.createdAt ?? now,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.record?.id != null) newRecord.id = widget.record!.id;

    Navigator.pop(context, newRecord);
  }

  // 耗材显示名称
  String _consumableDisplayName(Consumable c) {
    if (c.capacity != null && c.unit != null) {
      return '${c.name} (${c.capacity}${c.unit})';
    }
    return c.name;
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.record != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(
          isEditing ? '编辑维护记录' : '新增维护记录',
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
                        // 鱼缸选择
                        if (_aquariums.isNotEmpty)
                          FormDropdown<Aquarium?>(
                            label: '关联鱼缸',
                            value: _selectedAquarium,
                            items: [null, ..._aquariums],
                            itemDisplayName: (aquarium) {
                              if (aquarium == null) return '请选择鱼缸';
                              return aquarium.name;
                            },
                            onChanged: (v) =>
                                setState(() => _selectedAquarium = v),
                          ),
                        if (_aquariums.isNotEmpty) const SizedBox(height: 20),

                        // 操作类型
                        FormDropdown<MaintenanceOperation>(
                          label: '操作类型',
                          value: _selectedOperation,
                          items: MaintenanceOperation.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) =>
                              setState(() => _selectedOperation = v),
                        ),
                        const SizedBox(height: 20),

                        // 耗材选择（可选）
                        if (_consumables.isNotEmpty)
                          FormDropdown<Consumable?>(
                            label: '关联耗材',
                            value: _selectedConsumable,
                            items: [null, ..._consumables],
                            itemDisplayName: (consumable) {
                              if (consumable == null) return '不关联耗材';
                              return _consumableDisplayName(consumable);
                            },
                            onChanged: (v) =>
                                setState(() => _selectedConsumable = v),
                          ),
                        if (_consumables.isNotEmpty) const SizedBox(height: 20),

                        // 耗材数量（当选择了耗材时显示）
                        if (_selectedConsumable != null)
                          FormInput(
                            label: '消耗数量',
                            hintText: '可选，例如 50',
                            helper: _consumableAmountHelper,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                        if (_selectedConsumable != null)
                          const SizedBox(height: 20),

                        // 操作时间
                        FormDatePicker(
                          label: '操作时间',
                          date: _operationDate,
                          onChanged: (d) => setState(() => _operationDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 下次提醒时间
                        FormDatePicker(
                          label: '下次提醒时间',
                          date: _nextReminderDate,
                          onChanged: (d) =>
                              setState(() => _nextReminderDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 是否已提醒
                        FormSwitch(
                          label: '是否已提醒',
                          value: _isReminded,
                          onChanged: (v) => setState(() => _isReminded = v),
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
              // 底部保存按钮
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
    );
  }
}
