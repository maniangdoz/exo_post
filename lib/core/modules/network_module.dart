import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

//here we create one and one instance httpclient for app
@module
abstract class NetworkModule {
  http.Client get client => http.Client();
}