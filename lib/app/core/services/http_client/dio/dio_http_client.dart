import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../base/http_client.dart';
import '../base/http_client_exception.dart';
import '../base/http_client_response.dart';

class DioHttpClient implements HttpClient {
  late final Dio _dio;

  DioHttpClient({String? baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl ?? ''));
  }

  @override
  Future<Either<HttpClientException, HttpClientResponse>> get(String path) async {
    HttpClientResponse? response;
    try {
      final result = await _dio.get(path);
      response = HttpClientResponse(result.data, result.statusCode ?? -1, result.statusMessage ?? '');
      return Right(response);
    } on DioError catch (e) {
      return Left(HttpClientException(e.message ?? ''));
    }
  }
}
