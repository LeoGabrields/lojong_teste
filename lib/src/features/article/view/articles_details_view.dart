import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/features/article/models/article_content_model.dart';

class ArticlesDetailsView extends StatelessWidget {
  final ArticleContentModel article;
  const ArticlesDetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: CircleAvatar(
            backgroundColor: Colors.black26,
            child: SvgPicture.asset('assets/images/icon_arrow_back.svg'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15),
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
                      imageUrl: article.imageUrl,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          article.title,
                          style: context.textStyles.textTitle.copyWith(
                            fontSize: 20,
                            color: const Color(0xFF707481),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          article.fullText,
                          textAlign: TextAlign.justify,
                          style: context.textStyles.textRegular.copyWith(
                            fontSize: 15,
                            color: const Color(0xFF707481),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFEBEBEB),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                article.authorName,
                                style: context.textStyles.textTitle.copyWith(
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                article.authorDescription,
                                style: context.textStyles.textRegular.copyWith(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
