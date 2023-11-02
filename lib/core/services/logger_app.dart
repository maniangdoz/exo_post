import 'package:logger/logger.dart' as l;
import 'package:pretty_http_logger/pretty_http_logger.dart';

class LoggerApp extends MiddlewareContract {
  final logger = l.Logger(
    printer: l.PrettyPrinter(
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
    ),
  );

  @override
  void interceptError(error) {
    logger.e("Error: $error");
  }

  @override
  void interceptRequest(RequestData data) {
    logger.t("Url request: ${data.url}");
    logger.t("Method request: ${data.method}");
    logger.t("Body request: ${data.body}");
    logger.t("Header request: ${data.headers}");
  }

  @override
  void interceptResponse(ResponseData data) {
    logger.i("Body response: ${data.body}");
    logger.i("Header response: ${data.headers}");
    logger.i("Status Code response: ${data.statusCode}");
  }
}
