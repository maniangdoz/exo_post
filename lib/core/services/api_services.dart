import 'dart:io';

import 'package:injectable/injectable.dart';

@injectable
class ApiServices {
  final HttpClient client;

  ApiServices({required this.client});
}
