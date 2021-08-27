part of '../anime_posts_bloc.dart';

@immutable
abstract class AnimePostsState {
  const AnimePostsState();
}

class AnimePostsInitialState extends AnimePostsState {
  const AnimePostsInitialState();
}

class FetchingAnimePostsState extends AnimePostsState {
  const FetchingAnimePostsState();
}

class FetchedAnimePostsState extends AnimePostsState {
  //final List<PostResponse> listOfAnimePostsToShow;

  const FetchedAnimePostsState();

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is FetchedAnimePostsState && o.listOfAnimePostsToShow == listOfAnimePostsToShow;
  // }

  // @override
  // int get hashCode => listOfAnimePostsToShow.hashCode;
}

class AnimePostsErrorState extends AnimePostsState {
  final String message;

  const AnimePostsErrorState(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AnimePostsErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
