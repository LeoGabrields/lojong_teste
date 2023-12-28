import 'dart:convert';

class VideoModel {
  final int id;
  final String name;
  final String description;
  final String url;
  final String imageUrl;

  VideoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'aws_url': url,
      'image_url': imageUrl,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['aws_url'],
      imageUrl: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
