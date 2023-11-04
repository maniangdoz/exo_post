import 'package:equatable/equatable.dart';
import 'package:exo_post/features/post/domain/entities/post_entity.dart';
import 'package:exo_post/features/post/domain/entities/post_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'post.dart';
part 'post_response.g.dart';

@JsonSerializable()
class PostResponse extends Equatable {
  final int? _itemsReceived;
  final int? _curPage;
  final int? _nextPage;
  final int? _prevPage;
  final int? _offset;
  final int? _itemsTotal;
  final int? _pageTotal;
  final List<Post>? _items;

  const PostResponse(
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

  PostResponseEntity toEntity() {
    List<PostEntity> items = [];
    if (_items != null) {
      for (var element in _items!) {
        items.add(element.toEntity());
      }
    }
    return PostResponseEntity(
        itemsReceived: itemsReceived,
        curPage: _curPage,
        nextPage: _nextPage,
        prevPage: _prevPage,
        offset: _offset,
        itemsTotal: _itemsTotal,
        pageTotal: _pageTotal,
        items: items);
  }

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

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
