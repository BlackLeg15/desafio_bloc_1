import 'dart:convert';

import 'package:desafio_bloc_1/app/core/errors/datasource_error.dart';
import 'package:desafio_bloc_1/app/core/services/http_service.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/anime_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/params/get_all_posts_params.dart';
import 'package:desafio_bloc_1/app/modules/home/external/datasources/api/get_all_posts_from_api_datasource.dart';
import 'package:desafio_bloc_1/app/modules/home/external/datasources/api/mapper/get_all_posts_from_api_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'payloads/get_all_posts_payload.dart';

class HttpServiceMock extends Mock implements HttpService{}

main() {
  late final HttpServiceMock _httpServiceMock;
  late final GetAllPostsFromApiDatasource _datasource;

  setUpAll(() {
    _httpServiceMock = HttpServiceMock();
    _datasource = GetAllPostsFromApiDatasource(_httpServiceMock, GetAllPostsFromApiMapper());
    registerFallbackValue(GetAllPostsParams(1, 1));
  });

  group('GetAllPostsUseCase', () {
    test('| should complete successfully', () {
      when(() => _httpServiceMock.get(any())).thenAnswer((invocation) async => Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(getAllPostsPayload)));
      final response = _datasource.getAllPosts(GetAllPostsParams(1, 1));
      expect(response, completion(isA<List<AnimePostEntity>>()));
    });
    test('| should complete with an error', () {
      when(() =>_httpServiceMock.get(any())).thenThrow(DataSourceError('An error occured', StackTrace.empty));
      final response = _datasource.getAllPosts(GetAllPostsParams(1, 1));
      expect(response, throwsA(isA<DataSourceError>()));
    });
  });
}