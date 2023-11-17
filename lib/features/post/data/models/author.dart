import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/author_entity.dart';

part 'author.g.dart';

@JsonSerializable()
class Author extends Equatable {
  final int? _id;
  final int? _createdAt;
  final String? _name;

  const Author(
      {required int? id, required int? createdAt, required String? name})
      : _id = id,
        _createdAt = createdAt,
        _name = name;

  int? get id => _id;

  @JsonKey(name: 'created_at')
  int? get createdAt => _createdAt;
  String? get name => _name;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  AuthorEntity toEntity() =>
      AuthorEntity(id: _id, createdAt: _createdAt, name: _name);

  @override
  List<Object?> get props => [_id, _createdAt, _name];
}
