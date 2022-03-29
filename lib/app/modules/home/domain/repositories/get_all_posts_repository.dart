import '../params/get_all_posts_params.dart';
import '../typedefs/get_posts_use_case_typedef.dart';

abstract class GetAllPostsRepository {
  GetPostsResult getAllPosts(GetAllPostsParams params);
}
