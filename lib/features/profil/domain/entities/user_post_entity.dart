import 'package:equatable/equatable.dart';

import '../../../post/domain/entities/image_entity.dart';

class UserPostEntity extends Equatable {
  final int? _id;

  final int? _createdAt;
  final String? _content;
  final ImageEntity? _image;
  final int? _commentsCount;
  final int? _userId;

  int? get id => _id;
  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageEntity? get image => _image;
  int? get userId => _userId;
  int? get commentsCount => _commentsCount;

  const UserPostEntity(
      {required int? id,
      required int? createdAt,
      required String? content,
      required ImageEntity? image,
      required int? userId,
      required int? commentsCount})
      : _id = id,
        _createdAt = createdAt,
        _content = content,
        _image = image,
        _userId = userId,
        _commentsCount = commentsCount;

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _userId, _commentsCount];
}
