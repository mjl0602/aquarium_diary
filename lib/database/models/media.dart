import 'package:isar_community/isar.dart';

part 'media.g.dart';

@collection
class Media {
  Id id = Isar.autoIncrement;

  /// 媒体类型：图片或视频
  @enumerated
  late MediaType mediaType;

  /// 关联的实体类型
  @enumerated
  late RefType refType;

  /// 关联的实体ID
  late int refId;

  /// 媒体文件路径（图片或视频文件）
  late String filePath;

  /// 视频封面路径（仅视频有效）
  String? thumbnailPath;

  /// 文件名
  String? fileName;

  /// 文件大小（字节）
  int? fileSize;

  /// MIME类型，如 image/jpeg, video/mp4
  String? mimeType;

  /// 宽度（图片或视频分辨率）
  int? width;

  /// 高度
  int? height;

  /// 视频时长（秒），仅视频有效
  int? duration;

  /// 是否为主图/主封面
  bool isPrimary = false;

  /// 排序顺序
  int sortOrder = 0;

  /// 描述
  String? description;

  /// 拍摄/录制时间
  DateTime? takenAt;

  /// 创建时间
  late DateTime createdAt;

  Media({
    required this.mediaType,
    required this.refType,
    required this.refId,
    required this.filePath,
    this.thumbnailPath,
    this.fileName,
    this.fileSize,
    this.mimeType,
    this.width,
    this.height,
    this.duration,
    this.isPrimary = false,
    this.sortOrder = 0,
    this.description,
    this.takenAt,
    required this.createdAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaType: MediaType.values.byName(json['mediaType'] as String),
      refType: RefType.values.byName(json['refType'] as String),
      refId: json['refId'] as int,
      filePath: json['filePath'] as String,
      thumbnailPath: json['thumbnailPath'] as String?,
      fileName: json['fileName'] as String?,
      fileSize: json['fileSize'] as int?,
      mimeType: json['mimeType'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      duration: json['duration'] as int?,
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
      'mediaType': mediaType.name,
      'refType': refType.name,
      'refId': refId,
      'filePath': filePath,
      'thumbnailPath': thumbnailPath,
      'fileName': fileName,
      'fileSize': fileSize,
      'mimeType': mimeType,
      'width': width,
      'height': height,
      'duration': duration,
      'isPrimary': isPrimary,
      'sortOrder': sortOrder,
      'description': description,
      'takenAt': takenAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Media{id: $id, mediaType: $mediaType, refType: ${refType.label}, refId: $refId, filePath: $filePath, isPrimary: $isPrimary}';
  }
}

/// 媒体类型枚举
enum MediaType {
  image,
  video;

  String get label {
    switch (this) {
      case MediaType.image:
        return '图片';
      case MediaType.video:
        return '视频';
    }
  }
}

/// 关联实体类型枚举
enum RefType {
  aquarium,
  creature,
  equipment,
  consumable;

  String get label {
    switch (this) {
      case RefType.aquarium:
        return '鱼缸';
      case RefType.creature:
        return '生物';
      case RefType.equipment:
        return '设备';
      case RefType.consumable:
        return '耗材';
    }
  }
}