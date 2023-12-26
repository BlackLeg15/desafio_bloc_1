import '../../../../core/errors/custom_error.dart';

abstract class GetPostsError extends CustomError {
  const GetPostsError({required super.message, required super.stackTrace});
}
class UnknownGetPostsError extends GetPostsError {
  UnknownGetPostsError({required super.message, required super.stackTrace});
}
class GetPostsMapperError extends GetPostsError {
  GetPostsMapperError({required super.message}) : super(stackTrace: StackTrace.empty);
}

class GetPostsRequestError extends GetPostsError {
  const GetPostsRequestError({super.message = "Não foi possível buscar posts"}) : super(stackTrace: StackTrace.empty);
}

