import 'package:isar_community/isar.dart';
import 'package:aquarium_diary/database/enums.dart';

part 'photo.g.dart';

@collection
class Photo {
  Id id = Isar.autoIncrement;

  @enumerated
  late ImageRefType refType;

  late int refId;

  late String filePath;

  String? fileName;

  int? fileSize;

  String? mimeType;

  int? width;

  int? height;

  bool isPrimary = false;

  int sortOrder = 0;

  String? description;

  DateTime? takenAt;

  late DateTime createdAt;

  Photo({
    required this.refType,
    required this.refId,
    required this.filePath,
    this.fileName,
    this.fileSize,
    this.mimeType,
    this.width,
    this.height,
    this.isPrimary = false,
    this.sortOrder = 0,
    this.description,
    this.takenAt,
    required this.createdAt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      refType: ImageRefType.values.byName(json['refType'] as String),
      refId: json['refId'] as int,
      filePath: json['filePath'] as String,
      fileName: json['fileName'] as String?,
      fileSize: json['fileSize'] as int?,
      mimeType: json['mimeType'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      isPrimary: json['isPrimary'] as bool? ?? false,
      sortOrder: json['sortOrder'] as int? ?? 0,
      description: json['description'] as String?,
      takenAt: json['takenAt'] != null
          ? DateTime.parse(json['takenAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
    )..id = json['id'] as int? ?? Isar.autoIncrement;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'refType': refType.name,
      'refId': refId,
      'filePath': filePath,
      'fileName': fileName,
      'fileSize': fileSize,
      'mimeType': mimeType,
      'width': width,
      'height': height,
      'isPrimary': isPrimary,
      'sortOrder': sortOrder,
      'description': description,
      'takenAt': takenAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Image{id: $id, refType: ${refType.label}, refId: $refId, filePath: $filePath, isPrimary: $isPrimary}';
  }
}
