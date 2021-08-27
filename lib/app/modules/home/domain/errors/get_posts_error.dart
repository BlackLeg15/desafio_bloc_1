import '../../../../core/errors/custom_error.dart';

class GetPostsError extends CustomError {
  GetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}
