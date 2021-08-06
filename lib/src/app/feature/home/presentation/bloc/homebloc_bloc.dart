import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/home_repo.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';
part 'homebloc_bloc.freezed.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(_Initial());

  final HomeRepository _homeRepository;

  @override
  Stream<HomeblocState> mapEventToState(
    HomeblocEvent event,
  ) async* {
    yield* event.when(started: () async* {
      yield HomeblocState.loading();

      try {
        final githubUser = await _homeRepository.getUser();

        if (githubUser == null) {
          throw Exception('Something went wrong');
        }

        yield HomeblocState.success(githubUser);
      } catch (e) {
        yield HomeblocState.failure(e.toString());
      }
    });
  }
}
