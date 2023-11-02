import 'dart:convert';
import 'dart:developer';

import 'package:exo_post/core/services/api_services.dart';
import 'package:exo_post/features/auth/data/models/auth.dart';
import 'package:exo_post/features/auth/domain/entities/auth_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/auth_repo.dart';

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
          throw '400'; //message to show if we have 400 code error
        } else if (value.statusCode == 403) {
          throw '403'; //message to show if we have 403 code error
        } else if (value.statusCode == 404) {
          throw '404'; //message to show if we have 404 code error
        } else if (value.statusCode == 429) {
          throw '429'; //message to show if we have 429 code error
        } else if (value.statusCode == 500) {
          throw '500'; //message to show if we have 500 code error
        } else {
          throw 'Not repertoried'; //message to show if we have nothing
        }
      }).catchError((e) {
        throw e;
      });
}
