import 'package:flutter/material.dart';

import 'burger05.dart';
import 'burger09.dart';
import 'burger_detail_widgets.dart';

class Burger04Screen extends StatelessWidget {
  const Burger04Screen({super.key});

  static const routeName = '/burger04';

  @override
  Widget build(BuildContext context) {
    return BurgerDetailFrame(
      bottomBar: BurgerBottomActionBar(
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BurgerHeroImage(onBack: () => Navigator.maybePop(context)),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Burger Gà Hoàng Kim',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '30.000 đ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFF9F1C),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Burger09Screen.routeName),
                    child: const BurgerReviewRow(
                      linkLabel: 'Xem tất cả đánh giá',
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Một chiếc bánh burger gà ngon miệng được phục vụ trên bánh mì nướng giòn, kèm theo rau xà lách tươi, lát cà chua và sốt mayonnaise. Miếng thịt...',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.55,
                      color: Color(0xFF8B929B),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Burger05Screen.routeName),
                  child: const Text(
                    'Xem thêm',
                    style: TextStyle(
                      color: Color(0xFF757C85),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: BurgerAddonList(),
            ),
          ],
        ),
      ),
    );
  }
}
