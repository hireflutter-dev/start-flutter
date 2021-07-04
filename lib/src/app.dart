import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter Kit',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: SplashScreen(),
    );
  }
}
