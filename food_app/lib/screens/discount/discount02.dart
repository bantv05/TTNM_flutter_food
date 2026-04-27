import 'package:flutter/material.dart';

import 'discount_models.dart';

class Discount02Screen extends StatelessWidget {
  const Discount02Screen({super.key});

  static const routeName = '/discount/discount02';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 393),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 18, 24, 40),
                    child: Column(
                      children: [
                        _DiscountHeader(
                          title: 'Nhận thêm ưu đãi',
                          onBack: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(height: 28),
                        for (
                          var index = 0;
                          index < kEarnPromotionTasks.length;
                          index++
                        ) ...[
                          _EarnPromotionCard(task: kEarnPromotionTasks[index]),
                          if (index != kEarnPromotionTasks.length - 1)
                            const SizedBox(height: 12),
                        ],
                      ],
                    ),
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

class _EarnPromotionCard extends StatelessWidget {
  const _EarnPromotionCard({required this.task});

  final EarnPromotionTask task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text('Nhiệm vụ "${task.title}" sẽ sớm được hỗ trợ.'),
            ),
          );
      },
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE9EAEB)),
        ),
        child: Row(
          children: [
            Icon(task.icon, size: 24, color: const Color(0xFFF6BE57)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                task.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0D1217),
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 36,
              color: Color(0xFFBABDC1),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscountHeader extends StatelessWidget {
  const _DiscountHeader({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BackButton(onTap: onBack),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D1217),
            ),
          ),
        ),
        const SizedBox(width: 42, height: 42),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F0D0A2C),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF0D1217),
            size: 24,
          ),
        ),
      ),
    );
  }
}
