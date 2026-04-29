import 'package:flutter/material.dart';

import '../cart/cart01.dart';
import '../liked.dart';
import '../Location/diachi_routes.dart';
import '../Profile/hoso_routes.dart';
import 'app_routes.dart';

class HomeDesign extends StatelessWidget {
  const HomeDesign({
    super.key,
    required this.titleLine,
    required this.subtitleLine,
    required this.showProfileAvatar,
    required this.onDealTap,
  });

  final String titleLine;
  final String subtitleLine;
  final bool showProfileAvatar;
  final VoidCallback onDealTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AddressHeader(
                      titleLine: titleLine,
                      subtitleLine: subtitleLine,
                    ),
                    const SizedBox(height: 14),
                    const _PromoSlider(),
                    const SizedBox(height: 18),
                    const _SearchBox(),
                    const SizedBox(height: 22),
                    const _CategoryGrid(),
                    const SizedBox(height: 18),
                    _DealHeader(onTap: onDealTap),
                    const SizedBox(height: 14),
                    _DealsRow(onTap: onDealTap),
                  ],
                ),
              ),
            ),
            _BottomNav(showProfileAvatar: showProfileAvatar),
          ],
        ),
      ),
      floatingActionButton: const _FloatingHomeBadge(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class _AddressHeader extends StatelessWidget {
  const _AddressHeader({
    required this.titleLine,
    required this.subtitleLine,
  });

  final String titleLine;
  final String subtitleLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Giao đến',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF303030),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      titleLine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: subtitleLine.isEmpty ? 22 : 14,
                        fontWeight: subtitleLine.isEmpty
                            ? FontWeight.w400
                            : FontWeight.w500,
                        color: subtitleLine.isEmpty
                            ? const Color(0xFFB2B2B2)
                            : const Color(0xFF303030),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Color(0xFFFF7A00),
                      size: 22,
                    ),
                  ),
                ],
              ),
              if (subtitleLine.isNotEmpty) ...[
                const SizedBox(height: 5),
                Text(
                  subtitleLine,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202020),
                    height: 1.1,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: () => Navigator.pushNamed(context, Cart01Screen.routeName),
          borderRadius: BorderRadius.circular(99),
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFEDEDED)),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 18,
              color: Color(0xFF202020),
            ),
          ),
        ),
      ],
    );
  }
}

class _PromoSlider extends StatelessWidget {
  const _PromoSlider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 96,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _PromoCard(
                width: 206,
                colors: [Color(0xFFFFC95B), Color(0xFFFFB133)],
                title: 'THƯỞNG THỨC\nKEM NGỌT MÁT',
                subtitle: 'GIẢM 40%',
                rightEmoji: '🍦',
              ),
              SizedBox(width: 12),
              _PromoCard(
                width: 206,
                colors: [Color(0xFF1C1B22), Color(0xFF35343B)],
                title: 'Nhân đôi\nhạnh phúc',
                subtitle: 'Lễ tình nhân ngọt ngào',
                topTag: 'ƯU ĐÃI CẶP ĐÔI',
                rightEmoji: '🍔',
                accentColor: Color(0xFFFF7A59),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 14,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFFF7A59),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            const SizedBox(width: 5),
            _Dot(),
            const SizedBox(width: 5),
            _Dot(),
          ],
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Color(0xFFD3D3D3),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({
    required this.width,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.rightEmoji,
    this.topTag,
    this.accentColor = Colors.white,
  });

  final double width;
  final List<Color> colors;
  final String title;
  final String subtitle;
  final String rightEmoji;
  final String? topTag;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  topTag ?? 'Ngày hội Kem',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: topTag == null
                        ? const Color(0xFFFFF4D0)
                        : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: accentColor.withOpacity(0.95),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 54,
            height: 72,
            child: Center(
              child: Text(rightEmoji, style: const TextStyle(fontSize: 42)),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: const Row(
        children: [
          Icon(Icons.search_rounded, color: Color(0xFFC4C4C4), size: 22),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Tìm kiếm',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFC1C1C1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.tune_rounded, color: Color(0xFF202020), size: 18),
        ],
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.14,
      ),
      itemBuilder: (context, index) => _CategoryItem(item: _categories[index]),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.item});

  final _CategoryItemData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.emoji, style: const TextStyle(fontSize: 21)),
          const SizedBox(height: 7),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF202020),
            ),
          ),
        ],
      ),
    );
  }
}

