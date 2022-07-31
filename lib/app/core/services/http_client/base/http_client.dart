import 'package:dartz/dartz.dart';

import 'http_client_exception.dart';
import 'http_client_response.dart';

abstract class HttpClient {
  Future<Either<HttpClientException, HttpClientResponse>> get(String path);
}
