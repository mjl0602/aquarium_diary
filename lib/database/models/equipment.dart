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

  @override
  String toString() {
    return 'Equipment{id: $id, name: $name, status: ${status.label}}';
  }
}