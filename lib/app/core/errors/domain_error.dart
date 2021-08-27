import 'custom_error.dart';

class DomainError extends CustomError {
  final String message;
  final StackTrace stackTrace;

  DomainError({required this.message, required this.stackTrace})
      : super(message: message, stackTrace: stackTrace);

  @override
  String toString() => 'DomainError(message: $message)';
}
