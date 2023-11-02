import 'dart:convert';
import 'dart:developer';

import 'package:exo_post/common/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@injectable
class ApiServices {
  final http.Client _client;

  ApiServices({required http.Client client}) : _client = client;

  Future<http.Response> login(
      {required String email, required String password}) async {
    try {
      final response = await _client.post(
        Uri.https(AppConstants.baseUrlDev, '/api/auth/login'),
        body: jsonEncode({'email': email, 'password': password}),
      );

      return response;
    } catch (e) {
      log(e.toString());
      throw 'Error occured';
    }
  }
}
