import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uno/uno.dart';

import '../base/http_client.dart';
import '../base/http_client_exception.dart';
import '../base/http_client_response.dart';

class UnoHttpClient implements HttpClient {
  late final Uno _uno;

  UnoHttpClient({String? baseUrl}) {
    _uno = Uno(baseURL: baseUrl ?? '');
  }

  @override
  Future<Either<HttpClientException, HttpClientResponse>> get(String path) async {
    HttpClientResponse? response;
    try {
      final result = await _uno.get(path);
      response = HttpClientResponse(result.data, result.status, '');
      return Right(response);
    } on DioError catch (e) {
      return Left(HttpClientException(e.message));
    }
  }
}
