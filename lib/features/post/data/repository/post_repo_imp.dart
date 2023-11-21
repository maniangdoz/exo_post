import 'dart:convert';

import 'package:exo_post/common/constants.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../domain/entities/post_add_edit_response_entity.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/entities/requests/post_request.dart';
import '../../domain/repository/post_repo.dart';
import '../../../shared/data/models/error_api_response.dart';
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
        throw AppConstants.messageBadConnexion;
    });
  }

  @override
  Future<PostAddEditResponseEntity> addPost(
          {required String content, String? base64Image}) =>
      _api.addPost(content: content, base64Image: base64Image).then((value) {
        if (value.statusCode == 200) {
          return PostAddEditResponseEntity(
              postAddEntity:
                  PostAdd.fromJson(jsonDecode(value.body)).toEntity());
        } else if (value.statusCode == 401) {
          return const PostAddEditResponseEntity(
              errorMessage: AppConstants.messageError401);
        } else {
          String error = ErrorApiResponse.fromJson(jsonDecode(value.body))
              .toEntity()
              .message;
          return PostAddEditResponseEntity(errorMessage: error);
        }
      }).catchError((e) {
        throw AppConstants.messageBadConnexion;
      });

  @override
  Future<PostAddEditResponseEntity> updatePost(
          {required int postId,
          required String content,
          required String type,
          String? base64Image}) =>
      _api
          .updatePost(
              postId: postId,
              content: content,
              base64Image: base64Image,
              type: type)
          .then((value) {
        if (value.statusCode == 200) {
          return PostAddEditResponseEntity(
              postAddEntity:
                  PostAdd.fromJson(jsonDecode(value.body)).toEntity());
        } else {
          String error = ErrorApiResponse.fromJson(jsonDecode(value.body))
              .toEntity()
              .message;
          return PostAddEditResponseEntity(errorMessage: error);
        }
      }).catchError((e) {
        throw AppConstants.messageBadConnexion;
      });

  @override
  Future removePost({required int postId}) {
    return _api.removePost(postId: postId).then((value) {
      if (value.statusCode == 200) {
        return 'Success remove';
      } else {
        return ErrorApiResponse.fromJson(jsonDecode(value.body)).toEntity().message;
      }
    }).catchError((e) {
        throw AppConstants.messageBadConnexion;
    });
  }
}
