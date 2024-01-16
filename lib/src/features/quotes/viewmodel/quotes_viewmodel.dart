import 'package:flutter/material.dart';

import 'package:lojong_teste/src/features/quotes/repositories/quote_repository.dart';
import 'package:lojong_teste/src/features/quotes/models/quote_model.dart';

class QuotesViewModel extends ChangeNotifier {
  final QuoteRepository quoteRepository;
  QuotesViewModel({
    required this.quoteRepository,
  }) {
    loadQuotes();
  }
  List<QuoteModel> quotes = [];
  bool hasError = false;
  bool hasMore = true;
  bool isLoading = false;
  int currentPage = 0;

  Future<void> loadQuotes() async {
    if (!hasMore) return;
    isLoading = true;
    currentPage = currentPage + 1;
    final result = await quoteRepository.getQuotesList(page: currentPage);

    result.fold(
      (l) => hasError = true,
      (quoteListModel) {
        quotes.addAll(quoteListModel.quotesList);
        hasMore = quoteListModel.hasMore;
        hasError = false;
      },
    );

    isLoading = false;

    notifyListeners();
  }
}
