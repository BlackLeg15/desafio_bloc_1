import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/anime_post_entity.dart';
import '../../../../domain/params/get_all_posts_params.dart';
import '../../../../domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'events/params/fetch_anime_posts_event_params.dart';

part 'events/anime_posts_events.dart';
part 'states/anime_posts_states.dart';

class AnimePostsBloc extends Bloc<AnimePostsEvent, AnimePostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;

  AnimePostsBloc(this.getAllPostsUseCase) : super(AnimePostsInitialState()) {
    on<FetchAnimePostsEvent>((event, emit) async {
      emit(const FetchingAnimePostsState());
      final result = await getAllPostsUseCase(GetAllPostsParams(event.parameters.page, event.parameters.postsPerPage));
      emit(result.fold<AnimePostsState>((error) {
        event.onErrorCallback?.call();
        return AnimePostsErrorState(error.message);
      }, (fetchedListOfPosts) {
        final listOfPostsToShow = [
          ...event.actualListOfAnimePosts,
          ...fetchedListOfPosts
        ];
        event.onStateCallback?.call(listOfPostsToShow);
        return FetchedAnimePostsState();
      }));
    });
  }
}
