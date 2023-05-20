import '../../../domain/entities/anime_post_entity.dart';
import 'bloc/anime_posts_bloc.dart';

class HomeController {
  final BlogPostsBloc animePostsBloc;
  List<BlogPostEntity> get posts => animePostsBloc.state.animePosts;

  const HomeController(this.animePostsBloc);

  void fetchBlogPosts() {
    animePostsBloc.add(const GetBlogPostsEvent());
  }
}
