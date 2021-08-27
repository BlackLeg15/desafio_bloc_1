import 'package:dartz/dartz.dart';

import '../../../../../core/errors/custom_error.dart';
import '../../entities/anime_post_entity.dart';
import '../../params/get_all_posts_params.dart';

abstract class GetAllPostsUseCase {
  Future<Either<CustomError, List<AnimePostEntity>>> call(GetAllPostsParams params);
}
