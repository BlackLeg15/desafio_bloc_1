import 'package:flutter/material.dart';

class AppController extends InheritedWidget {
  final ValueNotifier<ThemeMode> rxThemeMode;

  const AppController({Key? key, required Widget child, required this.rxThemeMode}) : super(key: key, child: child);

  void changeThemeMode(ThemeMode themeMode) {
    rxThemeMode.value = themeMode;
  }

  @override
  bool updateShouldNotify(covariant AppController oldWidget) {
    return rxThemeMode.value != oldWidget.rxThemeMode.value;
  }

  static AppController? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppController>();
}
