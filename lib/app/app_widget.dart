import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _rxThemeMode = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    return AppController(
      rxThemeMode: _rxThemeMode,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _rxThemeMode,
        builder: (context, value, child) => MaterialApp.router(
          title: 'Desafio FTeam',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: value,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ),
      ),
    );
  }
}
