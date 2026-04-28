import 'package:flutter/material.dart';

import '../cancelorder/cancelorder1.dart';
import 'order07.dart';

class Order06Screen extends StatelessWidget {
  const Order06Screen({super.key});

  static const _mainImage = 'assets/images/order/sp0023900/sp0023900_main.jpg';
  static const _secondImage = 'assets/images/order/sp0023900/sp0023900_drink.png';
  static const _thirdImage = 'assets/images/order/sp0023900/sp0023900_fries.png';

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
                            children: const [
                              _Header(),
                              SizedBox(height: 18),
                              _SummaryHeader(),
                              SizedBox(height: 10),
                              _ProductBlock(
                                mainImagePath: _mainImage,
                                secondImagePath: _secondImage,
                                thirdImagePath: _thirdImage,
                              ),
                              SizedBox(height: 12),
                              _AddressCard(),
                              SizedBox(height: 10),
                              _PaymentCard(),
                              SizedBox(height: 10),
                              _PromoCard(),
                              SizedBox(height: 16),
                              _TotalSummary(),
                            ],
                          ),
                        ),
                      ),
                      _BottomBar(
                        onTrackPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const Order07Screen(),
                            ),
                          );
                        },
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CircleButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.of(context).pop(),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'SP 0023900',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF101010),
              ),
            ),
          ),
        ),
        const _CircleButton(icon: Icons.more_horiz_rounded),
      ],
    );
  }
}

class _SummaryHeader extends StatelessWidget {
  const _SummaryHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Tóm tắt đơn hàng',
          style: TextStyle(
            color: Color(0xFF2A2A2A),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF1DB),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Đang chuẩn bị',
            style: TextStyle(
              color: Color(0xFFFF9F0A),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductBlock extends StatelessWidget {
  const _ProductBlock({
    required this.mainImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
  });

  final String mainImagePath;
  final String secondImagePath;
  final String thirdImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MainItemCard(
          emoji: '🍔',
          imagePath: mainImagePath,
          title: 'Burger gà sốt phô mai',
          oldPrice: '50.000 đ',
          price: '35.000 đ',
          options: const [
            _ItemOption(label: 'Thêm phô mai', price: '5.000 đ'),
            _ItemOption(label: 'Thêm thịt (1 miếng)', price: '10.000 đ'),
          ],
        ),
        const SizedBox(height: 10),
        _SimpleItemCard(
          emoji: '🥤',
          imagePath: secondImagePath,
          title: 'Trà chanh bạc hà',
          oldPrice: '20.000 đ',
          price: '15.000 đ',
        ),
        const SizedBox(height: 10),
        _SimpleItemCard(
          emoji: '🍟',
          imagePath: thirdImagePath,
          title: 'Khoai tây chiên giòn',
          price: '20.000 đ',
        ),
      ],
    );
  }
}

class _MainItemCard extends StatelessWidget {
  const _MainItemCard({
    required this.emoji,
    required this.imagePath,
    required this.title,
    required this.oldPrice,
    required this.price,
    required this.options,
  });

  final String emoji;
  final String imagePath;
  final String title;
  final String oldPrice;
  final String price;
  final List<_ItemOption> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductThumb(
                emoji: emoji,
                imagePath: imagePath,
                size: 58,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF242424),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          oldPrice,
                          style: const TextStyle(
                            color: Color(0xFFB5B5B5),
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          price,
                          style: const TextStyle(
                            color: Color(0xFFFF9800),
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < options.length; i++) ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    options[i].label,
                    style: const TextStyle(
                      color: Color(0xFF3E3E3E),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  options[i].price,
                  style: const TextStyle(
                    color: Color(0xFFFF9800),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            if (i != options.length - 1) const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }
}

class _SimpleItemCard extends StatelessWidget {
  const _SimpleItemCard({
    required this.emoji,
    required this.imagePath,
    required this.title,
    required this.price,
    this.oldPrice,
  });

  final String emoji;
  final String imagePath;
  final String title;
  final String price;
  final String? oldPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Row(
        children: [
          _ProductThumb(
            emoji: emoji,
            imagePath: imagePath,
            size: 48,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF242424),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (oldPrice != null) ...[
                      Text(
                        oldPrice!,
                        style: const TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFFFF9800),
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductThumb extends StatelessWidget {
  const _ProductThumb({
    required this.emoji,
    required this.imagePath,
    required this.size,
  });

  final String emoji;
  final String imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Text(
            emoji,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  const _AddressCard();

  @override
  Widget build(BuildContext context) {
    return const _InfoCard(
      icon: Icons.location_on_rounded,
      title: 'Giao đến -> Nhà riêng',
      value: '570 Núi Thành, Hòa Cường, Đà Nẵng',
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard();

  @override
  Widget build(BuildContext context) {
    return const _InfoCard(
      icon: Icons.wallet_rounded,
      title: 'Phương thức thanh toán',
      value: 'Tiền mặt',
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.discount_rounded, color: Color(0xFFFF7460), size: 16),
              SizedBox(width: 8),
              Text(
                'Ưu đãi đã áp dụng',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 6,
            children: [
              _PromoBadge(label: 'FREE SHIPPING'),
              _PromoBadge(label: '20%'),
            ],
          ),
        ],
      ),
    );
  }
}

class _PromoBadge extends StatelessWidget {
  const _PromoBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC700),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFFF7460), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF444444),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalSummary extends StatelessWidget {
  const _TotalSummary();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TotalRow(label: 'Tạm tính', value: '70.000 đ'),
        SizedBox(height: 10),
        _TotalRow(label: 'Phí vận chuyển miễn phí', value: 'FREE'),
        SizedBox(height: 10),
        _TotalRow(label: 'Giảm giá', value: '-15.000 đ'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(color: Color(0xFFE8E8E8), height: 1),
        ),
        _TotalRow(label: 'Tổng cộng', value: '55.000 đ', strong: true),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.value,
    this.strong = false,
  });

  final String label;
  final String value;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: const Color(0xFF272727),
      fontSize: 15,
      fontWeight: strong ? FontWeight.w800 : FontWeight.w600,
    );

    return Row(
      children: [
        Expanded(child: Text(label, style: style)),
        Text(value, style: style),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.onTrackPressed});

  final VoidCallback onTrackPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const CancelOrder01Screen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(54),
                side: const BorderSide(color: Color(0xFFE8E8E8)),
                backgroundColor: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Hủy đơn',
                style: TextStyle(
                  color: Color(0xFFAEAEAE),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton(
              onPressed: onTrackPressed,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(54),
                backgroundColor: const Color(0xFFFF9800),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Theo dõi',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    this.onTap,
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

class _ItemOption {
  const _ItemOption({
    required this.label,
    required this.price,
  });

  final String label;
  final String price;
}
