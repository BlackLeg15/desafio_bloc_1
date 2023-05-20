import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../domain/entities/anime_post_entity.dart';

class BlogPostCardWidget extends StatefulWidget {
  final BlogPostEntity animePost;
  final FutureOr<void> Function() onTap;

  const BlogPostCardWidget({Key? key, required this.animePost, required this.onTap}) : super(key: key);

  @override
  createState() => _BlogPostCardWidgetState();
}

class _BlogPostCardWidgetState extends State<BlogPostCardWidget> {
  var lockButtonTapAction = false;

  @override
  Widget build(BuildContext context) {
    final animePost = widget.animePost;
    DateTime? animePostPublicationDate;
    if (animePost.publicationDate != null) animePostPublicationDate = DateTime.parse(animePost.publicationDate!);

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
            Text(animePost.title ?? 'No title', style: Theme.of(context).textTheme.titleLarge?.copyWith()),
            const SizedBox(height: 5),
            if (animePostPublicationDate != null) Text('Publicado em: ${formatBlogPostPublicationDateToString(animePostPublicationDate)}', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 5),
            Text(formatBlogPostDescription(animePost.description) ?? 'No content', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  String formatBlogPostPublicationDateToString(DateTime animePostPublicationDate) => '${animePostPublicationDate.day}/${animePostPublicationDate.month}/${animePostPublicationDate.year}';

  String? formatBlogPostDescription(String? animePostDescription) => animePostDescription?.replaceAll(RegExp(r'<.*?>'), '').replaceAll(RegExp(r'&#46.*'), '...');
}
