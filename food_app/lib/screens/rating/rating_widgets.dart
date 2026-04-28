import 'package:flutter/material.dart';

const Color ratingBackground = Color(0xFFF5F5F5);
const Color ratingPrimary = Color(0xFFFF9900);
const Color ratingPrimaryDisabled = Color(0xFFFFC5BA);
const Color ratingNeutral900 = Color(0xFF0D1217);
const Color ratingNeutral400 = Color(0xFF4C555F);
const Color ratingNeutral100 = Color(0xFFBABDC1);
const Color ratingNeutral50 = Color(0xFFE9EAEB);

class RatingShell extends StatelessWidget {
  const RatingShell({
    super.key,
    required this.title,
    required this.body,
    required this.onBack,
    required this.onSkip,
    required this.submitEnabled,
    this.onSubmit,
    this.bodyPadding = const EdgeInsets.fromLTRB(24, 18, 24, 140),
  });

  final String title;
  final Widget body;
  final VoidCallback onBack;
  final VoidCallback onSkip;
  final VoidCallback? onSubmit;
  final bool submitEnabled;
  final EdgeInsets bodyPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ratingBackground,
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
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: bodyPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingHeader(title: title, onBack: onBack),
                            const SizedBox(height: 16),
                            body,
                          ],
                        ),
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 24,
                        child: _BottomButtons(
                          onSkip: onSkip,
                          onSubmit: submitEnabled ? onSubmit : null,
                          submitEnabled: submitEnabled,
                        ),
                      ),
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

class RatingHeader extends StatelessWidget {
  const RatingHeader({super.key, required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBackButton(onTap: onBack),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: ratingNeutral900,
            ),
          ),
        ),
        const SizedBox(width: 42, height: 42),
      ],
    );
  }
}

class RatingBackButton extends StatelessWidget {
  const RatingBackButton({super.key, required this.onTap});

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
            size: 24,
            color: ratingNeutral900,
          ),
        ),
      ),
    );
  }
}

class StarSelector extends StatelessWidget {
  const StarSelector({
    super.key,
    required this.rating,
    required this.onChanged,
    this.size = 60,
    this.spacing = 8,
  });

  final int rating;
  final ValueChanged<int> onChanged;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      children: [
        for (var index = 1; index <= 5; index++)
          InkWell(
            borderRadius: BorderRadius.circular(size / 2),
            onTap: () => onChanged(index),
            child: Icon(
              Icons.star_rounded,
              size: size,
              color: index <= rating
                  ? const Color(0xFFFFC700)
                  : ratingNeutral50,
            ),
          ),
      ],
    );
  }
}

class ReviewInputBox extends StatelessWidget {
  const ReviewInputBox({
    super.key,
    required this.controller,
    required this.hint,
    this.height = 153,
    this.readOnly = false,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final double height;
  final bool readOnly;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0x0D1F2A37),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              expands: true,
              maxLines: null,
              minLines: null,
              onChanged: onChanged,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ratingNeutral900,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ratingNeutral100,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 16, 56, 36),
              ),
            ),
          ),
          const Positioned(
            right: 12,
            bottom: 12,
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: ratingNeutral100,
                ),
                SizedBox(width: 8),
                Icon(Icons.image_outlined, size: 20, color: ratingNeutral100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({
    required this.onSkip,
    required this.submitEnabled,
    this.onSubmit,
  });

  final VoidCallback onSkip;
  final VoidCallback? onSubmit;
  final bool submitEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 53,
            child: TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                foregroundColor: ratingNeutral900.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                'Bỏ qua',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 53,
            child: FilledButton(
              onPressed: onSubmit,
              style: FilledButton.styleFrom(
                backgroundColor: submitEnabled
                    ? ratingPrimary
                    : ratingPrimaryDisabled,
                disabledBackgroundColor: ratingPrimaryDisabled,
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Gửi'),
            ),
          ),
        ),
      ],
    );
  }
}
