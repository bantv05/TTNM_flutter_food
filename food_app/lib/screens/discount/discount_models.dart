import 'package:flutter/material.dart';

enum PromotionCategory { shipping, order }

@immutable
class PromotionData {
  const PromotionData({
    required this.id,
    required this.title,
    required this.badgeLabel,
    required this.icon,
    required this.category,
    required this.code,
    required this.isEnabled,
    required this.description,
    required this.dateRange,
    required this.scope,
    required this.discountText,
    required this.terms,
    this.percentOff = 0,
  });

  final String id;
  final String title;
  final String badgeLabel;
  final IconData icon;
  final PromotionCategory category;
  final String code;
  final bool isEnabled;
  final String description;
  final String dateRange;
  final String scope;
  final String discountText;
  final String terms;
  final int percentOff;
}

const List<PromotionData> kPromotionCatalog = [
  PromotionData(
    id: 'free_shipping',
    title: 'MIỄN PHÍ VẬN CHUYỂN',
    badgeLabel: 'FREE SHIPPING',
    icon: Icons.confirmation_num_rounded,
    category: PromotionCategory.shipping,
    code: 'MIENPHI',
    isEnabled: true,
    description:
        'Tận hưởng miễn phí vận chuyển cho mọi đơn hàng trong suốt tháng này!',
    dateRange: '01/05/2026 - 31/06/2024',
    scope: 'Áp dụng cho mọi đơn hàng trên website hoặc ứng dụng của chúng tôi.',
    discountText: 'Giảm 100% phí vận chuyển (Miễn phí vận chuyển).',
    terms:
        'Không giới hạn giá trị đơn hàng tối thiểu. Áp dụng cho phương thức giao hàng tiêu chuẩn trong nước.',
  ),
  PromotionData(
    id: 'shipping_20',
    title: 'GIẢM 20%',
    badgeLabel: 'SHIP 20%',
    icon: Icons.confirmation_num_rounded,
    category: PromotionCategory.shipping,
    code: 'SHIP20',
    isEnabled: false,
    description: 'Giảm 20% phí vận chuyển cho đơn hàng tiếp theo.',
    dateRange: '01/05/2026 - 31/06/2024',
    scope: 'Áp dụng cho đơn giao tiêu chuẩn nội thành.',
    discountText: 'Giảm 20% phí vận chuyển.',
    terms: 'Ưu đãi hiện chưa khả dụng với tài khoản của bạn.',
  ),
  PromotionData(
    id: 'order_20',
    title: 'GIẢM 20%',
    badgeLabel: '20%',
    icon: Icons.confirmation_num_rounded,
    category: PromotionCategory.order,
    code: 'GIAM20',
    isEnabled: true,
    description: 'Giảm trực tiếp 20% trên tổng tiền món ăn của đơn hàng.',
    dateRange: '01/05/2026 - 31/06/2024',
    scope: 'Áp dụng cho mọi đơn hàng trên ứng dụng.',
    discountText: 'Giảm 20% giá trị món ăn.',
    terms: 'Không áp dụng đồng thời với mã giảm giá đơn hàng khác.',
    percentOff: 20,
  ),
  PromotionData(
    id: 'order_10',
    title: 'GIẢM 10%',
    badgeLabel: '10%',
    icon: Icons.confirmation_num_rounded,
    category: PromotionCategory.order,
    code: 'GIAM10',
    isEnabled: false,
    description: 'Giảm trực tiếp 10% trên tổng tiền món ăn của đơn hàng.',
    dateRange: '01/05/2026 - 31/06/2024',
    scope: 'Áp dụng cho mọi đơn hàng trên ứng dụng.',
    discountText: 'Giảm 10% giá trị món ăn.',
    terms: 'Ưu đãi hiện chưa khả dụng với tài khoản của bạn.',
    percentOff: 10,
  ),
];

@immutable
class EarnPromotionTask {
  const EarnPromotionTask({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<EarnPromotionTask> kEarnPromotionTasks = [
  EarnPromotionTask(title: 'Chia sẻ ứng dụng', icon: Icons.share_rounded),
  EarnPromotionTask(title: 'Mời bạn bè', icon: Icons.group_outlined),
  EarnPromotionTask(
    title: 'Hoàn tất mua hàng',
    icon: Icons.shopping_bag_outlined,
  ),
  EarnPromotionTask(title: 'Xem quảng cáo', icon: Icons.movie_outlined),
  EarnPromotionTask(
    title: 'Tham gia sự kiện',
    icon: Icons.celebration_outlined,
  ),
  EarnPromotionTask(
    title: 'Hồ sơ hoàn chỉnh',
    icon: Icons.account_circle_outlined,
  ),
  EarnPromotionTask(title: 'Theo dõi MXH', icon: Icons.hub_outlined),
  EarnPromotionTask(
    title: 'Tham gia khảo sát',
    icon: Icons.rate_review_outlined,
  ),
  EarnPromotionTask(
    title: 'Đạt được cấp độ',
    icon: Icons.auto_awesome_outlined,
  ),
  EarnPromotionTask(
    title: 'Đăng nhập hằng ngày',
    icon: Icons.smartphone_outlined,
  ),
];

PromotionData promotionById(String id) {
  return kPromotionCatalog.firstWhere((promotion) => promotion.id == id);
}

List<PromotionData> promotionsByIds(Iterable<String> ids) {
  final idSet = ids.toSet();
  return [
    for (final promotion in kPromotionCatalog)
      if (idSet.contains(promotion.id)) promotion,
  ];
}
