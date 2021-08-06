import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user.freezed.dart';
part 'github_user.g.dart';

@freezed
class GithubUser with _$GithubUser {
  factory GithubUser({
    int? id,
    String? login,
    String? avatar_url,
    String? organizations_url,
  }) = _GithubUser;

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
