// lib/pages/aquarium_form_page.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/global/userDefault.dart';
import 'package:aquarium_diary/pages/forms/widgets/formTools.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/eazyPush.dart';
import 'package:aquarium_diary/tools/inputHelper.dart';
import 'package:aquarium_diary/views/cancelFocus.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

class AquariumFormPage extends StatefulWidget {
  final Aquarium? aquarium; // 传入 null 表示新建，否则编辑

  AquariumFormPage({Key? key, this.aquarium}) : super(key: key);

  static Future<Aquarium?> add(BuildContext context) async {
    final targetItem = await AquariumFormPage().pushAsPage<Aquarium>(context);
    if (targetItem is! Aquarium) return null;

    await isar.writeTxn(() async {
      final id = await isar.aquariums.put(targetItem);
      targetItem.id = id;
    });
    return targetItem;
  }

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
  AquariumStructure _selectedStructure = AquariumStructure.backFilter;
  DateTime? _startDate;
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
    _selectedStructure = aquarium?.structure ?? AquariumStructure.backFilter;
    _startDate = aquarium?.startDate;
    _isActive = aquarium?.isActive ?? true;

    // 方便第一次填写
    if (_nameHelper.text.isEmpty) _nameHelper.focusNode.requestFocus();
  }

  // 保存按钮点击处理
  void _handleSave() {
    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '请输入鱼缸名称';
      });
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
      structure: _selectedStructure,
      startDate: _startDate,
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
    return TapToCancelFocus(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: StText.medium(
            isEditing ? '编辑鱼缸' : '新建鱼缸',
            style: const TextStyle(color: StColor.darkGray),
          ),
          backgroundColor: StColor.lightGray,
          // elevation: 0,
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
                          // 所有表单字段（无保存按钮）
                          FormInput(
                            label: '鱼缸名称',
                            hintText: '请输入鱼缸名称',
                            helper: _nameHelper,
                            errorText: _nameError,
                            onChanged: (_) {
                              if (_nameError != null) {
                                setState(() => _nameError = null);
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          FormGridPicker<AquariumStructure>(
                            label: '鱼缸结构',
                            value: _selectedStructure,
                            items: AquariumStructure.values,
                            itemDisplayName: (e) => e.label,
                            onChanged: (v) => setState(
                              () => _selectedStructure =
                                  v ?? AquariumStructure.backFilter,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormDatePicker(
                            label: '开缸时间',
                            date: _startDate,
                            onChanged: (d) => setState(() => _startDate = d),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: FormInput(
                                  label: '长度(cm)',
                                  hintText: '填写长度',
                                  helper: _lengthHelper,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: FormInput(
                                  label: '宽度/深度(cm)',
                                  hintText: '填写深度',
                                  helper: _widthHelper,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: FormInput(
                                  label: '高度(cm)',
                                  hintText: '填写高度',
                                  helper: _heightHelper,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          FormInput(
                            label: '水体容量(L)',
                            hintText: '填写水体，方便记录换水数据',
                            helper: _capacityHelper,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FormSwitch(
                            label: '显示',
                            value: _isActive,
                            onChanged: (v) => setState(() => _isActive = v),
                          ),
                          const SizedBox(height: 20),
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
      ),
    );
  }
}
