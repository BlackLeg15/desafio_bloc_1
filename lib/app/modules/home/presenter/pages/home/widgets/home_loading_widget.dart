import 'package:flutter/material.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: Container(margin: const EdgeInsets.only(bottom: 16), child: const CircularProgressIndicator.adaptive()));
}