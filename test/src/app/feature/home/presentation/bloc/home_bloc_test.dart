import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/github_user_repo.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/usecase/get_users_usecase.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubUserRepo extends Mock implements GithubUserRepo {}

void main() {
  final List<GithubUser> githubUsers = [
    GithubUser(
      id: 10,
      login: 'mojombo',
      avatar_url: 'https://avatars.githubusercontent.com/u/1?v=4',
      organizations_url: 'https://api.github.com/users/mojombo/orgs',
    )
  ];
  final mockGithubUserRepo = MockGithubUserRepo();
  final getUsersUseCase = GetUsersUseCase(githubUserRepo: mockGithubUserRepo);

  group('home bloc test', () {
    blocTest(
      'emits [HomeState.loading(), HomeState.success()] if user tries to get the list of github users',
      build: () {
        when(() => mockGithubUserRepo.getUsers()).thenAnswer(
          (_) => Future.value(githubUsers),
        );
        return HomeBloc(getUsersUseCase: getUsersUseCase);
      },
      expect: () => [
        const HomeState.loading(),
        HomeState.success(githubUsers),
      ],
    );

    blocTest(
      'emits [HomeState.loading(), HomeState.failure()] if Exception occurs while user tries to get the list of github users',
      build: () {
        when(() => mockGithubUserRepo.getUsers())
            .thenThrow('Something went wrong');
        return HomeBloc(getUsersUseCase: getUsersUseCase);
      },
      expect: () => [
        const HomeState.loading(),
        const HomeState.failure('Something went wrong'),
      ],
    );
  });
}
