import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class SplashResponseEntity extends Equatable {
  final UserEntity? _userEntity;

  final String? _errorMessage;

  UserEntity? get userEntity => _userEntity;
  String? get errorMessage => _errorMessage;

  const SplashResponseEntity({UserEntity? userEntity, String? errorMessage})
      : _userEntity = userEntity,
        _errorMessage = errorMessage;

  @override
  List<Object?> get props => [_userEntity, _errorMessage];
}
