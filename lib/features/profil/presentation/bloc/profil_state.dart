part of 'profil_bloc.dart';

sealed class ProfilState extends Equatable {
  const ProfilState();
}

final class ProfilInitial extends ProfilState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllUserPostsFinished extends ProfilState {
  final Status? _status;
  final UserPostResponseEntity? _userPostResponseEntity;
  final String? _message;

  const GetAllUserPostsFinished(
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
