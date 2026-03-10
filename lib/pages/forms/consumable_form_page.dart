// lib/pages/consumable_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/consumable.dart';
import 'package:aquarium_diary/pages/forms/widgets/formTools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class ConsumableFormPage extends StatefulWidget {
  final Consumable? consumable; // 传入 null 表示新建，否则编辑
  final int? initialAquariumId; // 可选，预选鱼缸ID（例如从鱼缸详情页进入时）

  const ConsumableFormPage({Key? key, this.consumable, this.initialAquariumId})
    : super(key: key);

  @override
  _ConsumableFormPageState createState() => _ConsumableFormPageState();
}

class _ConsumableFormPageState extends State<ConsumableFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _capacityHelper;
  late InputHelper _unitHelper;
  late InputHelper _priceHelper;
  late InputHelper _estimatedUsesHelper;
  late InputHelper _estimatedDaysHelper;
  late InputHelper _usedCountHelper;
  late InputHelper _notesHelper;

  // 其他状态变量
  ConsumableType? _selectedType;
  DateTime? _purchaseDate;
  DateTime? _usedDate;
  bool _isEmpty = false;

  Aquarium? _selectedAquarium; // 若为 null 表示通用（aquariumId = null）

  // 表单验证错误
  String? _nameError;

  @override
  void initState() {
    super.initState();
    final consumable = widget.consumable;

    // 初始化 InputHelper
    _nameHelper = InputHelper(defaultText: consumable?.name);
    _capacityHelper = InputHelper(
      defaultText: consumable?.capacity?.toString() ?? '',
    );
    _unitHelper = InputHelper(defaultText: consumable?.unit ?? '');
    _priceHelper = InputHelper(
      defaultText: consumable?.price?.toString() ?? '',
    );
    _estimatedUsesHelper = InputHelper(
      defaultText: consumable?.estimatedUses?.toString() ?? '',
    );
    _estimatedDaysHelper = InputHelper(
      defaultText: consumable?.estimatedDays?.toString() ?? '',
    );
    _usedCountHelper = InputHelper(
      defaultText: (consumable?.usedCount ?? 0).toString(),
    );
    _notesHelper = InputHelper(defaultText: consumable?.notes);

    // 初始化枚举和日期
    _selectedType = consumable?.type;
    _purchaseDate = consumable?.purchaseDate;
    _usedDate = consumable?.usedDate;
    _isEmpty = consumable?.isEmpty ?? false;
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '请输入耗材名称';
      });
      return;
    }
    if (_selectedType == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择耗材类型')));
      return;
    }

    // 解析数字字段（允许为空）
    double? capacity = _capacityHelper.text.isEmpty
        ? null
        : double.tryParse(_capacityHelper.text);
    double? price = _priceHelper.text.isEmpty
        ? null
        : double.tryParse(_priceHelper.text);
    int? estimatedUses = _estimatedUsesHelper.text.isEmpty
        ? null
        : int.tryParse(_estimatedUsesHelper.text);
    int? estimatedDays = _estimatedDaysHelper.text.isEmpty
        ? null
        : int.tryParse(_estimatedDaysHelper.text);
    int? usedCount = _usedCountHelper.text.isEmpty
        ? null
        : int.tryParse(_usedCountHelper.text);

    // 数字格式验证
    if (_capacityHelper.text.isNotEmpty && capacity == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('容量必须为数字')));
      return;
    }
    if (_priceHelper.text.isNotEmpty && price == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('价格必须为数字')));
      return;
    }
    if (_estimatedUsesHelper.text.isNotEmpty && estimatedUses == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('预计使用次数必须为整数')));
      return;
    }
    if (_estimatedDaysHelper.text.isNotEmpty && estimatedDays == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('预计使用天数必须为整数')));
      return;
    }
    if (_usedCountHelper.text.isNotEmpty && usedCount == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('已使用次数必须为整数')));
      return;
    }

    // 构建 Consumable 对象
    final now = DateTime.now();
    final newConsumable = Consumable(
      // id: widget.consumable?.id,
      aquariumId: _selectedAquarium?.id, // 若未选择鱼缸，则为 null
      name: _nameHelper.text.trim(),
      type: _selectedType!,
      capacity: capacity,
      unit: _unitHelper.text.trim().isEmpty ? null : _unitHelper.text.trim(),
      price: price,
      purchaseDate: _purchaseDate,
      estimatedUses: estimatedUses,
      estimatedDays: estimatedDays,
      usedCount: usedCount ?? 0,
      usedDate: _usedDate,
      isEmpty: _isEmpty,
      createdAt: widget.consumable?.createdAt ?? now,
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.consumable?.id != null) newConsumable.id = widget.consumable!.id;

    // 返回上一页并传递结果
    Navigator.pop(context, newConsumable);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.consumable != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(
          isEditing ? '编辑耗材' : '新建耗材',
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
                        // 耗材名称
                        FormInput(
                          label: '耗材名称',
                          hintText: '请输入耗材名称',
                          helper: _nameHelper,
                          errorText: _nameError,
                          onChanged: (_) {
                            if (_nameError != null) {
                              setState(() => _nameError = null);
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        // 耗材类型
                        FormDropdown<ConsumableType>(
                          label: '耗材类型',
                          value: _selectedType,
                          items: ConsumableType.values,
                          itemDisplayName: (e) => e.label,
                          onChanged: (v) => setState(() => _selectedType = v),
                        ),
                        const SizedBox(height: 20),

                        // 容量与单位（一行）
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FormInput(
                                label: '容量',
                                hintText: '如500',
                                helper: _capacityHelper,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: FormInput(
                                label: '单位',
                                hintText: 'g/ml',
                                helper: _unitHelper,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 购买价格
                        FormInput(
                          label: '购买价格',
                          hintText: '请输入价格',
                          helper: _priceHelper,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // 购买时间
                        FormDatePicker(
                          label: '购买时间',
                          date: _purchaseDate,
                          onChanged: (d) => setState(() => _purchaseDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 预计使用次数和天数
                        Row(
                          children: [
                            Expanded(
                              child: FormInput(
                                label: '预计使用次数',
                                hintText: '次数',
                                helper: _estimatedUsesHelper,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FormInput(
                                label: '预计使用天数',
                                hintText: '天数',
                                helper: _estimatedDaysHelper,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 已使用次数
                        FormInput(
                          label: '已使用次数',
                          hintText: '默认0',
                          helper: _usedCountHelper,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),

                        // 开始使用日期
                        FormDatePicker(
                          label: '开始使用日期',
                          date: _usedDate,
                          onChanged: (d) => setState(() => _usedDate = d),
                        ),
                        const SizedBox(height: 20),

                        // 是否已用完
                        FormSwitch(
                          label: '已用完',
                          value: _isEmpty,
                          onChanged: (v) => setState(() => _isEmpty = v),
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
