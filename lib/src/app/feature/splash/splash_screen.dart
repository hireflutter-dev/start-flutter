import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hf_flutter_starter_kit/src/app/core/image_constant.dart';
import 'package:hf_flutter_starter_kit/src/app/router/router_constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.2;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        _opacity = 1.0;
      });
      Timer(const Duration(seconds: 4), () {
        context.router.replaceNamed(RouterConstant.login);
      });
      FirebaseAuth.instance.currentUser?.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 3),
        child: Center(
          child: Image.asset(ImageConstant.logo),
        ),
      ),
    );
  }
}
