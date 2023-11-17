import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../../post/data/models/error_api_response.dart';
import '../../domain/entities/splash_response_entity.dart';
import '../../domain/repository/splash_repo.dart';
import '../models/user.dart';

@Injectable(as: SplashRepo)
class SplashRepoImp extends SplashRepo {
  final ApiServices _api;

  SplashRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<SplashResponseEntity> getUserLogin() => _api.authMe().then((value) {
        if (value.statusCode == 200) {
          return SplashResponseEntity(
              userEntity: User.fromJson(jsonDecode(value.body)).toEntity());
        } else {
          String error = ErrorApiResponse.fromJson(jsonDecode(value.body))
              .toEntity()
              .message;
          return SplashResponseEntity(errorMessage: error);
        }
      }).catchError((e) {
        throw e;
      });
}
