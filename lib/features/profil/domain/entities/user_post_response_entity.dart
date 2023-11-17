import 'package:equatable/equatable.dart';

import 'user_post_entity.dart';

class UserPostResponseEntity extends Equatable {
  final int? _itemsReceived;
  final int? _curPage;
  final int? _nextPage;
  final int? _prevPage;
  final int? _offset;
  final int? _itemsTotal;
  final int? _pageTotal;
  final List<UserPostEntity>? _items;

  const UserPostResponseEntity(
      {required int? itemsReceived,
      required int? curPage,
      required int? nextPage,
      required int? prevPage,
      required int? offset,
      required int? itemsTotal,
      required int? pageTotal,
      required List<UserPostEntity>? items})
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
  List<UserPostEntity>? get items => _items;

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
