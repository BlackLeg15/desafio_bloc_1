part of '../anime_posts_bloc.dart';

@immutable
abstract class AnimePostsEvent {
  const AnimePostsEvent();
}

class GetAnimePostsEvent extends AnimePostsEvent {
  const GetAnimePostsEvent();
}
