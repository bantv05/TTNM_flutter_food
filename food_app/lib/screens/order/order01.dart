import 'package:flutter/material.dart';

import '../Home/app_routes.dart';
import '../Profile/hoso_routes.dart';
import '../liked.dart';
import 'order02.dart';
import 'order03.dart';
import 'order04.dart';

class Order01Screen extends StatelessWidget {
  const Order01Screen({super.key});

  static const _sp0023900Images = <String>[
    'assets/images/order/sp0023900/sp0023900_main.jpg',
    'assets/images/order/sp0023900/sp0023900_second.jpg',
    'assets/images/order/sp0023900/sp0023900_third.png',
  ];

  static const _sp0023502Images = <String>[
    'assets/images/order/sp0023502/sp0023502_soup.jpg',
    'assets/images/order/sp0023502/sp0023502_burger.jpg',
    'assets/images/order/sp0023502/sp0023502_drink.png',
  ];

  static const _sp0023512Images = <String>[
    'assets/images/order/sp0023512/sp0023512_main.jpg',
    'assets/images/order/sp0023512/sp0023512_second.jpg',
    'assets/images/order/sp0023512/sp0023512_third.png',
  ];

  static const _sp0023450Images = <String>[
    'assets/images/order/sp0023900/sp0023900_main.jpg',
    'assets/images/order/sp0023900/sp0023900_drink.png',
    'assets/images/order/sp0023900/sp0023900_fries.png',
  ];

  static const _orders = <_OrderCardData>[
    _OrderCardData(
      image: '🍔',
      imagePaths: _sp0023900Images,
      code: 'Mã đơn hàng SP 0023900',
      price: '60.000 đ',
      status: 'Đang chuẩn bị',
      statusType: _OrderStatusType.preparing,
      rating: 4,
    ),
    _OrderCardData(
      image: '🍕',
      imagePaths: _sp0023512Images,
      code: 'Mã đơn hàng SP 0023512',
      price: '40.000 đ',
      status: 'Hoàn thành',
      statusType: _OrderStatusType.completed,
      rating: 5,
    ),
    _OrderCardData(
      image: '🍹',
      imagePaths: _sp0023502Images,
      code: 'Mã đơn hàng SP 0023502',
      price: '55.000 đ',
      status: 'Hoàn thành',
      statusType: _OrderStatusType.completed,
      rating: 4,
    ),
    _OrderCardData(
      image: '🥤',
      imagePaths: _sp0023450Images,
      code: 'Mã đơn hàng SP 0023450',
      price: '30.000 đ',
      status: 'Đã hủy',
      statusType: _OrderStatusType.canceled,
      rating: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _OrdersScaffold(
      selectedFilter: _OrderFilter.all,
      orders: _orders,
      onAllTap: null,
      onPreparingTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const Order02Screen(),
          ),
        );
      },
      onCompletedTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const Order03Screen(),
          ),
        );
      },
      onCanceledTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const Order04Screen(),
          ),
        );
      },
      onOrderTap: (order) {
        switch (order.statusType) {
          case _OrderStatusType.preparing:
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const Order02Screen(),
              ),
            );
          case _OrderStatusType.completed:
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const Order03Screen(),
              ),
            );
          case _OrderStatusType.canceled:
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const Order04Screen(),
              ),
            );
        }
      },
    );
  }
}

class _OrdersScaffold extends StatelessWidget {
  const _OrdersScaffold({
    required this.selectedFilter,
    required this.orders,
    required this.onPreparingTap,
    required this.onCompletedTap,
    required this.onCanceledTap,
    required this.onOrderTap,
    this.onAllTap,
  });

  final _OrderFilter selectedFilter;
  final List<_OrderCardData> orders;
  final VoidCallback? onAllTap;
  final VoidCallback onPreparingTap;
  final VoidCallback onCompletedTap;
  final VoidCallback onCanceledTap;
  final ValueChanged<_OrderCardData> onOrderTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 30,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _OrdersHeader(canPop: Navigator.of(context).canPop()),
                              const SizedBox(height: 18),
                              const _SearchBar(),
                              const SizedBox(height: 14),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _FilterChip(
                                      label: 'Tất cả',
                                      selected: selectedFilter == _OrderFilter.all,
                                      onTap: onAllTap,
                                    ),
                                    const SizedBox(width: 8),
                                    _FilterChip(
                                      label: 'Đang chuẩn bị',
                                      selected: selectedFilter == _OrderFilter.preparing,
                                      onTap: onPreparingTap,
                                    ),
                                    const SizedBox(width: 8),
                                    _FilterChip(
                                      label: 'Hoàn thành',
                                      selected: selectedFilter == _OrderFilter.completed,
                                      onTap: onCompletedTap,
                                    ),
                                    const SizedBox(width: 8),
                                    _FilterChip(
                                      label: 'Đã hủy',
                                      selected: selectedFilter == _OrderFilter.canceled,
                                      onTap: onCanceledTap,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),
                              for (var i = 0; i < orders.length; i++) ...[
                                _OrderCard(
                                  data: orders[i],
                                  onTap: () => onOrderTap(orders[i]),
                                ),
                                if (i != orders.length - 1) const SizedBox(height: 12),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const _BottomNavBar(),
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

class _OrdersHeader extends StatelessWidget {
  const _OrdersHeader({required this.canPop});

  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TopIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: canPop ? () => Navigator.of(context).pop() : null,
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Đơn hàng',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.search_rounded, color: Color(0xFFBBBBBB), size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Tìm kiếm',
              style: TextStyle(
                color: Color(0xFFBBBBBB),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.tune_rounded, color: Color(0xFF1F1F1F), size: 22),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = selected ? const Color(0xFFFFAA2B) : const Color(0xFFF1F1F1);
    final textColor = selected ? Colors.white : const Color(0xFF2E2E2E);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selected) ...[
                const Icon(Icons.check_rounded, size: 16, color: Colors.white),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.data,
    required this.onTap,
  });

