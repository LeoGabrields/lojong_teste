import 'package:lojong_teste/src/features/article/models/article_model.dart';

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

  factory ArticleListModel.fromMap(Map<String, dynamic> map) {
    return ArticleListModel(
        hasMore: map['has_more'],
        currentPage: map['current_page'],
        lastPage: map['last_page'],
        nextPage: (map['next_page'] != int) ? 0 : map['next_page'],
        articles:
            (map['list'] as List).map((e) => ArticleModel.fromMap(e)).toList());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'has_more': hasMore,
      'current_page': currentPage,
      'last_page': lastPage,
      'next_page': nextPage,
      'list': articles.map((x) => x.toMap()).toList(),
    };
  }
}
