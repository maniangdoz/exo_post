part of 'shared_bloc.dart';

sealed class SharedEvent extends Equatable {
  const SharedEvent();
}

class GetInfoUser extends SharedEvent {
  final int _userId;

  const GetInfoUser({required int userId}) : _userId = userId;
  int get userId => _userId;

  @override
  List<Object?> get props => [_userId];
}
