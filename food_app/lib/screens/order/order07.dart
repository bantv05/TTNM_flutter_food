import 'package:flutter/material.dart';

import 'order08.dart';

class Order07Screen extends StatelessWidget {
  const Order07Screen({super.key});

  static const _mainImage = 'assets/images/order/sp0023512/sp0023512_main.jpg';
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
                              SizedBox(height: 16),
                              _SummaryRow(),
                              SizedBox(height: 10),
                              _ReviewedBurgerCard(),
                              SizedBox(height: 12),
                              _ReviewedRamenCard(),
                              SizedBox(height: 12),
                              _ReviewedPizzaCard(),
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
                            ],
                          ),
                        ),
                      ),
                      _BottomBar(
                        onPrimaryPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const Order08Screen(),
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
              'SP 0023512',
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
            color: const Color(0xFFEFFFF6),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Hoàn thành',
            style: TextStyle(
              color: Color(0xFF31C48D),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _ReviewedBurgerCard extends StatelessWidget {
  const _ReviewedBurgerCard();

  @override
  Widget build(BuildContext context) {
    return const _ReviewedProductCard(
      imagePath: Order07Screen._mainImage,
      emoji: '🍔',
      title: 'Burger gà sốt phô mai',
      oldPrice: '50.000 đ',
      price: '35.000 đ',
      actionLabel: 'Sắp xếp lại',
      options: [
        _OptionRow(label: 'Thêm phô mai', price: '5.000 đ'),
        _OptionRow(label: 'Thêm thịt (1 miếng)', price: '10.000 đ'),
      ],
      rating: 4,
      comment: 'Burger đậm vị, sốt béo và bánh mềm vừa phải!',
    );
  }
}

class _ReviewedRamenCard extends StatelessWidget {
  const _ReviewedRamenCard();

  @override
  Widget build(BuildContext context) {
    return const _ReviewedProductCard(
      imagePath: Order07Screen._secondImage,
      emoji: '🥤',
      title: 'Trà chanh bạc hà',
      oldPrice: '20.000 đ',
      price: '15.000 đ',
      actionLabel: 'Reorder',
      rating: 5,
    );
  }
}

class _ReviewedPizzaCard extends StatelessWidget {
  const _ReviewedPizzaCard();

  @override
  Widget build(BuildContext context) {
    return const _ReviewedProductCard(
      imagePath: Order07Screen._thirdImage,
      emoji: '🍟',
      title: 'Khoai tây chiên giòn',
      price: '20.000 đ',
      actionLabel: 'Reorder',
      rating: 0,
    );
  }
}

class _ReviewedProductCard extends StatelessWidget {
  const _ReviewedProductCard({
    required this.imagePath,
    required this.emoji,
    required this.title,
    required this.price,
    required this.actionLabel,
    required this.rating,
    this.oldPrice,
    this.options = const [],
    this.comment,
  });

  final String imagePath;
  final String emoji;
  final String title;
  final String price;
  final String actionLabel;
  final int rating;
  final String? oldPrice;
  final List<Widget> options;
  final String? comment;

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
          if (options.isNotEmpty) ...[
            const SizedBox(height: 10),
            for (var i = 0; i < options.length; i++) ...[
              options[i],
              if (i != options.length - 1) const SizedBox(height: 6),
            ],
          ],
          const SizedBox(height: 10),
          _StarRow(rating: rating),
          const SizedBox(height: 10),
          if (comment != null)
            _FilledCommentBox(text: comment!)
          else
            const _EmptyCommentBox(),
        ],
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

class _StarRow extends StatelessWidget {
  const _StarRow({required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final active = index < rating;
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            Icons.star_rounded,
            size: 24,
            color: active ? const Color(0xFFFFC700) : const Color(0xFFE3E3E3),
          ),
        );
      }),
    );
  }
}

class _FilledCommentBox extends StatelessWidget {
  const _FilledCommentBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF555555),
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.bottomRight,
            child: _CommentIcons(),
          ),
        ],
      ),
    );
  }
}

class _EmptyCommentBox extends StatelessWidget {
  const _EmptyCommentBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chia sẻ cảm nhận của bạn...',
            style: TextStyle(
              color: Color(0xFFC2C2C2),
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: _CommentIcons(),
          ),
        ],
      ),
    );
  }
}

class _CommentIcons extends StatelessWidget {
  const _CommentIcons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.camera_alt_rounded, size: 16, color: Color(0xFFBDBDBD)),
        SizedBox(width: 8),
        Icon(Icons.image_rounded, size: 16, color: Color(0xFFBDBDBD)),
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

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.onPrimaryPressed});

  final VoidCallback onPrimaryPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: FilledButton.icon(
        onPressed: onPrimaryPressed,
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
