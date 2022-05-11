import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/constants/endpoints.dart';
import '../core/services/http_client/dio/dio_http_client.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule())
  ];
}
