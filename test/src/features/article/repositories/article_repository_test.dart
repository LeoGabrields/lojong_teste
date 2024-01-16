import 'package:flutter_test/flutter_test.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/features/article/models/article_content_model.dart';
import 'package:lojong_teste/src/features/article/models/article_list_model.dart';
import 'package:lojong_teste/src/features/article/repositories/article_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
  });

  group('ArticleRepository', () {
    test('should return ArticleListModel on getArticlesList success', () async {
      final expectedListModelMock = ArticleListModel(
        articles: [],
        currentPage: 1,
        hasMore: true,
        lastPage: 2,
        nextPage: 2,
      );
      const page = 1;

      when(() => mockArticleRepository.getArticlesList(page: page))
          .thenAnswer((_) async => Right(expectedListModelMock));

      final result = await mockArticleRepository.getArticlesList(page: page);

      expect(result, equals(Right(expectedListModelMock)));
      verify(() => mockArticleRepository.getArticlesList(page: page)).called(1);
    });

    test('should return RepositoryException on getArticlesList failure',
        () async {
      const page = 1;
      final expectedException = RepositoryException(message: '');
      when(() => mockArticleRepository.getArticlesList(page: page))
          .thenAnswer((_) async => Left(expectedException));

      final result = await mockArticleRepository.getArticlesList(page: page);

      expect(result, equals(Left(expectedException)));
      verify(() => mockArticleRepository.getArticlesList(page: page)).called(1);
    });

    test('should return ArticleContentModel on getArticleContent success',
        () async {
      const articleId = 1;
      final expectedContentModel = ArticleContentModel(
        authorDescription: '',
        authorImage: '',
        authorName: '',
        fullText: '',
        id: 1,
        imageUrl: '',
        text: '',
        title: '',
        url: '',
      );

      when(() => mockArticleRepository.getArticleContent(articleId))
          .thenAnswer((_) async => Right(expectedContentModel));

      final result = await mockArticleRepository.getArticleContent(articleId);

      expect(result, equals(Right(expectedContentModel)));
      verify(() => mockArticleRepository.getArticleContent(articleId))
          .called(1);
    });

    test('should return RepositoryException on getArticleContent failure',
        () async {
      const articleId = 1;
      final expectedException = RepositoryException(message: '');
      when(() => mockArticleRepository.getArticleContent(articleId))
          .thenAnswer((_) async => Left(expectedException));

      final result = await mockArticleRepository.getArticleContent(articleId);

      expect(result, equals(Left(expectedException)));
      verify(() => mockArticleRepository.getArticleContent(articleId))
          .called(1);
    });
  });
}
