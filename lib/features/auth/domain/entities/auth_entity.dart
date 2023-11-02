import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? _authToken;

  const AuthEntity({required String? authToken}) : _authToken = authToken;

  String? get authToken => _authToken;

  @override
  List<Object?> get props => [_authToken];
}
