import 'package:flutter/material.dart';

import '../../../../../app_controller.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final controller = AppController.of(context)!;
                controller.changeThemeMode(ThemeMode.light);
              },
              icon: const Icon(Icons.change_circle)),
          IconButton(
              onPressed: () {
                final controller = AppController.of(context)!;
                controller.changeThemeMode(ThemeMode.dark);
              },
              icon: const Icon(Icons.change_circle))
        ],
      ),
    );
  }
}
