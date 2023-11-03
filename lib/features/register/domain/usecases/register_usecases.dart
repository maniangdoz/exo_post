import 'package:injectable/injectable.dart';

import '../entities/register_entity.dart';
import '../repository/register_repo.dart';

@injectable
class RegisterUseCases {
  final RegisterRepo _repo;

  RegisterUseCases({required RegisterRepo repo}) : _repo = repo;

  Future<RegisterEntity> signup(
          {required String name,
          required String email,
          required String password}) =>
      _repo.signup(name: name, email: email, password: password);
}
