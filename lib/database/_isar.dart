import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

abstract class DataBase {
  static Future init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([], directory: dir.path);
  }
}
