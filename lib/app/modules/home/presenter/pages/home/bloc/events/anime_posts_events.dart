part of '../anime_posts_bloc.dart';

@immutable
abstract class AnimePostsEvent {
  const AnimePostsEvent();
}

class FetchAnimePostsEvent extends AnimePostsEvent {
  final FetchAnimePostsEventParams parameters;
  final List<AnimePostEntity> actualListOfAnimePosts;
  final Function(List<AnimePostEntity> newListOfAnimePosts)? onStateCallback;
  final VoidCallback? onErrorCallback;

  const FetchAnimePostsEvent({required this.parameters, required this.actualListOfAnimePosts, this.onStateCallback, this.onErrorCallback});
}
