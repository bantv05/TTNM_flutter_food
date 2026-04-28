import 'package:flutter/material.dart';

import 'introduce_base.dart';
import 'introduce_step4.dart';

class IntroduceStep3Screen extends StatelessWidget {
  const IntroduceStep3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroduceScreenShell(
      assetPath: kIntroduceTrackAsset,
      title: 'Theo Doi Shipper',
      description:
          'Cap nhat lo trinh don hang theo thoi gian thuc. Ban biet tai xe dang o dau va mon ngon sap toi.',
      currentStep: 2,
      totalSteps: 4,
      primaryLabel: 'Tiep theo',
      onPrimaryPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const IntroduceStep4Screen(),
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
