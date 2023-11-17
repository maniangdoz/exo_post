// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_add.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAdd _$PostAddFromJson(Map<String, dynamic> json) => PostAdd(
      id: json['id'] as int?,
      createdAt: json['created_at'] as int?,
      content: json['content'] as String?,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostAddToJson(PostAdd instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'content': instance.content,
      'image': instance.image,
      'author': instance.author,
    };
