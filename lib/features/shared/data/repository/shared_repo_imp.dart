import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_services.dart';
import '../../domain/entities/author_entity.dart';
import '../../domain/repository/shared_repo.dart';
import '../models/author.dart';

@Injectable(as: SharedRepo)
class SharedRepoImp extends SharedRepo {
  final ApiServices _api;

  SharedRepoImp({required ApiServices api}) : _api = api;

  @override
  Future<AuthorEntity> getInfosUser({required int userId}) {
    return _api.infoUser(userId: userId).then((value) {
      if (value.statusCode == 200) {
        return Author.fromJson(jsonDecode(value.body)).toEntity();
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
