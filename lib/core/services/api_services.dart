import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../common/constants.dart';

@injectable
class ApiServices {
  final HttpWithMiddleware _client;

  ApiServices({required HttpWithMiddleware client}) : _client = client;

  Future<http.Response> login(
      {required String email, required String password}) async {
    try {
      final response = await _client.post(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/auth/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      return response;
    } catch (e) {
      log(e.toString());
      throw 'Error occured';
    }
  }

  Future<http.Response> signup(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final response = await _client.post(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/auth/signup'),
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
        }),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      return response;
    } catch (e) {
      log(e.toString());
      throw 'Error occured';
    }
  }

  Future<http.Response> postList(
      {required int page, required int perPage}) async {
    try {
      final response = await _client.get(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/post',
            {'page': '$page', 'per_page': '$perPage'}),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw 'Error occured';
    }
  }
}
