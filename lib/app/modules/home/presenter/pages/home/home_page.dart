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
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lockUpdatePostList = false;
  late final HomeController controller;
  late final ScrollController scrollControllerForPagination;

  @override
  void initState() {
    super.initState();
    initHomePage();
  }

  void initHomePage() {
    getHomeControllerInstance();
    configPagination();
    fetchAnimePosts();
  }

  void getHomeControllerInstance() {
    controller = Modular.get();
  }

  void configPagination() {
    scrollControllerForPagination = ScrollController();
    scrollControllerForPagination.addListener(() {
      if (canFetch) {
        fetchAnimePosts();
      }
    });
  }

  bool get canFetch =>
      scrollControllerForPagination.offset >= scrollControllerForPagination.position.maxScrollExtent - 100 && !lockUpdatePostList;

  void fetchAnimePosts() {
    lockUpdatePostList = true;
    controller.fetchAnimePosts();
  }

  void onFinishFetchPosts() {
    lockUpdatePostList = false;
  }

  @override
  void dispose() {
    scrollControllerForPagination.dispose();
    super.dispose();
  }

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
          if (animePostsState is AnimePostsSuccessState) {
            onFinishFetchPosts();
          }
        },
        builder: (context, animePostsState) {
          final animePostsList = controller.posts;
          if (animePostsList.isEmpty) {
            return const HomeLoadingWidget();
          }
          return ListView.builder(
            controller: scrollControllerForPagination,
            itemCount: animePostsList.length + 1,
            itemBuilder: (context, index) {
              if (isTheLastIndexOfTheAnimePostList(index)) {
                return animePostsState is AnimePostsLoadingState ? const HomeLoadingWidget() : const SizedBox();
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

  Future<void> onTapAnimePostCard(String? link) async {
    if (link == null || link.isEmpty) return onAnimePostCardLinkNullOrEmpty();
    final url = Uri.parse(link);
    return canLaunchUrl(url).then((answer) {
      answer == true ? launchUrl(url) : onAnimePostCardLinkNullOrEmpty();
    }).onError<Exception>((error, stacktrace) {
      onAnimePostCardLinkNullOrEmpty(specificError: error.toString());
    });
  }

  void onAnimePostCardLinkNullOrEmpty({String? specificError}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(specificError ?? 'Não foi possível abrir o link')));
  }
}
