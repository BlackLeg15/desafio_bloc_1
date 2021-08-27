import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/anime_posts_bloc.dart';
import 'home_controller.dart';
import 'widgets/anime_post_card_widget.dart';
import 'widgets/home_loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animes'),
        centerTitle: true,
      ),
      body: BlocConsumer<AnimePostsBloc, AnimePostsState>(
        bloc: controller.animePostsBloc,
        listener: (context, animePostsState) {
          if (animePostsState is AnimePostsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(animePostsState.message)));
          }
        },
        builder: (context, animePostsState) {
          final animePostsList = controller.posts;
          return ListView.builder(
            controller: controller.scrollControllerForPagination,
            itemCount: animePostsList.length + 1,
            itemBuilder: (context, index) {
              if (isTheLastIndexOfTheAnimePostList(index)) {
                return animePostsState is FetchingAnimePostsState ? const HomeLoadingWidget() : const SizedBox();
              }
              return AnimePostCardWidget(
                animePost: animePostsList[index],
                onTap: () => onTapAnimePostCard(animePostsList[index].link),
              );
            },
          );
        },
      ),
    );
  }

  bool isTheLastIndexOfTheAnimePostList(int index) => controller.posts.length == index;

  FutureOr<void> onTapAnimePostCard(String? link) {
    final url = link ?? '';
    return canLaunch(url).then((answer) {
      answer == true ? launch(url) : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Não foi possível abrir o link')));
    }).onError<Exception>((error, stacktrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }
}
