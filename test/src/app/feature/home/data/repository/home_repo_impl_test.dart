import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/data/repository/github_user_repo_impl.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepositoryImpl extends Mock implements GithubUserRepoImpl {}

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

  group('home repo impl test', () {
    test('Return github users while calling getUser method', () async {
      when(() => mockHomeRepositoryImpl.getUsers()).thenAnswer(
        (_) => Future.value(githubUsers),
      );

      final fetchGithubUsers = await mockHomeRepositoryImpl.getUsers();

      expect(fetchGithubUsers, githubUsers);
    });
  });
}
