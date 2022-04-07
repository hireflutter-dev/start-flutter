// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../feature/authentication/presentation/login_screen.dart' as _i2;
import '../feature/authentication/presentation/login_verify_screen.dart' as _i3;
import '../feature/home/presentation/home_screen.dart' as _i4;
import '../feature/splash/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    LoginVerifyScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginVerifyScreen());
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreen.name, path: '/'),
        _i5.RouteConfig(LoginScreen.name, path: '/login'),
        _i5.RouteConfig(LoginVerifyScreen.name, path: '/loginviewscreen'),
        _i5.RouteConfig(HomeScreen.name, path: '/homescreen')
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
