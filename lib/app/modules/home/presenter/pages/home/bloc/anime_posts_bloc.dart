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
      final currentPage = state.page;
      final pageToBeFetched = currentPage + 1;
      emit(FetchingAnimePostsState(state.animePosts, currentPage));
      final result = await getAllPostsUseCase(GetAllPostsParams(pageToBeFetched, FetchAnimePostsParameters.postsPerPage));
      emit(result.fold<AnimePostsState>((error) {
        return AnimePostsErrorState(error.message, state.animePosts, currentPage);
      }, (fetchedListOfPosts) {
        final listOfPostsToShow = [
          ...state.animePosts,
          ...fetchedListOfPosts
        ];
        return FetchedAnimePostsState(listOfPostsToShow, pageToBeFetched);
      }));
    });
  }
}
