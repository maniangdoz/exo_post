part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginFinished extends AuthState {
  final Status? status;
  final String? message;

  const LoginFinished({this.status, this.message});

  @override
  List<Object?> get props => [status, message];
}
