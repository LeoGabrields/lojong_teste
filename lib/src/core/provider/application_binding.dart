import 'package:flutter/material.dart';
import 'package:lojong_teste/src/features/article/viewmodel/article_viewmodel.dart';
import 'package:lojong_teste/src/features/quotes/viewmodel/quotes_viewmodel.dart';
import 'package:lojong_teste/src/features/video/viewmodel/video_viewmodel.dart';

import 'package:provider/provider.dart';

import 'package:lojong_teste/src/core/rest_client/rest_client.dart';
import 'package:lojong_teste/src/features/article/repositories/article_repository.dart';
import 'package:lojong_teste/src/features/article/repositories/article_repository_impl.dart';
import 'package:lojong_teste/src/features/quotes/repositories/quote_repository.dart';
import 'package:lojong_teste/src/features/quotes/repositories/quote_repository_impl.dart';
import 'package:lojong_teste/src/features/video/repositories/video_repository.dart';
import 'package:lojong_teste/src/features/video/repositories/video_repository_impl.dart';

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
        ChangeNotifierProvider(
          create: (context) => ArticleViewModel(
            articleRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => QuotesViewModel(
            quoteRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoViewModel(
            videoRepository: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
