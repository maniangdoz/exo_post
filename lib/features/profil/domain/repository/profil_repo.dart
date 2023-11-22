import '../entities/requests/user_post_request.dart';
import '../entities/user_post_response_entity.dart';

abstract class ProfilRepo {
  Future<UserPostResponseEntity> userPostList(
      {required UserPostRequest postRequest});
}
