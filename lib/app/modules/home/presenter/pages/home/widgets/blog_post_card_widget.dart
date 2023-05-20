import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../domain/entities/blog_post_entity.dart';

class BlogPostCardWidget extends StatefulWidget {
  final BlogPostEntity blogPost;
  final FutureOr<void> Function() onTap;

  const BlogPostCardWidget({Key? key, required this.blogPost, required this.onTap}) : super(key: key);

  @override
  createState() => _BlogPostCardWidgetState();
}

class _BlogPostCardWidgetState extends State<BlogPostCardWidget> {
  var lockButtonTapAction = false;

  @override
  Widget build(BuildContext context) {
    final blogPost = widget.blogPost;
    DateTime? blogPostPublicationDate;
    if (blogPost.publicationDate != null) blogPostPublicationDate = DateTime.parse(blogPost.publicationDate!);

    return InkWell(
      onTap: () async {
        if (lockButtonTapAction) return;
        lockButtonTapAction = true;
        await widget.onTap();
        lockButtonTapAction = false;
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(blogPost.title ?? 'No title', style: Theme.of(context).textTheme.titleLarge?.copyWith()),
            const SizedBox(height: 5),
            if (blogPostPublicationDate != null) Text('Publicado em: ${formatBlogPostPublicationDateToString(blogPostPublicationDate)}', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 5),
            Text(formatBlogPostDescription(blogPost.description) ?? 'No content', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  String formatBlogPostPublicationDateToString(DateTime blogPostPublicationDate) => '${blogPostPublicationDate.day}/${blogPostPublicationDate.month}/${blogPostPublicationDate.year}';

  String? formatBlogPostDescription(String? blogPostDescription) => blogPostDescription?.replaceAll(RegExp(r'<.*?>'), '').replaceAll(RegExp(r'&#46.*'), '...');
}
