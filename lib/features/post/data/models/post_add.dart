import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/post_add_edit_entity.dart';
import 'author.dart';
import 'image.dart';

part 'post_add.g.dart';

@JsonSerializable()
class PostAdd extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final ImageModel? _image;
  final Author? _author;

  int? get id => _id;

  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageModel? get image => _image;
  Author? get author => _author;

  const PostAdd(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageModel? image,
      required Author? author})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _author = author;

  factory PostAdd.fromJson(Map<String, dynamic> json) =>
      _$PostAddFromJson(json);
  Map<String, dynamic> toJson() => _$PostAddToJson(this);

  PostAddEditEntity toEntity() => PostAddEditEntity(
      id: _id,
      createdAt: _createdAt,
      content: _content,
      image: _image != null ? _image!.toEntity() : null,
      author: _author != null ? _author!.toEntity() : null);

  @override
  List<Object?> get props => [_id, _createdAt, _content, _image, _author];
}
