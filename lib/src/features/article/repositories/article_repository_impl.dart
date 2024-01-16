import 'dart:developer';

import 'package:lojong_teste/src/core/exceptions/repository_exception.dart';
import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/features/article/models/article_content_model.dart';
import 'package:lojong_teste/src/features/article/models/article_list_model.dart';
import 'package:lojong_teste/src/features/article/repositories/article_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final RestClient restClient;

  ArticleRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, ArticleListModel>> getArticlesList(
      {required int page}) async {
    try {
      final Response(:data) = await restClient.get('articles2?page=$page');

      ArticleListModel articlesListModel = ArticleListModel.fromMap(data);

      return Right(articlesListModel);
    } on DioException catch (e, s) {
      log('Erro ao buscar artigos', error: e, stackTrace: s);
      return Left(RepositoryException(message: 'Erro ao buscar artigos'));
    }
  }

  @override
  Future<Either<RepositoryException, ArticleContentModel>> getArticleContent(
      int articleId) async {
    try {
      final Response(:data) =
          await restClient.get('article-content?articleid=$articleId');

      ArticleContentModel article = ArticleContentModel.fromMap(data);

      return Right(article);
    } on DioException catch (e, s) {
      log('Erro ao buscar artigo', error: e, stackTrace: s);
      return Left(RepositoryException(message: 'Erro ao buscar artigo'));
    }
  }
}
