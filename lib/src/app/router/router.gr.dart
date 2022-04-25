// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import '../feature/email_authentication/presentation/register.dart' as _i8;
import '../feature/authentication/presentation/login_screen.dart' as _i4;
import '../feature/authentication/presentation/login_verify_screen.dart' as _i5;
import '../feature/email_authentication/presentation/login.dart'as _i7;
import '../feature/home/presentation/home_screen.dart' as _i6;
import '../feature/splash/splash_screen.dart' as _i3;
import '../feature/email_authentication/presentation/verify.dart' as _i9;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        
          child: const _i3.SplashScreen()),
    LoginScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        child: 
          const _i4.LoginScreen()
        ),
    LoginVerifyScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        child:const _i5.LoginVerifyScreen()),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen()
        ),
        EmailLogin.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData, child: const _i7.EmailLogin()),
        Signup.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData, child: const _i8. Signup()),
        VerifyScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData, child:const _i9. VerifyScreen()),
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreen.name, path: '/'),
        _i1.RouteConfig(LoginScreen.name, path: '/login'),
        _i1.RouteConfig(LoginVerifyScreen.name, path: '/loginviewscreen'),
        _i1.RouteConfig(HomeScreen.name, path: '/homescreen'),
        _i1.RouteConfig(EmailLogin.name, path: '/loginwithemail'),
        _i1.RouteConfig(Signup.name, path: '/signup'),
        _i1.RouteConfig(VerifyScreen.name, path: '/verifyscreen'),

      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.LoginVerifyScreen]
class LoginVerifyScreen extends _i5.PageRouteInfo<void> {
  const LoginVerifyScreen()
      : super(LoginVerifyScreen.name, path: '/loginviewscreen');

  static const String name = 'LoginVerifyScreen';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/homescreen');

  static const String name = 'HomeScreen';
}
class EmailLogin extends _i1.PageRouteInfo {
  const EmailLogin() : super(name, path: '/loginwithemail');

  static const String name = 'EmailLogin';
}
class Signup extends _i1.PageRouteInfo {
  const Signup() : super(name, path: '/signup');

  static const String name = 'signup';
}
class VerifyScreen extends _i1.PageRouteInfo {
  const VerifyScreen() : super(name, path: '/verifyscreen');

  static const String name = 'verifyscreen';
}
