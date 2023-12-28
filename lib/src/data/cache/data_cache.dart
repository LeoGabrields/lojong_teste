import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lojong_teste/src/core/fp/either.dart';
import 'package:lojong_teste/src/data/repositories/article/article_repository.dart';
import 'package:lojong_teste/src/data/repositories/quote/quote_repository.dart';
import 'package:lojong_teste/src/data/repositories/video/video_repository.dart';
import 'package:lojong_teste/src/models/article/article_list_model.dart';
import 'package:lojong_teste/src/models/article/article_model.dart';
import 'package:lojong_teste/src/models/quotes/quote_model.dart';
import 'package:lojong_teste/src/models/video/video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCache {
  final ArticleRepository articleRepository;
  final QuoteRepository quoteRepository;
  final VideoRepository videoRepository;

  DataCache({
    required this.articleRepository,
    required this.quoteRepository,
    required this.videoRepository,
  });

  Future<ArticleListModel> getArticlesList() async {
    try {
      final result = await articleRepository.fetchArticlesList();
      switch (result) {
        case Success(:final value):
          _saveInCache(value.toJson(), 'articles_cache');
          return value;
        case Failure():
          return await _getArticlesListInCache();
      }
    } on DioException {
      return await _getArticlesListInCache();
    }
  }

  Future<ArticleModel> getArticle(int id) async {
    final result = await articleRepository.getArticleById(id);
    switch (result) {
      case Success(:final value):
        return value;
      case Failure():
        throw Exception();
    }
  }

  Future<List<VideoModel>> getVideosList() async {
    try {
      final result = await videoRepository.fetchVideosList();
      switch (result) {
        case Success(value: final videos):
          List<Map> listVideos = [];
          for (var video in videos) {
            listVideos.add(video.toMap());
          }

          _saveInCache(json.encode(listVideos), 'videos_cache');

          return videos;
        case Failure():
          return await _getVideosListInCache();
      }
    } on DioException {
      return await _getVideosListInCache();
    }
  }

  Future<List<QuoteModel>> getQuotesList() async {
    try {
      final result = await quoteRepository.fetchQuotesList();
      switch (result) {
        case Success(value: final quotes):
          List<Map> listQuotes = [];
          for (var quote in quotes) {
            listQuotes.add(quote.toMap());
          }

          _saveInCache(json.encode(listQuotes), 'quotes_cache');

          return quotes;
        case Failure():
          return await _getQuotesListInCache();
      }
    } on DioException {
      return await _getQuotesListInCache();
    }
  }

  Future<void> _saveInCache(String object, String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, object);
  }

  Future<ArticleListModel> _getArticlesListInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var articlesJsonString = prefs.getString('articles_cache');
    var json = jsonDecode(articlesJsonString!);

    var articles = ArticleListModel.fromMap(json);
    return articles;
  }

  Future<List<VideoModel>> _getVideosListInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var videosJsonString = prefs.getString('videos_cache');
    var list = jsonDecode(videosJsonString!);
    var videos =
        (list as List).map((video) => VideoModel.fromMap(video)).toList();

    return videos;
  }

  Future<List<QuoteModel>> _getQuotesListInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var quotesJsonString = prefs.getString('quotes_cache');
    var list = jsonDecode(quotesJsonString!);
    var quotes =
        (list as List).map((quote) => QuoteModel.fromMap(quote)).toList();

    return quotes;
  }
}
