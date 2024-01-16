import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:flutter_svg/svg.dart';

class VideoPlayerWidget extends StatelessWidget {
  final ChewieController chewieController;
  const VideoPlayerWidget({super.key, required this.chewieController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              chewieController.seekTo(Duration.zero);
              chewieController.pause();
              Navigator.of(context).pop();
            },
            icon: CircleAvatar(
                backgroundColor: Colors.black54,
                child: SvgPicture.asset('assets/images/icon_arrow_back.svg')),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Chewie(controller: chewieController),
      ),
    );
  }
}
