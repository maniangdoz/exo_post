import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? authToken;

  const AuthEntity({this.authToken});

  @override
  List<Object?> get props => [authToken];
}
