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

  // List<List<int>> images = [];

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
    // this.images = const [],
    this.nextReminderDate,
    this.isReminded = false,
    required this.createdAt,
    this.notes,
  });

  @override
  String toString() {
    return 'MaintenanceRecord{id: $id, operation: ${operation.label}, aquariumId: $aquariumId}';
  }
}
