// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubUser _$_$_GithubUserFromJson(Map<String, dynamic> json) {
  return _$_GithubUser(
    id: json['id'] as int?,
    login: json['login'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    orgUrl: json['organizations_url'] as String?,
  );
}

Map<String, dynamic> _$_$_GithubUserToJson(_$_GithubUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'organizations_url': instance.orgUrl,
    };