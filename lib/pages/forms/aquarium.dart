// lib/pages/aquarium_form_page.dart

import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

// ---------- 表单页面 ----------
class AquariumFormPage extends StatefulWidget {
  final Aquarium? aquarium; // 传入 null 表示新建，否则编辑

  AquariumFormPage({Key? key, this.aquarium}) : super(key: key);

  @override
  _AquariumFormPageState createState() => _AquariumFormPageState();
}

class _AquariumFormPageState extends State<AquariumFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _notesHelper;
  late InputHelper _lengthHelper;
  late InputHelper _widthHelper;
  late InputHelper _heightHelper;
  late InputHelper _capacityHelper;

  // 其他状态变量
  AquariumStructure? _selectedStructure;
  DateTime? _purchaseDate;
  bool _isActive = true; // 默认启用

  // 表单验证错误
  String? _nameError;

  @override
  void initState() {
    super.initState();
    final aquarium = widget.aquarium;

    // 初始化 InputHelper
    _nameHelper = InputHelper(defaultText: aquarium?.name);
    _notesHelper = InputHelper(defaultText: aquarium?.notes);
    _lengthHelper = InputHelper(
      defaultText: aquarium?.lengthMm?.toString() ?? '',
    );
    _widthHelper = InputHelper(
      defaultText: aquarium?.widthMm?.toString() ?? '',
    );
    _heightHelper = InputHelper(
      defaultText: aquarium?.heightMm?.toString() ?? '',
    );
    _capacityHelper = InputHelper(
      defaultText: aquarium?.capacityLiter?.toString() ?? '',
    );

    // 初始化枚举和日期
    _selectedStructure = aquarium?.structure;
    _purchaseDate = aquarium?.purchaseDate;
    _isActive = aquarium?.isActive ?? true;
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '鱼缸名称不能为空';
      });
      return;
    }
    if (_selectedStructure == null) {
      // 提示用户选择结构（可以用SnackBar）
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请选择鱼缸结构')));
      return;
    }

    // 解析数字（允许为空）
    int? length = _lengthHelper.text.isEmpty
        ? null
        : int.tryParse(_lengthHelper.text);
    int? width = _widthHelper.text.isEmpty
        ? null
        : int.tryParse(_widthHelper.text);
    int? height = _heightHelper.text.isEmpty
        ? null
        : int.tryParse(_heightHelper.text);
    double? capacity = _capacityHelper.text.isEmpty
        ? null
        : double.tryParse(_capacityHelper.text);

    // 如果数字格式错误，给出提示
    if (_lengthHelper.text.isNotEmpty && length == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('长度必须为整数')));
      return;
    }
    if (_widthHelper.text.isNotEmpty && width == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('宽度必须为整数')));
      return;
    }
    if (_heightHelper.text.isNotEmpty && height == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('高度必须为整数')));
      return;
    }
    if (_capacityHelper.text.isNotEmpty && capacity == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('容量必须为数字')));
      return;
    }

    // 构建 Aquarium 对象
    final now = DateTime.now();
    final newAquarium = Aquarium(
      // id: widget.aquarium?.id, // 编辑时保留原id
      name: _nameHelper.text.trim(),
      structure: _selectedStructure!,
      purchaseDate: _purchaseDate,
      lengthMm: length,
      widthMm: width,
      heightMm: height,
      capacityLiter: capacity,
      isActive: _isActive,
      createdAt: widget.aquarium?.createdAt ?? now, // 新建时使用当前时间
      notes: _notesHelper.text.trim().isEmpty ? null : _notesHelper.text.trim(),
    );

    if (widget.aquarium?.id != null) newAquarium.id = widget.aquarium!.id;

    // 返回上一页并传递结果
    Navigator.pop(context, newAquarium);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.aquarium != null;
    return Scaffold(
      appBar: AppBar(
        title: StText.medium(isEditing ? '编辑鱼缸' : '新建鱼缸'),
        backgroundColor: StColor.primary,
        foregroundColor: StColor.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 名称输入
            _LabeledTextField(
              label: '鱼缸名称',
              helper: _nameHelper,
              errorText: _nameError,
              onChanged: (_) {
                if (_nameError != null) {
                  setState(() => _nameError = null);
                }
              },
            ),
            const SizedBox(height: 16),

            // 结构选择
            _LabeledDropdown<AquariumStructure>(
              label: '鱼缸结构',
              value: _selectedStructure,
              items: AquariumStructure.values,
              itemDisplayName: (AquariumStructure e) => e.label,
              onChanged: (value) => setState(() => _selectedStructure = value),
            ),
            const SizedBox(height: 16),

            // 购买日期
            _LabeledDatePicker(
              label: '购买时间',
              date: _purchaseDate,
              onChanged: (date) => setState(() => _purchaseDate = date),
            ),
            const SizedBox(height: 16),

            // 尺寸三行
            Row(
              children: [
                Expanded(
                  child: _LabeledTextField(
                    label: '长度(mm)',
                    helper: _lengthHelper,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _LabeledTextField(
                    label: '宽度(mm)',
                    helper: _widthHelper,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _LabeledTextField(
                    label: '高度(mm)',
                    helper: _heightHelper,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 水体容量
            _LabeledTextField(
              label: '水体容量(L)',
              helper: _capacityHelper,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 16),

            // 是否启用
            _LabeledSwitch(
              label: '是否启用',
              value: _isActive,
              onChanged: (v) => setState(() => _isActive = v),
            ),
            const SizedBox(height: 16),

            // 备注
            _LabeledTextField(label: '备注', helper: _notesHelper, maxLines: 3),
            const SizedBox(height: 32),

            // 保存按钮
            Center(
              child: Tapped(
                onTap: _handleSave,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: StColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: StText.medium(
                      '保存',
                      style: const TextStyle(color: StColor.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- 复用组件 ----------

/// 带标签的文本输入框
class _LabeledTextField extends StatelessWidget {
  final String label;
  final InputHelper helper;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onChanged;

  const _LabeledTextField({
    Key? key,
    required this.label,
    required this.helper,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StText.medium(label, style: const TextStyle(color: StColor.darkGray)),
        const SizedBox(height: 4),
        TextField(
          controller: helper.controller,
          focusNode: helper.focusNode,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: StColor.halfGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: StColor.primary, width: 2),
            ),
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
          style: const TextStyle(color: StColor.black),
        ),
      ],
    );
  }
}

/// 带标签的下拉选择器
class _LabeledDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) itemDisplayName;
  final void Function(T?) onChanged;

  const _LabeledDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.itemDisplayName,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StText.medium(label, style: const TextStyle(color: StColor.darkGray)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: StColor.halfGray),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: StText.normal('请选择'),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: StColor.gray),
              items: items.map((e) {
                return DropdownMenuItem<T>(
                  value: e,
                  child: StText.normal(itemDisplayName(e)),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

/// 带标签的日期选择器
class _LabeledDatePicker extends StatelessWidget {
  final String label;
  final DateTime? date;
  final void Function(DateTime?) onChanged;

  const _LabeledDatePicker({
    Key? key,
    required this.label,
    required this.date,
    required this.onChanged,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final initialDate = date ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StText.medium(label, style: const TextStyle(color: StColor.darkGray)),
        const SizedBox(height: 4),
        Tapped(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: StColor.halfGray),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StText.normal(
                  date == null ? '未选择' : _formatDate(date!),
                  style: TextStyle(
                    color: date == null ? StColor.halfGray : StColor.black,
                  ),
                ),
                Icon(Icons.calendar_today, size: 16, color: StColor.gray),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

/// 带标签的开关
class _LabeledSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool) onChanged;

  const _LabeledSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StText.medium(label, style: const TextStyle(color: StColor.darkGray)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: StColor.primary,
          activeTrackColor: StColor.primary.withOpacity(0.5),
        ),
      ],
    );
  }
}
