
// ====================== 统一的媒体展示组件 ======================

import 'dart:io';

import 'package:aquarium_diary/database/models/media.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaView extends StatefulWidget {
  final Media media;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool autoPlay; // 是否自动播放视频（主图 true，网格 false）

  const MediaView({
    Key? key,
    required this.media,
    this.width,
    this.height,
    this.fit,
    this.autoPlay = true,
  }) : super(key: key);

  @override
  _MediaViewState createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView> {
  VideoPlayerController? _controller;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    if (widget.media.mediaType == MediaType.video && widget.autoPlay) {
      _initVideo();
    }
  }

  void _initVideo() {
    _controller = VideoPlayerController.file(File(widget.media.filePath))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller!.setLooping(true);
          _controller!.setVolume(_isMuted ? 0 : 1);
          _controller!.play();
        }
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller?.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = widget.media;
    final width = widget.width ?? double.infinity;
    final height = widget.height ?? 300;
    final fit = widget.fit ?? BoxFit.cover;

    if (media.mediaType == MediaType.image) {
      return Image.file(
        File(media.filePath),
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      // 视频
      if (!widget.autoPlay) {
        // 网格模式：只显示封面
        return ClipRRect(
          child: media.thumbnailPath != null
              ? Image.file(
                  File(media.thumbnailPath!),
                  width: width,
                  height: height,
                  fit: fit,
                )
              : Container(
                  color: Colors.black,
                  child: const Center(
                    child: Icon(Icons.videocam, color: Colors.white, size: 32),
                  ),
                ),
        );
      }

      // 主图模式：自动播放视频
      if (_controller == null || !_controller!.value.isInitialized) {
        return Container(
          width: width,
          height: height,
          color: Colors.black,
          child: const Center(child: CircularProgressIndicator()),
        );
      }
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: VideoPlayer(_controller!),
          ),
          // 静音按钮
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: _toggleMute,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
