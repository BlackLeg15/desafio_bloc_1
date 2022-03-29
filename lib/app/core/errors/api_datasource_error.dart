import 'datasource_error.dart';

class ApiDataSourceError extends DataSourceError {

  ApiDataSourceError({required String message, required StackTrace stackTrace})
      : super(message, stackTrace);
  @override
  String toString() {
    return message;
  }
}
