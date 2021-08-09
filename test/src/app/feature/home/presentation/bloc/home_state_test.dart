import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/bloc/home_bloc.dart';

void main() {
  group('HomeState test', () {
    group('HomeState.initial', () {
      test('supports value comparisons', () {
        expect(
          const HomeState.initial(),
          const HomeState.initial(),
        );
      });
    });

    group('HomeState.loading', () {
      test('supports value comparisons', () {
        expect(
          const HomeState.loading(),
          const HomeState.loading(),
        );
      });
    });

    group('HomeState.success', () {
      test('supports value comparisons with empty list', () {
        expect(
          const HomeState.success([]),
          const HomeState.success([]),
        );
      });

      test('supports value comparisons', () {
        expect(
          HomeState.success([GithubUser()]),
          HomeState.success([GithubUser()]),
        );
      });

      test('supports value comparisons with different values', () {
        expect(
          const HomeState.success([]),
          isNot(HomeState.success([GithubUser()])),
        );
      });
    });
  });
}
