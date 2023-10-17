import 'package:injectable/injectable.dart';

@injectable
class AppLogic {
  Future<void> bootstrap({required String env}) async {
    if (env == 'dev') {
      _devInit();
    } else if (env == 'prod') {
      _prodInit();
    }
  }

  void _devInit() {
  }

  void _prodInit() {
  }
}
