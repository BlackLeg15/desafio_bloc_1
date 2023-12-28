

import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_posts_events.freezed.dart';

@freezed
sealed class BlogPostsEvent with _$BlogPostsEvent {
  const factory BlogPostsEvent.get() = Get;
}
