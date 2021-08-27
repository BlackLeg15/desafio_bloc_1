import 'package:flutter/material.dart';

import '../../../../../core/constants/fetch_anime_posts_parameters.dart';
import '../../../domain/entities/anime_post_entity.dart';
import 'bloc/anime_posts_bloc.dart';
import 'bloc/events/params/fetch_anime_posts_event_params.dart';

class HomeController {
  final AnimePostsBloc animePostsBloc;

  var lockUpdatePostList = false;
  var scrollControllerForPagination = ScrollController();

  var _page = FetchAnimePostsParameters.initialPage;
  final _postsPerPage = FetchAnimePostsParameters.postsPerPage;
  var _anyApiError = false;

  var posts = <AnimePostEntity>[];

  HomeController(this.animePostsBloc) {
    fetchAnimePosts();
    scrollControllerForPagination.addListener(() {
      if (scrollControllerForPagination.offset >= scrollControllerForPagination.position.maxScrollExtent - 100 && !lockUpdatePostList) {
        fetchAnimePosts();
      }
    });
  }

  void fetchAnimePosts() {
    if (_anyApiError || lockUpdatePostList) return;
    lockUpdatePostList = true;
    animePostsBloc.add(
      FetchAnimePostsEvent(
        parameters: FetchAnimePostsEventParams(page: _page, postsPerPage: _postsPerPage),
        actualListOfAnimePosts: posts,
        onStateCallback: (newListOfAnimePosts) {
          lockUpdatePostList = false;
          _page++;
          posts = newListOfAnimePosts;
        },
        onErrorCallback: () {
          _anyApiError = true;
        },
      ),
    );
  }
}
