import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'widgetbook.directories.g.dart';

void main() async {
  await initializeDateFormatting('pt_BR');
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(directories: directories, addons: [
      ThemeAddon<ThemeData>(
        themes: [
          WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          WidgetbookTheme(name: 'Light', data: ThemeData.light()),
        ],
        themeBuilder: (context, theme, child) {
          return Theme(data: theme, child: child);
        },
      )
    ]);
  }
}
