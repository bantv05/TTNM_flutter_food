import 'package:flutter/material.dart';

import 'cancelorder02.dart';
import 'cancelorder4.dart';
import 'cancelorder_shared.dart';

class CancelOrder03Screen extends StatefulWidget {
  const CancelOrder03Screen({super.key});

  @override
  State<CancelOrder03Screen> createState() => _CancelOrder03ScreenState();
}

class _CancelOrder03ScreenState extends State<CancelOrder03Screen> {
  final _controller = TextEditingController();

  bool get _canSubmit => _controller.text.trim().isNotEmpty;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CancelOrderShell(
      selectedIndex: cancelOrderReasons.length - 1,
      onBack: () => Navigator.of(context).pop(),
      onReasonTap: (index) {
        if (cancelOrderReasons[index].requiresText) {
          return;
        }

        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => CancelOrder02Screen(selectedIndex: index),
          ),
        );
      },
      otherReasonField: CancelOtherReasonField(
        controller: _controller,
        onChanged: (_) => setState(() {}),
      ),
      submitEnabled: _canSubmit,
      onSubmit: _canSubmit
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => CancelOrder04Screen(
                    selectedIndex: cancelOrderReasons.length - 1,
                    customReason: _controller.text.trim(),
                  ),
                ),
              );
            }
          : null,
    );
  }
}
