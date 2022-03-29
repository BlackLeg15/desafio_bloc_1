
import 'package:dartz/dartz.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/anime_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/errors/get_posts_error.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/params/get_all_posts_params.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/repositories/get_all_posts_repository.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/use_cases/get_all_posts_use_case/get_all_posts_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllPostsRepositoryMock extends Mock implements GetAllPostsRepository {}

main() {
  late final GetAllPostsRepositoryMock _repository;
  late final GetAllPostsUseCaseImpl _usecase;

  setUpAll(() {
    _repository = GetAllPostsRepositoryMock();
    _usecase = GetAllPostsUseCaseImpl(_repository);
    registerFallbackValue(GetAllPostsParams(1, 1));
  });

  group('GetAllPostsUseCase', () {
    test('| should complete successfully', () {
      final goodResponse = [
        AnimePostEntity()
      ];
      when(() => _repository.getAllPosts(any())).thenAnswer((invocation) async => Right(goodResponse));
      final response = _usecase(GetAllPostsParams(1, 1));
      expect(response.then((value) => value.fold(id, id)), completion(goodResponse));
    });
    test('| should complete with an error', () {
      when(() => _repository.getAllPosts(any())).thenAnswer((_) async => Left(UnknownGetPostsError(message: 'Something wrong happened', stackTrace: StackTrace.empty)));
      final response = _usecase(GetAllPostsParams(1, 1));
      expect(response.then((value) => value.fold(id, id)), completion(isA<UnknownGetPostsError>()));
    });
  });
}
