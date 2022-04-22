import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/anime_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/errors/get_posts_error.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/params/get_all_posts_params.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/bloc/anime_posts_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllPostsUseCaseMock extends Mock implements GetAllPostsUseCase {}

void main() {
  late GetAllPostsUseCaseMock useCaseMock;
  late List<AnimePostEntity> resultFromUsecase;

  setUp(() {
    useCaseMock = GetAllPostsUseCaseMock();
    registerFallbackValue(GetAllPostsParams(1, 10));
  });

  group('Teste de chamada do evento de buscar mais posts |', () {
    blocTest<AnimePostsBloc, AnimePostsState>('1. Bem-sucedida',
        setUp: () {
          //SETUP RESULT
          resultFromUsecase = List.generate(10, (index) => AnimePostEntity(description: index.toString()));
          when(() => useCaseMock(any())).thenAnswer((_) async => Right(resultFromUsecase));
        },
        build: () => AnimePostsBloc(useCaseMock),
        act: (bloc) => bloc.add(const FetchAnimePostsEvent()),
        expect: () => [
              FetchingAnimePostsState(const [], 1),
              FetchedAnimePostsState(resultFromUsecase, 2)
            ],
        verify: (bloc) {
          final animePosts = bloc.state.animePosts;
          //VERIFY RESULT
          expect(animePosts, isNotEmpty);
          expect(animePosts[2].description, '2');
        });
    blocTest<AnimePostsBloc, AnimePostsState>('2. Mal-sucedida',
        setUp: () {
          //SETUP RESULT
          //resultFromUsecase = List.generate(10, (index) => AnimePostEntity(description: index.toString()));
          when(() => useCaseMock(any())).thenAnswer((_) async => Left(UnknownGetPostsError(message: 'Erro', stackTrace: StackTrace.empty)));
        },
        build: () => AnimePostsBloc(useCaseMock),
        act: (bloc) => bloc.add(const FetchAnimePostsEvent()),
        expect: () => [
              FetchingAnimePostsState(const [], 1),
              AnimePostsErrorState('Erro', const [], 1)
            ],
        verify: (bloc) {
          final animePosts = bloc.state.animePosts;
          //VERIFY RESULT
          expect(animePosts, isEmpty);
          expect(bloc.state, isA<AnimePostsErrorState>());
          expect((bloc.state as AnimePostsErrorState).message, 'Erro');
        });
  });
}
