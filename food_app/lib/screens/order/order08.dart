import 'package:flutter/material.dart';

class Order08Screen extends StatelessWidget {
  const Order08Screen({super.key});

  static const _mainImage = 'assets/images/order/sp0023900/sp0023900_main.jpg';
  static const _drinkImage = 'assets/images/order/sp0023900/sp0023900_drink.png';
  static const _friesImage = 'assets/images/order/sp0023900/sp0023900_fries.png';

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
                              SizedBox(height: 16),
                              _SummaryRow(),
                              SizedBox(height: 10),
                              _BurgerCard(),
                              SizedBox(height: 10),
                              _DrinkCard(),
                              SizedBox(height: 10),
                              _FriesCard(),
                              SizedBox(height: 14),
                              _InfoCard(
                                icon: Icons.location_on_rounded,
                                title: 'Giao đến -> Nhà riêng',
                                value: '570 Núi Thành, Hòa Cường, Đà Nẵng',
                              ),
                              SizedBox(height: 10),
                              _InfoCard(
                                icon: Icons.wallet_rounded,
                                title: 'Phương thức thanh toán',
                                value: 'Tiền mặt',
                              ),
                              SizedBox(height: 10),
                              _PromoCard(),
                              SizedBox(height: 14),
                              _TotalSection(),
                              SizedBox(height: 12),
                              _CancelReasonCard(),
                            ],
                          ),
                        ),
                      ),
                      _BottomBar(),
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
              'SP 0023450',
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

class _SummaryRow extends StatelessWidget {
  const _SummaryRow();

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
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Đã hủy',
            style: TextStyle(
              color: Color(0xFF8E8E93),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _BurgerCard extends StatelessWidget {
  const _BurgerCard();

  @override
  Widget build(BuildContext context) {
    return const _ProductCardWithOptions(
      imagePath: Order08Screen._mainImage,
      emoji: '🍔',
      title: 'Burger gà sốt phô mai',
      oldPrice: '50.000 đ',
      price: '35.000 đ',
      actionLabel: 'Sắp xếp lại',
      options: [
        _OptionRow(label: 'Thêm phô mai', price: '5.000 đ'),
        _OptionRow(label: 'Thêm thịt (1 miếng)', price: '10.000 đ'),
      ],
    );
  }
}

class _DrinkCard extends StatelessWidget {
  const _DrinkCard();

  @override
  Widget build(BuildContext context) {
    return const _SimpleProductCard(
      imagePath: Order08Screen._drinkImage,
      emoji: '🥤',
      title: 'Trà chanh bạc hà',
      oldPrice: '20.000 đ',
      price: '15.000 đ',
      actionLabel: 'Mua lại ngay',
    );
  }
}

class _FriesCard extends StatelessWidget {
  const _FriesCard();

  @override
  Widget build(BuildContext context) {
    return const _SimpleProductCard(
      imagePath: Order08Screen._friesImage,
      emoji: '🍟',
      title: 'Khoai tây chiên giòn',
      price: '20.000 đ',
      actionLabel: 'Mua lại ngay',
    );
  }
}

class _ProductCardWithOptions extends StatelessWidget {
  const _ProductCardWithOptions({
    required this.imagePath,
    required this.emoji,
    required this.title,
    required this.oldPrice,
    required this.price,
    required this.actionLabel,
    required this.options,
  });

  final String imagePath;
  final String emoji;
  final String title;
  final String oldPrice;
  final String price;
  final String actionLabel;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _ProductHeaderRow(
            imagePath: imagePath,
            emoji: emoji,
            title: title,
            oldPrice: oldPrice,
            price: price,
            actionLabel: actionLabel,
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < options.length; i++) ...[
            options[i],
            if (i != options.length - 1) const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }
}

class _SimpleProductCard extends StatelessWidget {
  const _SimpleProductCard({
    required this.imagePath,
    required this.emoji,
    required this.title,
    required this.price,
    required this.actionLabel,
    this.oldPrice,
  });

  final String imagePath;
  final String emoji;
  final String title;
  final String price;
  final String actionLabel;
  final String? oldPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: _ProductHeaderRow(
        imagePath: imagePath,
        emoji: emoji,
        title: title,
        oldPrice: oldPrice,
        price: price,
        actionLabel: actionLabel,
      ),
    );
  }
}

class _ProductHeaderRow extends StatelessWidget {
  const _ProductHeaderRow({
    required this.imagePath,
    required this.emoji,
    required this.title,
    required this.price,
    required this.actionLabel,
    this.oldPrice,
  });

  final String imagePath;
  final String emoji;
  final String title;
  final String price;
  final String actionLabel;
  final String? oldPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductThumb(
          imagePath: imagePath,
          emoji: emoji,
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
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFF9800),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 12),
              const SizedBox(width: 4),
              Text(
                actionLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductThumb extends StatelessWidget {
  const _ProductThumb({
    required this.imagePath,
    required this.emoji,
  });

  final String imagePath;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
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
          width: 64,
          height: 64,
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

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.label,
    required this.price,
  });

  final String label;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF3E3E3E),
              fontSize: 12,
            ),
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Color(0xFFFF9800),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
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

class _TotalSection extends StatelessWidget {
  const _TotalSection();

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

class _CancelReasonCard extends StatelessWidget {
  const _CancelReasonCard();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lý do hủy bỏ',
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Lý do khác...',
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Color(0xFFFFA726),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.edit_rounded, color: Colors.white, size: 16),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: FilledButton.icon(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: const Color(0xFFFF9800),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 18),
        label: const Text(
          'Mua lại ngay',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
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
