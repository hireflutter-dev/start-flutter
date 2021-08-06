import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user.freezed.dart';
part 'github_user.g.dart';

@freezed
class GithubUser with _$GithubUser {
  factory GithubUser({
    int? id,
    String? login,
    String? avatarUrl,
    String? orgUrl,
  }) = _GithubUser;

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
