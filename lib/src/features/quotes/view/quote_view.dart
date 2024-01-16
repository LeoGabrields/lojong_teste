import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/ui/widgets/show_error_widget.dart';

import 'package:lojong_teste/src/features/quotes/view/widgets/quote_card_widget.dart';
import 'package:lojong_teste/src/features/quotes/viewmodel/quotes_viewmodel.dart';
import 'package:provider/provider.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({Key? key}) : super(key: key);

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  final _scrollController = ScrollController();
  late final QuotesViewModel quotesViewModel =
      Provider.of<QuotesViewModel>(context);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      quotesViewModel;
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
    if (quotesViewModel.isLoading || !quotesViewModel.hasMore) return;
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      quotesViewModel.loadQuotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    final quotes = quotesViewModel.quotes;

    return ShowErrorWidget(
      hasError: quotesViewModel.hasError,
      onPressed: () {
        setState(() {
          quotesViewModel.currentPage = 0;
          quotesViewModel.loadQuotes();
        });
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          final quote = quotes[index];
          return QuoteCardWidget(
            indexCard: index % 3,
            quote: quote,
          );
        },
      ),
    );
  }
}
