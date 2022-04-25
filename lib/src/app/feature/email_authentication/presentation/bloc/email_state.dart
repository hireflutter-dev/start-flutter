part of 'email_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

// ignore: must_be_immutable
class AuthSucceed extends AuthState {
  User? user;
  final AuthenticationDetail? authenticationDetail;
  AuthSucceed({this.authenticationDetail, this.user});
}

// ignore: must_be_immutable
class AuthFailed extends AuthState {
  final String message;
  const AuthFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class MailVerificationSent extends AuthState {}

class CurrentUser extends AuthState {}
