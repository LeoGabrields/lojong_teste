import 'package:flutter_test/flutter_test.dart';
import 'package:lojong_teste/src/features/video/repositories/video_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/features/video/models/video_model.dart';

class MockVideoRepository extends Mock implements VideoRepository {}

void main() {
  late MockVideoRepository mockVideoRepository;

  setUp(() {
    mockVideoRepository = MockVideoRepository();
  });

  group('VideoRepository', () {
    test('should return a list of VideoModel on getVideosList success',
        () async {
      final List<VideoModel> expectedVideoList = [];
      when(() => mockVideoRepository.getVideosList())
          .thenAnswer((_) async => Right(expectedVideoList));

      final result = await mockVideoRepository.getVideosList();

      expect(result, equals(Right(expectedVideoList)));
      verify(() => mockVideoRepository.getVideosList()).called(1);
    });

    test('should return RepositoryException on getVideosList failure',
        () async {
      final expectedException = RepositoryException(message: '');
      when(() => mockVideoRepository.getVideosList())
          .thenAnswer((_) async => Left(expectedException));

      final result = await mockVideoRepository.getVideosList();

      expect(result, equals(Left(expectedException)));
      verify(() => mockVideoRepository.getVideosList()).called(1);
    });
  });
}
