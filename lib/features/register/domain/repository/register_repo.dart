import 'package:exo_post/features/register/domain/entities/register_entity.dart';

abstract class RegisterRepo {
  Future<RegisterEntity> signup(
      {required String name, required String email, required String password});
}
