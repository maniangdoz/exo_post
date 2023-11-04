import 'author.dart';
import 'image.dart';


class Post {
  final int id;
  final String createdAt;
  final String content;
  final ImageModel image;
  final Author author;
  final int commentsCount;

  Post({
    required this.id,
    required this.createdAt,
    required this.content,
    required this.image,
    required this.author,
    required this.commentsCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      createdAt: json['created_at'],
      content: json['content'],
      image: ImageModel.fromJson(json['image']),
      author: Author.fromJson(json['author']),
      commentsCount: json['comments_count'],
    );
  }
}