import 'package:flutter/material.dart';

import 'rating02.dart';
import 'rating_widgets.dart';

class Rating01Screen extends StatefulWidget {
  const Rating01Screen({super.key});

  static const routeName = '/rating/rating01';

  @override
  State<Rating01Screen> createState() => _Rating01ScreenState();
}

class _Rating01ScreenState extends State<Rating01Screen> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 0;

  bool get _canSubmit => _rating > 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _goNext() {
    Navigator.of(context).pushNamed(Rating02Screen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return RatingShell(
      title: 'Đánh giá đơn hàng',
      onBack: () => Navigator.of(context).maybePop(),
      onSkip: _goNext,
      onSubmit: _goNext,
      submitEnabled: _canSubmit,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Đánh giá trải nghiệm của bạn',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: ratingNeutral900,
            ),
          ),
          const SizedBox(height: 52),
          Center(
            child: Image.asset(
              'assets/images/rating/diamond.png',
              width: 160,
              height: 160,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) {
                return const Icon(
                  Icons.diamond_rounded,
                  size: 140,
                  color: Color(0xFF39B6F3),
                );
              },
            ),
          ),
          SizedBox(height: _rating == 0 ? 210 : 120),
          Center(
            child: StarSelector(
              rating: _rating,
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
            ),
          ),
          if (_rating > 0) ...[
            const SizedBox(height: 24),
            ReviewInputBox(
              controller: _commentController,
              hint: 'Nhập đánh giá của bạn...',
            ),
          ],
        ],
      ),
    );
  }
}
