import '../entities/comment_add_edit_response_entity.dart';
import '../entities/comment_response_entity.dart';

abstract class CommentRepo {
  Future<CommentResponseEntity> getPost({required int postId});

  Future<CommentAddEditResponseEntity> addComment(
      {required int postId, required String content});

  Future<CommentAddEditResponseEntity> updateComment(
      {required int commentId, required String content});

  Future<dynamic> removeComment({required int commentId});
}