class _DealHeader extends StatelessWidget {
  const _DealHeader({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Deal hời mỗi ngày',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF202020),
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: const Row(
            children: [
              Text(
                'Xem thêm',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFF8A00),
                ),
              ),
              SizedBox(width: 2),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: Color(0xFFFF8A00),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DealsRow extends StatelessWidget {
  const _DealsRow({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _DealCard(item: _deals[0], onTap: onTap)),
        const SizedBox(width: 14),
        Expanded(child: _DealCard(item: _deals[1], onTap: onTap)),
      ],
    );
  }
}

class _DealCard extends StatelessWidget {
  const _DealCard({required this.item, required this.onTap});

  final _DealData item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 114,
            decoration: BoxDecoration(
              gradient: item.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: const Color(0x22000000));
                    },
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.04),
                          Colors.black.withOpacity(0.18),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      size: 14,
                      color: Color(0xFFFF9A00),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.price,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFF8A00),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.showProfileAvatar});

  final bool showProfileAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavIcon(
            icon: Icons.home_rounded,
            active: true,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home01,
              (route) => false,
            ),
          ),
          _NavIcon(
            icon: Icons.receipt_long_rounded,
            onTap: () => Navigator.pushNamed(context, DiaChiRoutes.diachi1),
          ),
          _NavIcon(
            icon: Icons.favorite_border_rounded,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LikedScreen(),
              ),
            ),
          ),
          const _NavIcon(icon: Icons.notifications_none_rounded),
          showProfileAvatar
              ? InkWell(
                  onTap: () => Navigator.pushNamed(context, HoSoRoutes.hoso1),
                  borderRadius: BorderRadius.circular(99),
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4B5563), Color(0xFF111827)],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: const Text('👨🏻', style: TextStyle(fontSize: 12)),
                  ),
                )
              : _NavIcon(
                  icon: Icons.person_outline_rounded,
                  onTap: () => Navigator.pushNamed(context, HoSoRoutes.hoso1),
                ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, this.active = false, this.onTap});

  final IconData icon;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Icon(
        icon,
        size: 21,
        color: active ? const Color(0xFFFFA100) : const Color(0xFFB8BDC6),
      ),
    );
  }
}

class _FloatingHomeBadge extends StatelessWidget {
  const _FloatingHomeBadge();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 8),
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          color: Color(0xFFFFA929),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x33FFA929),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.menu_book_rounded,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CategoryItemData {
  const _CategoryItemData(this.label, this.emoji);

  final String label;
  final String emoji;
}

class _DealData {
  const _DealData({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.background,
  });

  final String title;
  final String price;
  final String imagePath;
  final LinearGradient background;
}

const List<_CategoryItemData> _categories = [
  _CategoryItemData('Burger', '🍔'),
  _CategoryItemData('Taco', '🌮'),
  _CategoryItemData('Đồ uống', '🥤'),
  _CategoryItemData('Pizza', '🍕'),
  _CategoryItemData('Donut', '🍩'),
  _CategoryItemData('Salad', '🥗'),
  _CategoryItemData('Sandwich', '🥪'),
  _CategoryItemData('Ice Cream', '🍨'),
  _CategoryItemData('More', '•••'),
];

final List<_DealData> _deals = [
  const _DealData(
    title: 'Burger gà giòn cay thơm ngon',
    price: '59.000đ',
    imagePath: 'assets/images/home_burger_1.png',
    background: LinearGradient(
      colors: [Color(0xFF0A0A0A), Color(0xFF2F2F2F)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  const _DealData(
    title: 'Burger bò phô mai cực đã',
    price: '69.000đ',
    imagePath: 'assets/images/home_burger_2.png',
    background: LinearGradient(
      colors: [Color(0xFF1E1E1E), Color(0xFF3B3B3B)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
];
