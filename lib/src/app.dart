import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/google_authenticaiton/bloc/authentication_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/google_authenticaiton/data/domain/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

import 'app/feature/authentication/presentation/viewmodel/auth_view_model.dart';
import 'app/feature/google_authenticaiton/data/domain/authentication_firebase_provider.dart';
import 'app/feature/google_authenticaiton/data/repositories/authenticaiton_repository.dart';
import 'app/router/router.gr.dart';
import 'config/theme_config.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(create:(context) => AuthenticationBloc(
        authenticationRepository: AuthenticationRepository(
          authenticationFirebaseProvider: AuthenticationFirebaseProvider(
            firebaseAuth: FirebaseAuth.instance,
          ),
          googleSignInProvider: GoogleSignInProvider(
            googleSignIn: GoogleSignIn(),
          ),
        ),
      ),
      child: ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(),
      child: MaterialApp.router(
        theme: ThemeConfig.lightTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    ));
  }
}