  final _OrderCardData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              _FoodImageStack(
                emoji: data.image,
                imagePaths: data.imagePaths,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.code,
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.price,
                      style: const TextStyle(
                        color: Color(0xFFFF9F0A),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _RatingRow(rating: data.rating),
                        const Spacer(),
                        _StatusPill(type: data.statusType, label: data.status),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FoodImageStack extends StatelessWidget {
  const _FoodImageStack({
    required this.emoji,
    this.imagePaths,
  });

  final String emoji;
  final List<String>? imagePaths;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86,
      height: 74,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 8,
            child: _FoodThumb(
              emoji: emoji,
              imagePath: imagePaths != null && imagePaths!.isNotEmpty ? imagePaths![0] : null,
              size: 34,
              opacity: 0.52,
            ),
          ),
          Positioned(
            left: 12,
            top: 4,
            child: _FoodThumb(
              emoji: emoji,
              imagePath: imagePaths != null && imagePaths!.length > 1 ? imagePaths![1] : null,
              size: 42,
              opacity: 0.72,
            ),
          ),
          Positioned(
            right: 0,
            child: _FoodThumb(
              emoji: emoji,
              imagePath: imagePaths != null && imagePaths!.length > 2 ? imagePaths![2] : null,
              size: 58,
              opacity: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodThumb extends StatelessWidget {
  const _FoodThumb({
    required this.emoji,
    required this.size,
    required this.opacity,
    this.imagePath,
  });

  final String emoji;
  final double size;
  final double opacity;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFF0F0F0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: imagePath != null
              ? Image.asset(
                  imagePath!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: size * 0.52),
                    ),
                  ),
                )
              : Text(
                  emoji,
                  style: TextStyle(fontSize: size * 0.52),
                ),
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final active = index < rating;
        return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Icon(
            Icons.star_rounded,
            size: 24,
            color: active ? const Color(0xFFFFBF00) : const Color(0xFFE3E3E3),
          ),
        );
      }),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.type,
    required this.label,
  });

  final _OrderStatusType type;
  final String label;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color foregroundColor;

    switch (type) {
      case _OrderStatusType.preparing:
        backgroundColor = const Color(0xFFFFF1DB);
        foregroundColor = const Color(0xFFFF9F0A);
      case _OrderStatusType.completed:
        backgroundColor = const Color(0xFFEFFFF6);
        foregroundColor = const Color(0xFF31C48D);
      case _OrderStatusType.canceled:
        backgroundColor = const Color(0xFFF3F3F3);
        foregroundColor = const Color(0xFF8E8E93);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFF2F2F2)),
        ),
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavIcon(
              icon: Icons.home_outlined,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home01,
                (route) => false,
              ),
            ),
            const _ActiveOrderButton(),
            _NavIcon(
              icon: Icons.favorite_border_rounded,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LikedScreen(),
                ),
              ),
            ),
            const _NavIcon(icon: Icons.notifications_none_rounded),
            _NavIcon(
              icon: Icons.person_outline_rounded,
              onTap: () => Navigator.pushNamed(context, HoSoRoutes.hoso1),
            ),
          ],
        ),
      );
    }
  }

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(99),
        child: Icon(icon, color: const Color(0xFFB8BCC2), size: 28),
      );
  }
}

class _ActiveOrderButton extends StatelessWidget {
  const _ActiveOrderButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Color(0xFFFFAA2B),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x33FFAA2B),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.receipt_long_rounded, color: Colors.white),
        ),
        const SizedBox(height: 6),
        const Text(
          'Đơn hàng',
          style: TextStyle(
            color: Color(0xFFFFAA2B),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _TopIconButton extends StatelessWidget {
  const _TopIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFDFDFD),
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: const Color(0x12000000),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: const Color(0xFF2A2A2A), size: 20),
        ),
      ),
    );
  }
}

class _OrderCardData {
  const _OrderCardData({
    required this.image,
    required this.code,
    required this.price,
    required this.status,
    required this.statusType,
    required this.rating,
    this.imagePaths,
  });

  final String image;
  final List<String>? imagePaths;
  final String code;
  final String price;
  final String status;
  final _OrderStatusType statusType;
  final int rating;
}

enum _OrderFilter {
  all,
  preparing,
  completed,
  canceled,
}

enum _OrderStatusType {
  preparing,
  completed,
  canceled,
}
