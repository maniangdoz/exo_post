import 'package:equatable/equatable.dart';

import 'post_add_entity.dart';

class PostAddResponseEntity extends Equatable {
  final PostAddEntity? _postAddEntity;

  final String? _errorMessage;

  PostAddEntity? get postAddEntity => _postAddEntity;
  String? get errorMessage => _errorMessage;

  const PostAddResponseEntity(
      {PostAddEntity? postAddEntity, String? errorMessage})
      : _postAddEntity = postAddEntity,
        _errorMessage = errorMessage;

  @override
  List<Object?> get props => [_postAddEntity, _errorMessage];
}
