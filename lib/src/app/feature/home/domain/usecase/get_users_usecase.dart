import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/github_user_repo.dart';

class GetUsersUseCase {
  GetUsersUseCase({required GithubUserRepo githubUserRepo})
      : _githubUserRepo = githubUserRepo;

  final GithubUserRepo _githubUserRepo;

  Future<List<GithubUser>?> getUsers() => _githubUserRepo.getUsers();
}
