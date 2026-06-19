// lib/database/models/record.dart

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:isar_community/isar.dart';

part 'record.g.dart';

@collection
class Record {
  Id id = Isar.autoIncrement;

  /// 归属鱼缸ID
  int? aquariumId;

  /// 记录类型
  @enumerated
  late RecordType recordType;

  /// 关联创建时的记录ID（在记录生物变化等情况时使用）
  int? sourceId;

  /// 操作类型
  @enumerated
  late OperationType operationType;

  /// 关联照片的media ID列表
  List<int>? photoMediaIds;

  /// 图标路径
  String? iconPath;

  /// 名称
  late String name;

  /// 描述
  String? description;

  /// 数值类型（可选，如水温、pH值等）
  String? valueType;

  /// 数值（double类型）
  double? numericValue;

  /// 记录时间
  late DateTime recordTime;

  /// 创建时间
  late DateTime createdAt;

  /// 备注
  String? notes;

  Record({
    this.aquariumId,
    required this.recordType,
    this.sourceId,
    required this.operationType,
    this.photoMediaIds,
    this.iconPath,
    required this.name,
    this.description,
    this.valueType,
    this.numericValue,
    required this.recordTime,
    required this.createdAt,
    this.notes,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    final photoMediaIds = json['photoMediaIds'] as List<dynamic>?;

    return Record(
      aquariumId: json['aquariumId'] as int?,
      recordType: RecordType.values.byName(json['recordType'] as String),
      sourceId: json['sourceId'] as int?,
      operationType: OperationType.values.byName(
        json['operationType'] as String,
      ),
      photoMediaIds: photoMediaIds != null
          ? List<int>.from(photoMediaIds.map((e) => e as int))
          : null,
      iconPath: json['iconPath'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      valueType: json['valueType'] as String?,
      numericValue: (json['numericValue'] as num?)?.toDouble(),
      recordTime: DateTime.parse(json['recordTime'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aquariumId': aquariumId,
      'recordType': recordType.name,
      'sourceId': sourceId,
      'operationType': operationType.name,
      'photoMediaIds': photoMediaIds,
      'iconPath': iconPath,
      'name': name,
      'description': description,
      'valueType': valueType,
      'numericValue': numericValue,
      'recordTime': recordTime.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'notes': notes,
    };
  }

  /// 获取显示的记录摘要
  String get summary {
    final time = recordTime;
    final formattedTime =
        '${time.month}/${time.day} ${time.hour}:${time.minute.toString().padLeft(2, '0')}';

    if (valueType != null && numericValue != null) {
      return '$name: $numericValue$valueType ($formattedTime)';
    }

    return '$name ($formattedTime)';
  }

  /// 获取完整的详细信息
  String get detailInfo {
    final buffer = StringBuffer();
    buffer.writeln('记录ID: $id');
    buffer.writeln('类型: ${recordType.label} - ${operationType.label}');
    buffer.writeln('名称: $name');

    if (description != null && description!.isNotEmpty) {
      buffer.writeln('描述: $description');
    }

    if (aquariumId != null) {
      buffer.writeln('关联鱼缸ID: $aquariumId');
    }

    if (sourceId != null) {
      buffer.writeln('关联对象ID: $sourceId');
    }

    if (valueType != null && numericValue != null) {
      buffer.writeln('数值: $numericValue $valueType');
    }

    buffer.writeln('记录时间: ${recordTime.toLocal()}');
    buffer.writeln('创建时间: ${createdAt.toLocal()}');

    if (notes != null && notes!.isNotEmpty) {
      buffer.writeln('备注: $notes');
    }

    return buffer.toString();
  }

  @override
  String toString() {
    return 'Record{id: $id, recordType: ${recordType.label}, operationType: ${operationType.label}, name: $name}';
  }

  /// 创建鱼缸相关记录
  static Record createAquariumRecord({
    required int aquariumId,
    required OperationType operationType,
    required String aquariumName,
    String? description,
    String? iconPath,
    List<int>? photoMediaIds,
    String? valueType,
    double? numericValue,
    String? notes,
    DateTime? recordTime,
  }) {
    return Record(
      aquariumId: aquariumId,
      recordType: RecordType.aquarium,
      sourceId: aquariumId,
      operationType: operationType,
      photoMediaIds: photoMediaIds,
      iconPath: iconPath,
      name: '鱼缸: $aquariumName',
      description: description,
      valueType: valueType,
      numericValue: numericValue,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );
  }

  /// 创建生物相关记录
  static Record createCreatureRecord({
    required int aquariumId,
    required int creatureId,
    required OperationType operationType,
    required String creatureName,
    String? description,
    String? iconPath,
    List<int>? photoMediaIds,
    String? valueType,
    double? numericValue,
    String? notes,
    DateTime? recordTime,
  }) {
    return Record(
      aquariumId: aquariumId,
      recordType: RecordType.creature,
      sourceId: creatureId,
      operationType: operationType,
      photoMediaIds: photoMediaIds,
      iconPath: iconPath,
      name: '生物: $creatureName',
      description: description,
      valueType: valueType,
      numericValue: numericValue,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );
  }

  /// 创建设备相关记录
  static Record createEquipmentRecord({
    required int aquariumId,
    required int equipmentId,
    required OperationType operationType,
    required String equipmentName,
    String? description,
    String? iconPath,
    List<int>? photoMediaIds,
    String? valueType,
    double? numericValue,
    String? notes,
    DateTime? recordTime,
  }) {
    return Record(
      aquariumId: aquariumId,
      recordType: RecordType.equipment,
      sourceId: equipmentId,
      operationType: operationType,
      photoMediaIds: photoMediaIds,
      iconPath: iconPath,
      name: '设备: $equipmentName',
      description: description,
      valueType: valueType,
      numericValue: numericValue,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );
  }

  /// 创建维护相关记录
  static Record createMaintenanceRecord({
    required int aquariumId,
    required int maintenanceId,
    required OperationType operationType,
    required String maintenanceName,
    String? description,
    String? iconPath,
    List<int>? photoMediaIds,
    String? valueType,
    double? numericValue,
    String? notes,
    DateTime? recordTime,
  }) {
    return Record(
      aquariumId: aquariumId,
      recordType: RecordType.maintenance,
      sourceId: maintenanceId,
      operationType: operationType,
      photoMediaIds: photoMediaIds,
      iconPath: iconPath,
      name: '维护: $maintenanceName',
      description: description,
      valueType: valueType,
      numericValue: numericValue,
      recordTime: recordTime ?? DateTime.now(),
      createdAt: DateTime.now(),
      notes: notes,
    );
  }

  /// 查询鱼缸中现存的所有生物列表
  /// 逻辑：每个 RecordType.creature + OperationType.create 且没有后续卖出/损失记录的为一个生物
  static Future<List<Record>> getCreatures(int aquariumId) async {
    // 获取该鱼缸所有生物相关的记录
    final allRecords = await isar.records
        .filter()
        .aquariumIdEqualTo(aquariumId)
        .recordTypeEqualTo(RecordType.creature)
        .findAll();

    // 收集被卖出或损失的 sourceId
    final closedIds = <int>{};
    for (final r in allRecords) {
      if (r.sourceId != null &&
          (r.operationType == OperationType.sell ||
              r.operationType == OperationType.loss)) {
        closedIds.add(r.sourceId!);
      }
    }

    // 筛选创建记录中未被关闭的
    final creatures = <Record>[];
    for (final r in allRecords) {
      if (r.operationType == OperationType.create &&
          (r.sourceId == null || !closedIds.contains(r.sourceId))) {
        creatures.add(r);
      }
    }

    // 按记录时间排序
    creatures.sort((a, b) => b.recordTime.compareTo(a.recordTime));
    return creatures;
  }
}
