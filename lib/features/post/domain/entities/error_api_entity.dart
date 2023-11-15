import 'package:equatable/equatable.dart';

class ErrorApiEntity extends Equatable {
  final String? _code;
  final String _message;
  final dynamic _payload;

  String? get code => _code;
  String get message => _message;
  dynamic get payload => _payload;

  const ErrorApiEntity(
      {required String? code,
      required String message,
      required dynamic payload})
      : _code = code,
        _message = message,
        _payload = payload;

  @override
  List<Object?> get props => [_code, _message, _payload];
}
