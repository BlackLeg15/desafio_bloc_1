import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';
import 'app/core/constants/endpoints.dart';
import 'app/core/services/http_client/base/http_client.dart';
import 'app/core/services/http_client/dio/dio_http_client.dart';
import 'app/modules/home/domain/repositories/get_all_posts_repository.dart';
import 'app/modules/home/domain/use_cases/get_all_posts_use_case/get_all_posts_use_case_impl.dart';
import 'app/modules/home/domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'app/modules/home/external/datasources/api/get_all_posts_from_api_datasource.dart';
import 'app/modules/home/external/datasources/api/mapper/get_all_posts_from_api_mapper.dart';
import 'app/modules/home/infra/datasources/get_all_posts_datasource.dart';
import 'app/modules/home/infra/repositories/get_all_posts_repository_impl.dart';
import 'app/modules/home/presenter/pages/home/bloc/blog_posts_bloc.dart';
import 'app/modules/home/presenter/pages/home/home_controller.dart';
import 'app/modules/home/presenter/pages/home/home_page.dart';

void main() => runApp(
      ModularApp(
        module: createModule(register: (c) {
          c.addSingleton(GetAllPostsFromApiMapper.new);
          c.addSingleton<HttpClient>(
              () => DioHttpClient(baseUrl: Endpoints.baseUrl));
          c.addSingleton<GetAllPostsDatasource>(
              GetAllPostsFromApiDatasource.new);
          c.addSingleton<GetAllPostsRepository>(GetAllPostsRepositoryImpl.new);
          c.addSingleton<GetAllPostsUseCase>(GetAllPostsUseCaseImpl.new);
          c.addSingleton(BlogPostsBloc.new);
          c.addSingleton(HomeController.new);
          c.route('/',
              child: (context, args) =>
                  HomePage(controller: inject<HomeController>()));
        }),
        child: const AppWidget(),
      ),
    );
