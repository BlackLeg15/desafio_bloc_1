import '../../typedefs/get_posts_use_case_typedef.dart';

import '../../params/get_all_posts_params.dart';

abstract class GetAllPostsUseCase {
  GetPostsResult call(GetAllPostsParams params);
}
