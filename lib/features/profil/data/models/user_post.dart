import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../post/data/models/image.dart';
import '../../domain/entities/user_post_entity.dart';

part 'user_post.g.dart';

@JsonSerializable()
class UserPost extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final int? _userId;
  final ImageModel? _image;
  final int? _commentsCount;

  int? get id => _id;

  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageModel? get image => _image;
  int? get userId => _userId;

  @JsonKey(name: 'comments_count')
  int? get commentsCount => _commentsCount;

  const UserPost(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageModel? image,
      required int? userId,
      required int? commentsCount})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _userId = userId,
        _commentsCount = commentsCount;

  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
  Map<String, dynamic> toJson() => _$UserPostToJson(this);

  UserPostEntity toEntity() => UserPostEntity(
      id: _id,
      userId: _userId,
      createdAt: _createdAt,
      content: _content,
      image: _image != null ? _image!.toEntity() : null,
      commentsCount: _commentsCount);

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _userId, _commentsCount];
}
