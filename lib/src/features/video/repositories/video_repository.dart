import 'package:dartz/dartz.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/features/video/models/video_model.dart';

abstract interface class VideoRepository {
  Future<Either<RepositoryException, List<VideoModel>>> getVideosList();
}
