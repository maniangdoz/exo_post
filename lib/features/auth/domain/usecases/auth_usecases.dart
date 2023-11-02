import 'package:exo_post/features/auth/domain/entities/auth_entity.dart';
import 'package:exo_post/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCases {
  final AuthRepo _repo;

  AuthUseCases({required AuthRepo repo}) : _repo = repo;

  Future<AuthEntity> login({required String email, required String password}) =>
      _repo.login(email: email, password: password);
}
