import 'package:equatable/equatable.dart';

class UserPostRequest extends Equatable {
  final int? _userId;
  final int? _page;
  final int? _perPage;

  const UserPostRequest({int? userId, int? page, int? perPage})
      : _userId = userId,
        _page = page,
        _perPage = perPage;

  int? get userId => _userId;
  int? get page => _page;
  int? get perPage => _perPage;

  Map<String, dynamic> toJson() =>
      {'user_id': _userId, 'page': _page, 'per_page': _perPage};

  @override
  List<Object?> get props => [_userId, _page, _perPage];
}
