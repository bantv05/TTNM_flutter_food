import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'home_design.dart';

class Home01 extends StatelessWidget {
  const Home01({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeDesign(
      titleLine: 'Chọn địa điểm của bạn',
      subtitleLine: '',
      showProfileAvatar: false,
      onDealTap: () => Navigator.pushNamed(context, AppRoutes.home02),
    );
  }
}
