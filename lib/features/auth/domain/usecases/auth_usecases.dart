import 'package:injectable/injectable.dart';

import '../entities/auth_entity.dart';
import '../repository/auth_repo.dart';

@injectable
class AuthUseCases {
  final AuthRepo _repo;

  AuthUseCases({required AuthRepo repo}) : _repo = repo;

  Future<AuthEntity> login({required String email, required String password}) =>
      _repo.login(email: email, password: password);
}
