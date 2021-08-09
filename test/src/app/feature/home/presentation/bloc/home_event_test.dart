import 'package:flutter_test/flutter_test.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/bloc/home_bloc.dart';

void main() {
  group('HomeEvent test', () {
    group('HomeEvent.started', () {
      test('supports value comparisons', () {
        expect(
          const HomeEvent.started(),
          const HomeEvent.started(),
        );
      });
    });
  });
}
