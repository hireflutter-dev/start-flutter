import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/google_authenticaiton/data/observers/app_bloc_observer.dart';

import 'src/injection/setup_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(App());
}
