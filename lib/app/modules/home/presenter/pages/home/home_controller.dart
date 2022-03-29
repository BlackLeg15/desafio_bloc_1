import 'package:flutter/material.dart';

import '../../../domain/entities/anime_post_entity.dart';
import 'bloc/anime_posts_bloc.dart';

class HomeController {
  final AnimePostsBloc animePostsBloc;
  List<AnimePostEntity> get posts => animePostsBloc.state.animePosts;
  var _anyApiError = false;

  HomeController(this.animePostsBloc);

  void fetchAnimePosts(VoidCallback onSuccess) {
    if (_anyApiError) return;
    animePostsBloc.add(
      FetchAnimePostsEvent(
        onStateCallback: onSuccess,
        onErrorCallback: () {
          _anyApiError = true;
        },
      ),
    );
  }
}
