import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../models/auth.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  final ApiServices _api;

  AuthRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<AuthEntity> login({required String email, required String password}) =>
      _api.login(email: email, password: password).then((value) {
        if (value.statusCode == 200) {
          return Auth.fromJson(jsonDecode(value.body)).toEntity();
        } else if (value.statusCode == 400) {
          throw 'Input Error'; //message to show if we have 400 code error
        } else if (value.statusCode == 403) {
          throw 'Email or password incorrect !'; //message to show if we have 403 code error
        } else if (value.statusCode == 404) {
          throw 'Not Found'; //message to show if we have 404 code error
        } else if (value.statusCode == 429) {
          throw 'Rate Limited. Too many requests.'; //message to show if we have 429 code error
        } else if (value.statusCode == 500) {
          throw 'Unexpected error'; //message to show if we have 500 code error
        } else {
          throw 'Not repertoried'; //message to show if we have nothing
        }
      }).catchError((e) {
        throw e;
      });
}
