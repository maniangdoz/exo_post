// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostResponse _$UserPostResponseFromJson(Map<String, dynamic> json) =>
    UserPostResponse(
      itemsReceived: json['itemsReceived'] as int?,
      curPage: json['curPage'] as int?,
      nextPage: json['nextPage'] as int?,
      prevPage: json['prevPage'] as int?,
      offset: json['offset'] as int?,
      itemsTotal: json['itemsTotal'] as int?,
      pageTotal: json['pageTotal'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => UserPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserPostResponseToJson(UserPostResponse instance) =>
    <String, dynamic>{
      'itemsReceived': instance.itemsReceived,
      'curPage': instance.curPage,
      'nextPage': instance.nextPage,
      'prevPage': instance.prevPage,
      'offset': instance.offset,
      'itemsTotal': instance.itemsTotal,
      'pageTotal': instance.pageTotal,
      'items': instance.items,
    };
