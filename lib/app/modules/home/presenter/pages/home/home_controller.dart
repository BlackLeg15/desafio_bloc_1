import '../../../domain/entities/blog_post_entity.dart';
import 'bloc/blog_posts_bloc.dart';

class HomeController {
  final BlogPostsBloc blogPostsBloc;
  List<BlogPostEntity> get posts => blogPostsBloc.state.posts;

  const HomeController(this.blogPostsBloc);

  void fetchBlogPosts() {
    blogPostsBloc.add(const GetBlogPostsEvent());
  }
}
