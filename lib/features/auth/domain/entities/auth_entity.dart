import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class AuthEntity extends Equatable {
  final String? _authToken;
  final UserEntity? _user;

  const AuthEntity({required String? authToken, required UserEntity? user})
      : _authToken = authToken,
        _user = user;

  String? get authToken => _authToken;
  UserEntity? get user => _user;

  @override
  List<Object?> get props => [_authToken, _user];
}
