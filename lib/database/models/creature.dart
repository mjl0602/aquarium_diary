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
  late CoralCompatibility coralCompatibility;

  List<int> mainImage = [];

  @ignore
  List<List<int>> images = [];

  DateTime? entryDate;

  DateTime? quarantineEndDate;

  @enumerated
  late CreatureStatus statusType;

  String? statusNote;

  bool isFavorite = false;

  String? source;

  DateTime? purchaseDate;

  List<int> purchaseScreenshot = [];

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
    required this.aggressiveness,
    required this.coralCompatibility,
    this.mainImage = const [],
    // this.images = const [],
    this.entryDate,
    this.quarantineEndDate,
    required this.statusType,
    this.statusNote,
    this.isFavorite = false,
    this.source,
    this.purchaseDate,
    this.purchaseScreenshot = const [],
    this.price,
    this.shippingCost,
    this.packagingCost,
    this.tags = const [],
    this.isArchived = false,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
  });

  @override
  String toString() {
    return 'Creature{id: $id, speciesName: $speciesName, category: ${category.label}, status: ${statusType.label}}';
  }
}
