import 'package:flutter/material.dart';
import 'package:lojong_teste/src/data/cache/data_cache.dart';

import 'package:provider/provider.dart';

import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/data/repositories/article/article_repository.dart';
import 'package:lojong_teste/src/data/repositories/article/article_repository_impl.dart';
import 'package:lojong_teste/src/data/repositories/quote/quote_repository.dart';
import 'package:lojong_teste/src/data/repositories/quote/quote_repository_impl.dart';
import 'package:lojong_teste/src/data/repositories/video/video_repository.dart';
import 'package:lojong_teste/src/data/repositories/video/video_repository_impl.dart';
import 'package:lojong_teste/src/view_model/inspiration_view_model.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => RestClient(),
        ),
        Provider<VideoRepository>(
          create: (context) => VideoRepositoryImpl(
            restClient: context.read(),
          ),
        ),
        Provider<ArticleRepository>(
          create: (context) => ArticleRepositoryImpl(
            restClient: context.read(),
          ),
        ),
        Provider<QuoteRepository>(
          create: (context) => QuoteRepositoryImpl(
            restClient: context.read(),
          ),
        ),
        Provider(
          create: (context) => DataCache(
            articleRepository: context.read(),
            quoteRepository: context.read(),
            videoRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => InspirationViewModel(
            dataCache: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
