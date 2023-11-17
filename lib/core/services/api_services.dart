import 'dart:convert';
import 'dart:typed_data';

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

  Future<http.Response> authMe() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      final response = await _client.get(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/auth/me'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
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

  Future<http.Response> updatePost(
      {required int postId,
      required String type,
      required String content,
      String? base64Image}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      var request = http.MultipartRequest(
        'PATCH',
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/post/$postId'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $authToken',
      });

      request.fields['content'] = content;

      if (type == 'url' && base64Image != null) {
        fetchImageBytes(base64Image).then((imageBytes) {
          var image = http.MultipartFile.fromBytes(
            'base_64_image',
            imageBytes,
            filename: 'image.jpg',
          );

          request.files.add(image);
        }).catchError((error) {
          print('Error fetching image: $error');
        });
      } else {
        if (base64Image != null) {
          List<int> imageBytes = base64Decode(base64Image);
          var image = http.MultipartFile.fromBytes(
            'base_64_image',
            imageBytes,
            filename: 'image.jpg',
          );
          request.files.add(image);
        }
      }

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Uint8List> fetchImageBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch image');
    }
  }

  Future<http.Response> removePost({required int postId}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      final response = await _client.delete(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/post/$postId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
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

  Future<http.Response> addComment(
      {required int postId, required String content}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      final response = await _client.post(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/comment'),
        body: jsonEncode({
          'post_id': postId,
          'content': content,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<http.Response> updateComment(
      {required int commentId, required String content}) async {
    try {
      final response = await _client.patch(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/comment/$commentId'),
        body: jsonEncode({
          'content': content,
        }),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<http.Response> removeComment({required int commentId}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? authToken = prefs.getString(AppUtils.authTokenKey);
      final response = await _client.delete(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/comment/$commentId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<http.Response> infoUser({required int userId}) async {
    try {
      final response = await _client.get(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/user/$userId'),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<http.Response> userPosts({required int userId}) async {
    try {
      final response = await _client.get(
        Uri.https(AppConstants.baseUrlDev, '/api:xbcc5VEi/user/$userId/posts'),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
