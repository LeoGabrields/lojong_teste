import 'package:flutter/foundation.dart';

import 'package:lojong_teste/src/data/cache/data_cache.dart';
import 'package:lojong_teste/src/models/article/article_model.dart';
import 'package:lojong_teste/src/models/quotes/quote_model.dart';
import 'package:lojong_teste/src/models/video/video_model.dart';

class InspirationViewModel extends ChangeNotifier {
  DataCache dataCache;

  InspirationViewModel({
    required this.dataCache,
  }) {
    fetchData();
  }

  List<ArticleModel> articles = [];
  List<QuoteModel> quotes = [];
  List<VideoModel> videos = [];

  Future<void> fetchData() async {
    loadVideos();
    loadArticles();
    loadQuotes();
  }

  Future<void> loadVideos() async {
    final result = await dataCache.getVideosList();

    videos.addAll(result);

    notifyListeners();
  }

  Future<void> loadArticles() async {
    final result = await dataCache.getArticlesList();

    articles.addAll(result.articles);

    notifyListeners();
  }

  Future<void> loadQuotes() async {
    final result = await dataCache.getQuotesList();

    quotes.addAll(result);

    notifyListeners();
  }

  Future<ArticleModel> getArticle(int articleId) async {
    final result = await dataCache.getArticle(articleId);

    return result;
  }
}
