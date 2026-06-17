// lib/pages/home/views/album_tab_widget.dart

import 'dart:io';

import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/models/aquarium.dart';
import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/pages/camera/select_gallery.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/image_actions.dart';
import 'package:aquarium_diary/tools/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tapped/tapped.dart';

/// 相册Tab - 鱼缸照片管理
class AlbumTabWidget extends StatefulWidget {
  final Aquarium? aquarium;
  final VoidCallback? onPhotosChanged;

  const AlbumTabWidget({Key? key, this.aquarium, this.onPhotosChanged})
    : super(key: key);

  @override
  State<AlbumTabWidget> createState() => _AlbumTabWidgetState();
}

class _AlbumTabWidgetState extends State<AlbumTabWidget> {
  List<Media> _photos = [];
  bool _photosLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  @override
  void didUpdateWidget(covariant AlbumTabWidget oldWidget) {
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
      final media = await Media.saveFromFile(
        file: file,
        refType: RefType.aquarium,
        refId: aquariumId,
        isPrimary: _photos.isEmpty,
        sortOrder: _photos.length,
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

    return Column(
      children: [
        // 顶部操作栏
        _buildTopBar(),
        // 照片网格
        Expanded(child: _buildPhotoGrid()),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StText.small(
            '全部照片 (${_photos.length})',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: StColor.darkGray,
              fontSize: 15,
            ),
          ),
          Tapped(
            onTap: _takePhoto,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: StColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, size: 16, color: StColor.white),
                  const SizedBox(width: 5),
                  StText.small(
                    '拍照',
                    style: const TextStyle(
                      color: StColor.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
    if (_photosLoading) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    if (_photos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_album_outlined, size: 64, color: StColor.halfGray),
            const SizedBox(height: 12),
            StText.small(
              '暂无照片',
              style: TextStyle(color: StColor.gray, fontSize: 14),
            ),
            const SizedBox(height: 4),
            StText.small(
              '点击右上角拍照按钮记录鱼缸',
              style: TextStyle(color: StColor.lightGray, fontSize: 12),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadPhotos,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          final photo = _photos[index];
          return Tapped(
            onTap: () => previewMutiImages(context, _photos, index),
            onLongTap: () => _onLongTapPhoto(photo),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: photo.filePath,
                    child: Image.file(
                      File(photo.thumbnailPath ?? photo.filePath),
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: StColor.lightGray,
                        child: Icon(
                          Icons.broken_image,
                          color: StColor.halfGray,
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
                          horizontal: 5,
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
    );
  }

  Future<void> _onLongTapPhoto(Media photo) async {
    final action = await showMediaActions(context, media: photo);
    if (action == MediaAction.setPrimary) {
      _setAsPrimary(photo);
    } else if (action == MediaAction.delete) {
      _deletePhoto(photo);
    }
  }

  Future<void> _setAsPrimary(Media photo) async {
    final aquariumId = widget.aquarium?.id;
    if (aquariumId == null) return;

    try {
      await isar.writeTxn(() async {
        // 清除该鱼缸所有照片的主图标记
        final existing = await isar.medias
            .filter()
            .refTypeEqualTo(RefType.aquarium)
            .refIdEqualTo(aquariumId)
            .build()
            .findAll();
        for (final m in existing) {
          if (m.isPrimary) {
            m.isPrimary = false;
            await isar.medias.put(m);
          }
        }
        // 设置新主图
        photo.isPrimary = true;
        await isar.medias.put(photo);
      });
      showToast('已设为主图');
      _loadPhotos();
      widget.onPhotosChanged?.call();
    } catch (e) {
      print('设为主图失败: $e');
      showToast('操作失败');
    }
  }
}
