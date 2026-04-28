import 'package:flutter/material.dart';

import 'rating03.dart';
import 'rating_widgets.dart';

class Rating02Screen extends StatefulWidget {
  const Rating02Screen({super.key});

  static const routeName = '/rating/rating02';

  @override
  State<Rating02Screen> createState() => _Rating02ScreenState();
}

class _Rating02ScreenState extends State<Rating02Screen> {
  final TextEditingController _commentController = TextEditingController();
  int _rating = 0;

  bool get _canSubmit => _rating > 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _goNext() {
    Navigator.of(context).pushNamed(Rating03Screen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return RatingShell(
      title: 'Đánh giá tài xế',
      onBack: () => Navigator.of(context).maybePop(),
      onSkip: _goNext,
      onSubmit: _goNext,
      submitEnabled: _canSubmit,
      body: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Đánh giá dịch vụ giao hàng của tài xế.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: ratingNeutral900,
              ),
            ),
          ),
          const SizedBox(height: 44),
          ClipOval(
            child: SizedBox(
              width: 160,
              height: 160,
              child: Image.asset(
                'assets/images/rating/driver_avatar.png',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Container(
                    color: const Color(0xFFE8EEF8),
                    alignment: Alignment.center,
                    child: const Text(
                      'M',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w700,
                        color: ratingNeutral900,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Minh',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: ratingNeutral900,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tài xế',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: ratingNeutral900,
            ),
          ),
          SizedBox(height: _rating == 0 ? 120 : 40),
          StarSelector(
            rating: _rating,
            onChanged: (value) {
              setState(() {
                _rating = value;
              });
            },
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
