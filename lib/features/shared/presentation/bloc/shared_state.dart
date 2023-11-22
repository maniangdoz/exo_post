part of 'shared_bloc.dart';

sealed class SharedState extends Equatable {
  const SharedState();
}

final class SharedInitial extends SharedState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class GetUserFinished extends SharedState {
  final Status? _status;
  final AuthorEntity? _authorResponseEntity;
  final String? _message;

  const GetUserFinished(
      {Status? status, AuthorEntity? authorResponseEntity, String? message})
      : _status = status,
        _authorResponseEntity = authorResponseEntity,
        _message = message;

  Status? get status => _status;
  AuthorEntity? get authorResponseEntity => _authorResponseEntity;
  String? get message => _message;

  @override
  List<Object?> get props => [_status, _authorResponseEntity, _message];
}
