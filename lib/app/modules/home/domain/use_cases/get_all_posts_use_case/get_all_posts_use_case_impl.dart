import 'package:dartz/dartz.dart';

import '../../../../../core/errors/custom_error.dart';
import '../../entities/anime_post_entity.dart';
import '../../params/get_all_posts_params.dart';
import '../../repositories/get_all_posts_repository.dart';
import 'get_posts_use_case.dart';

class GetAllPostsUseCaseImpl implements GetAllPostsUseCase {
  final GetAllPostsRepository _repository;

  GetAllPostsUseCaseImpl(this._repository);

  @override
  Future<Either<CustomError, List<AnimePostEntity>>> call(GetAllPostsParams params) {
    return _repository.getAllPosts(params);
  }
}
