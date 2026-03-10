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
    required this.previousStatus,
    required this.newStatus,
    required this.description,
    required this.changeDate,
    this.notes,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'CreatureStatusChange{id: $id, creatureId: $creatureId, newStatus: ${newStatus.label}}';
  }
}
