import 'package:dartz/dartz.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/features/quotes/models/quote_list_model.dart';

abstract interface class QuoteRepository {
  Future<Either<RepositoryException, QuoteListModel>> getQuotesList(
      {required int page});
}
