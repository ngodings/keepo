import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// import 'package:cached_video_player/cached_video_player.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:video_player/video_player.dart';

class FileVideoPlayer extends StatefulWidget {
  final File video;
  final String heroId;

  const FileVideoPlayer({Key? key, required this.video, required this.heroId})
      : super(key: key);

  @override
  State<FileVideoPlayer> createState() => _FileVideoPlayerState();
}

class _FileVideoPlayerState extends State<FileVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  bool isPlay = false;
  bool isLoading = false;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.file(widget.video);

    super.initState();
  }

  void setFile(fileCode) async {
    final encodedStr = fileCode;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/${DateTime.now().millisecondsSinceEpoch}.mp4");
    videoPlayerController =
        VideoPlayerController.file(await file.writeAsBytes(bytes));

    // _playerStateChangedSubscription =
    //     _audioPlayer.playerStateStream.listen(playerStateListener);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  void initialisePlayer() {
    videoPlayerController?.initialize().then((value) {
      videoPlayerController?.setVolume(1);
      setState(() {
        isLoading = false;
      });
    });
  }

  Uint8List? bytes;

  // void getThumbnail() async {
  //   final thumbnailPath = await VideoThumbnail.thumbnailFile(
  //       video: widget.video,
  //       thumbnailPath: (await getTemporaryDirectory()).path,
  //       imageFormat: ImageFormat.JPEG,
  //       quality: 75,
  //       timeMs: 500);
  //   final file = File(thumbnailPath!);
  //   bytes = file.readAsBytesSync();
  // }

  @override
  Widget build(BuildContext context) {
    videoPlayerController.addListener(() {});
    return Material(
      child: DismissiblePage(
        onDismissed: () {
          Navigator.of(context).pop();
        },
        direction: DismissiblePageDismissDirection.multi,
        isFullScreen: true,
        child: Hero(
          tag: "${widget.heroId}-video",
          child: AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: Stack(
              children: [
                // bytes == null ? Container() : Image.memory(bytes!),
                videoPlayerController.value.isInitialized
                    ? VideoPlayer(videoPlayerController)
                    : Container(),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      if (!videoPlayerController.value.isInitialized) {
                        setState(() {
                          isLoading = true;
                        });

                        initialisePlayer();
                      } else {
                        if (videoPlayerController.value.position !=
                            videoPlayerController.value.duration) {
                          if (isPlay) {
                            videoPlayerController.pause();
                          } else {
                            videoPlayerController.play();
                          }
                        } else {
                          initialisePlayer();
                        }

                        setState(() {
                          isPlay = !isPlay;
                        });
                      }
                    },
                    icon: isLoading
                        ? const CircularProgressIndicator()
                        : Icon(
                            isPlay ? Icons.pause_circle : Icons.play_circle,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                  ),
                ),
              ],
            ),
          ).w64(context),
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, required this.video}) : super(key: key);
  final File video;

  @override
  // ignore: library_private_types_in_public_api
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.video)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [VideoPlayer(_controller), Align()]),
            )
          : Container(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  )),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
