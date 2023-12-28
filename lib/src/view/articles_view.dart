import 'package:flutter/material.dart';

import 'package:lojong_teste/src/view/widgets/articles_tile_widget.dart';
import 'package:lojong_teste/src/models/article/article_model.dart';

class ArticlesView extends StatelessWidget {
  final List<ArticleModel> articles;
  const ArticlesView({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 19.5,
        horizontal: 35,
      ),
      itemCount: articles.length,
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 0.2,
          color: Color(0xFF707481),
        );
      },
      itemBuilder: (context, index) {
        final article = articles[index];
        return Column(
          children: [
            ArticlesTileWidget(
              id: article.id,
              title: article.title,
              text: article.text,
              imageUrl: article.imageUrl,
            ),
          ],
        );
      },
    );
  }
}
