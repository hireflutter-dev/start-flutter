import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';

abstract class GithubUserRepo {
  /// Get user from github
  Future<List<GithubUser>?> getUsers();
}
