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

  @override
  String toString() {
    return 'Consumable{id: $id, name: $name, type: ${type.label}, isEmpty: $isEmpty}';
  }
}