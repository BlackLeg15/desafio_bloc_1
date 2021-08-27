import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../domain/entities/anime_post_entity.dart';

class AnimePostCardWidget extends StatefulWidget {
  final AnimePostEntity animePost;
  final FutureOr<void> Function() onTap;

  const AnimePostCardWidget({Key? key, required this.animePost, required this.onTap}) : super(key: key);

  @override
  _AnimePostCardWidgetState createState() => _AnimePostCardWidgetState();
}

class _AnimePostCardWidgetState extends State<AnimePostCardWidget> {
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
          children: [
            Text(animePost.title ?? 'No title', style: Theme.of(context).textTheme.headline6?.copyWith()),
            const SizedBox(height: 5),
            if (animePostPublicationDate != null) Align(alignment: Alignment.centerLeft, child: Text('Publicado em: ${formatAnimePostPublicationDateToString(animePostPublicationDate)}', style: Theme.of(context).textTheme.bodyText2)),
            const SizedBox(height: 5),
            Text(formatAnimePostDescription(animePost.description) ?? 'No content', style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }

  String formatAnimePostPublicationDateToString(DateTime animePostPublicationDate) => '${animePostPublicationDate.day}/${animePostPublicationDate.month}/${animePostPublicationDate.year}';

  String? formatAnimePostDescription(String? animePostDescription) => animePostDescription?.replaceAll(RegExp(r'<.*?>'), '').replaceAll(RegExp(r'&#46.*'), '...');
}
