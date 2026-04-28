import 'package:flutter/material.dart';

import 'burger_widgets.dart';

const burgerDetailImageAsset = 'assets/images/burger/burger01_03.png';

class BurgerDetailFrame extends StatelessWidget {
  const BurgerDetailFrame({
    super.key,
    required this.body,
    required this.bottomBar,
  });

  final Widget body;
  final Widget bottomBar;

  @override
  Widget build(BuildContext context) {
    const frameWidth = 390.0;
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
                  width: frameWidth,
                  height: frameHeight > 0 ? frameHeight : constraints.maxHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(34),
                              topRight: Radius.circular(34),
                            ),
                            child: body,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFEFD),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFF0ECE7),
                              ),
                            ),
                            child: bottomBar,
                          ),
                        ),
                      ],
                    ),
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

class BurgerHeroImage extends StatelessWidget {
  const BurgerHeroImage({
    super.key,
    required this.onBack,
    this.cartCount,
  });

  final VoidCallback onBack;
  final int? cartCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            height: 255,
            width: double.infinity,
            child: Image.asset(
              burgerDetailImageAsset,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFFFE1BA),
                  alignment: Alignment.center,
                  child: const BurgerArt(size: 180),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 14,
          left: 14,
          child: _RoundGlassButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: onBack,
          ),
        ),
        if (cartCount != null)
          Positioned(
            top: 16,
            right: 14,
            child: _CartBadge(count: cartCount!),
          ),
        const Positioned(
          right: 14,
          bottom: 18,
          child: _FavoriteCircle(),
        ),
      ],
    );
  }
}

class BurgerReviewRow extends StatelessWidget {
  const BurgerReviewRow({
    super.key,
    required this.linkLabel,
  });

  final String linkLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: BurgerColors.primary, size: 18),
        const SizedBox(width: 6),
        const Text(
          '4.9',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '(1.205)',
          style: TextStyle(
            color: Color(0xFF757C85),
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          linkLabel,
          style: const TextStyle(
            color: Color(0xFF757C85),
            fontSize: 13,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}

class BurgerAddonList extends StatelessWidget {
  const BurgerAddonList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tùy chọn bổ sung:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        _AddonRow(label: 'Thêm phô mai', price: '+ 5.000 đ'),
        SizedBox(height: 12),
        _AddonRow(label: 'Thêm thịt xông khói', price: '+ 10.000 đ'),
        SizedBox(height: 12),
        _AddonRow(label: 'Thêm thịt'),
      ],
    );
  }
}

class BurgerNutrition extends StatelessWidget {
  const BurgerNutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thông tin dinh dưỡng',
          style: TextStyle(
            color: Color(0xFF757C85),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 14),
        Row(
          children: [
            Expanded(child: _InfoCell(label: 'Calories : 420')),
            Expanded(child: _InfoCell(label: 'Chất đạm : 27g')),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _InfoCell(label: 'Tinh bột: 30g')),
            Expanded(child: _InfoCell(label: 'Chất béo : 18g')),
          ],
        ),
      ],
    );
  }
}

class BurgerBottomActionBar extends StatelessWidget {
  const BurgerBottomActionBar({
    super.key,
    required this.onPressed,
    this.enabled = true,
    this.label = 'Thêm vào giỏ',
  });

  final VoidCallback onPressed;
  final bool enabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuantityButton(icon: Icons.remove_rounded),
        const SizedBox(width: 14),
        const Text(
          '1',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 14),
        _QuantityButton(icon: Icons.add_rounded),
        const SizedBox(width: 18),
        Expanded(
          child: SizedBox(
            height: 46,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: enabled
                    ? BurgerColors.primary
                    : const Color(0xFFF8CF8A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: onPressed,
              icon: const Icon(Icons.shopping_bag_outlined, size: 18),
              label: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AddonRow extends StatelessWidget {
  const _AddonRow({
    required this.label,
    this.price,
  });

  final String label;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          width: 90,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              price ?? '',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFBFC5CC)),
          ),
        ),
      ],
    );
  }
}

class _InfoCell extends StatelessWidget {
  const _InfoCell({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF757C85),
        fontSize: 14,
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFD),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE6E7EA)),
      ),
      child: Icon(icon, size: 18, color: Colors.black87),
    );
  }
}

class _RoundGlassButton extends StatelessWidget {
  const _RoundGlassButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.22),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black87, size: 16),
      ),
    );
  }
}

class _FavoriteCircle extends StatelessWidget {
  const _FavoriteCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.favorite_border_rounded,
        color: BurgerColors.primary,
        size: 22,
      ),
    );
  }
}

class BurgerCheckSquare extends StatelessWidget {
  const BurgerCheckSquare({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        color: selected ? BurgerColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: selected ? BurgerColors.primary : const Color(0xFFBFC5CC),
        ),
      ),
      child: selected
          ? const Icon(Icons.check_rounded, size: 14, color: Colors.white)
          : null,
    );
  }
}

class BurgerCheckCircle extends StatelessWidget {
  const BurgerCheckCircle({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? BurgerColors.primary : const Color(0xFFBFC5CC),
          width: 2,
        ),
      ),
      child: selected
          ? const Center(
              child: SizedBox(
                height: 10,
                width: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: BurgerColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class BurgerOptionRow extends StatelessWidget {
  const BurgerOptionRow({
    super.key,
    required this.label,
    this.price,
    required this.trailing,
    this.bulleted = false,
  });

  final String label;
  final String? price;
  final Widget trailing;
  final bool bulleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (bulleted) ...[
                const Text('• ', style: TextStyle(fontSize: 15)),
                const SizedBox(width: 2),
              ],
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (price != null) ...[
          const SizedBox(width: 12),
          SizedBox(
            width: 92,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                price!,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
        const SizedBox(width: 10),
        trailing,
      ],
    );
  }
}

class _CartBadge extends StatelessWidget {
  const _CartBadge({
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.shopping_bag_rounded,
            size: 16,
            color: BurgerColors.primary,
          ),
          const SizedBox(width: 6),
          Container(
            height: 22,
            width: 22,
            decoration: const BoxDecoration(
              color: BurgerColors.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
