// lib/models/creature_status_change.dart

import 'package:isar_community/isar.dart';
import 'package:aquarium_diary/database/enums.dart';

part 'creature_status_change.g.dart';

@collection
class CreatureStatusChange {
  Id id = Isar.autoIncrement;

  late int creatureId;

  @enumerated
  late CreatureStatus previousStatus;

  @enumerated
  late CreatureStatus newStatus;

  late String description;

  late DateTime changeDate;

  String? notes;

  late DateTime createdAt;

  CreatureStatusChange({
    required this.creatureId,
    this.previousStatus = CreatureStatus.alive,
    required this.newStatus,
    required this.description,
    required this.changeDate,
    this.notes,
    required this.createdAt,
  });

  factory CreatureStatusChange.fromJson(Map<String, dynamic> json) {
    return CreatureStatusChange(
      creatureId: json['creatureId'] as int,
      previousStatus: CreatureStatus.values.byName(
        json['previousStatus'] as String? ?? 'alive',
      ),
      newStatus: CreatureStatus.values.byName(json['newStatus'] as String),
      description: json['description'] as String,
      changeDate: DateTime.parse(json['changeDate'] as String),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatureId': creatureId,
      'previousStatus': previousStatus.name,
      'newStatus': newStatus.name,
      'description': description,
      'changeDate': changeDate.toIso8601String(),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'CreatureStatusChange{id: $id, creatureId: $creatureId, newStatus: ${newStatus.label}}';
  }
}
