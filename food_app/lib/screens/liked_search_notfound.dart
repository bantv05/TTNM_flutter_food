import 'package:flutter/material.dart';

import 'Home/app_routes.dart';
import 'liked_base.dart';
import 'liked_empty.dart';

class LikedSearchNotFoundScreen extends StatelessWidget {
  const LikedSearchNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LikedScreenShell(
      searchText: 'Banh mi Phuong',
      onBackPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.home01,
          (route) => false,
        );
      },
      onSearchPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const LikedEmptyScreen(),
          ),
        );
      },
      onFilterPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const LikedEmptyScreen(),
          ),
        );
      },
      child: const LikedCenteredLabel(text: 'Khong Tim Thay'),
    );
  }
}
