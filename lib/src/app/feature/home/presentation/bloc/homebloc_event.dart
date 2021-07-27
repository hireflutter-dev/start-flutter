part of 'homebloc_bloc.dart';

@freezed
class HomeblocEvent with _$HomeblocEvent {
  const factory HomeblocEvent.started() = _Started;
}