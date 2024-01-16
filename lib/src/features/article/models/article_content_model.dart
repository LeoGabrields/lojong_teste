class ArticleContentModel {
  final int id;
  final String text;
  final String title;
  final String imageUrl;
  final String authorName;
  final String url;
  final String fullText;
  final String authorImage;
  final String authorDescription;
  ArticleContentModel({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.fullText,
    required this.authorImage,
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
      'author_image': authorImage,
    };
  }

  factory ArticleContentModel.fromMap(Map<String, dynamic> map) {
    return ArticleContentModel(
      id: map['id'] ?? 0,
      text: map['text'] ?? '',
      title: map['title'] ?? '',
      imageUrl: map['image_url'] ?? '',
      authorName: map['author_name'] ?? '',
      url: map['url'] ?? '',
      fullText: map['full_text'] ?? '',
      authorImage: map['author_image'] ?? '',
      authorDescription: map['author_description'] ?? '',
    );
  }
}
