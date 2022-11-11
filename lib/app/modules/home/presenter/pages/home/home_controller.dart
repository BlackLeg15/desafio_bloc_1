import '../../../domain/entities/anime_post_entity.dart';
import 'bloc/anime_posts_bloc.dart';

class HomeController {
  final AnimePostsBloc animePostsBloc;
  List<AnimePostEntity> get posts => animePostsBloc.state.animePosts;

  const HomeController(this.animePostsBloc);

  void fetchAnimePosts() {
    animePostsBloc.add(const GetAnimePostsEvent());
  }
}
