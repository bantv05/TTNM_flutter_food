import 'package:flutter/material.dart';

import 'introduce_base.dart';
import 'introduce_step2.dart';
import 'introduce_step4.dart';

class IntroduceStep1Screen extends StatelessWidget {
  const IntroduceStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroduceScreenShell(
      assetPath: kIntroduceFoodAsset,
      title: 'Thien Duong Mon Ngon',
      description:
          'Hang ngan mon an tu A den A, du lanh sinh song den thit nuong, bung no vi cac lua chon hap dan.',
      currentStep: 0,
      totalSteps: 4,
      primaryLabel: 'Tiep theo',
      onPrimaryPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const IntroduceStep2Screen(),
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
