import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/models/quotes/quote_model.dart';

abstract interface class QuoteRepository {
  Future<Either<RepositoryException, List<QuoteModel>>> fetchQuotesList();
}
