import 'package:flutter/material.dart';

import 'burger_catalog_widgets.dart';
import 'burger03.dart';
import 'burger04.dart';

class Burger02Screen extends StatelessWidget {
  const Burger02Screen({super.key});

  static const routeName = '/burger02';

  @override
  Widget build(BuildContext context) {
    return BurgerCatalogFrame(
      searchText: 'Burger Ga Hoang Kim',
      onSearchTap: () {
        Navigator.pushNamed(context, Burger03Screen.routeName);
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 132,
          child: BurgerCatalogCard(
            item: burgerCatalogItems[2],
            onTap: () {
              Navigator.pushNamed(context, Burger04Screen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
