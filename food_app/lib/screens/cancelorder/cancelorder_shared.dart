import 'package:flutter/material.dart';

class CancelOrderReason {
  const CancelOrderReason({
    required this.label,
    this.requiresText = false,
  });

  final String label;
  final bool requiresText;
}

const cancelOrderReasons = <CancelOrderReason>[
  CancelOrderReason(label: 'Đổi ý, không muốn mua nữa'),
  CancelOrderReason(label: 'Tìm thấy giá tốt hơn ở nơi khác'),
  CancelOrderReason(label: 'Giao hàng chậm trễ'),
  CancelOrderReason(label: 'Chọn nhầm món/sản phẩm'),
  CancelOrderReason(label: 'Đặt trùng đơn'),
  CancelOrderReason(label: 'Tôi không thể nhận hàng vào lúc này'),
  CancelOrderReason(label: 'Lý do khác', requiresText: true),
];

class CancelOrderShell extends StatelessWidget {
  const CancelOrderShell({
    super.key,
    required this.selectedIndex,
    required this.onBack,
    required this.onReasonTap,
    required this.submitEnabled,
    required this.onSubmit,
    this.otherReasonField,
    this.overlay,
  });

  final int? selectedIndex;
  final VoidCallback onBack;
  final ValueChanged<int> onReasonTap;
  final bool submitEnabled;
  final VoidCallback? onSubmit;
  final Widget? otherReasonField;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 30,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                              child: Column(
                                children: [
                                  CancelOrderHeader(onBack: onBack),
                                  const SizedBox(height: 20),
                                  for (var i = 0; i < cancelOrderReasons.length; i++) ...[
                                    CancelReasonTile(
                                      label: cancelOrderReasons[i].label,
                                      selected: selectedIndex == i,
                                      onTap: () => onReasonTap(i),
                                    ),
                                    if (i == cancelOrderReasons.length - 1 &&
                                        selectedIndex == i &&
                                        otherReasonField != null) ...[
                                      const SizedBox(height: 10),
                                      otherReasonField!,
                                    ],
                                    if (i != cancelOrderReasons.length - 1) const SizedBox(height: 10),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
                            child: CancelSubmitButton(
                              enabled: submitEnabled,
                              onTap: onSubmit,
                            ),
                          ),
                        ],
                      ),
                      if (overlay != null) Positioned.fill(child: overlay!),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CancelOrderHeader extends StatelessWidget {
  const CancelOrderHeader({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: const Color(0xFFFDFDFD),
          shape: const CircleBorder(),
          elevation: 2,
          shadowColor: const Color(0x12000000),
          child: InkWell(
            onTap: onBack,
            customBorder: const CircleBorder(),
            child: const SizedBox(
              width: 44,
              height: 44,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF2A2A2A),
                size: 20,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Hủy đơn hàng',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }
}

class CancelReasonTile extends StatelessWidget {
  const CancelReasonTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE8E8E8)),
          ),
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? const Color(0xFFFF6F4D) : const Color(0xFFC5CBD3),
                    width: 1.2,
                  ),
                ),
                child: selected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF6F4D),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CancelOtherReasonField extends StatelessWidget {
  const CancelOtherReasonField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Nhập lý do khác...',
          hintStyle: TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        ),
      ),
    );
  }
}

class CancelSubmitButton extends StatelessWidget {
  const CancelSubmitButton({
    super.key,
    required this.enabled,
    required this.onTap,
  });

  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = enabled ? const Color(0xFFFF9800) : const Color(0xFFFDD48E);

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: enabled ? onTap : null,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Text(
          'Gửi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class CancelNotificationOverlay extends StatelessWidget {
  const CancelNotificationOverlay({
    super.key,
    required this.onOk,
  });

  final VoidCallback onOk;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x9C000000),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 320),
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x15000000),
              blurRadius: 24,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: onOk,
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.close_rounded,
                      color: Color(0xFFD2D2D2),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Đơn hàng của bạn đã được hủy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1F1F1F), width: 3),
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 52,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Đơn hàng đã hủy thành công. Rất tiếc vì điều này! 😔',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Chúng tôi luôn nỗ lực cải thiện dịch vụ và hy vọng sẽ được phục vụ bạn tốt hơn trong lần sau!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF808080),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: onOk,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
