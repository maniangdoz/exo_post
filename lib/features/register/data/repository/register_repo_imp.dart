import 'dart:convert';

import 'package:exo_post/core/services/api_services.dart';
import 'package:exo_post/features/register/data/models/register_model.dart';
import 'package:exo_post/features/register/domain/entities/register_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/register_repo.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImp extends RegisterRepo {
  //implementation
  final ApiServices _api;

  RegisterRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<RegisterEntity> signup(
      {required String name, required String email, required String password}) {
    return _api
        .signup(email: email, password: password, name: name)
        .then((value) {
      if (value.statusCode == 200) {
        return RegisterModel.fromJson(jsonDecode(value.body)).toEntity();
      } else if (value.statusCode == 400) {
        throw '400'; //message to show if we have 400 code error
      } else if (value.statusCode == 403) {
        throw 'Account already exists !'; //message to show if we have 403 code error
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
}
