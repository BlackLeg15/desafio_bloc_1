import 'package:dartz/dartz.dart';

import '../../../../core/errors/custom_error.dart';
import '../../../../core/errors/datasource_error.dart';
import '../../domain/entities/anime_post_entity.dart';
import '../../domain/params/get_all_posts_params.dart';
import '../../domain/repositories/get_all_posts_repository.dart';
import '../datasources/get_all_posts_datasource.dart';

class GetAllPostsRepositoryImpl implements GetAllPostsRepository {
  final GetAllPostsDatasource _datasource;

  GetAllPostsRepositoryImpl(this._datasource);

  @override
  Future<Either<CustomError, List<AnimePostEntity>>> getAllPosts(GetAllPostsParams params) async {
    try {
      final result = await _datasource.getAllPosts(params);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(DataSourceError(e.toString(), s));
    }
  }
}
