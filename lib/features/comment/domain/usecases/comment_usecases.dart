import 'package:injectable/injectable.dart';

import '../entities/comment_response_entity.dart';
import '../repository/comment_repo.dart';

@injectable
class CommentUseCases {
  final CommentRepo _repo;

  CommentUseCases({required CommentRepo repo}) : _repo = repo;

  Future<CommentResponseEntity> getCommentsPost({required int postId}) =>
      _repo.getPost(postId: postId);
}
