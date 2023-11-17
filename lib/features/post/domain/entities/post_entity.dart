import 'package:equatable/equatable.dart';

import '../../../shared/domain/entities/author_entity.dart';
import 'image_entity.dart';

class PostEntity extends Equatable {
  final int? _id;

  final int? _createdAt;
  final String? _content;
  final ImageEntity? _image;
  final AuthorEntity? _author;
  final int? _commentsCount;

  int? get id => _id;
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageEntity? get image => _image;
  AuthorEntity? get author => _author;
  int? get commentsCount => _commentsCount;

  const PostEntity(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageEntity? image,
      required AuthorEntity? author,
      required int? commentsCount})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _author = author,
        _commentsCount = commentsCount;

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _author, _commentsCount];
}
