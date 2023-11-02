import 'package:exo_post/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  //constructor login
  Future<AuthEntity> login({required String email, required String password});
}
