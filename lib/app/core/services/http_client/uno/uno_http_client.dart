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
      log('✅ Uno Http Client | GET\nPath: ${result.request.uri}\nHeaders: ${result.request.headers.toString()}');
      return Right(response);
    } on UnoError catch (e) {
      log('🔴 Uno Http Client | GET\nPath: ${e.request?.uri}');
      return Left(HttpClientException(e.message, e.stackTrace ?? StackTrace.current));
    }
  }
}
