class ArticleModel {
  final int id;
  final String text;
  final String title;
  final String imageUrl;
  final String? authorName;
  final String? url;
  final int order;

  ArticleModel({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'title': title,
      'image_url': imageUrl,
      'author_name': authorName,
      'url': url,
      'order': order,
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
      order: map['order'],
    );
  }
}
