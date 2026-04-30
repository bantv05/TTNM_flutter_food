import 'package:flutter/material.dart';

import 'burger_widgets.dart';

class BurgerCatalogItem {
  const BurgerCatalogItem({
    required this.name,
    required this.rating,
    required this.price,
    this.oldPrice,
    required this.imageAsset,
  });

  final String name;
  final double rating;
  final String price;
  final String? oldPrice;
  final String imageAsset;
}

const burgerCatalogItems = <BurgerCatalogItem>[
  BurgerCatalogItem(
    name: 'Burger B\u00f2 Th\u01b0\u1ee3ng H\u1ea1ng',
    rating: 4.9,
    oldPrice: '70.000 \u0111',
    price: '50.000 \u0111',
    imageAsset: 'assets/images/custom/burger_floating_classic.png',
  ),
  BurgerCatalogItem(
    name: 'Burger G\u00e0 Phi-l\u00ea Gi\u00f2n R\u00f9m',
    rating: 4.9,
    oldPrice: '50.000 \u0111',
    price: '35.000 \u0111',
    imageAsset: 'assets/images/custom/burger_crispy_white.png',
  ),
  BurgerCatalogItem(
    name: 'Burger K\u1eb9p Tinh Th\u1ea7n',
    rating: 4.9,
    price: '20.000 \u0111',
    imageAsset: 'assets/images/custom/burger_dark_chicken.png',
  ),
  BurgerCatalogItem(
    name: 'Burger G\u00e0 Teriyaki',
    rating: 4.9,
    price: '12.000 \u0111',
    imageAsset: 'assets/images/custom/burger_cheese_drip.png',
  ),
  BurgerCatalogItem(
    name: 'Burger B\u00f2 Tr\u1ee9ng Ch\u1ea3y',
    rating: 4.9,
    price: '35.000 \u0111',
    imageAsset: 'assets/images/custom/burger_bacon_combo.png',
  ),
  BurgerCatalogItem(
    name: 'Burger G\u00e0 Ho\u00e0ng Kim',
    rating: 4.9,
    price: '30.000 \u0111',
    imageAsset: 'assets/images/custom/burger_golden_chicken.png',
  ),
  BurgerCatalogItem(
    name: 'Burger G\u00e0 N\u01b0\u1edbng B\u01a1 T\u00e2y',
    rating: 4.9,
    price: '22.000 \u0111',
    imageAsset: 'assets/images/custom/burger_cheese_drip.png',
  ),
  BurgerCatalogItem(
    name: 'Burger Heo Quay S\u1ed1t BBQ',
    rating: 4.9,
    price: '30.000 \u0111',
    imageAsset: 'assets/images/custom/burger_bacon_combo.png',
  ),
];

class BurgerCatalogFrame extends StatelessWidget {
  const BurgerCatalogFrame({
    super.key,
    required this.child,
    required this.searchText,
    this.searchHint = false,
    this.onSearchTap,
  });

  final Widget child;
  final String searchText;
  final bool searchHint;
  final VoidCallback? onSearchTap;

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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _CircleIconButton(
                                icon: Icons.arrow_back_ios_new_rounded,
                                onTap: () => Navigator.maybePop(context),
                              ),
                              const Spacer(),
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '\u{1F354}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Burger',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const SizedBox(width: 42),
                            ],
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: onSearchTap,
                            child: Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F5),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFE8E8EC),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search_rounded,
                                    color: Color(0xFFA8ACB3),
                                    size: 24,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      searchText,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: searchHint
                                            ? const Color(0xFFB6BAC1)
                                            : Colors.black,
                                        fontSize: 15,
                                        fontWeight: searchHint
                                            ? FontWeight.w500
                                            : FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.tune_rounded,
                                    color: Colors.black87,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          child,
                        ],
                      ),
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

class BurgerCatalogCard extends StatelessWidget {
  const BurgerCatalogCard({
    super.key,
    required this.item,
    this.width,
    this.onTap,
    this.onFavoriteTap,
  });

  final BurgerCatalogItem item;
  final double? width;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 14,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Image.asset(
                        item.imageAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFFFE1BA),
                            alignment: Alignment.center,
                            child: const BurgerArt(size: 62),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: _FavoriteBadge(onTap: onFavoriteTap),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: BurgerColors.primary,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${item.rating}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF444444),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 6,
                runSpacing: 2,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (item.oldPrice != null)
                    Text(
                      item.oldPrice!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFFB2B2B2),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontSize: 12,
                      color: BurgerColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
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
        height: 42,
        width: 42,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x10000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black87, size: 18),
      ),
    );
  }
}

class _FavoriteBadge extends StatelessWidget {
  const _FavoriteBadge({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.favorite_border_rounded,
          color: BurgerColors.primary,
          size: 16,
        ),
      ),
    );
  }
}
