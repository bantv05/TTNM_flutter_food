import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class Tracking05Screen extends StatelessWidget {
  const Tracking05Screen({super.key});

  static const routeName = '/tracking/tracking05';

  @override
  Widget build(BuildContext context) {
    return const TrackingFlowScreen(
      stage: TrackingStage.step4,
      nextRouteName: '/tracking/tracking06',
    );
  }
}
