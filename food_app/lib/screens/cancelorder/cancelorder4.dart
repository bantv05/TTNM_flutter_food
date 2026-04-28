import 'package:flutter/material.dart';

import 'cancelorder_shared.dart';

class CancelOrder04Screen extends StatelessWidget {
  const CancelOrder04Screen({
    super.key,
    this.selectedIndex,
    this.customReason,
  });

  final int? selectedIndex;
  final String? customReason;

  @override
  Widget build(BuildContext context) {
    return CancelOrderShell(
      selectedIndex: selectedIndex,
      onBack: () => Navigator.of(context).pop(),
      onReasonTap: (_) {},
      submitEnabled: false,
      onSubmit: null,
      otherReasonField: selectedIndex == cancelOrderReasons.length - 1
          ? IgnorePointer(
              child: Opacity(
                opacity: 0.85,
                child: Container(
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    customReason?.isNotEmpty == true ? customReason! : 'Nhập lý do khác...',
                    style: TextStyle(
                      color: customReason?.isNotEmpty == true
                          ? const Color(0xFF4A4A4A)
                          : const Color(0xFFB7B7B7),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          : null,
      overlay: CancelNotificationOverlay(
        onOk: () => Navigator.of(context).popUntil((route) => route.isFirst),
      ),
    );
  }
}
