import '../entities/post_add_edit_response_entity.dart';
import '../entities/post_response_entity.dart';
import '../entities/requests/post_request.dart';

abstract class PostRepo {
  Future<PostResponseEntity> postList({required PostRequest postRequest});
  Future<PostAddEditResponseEntity> addPost(
      {required String content, String? base64Image});
  Future<PostAddEditResponseEntity> updatePost(
      {required int postId,
      required String content,
      required String type,
      String? base64Image});
  Future<dynamic> removePost({required int postId});

}
