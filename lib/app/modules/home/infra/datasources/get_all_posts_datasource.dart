import '../../domain/entities/anime_post_entity.dart';
import '../../domain/params/get_all_posts_params.dart';

abstract class GetAllPostsDatasource {
  Future<List<AnimePostEntity>> getAllPosts(GetAllPostsParams params);
}
