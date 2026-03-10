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

  @override
  String toString() {
    return 'SchedulePlan{id: $id, name: $name, operation: ${operation.label}, isEnabled: $isEnabled}';
  }
}