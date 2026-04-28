import 'package:flutter/material.dart';

import 'burger_catalog_widgets.dart';

class Burger03Screen extends StatelessWidget {
  const Burger03Screen({super.key});

  static const routeName = '/burger03';

  @override
  Widget build(BuildContext context) {
    return BurgerCatalogFrame(
      searchText: 'Burger Th\u00e1p Ph\u00f4 Mai',
      child: const SizedBox(
        height: 470,
        child: Padding(
          padding: EdgeInsets.only(top: 48),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Kh\u00f4ng T\u00ecm Th\u1ea5y',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFFC8CDD4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
