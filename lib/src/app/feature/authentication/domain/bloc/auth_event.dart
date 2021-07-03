part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent extends Equatable with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.continueWithEmail() = _ContinueWithEmail;

  const factory AuthEvent.continueWithOTP() = _ContinueWithOTP;

  @override
  List<Object?> get props => [];
}
