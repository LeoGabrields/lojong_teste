import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:lojong_teste/src/core/ui/styles/colors_app.dart';
import 'package:lojong_teste/src/features/video/view/widgets/video_player_widget.dart';

class VideoCardPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String imageUrl;
  const VideoCardPlayerWidget(
      {super.key, required this.videoUrl, required this.imageUrl});

  @override
  State<VideoCardPlayerWidget> createState() => _VideoCardPlayerWidgetState();
}

class _VideoCardPlayerWidgetState extends State<VideoCardPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {});
          });
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      allowFullScreen: false,
      aspectRatio: 2 / 4,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: const Color(0xC5ADADAD),
        handleColor: Colors.white,
        bufferedColor: context.colors.primary,
        playedColor: Colors.pinkAccent,
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () async {
        await chewieController.play();
        navigator.push(MaterialPageRoute(
          builder: (context) =>
              VideoPlayerWidget(chewieController: chewieController),
        ));
      },
      child: CachedNetworkImage(
        imageUrl: widget.imageUrl,
        placeholder: (_, __) {
          return const Card();
        },
        errorWidget: (_, __, ___) {
          return const SizedBox(
            height: 150,
            child: Center(
              child: Icon(Icons.error),
            ),
          );
        },
        imageBuilder: (context, imageProvider) {
          return Container(
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
              ),
            ),
            child: Center(
              child: Material(
                color: Colors.white,
                shape: const CircleBorder(),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundColor: context.colors.primary,
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
