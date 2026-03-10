// lib/models/schedule_plan.dart

import 'package:isar_community/isar.dart';
import 'package:aquarium_diary/database/enums.dart';

part 'schedule_plan.g.dart';

@collection
class SchedulePlan {
  Id id = Isar.autoIncrement;

  int? aquariumId;

  late String name;

  @enumerated
  late ScheduleOperation operation;

  @enumerated
  late CycleType cycleType;

  int? cycleDays;

  String? reminderTime;

  int advanceReminderMinutes = 0;

  bool isEnabled = true;

  DateTime? lastExecuteDate;

  DateTime? nextExecuteDate;

  int? consumableId;

  int? lastMaintenanceId;

  int? estimatedDurationMinutes;

  late DateTime createdAt;

  String? notes;

  SchedulePlan({
    this.aquariumId,
    required this.name,
    required this.operation,
    required this.cycleType,
    this.cycleDays,
    this.reminderTime,
    this.advanceReminderMinutes = 0,
    this.isEnabled = true,
    this.lastExecuteDate,
    this.nextExecuteDate,
    this.consumableId,
    this.lastMaintenanceId,
    this.estimatedDurationMinutes,
    required this.createdAt,
    this.notes,
  });

  factory SchedulePlan.fromJson(Map<String, dynamic> json) {
    return SchedulePlan(
      aquariumId: json['aquariumId'] as int?,
      name: json['name'] as String,
      operation: ScheduleOperation.values.byName(json['operation'] as String),
      cycleType: CycleType.values.byName(json['cycleType'] as String),
      cycleDays: json['cycleDays'] as int?,
      reminderTime: json['reminderTime'] as String?,
      advanceReminderMinutes: json['advanceReminderMinutes'] as int? ?? 0,
      isEnabled: json['isEnabled'] as bool? ?? true,
      lastExecuteDate: json['lastExecuteDate'] != null
          ? DateTime.parse(json['lastExecuteDate'] as String)
          : null,
      nextExecuteDate: json['nextExecuteDate'] != null
          ? DateTime.parse(json['nextExecuteDate'] as String)
          : null,
      consumableId: json['consumableId'] as int?,
      lastMaintenanceId: json['lastMaintenanceId'] as int?,
      estimatedDurationMinutes: json['estimatedDurationMinutes'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aquariumId': aquariumId,
      'name': name,
      'operation': operation.name,
      'cycleType': cycleType.name,
      'cycleDays': cycleDays,
      'reminderTime': reminderTime,
      'advanceReminderMinutes': advanceReminderMinutes,
      'isEnabled': isEnabled,
      'lastExecuteDate': lastExecuteDate?.toIso8601String(),
      'nextExecuteDate': nextExecuteDate?.toIso8601String(),
      'consumableId': consumableId,
      'lastMaintenanceId': lastMaintenanceId,
      'estimatedDurationMinutes': estimatedDurationMinutes,
      'createdAt': createdAt.toIso8601String(),
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'SchedulePlan{id: $id, name: $name, operation: ${operation.label}, isEnabled: $isEnabled}';
  }
}
