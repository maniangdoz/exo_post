import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../domain/entities/post_add_entity.dart';
import '../../domain/entities/post_add_response_entity.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/entities/requests/post_request.dart';
import '../../domain/repository/post_repo.dart';
import '../models/error_api_response.dart';
import '../models/post_add.dart';
import '../models/post_response.dart';

@Injectable(as: PostRepo)
class PostRepoImp extends PostRepo {
  final ApiServices _api;

  PostRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<PostResponseEntity> postList({required PostRequest postRequest}) {
    return _api
        .postList(page: postRequest.page!, perPage: postRequest.perPage!)
        .then((value) {
      if (value.statusCode == 200) {
        return PostResponse.fromJson(jsonDecode(value.body)).toEntity();
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
      throw e;
    });
  }

  @override
  Future<PostAddResponseEntity> addPost(
          {required String content, String? base64Image}) =>
      _api.addPost(content: content, base64Image: base64Image).then((value) {
        if (value.statusCode == 200) {
          return PostAddResponseEntity(
              postAddEntity:
                  PostAdd.fromJson(jsonDecode(value.body)).toEntity());
        } else {
          String error = ErrorApiResponse.fromJson(jsonDecode(value.body))
              .toEntity()
              .message;

          return PostAddResponseEntity(errorMessage: error);
        }
      }).catchError((e) {
        throw PostAddResponseEntity(errorMessage: e.message);
      });
}
