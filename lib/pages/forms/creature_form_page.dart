// lib/pages/creature_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/creature.dart';
import 'package:aquarium_diary/pages/forms/widgets/formTools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class CreatureFormPage extends StatefulWidget {
  final Creature? creature; // 传入 null 表示新建，否则编辑
  final int? initialAquariumId; // 可选，预选鱼缸ID

  const CreatureFormPage({Key? key, this.creature, this.initialAquariumId})
    : super(key: key);

  @override
  _CreatureFormPageState createState() => _CreatureFormPageState();
}

class _CreatureFormPageState extends State<CreatureFormPage> {
  // 输入辅助器
  late InputHelper _speciesNameHelper;
  late InputHelper _nicknameHelper;
  late InputHelper _quantityHelper;
  late InputHelper _sizeCmHelper;
  late InputHelper _statusNoteHelper;
  late InputHelper _sourceHelper;
  late InputHelper _priceHelper;
  late InputHelper _shippingCostHelper;
  late InputHelper _packagingCostHelper;
  late InputHelper _tagsHelper; // 标签，逗号分隔
  late InputHelper _notesHelper;

  // 其他状态变量
  CreatureCategory? _selectedCategory;
  Aggressiveness _selectedAggressiveness = Aggressiveness.peaceful;
  CoralCompatibility _selectedCoralCompatibility = CoralCompatibility.safe;
  CreatureStatus? _selectedStatusType;
  DateTime? _entryDate;
  DateTime? _quarantineEndDate;
  DateTime? _purchaseDate;
  bool _isFavorite = false;
  bool _isArchived = false;

  // 鱼缸列表及选中项
  List<Aquarium> _aquariums = [];
  Aquarium? _selectedAquarium; // null 表示不关联

  // 表单验证错误
  String? _speciesNameError;

