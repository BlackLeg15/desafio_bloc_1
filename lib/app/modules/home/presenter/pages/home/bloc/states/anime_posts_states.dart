part of '../anime_posts_bloc.dart';

@immutable
abstract class BlogPostsState extends Equatable {
  final int page;
  final int postsPerPage;
  final List<BlogPostEntity> animePosts;

  const BlogPostsState(this.animePosts, this.page, this.postsPerPage);

  @override
  List<Object?> get props => [
        page,
        postsPerPage,
        animePosts
      ];
}

class BlogPostsInitialState extends BlogPostsState {
  BlogPostsInitialState(List<BlogPostEntity> animePosts, {int? initialPage}) : super(animePosts, initialPage ?? FetchBlogPostsParameters.initialPage, FetchBlogPostsParameters.postsPerPage);
}

class BlogPostsLoadingState extends BlogPostsState {
  BlogPostsLoadingState(List<BlogPostEntity> animePosts, int page) : super(animePosts, page, FetchBlogPostsParameters.postsPerPage);
}

class BlogPostsSuccessState extends BlogPostsState {
  BlogPostsSuccessState(List<BlogPostEntity> animePosts, int page) : super(animePosts, page, FetchBlogPostsParameters.postsPerPage);
}

class BlogPostsErrorState extends BlogPostsState {
  final String message;

  BlogPostsErrorState(this.message, List<BlogPostEntity> animePosts, int page) : super(animePosts, page, FetchBlogPostsParameters.postsPerPage);

  @override
  List<Object?> get props => super.props
    ..addAll([
      message
    ]);
}
