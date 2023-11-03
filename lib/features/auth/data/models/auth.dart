import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/auth_entity.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth extends Equatable {
  final String? _authToken;

  const Auth({String? authToken}) : _authToken = authToken;

  String? get authToken => _authToken;

  AuthEntity toEntity() => AuthEntity(authToken: _authToken);

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  List<Object?> get props => [_authToken];
}
