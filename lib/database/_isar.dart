import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/database/models/schedule_plan.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

abstract class DataBase {
  static Future init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      AquariumSchema,
      MediaSchema,
      SchedulePlanSchema,
      RecordSchema,
    ], directory: dir.path);
  }
}
