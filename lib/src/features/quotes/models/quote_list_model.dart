import 'package:lojong_teste/src/features/quotes/models/quote_model.dart';

class QuoteListModel {
  final bool hasMore;
  final int currentPage;
  final int lastPage;
  final int nextPage;
  final List<QuoteModel> quotesList;

  QuoteListModel({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.quotesList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hasMore': hasMore,
      'currentPage': currentPage,
      'lastPage': lastPage,
      'nextPage': nextPage,
      'quotesList': quotesList.map((x) => x.toMap()).toList(),
    };
  }

  factory QuoteListModel.fromMap(Map<String, dynamic> map) {
    return QuoteListModel(
      hasMore: map['has_more'] as bool,
      currentPage: map['current_page'] as int,
      lastPage: map['last_page'] as int,
      nextPage: (map['next_page'] != int) ? 0 : map['next_page'],
      quotesList: List<QuoteModel>.from(
        (map['list']).map<QuoteModel>(
          (x) => QuoteModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
