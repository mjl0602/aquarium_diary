// lib/pages/schedule_plan_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/consumable.dart';
import 'package:aquarium_diary/database/models/schedule_plan.dart';
import 'package:aquarium_diary/pages/forms/widgets/form_tools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/input_helper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

// 如果需要，可以将 FormTimePicker 放在 formTools.dart 中
class FormTimePicker extends StatelessWidget {
  final String label;
  final String? time; // 格式 "HH:mm"
  final void Function(String?) onChanged;

  const FormTimePicker({
    Key? key,
    required this.label,
    required this.time,
    required this.onChanged,
  }) : super(key: key);

  Future<void> _selectTime(BuildContext context) async {
    final now = DateTime.now();
    final initialTime = time != null
        ? TimeOfDay(
            hour: int.parse(time!.split(':')[0]),
            minute: int.parse(time!.split(':')[1]),
          )
        : TimeOfDay.now();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      onChanged('${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}');
    }
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
          onTap: () => _selectTime(context),
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
                  time == null ? '未选择' : time!,
                  style: TextStyle(
                    color: time == null ? StColor.halfGray : StColor.black,
                  ),
                ),
                Icon(Icons.access_time, size: 16, color: StColor.gray),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SchedulePlanFormPage extends StatefulWidget {
  final SchedulePlan? plan;           // 传入 null 表示新建，否则编辑
  final int? initialAquariumId;       // 可选，预选鱼缸ID

  const SchedulePlanFormPage({Key? key, this.plan, this.initialAquariumId})
      : super(key: key);

  @override
  _SchedulePlanFormPageState createState() => _SchedulePlanFormPageState();
}

