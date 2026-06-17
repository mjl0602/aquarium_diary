import 'dart:io';
import 'dart:math';

import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/tools/image_share.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fconsole/fconsole.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

const kImageCacheChannel = 'temp_img';

/// 创建loading动画
Widget? Function(ExtendedImageState)? imageLoadingStyle({
  double size = 12,
  double failIconSize = 12,
  Color color = StColor.gray,
}) => (ExtendedImageState state) {
  if (state.extendedImageLoadState == LoadState.loading) {
    return Container(
      margin: EdgeInsets.all(12),
      child: CupertinoActivityIndicator(radius: size / 2, color: color),
    );
  }
  if (state.extendedImageLoadState == LoadState.failed) {
    if (state.imageProvider is ExtendedNetworkImageProvider) {
      var imageProvider = (state.imageProvider as ExtendedNetworkImageProvider);
      if (imageProvider.url.isEmpty) {
        // 处理空字符串的加载状态？
        // return Container();
        return Container(
          margin: EdgeInsets.all(12),
          child: CupertinoActivityIndicator(radius: size / 2, color: color),
        );
      }
      fconsole.error('加载图片链接失败: ${imageProvider.url}');
    }
    return Container(
      margin: EdgeInsets.all(2),
      child: Icon(
        Icons.broken_image_rounded,
        color: StColor.halfGray,
        size: failIconSize,
      ),
    );
  }
  return null;
};

Widget? Function(ExtendedImageState)? loadStateChangedMini =
    imageLoadingStyle();
Widget? Function(ExtendedImageState)? loadStateChangedBig = imageLoadingStyle(
  size: 32,
  failIconSize: 32,
);

previewImage(
  BuildContext context,
  String heroTag, {
  required ImageProvider imageProvider,
  Color previewBackgroundColor = StColor.black,
}) {
  GlobalKey _key = GlobalKey();
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (ctx, animation, secAnimation) => ExtendedImageSlidePage(
        key: _key,
        slidePageBackgroundHandler: (offset, pageSize) {
          return StColor.black.withOpacity(
            1 - (offset.dy.abs() / 375).clamp(0.0, 1.0),
          );
        },
        slideType: SlideType.onlyImage,
        slideAxis: SlideAxis.both,
        child: GestureDetector(
          onTap: () {
            var s = _key.currentState as ExtendedImageSlidePageState;
            s.popPage();
            Navigator.of(ctx).pop();
          },
          onLongPress: () {
            // 分享/保存图片
            shareOrSaveImage(context, image: imageProvider);
          },
          child: ExtendedImage(
            image: imageProvider,
            fit: BoxFit.contain,
            width: double.infinity,
            mode: ExtendedImageMode.gesture,
            loadStateChanged: loadStateChangedBig,
            enableSlideOutPage: true,
            heroBuilderForSlidingPage: (widget) =>
                Hero(tag: heroTag, child: widget),
          ),
        ),
      ),
    ),
  );
}

/// 预览多张图片
previewMutiImages(BuildContext context, List<String> list, int index) {
  List<dynamic> providers = list.map((url) {
    bool _isWebImage = url.startsWith('http');

    dynamic provider = _isWebImage
        ? ExtendedNetworkImageProvider('$url', cache: true)
        : ExtendedFileImageProvider(File(url));
    return provider;
  }).toList();
  final Size size = MediaQuery.of(context).size;
  GlobalKey _key = GlobalKey();
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (ctx, animation, secAnimation) => ExtendedImageSlidePage(
        key: _key,
        slidePageBackgroundHandler: (offset, pageSize) {
          return StColor.black.withOpacity(
            1 - (offset.dy.abs() / 375).clamp(0.0, 1.0),
          );
        },
        slideType: SlideType.onlyImage,
        slideAxis: SlideAxis.both,
        child: ExtendedImageGesturePageView.builder(
          itemCount: list.length,
          physics: CustomScrollPhysics(),
          controller: ExtendedPageController(initialPage: index),
          itemBuilder: (BuildContext context, int index) {
            dynamic provider = providers[index];

            var image = ExtendedImage(
              image: provider,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
              enableSlideOutPage: true,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (ExtendedImageState state) {
                double? initialScale = 1.0;

                if (state.extendedImageInfo != null) {
                  initialScale = initScale(
                    size: size,
                    initialScale: initialScale,
                    imageSize: Size(
                      state.extendedImageInfo!.image.width.toDouble(),
                      state.extendedImageInfo!.image.height.toDouble(),
                    ),
                  );
                }
                return GestureConfig(
                  inPageView: true,
                  initialScale: initialScale!,
                  maxScale: max(initialScale, 5.0),
                  animationMaxScale: max(initialScale, 5.0),
                  initialAlignment: InitialAlignment.center,
                  //you can cache gesture state even though page view page change.
                  //remember call clearGestureDetailsCache() method at the right time.(for example,this page dispose)
                  cacheGesture: false,
                );
              },
              loadStateChanged: loadStateChangedBig,
            );
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(),
              onLongPress: () {
                // 分享/保存图片
                shareOrSaveImage(context, image: provider);
              },
              child: Hero(tag: list[index], child: image),
            );
          },
          onPageChanged: (int pageIndex) {
            // print("nell-pageIndex:$pageIndex");
          },
        ),
      ),
    ),
  );
}

