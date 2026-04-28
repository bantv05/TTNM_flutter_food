import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class Tracking02Screen extends StatelessWidget {
  const Tracking02Screen({super.key});

  static const routeName = '/tracking/tracking02';

  @override
  Widget build(BuildContext context) {
    return const TrackingFlowScreen(
      stage: TrackingStage.step1,
      nextRouteName: '/tracking/tracking03',
    );
  }
}
