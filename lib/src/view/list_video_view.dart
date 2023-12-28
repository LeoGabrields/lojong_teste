import 'package:flutter/material.dart';

import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/models/video/video_model.dart';
import 'package:lojong_teste/src/view/widgets/video_card_player_widget.dart';

class VideoView extends StatelessWidget {
  final List<VideoModel> videos;
  const VideoView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          ],
        );
      },
    );
  }
}
