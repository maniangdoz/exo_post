part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();
}

class GetAllCommentByPost extends CommentEvent {
  final int _postId;

  const GetAllCommentByPost({required int postId}) : _postId = postId;
  int get postId => _postId;

  @override
  List<Object?> get props => [_postId];
}
