import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'core/routing/app_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp.router(
      title: 'Blog Posts',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(primary: Colors.lightBlue),
        appBarTheme: const AppBarTheme(
          color: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
      routerConfig: GetIt.I<AppRouter>().config(),
    );
  }
}
