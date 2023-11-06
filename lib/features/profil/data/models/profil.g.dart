// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profil _$ProfilFromJson(Map<String, dynamic> json) => Profil(
      id: json['id'] as int?,
      createdAt: json['created_at'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfilToJson(Profil instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'name': instance.name,
      'email': instance.email,
    };
