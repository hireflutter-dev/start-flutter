// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../feature/authentication/presentation/login_screen.dart' as _i2;
import '../feature/authentication/presentation/login_verify_screen.dart' as _i3;
import '../feature/email_authentication/presentation/login.dart' as _i5;
import '../feature/email_authentication/presentation/register.dart' as _i6;
import '../feature/email_authentication/presentation/verify.dart' as _i7;
import '../feature/home/presentation/home_screen.dart' as _i4;
import '../feature/splash/splash_screen.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    LoginVerifyScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginVerifyScreen());
    },
    HomeScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    Loginwithemail.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmailLogin());
    },
    Signup.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Signup());
    },
    VerifyScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.VerifyScreen());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashScreen.name, path: '/'),
        _i8.RouteConfig(LoginScreen.name, path: '/login'),
        _i8.RouteConfig(LoginVerifyScreen.name, path: '/loginviewscreen'),
        _i8.RouteConfig(HomeScreen.name, path: '/homescreen'),
        _i8.RouteConfig(Loginwithemail.name, path: '/loginwithemail'),
        _i8.RouteConfig(Signup.name, path: '/Signup'),
        _i8.RouteConfig(VerifyScreen.name, path: '/VerifyScreen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i8.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i8.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.LoginVerifyScreen]
class LoginVerifyScreen extends _i8.PageRouteInfo<void> {
  const LoginVerifyScreen()
      : super(LoginVerifyScreen.name, path: '/loginviewscreen');

  static const String name = 'LoginVerifyScreen';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i8.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/homescreen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i5.EmailLogin]
class Loginwithemail extends _i8.PageRouteInfo<void> {
  const Loginwithemail() : super(Loginwithemail.name, path: '/loginwithemail');

  static const String name = 'Loginwithemail';
}

/// generated route for
/// [_i6.Signup]
class Signup extends _i8.PageRouteInfo<void> {
  const Signup() : super(Signup.name, path: '/Signup');

  static const String name = 'Signup';
}

/// generated route for
/// [_i7.VerifyScreen]
class VerifyScreen extends _i8.PageRouteInfo<void> {
  const VerifyScreen() : super(VerifyScreen.name, path: '/VerifyScreen');

  static const String name = 'VerifyScreen';
}
