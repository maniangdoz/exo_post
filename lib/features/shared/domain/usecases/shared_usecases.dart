import 'package:injectable/injectable.dart';

import '../entities/author_entity.dart';
import '../repository/shared_repo.dart';

@injectable
class SharedUseCases {
  final SharedRepo _repo;

  SharedUseCases({required SharedRepo repo}) : _repo = repo;

  Future<AuthorEntity> getUserId({required int userId}) =>
      _repo.getInfosUser(userId: userId);
}
