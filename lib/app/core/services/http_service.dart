import 'package:dio/native_imp.dart';

import '../constants/endpoints.dart';

class HttpService extends DioForNative {
  HttpService() {
    options.baseUrl = Endpoints.baseUrl;
  }
}
