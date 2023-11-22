import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _name;
  final String? _email;

  const User(
      {required int? id,
      required int? createdAt,
      required String? name,
      required String? email})
      : _id = id,
        _createdAt = createdAt,
        _name = name,
        _email = email;

  int? get id => _id;

  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get name => _name;
  String? get email => _email;

  UserEntity toEntity() =>
      UserEntity(id: _id, name: _name, createdAt: _createdAt, email: _email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [_id, _createdAt, _name, _email];
}
