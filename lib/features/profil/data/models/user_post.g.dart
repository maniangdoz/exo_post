// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPost _$UserPostFromJson(Map<String, dynamic> json) => UserPost(
      id: json['id'] as int?,
      createdAt: json['created_at'] as int?,
      content: json['content'] as String?,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      userId: json['userId'] as int?,
      commentsCount: json['comments_count'] as int?,
    );

Map<String, dynamic> _$UserPostToJson(UserPost instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'content': instance.content,
      'image': instance.image,
      'userId': instance.userId,
      'comments_count': instance.commentsCount,
    };
