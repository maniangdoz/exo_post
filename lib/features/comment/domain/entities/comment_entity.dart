import 'package:equatable/equatable.dart';

import '../../../shared/domain/entities/author_entity.dart';

class CommentEntity extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final AuthorEntity? _author;

  int? get id => _id;
  int? get createdAt => _createdAt;
  String? get content => _content;
  AuthorEntity? get author => _author;

  const CommentEntity(
      {required int? id,
      required int? createdAt,
      required String? content,
      required AuthorEntity? author})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _author = author;

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _author];
}
