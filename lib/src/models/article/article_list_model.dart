import 'dart:convert';

import 'package:lojong_teste/src/models/article/article_model.dart';

class ArticleListModel {
  final bool hasMore;
  final int currentPage;
  final int lastPage;
  final int nextPage;
  final List<ArticleModel> articles;

  ArticleListModel({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.articles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'has_more': hasMore,
      'current_page': currentPage,
      'last_page': lastPage,
      'next_page': nextPage,
      'list': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory ArticleListModel.fromMap(Map<String, dynamic> map) {
    return ArticleListModel(
        hasMore: map['has_more'],
        currentPage: map['current_page'],
        lastPage: map['last_page'],
        nextPage: map['next_page'],
        articles:
            (map['list'] as List).map((e) => ArticleModel.fromMap(e)).toList());
  }

  String toJson() => json.encode(toMap());

  factory ArticleListModel.fromJson(String source) =>
      ArticleListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
