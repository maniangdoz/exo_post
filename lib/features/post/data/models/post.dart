import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/post_entity.dart';
import '../../../shared/data/models/author.dart';
import 'image.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final ImageModel? _image;
  final Author? _author;
  final int? _commentsCount;

  int? get id => _id;

  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageModel? get image => _image;
  Author? get author => _author;

  @JsonKey(name: 'comments_count')
  int? get commentsCount => _commentsCount;

  const Post(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageModel? image,
      required Author? author,
      required int? commentsCount})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _author = author,
        _commentsCount = commentsCount;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  PostEntity toEntity() => PostEntity(
      id: _id,
      createdAt: _createdAt,
      content: _content,
      image: _image != null ? _image!.toEntity() : null,
      author: _author != null ? _author!.toEntity() : null,
      commentsCount: _commentsCount);

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _author, _commentsCount];
}
