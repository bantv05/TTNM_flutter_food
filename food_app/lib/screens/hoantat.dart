import 'package:flutter/material.dart';

import 'chaomung.dart';
import 'splash_shell.dart';

class HoanTatScreen extends StatefulWidget {
  const HoanTatScreen({super.key});

  @override
  State<HoanTatScreen> createState() => _HoanTatScreenState();
}

class _HoanTatScreenState extends State<HoanTatScreen>
    with DelayedNavigation<HoanTatScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfter(
      delay: const Duration(milliseconds: 1400),
      builder: (_) => const ChaoMungScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashShell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 24, 18, 16),
        child: Column(
          children: [
            Spacer(flex: 7),
            FlashLogo(size: 96),
            SizedBox(height: 26),
            Text(
              'FlashFood',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Version 2.1.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(flex: 6),
            Text(
              'An ngon sieu toc, ship tan tay ngay.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 18),
            BottomProgressBar(value: 1),
          ],
        ),
      ),
    );
  }
}
