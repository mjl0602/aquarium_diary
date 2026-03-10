// lib/models/maintenance_record.dart

import 'package:isar_community/isar.dart';
import 'package:aquarium_diary/database/enums.dart';

part 'maintenance_record.g.dart';

@collection
class MaintenanceRecord {
  Id id = Isar.autoIncrement;

  late int aquariumId;

  @enumerated
  late MaintenanceOperation operation;

  int? consumableId;

  double? consumableAmount;

  late DateTime operationDate;

  DateTime? nextReminderDate;

  bool isReminded = false;

  late DateTime createdAt;

  String? notes;

  MaintenanceRecord({
    required this.aquariumId,
    required this.operation,
    this.consumableId,
    this.consumableAmount,
    required this.operationDate,
    this.nextReminderDate,
    this.isReminded = false,
    required this.createdAt,
    this.notes,
  });

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) {
    return MaintenanceRecord(
      aquariumId: json['aquariumId'] as int,
      operation: MaintenanceOperation.values.byName(
        json['operation'] as String,
      ),
      consumableId: json['consumableId'] as int?,
      consumableAmount: (json['consumableAmount'] as num?)?.toDouble(),
      operationDate: DateTime.parse(json['operationDate'] as String),
      nextReminderDate: json['nextReminderDate'] != null
          ? DateTime.parse(json['nextReminderDate'] as String)
          : null,
      isReminded: json['isReminded'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aquariumId': aquariumId,
      'operation': operation.name,
      'consumableId': consumableId,
      'consumableAmount': consumableAmount,
      'operationDate': operationDate.toIso8601String(),
      'nextReminderDate': nextReminderDate?.toIso8601String(),
      'isReminded': isReminded,
      'createdAt': createdAt.toIso8601String(),
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'MaintenanceRecord{id: $id, operation: ${operation.label}, aquariumId: $aquariumId}';
  }
}
