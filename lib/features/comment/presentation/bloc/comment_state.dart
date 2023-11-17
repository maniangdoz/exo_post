part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();
}

final class CommentInitial extends CommentState {
    @override
  List<Object?> get props => throw UnimplementedError();
}
class GetAllCommentsFinished extends CommentState {
  final Status? _status;
  final CommentResponseEntity? _commentResponseEntity;
  final String? _message;

  const GetAllCommentsFinished(
      {Status? status, CommentResponseEntity? commentResponseEntity, String? message})
      : _status = status,
        _commentResponseEntity = commentResponseEntity,
        _message = message;

  Status? get status => _status;
  CommentResponseEntity? get commentResponseEntity => _commentResponseEntity;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _commentResponseEntity, _message];
}
