import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/widgets/show_error_widget.dart';

import 'package:lojong_teste/src/features/article/view/widgets/articles_tile_widget.dart';
import 'package:lojong_teste/src/features/article/viewmodel/article_viewmodel.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  final _scrollController = ScrollController();
  late final ArticleViewModel articleViewModel =
      Provider.of<ArticleViewModel>(context);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      articleViewModel;
      _scrollController.addListener(_scrollListener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (articleViewModel.isLoading || !articleViewModel.hasMore) return;
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      articleViewModel.loadArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final articles = articleViewModel.articles;

    return ShowErrorWidget(
      hasError: articleViewModel.hasError,
      onPressed: () {
        setState(() {
          articleViewModel.currentPage = 0;
          articleViewModel.loadArticles();
        });
      },
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
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
          return ArticlesTileWidget(
            id: article.id,
            title: article.title,
            text: article.text,
            imageUrl: article.imageUrl,
          );
        },
      ),
    );
  }
}
