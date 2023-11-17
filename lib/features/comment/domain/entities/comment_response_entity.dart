import 'package:equatable/equatable.dart';

import '../../../shared/domain/entities/author_entity.dart';
import '../../../post/domain/entities/image_entity.dart';
import 'comment_entity.dart';

class CommentResponseEntity extends Equatable {
  final int? _id;

  final int? _createdAt;
  final String? _content;
  final ImageEntity? _image;
  final AuthorEntity? _author;
  final List<CommentEntity>? _comments;

  int? get id => _id;
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageEntity? get image => _image;
  AuthorEntity? get author => _author;
  List<CommentEntity>? get comments => _comments;

  const CommentResponseEntity(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageEntity? image,
      required AuthorEntity? author,
      required List<CommentEntity>? comments})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _author = author,
        _comments = comments;

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _author, _comments];
}
