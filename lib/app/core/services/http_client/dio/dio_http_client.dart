import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../base/http_client.dart';
import '../base/http_client_exception.dart';
import '../base/http_client_response.dart';

class DioHttpClient implements HttpClient {
  final Dio dioInstance;

  DioHttpClient(this.dioInstance, {String? baseUrl}) {
    if (baseUrl != null) {
      setBaseUrl(baseUrl);
    }
  }

  @override
  void setBaseUrl(String baseUrl) {
    dioInstance.options.baseUrl = baseUrl;
  }

  @override
  Future<Either<HttpClientException, HttpClientResponse>> get(String path) async {
    HttpClientResponse? response;
    try {
      final result = await dioInstance.get(path);
      response = HttpClientResponse(result.data, result.statusCode ?? -1, result.statusMessage ?? '');
      return Right(response);
    } on DioError catch (e) {
      return Left(HttpClientException(e.message));
    }
  }
}
