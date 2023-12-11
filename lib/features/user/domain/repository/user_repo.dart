import 'package:exo_post/features/user/domain/entities/user_post_response_entity.dart';

abstract class UserRepo {
  Future<UserPostResponseEntity> getAllPosts({
    required int userId,
    required int page,
    required int perPage,
  });
}
