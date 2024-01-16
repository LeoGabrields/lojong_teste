import 'package:flutter/material.dart';
import 'package:lojong_teste/src/features/video/repositories/video_repository.dart';
import 'package:lojong_teste/src/features/video/models/video_model.dart';

class VideoViewModel extends ChangeNotifier {
  final VideoRepository videoRepository;
  VideoViewModel({
    required this.videoRepository,
  }) {
    loadVideos();
  }

  List<VideoModel> videos = [];
  bool hasError = false;
  bool isLoading = false;

  Future<void> loadVideos() async {
    isLoading = true;
    final result = await videoRepository.getVideosList();

    result.fold(
      (l) => hasError = true,
      (listVideoModel) {
        videos.addAll(listVideoModel);
        hasError = false;
      },
    );

    isLoading = false;

    notifyListeners();
  }
}
