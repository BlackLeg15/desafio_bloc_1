import '../../../../core/errors/custom_error.dart';

abstract class GetPostsError extends CustomError {
  GetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}
class UnknownGetPostsError extends GetPostsError {
  UnknownGetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}

