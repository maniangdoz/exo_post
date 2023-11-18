import 'package:injectable/injectable.dart';

import '../entities/comment_add_edit_response_entity.dart';
import '../entities/comment_response_entity.dart';
import '../repository/comment_repo.dart';

@injectable
class CommentUseCases {
  final CommentRepo _repo;

  CommentUseCases({required CommentRepo repo}) : _repo = repo;

  Future<CommentResponseEntity> getCommentsPost({required int postId}) =>
      _repo.getPost(postId: postId);

  Future<CommentAddEditResponseEntity> addComment(
          {required String content, required int postId}) =>
      _repo.addComment(content: content, postId: postId);

  Future<CommentAddEditResponseEntity> updateComment(
          {required String content, required int commentId}) =>
      _repo.updateComment(commentId: commentId, content: content);

  Future<dynamic> removeComment({required int commentId}) =>
      _repo.removeComment(commentId: commentId);
}
