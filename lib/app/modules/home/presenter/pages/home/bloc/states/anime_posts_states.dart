part of '../anime_posts_bloc.dart';

@immutable
abstract class AnimePostsState {
  final int page;
  final int postsPerPage;
  final List<AnimePostEntity> animePosts;

  const AnimePostsState(this.animePosts, this.page, this.postsPerPage);
}

class AnimePostsInitialState extends AnimePostsState {
  AnimePostsInitialState(List<AnimePostEntity> animePosts, {int? initialPage}) : super(animePosts, initialPage ?? FetchAnimePostsParameters.initialPage, FetchAnimePostsParameters.postsPerPage);
}

class FetchingAnimePostsState extends AnimePostsState {
  FetchingAnimePostsState(List<AnimePostEntity> animePosts, int page) : super(animePosts, page, FetchAnimePostsParameters.postsPerPage);
}

class FetchedAnimePostsState extends AnimePostsState {
  FetchedAnimePostsState(List<AnimePostEntity> animePosts, int page) : super(animePosts, page, FetchAnimePostsParameters.postsPerPage);
}

class AnimePostsErrorState extends AnimePostsState {
  final String message;

  AnimePostsErrorState(this.message, List<AnimePostEntity> animePosts, int page) : super(animePosts, page, FetchAnimePostsParameters.postsPerPage);
}
