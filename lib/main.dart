import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app_widget.dart';
import 'app/core/constants/endpoints.dart';
import 'app/core/routing/app_router.dart';
import 'app/core/services/http_client/base/http_client.dart';
import 'app/core/services/http_client/uno/uno_http_client.dart';
import 'app/modules/home/domain/repositories/get_all_posts_repository.dart';
import 'app/modules/home/domain/use_cases/get_all_posts_use_case/get_all_posts_use_case_impl.dart';
import 'app/modules/home/domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'app/modules/home/external/datasources/api/get_all_posts_from_api_datasource.dart';
import 'app/modules/home/external/datasources/api/mapper/get_all_posts_from_api_mapper.dart';
import 'app/modules/home/infra/datasources/get_all_posts_datasource.dart';
import 'app/modules/home/infra/repositories/get_all_posts_repository_impl.dart';
import 'app/modules/home/presenter/pages/home/bloc/blog_posts_bloc.dart';
import 'app/modules/home/presenter/pages/home/home_controller.dart';

void main() {
  initDeps();
  runApp(const AppWidget());
}

void initDeps() {
  GetIt.I.registerSingleton<HttpClient>(UnoHttpClient(baseUrl: Endpoints.baseUrl));
  GetIt.I.registerSingleton(GetAllPostsFromApiMapper());
  GetIt.I.registerSingleton<GetAllPostsDatasource>(GetAllPostsFromApiDatasource(GetIt.I(), GetIt.I()));
  GetIt.I.registerSingleton<GetAllPostsRepository>(GetAllPostsRepositoryImpl((GetIt.I())));
  GetIt.I.registerSingleton<GetAllPostsUseCase>(GetAllPostsUseCaseImpl((GetIt.I())));
  GetIt.I.registerSingleton(BlogPostsBloc((GetIt.I())));
  GetIt.I.registerSingleton(HomeController(GetIt.I()));
  GetIt.I.registerSingleton(AppRouter());
}
