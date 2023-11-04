import 'package:exo_post/features/post/domain/entities/requests/post_request.dart';
import 'package:exo_post/features/post/domain/repository/post_repo.dart';
import 'package:injectable/injectable.dart';
import '../entities/post_response_entity.dart';

@injectable
class PostUseCases {
  final PostRepo _repo;

  PostUseCases({required PostRepo repo}) : _repo = repo;

  Future<PostResponseEntity> getAllPosts({required PostRequest request}) =>
      _repo.postList(postRequest: request);
}
