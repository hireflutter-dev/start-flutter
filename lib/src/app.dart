import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/feature/authentication/presentation/viewmodel/auth_view_model.dart';
import 'app/router/router.gr.dart';
import 'config/theme_config.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
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
