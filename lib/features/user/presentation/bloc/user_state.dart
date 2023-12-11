part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class GetAllPostState extends UserState {
  final Status? _status;
  final UserPostResponseEntity? _userPostResponseEntity;
  final String? _message;

  GetAllPostState(
      {Status? status,
      UserPostResponseEntity? userPostResponseEntity,
      String? message})
      : _status = status,
        _userPostResponseEntity = userPostResponseEntity,
        _message = message;

  Status? get status => _status;
  UserPostResponseEntity? get userPostResponseEntity => _userPostResponseEntity;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _userPostResponseEntity, _message];
}
