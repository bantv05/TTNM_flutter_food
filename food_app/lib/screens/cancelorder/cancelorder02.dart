import 'package:flutter/material.dart';

import 'cancelorder03.dart';
import 'cancelorder4.dart';
import 'cancelorder_shared.dart';

class CancelOrder02Screen extends StatelessWidget {
  const CancelOrder02Screen({
    super.key,
    this.selectedIndex = 4,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return CancelOrderShell(
      selectedIndex: selectedIndex,
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

        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => CancelOrder02Screen(selectedIndex: index),
          ),
        );
      },
      submitEnabled: true,
      onSubmit: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => CancelOrder04Screen(selectedIndex: selectedIndex),
          ),
        );
      },
    );
  }
}
