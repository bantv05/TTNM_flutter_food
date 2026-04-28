import 'package:flutter/material.dart';

import 'cancelorder02.dart';
import 'cancelorder03.dart';
import 'cancelorder_shared.dart';

class CancelOrder01Screen extends StatelessWidget {
  const CancelOrder01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CancelOrderShell(
      selectedIndex: null,
      onBack: () => Navigator.of(context).pop(),
      onReasonTap: (index) {
        if (cancelOrderReasons[index].requiresText) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const CancelOrder03Screen(),
            ),
          );
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => CancelOrder02Screen(selectedIndex: index),
          ),
        );
      },
      submitEnabled: false,
      onSubmit: null,
    );
  }
}
