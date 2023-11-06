import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../post/data/models/image.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final ImageModel? _image;
  final int? _commentsCount;

  int? get id => _id;

  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageModel? get image => _image;

  @JsonKey(name: 'comments_count')
  int? get commentsCount => _commentsCount;

  const Post(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageModel? image,
      required int? commentsCount})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _commentsCount = commentsCount;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _commentsCount];
}
