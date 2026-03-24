import 'dart:async';
import 'dart:io';

import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:local_cache_sync/local_cache_sync.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tapped/tapped.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

enum ImgMode { camera, pic }

const kImageCacheChannel = '_image_cache';

Future<File?> selectImg(BuildContext context) async {
  File? file;
  ImgMode? mode = await showModalBottomSheet(
    context: context,
    builder: (ctx) => _ModeSelect(),
  );
  if (mode == ImgMode.camera) {
    var res = await CameraPicker.pickFromCamera(
      context,
      pickerConfig: CameraPickerConfig(enableRecording: false),
    );
    if (res != null) {
      file = await res.file;
    }
  }
  if (mode == ImgMode.pic) {
    var res = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: 1,
        requestType: RequestType.image,
      ),
    );
    if (res?.length == 1) {
      file = await res!.first.file;
    }
  }

  // print('压缩前大小:${file!.lengthSync() / 1000}k');
  // file =
  //     await (_compressTo(
  //           file,
  //           LocalCacheObject('${file.path}', channel: kImageCacheChannel).file,
  //           500,
  //         )
  //         as FutureOr<File>);
  // print('压缩后大小:${file.lengthSync() / 1000}k');

  return file;
}

Future<List<File?>?> selectMutiImg(
  BuildContext context, {
  int? count,
  ImgMode? selectMode,
}) async {
  List<File?> files = [];
  ImgMode? mode =
      selectMode ??
      await showModalBottomSheet(
        context: context,
        builder: (ctx) => _ModeSelect(),
      );
  if (mode == ImgMode.camera) {
    var res = await CameraPicker.pickFromCamera(
      context,
      pickerConfig: CameraPickerConfig(enableRecording: false),
    );
    if (res != null) {
      files = <File?>[await res.file];
    }
  }
  if (mode == ImgMode.pic) {
    var res = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: count ?? 1,
        requestType: RequestType.image,
      ),
    );
    if (res != null) {
      files = await Future.wait(res.map((e) => e.file));
    }
  }
  if (files.isEmpty) {
    return null;
  }
  try {
    return await Future.wait(
      files.map(
        (e) => _compressTo(
          e,
          LocalCacheObject(
            '${e!.path.split('/').last}',
            channel: kImageCacheChannel,
          ).file,
          500,
        ),
      ),
    );
  } catch (e) {
    print('压缩出错：$e');
    showToast('压缩图片出错');
    return [];
  }
}

// 压缩到指定大小以下
Future<File?> _compressTo(
  File? file,
  File targetFile,
  int limitK, [
  int depth = 0,
]) async {
  if (file == null) {
    print('文件为空');
    return null;
  }
  if (file.lengthSync() < limitK * 1000) {
    return file;
  }
  try {
    print('开始压缩，${file.path}');
    var data = await FlutterImageCompress.compressWithList(
      file.readAsBytesSync(),
      minHeight: 1000,
      minWidth: 1000,
      quality: 75,
      format: file.path.endsWith('png')
          ? CompressFormat.png
          : CompressFormat.jpeg,
    );
    if (!targetFile.existsSync()) {
      targetFile.createSync(recursive: true);
    }
    targetFile.writeAsBytesSync(data.toList());
    print(
      '压缩图片：${file.lengthSync() / 1000}k 压缩后:${targetFile.lengthSync() / 1000}k',
    );
    if (file.lengthSync() == targetFile.lengthSync()) {
      if (file.lengthSync() < limitK * 1000 * 2)
        return file;
      else
        throw '压缩出现问题，无法继续压缩';
    }
    if (depth > 15) {
      throw '压缩出现问题，无法压缩到指定大小';
    }
  } catch (e) {
    rethrow;
  }
  return _compressTo(targetFile, targetFile, limitK, depth + 1);
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
            onTap: () => Navigator.of(context).pop(ImgMode.camera),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('拍照'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: StColor.lightGray,
          ),
          Tapped(
            onTap: () => Navigator.of(context).pop(ImgMode.pic),
            child: Container(
              width: double.infinity,
              color: StColor.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: StText.normal('从手机相册选择'),
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
