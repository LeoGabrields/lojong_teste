import 'package:flutter/material.dart';

import 'package:lojong_teste/src/models/quotes/quote_model.dart';
import 'package:lojong_teste/src/view/widgets/quote_card_widget.dart';

class QuoteView extends StatelessWidget {
  final List<QuoteModel> quotes;
  const QuoteView({
    Key? key,
    required this.quotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return QuoteCardWidget(
          indexCard: index % 3,
          quote: quote,
        );
      },
    );
  }
}
