import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/models/video/video_model.dart';
import 'package:lojong_teste/src/data/repositories/video/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  RestClient restClient;
  VideoRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, List<VideoModel>>>
      fetchVideosList() async {
    try {
      final Response(:data) = await restClient.get('videos');

      final listVideos =
          (data as List).map((e) => VideoModel.fromMap(e)).toList();

      return Success(listVideos);
    } on DioException catch (e, s) {
      log('Erro ao buscar videos', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar videos'));
    }
  }
}
