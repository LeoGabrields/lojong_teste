import 'package:flutter/material.dart';

import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/core/ui/widgets/show_loading_widget.dart';
import 'package:lojong_teste/src/core/ui/widgets/shared_button_widget.dart';
import 'package:lojong_teste/src/features/video/view/widgets/video_card_player_widget.dart';
import 'package:lojong_teste/src/features/video/viewmodel/video_viewmodel.dart';
import 'package:provider/provider.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final videoViewModel = Provider.of<VideoViewModel>(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      videoViewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    final videos = videoViewModel.videos;

    return ShowLoadingWidget(
      isLoading: videoViewModel.isLoading,
      hasError: videoViewModel.hasError,
      onPressed: () {
        setState(() {
          videoViewModel.loadVideos();
        });
      },
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 19.5,
          horizontal: 35,
        ),
        itemCount: videos.length,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.2,
            color: Color(0xFF979797),
          );
        },
        itemBuilder: (context, index) {
          final video = videos[index];
          return Column(
            children: [
              Text(
                video.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: context.textStyles.textTitle.copyWith(
                  color: const Color(0xFF80848F),
                  fontSize: 16,
                ),
              ),
              VideoCardPlayerWidget(
                imageUrl: video.imageUrl,
                videoUrl: video.url,
              ),
              Text(
                video.description,
                textAlign: TextAlign.center,
                style: context.textStyles.textRegular.copyWith(
                  fontSize: 14.6,
                  color: const Color(0xFF80848F),
                ),
              ),
              const SizedBox(height: 5),
              const SharedButtonWidget(),
            ],
          );
        },
      ),
    );
  }
}
