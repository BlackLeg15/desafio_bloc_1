import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/http_service.dart';
import 'domain/use_cases/get_all_posts_use_case/get_all_posts_use_case_impl.dart';
import 'external/datasources/api/get_all_posts_from_api_datasource.dart';
import 'infra/repositories/get_all_posts_repository_impl.dart';
import 'presenter/pages/home/bloc/anime_posts_bloc.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';

class HomeModule extends Module{
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController(i())),
    Bind.factory((i) => AnimePostsBloc(i())),
    Bind.factory((i) => GetAllPostsUseCaseImpl(i())),
    Bind.factory((i) => GetAllPostsRepositoryImpl(i())),
    Bind.factory((i) => GetAllPostsFromApiDatasource(i())),
    Bind.factory((i) => HttpService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage())
  ];
}