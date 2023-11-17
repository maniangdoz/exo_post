// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorApiResponse _$ErrorApiResponseFromJson(Map<String, dynamic> json) =>
    ErrorApiResponse(
      code: json['code'] as String?,
      message: json['message'] as String,
      payload: json['payload'],
    );

Map<String, dynamic> _$ErrorApiResponseToJson(ErrorApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'payload': instance.payload,
    };
