import 'package:aquarium_diary/database/enums.dart';
import 'package:isar_community/isar.dart';

part 'aquarium.g.dart';

@collection
class Aquarium {
  Id id = Isar.autoIncrement;

  late String name;
  
  @enumerated
  late AquariumStructure structure;
  
  DateTime? purchaseDate;
  
  int? lengthMm;
  
  int? widthMm;
  
  int? heightMm;
  
  double? capacityLiter;
  
  bool isActive = true;
  
  late DateTime createdAt;
  
  String? notes;

  Aquarium({
    required this.name,
    required this.structure,
    this.purchaseDate,
    this.lengthMm,
    this.widthMm,
    this.heightMm,
    this.capacityLiter,
    this.isActive = true,
    required this.createdAt,
    this.notes,
  });

  @override
  String toString() {
    return 'Aquarium{id: $id, name: $name, structure: ${structure.label}, isActive: $isActive}';
  }
}