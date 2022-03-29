import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/fetch_anime_posts_parameters.dart';
import '../../../../domain/entities/anime_post_entity.dart';
import '../../../../domain/params/get_all_posts_params.dart';
import '../../../../domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';

part 'events/anime_posts_events.dart';
part 'states/anime_posts_states.dart';

class AnimePostsBloc extends Bloc<AnimePostsEvent, AnimePostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;

  AnimePostsBloc(this.getAllPostsUseCase) : super(AnimePostsInitialState(const [])) {
    on<FetchAnimePostsEvent>((event, emit) async {
      emit(FetchingAnimePostsState(state.animePosts, state.page + 1));
      final result = await getAllPostsUseCase(GetAllPostsParams(state.page, FetchAnimePostsParameters.postsPerPage));
      emit(result.fold<AnimePostsState>((error) {
        event.onErrorCallback?.call();
        return AnimePostsErrorState(error.message, state.animePosts, state.page);
      }, (fetchedListOfPosts) {
        final listOfPostsToShow = [
          ...state.animePosts,
          ...fetchedListOfPosts
        ];
        event.onStateCallback?.call();
        return FetchedAnimePostsState(listOfPostsToShow, state.page);
      }));
    });
  }
}
