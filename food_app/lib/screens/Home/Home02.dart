import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'home_design.dart';

class Home02 extends StatelessWidget {
  const Home02({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDesign(
      titleLine: 'Giao đến -> Nhà riêng',
      subtitleLine: '570 Núi Thành, Hòa Cường, Đà Nẵng',
      showProfileAvatar: true,
      onDealTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home01,
        (route) => false,
      ),
    );
  }
}
