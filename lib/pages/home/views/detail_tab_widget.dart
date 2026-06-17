// lib/pages/home/views/detail_tab_widget.dart

import 'dart:io';
import 'dart:async';

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/enums.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/database/models/record.dart';
import 'package:aquarium_diary/pages/camera/select_gallery.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tapped/tapped.dart';

// 详情页独立组件
class DetailTabWidget extends StatefulWidget {
  final Aquarium? aquarium;
  final List<Record> creatures;
  final List<Record> equipment;
  final VoidCallback? onAddWaterChange;
  final VoidCallback? onAddFeeding;
  final VoidCallback? onAddWaterQualityTest;
  final VoidCallback? onAddNewCreature;
  final VoidCallback? onAddNewEquipment;
  final VoidCallback? onAddCreatureStatusChange;
  final VoidCallback? onAddEquipmentStatusChange;
  final VoidCallback? onPhotosChanged;

  const DetailTabWidget({
    Key? key,
    this.aquarium,
    this.creatures = const [],
    this.equipment = const [],
    this.onAddWaterChange,
    this.onAddFeeding,
    this.onAddWaterQualityTest,
    this.onAddNewCreature,
    this.onAddNewEquipment,
    this.onAddCreatureStatusChange,
    this.onAddEquipmentStatusChange,
    this.onPhotosChanged,
  }) : super(key: key);

  @override
  State<DetailTabWidget> createState() => _DetailTabWidgetState();
}

