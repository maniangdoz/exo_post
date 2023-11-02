part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class Login extends AuthEvent {
  final String? _email;
  final String? _password;

  const Login({required String? email, required String? password})
      : _email = email,
        _password = password;

  String? get email => _email;
  String? get password => _password;

  @override
  List<Object?> get props => [_email, _password];
}
