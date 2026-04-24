import 'package:flutter/material.dart';

import 'hoantat.dart';
import 'splash_shell.dart';

class DangTaiScreen extends StatefulWidget {
  const DangTaiScreen({super.key});

  @override
  State<DangTaiScreen> createState() => _DangTaiScreenState();
}

class _DangTaiScreenState extends State<DangTaiScreen>
    with DelayedNavigation<DangTaiScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfter(
      delay: const Duration(milliseconds: 1800),
      builder: (_) => const HoanTatScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashShell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 24, 18, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 8),
            const FlashLogo(size: 86),
            const Spacer(flex: 7),
            const Text(
              'An ngon sieu toc, ship tan tay ngay.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 18),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.35, end: 0.88),
              duration: const Duration(milliseconds: 1400),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) {
                return BottomProgressBar(value: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
