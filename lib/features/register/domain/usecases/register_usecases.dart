import 'package:exo_post/features/register/domain/entities/register_entity.dart';
import 'package:exo_post/features/register/domain/repository/register_repo.dart';
import 'package:injectable/injectable.dart';

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
