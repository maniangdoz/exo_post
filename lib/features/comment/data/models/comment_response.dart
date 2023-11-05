import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../post/data/models/author.dart';
import '../../../post/data/models/image.dart';
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

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _author, _image, _comments];
}
