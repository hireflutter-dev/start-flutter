import 'package:auto_route/auto_route.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/login_screen.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/login_verify_screen.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/home_screen.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/splash/splash_screen.dart';

import '../feature/email_authentication/presentation/login.dart';
import '../feature/email_authentication/presentation/register.dart';
import '../feature/email_authentication/presentation/verify.dart';


/// Navigator 2.0 for our app
@MaterialAutoRouter(
  replaceInRouteName: 'Screen, Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      name: 'splashScreen',
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: LoginScreen,
      name: 'loginScreen',
      path: '/login',
    ),
    AutoRoute(
      page: LoginVerifyScreen,
      name: 'loginVerifyScreen',
      path: '/loginviewscreen',
    ),
    AutoRoute(
      page: HomeScreen,
      name: 'homeScreen',
      path: '/homescreen',
    ),
     AutoRoute(
      page: EmailLogin,
      name: 'loginwithemail',
      path: '/loginwithemail',
    ),
    AutoRoute(
      page: Signup,
      name: 'Signup',
      path: '/Signup',
    ),
     AutoRoute(
      page: VerifyScreen,
      name: 'VerifyScreen',
      path: '/VerifyScreen',
    ),
  ],
)
class $AppRouter {}
