import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/data/repository/home_repo_impl.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepositoryImpl extends Mock implements HomeRepositoryImpl {}

void main() {
  final List<GithubUser> githubUsers = [
    GithubUser(
      id: 10,
      login: 'mojombo',
      avatar_url: 'https://avatars.githubusercontent.com/u/1?v=4',
      organizations_url: 'https://api.github.com/users/mojombo/orgs',
    )
  ];
  final MockHomeRepositoryImpl mockHomeRepositoryImpl =
      MockHomeRepositoryImpl();

  group('home bloc test', () {
    blocTest(
      'emits [HomeState.loading(), HomeState.success()] if user tries to get the list of github users',
      build: () {
        when(() => mockHomeRepositoryImpl.getUser()).thenAnswer(
          (_) => Future.value(githubUsers),
        );
        return HomeBloc(homeRepository: mockHomeRepositoryImpl);
      },
      expect: () => [
        const HomeState.loading(),
        HomeState.success(githubUsers),
      ],
    );

    blocTest(
      'emits [HomeState.loading(), HomeState.failure()] if Exception occurs while user tries to get the list of github users',
      build: () {
        when(() => mockHomeRepositoryImpl.getUser())
            .thenThrow('Something went wrong');
        return HomeBloc(homeRepository: mockHomeRepositoryImpl);
      },
      expect: () => [
        const HomeState.loading(),
        const HomeState.failure('Something went wrong'),
      ],
    );
  });
}
