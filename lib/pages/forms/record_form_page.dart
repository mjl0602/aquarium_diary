// lib/pages/forms/record_form_page.dart

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

class RecordFormPage extends StatefulWidget {
  final Record? record; // 传入 null 表示新建，否则编辑
  final int? aquariumId; // 可选：预填充的鱼缸ID
  final String?
  formType; // 表单类型：waterChange, feeding, waterQualityTest, newCreature, newEquipment, creatureStatusChange, equipmentStatusChange
  final void Function(Record?)? onSave; // Modal模式下的保存回调

  RecordFormPage({
    Key? key,
    this.record,
    this.aquariumId,
    this.formType,
    this.onSave,
  }) : super(key: key);

  // 拆分为：
  // 换水
  // 喂食
  // 水质测试
  // 新购生物
  // 新购设备
  // 生物状态变化
  // 设备状态变化
  static Future<Record?> add(BuildContext context, {int? aquariumId}) async {
    final targetItem = await RecordFormPage(
      aquariumId: aquariumId,
    ).pushAsPage<Record>(context);
    if (targetItem is! Record) return null;

    await isar.writeTxn(() async {
      final id = await isar.records.put(targetItem);
      targetItem.id = id;
    });
    return targetItem;
  }

  // 创建换水记录
  static Future<Record?> addWaterChange(
    BuildContext context, {
    int? aquariumId,
    double? waterVolume, // 换水量(L)
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    return await _addPreconfiguredRecord(
      context,
      formType: 'waterChange',
      aquariumId: aquariumId,
      name: '换水记录',
      recordType: RecordType.maintenance,
      operationType: OperationType.statusChange,
      valueType: waterVolume != null ? 'L' : null,
      numericValue: waterVolume,
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 创建喂食记录
  static Future<Record?> addFeeding(
    BuildContext context, {
    int? aquariumId,
    int? sourceId, // 关联的生物ID
    String? foodType,
    double? foodAmount, // 喂食量(g)
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    String name = '喂食记录';
    if (foodType != null) {
      name = '喂食 - $foodType';
    }
    return await _addPreconfiguredRecord(
      context,
      formType: 'feeding',
      aquariumId: aquariumId,
      sourceId: sourceId,
      name: name,
      recordType: RecordType.creature,
      operationType: OperationType.statusChange,
      valueType: foodAmount != null ? 'g' : null,
      numericValue: foodAmount,
      description: foodType != null ? '喂食类型: $foodType' : null,
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 创建水质测试记录
  static Future<Record?> addWaterQualityTest(
    BuildContext context, {
    int? aquariumId,
    required String testType, // 测试类型，如pH、氨氮、亚硝酸盐等
    double? testValue,
    String? unit, // 单位，如pH值无单位，氨氮为ppm等
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    return await _addPreconfiguredRecord(
      context,
      formType: 'waterQualityTest',
      aquariumId: aquariumId,
      name: '水质测试 - $testType',
      recordType: RecordType.aquarium,
      operationType: OperationType.statusChange,
      valueType: unit,
      numericValue: testValue,
      description: '水质测试: $testType',
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 创建新购生物记录
  static Future<Record?> addNewCreature(
    BuildContext context, {
    required int aquariumId,
    required String creatureName,
    int? sourceId, // 关联的生物ID（如果有的话）
    String? species,
    double? price,
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    return await _addPreconfiguredRecord(
      context,
      formType: 'newCreature',
      aquariumId: aquariumId,
      sourceId: sourceId,
      name: '新购生物: $creatureName',
      recordType: RecordType.creature,
      operationType: OperationType.create,
      valueType: price != null ? '元' : null,
      numericValue: price,
      description: species != null ? '物种: $species' : null,
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 创建新购设备记录
  static Future<Record?> addNewEquipment(
    BuildContext context, {
    required int aquariumId,
    required String equipmentName,
    int? sourceId, // 关联的设备ID（如果有的话）
    String? equipmentType,
    double? price,
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    return await _addPreconfiguredRecord(
      context,
      formType: 'newEquipment',
      aquariumId: aquariumId,
      sourceId: sourceId,
      name: '新购设备: $equipmentName',
      recordType: RecordType.equipment,
      operationType: OperationType.create,
      valueType: price != null ? '元' : null,
      numericValue: price,
      description: equipmentType != null ? '设备类型: $equipmentType' : null,
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 创建生物状态变化记录
  static Future<Record?> addCreatureStatusChange(
    BuildContext context, {
    required int aquariumId,
    required int sourceId, // 关联的生物ID
    required String creatureName,
    required String statusChange,
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 是否以bottom sheet方式显示
  }) async {
    return await _addPreconfiguredRecord(
      context,
      formType: 'creatureStatusChange',
      aquariumId: aquariumId,
      sourceId: sourceId,
      name: '$creatureName 状态变化',
      recordType: RecordType.creature,
      operationType: OperationType.statusChange,
      description: statusChange,
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 创建设备状态变化记录
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
    return await _addPreconfiguredRecord(
      context,
      formType: 'equipmentStatusChange',
      aquariumId: aquariumId,
      sourceId: sourceId,
      name: '$equipmentName 状态变化',
      recordType: RecordType.equipment,
      operationType: OperationType.statusChange,
      description: statusChange,
      notes: notes,
      recordTime: recordTime,
      isBottomSheet: isBottomSheet,
    );
  }

  // 内部方法：添加预配置记录
  static Future<Record?> _addPreconfiguredRecord(
    BuildContext context, {
    String? formType,
    int? aquariumId,
    int? sourceId,
    required String name,
    required RecordType recordType,
    required OperationType operationType,
    String? description,
    String? valueType,
    double? numericValue,
    String? notes,
    DateTime? recordTime,
    bool isBottomSheet = false, // 新增：是否以bottom sheet方式显示
  }) async {
    // 创建预配置的Record对象
    final preconfiguredRecord = Record(
      aquariumId: aquariumId,
      recordType: recordType,
      sourceId: sourceId,
      operationType: operationType,
      name: name,
      description: description,
      valueType: valueType,
      numericValue: numericValue,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );

    if (isBottomSheet) {
      // Bottom Sheet模式：使用pushAsActionSheet
      final result = await RecordFormPage(
        record: preconfiguredRecord,
        aquariumId: aquariumId,
        formType: formType,
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
      final targetItem = await RecordFormPage(
        record: preconfiguredRecord,
        aquariumId: aquariumId,
        formType: formType,
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
  _RecordFormPageState createState() => _RecordFormPageState();
}

class _RecordFormPageState extends State<RecordFormPage> {
  // 输入辅助器
  late InputHelper _nameHelper;
  late InputHelper _descriptionHelper;
  late InputHelper _valueTypeHelper;
  late InputHelper _numericValueHelper;
  late InputHelper _notesHelper;
  late InputHelper _sourceIdHelper;

  // 枚举选择状态
  RecordType _selectedRecordType = RecordType.aquarium;
  OperationType _selectedOperationType = OperationType.create;

  // 时间选择状态
  DateTime? _recordTime;

  // 其他状态
  List<int>? _photoMediaIds;
  String? _iconPath;

  // 鱼缸信息
  Aquarium? _aquarium;

  // 表单验证错误
  String? _nameError;
  String? _numericValueError;

  @override
  void initState() {
    super.initState();
    final record = widget.record;

    // 初始化 InputHelper
    _nameHelper = InputHelper(defaultText: record?.name ?? '');
    _descriptionHelper = InputHelper(defaultText: record?.description ?? '');
    _valueTypeHelper = InputHelper(defaultText: record?.valueType ?? '');
    _numericValueHelper = InputHelper(
      defaultText: record?.numericValue?.toString() ?? '',
    );
    _notesHelper = InputHelper(defaultText: record?.notes ?? '');
    _sourceIdHelper = InputHelper(
      defaultText: record?.sourceId?.toString() ?? '',
    );

    // 初始化枚举和日期
    _selectedRecordType = record?.recordType ?? RecordType.aquarium;
    _recordTime = record?.recordTime ?? DateTime.now();
    _photoMediaIds = record?.photoMediaIds;
    _iconPath = record?.iconPath;

    // 加载鱼缸信息
    _loadAquariumInfo();
    _selectedOperationType = record?.operationType ?? OperationType.create;
    _recordTime = record?.recordTime ?? DateTime.now();
    _photoMediaIds = record?.photoMediaIds;
    _iconPath = record?.iconPath;

    // 延迟请求焦点，确保Widget已经构建完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestFocusByFormType();
    });
  }

  // 根据表单类型请求焦点
  void _requestFocusByFormType() {
    final formType = widget.formType;
    switch (formType) {
      case 'waterChange':
        // 换水表单：聚焦到换水量输入框
        if (_numericValueHelper.text.isEmpty) {
          _numericValueHelper.focusNode.requestFocus();
        }
        break;
      case 'feeding':
        // 喂食表单：优先聚焦到食物类型，如果为空则聚焦到喂食量
        if (_descriptionHelper.text.isEmpty) {
          _descriptionHelper.focusNode.requestFocus();
        } else if (_numericValueHelper.text.isEmpty) {
          _numericValueHelper.focusNode.requestFocus();
        }
        break;
      case 'waterQualityTest':
        // 水质测试表单：聚焦到测试类型输入框
        if (_nameHelper.text.isEmpty) {
          _nameHelper.focusNode.requestFocus();
        }
        break;
      case 'newCreature':
        // 新购生物表单：聚焦到生物名称输入框
        if (_nameHelper.text.isEmpty) {
          _nameHelper.focusNode.requestFocus();
        }
        break;
      case 'newEquipment':
        // 新购设备表单：聚焦到设备名称输入框
        if (_nameHelper.text.isEmpty) {
          _nameHelper.focusNode.requestFocus();
        }
        break;
      case 'creatureStatusChange':
        // 生物状态变化表单：聚焦到关联生物ID输入框
        if (_sourceIdHelper.text.isEmpty) {
          _sourceIdHelper.focusNode.requestFocus();
        }
        break;
      case 'equipmentStatusChange':
        // 设备状态变化表单：聚焦到关联设备ID输入框
        if (_sourceIdHelper.text.isEmpty) {
          _sourceIdHelper.focusNode.requestFocus();
        }
        break;
      default:
        // 通用表单：聚焦到记录名称输入框
        if (_nameHelper.text.isEmpty) {
          _nameHelper.focusNode.requestFocus();
        }
        break;
    }
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
    // 验证名称
    if (_nameHelper.text.trim().isEmpty) {
      setState(() {
        _nameError = '请输入记录名称';
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

    // 验证关联创建时的记录ID（可选）
    int? sourceId;
    if (_sourceIdHelper.text.isNotEmpty) {
      sourceId = int.tryParse(_sourceIdHelper.text);
      if (sourceId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('关联创建记录ID必须是整数')));
        return;
      }
    }

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

    // 构建 Record 对象
    final now = DateTime.now();
    final newRecord = Record(
      aquariumId: aquariumId,
      recordType: _selectedRecordType,
      sourceId: sourceId,
      operationType: _selectedOperationType,
      photoMediaIds: _photoMediaIds,
      iconPath: _iconPath,
      name: _nameHelper.text.trim(),
      description: _descriptionHelper.text.trim().isEmpty
          ? null
          : _descriptionHelper.text.trim(),
      valueType: _valueTypeHelper.text.trim().isEmpty
          ? null
          : _valueTypeHelper.text.trim(),
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

  // 构建记录类型相关的提示文本
  String _getRecordTypeHint() {
    switch (_selectedRecordType) {
      case RecordType.aquarium:
        return '鱼缸相关记录，如开缸、水质测试等';
      case RecordType.creature:
        return '生物相关记录，如喂食、状态变化等';
      case RecordType.equipment:
        return '设备相关记录，如购买、维护、卖出等';
      case RecordType.maintenance:
        return '维护相关记录，如换水、清洗等';
    }
  }

  // 构建操作类型相关的提示文本
  String _getOperationTypeHint() {
    switch (_selectedOperationType) {
      case OperationType.create:
        return '创建新的实体';
      case OperationType.sell:
        return '卖出实体';
      case OperationType.statusChange:
        return '实体状态发生变化';
    }
  }

  // 根据表单类型获取标题
  String _getFormTitle() {
    final isEditing = widget.record != null;
    final type = widget.formType;

    if (type == null) {
      return isEditing ? '编辑记录' : '新建记录';
    }

    switch (type) {
      case 'waterChange':
        return isEditing ? '编辑换水记录' : '新建换水记录';
      case 'feeding':
        return isEditing ? '编辑喂食记录' : '新建喂食记录';
      case 'waterQualityTest':
        return isEditing ? '编辑水质测试' : '新建水质测试';
      case 'newCreature':
        return isEditing ? '编辑新购生物' : '新建新购生物';
      case 'newEquipment':
        return isEditing ? '编辑新购设备' : '新建新购设备';
      case 'creatureStatusChange':
        return isEditing ? '编辑生物状态变化' : '记录生物状态变化';
      case 'equipmentStatusChange':
        return isEditing ? '编辑设备状态变化' : '记录设备状态变化';
      default:
        return isEditing ? '编辑记录' : '新建记录';
    }
  }

  // 构建通用表单（用于普通添加）
  Widget _buildGenericForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 记录类型选择
        FormGridPicker<RecordType>(
          label: '记录类型',
          value: _selectedRecordType,
          items: RecordType.values,
          itemDisplayName: (e) => e.label,
          onChanged: (v) =>
              setState(() => _selectedRecordType = v ?? RecordType.aquarium),
        ),
        const SizedBox(height: 20),

        // 操作类型选择
        FormGridPicker<OperationType>(
          label: '操作类型',
          value: _selectedOperationType,
          items: OperationType.values,
          itemDisplayName: (e) => e.label,
          onChanged: (v) => setState(
            () => _selectedOperationType = v ?? OperationType.create,
          ),
        ),
        const SizedBox(height: 20),

        // 记录名称
        FormInput(
          label: '记录名称',
          hintText: '请输入记录名称，如"水质测试"、"喂食记录"等',
          helper: _nameHelper,
          errorText: _nameError,
          onChanged: (_) {
            if (_nameError != null) {
              setState(() => _nameError = null);
            }
          },
        ),
        const SizedBox(height: 20),

        // 描述
        FormInput(
          label: '描述',
          hintText: '请输入详细描述',
          helper: _descriptionHelper,
          maxLines: 3,
        ),
        const SizedBox(height: 20),

        // 关联创建时的记录ID
        FormInput(
          label: '关联创建记录ID（可选）',
          hintText: '在记录生物变化等情况时使用',
          helper: _sourceIdHelper,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),

        // 数值类型
        FormInput(
          label: '数值类型（可选）',
          hintText: '如L、g、ppm、℃等',
          helper: _valueTypeHelper,
        ),
        const SizedBox(height: 20),

        // 数值
        FormInput(
          label: '数值（可选）',
          hintText: '填写具体数值，如200、5.5等',
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

  // 构建换水表单
  Widget _buildWaterChangeForm() {
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

  // 构建喂食表单
  Widget _buildFeedingForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 食物类型
        FormInput(
          label: '食物类型（可选）',
          hintText: '如颗粒饲料、冻干虾、螺旋藻等',
          helper: _descriptionHelper,
        ),
        const SizedBox(height: 20),

        // 喂食量
        FormInput(
          label: '喂食量(g)',
          hintText: '请输入喂食量，如2.5、5等',
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

        // 喂食时间
        FormDatePicker(
          label: '喂食时间',
          date: _recordTime,
          onChanged: (d) => setState(() => _recordTime = d),
        ),
        const SizedBox(height: 20),

        // 备注
        FormInput(label: '备注', helper: _notesHelper, maxLines: 3),
      ],
    );
  }

  // 构建水质测试表单
  Widget _buildWaterQualityTestForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 测试类型
        FormInput(
          label: '测试类型',
          hintText: '如pH、氨氮、亚硝酸盐、硝酸盐等',
          helper: _nameHelper,
          errorText: _nameError,
          onChanged: (_) {
            if (_nameError != null) {
              setState(() => _nameError = null);
            }
          },
        ),
        const SizedBox(height: 20),

        // 测试值
        FormInput(
          label: '测试值',
          hintText: '请输入测试数值',
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

        // 单位
        FormInput(
          label: '单位（可选）',
          hintText: '如pH值无需单位，氨氮为ppm，硬度为dGH等',
          helper: _valueTypeHelper,
        ),
        const SizedBox(height: 20),

        // 测试时间
        FormDatePicker(
          label: '测试时间',
          date: _recordTime,
          onChanged: (d) => setState(() => _recordTime = d),
        ),
        const SizedBox(height: 20),

        // 备注
        FormInput(label: '备注', helper: _notesHelper, maxLines: 3),
      ],
    );
  }

  // 构建新购生物表单
  Widget _buildNewCreatureForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 生物名称
        FormInput(
          label: '生物名称',
          hintText: '请输入生物名称，如"红绿灯鱼"、"蓝魔虾"等',
          helper: _nameHelper,
          errorText: _nameError,
          onChanged: (_) {
            if (_nameError != null) {
              setState(() => _nameError = null);
            }
          },
        ),
        const SizedBox(height: 20),

        // 物种（可选）
        FormInput(
          label: '物种（可选）',
          hintText: '如"红绿灯鱼 (Paracheirodon innesi)"',
          helper: _descriptionHelper,
        ),
        const SizedBox(height: 20),

        // 价格（可选）
        FormInput(
          label: '价格（元）（可选）',
          hintText: '请输入购买价格',
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

        // 购买时间
        FormDatePicker(
          label: '购买时间',
          date: _recordTime,
          onChanged: (d) => setState(() => _recordTime = d),
        ),
        const SizedBox(height: 20),

        // 备注
        FormInput(label: '备注', helper: _notesHelper, maxLines: 3),
      ],
    );
  }

  // 构建新购设备表单
  Widget _buildNewEquipmentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 设备名称
        FormInput(
          label: '设备名称',
          hintText: '请输入设备名称，如"外置过滤器"、"加热棒"等',
          helper: _nameHelper,
          errorText: _nameError,
          onChanged: (_) {
            if (_nameError != null) {
              setState(() => _nameError = null);
            }
          },
        ),
        const SizedBox(height: 20),

        // 设备类型（可选）
        FormInput(
          label: '设备类型（可选）',
          hintText: '如"过滤器"、"加热器"、"灯具"等',
          helper: _descriptionHelper,
        ),
        const SizedBox(height: 20),

        // 价格（可选）
        FormInput(
          label: '价格（元）（可选）',
          hintText: '请输入购买价格',
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

        // 购买时间
        FormDatePicker(
          label: '购买时间',
          date: _recordTime,
          onChanged: (d) => setState(() => _recordTime = d),
        ),
        const SizedBox(height: 20),

        // 备注
        FormInput(label: '备注', helper: _notesHelper, maxLines: 3),
      ],
    );
  }

  // 构建生物状态变化表单
  Widget _buildCreatureStatusChangeForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 关联生物ID
        FormInput(
          label: '关联生物ID',
          hintText: '请输入生物ID',
          helper: _sourceIdHelper,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),

        // 生物名称
        FormInput(
          label: '生物名称',
          hintText: '请输入生物名称',
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
          hintText: '描述状态变化情况，如"生病，有白点"、"产卵"、"死亡"等',
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

  // 构建设备状态变化表单
  Widget _buildEquipmentStatusChangeForm() {
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

  // 根据表单类型构建对应的表单
  Widget _buildFormByType() {
    final type = widget.formType;

    switch (type) {
      case 'waterChange':
        return _buildWaterChangeForm();
      case 'feeding':
        return _buildFeedingForm();
      case 'waterQualityTest':
        return _buildWaterQualityTestForm();
      case 'newCreature':
        return _buildNewCreatureForm();
      case 'newEquipment':
        return _buildNewEquipmentForm();
      case 'creatureStatusChange':
        return _buildCreatureStatusChangeForm();
      case 'equipmentStatusChange':
        return _buildEquipmentStatusChangeForm();
      default:
        return _buildGenericForm();
    }
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
                          _getFormTitle(),
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
                      child: _buildFormByType(),
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
            _getFormTitle(),
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
                      child: _buildFormByType(),
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
