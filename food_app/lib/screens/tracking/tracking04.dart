import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class Tracking04Screen extends StatelessWidget {
  const Tracking04Screen({super.key});

  static const routeName = '/tracking/tracking04';

  @override
  Widget build(BuildContext context) {
    return const TrackingFlowScreen(
      stage: TrackingStage.step3,
      nextRouteName: '/tracking/tracking05',
    );
  }
}
