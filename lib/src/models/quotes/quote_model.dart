import 'dart:convert';

class QuoteModel {
  final int id;
  final String text;
  final String author;

  QuoteModel({required this.id, required this.text, required this.author});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'author': author,
    };
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['id'],
      text: map['text'],
      author: map['author'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteModel.fromJson(String source) =>
      QuoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
