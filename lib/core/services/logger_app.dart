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
    logger.t("Url: ${data.url}");
    logger.t("Method: ${data.method}");
    logger.t("Body: ${data.body}");
    logger.t("Header: ${data.headers}");
  }

  @override
  void interceptResponse(ResponseData data) {
    logger.w("Body: ${data.body}");
    logger.w("Header: ${data.headers}");
    logger.w("Status Code: ${data.statusCode}");
  }
}
