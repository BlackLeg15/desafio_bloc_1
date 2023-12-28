import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../core/constants/fetch_blog_posts_parameters.dart';
import '../../../../../domain/entities/blog_post_entity.dart';

part 'blog_posts_state.freezed.dart';

@freezed
sealed class BlogPostsStateFreezed with _$BlogPostsStateFreezed {
  const factory BlogPostsStateFreezed.initial(List<BlogPostEntity> posts, {@Default(FetchBlogPostsParameters.initialPage) int page}) = Initial;
  const factory BlogPostsStateFreezed.loading(List<BlogPostEntity> posts, int page) = Loading;
  const factory BlogPostsStateFreezed.exception(List<BlogPostEntity> posts, int page, String message) = Exception;
  const factory BlogPostsStateFreezed.success(List<BlogPostEntity> posts, int page) = Success;
}
