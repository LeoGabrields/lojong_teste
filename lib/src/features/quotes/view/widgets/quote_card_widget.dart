import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lojong_teste/src/core/ui/styles/text_styles.dart';
import 'package:lojong_teste/src/features/quotes/models/quote_model.dart';

class QuoteCardWidget extends StatelessWidget {
  final int indexCard;
  final QuoteModel quote;
  const QuoteCardWidget({
    Key? key,
    required this.indexCard,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cardName() {
      if (indexCard == 0) {
        return 'cardBlue';
      } else if (indexCard == 1) {
        return 'cardYellow';
      } else {
        return 'cardRed';
      }
    }

    Color fontColor() {
      if (indexCard == 0) {
        return const Color(0xFF446DAF);
      } else if (indexCard == 1) {
        return const Color(0x88000000);
      } else {
        return const Color(0xFFFFFFFF);
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black87,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/${cardName()}.svg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 230,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Center(
              child: AutoSizeText(
                quote.text,
                minFontSize: 12,
                maxFontSize: 21,
                style: context.textStyles.textSemiBold.copyWith(
                  color: fontColor(),
                ),
                presetFontSizes: const [21, 20, 19, 18, 16, 15, 14, 13, 12],
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned.fill(
            top: 230,
            child: Column(
              children: [
                Text(
                  quote.author,
                  textAlign: TextAlign.center,
                  style: context.textStyles.textRegular
                      .copyWith(color: fontColor(), fontSize: 11),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: indexCard == 0
                          ? const Color(0xFF446DAF)
                          : Colors.white24),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Compartilhar',
                        style: context.textStyles.textSemiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
