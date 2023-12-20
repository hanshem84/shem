import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityDetectorVideoWidget extends StatefulWidget {
  final String videoUrl;

  const VisibilityDetectorVideoWidget({super.key, required this.videoUrl});

  @override
  State<VisibilityDetectorVideoWidget> createState() => _VisibilityDetectorVideoWidgetState();
}

class _VisibilityDetectorVideoWidgetState extends State<VisibilityDetectorVideoWidget> {
  late VideoPlayerController videoController;
  // late CachedVideoPlayerController videoController;
  @override
  void initState() {
    // TODO: implement initState

    videoController = VideoPlayerController.network(widget.videoUrl);
    // videoController = CachedVideoPlayerController.network(widget.videoUrl);
    videoController.setLooping(true);
    videoController.setVolume(0);
    videoController.initialize().then((value) {
      // controller.play();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoController.value != null && videoController.value.isInitialized
        ? VisibilityDetector(
            key: ObjectKey(videoController),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction > 0.8) {
                videoController.play();
              } else {
                try {
                  videoController.pause();
                } catch (e) {}
              }
            },
            child: VideoPlayer(videoController))
        // child: CachedVideoPlayer(videoController))
        : Center(child: CircularProgressIndicator());
  }
}
