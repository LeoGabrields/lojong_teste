import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/models/article/article_list_model.dart';
import 'package:lojong_teste/src/models/article/article_model.dart';

abstract interface class ArticleRepository {
  Future<Either<RepositoryException, ArticleListModel>> fetchArticlesList();

  Future<Either<RepositoryException, ArticleModel>> getArticleById(
      int articleId);
}
