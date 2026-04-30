import 'package:flutter/material.dart';

import 'Home/app_routes.dart';
import 'liked_base.dart';
import 'liked.dart';

class LikedEmptyScreen extends StatelessWidget {
  const LikedEmptyScreen({super.key});

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
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(
            builder: (_) => const LikedScreen(),
          ),
          (route) => false,
        );
      },
      onFilterPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(
            builder: (_) => const LikedScreen(),
          ),
          (route) => false,
        );
      },
      child: const LikedCenteredLabel(text: 'Trong'),
    );
  }
}
