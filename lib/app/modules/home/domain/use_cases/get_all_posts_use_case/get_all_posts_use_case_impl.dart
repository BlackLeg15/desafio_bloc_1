import '../../params/get_all_posts_params.dart';
import '../../repositories/get_all_posts_repository.dart';
import '../../typedefs/get_posts_use_case_typedef.dart';
import 'get_posts_use_case.dart';

class GetAllPostsUseCaseImpl implements GetAllPostsUseCase {
  final GetAllPostsRepository _repository;

  GetAllPostsUseCaseImpl(this._repository);

  @override
  GetPostsResult call(GetAllPostsParams params) {
    return _repository.getAllPosts(params);
  }
}
