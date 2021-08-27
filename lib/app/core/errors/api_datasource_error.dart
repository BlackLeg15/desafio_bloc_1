import 'datasource_error.dart';

class ApiDataSourceError extends DataSourceError {
  final String message;
  final StackTrace stackTrace;

  ApiDataSourceError({required this.message, required this.stackTrace})
      : super(message, stackTrace);
  @override
  String toString() {
    return '$message';
  }
}
