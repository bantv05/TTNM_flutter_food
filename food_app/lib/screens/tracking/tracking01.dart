import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class Tracking01Screen extends StatelessWidget {
  const Tracking01Screen({super.key});

  static const routeName = '/tracking/tracking01';

  @override
  Widget build(BuildContext context) {
    return const TrackingFlowScreen(
      stage: TrackingStage.searching,
      nextRouteName: '/tracking/tracking02',
    );
  }
}
