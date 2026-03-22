// lib/models/creature.dart

import 'package:isar_community/isar.dart';
import 'package:aquarium_diary/database/enums.dart';

part 'creature.g.dart';

@collection
class Creature {
  Id id = Isar.autoIncrement;

  int? aquariumId;

  @enumerated
  late CreatureCategory category;

  late String speciesName;

  String? nickname;

  int quantity = 1;

  double? sizeCm;

  @enumerated
  late Aggressiveness aggressiveness;

  @enumerated
  CoralCompatibility coralCompatibility;

  int? mainImageId;

  DateTime? entryDate;

  @ignore
  int? get daysSinceSetup =>
      entryDate == null ? null : DateTime.now().difference(entryDate!).inDays;

  DateTime? quarantineEndDate;

  @enumerated
  late CreatureStatus statusType;

  String? statusNote;

  bool isFavorite = false;

  String? source;

  DateTime? purchaseDate;

  int? purchaseScreenshotId;

  double? price;

  double? shippingCost;

  double? packagingCost;

  double? get totalCost {
    if (price == null && shippingCost == null && packagingCost == null) {
      return null;
    }
    return (price ?? 0) + (shippingCost ?? 0) + (packagingCost ?? 0);
  }

  List<String> tags = [];

  bool isArchived = false;

  late DateTime createdAt;

  late DateTime updatedAt;

  String? notes;

  Creature({
    this.aquariumId,
    required this.category,
    required this.speciesName,
    this.nickname,
    this.quantity = 1,
    this.sizeCm,
    this.aggressiveness = Aggressiveness.peaceful,
    required this.coralCompatibility,
    this.mainImageId,
    this.entryDate,
    this.quarantineEndDate,
    required this.statusType,
    this.statusNote,
    this.isFavorite = false,
    this.source,
    this.purchaseDate,
    this.purchaseScreenshotId,
    this.price,
    this.shippingCost,
    this.packagingCost,
    this.tags = const [],
    this.isArchived = false,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
  });

  factory Creature.fromJson(Map<String, dynamic> json) {
    return Creature(
      aquariumId: json['aquariumId'] as int?,
      category: CreatureCategory.values.byName(json['category'] as String),
      speciesName: json['speciesName'] as String,
      nickname: json['nickname'] as String?,
      quantity: json['quantity'] as int? ?? 1,
      sizeCm: (json['sizeCm'] as num?)?.toDouble(),
      aggressiveness: Aggressiveness.values.byName(
        json['aggressiveness'] as String? ?? 'peaceful',
      ),
      coralCompatibility: json['coralCompatibility'] != null
          ? CoralCompatibility.values.byName(
              json['coralCompatibility'] as String,
            )
          : CoralCompatibility.safe,
      mainImageId: json['mainImageId'] as int?,
      entryDate: json['entryDate'] != null
          ? DateTime.parse(json['entryDate'] as String)
          : null,
      quarantineEndDate: json['quarantineEndDate'] != null
          ? DateTime.parse(json['quarantineEndDate'] as String)
          : null,
      statusType: CreatureStatus.values.byName(json['statusType'] as String),
      statusNote: json['statusNote'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
      source: json['source'] as String?,
      purchaseDate: json['purchaseDate'] != null
          ? DateTime.parse(json['purchaseDate'] as String)
          : null,
      purchaseScreenshotId: json['purchaseScreenshotId'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      shippingCost: (json['shippingCost'] as num?)?.toDouble(),
      packagingCost: (json['packagingCost'] as num?)?.toDouble(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      isArchived: json['isArchived'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      notes: json['notes'] as String?,
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aquariumId': aquariumId,
      'category': category.name,
      'speciesName': speciesName,
      'nickname': nickname,
      'quantity': quantity,
      'sizeCm': sizeCm,
      'aggressiveness': aggressiveness.name,
      'coralCompatibility': coralCompatibility?.name,
      'mainImageId': mainImageId,
      'entryDate': entryDate?.toIso8601String(),
      'quarantineEndDate': quarantineEndDate?.toIso8601String(),
      'statusType': statusType.name,
      'statusNote': statusNote,
      'isFavorite': isFavorite,
      'source': source,
      'purchaseDate': purchaseDate?.toIso8601String(),
      'purchaseScreenshotId': purchaseScreenshotId,
      'price': price,
      'shippingCost': shippingCost,
      'packagingCost': packagingCost,
      'totalCost': totalCost,
      'tags': tags,
      'isArchived': isArchived,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Creature{id: $id, speciesName: $speciesName, category: ${category.label}, status: ${statusType.label}}';
  }
}
