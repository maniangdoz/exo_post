import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _name;

  const AuthorEntity(
      {required int? id, required int? createdAt, required String? name})
      : _id = id,
        _createdAt = createdAt,
        _name = name;

  int? get id => _id;
  int? get createdAt => _createdAt;
  String? get name => _name;

  @override
  List<Object?> get props => [_id, _createdAt, _name];
}