  @override
  void initState() {
    super.initState();
    final creature = widget.creature;

    _speciesNameHelper = InputHelper(defaultText: creature?.speciesName);
    _nicknameHelper = InputHelper(defaultText: creature?.nickname ?? '');
    _quantityHelper = InputHelper(
      defaultText: (creature?.quantity ?? 1).toString(),
    );
    _sizeCmHelper = InputHelper(
      defaultText: creature?.sizeCm?.toString() ?? '',
    );
    _statusNoteHelper = InputHelper(defaultText: creature?.statusNote ?? '');
    _sourceHelper = InputHelper(defaultText: creature?.source ?? '');
    _priceHelper = InputHelper(defaultText: creature?.price?.toString() ?? '');
    _shippingCostHelper = InputHelper(
      defaultText: creature?.shippingCost?.toString() ?? '',
    );
    _packagingCostHelper = InputHelper(
      defaultText: creature?.packagingCost?.toString() ?? '',
    );
    _tagsHelper = InputHelper(defaultText: creature?.tags?.join(', ') ?? '');
    _notesHelper = InputHelper(defaultText: creature?.notes ?? '');

    _selectedCategory = creature?.category;
    _selectedAggressiveness =
        creature?.aggressiveness ?? Aggressiveness.peaceful; // 默认温和
    _selectedCoralCompatibility =
        creature?.coralCompatibility ?? CoralCompatibility.safe;
    _selectedStatusType = creature?.statusType;
    _entryDate = creature?.entryDate;
    _quarantineEndDate = creature?.quarantineEndDate;
    _purchaseDate = creature?.purchaseDate;
    _isFavorite = creature?.isFavorite ?? false;
    _isArchived = creature?.isArchived ?? false;

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
      } else if (widget.creature?.aquariumId != null) {
        _selectedAquarium = _aquariums.firstWhere(
          (a) => a.id == widget.creature!.aquariumId,
          orElse: () => null as Aquarium,
        );
      }
    });
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证必填
    if (_speciesNameHelper.text.trim().isEmpty) {
      setState(() {
        _speciesNameError = '请输入物种名';
      });
      return;
    }
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择生物分类')));
      return;
    }
    if (_selectedStatusType == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择状态类型')));
      return;
    }

    // 解析数字字段
    int? quantity = int.tryParse(_quantityHelper.text);
    double? sizeCm = _sizeCmHelper.text.isEmpty
        ? null
        : double.tryParse(_sizeCmHelper.text);
    double? price = _priceHelper.text.isEmpty
        ? null
        : double.tryParse(_priceHelper.text);
    double? shippingCost = _shippingCostHelper.text.isEmpty
        ? null
        : double.tryParse(_shippingCostHelper.text);
    double? packagingCost = _packagingCostHelper.text.isEmpty
        ? null
        : double.tryParse(_packagingCostHelper.text);

    // 数字格式验证
    if (quantity == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('数量必须为整数')));
      return;
    }
    if (_sizeCmHelper.text.isNotEmpty && sizeCm == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('尺寸必须为数字')));
      return;
    }
    if (_priceHelper.text.isNotEmpty && price == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('价格必须为数字')));
      return;
    }
    if (_shippingCostHelper.text.isNotEmpty && shippingCost == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('运费必须为数字')));
      return;
    }
    if (_packagingCostHelper.text.isNotEmpty && packagingCost == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('包装费必须为数字')));
      return;
    }

    // 计算总成本
    double totalCost =
        (price ?? 0) + (shippingCost ?? 0) + (packagingCost ?? 0);

    // 解析标签
    List<String> tags = [];
    if (_tagsHelper.text.trim().isNotEmpty) {
      tags = _tagsHelper.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    // 构建 Creature 对象
    final now = DateTime.now();
    final newCreature = Creature(
      // id: widget.creature?.id,
      aquariumId: _selectedAquarium?.id,
      category: _selectedCategory!,
      speciesName: _speciesNameHelper.text.trim(),
      nickname: _nicknameHelper.text.trim().isEmpty
          ? null
          : _nicknameHelper.text.trim(),
      quantity: quantity,
      sizeCm: sizeCm,
      aggressiveness: _selectedAggressiveness!,
      coralCompatibility:
          _selectedCoralCompatibility ?? CoralCompatibility.safe,
      mainImageId: widget.creature?.mainImageId, // 保持原样，图片暂不处理
      entryDate: _entryDate,
      quarantineEndDate: _quarantineEndDate,
      statusType: _selectedStatusType!,
      statusNote: _statusNoteHelper.text.trim().isEmpty
          ? null
          : _statusNoteHelper.text.trim(),
      isFavorite: _isFavorite,
      source: _sourceHelper.text.trim().isEmpty
          ? null
          : _sourceHelper.text.trim(),
      purchaseDate: _purchaseDate,
      purchaseScreenshotId: widget.creature?.purchaseScreenshotId, // 保持原样
      price: price,
      shippingCost: shippingCost,
      packagingCost: packagingCost,
      // totalCost: totalCost, // 计算字段
      tags: tags,
      isArchived: _isArchived,
      createdAt: widget.creature?.createdAt ?? now,
      updatedAt: now,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.creature?.id != null) newCreature.id = widget.creature!.id;

    Navigator.pop(context, newCreature);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.creature != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(
          isEditing ? '编辑生物' : '新建生物',
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

                        // 基础信息：分类、物种名、昵称、数量、尺寸
                        FormDropdown<CreatureCategory>(
                          label: '生物分类',
                          value: _selectedCategory,
                          items: CreatureCategory.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) =>
                              setState(() => _selectedCategory = v),
                        ),
                        const SizedBox(height: 20),

                        FormInput(
                          label: '物种名',
                          hintText: '请输入物种名',
                          helper: _speciesNameHelper,
                          errorText: _speciesNameError,
                          onChanged: (_) {
                            if (_speciesNameError != null) {
                              setState(() => _speciesNameError = null);
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        FormInput(
                          label: '昵称',
                          hintText: '可选',
                          helper: _nicknameHelper,
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: FormInput(
                                label: '数量',
                                hintText: '默认1',
                                helper: _quantityHelper,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormInput(
                                label: '尺寸(cm)',
                                hintText: '可选',
                                helper: _sizeCmHelper,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 攻击性与珊瑚兼容性
                        Row(
                          children: [
                            Expanded(
                              child: FormDropdown<Aggressiveness>(
                                label: '攻击性',
                                value: _selectedAggressiveness,
                                items: Aggressiveness.values,
                                itemDisplayName: (e) => e.label,
                                onChanged: (v) => setState(
                                  () => _selectedAggressiveness =
                                      v ?? Aggressiveness.peaceful,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormDropdown<CoralCompatibility>(
                                label: '珊瑚兼容性',
                                value: _selectedCoralCompatibility,
                                items: CoralCompatibility.values,
                                itemDisplayName: (e) {
                                  return e.label;
                                },
                                onChanged: (v) => setState(
                                  () => _selectedCoralCompatibility =
                                      v ?? CoralCompatibility.safe,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 日期：入缸时间、检疫到期
                        Row(
                          children: [
                            Expanded(
                              child: FormDatePicker(
                                label: '入缸时间',
                                date: _entryDate,
                                onChanged: (d) =>
                                    setState(() => _entryDate = d),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormDatePicker(
                                label: '检疫到期',
                                date: _quarantineEndDate,
                                onChanged: (d) =>
                                    setState(() => _quarantineEndDate = d),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 状态类型和备注
                        FormDropdown<CreatureStatus>(
                          label: '状态类型',
                          value: _selectedStatusType,
                          items: CreatureStatus.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) =>
                              setState(() => _selectedStatusType = v),
                        ),
                        const SizedBox(height: 20),

                        FormInput(
                          label: '状态备注',
                          hintText: '可选',
                          helper: _statusNoteHelper,
                        ),
                        const SizedBox(height: 20),

                        // 是否收藏、是否归档
                        Row(
                          children: [
                            Expanded(
                              child: FormSwitch(
                                label: '收藏',
                                value: _isFavorite,
                                onChanged: (v) =>
                                    setState(() => _isFavorite = v),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormSwitch(
                                label: '归档',
                                value: _isArchived,
                                onChanged: (v) =>
                                    setState(() => _isArchived = v),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 来源商家
                        FormInput(
                          label: '来源商家',
                          hintText: '可选',
                          helper: _sourceHelper,
                        ),
                        const SizedBox(height: 20),

                        // 购买日期
                        FormDatePicker(
                          label: '购买日期',
                          date: _purchaseDate,
                          onChanged: (d) => setState(() => _purchaseDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 费用三行
                        Row(
                          children: [
                            Expanded(
                              child: FormInput(
                                label: '价格',
                                hintText: '可选',
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
                                label: '运费',
                                hintText: '可选',
                                helper: _shippingCostHelper,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormInput(
                                label: '包装费',
                                hintText: '可选',
                                helper: _packagingCostHelper,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 标签
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
