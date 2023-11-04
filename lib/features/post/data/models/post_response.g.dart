// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      itemsReceived: json['itemsReceived'] as int?,
      curPage: json['curPage'] as int?,
      nextPage: json['nextPage'] as int?,
      prevPage: json['prevPage'] as int?,
      offset: json['offset'] as int?,
      itemsTotal: json['itemsTotal'] as int?,
      pageTotal: json['pageTotal'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
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
