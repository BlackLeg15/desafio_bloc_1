import 'package:desafio_bloc_1/app/app_widget.dart';
import 'package:desafio_bloc_1/app/modules/app_module.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/repositories/get_all_posts_repository.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'package:desafio_bloc_1/app/modules/home/home_module.dart';
import 'package:desafio_bloc_1/app/modules/home/infra/datasources/get_all_posts_datasource.dart';
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/bloc/anime_posts_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class AnimePostsBlocMock extends Mock implements AnimePostsBloc {}

class GetAllPostsDatasourceMock extends Mock implements GetAllPostsDatasource {}

class GetAllPostsRepositoryMock extends Mock implements GetAllPostsRepository {}

class GetAllPostsUseCaseMock extends Mock implements GetAllPostsUseCase {}

void main() {
  late AnimePostsBlocMock animePostsBloc;
  late GetAllPostsUseCaseMock getAllPostsUseCase;
  late GetAllPostsRepositoryMock getAllPostsRepository;
  late GetAllPostsDatasourceMock getAllPostsDatasource;
  setUp(() {
    // animePostsBloc = AnimePostsBlocMock();
    // getAllPostsUseCase = GetAllPostsUseCaseMock();
    // getAllPostsRepository = GetAllPostsRepositoryMock();
    // getAllPostsDatasource = GetAllPostsDatasourceMock();
    // registerFallbackValue(GetAllPostsParams(1, 10));
    // when(() => getAllPostsDatasource.getAllPosts(any())).thenAnswer(
    //   (invocation) async => List.generate(10, (index) => AnimePostEntity(description: index.toString())),
    // );
    initModules([
      AppModule(),
      HomeModule(),
    ]);
  });
  testWidgets('home page ...', (tester) async {
    await tester.pumpWidget(const AppWidget());

    //expect(find.text('Animes'), findsOneWidget);
  });
}
