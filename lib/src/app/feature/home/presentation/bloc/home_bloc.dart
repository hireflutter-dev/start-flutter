import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/usecase/get_users_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase,
        super(const _Initial()) {
    add(const HomeEvent.started());
  }

  final GetUsersUseCase _getUsersUseCase;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.when(started: () async* {
      yield const HomeState.loading();

      try {
        final githubUsers = await _getUsersUseCase.getUsers();

        if (githubUsers == null) {
          throw Exception('Something went wrong');
        }

        yield HomeState.success(githubUsers);
      } catch (e) {
        yield HomeState.failure(e.toString());
      }
    });
  }
}
