import 'package:flutter_test/flutter_test.dart';

import 'package:lojong_teste/src/features/quotes/repositories/quote_repository.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/features/quotes/models/quote_list_model.dart';

import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockQuoteRepository extends Mock implements QuoteRepository {}

void main() {
  late MockQuoteRepository mockQuoteRepository;

  setUp(() {
    mockQuoteRepository = MockQuoteRepository();
  });

  group('QuoteRepository', () {
    test('should return a QuoteListModel on getQuotesList success', () async {
      const page = 1;
      final expectedQuoteListModel = QuoteListModel(
        currentPage: 1,
        hasMore: true,
        lastPage: 2,
        nextPage: 2,
        quotesList: [],
      );
      when(() => mockQuoteRepository.getQuotesList(page: page))
          .thenAnswer((_) async => Right(expectedQuoteListModel));

      final result = await mockQuoteRepository.getQuotesList(page: page);

      expect(result, equals(Right(expectedQuoteListModel)));
      verify(() => mockQuoteRepository.getQuotesList(page: page)).called(1);
    });

    test('should return RepositoryException on getQuotesList failure',
        () async {
      const page = 1;
      final expectedException = RepositoryException(message: '');
      when(() => mockQuoteRepository.getQuotesList(page: page))
          .thenAnswer((_) async => Left(expectedException));

      final result = await mockQuoteRepository.getQuotesList(page: page);

      expect(result, equals(Left(expectedException)));
      verify(() => mockQuoteRepository.getQuotesList(page: page)).called(1);
    });
  });
}
