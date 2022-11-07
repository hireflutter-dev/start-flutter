import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/email_authentication/data/repositories/user_repositories.dart';
import 'package:logger/logger.dart';
import '../../models/authentication_detail.dart';
part 'email_event.dart';
part 'email_state.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationBloc({this.userRepository}) : super(AuthInitial()) {
    on<SignInButtonPressed>(_signInButtonPressed);
    on<SignUpButtonPressed>(_signUpButtonPressed);
    on<AuthenticationStarted>(_authenticationStarted);
    on<AuthenticationStateChanged>(_authenticationStateChanges);
    on<AuthenticationGoogleStarted>(_authenticationGoogleStarted);
    on<AuthenticationExited>(_authenticationExited);
    on<VerificationMailSent>(_verificationMailSent);
    on<GetUser>(_getUser);
  }

  final UserRepository? userRepository;
  final logger = Logger();
  StreamSubscription<AuthenticationDetail>? authStreamSub;

  @override
  Future<void> close() {
    authStreamSub?.cancel();
    return super.close();
  }

  FutureOr<void> _signInButtonPressed(
      SignInButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await userRepository?.signIn(event.email, event.password);
      emit(AuthSucceed(user: user));
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }

  FutureOr<void> _signUpButtonPressed(
      SignUpButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      add(VerificationMailSent());
      await userRepository?.signUp(event.email, event.password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          logger.w("Account Already exists");
        } else if (e.code == 'weak-password') {
          logger.w("Password Provided is too Weak");
        }
      }
      emit(AuthFailed(message: e.toString()));
    }
  }

  FutureOr<void> _authenticationStarted(
      AuthenticationStarted event, Emitter<AuthState> emit) {
    try {
      emit(AuthLoading());
      authStreamSub =
          userRepository!.getAuthDetailStream().listen((authDetail) {
        add(AuthenticationStateChanged(authenticationDetail: authDetail));
      });
    } catch (error) {
      logger.d(
          'Error occured while fetching authentication detail : ${error.toString()}');
      emit(const AuthFailed(
          message: 'Error occrued while fetching auth detail'));
    }
  }

  FutureOr<void> _authenticationStateChanges(
      AuthenticationStateChanged event, Emitter<AuthState> emit) {
    if (event.authenticationDetail.isValid!) {
      emit(AuthSucceed(authenticationDetail: event.authenticationDetail));
    } else {
      emit(const AuthFailed(message: 'User has logged out'));
    }
  }

  FutureOr<void> _authenticationGoogleStarted(
      AuthenticationGoogleStarted event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      AuthenticationDetail authenticationDetail =
          await userRepository!.authenticateWithGoogle();

      if (authenticationDetail.isValid!) {
        emit(AuthSucceed(authenticationDetail: authenticationDetail));
      } else {
        emit(const AuthFailed(message: 'User detail not found.'));
      }
    } catch (error) {
      logger.d('Error occured while login with Google ${error.toString()}');
      emit(const AuthFailed(
        message: 'Unable to login with Google. Try again.',
      ));
    }
  }

  FutureOr<void> _authenticationExited(
      AuthenticationExited event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await userRepository!.unAuthenticate();
    } catch (error) {
      logger.d('Error occured while logging out. : ${error.toString()}');
      emit(const AuthFailed(message: 'Unable to logout. Please try again.'));
    }
  }

  FutureOr<void> _verificationMailSent(
      VerificationMailSent event, Emitter<AuthState> emit) async {
    try {
      await userRepository?.sendVerificationEmail();
      emit(MailVerificationSent());
    } catch (e) {
      logger.d('Unable to send mail. Try again.');
      emit(const AuthFailed(message: 'Unable to logout. Please try again.'));
    }
  }

  FutureOr<void> _getUser(GetUser event, Emitter<AuthState> emit) async {
    try {
      await userRepository!.getCurrentUser();
      emit(CurrentUser());
    } catch (e) {
      logger.d(e);
      emit(AuthFailed(message: e.toString()));
    }
  }
}
