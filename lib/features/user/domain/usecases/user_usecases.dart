import 'package:exo_post/features/user/domain/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/user_post_response_entity.dart';

@injectable
class UserUseCases {
  final UserRepo _repo;

  UserUseCases({required UserRepo repo}) : _repo = repo;

  Future<UserPostResponseEntity> getAllPosts({
    required int userId,
    required int page,
    required int perPage,
  }) {
    return _repo.getAllPosts(userId: userId, page: page, perPage: perPage);
  }
}
