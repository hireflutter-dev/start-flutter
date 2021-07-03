part of 'auth_bloc.dart';

@freezed
abstract class AuthState extends Equatable with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = InitialAuthState;

  const factory AuthState.loading() = LoadingAuthState;

  const factory AuthState.success() = SuccessAuthState;

  const factory AuthState.error() = ErrorAuthState;

  @override
  List<Object?> get props => [];
}
