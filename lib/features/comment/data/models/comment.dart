import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../shared/data/models/author.dart';
import '../../domain/entities/comment_entity.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final Author? _author;

  int? get id => _id;
  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get content => _content;
  Author? get author => _author;

  const Comment(
      {required int? id,
      required int? createdAt,
      required String? content,
      required Author? author})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _author = author;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  CommentEntity toEntity() => CommentEntity(
      id: _id,
      createdAt: _createdAt,
      content: _content,
      author: _author != null ? _author!.toEntity() : null);

  @override
  List<Object?> get props => [_id, _createdAt, _content, _author];
}
