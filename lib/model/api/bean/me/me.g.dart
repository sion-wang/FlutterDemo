// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Me _$MeFromJson(Map<String, dynamic> json) {
  return Me(
    login: json['login'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    createdAt: json['createdAt'] as String,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$MeToJson(Me instance) => <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'avatarUrl': instance.avatarUrl,
    };
