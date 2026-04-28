import 'package:flutter/foundation.dart';

@immutable
class FoodRatingDraft {
  const FoodRatingDraft({
    required this.id,
    required this.name,
    required this.imageAsset,
    this.stars = 0,
    this.comment = '',
  });

  final String id;
  final String name;
  final String imageAsset;
  final int stars;
  final String comment;

  FoodRatingDraft copyWith({
    String? id,
    String? name,
    String? imageAsset,
    int? stars,
    String? comment,
  }) {
    return FoodRatingDraft(
      id: id ?? this.id,
      name: name ?? this.name,
      imageAsset: imageAsset ?? this.imageAsset,
      stars: stars ?? this.stars,
      comment: comment ?? this.comment,
    );
  }
}

const List<FoodRatingDraft> kInitialMealRatings = [
  FoodRatingDraft(
    id: 'burger',
    name: 'Burger Gà Phi-lê Giòn Rùm',
    imageAsset: 'assets/images/cart/burger.png',
  ),
  FoodRatingDraft(
    id: 'drink',
    name: 'Soda Chanh Tuyết',
    imageAsset: 'assets/images/cart/drink.png',
  ),
  FoodRatingDraft(
    id: 'fries',
    name: 'Khoai Tây',
    imageAsset: 'assets/images/cart/fries.png',
  ),
];

const List<FoodRatingDraft> kCompletedMealRatings = [
  FoodRatingDraft(
    id: 'burger',
    name: 'Burger Gà Phi-lê Giòn Rùm',
    imageAsset: 'assets/images/cart/burger.png',
    stars: 4,
    comment: 'Gà giòn tan, vị rất vừa miệng!',
  ),
  FoodRatingDraft(
    id: 'drink',
    name: 'Soda Chanh Tuyết',
    imageAsset: 'assets/images/cart/drink.png',
    stars: 5,
  ),
  FoodRatingDraft(
    id: 'fries',
    name: 'Khoai Tây',
    imageAsset: 'assets/images/cart/fries.png',
  ),
];
