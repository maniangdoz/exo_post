import '../entities/splash_response_entity.dart';

abstract class SplashRepo {
  Future<SplashResponseEntity> getUserLogin();
}
