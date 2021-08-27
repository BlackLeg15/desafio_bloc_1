
import '../helpers/errors_stacktrace.dart';
import 'custom_error.dart';

class DataSourceError extends CustomError {
  final String message;
  final StackTrace stackTrace;

  DataSourceError(
    this.message,
    this.stackTrace,
  ) : super(message: message, stackTrace: stackTrace) {
     ErrorsStacktrace.printError(
      stackTrace: stackTrace,
      message: message,
      tag: 'DataSourceError',
    );
  }
}
