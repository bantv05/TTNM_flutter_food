import 'package:flutter/material.dart';

import 'introduce_base.dart';
import 'introduce_step3.dart';
import 'introduce_step4.dart';

class IntroduceStep2Screen extends StatelessWidget {
  const IntroduceStep2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroduceScreenShell(
      assetPath: kIntroduceDeliveryAsset,
      title: 'Nong Hoi Trong 10 Phut',
      description:
          'Toc do giao hang "than toc", boi mon tay de doc bua ngon lanh ve chi trong chop mat.',
      currentStep: 1,
      totalSteps: 4,
      primaryLabel: 'Tiep theo',
      onPrimaryPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const IntroduceStep3Screen(),
          ),
        );
      },
      onSkipPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const IntroduceStep4Screen(),
          ),
        );
      },
    );
  }
}
