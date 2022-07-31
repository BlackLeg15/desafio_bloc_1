import '../../../domain/entities/anime_post_entity.dart';
import 'bloc/anime_posts_bloc.dart';

class HomeController {
  final AnimePostsBloc animePostsBloc;
  List<AnimePostEntity> get posts => animePostsBloc.state.animePosts;
  var _anyApiError = false;

  HomeController(this.animePostsBloc) {
    animePostsBloc.stream.listen((state) {
      if (state is AnimePostsErrorState) {
        _anyApiError = false;
      }
    });
  }

  void fetchAnimePosts() {
    if (_anyApiError) return;
    animePostsBloc.add(const FetchAnimePostsEvent());
  }
}
