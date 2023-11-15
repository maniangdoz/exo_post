import 'package:equatable/equatable.dart';

import 'author_entity.dart';
import 'image_entity.dart';

class PostAddEntity extends Equatable {
  final int? _id;

  final int? _createdAt;
  final String? _content;
  final ImageEntity? _image;
  final AuthorEntity? _author;

  int? get id => _id;
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageEntity? get image => _image;
  AuthorEntity? get author => _author;

  const PostAddEntity(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageEntity? image,
      required AuthorEntity? author})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _author = author;

  @override
  List<Object?> get props => [_id, _createdAt, _content, _image, _author];
}
