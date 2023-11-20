import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';
import '../../domain/entities/auth_entity.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth extends Equatable {
  final String? _authToken;
  final User? _user;

  const Auth({String? authToken, User? user})
      : _authToken = authToken,
        _user = user;

  String? get authToken => _authToken;
  User? get user => _user;

  AuthEntity toEntity() => AuthEntity(
      authToken: _authToken, user: _user != null ? _user!.toEntity() : null);

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  List<Object?> get props => [_authToken, _user];
}
