import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/view/articles_details_view.dart';
import 'package:lojong_teste/src/view_model/inspiration_view_model.dart';

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
    final controler = Provider.of<InspirationViewModel>(context);
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
                child: Hero(
                  tag: id,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                  ),
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFECECEC),
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 6,
            ),
            minimumSize: const Size(122, 35),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.share,
                size: 16,
                color: Color(0xFF80848F),
              ),
              const SizedBox(width: 10),
              Text(
                'Compartilhar',
                style: context.textStyles.textTitle.copyWith(
                  fontSize: 12.4,
                  color: const Color(0xFF80848F),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
