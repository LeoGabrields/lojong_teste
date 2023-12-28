import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/models/video/video_model.dart';

abstract interface class VideoRepository {
  Future<Either<RepositoryException, List<VideoModel>>> fetchVideosList();
}
