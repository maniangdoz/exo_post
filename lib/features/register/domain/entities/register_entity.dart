import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? _authToken;

  const RegisterEntity({required String? authToken}) : _authToken = authToken;

  String? get authToken => _authToken;

  @override
  List<Object?> get props => [_authToken];
}