class _DetailTabWidgetState extends State<DetailTabWidget> {
  bool _showCreatures = true;
  List<Media> _photos = [];
  bool _photosLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  @override
  void didUpdateWidget(covariant DetailTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.aquarium?.id != widget.aquarium?.id) {
      _loadPhotos();
    }
  }

  Future<void> _loadPhotos() async {
    final aquariumId = widget.aquarium?.id;
    if (aquariumId == null) return;
    setState(() => _photosLoading = true);
    try {
      _photos = await isar.medias
          .filter()
          .refTypeEqualTo(RefType.aquarium)
          .refIdEqualTo(aquariumId)
          .build()
          .findAll();
      _photos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } catch (e) {
      print('加载鱼缸照片失败: $e');
    } finally {
      setState(() => _photosLoading = false);
    }
  }

  Future<void> _takePhoto() async {
    final aquariumId = widget.aquarium?.id;
    if (aquariumId == null) return;

    final File? file = await selectImg(context);
    if (file == null) return;

    try {
      // 保存文件到应用目录
      final appDir = await getApplicationDocumentsDirectory();
      final mediaDir = Directory('${appDir.path}/media/aquarium/$aquariumId');
      if (!mediaDir.existsSync()) {
        mediaDir.createSync(recursive: true);
      }
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final ext = file.path.endsWith('png') ? 'png' : 'jpg';
      final savedFile = await file.copy('${mediaDir.path}/$timestamp.$ext');

      final media = Media(
        mediaType: MediaType.image,
        refType: RefType.aquarium,
        refId: aquariumId,
        filePath: savedFile.path,
        fileName: '$timestamp.$ext',
        fileSize: savedFile.lengthSync(),
        mimeType: ext == 'png' ? 'image/png' : 'image/jpeg',
        isPrimary: _photos.isEmpty,
        sortOrder: _photos.length,
        takenAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.medias.put(media);
      });

      showToast('照片已保存');
      _loadPhotos();
      widget.onPhotosChanged?.call();
    } catch (e) {
      print('保存照片失败: $e');
      showToast('保存照片失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.aquarium == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StText.big('请先选择鱼缸'),
              SizedBox(height: 8),
              StText.small('请先在左侧选择一个鱼缸'),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 卡片0: 鱼缸照片
          _buildPhotoCard(),
          const SizedBox(height: 12),

          // 卡片1: 切换生物列表/设备列表
          _buildToggleCard(),
          const SizedBox(height: 12),

          // 卡片2: 换水 + 水质测试 + 喂食
          _buildWaterCard(),
          const SizedBox(height: 12),

          // 卡片3: 新设备 + 新生物
          _buildNewItemCard(),
        ],
      ),
    );
  }

  Widget _buildToggleCard() {
    final items = _showCreatures ? widget.creatures : widget.equipment;
    final label = _showCreatures ? '生物' : '设备';

    return Container(
      decoration: BoxDecoration(
        color: StColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 紧凑切换按钮
          Container(
            decoration: BoxDecoration(
              color: StColor.lightGray,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTabOption('生物', true, null),
                const SizedBox(width: 2),
                _buildTabOption('设备', false, null),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // 列表内容
          if (items.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: StText.small(
                '暂无$label记录',
                style: const TextStyle(color: StColor.gray, fontSize: 12),
              ),
            )
          else
            ...List.generate(
              items.length > 3 ? 3 : items.length,
              (i) => _buildRecordItem(items[i]),
            ),

          // 查看更多
          if (items.length > 3)
            Tapped(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Center(
                  child: StText.small(
                    '查看更多',
                    style: TextStyle(
                      color: StColor.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabOption(String label, bool isSelected, VoidCallback? onTap) {
    if (isSelected) {
      return Tapped(
        onTap: () => setState(() => _showCreatures = true),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: StColor.primary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: StColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return Tapped(
      onTap: () => setState(() => _showCreatures = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            color: StColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildRecordItem(Record record) {
    final color = record.recordType == RecordType.creature
        ? Colors.blue
        : Colors.teal;
    final icon = record.recordType == RecordType.creature
        ? Icons.pets
        : Icons.settings;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, size: 14, color: color),
          ),
          const SizedBox(width: 8),
          StText.small(
            record.name,
            style: const TextStyle(color: StColor.darkGray, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoCard() {
    return Container(
      decoration: BoxDecoration(
        color: StColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StText.small(
                '鱼缸照片',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: StColor.darkGray,
                ),
              ),
              Tapped(
                onTap: _takePhoto,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: StColor.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera_alt, size: 14, color: StColor.primary),
                      const SizedBox(width: 4),
                      StText.small(
                        '拍照',
                        style: const TextStyle(
                          color: StColor.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_photosLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else if (_photos.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Icon(Icons.photo_camera, size: 40, color: StColor.halfGray),
                  const SizedBox(height: 8),
                  StText.small(
                    '暂无照片，点击上方按钮拍照',
                    style: const TextStyle(color: StColor.gray, fontSize: 12),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _photos.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final photo = _photos[index];
                  return Tapped(
                    onTap: () => previewMutiImages(
                      context,
                      _photos.map((p) => p.filePath).toList(),
                      index,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ClipRect(
                                child: Hero(
                                  tag: photo.filePath,
                                  child: Image.file(
                                    File(photo.filePath),
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 100,
                                      height: 100,
                                      color: StColor.lightGray,
                                      child: Icon(
                                        Icons.broken_image,
                                        color: StColor.halfGray,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (photo.isPrimary)
                            Positioned(
                              top: 4,
                              right: 4,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: StColor.coral,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: StText.small(
                                  '主图',
                                  style: const TextStyle(
                                    color: StColor.white,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _deletePhoto(Media photo) async {
    try {
      // 删除文件
      final file = File(photo.filePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
      // 删除数据库记录
      await isar.writeTxn(() async {
        await isar.medias.delete(photo.id);
      });
      showToast('照片已删除');
      _loadPhotos();
      widget.onPhotosChanged?.call();
    } catch (e) {
      print('删除照片失败: $e');
      showToast('删除照片失败');
    }
  }

  Widget _buildWaterCard() {
    return Container(
      decoration: BoxDecoration(
        color: StColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StText.small(
            '维护',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: StColor.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildButton(
                  Icons.water_drop,
                  '换水',
                  Colors.blue,
                  widget.onAddWaterChange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildButton(
                  Icons.science,
                  '水质',
                  Colors.purple,
                  widget.onAddWaterQualityTest,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildButton(
                  Icons.restaurant,
                  '喂食',
                  Colors.green,
                  widget.onAddFeeding,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewItemCard() {
    return Container(
      decoration: BoxDecoration(
        color: StColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StText.small(
            '新增',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: StColor.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildButton(
                  Icons.settings,
                  '新设备',
                  Colors.cyan,
                  widget.onAddNewEquipment,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildButton(
                  Icons.pets,
                  '新生物',
                  Colors.orange,
                  widget.onAddNewCreature,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback? onTap,
  ) {
    return Tapped(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
