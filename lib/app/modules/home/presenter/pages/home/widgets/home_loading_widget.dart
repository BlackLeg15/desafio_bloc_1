import 'package:flutter/material.dart';

import '../../../../../../core/constants/validation_keys.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        key: const Key(ValidationKeys.homeLoading),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: const CircularProgressIndicator.adaptive(),
        ),
      );
}