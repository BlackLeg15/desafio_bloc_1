
import '../helpers/errors_stacktrace.dart';
import 'custom_error.dart';

class DataSourceError extends CustomError {

  DataSourceError(
    String message,
    StackTrace stackTrace,
  ) : super(message: message, stackTrace: stackTrace) {
     ErrorsStacktrace.printError(
      stackTrace: stackTrace,
      message: message,
      tag: 'DataSourceError',
    );
  }
}
