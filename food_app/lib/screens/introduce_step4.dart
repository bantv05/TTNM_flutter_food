import 'package:flutter/material.dart';

import 'batdau.dart';
import 'introduce_base.dart';

class IntroduceStep4Screen extends StatelessWidget {
  const IntroduceStep4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroduceScreenShell(
      assetPath: kIntroduceVoucherAsset,
      title: 'San Deal "Cuc Da"',
      description:
          'Nhan ngay uu dai gia tri toi 50% cho don hang dau tien, ap dung khong chi trong mot giay.',
      currentStep: 3,
      totalSteps: 4,
      primaryLabel: 'Di toi ngay',
      showSkipFooter: false,
      onPrimaryPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(
            builder: (_) => const BatDauScreen(),
          ),
          (route) => false,
        );
      },
    );
  }
}
