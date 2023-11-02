import 'package:equatable/equatable.dart';
import 'package:exo_post/features/auth/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth.g.dart';

@JsonSerializable()
class Auth extends Equatable {
  final String? authToken;

  const Auth({this.authToken});

  AuthEntity toEntity() => AuthEntity(authToken: authToken);

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  List<Object?> get props => [authToken];
}
