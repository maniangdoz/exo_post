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

class AddComment extends CommentEvent {
  final String _content;
  final int _postId;

  const AddComment({required String content, required int postId})
      : _content = content,
        _postId = postId;

  String? get content => _content;
  int get postId => _postId;

  @override
  List<Object?> get props => [_content, _postId];
}

class UpdateComment extends CommentEvent {
  final int _commentId;
  final String _content;

  const UpdateComment({required int commentId, required String content})
      : _commentId = commentId,
        _content = content;

  int get commentId => _commentId;
  String? get content => _content;

  @override
  List<Object?> get props => [_commentId, _content];
}

class RemoveComments extends CommentEvent {
  final int _commentId;

  const RemoveComments({required int commentId}) : _commentId = commentId;
  int get commentId => _commentId;

  @override
  List<Object?> get props => [_commentId];
}
