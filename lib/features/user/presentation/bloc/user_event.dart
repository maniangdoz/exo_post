part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class GetAllUserPosts extends UserEvent {
  final int _userId;
  final int _page;
  final int _perPage;

  GetAllUserPosts({required int userId, required int page, required int perPage})
      : _userId = userId,
        _page = page,
        _perPage = perPage;

  int get userId => _userId;
  int get page => _page;
  int get perPage => _perPage;
  
  @override
  List<Object?> get props => [_userId, _page, _perPage];
}
