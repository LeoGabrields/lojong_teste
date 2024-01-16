import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/widgets/shared_button_widget.dart';
import 'package:lojong_teste/src/features/article/viewmodel/article_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/features/article/view/articles_details_view.dart';

class ArticlesTileWidget extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final String text;
  const ArticlesTileWidget({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<ArticleViewModel>(context);
    final navigator = Navigator.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: context.textStyles.textTitle.copyWith(
            color: const Color(0xFF707481),
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: () async {
            final result = await controler.getArticle(id);

            navigator.push(
              MaterialPageRoute(
                builder: (context) => ArticlesDetailsView(article: result),
              ),
            );
          },
          child: Column(
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.black87,
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (_, __) {
                    return const Card();
                  },
                  errorWidget: (context, url, error) {
                    return const SizedBox(
                      height: 150,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: context.textStyles.textRegular.copyWith(
                        fontSize: 14.6,
                        color: const Color(0xFF80848F),
                      ),
                      text: text,
                      children: [
                        TextSpan(
                          text: '...mais',
                          style: context.textStyles.textRegular.copyWith(
                            fontSize: 14.6,
                            color: const Color.fromARGB(255, 186, 188, 196),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
        const SharedButtonWidget()
      ],
    );
  }
}
