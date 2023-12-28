import 'dart:convert';

class ArticleModel {
  final int id;
  final String text;
  final String title;
  final String imageUrl;
  final String? authorName;
  final String? url;
  final String? fullText;
  final String? authorDescription;

  ArticleModel({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.fullText,
    required this.authorDescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'title': title,
      'image_url': imageUrl,
      'author_name': authorName,
      'url': url,
      'full_text': fullText,
      'author_description': authorDescription,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'],
      text: map['text'],
      title: map['title'],
      imageUrl: map['image_url'],
      authorName: map['author_name'],
      url: map['url'],
      fullText: map['full_text'],
      authorDescription: map['author_description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
