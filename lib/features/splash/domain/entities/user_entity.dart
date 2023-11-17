import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _name;
  final String? _email;

  const UserEntity(
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

  @override
  List<Object?> get props => [_id, _createdAt, _name, _email];
}
