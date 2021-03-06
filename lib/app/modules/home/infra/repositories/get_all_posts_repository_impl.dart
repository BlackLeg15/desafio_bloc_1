import 'package:dartz/dartz.dart';
import '../../domain/errors/get_posts_error.dart';
import '../../domain/typedefs/get_posts_use_case_typedef.dart';

import '../../domain/params/get_all_posts_params.dart';
import '../../domain/repositories/get_all_posts_repository.dart';
import '../datasources/get_all_posts_datasource.dart';

class GetAllPostsRepositoryImpl implements GetAllPostsRepository {
  final GetAllPostsDatasource _datasource;

  GetAllPostsRepositoryImpl(this._datasource);

  @override
  GetPostsResult getAllPosts(GetAllPostsParams params) async {
    try {
      final result = await _datasource.getAllPosts(params);
      return Right(result);
    } on GetPostsError catch (exception) {
      return Left(exception);
    } catch (exception, stackTrace) {
      return Left(UnknownGetPostsError(message: 'Não foi possível recuperar os posts da página ${params.page}', stackTrace: stackTrace));
    }
  }
}
