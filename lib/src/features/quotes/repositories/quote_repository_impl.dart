import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/features/quotes/models/quote_list_model.dart';
import 'package:lojong_teste/src/features/quotes/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final RestClient restClient;

  QuoteRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, QuoteListModel>> getQuotesList(
      {required int page}) async {
    try {
      final Response(:data) = await restClient.get('quotes2?page=$page');

      QuoteListModel quoteListModel = QuoteListModel.fromMap(data);

      return Right(quoteListModel);
    } on DioException catch (e, s) {
      log('Erro ao buscar citações', error: e, stackTrace: s);
      return Left(RepositoryException(message: 'Erro ao buscar citações'));
    }
  }
}
