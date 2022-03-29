import 'custom_error.dart';

class DomainError extends CustomError {

  DomainError({required String message, required StackTrace stackTrace})
      : super(message: message, stackTrace: stackTrace);

  @override
  String toString() => 'DomainError(message: $message)';
}
