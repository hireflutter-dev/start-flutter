import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/github_user_repo.dart';
import 'package:hf_flutter_starter_kit/src/injection/setup_locator.dart';

class GithubUserRepoImpl extends GithubUserRepo {
  @override
  Future<List<GithubUser>?> getUsers() async {
    return getIt<APIManager>().get('users').then((value) => jsonDecode(value)
        .map<GithubUser>((e) => GithubUser.fromJson(e))
        .toList());
  }
}
