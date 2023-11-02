part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class Signup extends RegisterEvent {
  final String _name;
  final String _email;
  final String _password;

  const Signup(
      {required String name, required String email, required String password})
      : _name = name,
        _email = email,
        _password = password;

  String get name => _name;
  String get email => _email;
  String get password => _password;

  @override
  List<Object?> get props => [_name, _email, _password];
}
