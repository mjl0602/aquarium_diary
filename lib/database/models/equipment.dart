import 'package:aquarium_diary/database/enums.dart';
import 'package:isar_community/isar.dart';

part 'equipment.g.dart';

@collection
class Equipment {
  Id id = Isar.autoIncrement;

  int? aquariumId;

  late String name;

  double? price;

  double? powerWatt;

  @enumerated
  late EquipmentStatus status;

  DateTime? startDate;

  int? socketCount;

  String? socketInfo;

  List<String> tags = [];

  DateTime? purchaseDate;

  DateTime? warrantyDate;

  late DateTime createdAt;

  String? notes;

  Equipment({
    this.aquariumId,
    required this.name,
    this.price,
    this.powerWatt,
    required this.status,
    this.startDate,
    this.socketCount,
    this.socketInfo,
    this.tags = const [],
    this.purchaseDate,
    this.warrantyDate,
    required this.createdAt,
    this.notes,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      aquariumId: json['aquariumId'] as int?,
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble(),
      powerWatt: (json['powerWatt'] as num?)?.toDouble(),
      status: EquipmentStatus.values.byName(json['status'] as String),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      socketCount: json['socketCount'] as int?,
      socketInfo: json['socketInfo'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      purchaseDate: json['purchaseDate'] != null
          ? DateTime.parse(json['purchaseDate'] as String)
          : null,
      warrantyDate: json['warrantyDate'] != null
          ? DateTime.parse(json['warrantyDate'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aquariumId': aquariumId,
      'name': name,
      'price': price,
      'powerWatt': powerWatt,
      'status': status.name,
      'startDate': startDate?.toIso8601String(),
      'socketCount': socketCount,
      'socketInfo': socketInfo,
      'tags': tags,
      'purchaseDate': purchaseDate?.toIso8601String(),
      'warrantyDate': warrantyDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Equipment{id: $id, name: $name, status: ${status.label}}';
  }
}
