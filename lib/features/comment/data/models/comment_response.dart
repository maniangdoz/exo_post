import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../shared/data/models/author.dart';
import '../../../post/data/models/image.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/entities/comment_response_entity.dart';
import 'comment.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class CommentResponse extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final ImageModel? _image;
  final Author? _author;
  final List<Comment>? _comments;

  int? get id => _id;
  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get content => _content;
  Author? get author => _author;
  List<Comment>? get comments => _comments;
  ImageModel? get image => _image;

  const CommentResponse(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageModel? image,
      required List<Comment>? comments,
      required Author? author})
      : _id = id,
        _createdAt = createdAt,
        _image = image,
        _content = content,
        _comments = comments,
        _author = author;

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);

  CommentResponseEntity toEntity() {
    List<CommentEntity> items = [];
    if (_comments != null) {
      for (var element in _comments!) {
        items.add(element.toEntity());
      }
    }
    return CommentResponseEntity(
        id: _id,
        createdAt: _createdAt,
        content: _content,
        image: _image != null ? _image!.toEntity() : null,
        author: _author != null ? _author!.toEntity() : null,
        comments: items);
  }

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _author, _image, _comments];
}
