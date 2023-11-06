import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../post/data/models/author.dart';
import 'post.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final Author? _author;
  final List<Post>? _items;

  Author? get author => _author;
  List<Post>? get items => _items;

  const User({required Author? author, required List<Post>? items})
      : _author = author,
        _items = items;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [_author, _items];
}
