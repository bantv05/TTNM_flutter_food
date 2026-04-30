import 'package:flutter/material.dart';

import 'burger02.dart';
import 'burger04.dart';
import 'burger_catalog_widgets.dart';
import '../liked.dart';

class Burger01Screen extends StatelessWidget {
  const Burger01Screen({super.key});

  static const routeName = '/burger01';

  @override
  Widget build(BuildContext context) {
    return BurgerCatalogFrame(
      searchText: 'Tim kiếm',
      searchHint: true,
      onSearchTap: () {
        Navigator.pushNamed(context, Burger02Screen.routeName);
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: burgerCatalogItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 18,
          mainAxisExtent: 172,
        ),
        itemBuilder: (context, index) {
          return BurgerCatalogCard(
            item: burgerCatalogItems[index],
            onFavoriteTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LikedScreen(),
                ),
              );
            },
            onTap: () {
              if (index == 5) {
                Navigator.pushNamed(context, Burger04Screen.routeName);
              }
            },
          );
        },
      ),
    );
  }
}
