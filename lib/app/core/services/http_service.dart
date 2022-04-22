import 'package:dio/native_imp.dart';

import '../constants/endpoints.dart';

//TODO Melhorar Http Client
class HttpService extends DioForNative {
  HttpService() {
    options.baseUrl = Endpoints.baseUrl;
  }
}
