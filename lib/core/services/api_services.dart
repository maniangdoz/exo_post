import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@injectable
class ApiServices {
  final http.Client client;

  ApiServices({required this.client});
}
