import '../../../../core/errors/custom_error.dart';

abstract class GetPostsError extends CustomError {
  GetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}
class UnknownGetPostsError extends GetPostsError {
  UnknownGetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}
class GetPostsMapperError extends GetPostsError {
  GetPostsMapperError({required String message}) : super(message: message, stackTrace: StackTrace.empty);
}

class GetPostsRequestError extends GetPostsError {
  GetPostsRequestError({required String message}) : super(message: message, stackTrace: StackTrace.empty);
}

