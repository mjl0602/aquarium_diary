import 'package:aquarium_diary/database/enums.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

part 'aquarium.g.dart';

@collection
class Aquarium {
  Id id = Isar.autoIncrement;

  late String name;

  @enumerated
  late AquariumStructure structure;

  DateTime? startDate;

  double? capacityLiter;

  bool isActive = true;

  late DateTime createdAt;

  @ignore
  int get daysSinceSetup => DateTime.now().difference(createdAt).inDays;

  String? notes;

  Aquarium({
    required this.name,
    required this.structure,
    this.startDate,
    this.capacityLiter,
    this.isActive = true,
    required this.createdAt,
    this.notes,
  });

  factory Aquarium.fromJson(Map<String, dynamic> json) {
    return Aquarium(
      name: json['name'] as String,
      structure: AquariumStructure.values.byName(json['structure'] as String),
      startDate: json['purchaseDate'] != null
          ? DateTime.parse(json['purchaseDate'] as String)
          : null,
      capacityLiter: (json['capacityLiter'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'structure': structure.name,
      'purchaseDate': startDate?.toIso8601String(),
      'capacityLiter': capacityLiter,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Aquarium{id: $id, name: $name, structure: ${structure.label}, isActive: $isActive}';
  }
}
