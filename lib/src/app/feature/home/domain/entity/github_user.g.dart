// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubUser _$_$_GithubUserFromJson(Map<String, dynamic> json) {
  return _$_GithubUser(
    id: json['id'] as int?,
    login: json['login'] as String?,
    avatar_url: json['avatar_url'] as String?,
    organizations_url: json['organizations_url'] as String?,
  );
}

Map<String, dynamic> _$_$_GithubUserToJson(_$_GithubUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatar_url,
      'organizations_url': instance.organizations_url,
    };
