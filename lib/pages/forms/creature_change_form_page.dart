// lib/pages/creature_status_change_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/creature.dart';
import 'package:aquarium_diary/database/models/creature_status_change.dart';
import 'package:aquarium_diary/pages/forms/widgets/form_tools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/input_helper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class CreatureStatusChangeFormPage extends StatefulWidget {
  final CreatureStatusChange? statusChange; // 传入 null 表示新建，否则编辑
  final int? initialCreatureId; // 可选，预选生物ID（例如从生物详情页进入时）

  const CreatureStatusChangeFormPage({
    Key? key,
    this.statusChange,
    this.initialCreatureId,
  }) : super(key: key);

  @override
  _CreatureStatusChangeFormPageState createState() =>
      _CreatureStatusChangeFormPageState();
}

class _CreatureStatusChangeFormPageState
    extends State<CreatureStatusChangeFormPage> {
  // 输入辅助器
  late InputHelper _descriptionHelper;
  late InputHelper _notesHelper;

  // 其他状态变量
  Creature? _selectedCreature; // 选中的生物
  CreatureStatus? _previousStatus;
  CreatureStatus? _newStatus;
  DateTime? _changeDate;

  // 生物列表
  List<Creature> _creatures = [];

  // 表单验证错误
  String? _descriptionError;

  @override
  void initState() {
    super.initState();
    final statusChange = widget.statusChange;

    _descriptionHelper = InputHelper(defaultText: statusChange?.description);
    _notesHelper = InputHelper(defaultText: statusChange?.notes ?? '');

    _previousStatus = statusChange?.previousStatus;
    _newStatus = statusChange?.newStatus;
    _changeDate = statusChange?.changeDate;

    _loadCreatures();
  }

  // 模拟从数据库加载生物列表（实际项目请替换为真实查询）
  Future<void> _loadCreatures() async {
    // 假设有一个全局的 Isar 实例或服务
    // final isar = await Isar.getInstance();
    // final creatures = await isar.creatures.where().findAll();
    // 模拟数据
    await Future.delayed(Duration.zero);
    final mockCreatures = <Creature>[]; // 实际替换为数据库数据
    setState(() {
      _creatures = mockCreatures;
      // 预选逻辑
      if (widget.initialCreatureId != null) {
        _selectedCreature = _creatures.firstWhere(
          (c) => c.id == widget.initialCreatureId,
          orElse: () => null as Creature,
        );
      } else if (widget.statusChange?.creatureId != null) {
        _selectedCreature = _creatures.firstWhere(
          (c) => c.id == widget.statusChange!.creatureId,
          orElse: () => null as Creature,
        );
      }
    });
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证必填
    if (_selectedCreature == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择生物')));
      return;
    }
    if (_previousStatus == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择变化前状态')));
      return;
    }
    if (_newStatus == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择变化后状态')));
      return;
    }
    if (_descriptionHelper.text.trim().isEmpty) {
      setState(() {
        _descriptionError = '请输入状态变化描述';
      });
      return;
    }
    if (_changeDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择变化时间')));
      return;
    }

    // 构建 CreatureStatusChange 对象
    final now = DateTime.now();
    final newStatusChange = CreatureStatusChange(
      // id: widget.statusChange?.id,
      creatureId: _selectedCreature!.id!,
      previousStatus: _previousStatus!,
      newStatus: _newStatus!,
      description: _descriptionHelper.text.trim(),
      changeDate: _changeDate!,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
      createdAt: widget.statusChange?.createdAt ?? now,
    );

    if (widget.statusChange?.id != null) {
      newStatusChange.id = widget.statusChange!.id;
    }

    Navigator.pop(context, newStatusChange);
  }

  // 辅助函数：显示生物名称
  String _creatureDisplayName(Creature creature) {
    if (creature.nickname != null && creature.nickname!.isNotEmpty) {
      return '${creature.speciesName} (${creature.nickname})';
    }
    return creature.speciesName;
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.statusChange != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(
          isEditing ? '编辑状态变化' : '新增状态变化',
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
                        // 生物选择
                        if (_creatures.isNotEmpty)
                          FormDropdown<Creature?>(
                            label: '生物',
                            value: _selectedCreature,
                            items: [null, ..._creatures],
                            itemDisplayName: (creature) {
                              if (creature == null) return '请选择生物';
                              return _creatureDisplayName(creature);
                            },
                            onChanged: (v) =>
                                setState(() => _selectedCreature = v),
                          ),
                        if (_creatures.isNotEmpty) const SizedBox(height: 20),

                        // 前后状态（两列）
                        Row(
                          children: [
                            Expanded(
                              child: FormDropdown<CreatureStatus>(
                                label: '变化前状态',
                                value: _previousStatus,
                                items: CreatureStatus.values,
                                itemDisplayName: (e) => e.label,
                                onChanged: (v) =>
                                    setState(() => _previousStatus = v),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormDropdown<CreatureStatus>(
                                label: '变化后状态',
                                value: _newStatus,
                                items: CreatureStatus.values,
                                itemDisplayName: (e) => e.label,
                                onChanged: (v) =>
                                    setState(() => _newStatus = v),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 变化时间
                        FormDatePicker(
                          label: '变化时间',
                          date: _changeDate,
                          onChanged: (d) => setState(() => _changeDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 状态变化描述
                        FormInput(
                          label: '状态变化描述',
                          hintText: '例如：换水后状态好转',
                          helper: _descriptionHelper,
                          errorText: _descriptionError,
                          maxLines: 2,
                          onChanged: (_) {
                            if (_descriptionError != null) {
                              setState(() => _descriptionError = null);
                            }
                          },
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
