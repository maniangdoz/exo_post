import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../common/utils/app_utils.dart';

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
      throw e.toString();
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
      throw e.toString();
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
      throw e.toString();
    }
  }

  Future<http.Response> detailPost({required int postId}) async {
    try {
      final response = await _client.get(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/post/$postId'),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<http.Response> addPost(
      {required String content, String? base64Image}) async {
    try {
      final Map<String, String?> body = {
        'content': content,
        'base_64_image': base64Image,
      };
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      print("authTokenauthTokenauthToken $authToken");

      final response = await _client.post(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/post'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
        body: jsonEncode(body),
      );

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<http.Response> authMe() async {
    try {
      final response = await _client.get(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/auth/me'),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
