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

class AnimePostsLoadingState extends AnimePostsState {
  AnimePostsLoadingState(List<AnimePostEntity> animePosts, int page) : super(animePosts, page, FetchAnimePostsParameters.postsPerPage);
}

class AnimePostsSuccessState extends AnimePostsState {
  AnimePostsSuccessState(List<AnimePostEntity> animePosts, int page) : super(animePosts, page, FetchAnimePostsParameters.postsPerPage);
}

class AnimePostsErrorState extends AnimePostsState {
  final String message;

  AnimePostsErrorState(this.message, List<AnimePostEntity> animePosts, int page) : super(animePosts, page, FetchAnimePostsParameters.postsPerPage);
}
