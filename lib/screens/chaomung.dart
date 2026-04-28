import 'package:flutter/material.dart';

import 'introduce_step1.dart';
import 'splash_shell.dart';

class ChaoMungScreen extends StatelessWidget {
  const ChaoMungScreen({
    super.key,
    this.openIntroduceOnTap = true,
  });

  final bool openIntroduceOnTap;

  @override
  Widget build(BuildContext context) {
    return SplashShell(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            kWelcomeAsset,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: const Color(0xFF6D3411));
            },
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x12000000), Color(0x33000000), Color(0xB8000000)],
                stops: [0.25, 0.6, 1],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'FlashFood',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (!openIntroduceOnTap) {
                    return;
                  }
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (_) => const IntroduceStep1Screen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
