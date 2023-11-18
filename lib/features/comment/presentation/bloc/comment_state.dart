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
      {Status? status,
      CommentResponseEntity? commentResponseEntity,
      String? message})
      : _status = status,
        _commentResponseEntity = commentResponseEntity,
        _message = message;

  Status? get status => _status;
  CommentResponseEntity? get commentResponseEntity => _commentResponseEntity;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _commentResponseEntity, _message];
}

class AddCommentFinished extends CommentState {
  final Status? status;
  final String? message;

  const AddCommentFinished({this.status, this.message});

  @override
  List<Object?> get props => [status, message];
}

class UpdateCommentFinished extends CommentState {
  final Status? status;
  final String? message;

  const UpdateCommentFinished({this.status, this.message});

  @override
  List<Object?> get props => [status, message];
}

class RemoveCommentsFinished extends CommentState {
  final Status? _status;
  final String? _message;

  const RemoveCommentsFinished({Status? status, String? message})
      : _status = status,
        _message = message;

  Status? get status => _status;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _message];
}
