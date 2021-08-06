part of 'homebloc_bloc.dart';

@freezed
class HomeblocState with _$HomeblocState {
  const factory HomeblocState.initial() = _Initial;

  const factory HomeblocState.loading() = _Loading;

  const factory HomeblocState.success(List<GithubUser> githubUser) = _Success;

  const factory HomeblocState.failure(String errorMessage) = _Failure;
}
