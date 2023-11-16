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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      var request = http.MultipartRequest(
        'POST',
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/post'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $authToken',
      });

      request.fields['content'] = content;

      if (base64Image != null) {
        List<int> imageBytes = base64Decode(base64Image);
        var image = http.MultipartFile.fromBytes(
          'base_64_image',
          imageBytes,
          filename: 'image.jpg',
        );
        request.files.add(image);
      }

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

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
