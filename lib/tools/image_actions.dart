import 'dart:io';
import 'dart:typed_data';

import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:local_cache_sync/local_cache_sync.dart';
import 'package:oktoast/oktoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tapped/tapped.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 媒体操作结果
enum MediaAction { setPrimary, delete }

/// 媒体操作BottomSheet
/// 功能：设为主图、分享、保存到相册、删除
Future<MediaAction?> showMediaActions(
  BuildContext context, {
  required Media media,
}) {
  return showModalBottomSheet<MediaAction>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (ctx) => SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 设为主图
          if (!media.isPrimary)
            Tapped(
              onTap: () => Navigator.pop(ctx, MediaAction.setPrimary),
              child: Container(
                width: double.infinity,
                color: StColor.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StText.normal('设为主图'),
              ),
            ),
          if (!media.isPrimary)
            Container(
              width: double.infinity,
              height: 1,
              color: StColor.lightGray,
            ),

          // 分享
          Tapped(
            onTap: () async {
              Navigator.pop(ctx);
              await _shareMedia(context, media);
            },
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('分享'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: StColor.lightGray,
          ),

          // 保存到相册
          Tapped(
            onTap: () async {
              Navigator.pop(ctx);
              await _saveToAlbum(context, media);
            },
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('保存到相册'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: StColor.lightGray,
          ),

          // 删除
          Tapped(
            onTap: () => Navigator.pop(ctx, MediaAction.delete),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: StText.normal(
                '删除照片',
                style: TextStyle(color: StColor.coral),
              ),
            ),
          ),

          // 取消
          Container(
            width: double.infinity,
            height: 10,
            color: StColor.lightGray,
          ),
          Tapped(
            onTap: () => Navigator.pop(ctx),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('取消'),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> _shareMedia(BuildContext context, Media media) async {
  try {
    final file = File(media.filePath);
    if (!file.existsSync()) {
      showToast('文件不存在');
      return;
    }

    final bytes = await file.readAsBytes();
    var cacheFile = LocalCacheObject('share', channel: kImageCacheChannel).file;
    if (!cacheFile.existsSync()) {
      cacheFile.createSync(recursive: true);
    }
    cacheFile.writeAsBytesSync(bytes);
    cacheFile = await cacheFile.rename(
      cacheFile.path.replaceAll('.json', '.png'),
    );
    Share.shareXFiles(
      [XFile(cacheFile.path)],
      text: '分享图片',
      subject: '分享了一张图片',
    );
  } catch (e) {
    showToast('分享失败');
  }
}

Future<void> _saveToAlbum(BuildContext context, Media media) async {
  try {
    final file = File(media.filePath);
    if (!file.existsSync()) {
      showToast('文件不存在');
      return;
    }

    final bytes = await file.readAsBytes();
    await PhotoManager.editor.saveImage(
      Uint8List.fromList(bytes),
      filename: media.fileName ?? '图片.png',
    );
    showToast('保存成功');
  } catch (e) {
    showToast('保存失败');
  }
}
