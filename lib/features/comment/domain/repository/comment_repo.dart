import '../entities/comment_response_entity.dart';

abstract class CommentRepo {
  Future<CommentResponseEntity> getPost({required int postId});
}
