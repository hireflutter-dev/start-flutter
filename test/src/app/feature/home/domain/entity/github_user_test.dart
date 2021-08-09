import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';

void main() {
  group('GithubUser test', () {
    test('() default constructor', () {
      final GithubUser githubUser = GithubUser();

      expect(githubUser, GithubUser());
    });

    test('() default constructor with default value', () {
      final GithubUser githubUser = GithubUser(
        id: 10,
        login: 'mojombo',
        avatar_url: 'https://avatars.githubusercontent.com/u/1?v=4',
        organizations_url: 'https://api.github.com/users/mojombo/orgs',
      );

      expect(githubUser.id, 10);
      expect(githubUser.login, 'mojombo');
      expect(githubUser.avatar_url,
          'https://avatars.githubusercontent.com/u/1?v=4');
      expect(githubUser.organizations_url,
          'https://api.github.com/users/mojombo/orgs');
    });

    test('== equality', () {
      final GithubUser githubUser = GithubUser(id: 10);

      expect(githubUser, GithubUser(id: 10));

      expect(
        GithubUser(id: 11),
        isNot(
          equals(
            GithubUser(id: 10),
          ),
        ),
      );
    });
  });
}
