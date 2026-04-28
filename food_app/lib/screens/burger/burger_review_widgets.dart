import 'package:flutter/material.dart';

import 'burger_widgets.dart';

class BurgerReviewFrame extends StatelessWidget {
  const BurgerReviewFrame({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EE),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final frameHeight = constraints.maxHeight - 24;
            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 390,
                  height: frameHeight > 0 ? frameHeight : constraints.maxHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BurgerRatingOverview extends StatelessWidget {
  const BurgerRatingOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Text(
              '4.9',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.star_rounded,
                    size: 22,
                    color: BurgerColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '(1.205)',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF757C85),
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),
        const Expanded(
          child: Column(
            children: [
              _BarRow(label: '5', value: 0.94),
              SizedBox(height: 7),
              _BarRow(label: '4', value: 0.09, active: true),
              SizedBox(height: 7),
              _BarRow(label: '3', value: 0.0),
              SizedBox(height: 7),
              _BarRow(label: '2', value: 0.0),
              SizedBox(height: 7),
              _BarRow(label: '1', value: 0.0),
            ],
          ),
        ),
      ],
    );
  }
}

class BurgerReviewChips extends StatelessWidget {
  const BurgerReviewChips({
    super.key,
    required this.allSelected,
    this.fiveSelected = false,
    this.fourSelected = false,
    required this.onTapAll,
    this.onTapFive,
    required this.onTapFour,
  });

  final bool allSelected;
  final bool fiveSelected;
  final bool fourSelected;
  final VoidCallback onTapAll;
  final VoidCallback? onTapFive;
  final VoidCallback onTapFour;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _ReviewChip(
            label: '\u2713 T\u1ea5t c\u1ea3',
            active: allSelected,
            onTap: onTapAll,
          ),
          const SizedBox(width: 8),
          const _ReviewChip(label: 'H\u00e0i l\u00f2ng'),
          const SizedBox(width: 8),
          const _ReviewChip(label: 'Ch\u01b0a h\u00e0i l\u00f2ng'),
          const SizedBox(width: 8),
          _ReviewChip(
            label: '5 \u2B50',
            active: fiveSelected,
            onTap: onTapFive,
          ),
          const SizedBox(width: 8),
          _ReviewChip(
            label: '4 \u2B50',
            active: fourSelected,
            onTap: onTapFour,
          ),
          const SizedBox(width: 8),
          const _ReviewChip(label: '3 \u2B50'),
          const SizedBox(width: 8),
          const _ReviewChip(label: '2 \u2B50'),
          const SizedBox(width: 8),
          const _ReviewChip(label: '1 \u2B50'),
        ],
      ),
    );
  }
}

class BurgerReviewTile extends StatelessWidget {
  const BurgerReviewTile({
    super.key,
    required this.avatarAsset,
    required this.name,
    required this.date,
    required this.review,
    required this.starCount,
  });

  final String avatarAsset;
  final String name;
  final String date;
  final String review;
  final int starCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFF3F3F5),
          backgroundImage: AssetImage(avatarAsset),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFA0A7B1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: index < starCount
                            ? BurgerColors.primary
                            : const Color(0xFFE5E7EB),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                review,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.55,
                  color: Color(0xFF454A52),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BarRow extends StatelessWidget {
  const _BarRow({
    required this.label,
    required this.value,
    this.active = false,
  });

  final String label;
  final double value;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final width = value.clamp(0.0, 1.0).toDouble() * 150.0;
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEEF0),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              Container(
                height: 6,
                width: width,
                decoration: BoxDecoration(
                  color: active ? const Color(0xFFFFB74D) : BurgerColors.primary,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReviewChip extends StatelessWidget {
  const _ReviewChip({
    required this.label,
    this.active = false,
    this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? BurgerColors.primary : const Color(0xFFF0F1F3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: active ? Colors.white : const Color(0xFF2F343B),
          ),
        ),
      ),
    );
  }
}
