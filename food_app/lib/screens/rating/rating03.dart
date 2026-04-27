import 'package:flutter/material.dart';

import 'rating04.dart';
import 'rating_models.dart';
import 'rating_widgets.dart';

class Rating03Screen extends StatefulWidget {
  const Rating03Screen({super.key});

  static const routeName = '/rating/rating03';

  @override
  State<Rating03Screen> createState() => _Rating03ScreenState();
}

class _Rating03ScreenState extends State<Rating03Screen> {
  late final List<FoodRatingDraft> _items = List<FoodRatingDraft>.from(
    kInitialMealRatings,
  );
  late final List<TextEditingController> _controllers = [
    for (final item in _items) TextEditingController(text: item.comment),
  ];

  bool get _canSubmit => _items.any((item) => item.stars > 0);

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _openCompleteScreen() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            Rating04Screen(reviews: List<FoodRatingDraft>.from(_items)),
      ),
    );
  }

  void _updateStars(int index, int stars) {
    setState(() {
      _items[index] = _items[index].copyWith(stars: stars);
    });
  }

  void _updateComment(int index, String comment) {
    _items[index] = _items[index].copyWith(comment: comment);
  }

  @override
  Widget build(BuildContext context) {
    return RatingShell(
      title: 'Đánh giá món ăn',
      onBack: () => Navigator.of(context).maybePop(),
      onSkip: _openCompleteScreen,
      onSubmit: _openCompleteScreen,
      submitEnabled: _canSubmit,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          for (var index = 0; index < _items.length; index++) ...[
            _MealRatingCard(
              item: _items[index],
              controller: _controllers[index],
              onStarsChanged: (value) => _updateStars(index, value),
              onCommentChanged: (value) => _updateComment(index, value),
            ),
            if (index != _items.length - 1) const SizedBox(height: 12),
          ],
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}

class _MealRatingCard extends StatelessWidget {
  const _MealRatingCard({
    required this.item,
    required this.controller,
    required this.onStarsChanged,
    required this.onCommentChanged,
  });

  final FoodRatingDraft item;
  final TextEditingController controller;
  final ValueChanged<int> onStarsChanged;
  final ValueChanged<String> onCommentChanged;

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
                      onChanged: onStarsChanged,
                      size: 40,
                      spacing: 5.33,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ReviewInputBox(
            controller: controller,
            hint: 'Chia sẻ cảm nhận của bạn...',
            height: 100,
            onChanged: onCommentChanged,
          ),
        ],
      ),
    );
  }
}
