import 'package:aquarium_diary/database/enums.dart';
import 'package:isar_community/isar.dart';

part 'consumable.g.dart';

@collection
class Consumable {
  Id id = Isar.autoIncrement;

  int? aquariumId;

  late String name;

  @enumerated
  late ConsumableType type;

  double? capacity;

  String? unit;

  double? price;

  DateTime? purchaseDate;

  int? estimatedUses;

  int? estimatedDays;

  int usedCount = 0;

  DateTime? usedDate;

  bool isEmpty = false;

  late DateTime createdAt;

  String? notes;

  Consumable({
    this.aquariumId,
    required this.name,
    required this.type,
    this.capacity,
    this.unit,
    this.price,
    this.purchaseDate,
    this.estimatedUses,
    this.estimatedDays,
    this.usedCount = 0,
    this.usedDate,
    this.isEmpty = false,
    required this.createdAt,
    this.notes,
  });
  
  factory Consumable.fromJson(Map<String, dynamic> json) {
    return Consumable(
      aquariumId: json['aquariumId'] as int?,
      name: json['name'] as String,
      type: ConsumableType.values.byName(json['type'] as String),
      capacity: (json['capacity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      purchaseDate: json['purchaseDate'] != null
          ? DateTime.parse(json['purchaseDate'] as String)
          : null,
      estimatedUses: json['estimatedUses'] as int?,
      estimatedDays: json['estimatedDays'] as int?,
      usedCount: json['usedCount'] as int? ?? 0,
      usedDate: json['usedDate'] != null
          ? DateTime.parse(json['usedDate'] as String)
          : null,
      isEmpty: json['isEmpty'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aquariumId': aquariumId,
      'name': name,
      'type': type.name,
      'capacity': capacity,
      'unit': unit,
      'price': price,
      'purchaseDate': purchaseDate?.toIso8601String(),
      'estimatedUses': estimatedUses,
      'estimatedDays': estimatedDays,
      'usedCount': usedCount,
      'usedDate': usedDate?.toIso8601String(),
      'isEmpty': isEmpty,
      'createdAt': createdAt.toIso8601String(),
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Consumable{id: $id, name: $name, type: ${type.label}, isEmpty: $isEmpty}';
  }
}
