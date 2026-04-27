import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class Tracking03Screen extends StatelessWidget {
  const Tracking03Screen({super.key});

  static const routeName = '/tracking/tracking03';

  @override
  Widget build(BuildContext context) {
    return const TrackingFlowScreen(
      stage: TrackingStage.step2,
      nextRouteName: '/tracking/tracking04',
    );
  }
}
