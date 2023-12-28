import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/models/article/article_list_model.dart';
import 'package:lojong_teste/src/models/article/article_model.dart';
import 'package:lojong_teste/src/data/repositories/article/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final RestClient restClient;

  ArticleRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, ArticleListModel>>
      fetchArticlesList() async {
    try {
      final Response(:data) = await restClient.get('articles2');

      ArticleListModel articles = ArticleListModel.fromMap(data);

      return Success(articles);
    } on DioException catch (e, s) {
      log('Erro ao buscar artigos', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar artigos'));
    }
  }

  @override
  Future<Either<RepositoryException, ArticleModel>> getArticleById(
      int articleId) async {
    try {
      final Response(:data) =
          await restClient.get('article-content?articleid=$articleId');

      ArticleModel article = ArticleModel.fromMap(data);

      return Success(article);
    } on DioException catch (e, s) {
      log('Erro ao buscar artigo', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao buscar artigo'));
    }
  }
}
