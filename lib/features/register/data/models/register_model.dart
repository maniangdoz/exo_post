import 'package:equatable/equatable.dart';
import 'package:exo_post/features/register/domain/entities/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends Equatable {
  final String? _authToken;
  const RegisterModel({required String? authToken}) : _authToken = authToken;

  String? get authToken => _authToken;

  RegisterEntity toEntity() => RegisterEntity(authToken: _authToken);

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  @override
  List<Object?> get props => [_authToken];
}
