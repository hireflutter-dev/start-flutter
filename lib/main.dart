import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
