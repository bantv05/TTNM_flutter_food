import 'package:flutter/material.dart';

import 'dangtai.dart';
import 'splash_shell.dart';

class BatDauScreen extends StatefulWidget {
  const BatDauScreen({super.key});

  @override
  State<BatDauScreen> createState() => _BatDauScreenState();
}

class _BatDauScreenState extends State<BatDauScreen>
    with DelayedNavigation<BatDauScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfter(
      delay: const Duration(milliseconds: 1200),
      builder: (_) => const DangTaiScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashShell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Spacer(),
            BottomProgressBar(
              value: 1,
              fillColor: Colors.white,
              trackColor: Color(0x66FFFFFF),
            ),
          ],
        ),
      ),
    );
  }
}
