part of '../blog_posts_bloc.dart';

@immutable
abstract class BlogPostsEvent {
  const BlogPostsEvent();
}

class GetBlogPostsEvent extends BlogPostsEvent {
  const GetBlogPostsEvent();
}
