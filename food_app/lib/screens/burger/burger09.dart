import 'package:flutter/material.dart';

import 'burger10.dart';
import 'burger_review_widgets.dart';

class Burger09Screen extends StatelessWidget {
  const Burger09Screen({super.key});

  static const routeName = '/burger09';

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
              allSelected: true,
              fourSelected: false,
              onTapAll: () {},
              onTapFive: () {},
              onTapFour: () {
                Navigator.pushNamed(context, Burger10Screen.routeName);
              },
            ),
            const SizedBox(height: 22),
            const BurgerReviewTile(
              avatarAsset: 'assets/images/burger/review_avatar_01.png',
              name: 'Naxinhyeu',
              date: '29/03/2026',
              review:
                  'Burger g\u00e0 ngon tuy\u1ec7t! T\u00f4i r\u1ea5t th\u00edch l\u1edbp g\u00e0 gi\u00f2n v\u00e0 b\u00e1nh m\u00ec \u0111\u01b0\u1ee3c n\u01b0\u1edbng v\u1eeba t\u1edbi. Ch\u1eafc ch\u1eafn l\u00e0 m\u00f3n kho\u00e1i kh\u1ea9u m\u1edbi c\u1ee7a t\u00f4i!',
              starCount: 5,
            ),
            const SizedBox(height: 22),
            const BurgerReviewTile(
              avatarAsset: 'assets/images/burger/review_avatar_03.png',
              name: 'Hongxinhgai',
              date: '10/04/2026',
              review:
                  'C\u1ef1c k\u1ef3 ngon! Burger g\u00e0 m\u1ecdng n\u01b0\u1edbc v\u00e0 \u0111\u1eadm \u0111\u00e0, gia v\u1ecb r\u1ea5t v\u1eeba v\u1eb7n. R\u1ea5t \u0111\u00e1ng th\u1eed nh\u00e9!',
              starCount: 5,
            ),
            const SizedBox(height: 22),
            const BurgerReviewTile(
              avatarAsset: 'assets/images/burger/review_avatar_05.png',
              name: 'Lanhxinhdep',
              date: '29/03/2026',
              review:
                  'Burger g\u00e0 \u0103n c\u0169ng \u1ed5n, nh\u01b0ng mi\u1ebfng g\u00e0 h\u01a1i b\u1ecb qu\u00e1 l\u1eeda so v\u1edbi kh\u1ea9u v\u1ecb c\u1ee7a t\u00f4i. Tuy nhi\u00ean, rau c\u1ee7 \u0103n k\u00e8m r\u1ea5t t\u01b0\u01a1i.',
              starCount: 4,
            ),
            const SizedBox(height: 22),
            const BurgerReviewTile(
              avatarAsset: 'assets/images/burger/review_avatar_04.png',
              name: 'Hangdangiu',
              date: '05/04/2026',
              review:
                  'M\u1ed9t trong nh\u1eefng c\u00e1i burger g\u00e0 ngon nh\u1ea5t t\u00f4i t\u1eebng \u0103n! Th\u1ecbt g\u00e0 m\u1ec1m, b\u00e1nh m\u00ec th\u00ec x\u1ed1p. \u0102n mi\u1ebfng n\u00e0o ghi\u1ec1n mi\u1ebfng \u0111\u00f3!',
              starCount: 5,
            ),
            const SizedBox(height: 22),
            const BurgerReviewTile(
              avatarAsset: 'assets/images/burger/review_avatar_02.png',
              name: 'Banlaban',
              date: '25/03/2026',
              review:
                  'V\u1ecf b\u00e1nh th\u01a1m, ph\u1ea7n nh\u00e2n \u0111\u1ea7y \u0111\u1eb7n v\u00e0 n\u01b0\u1edbc s\u1ed1t r\u1ea5t h\u1ee3p. M\u00ecnh s\u1ebd g\u1ecdi l\u1ea1i l\u1ea7n sau.',
              starCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
