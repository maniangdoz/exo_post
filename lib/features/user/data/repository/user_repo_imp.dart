import 'dart:convert';

import 'package:exo_post/core/services/api_services.dart';
import 'package:exo_post/features/user/domain/entities/user_post_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../domain/repository/user_repo.dart';
import '../models/user_post_response.dart';

@Injectable(as: UserRepo)
class UserRepoImp extends UserRepo {
  final ApiServices _api;

  UserRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<UserPostResponseEntity> getAllPosts({
    required int userId,
    required int page,
    required int perPage,
  }) async {
    return _api
        .userPosts(
      userId: userId,
      page: page,
      perPage: perPage,
    )
        .then((value) {
      if (value.statusCode == 200) {
        return UserPostResponse.fromJson(jsonDecode(value.body)).toEntity();
      } else if (value.statusCode == 400) {
        throw 'Input Error'; //message to show if we have 400 code error
      } else if (value.statusCode == 403) {
        throw '403'; //message to show if we have 403 code error
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
      throw AppConstants.messageBadConnexion;
    });
  }
}
