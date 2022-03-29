part of '../anime_posts_bloc.dart';

@immutable
abstract class AnimePostsEvent {
  const AnimePostsEvent();
}

class FetchAnimePostsEvent extends AnimePostsEvent {
  final VoidCallback? onStateCallback;
  final VoidCallback? onErrorCallback;

  const FetchAnimePostsEvent({this.onStateCallback, this.onErrorCallback});
}
