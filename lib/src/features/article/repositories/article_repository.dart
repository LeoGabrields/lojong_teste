import 'package:dartz/dartz.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/features/article/models/article_content_model.dart';
import 'package:lojong_teste/src/features/article/models/article_list_model.dart';

abstract interface class ArticleRepository {
  Future<Either<RepositoryException, ArticleListModel>> getArticlesList(
      {required int page});

  Future<Either<RepositoryException, ArticleContentModel>> getArticleContent(
      int articleId);
}
