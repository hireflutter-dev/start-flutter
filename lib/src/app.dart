import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/domain/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'app/router/router.gr.dart';
import 'config/theme_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    return ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(),
      child: MaterialApp.router(
        theme: ThemeConfig.lightTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
