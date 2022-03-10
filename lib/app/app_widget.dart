import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desafio FTeam',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
