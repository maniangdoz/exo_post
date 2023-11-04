import 'package:equatable/equatable.dart';

class PostRequest extends Equatable {
  final int? _page;
  final int? _perPage;

  const PostRequest({int? page, int? perPage})
      : _page = page,
        _perPage = perPage;

  int? get page => _page;
  int? get perPage => _perPage;

  Map<String, dynamic> toJson() => {'page': _page, 'per_page': _perPage};

  @override
  List<Object?> get props => [_page, _perPage];
}
