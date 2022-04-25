part of 'email_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SignInButtonPressed extends AuthEvent {
  String email, password;
  SignInButtonPressed({required this.email, required this.password});
}

// ignore: must_be_immutable
class SignUpButtonPressed extends AuthEvent {
  String email, password;
  SignUpButtonPressed({required this.email, required this.password});
}

class AuthenticationStarted extends AuthEvent {}

class AuthenticationStateChanged extends AuthEvent {
  final AuthenticationDetail authenticationDetail;
  const AuthenticationStateChanged({
    required this.authenticationDetail,
  });
  @override
  List<Object> get props => [authenticationDetail];
}

class AuthenticationGoogleStarted extends AuthEvent {}

class AuthenticationExited extends AuthEvent {}

class VerificationMailSent extends AuthEvent {}

class GetUser extends AuthEvent {}
