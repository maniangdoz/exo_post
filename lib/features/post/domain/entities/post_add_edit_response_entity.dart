import 'package:equatable/equatable.dart';

import 'post_add_edit_entity.dart';

class PostAddEditResponseEntity extends Equatable {
  final PostAddEditEntity? _postAddEntity;

  final String? _errorMessage;

  PostAddEditEntity? get postAddEntity => _postAddEntity;
  String? get errorMessage => _errorMessage;

  const PostAddEditResponseEntity(
      {PostAddEditEntity? postAddEntity, String? errorMessage})
      : _postAddEntity = postAddEntity,
        _errorMessage = errorMessage;

  @override
  List<Object?> get props => [_postAddEntity, _errorMessage];
}
