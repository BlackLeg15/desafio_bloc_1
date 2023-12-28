import '../../../domain/entities/blog_post_entity.dart';
import 'bloc/blog_posts_bloc.dart';
import 'bloc/events/blog_posts_events.dart';

class HomeController {
  final BlogPostsBloc blogPostsBloc;
  List<BlogPostEntity> get posts => blogPostsBloc.state.posts;

  const HomeController(this.blogPostsBloc);

  void fetchBlogPosts() {
    blogPostsBloc.add(const BlogPostsEvent.get());
  }
}
