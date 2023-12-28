import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/models/quotes/quote_model.dart';
import 'package:lojong_teste/src/data/repositories/quote/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final RestClient restClient;

  QuoteRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, List<QuoteModel>>>
      fetchQuotesList() async {
    try {
      final Response(:data) = await restClient.get('quotes2');

      final listQuote =
          (data['list'] as List).map((e) => QuoteModel.fromMap(e)).toList();

      return Success(listQuote);
    } on DioException catch (e, s) {
      log('Erro ao buscar citações', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar citações'));
    }
  }
}
