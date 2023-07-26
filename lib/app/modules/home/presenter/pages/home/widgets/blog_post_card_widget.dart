import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

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
    if (blogPost.publicationDate != null) blogPostPublicationDate = DateTime.tryParse(blogPost.publicationDate!);
    final blogPostTitle = blogPost.title == null || blogPost.title!.isEmpty ? 'N/A' : blogPost.title!;

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
            Text(blogPostTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5),
            Text(formatBlogPostPublicationDateToString(blogPostPublicationDate), style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 5),
            Text(formatBlogPostDescription(blogPost.description), style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  String formatBlogPostPublicationDateToString(DateTime? blogPostPublicationDate) {
    if (blogPostPublicationDate == null) {
      return 'N/A';
    }

    final date = DateFormat.yMMMMd('pt_BR').format(blogPostPublicationDate);
    return 'Publicado em $date';
  }

  String formatBlogPostDescription(String? blogPostDescription) {
    if (blogPostDescription == null || blogPostDescription.isEmpty) {
      return 'N/A';
    }
    return blogPostDescription.replaceAll(RegExp(r'<.*?>'), '').replaceAll(RegExp(r'&#46.*'), '...');
  }
}

@widgetbook.UseCase(
  name: 'Fullfilled',
  type: BlogPostCardWidget,
)
BlogPostCardWidget fullfilledCard(BuildContext context) {
  const post = BlogPostEntity(
    title: 'Oda is back',
    description: 'Oda is finally back from his surgery',
    link: 'https://www.google.com.br',
    publicationDate: '2023-07-15',
  );
  return BlogPostCardWidget(blogPost: post, onTap: () {});
}

@widgetbook.UseCase(
  name: 'Empty',
  type: BlogPostCardWidget,
)
BlogPostCardWidget emptyCard(BuildContext context) {
  const post = BlogPostEntity(
    title: '',
    description: '',
    link: '',
    publicationDate: '',
  );
  return BlogPostCardWidget(blogPost: post, onTap: () {});
}
