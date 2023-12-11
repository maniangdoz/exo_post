import 'package:equatable/equatable.dart';

import '../../../post/data/models/image.dart';

class PostEntity extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _content;
  final ImageModel? _image;
  final int? _commentsCount;

  const PostEntity(
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

  int? get id => _id;

  int? get createdAt => _createdAt;
  String? get content => _content;
  ImageModel? get image => _image;

  int? get commentsCount => _commentsCount;

  @override
  List<Object?> get props =>
      [_id, _createdAt, _content, _image, _commentsCount];
}
