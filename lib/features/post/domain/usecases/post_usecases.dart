import 'package:injectable/injectable.dart';

import '../entities/post_add_edit_response_entity.dart';
import '../entities/post_response_entity.dart';
import '../entities/requests/post_request.dart';
import '../repository/post_repo.dart';

@injectable
class PostUseCases {
  final PostRepo _repo;

  PostUseCases({required PostRepo repo}) : _repo = repo;

  Future<PostResponseEntity> getAllPosts({required PostRequest request}) =>
      _repo.postList(postRequest: request);

  Future<PostAddEditResponseEntity> addPost(
          {required String content, String? base64Image}) =>
      _repo.addPost(content: content, base64Image: base64Image);

  Future<PostAddEditResponseEntity> updatePost(
          {required String content,
          required int postId,
          required String type,
          String? base64Image}) =>
      _repo.updatePost(
          postId: postId,
          content: content,
          base64Image: base64Image,
          type: type);
}
