part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class Login extends AuthEvent {
  final String? email;
  final String? password;

  const Login({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
