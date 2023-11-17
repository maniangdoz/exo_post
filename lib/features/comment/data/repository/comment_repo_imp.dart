import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../domain/entities/comment_response_entity.dart';
import '../../domain/repository/comment_repo.dart';
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
}
