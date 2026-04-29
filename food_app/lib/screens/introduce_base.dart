import 'package:flutter/material.dart';

const String kIntroduceFoodAsset = 'assets/images/hinh2.png';
const String kIntroduceDeliveryAsset = 'assets/images/hinh3.png';
const String kIntroduceTrackAsset = 'assets/images/hinh4.png';
const String kIntroduceVoucherAsset = 'assets/images/hinh5.png';

class IntroduceScreenShell extends StatelessWidget {
  const IntroduceScreenShell({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
    required this.currentStep,
    required this.totalSteps,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.onSkipPressed,
    this.showSkipFooter = true,
  });

  final String assetPath;
  final String title;
  final String description;
  final int currentStep;
  final int totalSteps;
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final VoidCallback? onSkipPressed;
  final bool showSkipFooter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: SizedBox(
                        width: 190,
                        height: 190,
                        child: Image.asset(
                          assetPath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported_outlined,
                              size: 96,
                              color: Color(0xFFBDBDBD),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFF29924),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFF4B545),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(flex: 2),
                  _StepIndicator(
                    currentStep: currentStep,
                    totalSteps: totalSteps,
                  ),
                  const SizedBox(height: 18),
                  FilledButton(
                    onPressed: onPrimaryPressed,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFF59A0A),
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      primaryLabel,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (showSkipFooter)
                    Center(
                      child: TextButton(
                        onPressed: onSkipPressed ?? onPrimaryPressed,
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFB5B5B5),
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 24),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Bo qua',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isActive = index == currentStep;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFF4B545) : const Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