class PreviewableImage extends StatefulWidget {
  final String? heroTag;
  final ImageProvider image;
  final ImageProvider? realImage;
  final String? text;
  final double? width;
  final double? height;
  final Color previewBackgroundColor;
  final Widget? Function(ExtendedImageState)? loadStateChanged;

  const PreviewableImage({
    Key? key,
    this.heroTag,
    required this.image,
    this.text,
    this.width,
    this.height,
    this.realImage,
    this.loadStateChanged,
    this.previewBackgroundColor = StColor.black,
  }) : super(key: key);

  @override
  _PreviewableImageState createState() => _PreviewableImageState();
}

class _PreviewableImageState extends State<PreviewableImage> {
  @override
  void initState() {
    super.initState();
    if (widget.realImage != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        precacheImage(widget.realImage!, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.image is ExtendedNetworkImageProvider) {
      ExtendedNetworkImageProvider _image =
          widget.image as ExtendedNetworkImageProvider;
      if (_image.url.isEmpty) {
        return Container(
          height: widget.height ?? widget.width,
          width: widget.width,
        );
      }
    }
    String _heroTag =
        widget.heroTag ??
        '${widget.image.hashCode}${Random().nextInt(1000000000)}';
    Widget content = Container(
      height: widget.height ?? widget.width,
      width: widget.width,
      color: StColor.lightGray,
      child: ClipRect(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Hero(
            tag: _heroTag,
            child: ExtendedImage(
              image: widget.image,
              fit: BoxFit.contain,
              loadStateChanged: widget.loadStateChanged ?? loadStateChangedMini,
              width: widget.width,
            ),
          ),
        ),
      ),
    );
    if (widget.text != null) {
      content = Stack(
        alignment: Alignment.bottomCenter,
        children: [
          content,
          widget.text == null
              ? Container()
              : Container(
                  width: widget.width,
                  alignment: Alignment.center,
                  color: StColor.black.withOpacity(0.5),
                  child: StText.small(
                    widget.text ?? '??',
                    style: TextStyle(color: StColor.white),
                  ),
                ),
        ],
      );
    }

    return Tapped(
      onTap: () {
        previewImage(
          context,
          _heroTag,
          imageProvider: widget.realImage ?? widget.image,
          previewBackgroundColor: widget.previewBackgroundColor,
        );
      },
      child: content,
    );
  }
}

double? initScale({
  required Size imageSize,
  required Size size,
  double? initialScale,
}) {
  final double n1 = imageSize.height / imageSize.width;
  final double n2 = size.height / size.width;
  if (n1 > n2) {
    final FittedSizes fittedSizes = applyBoxFit(
      BoxFit.contain,
      imageSize,
      size,
    );
    //final Size sourceSize = fittedSizes.source;
    final Size destinationSize = fittedSizes.destination;
    return size.width / destinationSize.width;
  } else if (n1 / n2 < 1 / 4) {
    final FittedSizes fittedSizes = applyBoxFit(
      BoxFit.contain,
      imageSize,
      size,
    );
    //final Size sourceSize = fittedSizes.source;
    final Size destinationSize = fittedSizes.destination;
    return size.height / destinationSize.height;
  }

  return initialScale;
}

class CustomScrollPhysics extends BouncingScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => SpringDescription.withDampingRatio(
    mass: 0.2,
    stiffness: 300.0, // Increase this value as you wish.
    ratio: 1.1,
  );
}
