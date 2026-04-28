import 'package:flutter/material.dart';

import 'burger09.dart';
import 'burger_review_widgets.dart';

class Burger10Screen extends StatelessWidget {
  const Burger10Screen({super.key});

  static const routeName = '/burger10';

  @override
  Widget build(BuildContext context) {
    return BurgerReviewFrame(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.maybePop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x12000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      '\u0110\u00e1nh gi\u00e1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
            const SizedBox(height: 18),
            const Center(
              child: Text(
                'Burger G\u00e0 Ho\u00e0ng Kim',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const BurgerRatingOverview(),
            const SizedBox(height: 18),
            BurgerReviewChips(
              allSelected: false,
              fourSelected: true,
              onTapAll: () {
                Navigator.pushNamed(context, Burger09Screen.routeName);
              },
              onTapFive: () {},
              onTapFour: () {},
            ),
            const SizedBox(height: 24),
            const BurgerReviewTile(
              avatarAsset: 'assets/images/burger/review_avatar_05.png',
              name: 'Lanhxinhdep',
              date: '29/03/2026',
              review:
                  'Burger g\u00e0 \u0103n c\u0169ng \u1ed5n, nh\u01b0ng mi\u1ebfng g\u00e0 h\u01a1i b\u1ecb qu\u00e1 l\u1eeda so v\u1edbi kh\u1ea9u v\u1ecb c\u1ee7a t\u00f4i. Tuy nhi\u00ean, rau c\u1ee7 \u0103n k\u00e8m r\u1ea5t t\u01b0\u01a1i',
              starCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
