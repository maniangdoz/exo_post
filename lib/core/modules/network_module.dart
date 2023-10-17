import 'dart:io';

import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  HttpClient get client => HttpClient();
}