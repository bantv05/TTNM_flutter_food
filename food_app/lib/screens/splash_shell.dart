import 'dart:async';

import 'package:flutter/material.dart';

const Color kFlashGold = Color(0xFFF3C46A);
const Color kFlashOrange = Color(0xFFF29924);
const Color kFlashBrown = Color(0xFF553115);
const String kLogoAsset = 'assets/images/logo1.png';
const String kWelcomeAsset = 'assets/images/hinh1.png';

mixin DelayedNavigation<T extends StatefulWidget> on State<T> {
  Timer? _timer;

  void navigateAfter({
    required Duration delay,
    required WidgetBuilder builder,
  }) {
    _timer?.cancel();
    _timer = Timer(delay, () {
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(
        PageRouteBuilder<void>(
          transitionDuration: const Duration(milliseconds: 450),
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );
            return FadeTransition(
              opacity: curved,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.06, 0),
                  end: Offset.zero,
                ).animate(curved),
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class SplashShell extends StatelessWidget {
  const SplashShell({
    super.key,
    required this.child,
    this.background,
    this.showPhoneFrame = true,
  });

  final Widget child;
  final Decoration? background;
  final bool showPhoneFrame;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      decoration: background ??
          BoxDecoration(
            color: kFlashGold,
            borderRadius: BorderRadius.circular(showPhoneFrame ? 28 : 0),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(showPhoneFrame ? 28 : 0),
        child: child,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: EdgeInsets.all(showPhoneFrame ? 20 : 0),
              child: AspectRatio(
                aspectRatio: 9 / 19.2,
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FlashLogo extends StatelessWidget {
  const FlashLogo({
    super.key,
    this.size = 88,
    this.backgroundColor = Colors.transparent,
  });

  final double size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      kLogoAsset,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.fastfood_rounded,
          size: size * 0.72,
          color: kFlashBrown,
        );
      },
    );

    if (backgroundColor != Colors.transparent) {
      image = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: image,
      );
    }

    return image;
  }
}

class BottomProgressBar extends StatelessWidget {
  const BottomProgressBar({
    super.key,
    required this.value,
    this.trackColor = const Color(0xFFFDF2D7),
    this.fillColor = kFlashOrange,
  });

  final double value;
  final Color trackColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    final safeValue = value.clamp(0.0, 1.0);
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: safeValue,
          child: Container(
            decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        ),
      ),
    );
  }
}