class _SchedulePlanFormPageState extends State<SchedulePlanFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _cycleDaysHelper;       // 自定义天数
  late InputHelper _reminderTimeHelper;    // 提醒时间，格式 "HH:mm"
  late InputHelper _advanceReminderMinutesHelper;
  late InputHelper _estimatedDurationMinutesHelper;
  late InputHelper _notesHelper;

  // 其他状态变量
  ScheduleOperation? _selectedOperation;
  CycleType? _selectedCycleType;
  Aquarium? _selectedAquarium;      // null 表示通用计划
  Consumable? _selectedConsumable;
  DateTime? _lastExecuteDate;
  DateTime? _nextExecuteDate;
  bool _isEnabled = true;

  // 下拉列表数据
  List<Aquarium> _aquariums = [];
  List<Consumable> _consumables = [];

  @override
  void initState() {
    super.initState();
    final plan = widget.plan;

    _nameHelper = InputHelper(defaultText: plan?.name);
    _cycleDaysHelper = InputHelper(
        defaultText: plan?.cycleDays?.toString() ?? '');
    _reminderTimeHelper = InputHelper(defaultText: plan?.reminderTime ?? '');
    _advanceReminderMinutesHelper = InputHelper(
        defaultText: (plan?.advanceReminderMinutes ?? 0).toString());
    _estimatedDurationMinutesHelper = InputHelper(
        defaultText: plan?.estimatedDurationMinutes?.toString() ?? '');
    _notesHelper = InputHelper(defaultText: plan?.notes ?? '');

    _selectedOperation = plan?.operation;
    _selectedCycleType = plan?.cycleType;
    _lastExecuteDate = plan?.lastExecuteDate;
    _nextExecuteDate = plan?.nextExecuteDate;
    _isEnabled = plan?.isEnabled ?? true;

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
      } else if (widget.plan?.aquariumId != null) {
        _selectedAquarium = _aquariums.firstWhere(
          (a) => a.id == widget.plan!.aquariumId,
          orElse: () => null as Aquarium,
        );
      }

      // 预选耗材
      if (widget.plan?.consumableId != null) {
        _selectedConsumable = _consumables.firstWhere(
          (c) => c.id == widget.plan!.consumableId,
          orElse: () => null as Consumable,
        );
      }
    });
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证必填
    if (_nameHelper.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入计划名称')),
      );
      return;
    }
    if (_selectedOperation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请选择操作类型')),
      );
      return;
    }
    if (_selectedCycleType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请选择周期类型')),
      );
      return;
    }

    // 验证自定义天数
    int? cycleDays;
    if (_selectedCycleType == CycleType.custom) {
      if (_cycleDaysHelper.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('请填写自定义周期天数')),
        );
        return;
      }
      cycleDays = int.tryParse(_cycleDaysHelper.text);
      if (cycleDays == null || cycleDays <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('自定义天数必须为正整数')),
        );
        return;
      }
    }

    // 验证提前提醒分钟数
    int? advanceReminderMinutes = int.tryParse(_advanceReminderMinutesHelper.text);
    if (advanceReminderMinutes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('提前提醒分钟数必须为整数')),
      );
      return;
    }

    // 验证预计耗时（可选）
    int? estimatedDurationMinutes;
    if (_estimatedDurationMinutesHelper.text.isNotEmpty) {
      estimatedDurationMinutes = int.tryParse(_estimatedDurationMinutesHelper.text);
      if (estimatedDurationMinutes == null || estimatedDurationMinutes <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('预计耗时必须为正整数')),
        );
        return;
      }
    }

    // 提醒时间格式已在选择器中保证，直接取字符串
    String? reminderTime = _reminderTimeHelper.text.trim().isEmpty
        ? null
        : _reminderTimeHelper.text.trim();

    // 构建 SchedulePlan 对象
    final now = DateTime.now();
    final newPlan = SchedulePlan(
      // id: widget.plan?.id,
      aquariumId: _selectedAquarium?.id, // null 表示通用
      name: _nameHelper.text.trim(),
      operation: _selectedOperation!,
      cycleType: _selectedCycleType!,
      cycleDays: cycleDays,
      reminderTime: reminderTime,
      advanceReminderMinutes: advanceReminderMinutes,
      isEnabled: _isEnabled,
      lastExecuteDate: _lastExecuteDate,
      nextExecuteDate: _nextExecuteDate,
      consumableId: _selectedConsumable?.id,
      lastMaintenanceId: widget.plan?.lastMaintenanceId, // 保留原值，不可编辑
      estimatedDurationMinutes: estimatedDurationMinutes,
      createdAt: widget.plan?.createdAt ?? now,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.plan?.id != null) newPlan.id = widget.plan!.id;

    Navigator.pop(context, newPlan);
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
    final isEditing = widget.plan != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(
          isEditing ? '编辑周期计划' : '新建周期计划',
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 计划名称
                        FormInput(
                          label: '计划名称',
                          hintText: '例如：每周换水',
                          helper: _nameHelper,
                        ),
                        const SizedBox(height: 20),

                        // 操作类型
                        FormDropdown<ScheduleOperation>(
                          label: '操作类型',
                          value: _selectedOperation,
                          items: ScheduleOperation.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) => setState(() => _selectedOperation = v),
                        ),
                        const SizedBox(height: 20),

                        // 周期类型
                        FormDropdown<CycleType>(
                          label: '周期类型',
                          value: _selectedCycleType,
                          items: CycleType.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) => setState(() => _selectedCycleType = v),
                        ),
                        const SizedBox(height: 20),

                        // 自定义天数（仅当周期类型为自定义时显示）
                        if (_selectedCycleType == CycleType.custom)
                          FormInput(
                            label: '自定义天数',
                            hintText: '请输入天数',
                            helper: _cycleDaysHelper,
                            keyboardType: TextInputType.number,
                          ),
                        if (_selectedCycleType == CycleType.custom) const SizedBox(height: 20),

                        // 提醒时间
                        FormTimePicker(
                          label: '提醒时间',
                          time: _reminderTimeHelper.text.isEmpty ? null : _reminderTimeHelper.text,
                          onChanged: (t) => _reminderTimeHelper.text = t,
                        ),
                        const SizedBox(height: 20),

                        // 提前提醒分钟数
                        FormInput(
                          label: '提前提醒分钟数',
                          hintText: '默认0',
                          helper: _advanceReminderMinutesHelper,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),

                        // 关联鱼缸（可选）
                        if (_aquariums.isNotEmpty)
                          FormDropdown<Aquarium?>(
                            label: '关联鱼缸',
                            value: _selectedAquarium,
                            items: [null, ..._aquariums],
                            itemDisplayName: (aquarium) {
                              if (aquarium == null) return '通用（不关联）';
                              return aquarium.name;
                            },
                            onChanged: (v) => setState(() => _selectedAquarium = v),
                          ),
                        if (_aquariums.isNotEmpty) const SizedBox(height: 20),

                        // 关联耗材（可选）
                        if (_consumables.isNotEmpty)
                          FormDropdown<Consumable?>(
                            label: '关联耗材',
                            value: _selectedConsumable,
                            items: [null, ..._consumables],
                            itemDisplayName: (consumable) {
                              if (consumable == null) return '不关联耗材';
                              return _consumableDisplayName(consumable);
                            },
                            onChanged: (v) => setState(() => _selectedConsumable = v),
                          ),
                        if (_consumables.isNotEmpty) const SizedBox(height: 20),

                        // 上次执行日期
                        FormDatePicker(
                          label: '上次执行日期',
                          date: _lastExecuteDate,
                          onChanged: (d) => setState(() => _lastExecuteDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 下次执行日期
                        FormDatePicker(
                          label: '下次执行日期',
                          date: _nextExecuteDate,
                          onChanged: (d) => setState(() => _nextExecuteDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 预计耗时（分钟）
                        FormInput(
                          label: '预计耗时（分钟）',
                          hintText: '可选',
                          helper: _estimatedDurationMinutesHelper,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),

                        // 是否启用
                        FormSwitch(
                          label: '是否启用',
                          value: _isEnabled,
                          onChanged: (v) => setState(() => _isEnabled = v),
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