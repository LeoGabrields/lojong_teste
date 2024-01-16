import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lojong_teste/src/features/article/repositories/article_repository.dart';
import 'package:lojong_teste/src/features/article/models/article_content_model.dart';
import 'package:lojong_teste/src/features/article/models/article_model.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleRepository articleRepository;
  ArticleViewModel({
    required this.articleRepository,
  }) {
    loadArticles();
  }

  List<ArticleModel> articles = [];
  bool hasError = false;
  bool hasMore = true;
  bool isLoading = false;
  int currentPage = 0;

  Future<void> loadArticles() async {
    if (!hasMore) return;
    isLoading = true;
    currentPage = currentPage + 1;
    final result = await articleRepository.getArticlesList(page: currentPage);
    log('==========================CurrentPage=$currentPage =====================================');

    result.fold(
      (l) => hasError = true,
      (articleListModel) {
        articles.addAll(articleListModel.articles);
        hasMore = articleListModel.hasMore;
        hasError = false;
      },
    );
    isLoading = false;

    notifyListeners();
  }

  Future<ArticleContentModel> getArticle(int articleId) async {
    final result = await articleRepository.getArticleContent(articleId);

    return result.fold((l) {
      hasError = true;
      throw Exception();
    }, (articleContentModel) {
      hasError = false;
      return articleContentModel;
    });
  }
}
