import 'dart:io';

import 'package:injectable/injectable.dart';

//here we create one and one instance httpclient for app
@module
abstract class NetworkModule {
  HttpClient get client => HttpClient();
}