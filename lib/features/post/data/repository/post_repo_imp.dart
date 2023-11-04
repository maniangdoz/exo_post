import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repository/post_repo.dart';
import '../models/post.dart';

@Injectable(as: PostRepo)
class PostRepoImp extends PostRepo {
  final ApiServices _api;

  PostRepoImp({required ApiServices api}) : _api = api;
  
  @override
  Future<Post> postList(
      {required String page, required String perPage}) => {
      _api.postList(page: page, perPage: perPage).then((value) {
        if (value.statusCode == 200) {
          return Post.fromJson(jsonDecode(value.body)).toEntity();
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
  };
}
