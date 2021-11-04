import 'package:dartz/dartz.dart';
import 'package:desafio_bloc_1/app/core/errors/api_datasource_error.dart';
import 'package:desafio_bloc_1/app/core/errors/datasource_error.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/anime_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/params/get_all_posts_params.dart';
import 'package:desafio_bloc_1/app/modules/home/infra/datasources/get_all_posts_datasource.dart';
import 'package:desafio_bloc_1/app/modules/home/infra/repositories/get_all_posts_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllPostsDatasourceMock extends Mock implements GetAllPostsDatasource{}

main() {
  late final GetAllPostsDatasourceMock _datasource;
  late final GetAllPostsRepositoryImpl _repository;

  setUpAll(() {
    _datasource = GetAllPostsDatasourceMock();
    _repository = GetAllPostsRepositoryImpl(_datasource);
    registerFallbackValue(GetAllPostsParams(1, 1));
  });

  group('GetAllPostsUseCase', () {
    test('| should complete successfully', () {
      final goodResponse = [
        AnimePostEntity()
      ];
      when(() => _datasource.getAllPosts(any())).thenAnswer((invocation) async => goodResponse);
      final response = _repository.getAllPosts(GetAllPostsParams(1, 1));
      expect(response.then((value) => value.fold(id, id)), completion(goodResponse));
    });
    test('| should complete with an error', () {
      when(() => _datasource.getAllPosts(any())).thenThrow(ApiDataSourceError(message: 'Something wrong happened', stackTrace: StackTrace.empty));
      final response = _repository.getAllPosts(GetAllPostsParams(1, 1));
      expect(response.then((value) => value.fold(id, id)), completion(isA<DataSourceError>()));
    });
  });
}