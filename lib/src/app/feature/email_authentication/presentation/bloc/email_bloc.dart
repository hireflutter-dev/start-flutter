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
  AuthenticationBloc({this.userRepository}) : super(AuthInitial());

  final UserRepository? userRepository;
  final logger = Logger();
  StreamSubscription<AuthenticationDetail>? authStreamSub;

  @override
  Future<void> close() {
    authStreamSub?.cancel();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignInButtonPressed) {
      yield AuthLoading();
      try {
       
       final user=  await userRepository?.signIn(event.email, event.password);
         yield AuthSucceed(user: user);
        } catch (e) {
        yield AuthFailed(message: e.toString());
      }
    } else if (event is SignUpButtonPressed) {
      yield AuthLoading();
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
        yield AuthFailed(message: e.toString());
      }
    } else if (event is AuthenticationStarted) {
      try {
        yield AuthLoading();
        authStreamSub =
            userRepository!.getAuthDetailStream().listen((authDetail) {
          add(AuthenticationStateChanged(authenticationDetail: authDetail));
        });
      } catch (error) {
        logger.d(
            'Error occured while fetching authentication detail : ${error.toString()}');
        yield const AuthFailed(
            message: 'Error occrued while fetching auth detail');
      }
    } else if (event is AuthenticationStateChanged) {
      if (event.authenticationDetail.isValid!) {
        yield AuthSucceed(authenticationDetail: event.authenticationDetail);
      } else {
        yield const AuthFailed(message: 'User has logged out');
      }
    } else if (event is AuthenticationGoogleStarted) {
      try {
        yield AuthLoading();
        AuthenticationDetail authenticationDetail =
            await userRepository!.authenticateWithGoogle();

        if (authenticationDetail.isValid!) {
          yield AuthSucceed(authenticationDetail: authenticationDetail);
        } else {
          yield const AuthFailed(message: 'User detail not found.');
        }
      } catch (error) {
        logger.d('Error occured while login with Google ${error.toString()}');
        yield const AuthFailed(
          message: 'Unable to login with Google. Try again.',
        );
      }
    } else if (event is AuthenticationExited) {
      try {
        yield AuthLoading();
        await userRepository!.unAuthenticate();
      } catch (error) {
        logger.d('Error occured while logging out. : ${error.toString()}');
        yield const AuthFailed(message: 'Unable to logout. Please try again.');
      }
    } else if (event is VerificationMailSent) {
      try {
        await userRepository?.sendVerificationEmail();
        yield MailVerificationSent();
      } catch (e) {
        logger.d('Unable to send mail. Try again.');
        yield const AuthFailed(message: 'Unable to logout. Please try again.');
      }
    } else if (event is GetUser) {
      try {
        await userRepository!.getCurrentUser();
        yield CurrentUser();
      } catch (e) {
        logger.d(e);
        yield AuthFailed(message: e.toString());
      }
    }
  }
}
