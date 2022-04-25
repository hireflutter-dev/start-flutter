import 'package:api_client/api_client.dart';
import 'package:get_it/get_it.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/data/repository/github_user_repo_impl.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/github_user_repo.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/usecase/get_users_usecase.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<APIManager>(APIManagerImpl());

  getIt.registerLazySingleton<GithubUserRepo>(() => GithubUserRepoImpl());
  getIt.registerLazySingleton(() => GetUsersUseCase(githubUserRepo: getIt()));
}
