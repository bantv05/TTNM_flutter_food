import 'package:flutter/material.dart';

import 'burger_models.dart';

class BurgerColors {
  static const Color primary = Color(0xFFFF9F1C);
  static const Color sun = Color(0xFFFFBF69);
  static const Color peach = Color(0xFFFFD6A5);
  static const Color canvas = Color(0xFFFFF8F1);
  static const Color card = Colors.white;
  static const Color ink = Color(0xFF1F2937);
  static const Color muted = Color(0xFF6B7280);
  static const Color line = Color(0xFFF3E5D4);
  static const Color ok = Color(0xFF2A9D8F);
}

class BurgerShell extends StatelessWidget {
  const BurgerShell({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    this.bottomNavigationBar,
  });

  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? BurgerColors.canvas,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class BurgerPrimaryButton extends StatelessWidget {
  const BurgerPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: BurgerColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}

class BurgerGhostButton extends StatelessWidget {
  const BurgerGhostButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: BurgerColors.ink,
          side: const BorderSide(color: BurgerColors.line),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class BurgerHeadline extends StatelessWidget {
  const BurgerHeadline({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            height: 1.1,
            fontWeight: FontWeight.w800,
            color: BurgerColors.ink,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 15,
            height: 1.45,
            color: BurgerColors.muted,
          ),
        ),
      ],
    );
  }
}

class BurgerPanel extends StatelessWidget {
  const BurgerPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.color = Colors.white,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: BurgerColors.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 20,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}

class BurgerSectionHeader extends StatelessWidget {
  const BurgerSectionHeader({
    super.key,
    required this.title,
    this.action,
  });

  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (action != null)
          Text(
            action!,
            style: const TextStyle(
              color: BurgerColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}

class BurgerTag extends StatelessWidget {
  const BurgerTag({
    super.key,
    required this.label,
    this.active = false,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: active ? BurgerColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: active ? BurgerColors.primary : BurgerColors.line,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : BurgerColors.ink,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class BurgerBottomNav extends StatelessWidget {
  const BurgerBottomNav({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    const items = [
      Icons.home_rounded,
      Icons.restaurant_menu_rounded,
      Icons.shopping_bag_rounded,
      Icons.person_rounded,
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: BurgerColors.line)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (itemIndex) {
          final active = index == itemIndex;
          return Container(
            height: 48,
            width: 58,
            decoration: BoxDecoration(
              color: active ? BurgerColors.primary : BurgerColors.canvas,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              items[itemIndex],
              color: active ? Colors.white : BurgerColors.muted,
            ),
          );
        }),
      ),
    );
  }
}

class BurgerArt extends StatelessWidget {
  const BurgerArt({
    super.key,
    this.size = 180,
    this.accent = BurgerColors.sun,
  });

  final double size;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final bun = size * 0.74;
    final ingredientWidth = size * 0.78;
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  accent.withValues(alpha: 0.16),
                  BurgerColors.primary.withValues(alpha: 0.26),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 28,
            child: _BurgerBun(
              width: bun,
              height: size * 0.28,
            ),
          ),
          Positioned(
            top: size * 0.54,
            child: Container(
              width: ingredientWidth,
              height: size * 0.08,
              decoration: BoxDecoration(
                color: const Color(0xFF7A4E2D),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Positioned(
            top: size * 0.46,
            child: Container(
              width: ingredientWidth - 8,
              height: size * 0.06,
              decoration: BoxDecoration(
                color: const Color(0xFFF94144),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Positioned(
            top: size * 0.42,
            child: Container(
              width: ingredientWidth - 18,
              height: size * 0.04,
              decoration: BoxDecoration(
                color: const Color(0xFF80ED99),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Positioned(
            top: size * 0.50,
            child: Transform.rotate(
              angle: -0.06,
              child: Container(
                width: ingredientWidth - 26,
                height: size * 0.05,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD166),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
            top: size * 0.60,
            child: Container(
              width: bun,
              height: size * 0.14,
              decoration: BoxDecoration(
                color: const Color(0xFFF4A261),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BurgerBun extends StatelessWidget {
  const _BurgerBun({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF6B65B),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(height),
          bottom: const Radius.circular(40),
        ),
      ),
      child: Stack(
        children: const [
          Positioned(top: 20, left: 28, child: _Seed()),
          Positioned(top: 16, left: 62, child: _Seed()),
          Positioned(top: 30, left: 82, child: _Seed()),
          Positioned(top: 18, right: 34, child: _Seed()),
        ],
      ),
    );
  }
}

class _Seed extends StatelessWidget {
  const _Seed();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 10,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2CC),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class BurgerProductCard extends StatelessWidget {
  const BurgerProductCard({
    super.key,
    required this.item,
    this.compact = false,
    this.onTap,
  });

  final BurgerItem item;
  final bool compact;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = BurgerPanel(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BurgerArt(size: compact ? 78 : 92, accent: item.accent),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: BurgerColors.canvas,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: BurgerColors.primary, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      item.rating.toStringAsFixed(1),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            style: const TextStyle(
              color: BurgerColors.muted,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (!compact) ...[
            const SizedBox(height: 8),
            Text(
              item.description,
              style: const TextStyle(color: BurgerColors.muted, height: 1.4),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: BurgerColors.primary,
                ),
              ),
              const Spacer(),
              _MetaPill(icon: Icons.timer_outlined, value: item.deliveryTime),
              const SizedBox(width: 8),
              _MetaPill(icon: Icons.local_fire_department, value: '${item.calories}'),
            ],
          ),
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: content,
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill({
    required this.icon,
    required this.value,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: BurgerColors.canvas,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: BurgerColors.primary),
          const SizedBox(width: 5),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class BurgerMapCard extends StatelessWidget {
  const BurgerMapCard({
    super.key,
    this.height = 240,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F6F9),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _RoadPainter()),
          ),
          const Positioned(
            top: 42,
            left: 58,
            child: _Pin(color: BurgerColors.ok, icon: Icons.storefront_rounded),
          ),
          const Positioned(
            top: 132,
            right: 88,
            child: _Pin(color: BurgerColors.primary, icon: Icons.delivery_dining),
          ),
          Positioned(
            bottom: 22,
            left: 18,
            right: 18,
            child: BurgerPanel(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: BurgerColors.canvas,
                    child: Icon(
                      Icons.route_rounded,
                      color: BurgerColors.primary,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Courier is moving to your address',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '2.3 km left • around 12 min',
                          style: TextStyle(color: BurgerColors.muted),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Pin extends StatelessWidget {
  const _Pin({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.32),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class _RoadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFFC7E7EE)
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final dashPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 0.08, size.height * 0.66)
      ..quadraticBezierTo(
        size.width * 0.24,
        size.height * 0.18,
        size.width * 0.52,
        size.height * 0.34,
      )
      ..quadraticBezierTo(
        size.width * 0.82,
        size.height * 0.54,
        size.width * 0.72,
        size.height * 0.86,
      );

    canvas.drawPath(path, linePaint);

    const double dashWidth = 12;
    const double dashSpace = 9;
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, dashPaint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
