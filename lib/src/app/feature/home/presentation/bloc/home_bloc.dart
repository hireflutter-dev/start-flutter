import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    add(const HomeEvent.started());
  }

  final HomeRepository _homeRepository;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.when(started: () async* {
      yield const HomeState.loading();

      try {
        final githubUser = await _homeRepository.getUser();

        if (githubUser == null) {
          throw Exception('Something went wrong');
        }

        yield HomeState.success(githubUser);
      } catch (e) {
        yield HomeState.failure(e.toString());
      }
    });
  }
}
