import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/consumable.dart';
import 'package:aquarium_diary/database/models/creature_status_change.dart';
import 'package:aquarium_diary/database/models/equipment.dart';
import 'package:aquarium_diary/database/models/maintenance_record.dart';
import 'package:aquarium_diary/database/models/photo.dart';
import 'package:aquarium_diary/database/models/schedule_plan.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

abstract class DataBase {
  static Future init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      AquariumSchema,
      ConsumableSchema,
      CreatureStatusChangeSchema,
      EquipmentSchema,
      MaintenanceRecordSchema,
      PhotoSchema,
      SchedulePlanSchema,
    ], directory: dir.path);
  }
}
