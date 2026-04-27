import 'package:flutter/material.dart';

import 'rating_models.dart';
import 'rating_widgets.dart';

class Rating04Screen extends StatelessWidget {
  const Rating04Screen({super.key, this.reviews = kCompletedMealRatings});

  static const routeName = '/rating/rating04';

  final List<FoodRatingDraft> reviews;

  void _finishFlow(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil('/cart/cart01', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ratingBackground,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 393),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Opacity(
                            opacity: 0.4,
                            child: _Rating04Background(reviews: reviews),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(color: const Color(0x99DBD6CE)),
                      ),
                      Center(
                        child: Container(
                          width: 345,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Cảm ơn bạn đã đánh giá bữa ăn của mình',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF291C0A),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Image.asset(
                                    'assets/images/rating/thanks_heart.png',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, _, _) {
                                      return const Icon(
                                        Icons.favorite_rounded,
                                        size: 120,
                                        color: Color(0xFFFF6B81),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  const Text(
                                    'Cảm ơn bạn đã chia sẻ!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ratingNeutral900,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Cảm ơn bạn đã dành thời gian đánh giá.\nNhững góp ý của bạn sẽ giúp chúng mình\nhoàn thiện hơn mỗi ngày!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: ratingNeutral400,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 53,
                                    child: FilledButton(
                                      onPressed: () => _finishFlow(context),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: ratingPrimary,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            28,
                                          ),
                                        ),
                                        textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      child: const Text('Ok'),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () => _finishFlow(context),
                                  icon: const Icon(
                                    Icons.close_rounded,
                                    size: 26,
                                    color: Color(0xFFDBD6CE),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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

class _Rating04Background extends StatelessWidget {
  const _Rating04Background({required this.reviews});

  final List<FoodRatingDraft> reviews;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RatingHeader(title: 'Đánh giá món ăn', onBack: _noop),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Mã đơn hàng',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ratingNeutral900,
                      ),
                    ),
                  ),
                  Text(
                    'SP 0023900',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ratingNeutral900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              for (var index = 0; index < reviews.length; index++) ...[
                _ReadOnlyMealCard(item: reviews[index]),
                if (index != reviews.length - 1) const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 24,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 53,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Bỏ qua',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: ratingNeutral900,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 53,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: ratingPrimary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Gửi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReadOnlyMealCard extends StatelessWidget {
  const _ReadOnlyMealCard({required this.item});

  final FoodRatingDraft item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ratingNeutral50),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 75,
                  height: 62,
                  child: Image.asset(
                    item.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) {
                      return Container(
                        color: ratingNeutral50,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.fastfood_rounded,
                          color: ratingPrimary,
                          size: 28,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ratingNeutral900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    StarSelector(
                      rating: item.stars,
                      onChanged: (_) {},
                      size: 40,
                      spacing: 5.33,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ReadOnlyInputBox(text: item.comment),
        ],
      ),
    );
  }
}

class _ReadOnlyInputBox extends StatelessWidget {
  const _ReadOnlyInputBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: const Color(0x0D1F2A37),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              text.isEmpty ? 'Chia sẻ cảm nhận của bạn...' : text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: text.isEmpty ? ratingNeutral100 : ratingNeutral900,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: ratingNeutral100,
                ),
                SizedBox(width: 8),
                Icon(Icons.image_outlined, size: 20, color: ratingNeutral100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _noop() {}
