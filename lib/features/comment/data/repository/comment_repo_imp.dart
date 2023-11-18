import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../common/constants.dart';
import '../../../../core/services/api_services.dart';
import '../../../shared/data/models/error_api_response.dart';
import '../../domain/entities/comment_add_edit_response_entity.dart';
import '../../domain/entities/comment_response_entity.dart';
import '../../domain/repository/comment_repo.dart';
import '../models/comment.dart';
import '../models/comment_response.dart';

@Injectable(as: CommentRepo)
class CommentRepoImp extends CommentRepo {
  final ApiServices _api;

  CommentRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<CommentResponseEntity> getPost({required int postId}) {
    return _api.detailPost(postId: postId).then((value) {
      if (value.statusCode == 200) {
        return CommentResponse.fromJson(jsonDecode(value.body)).toEntity();
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
  Future<CommentAddEditResponseEntity> addComment(
          {required String content, required int postId}) =>
      _api.addComment(content: content, postId: postId).then((value) {
        if (value.statusCode == 200) {
          return CommentAddEditResponseEntity(
              commentAddEntity:
                  Comment.fromJson(jsonDecode(value.body)).toEntity());
        } else if (value.statusCode == 401) {
          return const CommentAddEditResponseEntity(
              errorMessage: AppConstants.messageError401);
        } else {
          String error = ErrorApiResponse.fromJson(jsonDecode(value.body))
              .toEntity()
              .message;
          return CommentAddEditResponseEntity(errorMessage: error);
        }
      }).catchError((e) {
        throw CommentAddEditResponseEntity(errorMessage: e.toString());
      });

  @override
  Future<CommentAddEditResponseEntity> updateComment(
          {required int commentId, required String content}) =>
      _api.updateComment(commentId: commentId, content: content).then((value) {
        if (value.statusCode == 200) {
          return CommentAddEditResponseEntity(
              commentAddEntity:
                  Comment.fromJson(jsonDecode(value.body)).toEntity());
        } else {
          String error = ErrorApiResponse.fromJson(jsonDecode(value.body))
              .toEntity()
              .message;
          return CommentAddEditResponseEntity(errorMessage: error);
        }
      }).catchError((e) {
        throw CommentAddEditResponseEntity(errorMessage: e.toString());
      });

  @override
  Future removeComment({required int commentId}) {
    return _api.removeComment(commentId: commentId).then((value) {
      if (value.statusCode == 200) {
        return 'Success remove';
      } else {
        return ErrorApiResponse.fromJson(jsonDecode(value.body))
            .toEntity()
            .message;
      }
    }).catchError((e) {
      throw e;
    });
  }
}
