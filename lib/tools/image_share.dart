import 'dart:typed_data';

import 'package:aquarium_diary/pages/camera/select_gallery.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:local_cache_sync/local_cache_sync.dart';
import 'package:oktoast/oktoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tapped/tapped.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

enum ShareMode { save, send }

/// 分享或保存图片
Future<void> shareOrSaveImage(
  BuildContext context, {
  dynamic image,
  // 如果提供了data就data优先
  List<int>? data,
  ShareMode? mode,
}) async {
  ShareMode? shareMode;
  if (mode != null) {
    shareMode = mode;
  } else {
    var res = await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return _ModeSelect();
      },
    );
    if (res is! ShareMode) {
      return;
    }

    shareMode = res;
  }

  // 先处理图片数据
  List<int>? bytes;
  if (data != null) {
    bytes = data;
  } else {
    if (image is ExtendedNetworkImageProvider) {
      ExtendedNetworkImageProvider _image = image;
      bytes = await _image.getNetworkImageData();
    }
    if (image is ExtendedFileImageProvider) {
      ExtendedFileImageProvider _image = image;
      bytes = await _image.file.readAsBytes();
    }
    if (bytes == null) {
      showToast('无法获取图片数据');
      return;
    }
  }
  // 开始分享
  if (shareMode == ShareMode.send) {
    var file = LocalCacheObject('share', channel: kImageCacheChannel).file;
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    file.writeAsBytesSync(bytes);
    file = await file.rename(file.path.replaceAll('.json', '.png'));
    Share.shareXFiles([XFile(file.path)], text: '分享图片', subject: '分享了一张图片');
  }
  if (shareMode == ShareMode.save) {
    try {
      var entity = await PhotoManager.editor.saveImage(
        Uint8List.fromList(bytes),
        filename: '图片.png',
      );
      print(entity);
      showToast('保存成功');
    } catch (e) {
      showToast('保存失败');
    }
  }
}

class _ModeSelect extends StatelessWidget {
  const _ModeSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tapped(
            onTap: () => Navigator.of(context).pop(ShareMode.send),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('分享图片'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: StColor.lightGray,
          ),
          Tapped(
            onTap: () => Navigator.of(context).pop(ShareMode.save),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('保存到相册'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 10,
            color: StColor.lightGray,
          ),
          Tapped(
            onTap: () => Navigator.of(context).pop(null),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('取消'),
            ),
          ),
        ],
      ),
    );
  }
}
