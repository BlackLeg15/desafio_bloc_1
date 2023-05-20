import 'dart:developer';

import 'package:dartz/dartz.dart';
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
      log(
        '✅ Method: GET\n'
        'Client: Uno\n'
        'Path: ${result.request.uri}\n'
        'Headers: ${result.request.headers.toString()}',
        name: 'HttpClient',
      );
      return Right(response);
    } on UnoError catch (e) {
      log(
        '🔴 Method: GET\n'
        'Client: Uno\n'
        'Path: ${e.request?.uri}\n'
        'Message: ${e.message}\n'
        'Response Data: ${e.response?.data}',
        name: 'HttpClient',
      );
      // log(
      //   '🔴 Uno Http Client',
      //   name: 'HttpClient',
      //   error: e,
      // );
      return Left(HttpClientException(e.message, e.stackTrace ?? StackTrace.current));
    }
  }
}
