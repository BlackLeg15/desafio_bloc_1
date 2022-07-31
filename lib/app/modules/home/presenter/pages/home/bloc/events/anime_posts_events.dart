part of '../anime_posts_bloc.dart';

@immutable
abstract class AnimePostsEvent {
  const AnimePostsEvent();
}

class FetchAnimePostsEvent extends AnimePostsEvent {
  const FetchAnimePostsEvent();
}
