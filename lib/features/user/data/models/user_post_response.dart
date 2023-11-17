import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'post.dart';

part 'user_post_response.g.dart';

@JsonSerializable()
class UserPostResponse extends Equatable {
  final int? _itemsReceived;
  final int? _curPage;
  final int? _nextPage;
  final int? _prevPage;
  final int? _offset;
  final int? _itemsTotal;
  final int? _pageTotal;
  final List<Post>? _items;

  const UserPostResponse(
      {required int? itemsReceived,
      required int? curPage,
      required int? nextPage,
      required int? prevPage,
      required int? offset,
      required int? itemsTotal,
      required int? pageTotal,
      required List<Post>? items})
      : _itemsReceived = itemsReceived,
        _curPage = curPage,
        _nextPage = nextPage,
        _prevPage = prevPage,
        _offset = offset,
        _itemsTotal = itemsTotal,
        _pageTotal = pageTotal,
        _items = items;

  int? get itemsReceived => _itemsReceived;
  int? get curPage => _curPage;
  int? get nextPage => _nextPage;
  int? get prevPage => _prevPage;
  int? get offset => _offset;
  int? get itemsTotal => _itemsTotal;
  int? get pageTotal => _pageTotal;
  List<Post>? get items => _items;

  factory UserPostResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserPostResponseToJson(this);

  @override
  List<Object?> get props => [
        _items,
        _itemsReceived,
        _itemsTotal,
        _curPage,
        _nextPage,
        _prevPage,
        _offset,
      ];
}
