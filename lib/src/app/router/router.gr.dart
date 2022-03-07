// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import '../feature/email_auth/register.dart' as _i8;
import '../feature/authentication/presentation/login_screen.dart' as _i4;
import '../feature/authentication/presentation/login_verify_screen.dart' as _i5;
import '../feature/email_auth/login.dart'as _i7;
import '../feature/home/presentation/home_screen.dart' as _i6;
import '../feature/splash/splash_screen.dart' as _i3;
import '../feature/email_auth/verify.dart' as _i9;
class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        
          child: _i3.SplashScreen()),
    LoginScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        child: 
          _i4.LoginScreen()
        ),
    LoginVerifyScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        child:_i5.LoginVerifyScreen()),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.HomeScreen()
        ),
        EmailLogin.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData, child: _i7.EmailLogin()),
        Signup.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData, child: _i8. Signup()),
        VerifyScreen.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(routeData: routeData, child:_i9.VerifyScreen()),
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
