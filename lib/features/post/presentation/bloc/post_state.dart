part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
}

final class PostInitial extends PostState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllPostsFinished extends PostState {
  final Status? _status;
  final PostResponseEntity? _postResponseEntity;
  final String? _message;

  const GetAllPostsFinished(
      {Status? status, PostResponseEntity? postResponseEntity, String? message})
      : _status = status,
        _postResponseEntity = postResponseEntity,
        _message = message;

  Status? get status => _status;
  PostResponseEntity? get postResponseEntity => _postResponseEntity;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _postResponseEntity, _message];
}

class AddPostFinished extends PostState {
  final Status? status;
  final String? message;

  const AddPostFinished({this.status, this.message});

  @override
  List<Object?> get props => [status, message];
}

class UpdatePostFinished extends PostState {
  final Status? status;
  final String? message;

  const UpdatePostFinished({this.status, this.message});

  @override
  List<Object?> get props => [status, message];
}
