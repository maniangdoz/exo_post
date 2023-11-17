import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/error_api_entity.dart';

part 'error_api_response.g.dart';

@JsonSerializable()
class ErrorApiResponse extends Equatable {
  final String? _code;
  final String _message;
  final dynamic _payload;

  String? get code => _code;
  String get message => _message;
  dynamic get payload => _payload;

  const ErrorApiResponse(
      {required String? code,
      required String message,
      required dynamic payload})
      : _code = code,
        _message = message,
        _payload = payload;

  factory ErrorApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorApiResponseToJson(this);

  ErrorApiEntity toEntity() =>
      ErrorApiEntity(code: _code, message: _message, payload: _payload);

  @override
  List<Object?> get props => [_code, _message, _payload];
}
