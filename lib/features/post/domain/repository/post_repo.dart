import '../entities/post_response_entity.dart';
import '../entities/requests/post_request.dart';

abstract class PostRepo {
  Future<PostResponseEntity> postList({required PostRequest postRequest});
}
