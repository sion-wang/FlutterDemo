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
    followers: Followers.fromJson(json['followers'] as Map<String, dynamic>),
    following: Following.fromJson(json['following'] as Map<String, dynamic>),
    starredRepos: StarredRepo.fromJson(
        json['starredRepositories'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MeToJson(Me instance) => <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'avatarUrl': instance.avatarUrl,
      'followers': instance.followers,
      'following': instance.following,
      'starredRepositories': instance.starredRepos,
    };
