import 'package:equatable/equatable.dart';

import 'comment_entity.dart';

class CommentAddEditResponseEntity extends Equatable {
  final CommentEntity? _commentAddEntity;

  final String? _errorMessage;

  CommentEntity? get commentAddEntity => _commentAddEntity;
  String? get errorMessage => _errorMessage;

  const CommentAddEditResponseEntity(
      {CommentEntity? commentAddEntity, String? errorMessage})
      : _commentAddEntity = commentAddEntity,
        _errorMessage = errorMessage;

  @override
  List<Object?> get props => [_commentAddEntity, _errorMessage];
}
