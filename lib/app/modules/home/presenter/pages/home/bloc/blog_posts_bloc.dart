import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../../../core/constants/fetch_blog_posts_parameters.dart';
import '../../../../domain/entities/blog_post_entity.dart';
import '../../../../domain/params/get_all_posts_params.dart';
import '../../../../domain/use_cases/get_all_posts_use_case/get_posts_use_case.dart';
import 'states/blog_posts_state_freezed.dart';

part 'events/blog_posts_events.dart';
part 'states/blog_posts_states.dart';

class BlogPostsBloc extends Bloc<BlogPostsEvent, BlogPostsStateFreezed> {
  final GetAllPostsUseCase getAllPostsUseCase;

  BlogPostsBloc(this.getAllPostsUseCase) : super(const BlogPostsStateFreezed.initial([])) {
    on<GetBlogPostsEvent>((event, emit) async {
      await state.whenOrNull<Future>(
        initial: (posts, page) => initializeDateFormatting('pt_BR'),
      );
      final currentPage = state.page;
      final pageToBeFetched = currentPage + 1;
      emit(BlogPostsStateFreezed.loading(state.posts, currentPage));
      final result = await getAllPostsUseCase(GetAllPostsParams(pageToBeFetched, FetchBlogPostsParameters.postsPerPage));
      emit(result.fold<BlogPostsStateFreezed>((error) {
        return BlogPostsStateFreezed.exception(state.posts, currentPage, error.message);
      }, (fetchedListOfPosts) {
        final listOfPostsToShow = [
          ...state.posts,
          ...fetchedListOfPosts,
        ];
        return BlogPostsStateFreezed.success(listOfPostsToShow, pageToBeFetched);
      }));
    });
  }
}
