import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/blog_posts_bloc.dart';
import 'home_controller.dart';
import 'widgets/blog_post_card_widget.dart';
import 'widgets/home_loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    fetchBlogPosts();
  }

  void getHomeControllerInstance() {
    controller = Modular.get();
  }

  void configPagination() {
    scrollControllerForPagination = ScrollController();
    scrollControllerForPagination.addListener(() {
      if (canFetch) {
        fetchBlogPosts();
      }
    });
  }

  bool get canFetch =>
      scrollControllerForPagination.offset >= scrollControllerForPagination.position.maxScrollExtent - 100 && !lockUpdatePostList;

  void fetchBlogPosts() {
    lockUpdatePostList = true;
    controller.fetchBlogPosts();
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
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: BlocConsumer<BlogPostsBloc, BlogPostsState>(
        bloc: controller.blogPostsBloc,
        listener: (context, blogPostsState) {
          if (blogPostsState is BlogPostsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(blogPostsState.message)));
            if (blogPostsState.blogPosts.isEmpty) {
              onFinishFetchPosts();
            }
          }
          if (blogPostsState is BlogPostsSuccessState) {
            onFinishFetchPosts();
          }
        },
        builder: (context, blogPostsState) {
          final blogPostsList = controller.posts;
          if (blogPostsList.isEmpty) {
            if (blogPostsState is BlogPostsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      blogPostsState.message,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: fetchBlogPosts,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Tentar novamente'),
                    )
                  ],
                ),
              );
            }
            return const HomeLoadingWidget();
          }
          return ListView.builder(
            controller: scrollControllerForPagination,
            itemCount: blogPostsList.length + 1,
            itemBuilder: (context, index) {
              if (isTheLastIndexOfTheBlogPostList(index)) {
                return blogPostsState is BlogPostsLoadingState ? const HomeLoadingWidget() : const SizedBox();
              }
              return BlogPostCardWidget(
                key: Key(blogPostsList[index].id!),
                blogPost: blogPostsList[index],
                onTap: () => onTapBlogPostCard(blogPostsList[index].link),
              );
            },
          );
        },
      ),
    );
  }

  bool isTheLastIndexOfTheBlogPostList(int index) => controller.posts.length == index;

  Future<void> onTapBlogPostCard(String? link) async {
    if (link == null || link.isEmpty) return onBlogPostCardLinkNullOrEmpty();
    final url = Uri.parse(link);
    return canLaunchUrl(url).then((answer) {
      answer == true ? launchUrl(url) : onBlogPostCardLinkNullOrEmpty();
    }).onError<Exception>((error, stacktrace) {
      onBlogPostCardLinkNullOrEmpty(specificError: error.toString());
    });
  }

  void onBlogPostCardLinkNullOrEmpty({String? specificError}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(specificError ?? 'Não foi possível abrir o link')));
  }
}
