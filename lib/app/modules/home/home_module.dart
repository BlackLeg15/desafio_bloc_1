import 'package:flutter_modular/flutter_modular.dart';

import 'domain/use_cases/get_all_posts_use_case/get_all_posts_use_case_impl.dart';
import 'external/datasources/api/get_all_posts_from_api_datasource.dart';
import 'external/datasources/api/mapper/get_all_posts_from_api_mapper.dart';
import 'infra/repositories/get_all_posts_repository_impl.dart';
import 'presenter/pages/home/bloc/blog_posts_bloc.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController(i())),
    Bind.singleton<BlogPostsBloc>((i) => BlogPostsBloc(i()), onDispose: (bloc) => bloc.close()),
    Bind.singleton((i) => GetAllPostsUseCaseImpl(i())),
    Bind.singleton((i) => GetAllPostsRepositoryImpl(i())),
    Bind.singleton((i) => GetAllPostsFromApiDatasource(i(), i())),
    Bind.singleton((i) => GetAllPostsFromApiMapper()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage())
  ];
}
