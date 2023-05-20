import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/fetch_blog_posts_parameters.dart';
import '../../../../domain/entities/blog_post_entity.dart';
import '../../../../domain/params/get_all_posts_params.dart';
import '../../../../domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';

part 'events/blog_posts_events.dart';
part 'states/blog_posts_states.dart';

class BlogPostsBloc extends Bloc<BlogPostsEvent, BlogPostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;

  BlogPostsBloc(this.getAllPostsUseCase) : super(BlogPostsInitialState(const [])) {
    on<GetBlogPostsEvent>((event, emit) async {
      final currentPage = state.page;
      final pageToBeFetched = currentPage + 1;
      emit(BlogPostsLoadingState(state.blogPosts, currentPage));
      final result = await getAllPostsUseCase(GetAllPostsParams(pageToBeFetched, FetchBlogPostsParameters.postsPerPage));
      emit(result.fold<BlogPostsState>((error) {
        return BlogPostsErrorState(error.message, state.blogPosts, currentPage);
      }, (fetchedListOfPosts) {
        final listOfPostsToShow = [
          ...state.blogPosts,
          ...fetchedListOfPosts
        ];
        return BlogPostsSuccessState(listOfPostsToShow, pageToBeFetched);
      }));
    });
  }
}
