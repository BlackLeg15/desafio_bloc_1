import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:desafio_bloc_1/app/core/services/http_client/base/http_client.dart';
import 'package:desafio_bloc_1/app/core/services/http_client/base/http_client_response.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/entities/anime_post_entity.dart';
import 'package:desafio_bloc_1/app/modules/home/domain/params/get_all_posts_params.dart';
import 'package:desafio_bloc_1/app/modules/home/external/datasources/api/get_all_posts_from_api_datasource.dart';
import 'package:desafio_bloc_1/app/modules/home/external/datasources/api/mapper/get_all_posts_from_api_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'payloads/get_all_posts_payload.dart';

class HttpServiceMock extends Mock implements HttpClient {}

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
      when(() => _httpServiceMock.get(any())).thenAnswer((invocation) async => Right(HttpClientResponse(jsonDecode(getAllPostsPayload), -1, '')));
      final response = _datasource.getAllPosts(GetAllPostsParams(1, 1));
      expect(response, completion(isA<List<AnimePostEntity>>()));
    });
    test('| should complete with an error', () {
      when(() => _httpServiceMock.get(any())).thenThrow(ArgumentError('An error occured'));
      final response = _datasource.getAllPosts(GetAllPostsParams(1, 1));
      expect(response, throwsA(isA<ArgumentError>()));
    });
  });
}