import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/blog_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/errors/get_posts_error.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/params/get_all_posts_params.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/bloc/blog_posts_bloc.dart';
import 'package:desafio_bloc_1/app/modules/home/presenter/pages/home/bloc/states/blog_posts_state_freezed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllPostsUseCaseMock extends Mock implements GetAllPostsUseCase {}

void main() {
  group(
    'Teste de chamada do evento de buscar mais posts |',
    () {
      late GetAllPostsUseCaseMock useCaseMock;
      late List<BlogPostEntity> resultFromUsecase;
      setUpAll(() {
        useCaseMock = GetAllPostsUseCaseMock();
        registerFallbackValue(GetAllPostsParams(1, 10));
      });
      blocTest<BlogPostsBloc, BlogPostsStateFreezed>(
        '1. Bem-sucedida',
        setUp: () {
          //SETUP RESULT
          resultFromUsecase = List.generate(10, (index) => BlogPostEntity(description: index.toString()));
          when(() => useCaseMock(any())).thenAnswer((_) async => Right(resultFromUsecase));
        },
        build: () => BlogPostsBloc(useCaseMock),
        act: (bloc) => bloc.add(const GetBlogPostsEvent()),
        expect: () => [
          const BlogPostsStateFreezed.loading([], 0),
          BlogPostsStateFreezed.success(resultFromUsecase, 1),
        ],
        verify: (bloc) {
          final blogPosts = bloc.state.posts;
          //VERIFY RESULT
          expect(blogPosts, isNotEmpty);
          expect(blogPosts[2].description, '2');
        },
      );
      blocTest<BlogPostsBloc, BlogPostsStateFreezed>(
        '2. Mal-sucedida',
        setUp: () {
          //SETUP RESULT
          //resultFromUsecase = List.generate(10, (index) => BlogPostEntity(description: index.toString()));
          when(() => useCaseMock(any())).thenAnswer((_) async => Left(UnknownGetPostsError(message: 'Erro', stackTrace: StackTrace.empty)));
        },
        build: () => BlogPostsBloc(useCaseMock),
        act: (bloc) => bloc.add(const GetBlogPostsEvent()),
        expect: () => [
          const BlogPostsStateFreezed.loading([], 0),
          const BlogPostsStateFreezed.exception([], 0, 'Erro'),
        ],
        verify: (bloc) {
          final blogPosts = bloc.state.posts;
          //VERIFY RESULT
          expect(blogPosts, isEmpty);
          expect(
            bloc.state.whenOrNull(
              exception: (a, b, c) => true,
            ),
            isTrue,
          );
          expect(
            bloc.state.whenOrNull(
              exception: (posts, page, message) => message,
            ),
            'Erro',
          );
        },
      );
    },
  );
}
