import 'package:flutter/material.dart';

import 'Home/app_routes.dart';
import 'liked_base.dart';
import 'liked_search_notfound.dart';

class LikedSearchScreen extends StatelessWidget {
  const LikedSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LikedScreenShell(
      searchText: 'Khoai tay lac pho mai',
      onBackPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.home01,
          (route) => false,
        );
      },
      onSearchPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const LikedSearchNotFoundScreen(),
          ),
        );
      },
      onFilterPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const LikedSearchNotFoundScreen(),
          ),
        );
      },
      child: LikedGrid(items: [kLikedFoods[3]]),
    );
  }
}
