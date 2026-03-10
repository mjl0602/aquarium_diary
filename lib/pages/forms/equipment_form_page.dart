// lib/pages/equipment_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/equipment.dart';
import 'package:aquarium_diary/pages/forms/widgets/formTools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class EquipmentFormPage extends StatefulWidget {
  final Equipment? equipment; // 传入 null 表示新建，否则编辑
  final int? initialAquariumId; // 可选，预选鱼缸ID（例如从鱼缸详情页进入时）

  const EquipmentFormPage({Key? key, this.equipment, this.initialAquariumId})
    : super(key: key);

  @override
  _EquipmentFormPageState createState() => _EquipmentFormPageState();
}

class _EquipmentFormPageState extends State<EquipmentFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _priceHelper;
  late InputHelper _powerWattHelper;
  late InputHelper _socketCountHelper;
  late InputHelper _socketInfoHelper;
  late InputHelper _tagsHelper; // 标签，输入逗号分隔
  late InputHelper _notesHelper;

  // 其他状态变量
  EquipmentStatus? _selectedStatus;
  DateTime? _startDate;
  DateTime? _purchaseDate;
  DateTime? _warrantyDate;

  // 鱼缸列表及选中项
  List<Aquarium> _aquariums = [];
  Aquarium? _selectedAquarium; // null 表示不关联

  // 表单验证错误
  String? _nameError;

  @override
  void initState() {
    super.initState();
    final equipment = widget.equipment;

    _nameHelper = InputHelper(defaultText: equipment?.name);
    _priceHelper = InputHelper(defaultText: equipment?.price?.toString() ?? '');
    _powerWattHelper = InputHelper(
      defaultText: equipment?.powerWatt?.toString() ?? '',
    );
    _socketCountHelper = InputHelper(
      defaultText: equipment?.socketCount?.toString() ?? '',
    );
    _socketInfoHelper = InputHelper(defaultText: equipment?.socketInfo ?? '');
    // 将标签列表转换为逗号分隔字符串
    _tagsHelper = InputHelper(defaultText: equipment?.tags?.join(', ') ?? '');
    _notesHelper = InputHelper(defaultText: equipment?.notes);

    _selectedStatus = equipment?.status ?? EquipmentStatus.active; // 默认正常使用
    _startDate = equipment?.startDate;
    _purchaseDate = equipment?.purchaseDate;
    _warrantyDate = equipment?.warrantyDate;

    _loadAquariums();
  }

  // 模拟从数据库加载鱼缸列表（实际项目请替换为真实查询）
  Future<void> _loadAquariums() async {
    // 假设有一个全局的 Isar 实例或服务
    // final isar = await Isar.getInstance();
    // final aquariums = await isar.aquariums.where().findAll();
    // 模拟数据
    await Future.delayed(Duration.zero);
    final mockAquariums = <Aquarium>[]; // 实际替换为数据库数据
    setState(() {
      _aquariums = mockAquariums;
      // 预选逻辑
      if (widget.initialAquariumId != null) {
        _selectedAquarium = _aquariums.firstWhere(
          (a) => a.id == widget.initialAquariumId,
          orElse: () => null as Aquarium,
        );
      } else if (widget.equipment?.aquariumId != null) {
        _selectedAquarium = _aquariums.firstWhere(
          (a) => a.id == widget.equipment!.aquariumId,
          orElse: () => null as Aquarium,
        );
      }
    });
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '请输入设备名称';
      });
      return;
    }
    if (_selectedStatus == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择设备状态')));
      return;
    }

    // 解析数字字段
    double? price = _priceHelper.text.isEmpty
        ? null
        : double.tryParse(_priceHelper.text);
    double? powerWatt = _powerWattHelper.text.isEmpty
        ? null
        : double.tryParse(_powerWattHelper.text);
    int? socketCount = _socketCountHelper.text.isEmpty
        ? null
        : int.tryParse(_socketCountHelper.text);

    // 数字格式验证
    if (_priceHelper.text.isNotEmpty && price == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('价格必须为数字')));
      return;
    }
    if (_powerWattHelper.text.isNotEmpty && powerWatt == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('功率必须为数字')));
      return;
    }
    if (_socketCountHelper.text.isNotEmpty && socketCount == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('插座数量必须为整数')));
      return;
    }

    // 解析标签：按逗号分隔，去除空格，过滤空字符串
    List<String> tags = [];
    if (_tagsHelper.text.trim().isNotEmpty) {
      tags = _tagsHelper.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    // 构建 Equipment 对象
    final now = DateTime.now();
    final newEquipment = Equipment(
      // id: widget.equipment?.id,
      aquariumId: _selectedAquarium?.id, // 若未选择鱼缸，则为 null
      name: _nameHelper.text.trim(),
      price: price,
      powerWatt: powerWatt,
      status: _selectedStatus!,
      startDate: _startDate,
      socketCount: socketCount,
      socketInfo: _socketInfoHelper.text.trim().isEmpty
          ? null
          : _socketInfoHelper.text.trim(),
      tags: tags.isEmpty ? [] : tags,
      purchaseDate: _purchaseDate,
      warrantyDate: _warrantyDate,
      createdAt: widget.equipment?.createdAt ?? now,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.equipment?.id != null) newEquipment.id = widget.equipment!.id;

    // 返回上一页并传递结果
    Navigator.pop(context, newEquipment);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.equipment != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(
          isEditing ? '编辑设备' : '新建设备',
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
                        // 鱼缸选择（可选）
                        if (_aquariums.isNotEmpty)
                          FormDropdown<Aquarium?>(
                            label: '关联鱼缸',
                            value: _selectedAquarium,
                            items: [null, ..._aquariums],
                            itemDisplayName: (aquarium) {
                              if (aquarium == null) return '不关联';
                              return aquarium.name;
                            },
                            onChanged: (v) =>
                                setState(() => _selectedAquarium = v),
                          ),
                        if (_aquariums.isNotEmpty) const SizedBox(height: 20),

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

                        // 设备状态
                        FormDropdown<EquipmentStatus>(
                          label: '设备状态',
                          value: _selectedStatus,
                          items: EquipmentStatus.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) => setState(() => _selectedStatus = v),
                        ),
                        const SizedBox(height: 20),

                        // 购买价格 & 功率（一行）
                        Row(
                          children: [
                            Expanded(
                              child: FormInput(
                                label: '购买价格',
                                hintText: '价格',
                                helper: _priceHelper,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormInput(
                                label: '功率(瓦)',
                                hintText: '功率',
                                helper: _powerWattHelper,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 购买日期
                        FormDatePicker(
                          label: '购买日期',
                          date: _purchaseDate,
                          onChanged: (d) => setState(() => _purchaseDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 开始使用日期
                        FormDatePicker(
                          label: '开始使用日期',
                          date: _startDate,
                          onChanged: (d) => setState(() => _startDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 保修到期日
                        FormDatePicker(
                          label: '保修到期日',
                          date: _warrantyDate,
                          onChanged: (d) => setState(() => _warrantyDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 插座占用数量 & 插座位置（一行）
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FormInput(
                                label: '占用插座数量',
                                hintText: '数量',
                                helper: _socketCountHelper,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: FormInput(
                                label: '插座位置',
                                hintText: '如"排插1-3"',
                                helper: _socketInfoHelper,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 标签（逗号分隔）
                        FormInput(
                          label: '标签',
                          hintText: '多个标签用逗号分隔',
                          helper: _tagsHelper,
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
    );
  }
}
