part of '../blog_posts_bloc.dart';

@immutable
abstract class BlogPostsState extends Equatable {
  final int page;
  final int postsPerPage;
  final List<BlogPostEntity> blogPosts;

  const BlogPostsState(this.blogPosts, this.page, this.postsPerPage);

  @override
  List<Object?> get props => [
        page,
        postsPerPage,
        blogPosts
      ];
}

class BlogPostsInitialState extends BlogPostsState {
  BlogPostsInitialState(List<BlogPostEntity> blogPosts, {int? initialPage}) : super(blogPosts, initialPage ?? FetchBlogPostsParameters.initialPage, FetchBlogPostsParameters.postsPerPage);
}

class BlogPostsLoadingState extends BlogPostsState {
  BlogPostsLoadingState(List<BlogPostEntity> blogPosts, int page) : super(blogPosts, page, FetchBlogPostsParameters.postsPerPage);
}

class BlogPostsSuccessState extends BlogPostsState {
  BlogPostsSuccessState(List<BlogPostEntity> blogPosts, int page) : super(blogPosts, page, FetchBlogPostsParameters.postsPerPage);
}

class BlogPostsErrorState extends BlogPostsState {
  final String message;

  BlogPostsErrorState(this.message, List<BlogPostEntity> blogPosts, int page) : super(blogPosts, page, FetchBlogPostsParameters.postsPerPage);

  @override
  List<Object?> get props => super.props
    ..addAll([
      message
    ]);
}
