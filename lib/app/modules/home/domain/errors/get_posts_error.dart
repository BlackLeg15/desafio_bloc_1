import '../../../../core/errors/custom_error.dart';

abstract class GetPostsError extends CustomError {
  const GetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}
class UnknownGetPostsError extends GetPostsError {
  UnknownGetPostsError({required String message, required StackTrace stackTrace}) : super(message: message, stackTrace: stackTrace);
}
class GetPostsMapperError extends GetPostsError {
  GetPostsMapperError({required String message}) : super(message: message, stackTrace: StackTrace.empty);
}

class GetPostsRequestError extends GetPostsError {
  const GetPostsRequestError({String message = "Não foi possível buscar posts"}) : super(message: message, stackTrace: StackTrace.empty);
}

