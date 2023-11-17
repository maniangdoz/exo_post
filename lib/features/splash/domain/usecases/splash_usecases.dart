import 'package:injectable/injectable.dart';

import '../entities/splash_response_entity.dart';
import '../repository/splash_repo.dart';

@injectable
class SplashUseCases {
  final SplashRepo _repo;

  SplashUseCases({required SplashRepo repo}) : _repo = repo;
  
  Future<SplashResponseEntity> getUserLogin() => _repo.getUserLogin();
}
