import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class Tracking06Screen extends StatelessWidget {
  const Tracking06Screen({super.key});

  static const routeName = '/tracking/tracking06';

  @override
  Widget build(BuildContext context) {
    return const TrackingFlowScreen(stage: TrackingStage.success);
  }
}
