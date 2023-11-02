import 'package:injectable/injectable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart' as l;

import '../services/logger_app.dart';

//here we create one and one instance httpclient for app
@module
abstract class NetworkModule {
  @factoryMethod
  l.HttpWithMiddleware get client => l.HttpWithMiddleware.build(middlewares: [
        LoggerApp(),
      ]);
}
