// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../feature/authentication/presentation/login_screen.dart' as _i4;
import '../feature/authentication/presentation/login_verify_screen.dart' as _i5;
import '../feature/home/presentation/home_screen.dart' as _i6;
import '../feature/splash/splash_screen.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreen();
        }),
    LoginScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LoginScreen();
        }),
    LoginVerifyScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.LoginVerifyScreen();
        }),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.HomeScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreen.name, path: '/'),
        _i1.RouteConfig(LoginScreen.name, path: '/login'),
        _i1.RouteConfig(LoginVerifyScreen.name, path: '/loginviewscreen'),
        _i1.RouteConfig(HomeScreen.name, path: '/homescreen')
      ];
}

class SplashScreen extends _i1.PageRouteInfo {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

class LoginScreen extends _i1.PageRouteInfo {
  const LoginScreen() : super(name, path: '/login');

  static const String name = 'LoginScreen';
}

class LoginVerifyScreen extends _i1.PageRouteInfo {
  const LoginVerifyScreen() : super(name, path: '/loginviewscreen');

  static const String name = 'LoginVerifyScreen';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '/homescreen');

  static const String name = 'HomeScreen';
}
