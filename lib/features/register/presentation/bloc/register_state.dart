part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class SignupFinished extends RegisterState {
  final Status? _status;
  final String? _message;

  const SignupFinished({Status? status, String? message})
      : _status = status,
        _message = message;

  Status? get status => _status;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _message];
}
