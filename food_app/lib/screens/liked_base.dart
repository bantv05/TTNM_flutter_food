import 'package:flutter/material.dart';

const String kLikedBurgerCrispyAsset =
    'assets/images/custom/burger_crispy_white.png';
const String kLikedBurgerCheeseAsset =
    'assets/images/custom/burger_floating_classic.png';
const String kLikedChickenAsset =
    'assets/images/custom/chicken_korean_sauce.png';
const String kLikedFriesAsset =
    'assets/images/custom/fries_cheese_loaded.png';

const Color kLikedAccent = Color(0xFFF4A52A);
const Color kLikedBg = Color(0xFFF7F7F7);
const Color kLikedMuted = Color(0xFFCFCFCF);
const Color kLikedSearchBg = Color(0xFFF5F5F7);

class LikedFoodItem {
  const LikedFoodItem({
    required this.name,
    required this.imagePath,
    required this.oldPrice,
    required this.newPrice,
  });

  final String name;
  final String imagePath;
  final String oldPrice;
  final String newPrice;
}

const List<LikedFoodItem> kLikedFoods = [
  LikedFoodItem(
    name: 'Burger Bo Thuong Hang',
    imagePath: kLikedBurgerCrispyAsset,
    oldPrice: '70.000 d',
    newPrice: '50.000 d',
  ),
  LikedFoodItem(
    name: 'Burger Ga Pho Mai Gion Rum',
    imagePath: kLikedBurgerCheeseAsset,
    oldPrice: '50.000 d',
    newPrice: '35.000 d',
  ),
  LikedFoodItem(
    name: 'Ga Ran Sot Han',
    imagePath: kLikedChickenAsset,
    oldPrice: '40.000 d',
    newPrice: '35.000 d',
  ),
  LikedFoodItem(
    name: 'Khoai Tay Lac Pho Mai',
    imagePath: kLikedFriesAsset,
    oldPrice: '25.000 d',
    newPrice: '20.000 d',
  ),
];

class LikedScreenShell extends StatelessWidget {
  const LikedScreenShell({
    super.key,
    required this.searchText,
    required this.child,
    this.onBackPressed,
    this.onSearchPressed,
    this.onFilterPressed,
  });

  final String searchText;
  final Widget child;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLikedBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 14,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 14),
                    _LikedHeader(onBackPressed: onBackPressed),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                      child: _LikedSearchBar(
                        searchText: searchText,
                        onSearchPressed: onSearchPressed,
                        onFilterPressed: onFilterPressed,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
                        child: child,
                      ),
                    ),
                    const _LikedBottomBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LikedHeader extends StatelessWidget {
  const _LikedHeader({this.onBackPressed});

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: onBackPressed,
                padding: EdgeInsets.zero,
                splashRadius: 16,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 14,
                  color: Color(0xFF262626),
                ),
              ),
            ),
          ),
          const Text(
            'Yeu thich',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF232323),
            ),
          ),
        ],
      ),
    );
  }
}

class _LikedSearchBar extends StatelessWidget {
  const _LikedSearchBar({
    required this.searchText,
    this.onSearchPressed,
    this.onFilterPressed,
  });

  final String searchText;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: kLikedSearchBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: onSearchPressed,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    size: 18,
                    color: Color(0xFFC8C8C8),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      searchText.isEmpty ? 'Tim kiem' : searchText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: searchText.isEmpty
                            ? const Color(0xFFC8C8C8)
                            : const Color(0xFF565656),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: onFilterPressed ?? onSearchPressed,
            splashRadius: 18,
            icon: const Icon(
              Icons.tune_rounded,
              size: 17,
              color: Color(0xFF707070),
            ),
          ),
        ],
      ),
    );
  }
}

class LikedGrid extends StatelessWidget {
  const LikedGrid({
    super.key,
    required this.items,
  });

  final List<LikedFoodItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.79,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => LikedFoodCard(item: items[index]),
    );
  }
}

class LikedFoodCard extends StatelessWidget {
  const LikedFoodCard({
    super.key,
    required this.item,
  });

  final LikedFoodItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFF5F5F5),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.fastfood_rounded,
                          size: 34,
                          color: kLikedMuted,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_rounded,
                      size: 12,
                      color: Color(0xFFFF7F7D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 7, 6, 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9.2,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF222222),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 10,
                      color: kLikedAccent,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '4.9',
                      style: TextStyle(
                        fontSize: 8.4,
                        color: Color(0xFFA7A7A7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      item.oldPrice,
                      style: const TextStyle(
                        fontSize: 8.2,
                        color: Color(0xFFC2C2C2),
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.newPrice,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: kLikedAccent,
                          fontWeight: FontWeight.w800,
                        ),
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

class LikedCenteredLabel extends StatelessWidget {
  const LikedCenteredLabel({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -56),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: Color(0xFFD1D1D1),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _LikedBottomBar extends StatelessWidget {
  const _LikedBottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.fromLTRB(6, 10, 6, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF0F0F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0E000000),
            blurRadius: 12,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _NavGlyph(icon: Icons.home_outlined),
          _NavGlyph(icon: Icons.receipt_long_outlined),
          _ActiveFavoriteNav(),
          _NavGlyph(icon: Icons.notifications_none_rounded),
          _NavGlyph(icon: Icons.person_outline_rounded),
        ],
      ),
    );
  }
}

class _NavGlyph extends StatelessWidget {
  const _NavGlyph({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 18, color: const Color(0xFFB8BDC6));
  }
}

class _ActiveFavoriteNav extends StatelessWidget {
  const _ActiveFavoriteNav();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: kLikedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x33F4A52A),
                  blurRadius: 12,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.favorite_rounded,
              size: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Yeu thich',
            style: TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w700,
              color: kLikedAccent,
            ),
          ),
        ],
      ),
    );
  }
}
