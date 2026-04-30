import 'package:flutter/material.dart';

import 'Home/app_routes.dart';
import 'liked_base.dart';
import 'liked_search.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LikedScreenShell(
      searchText: '',
      onBackPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.home01,
          (route) => false,
        );
      },
      onSearchPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const LikedSearchScreen(),
          ),
        );
      },
      onFilterPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const LikedSearchScreen(),
          ),
        );
      },
      child: const LikedGrid(items: kLikedFoods),
    );
  }
}
