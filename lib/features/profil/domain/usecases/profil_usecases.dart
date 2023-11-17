import 'package:injectable/injectable.dart';

import '../entities/requests/user_post_request.dart';
import '../entities/user_post_response_entity.dart';
import '../repository/profil_repo.dart';

@injectable
class ProfilUseCases {
  final ProfilRepo _repo;
  ProfilUseCases({required ProfilRepo repo}) : _repo = repo;

  Future<UserPostResponseEntity> getAllUserPosts(
          {required UserPostRequest request}) =>
      _repo.userPostList(postRequest: request);
}
