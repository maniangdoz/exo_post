// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      path: json['path'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      size: json['size'] as int?,
      mime: json['mime'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'name': instance.name,
      'type': instance.type,
      'size': instance.size,
      'mime': instance.mime,
      'url': instance.url,
    };
