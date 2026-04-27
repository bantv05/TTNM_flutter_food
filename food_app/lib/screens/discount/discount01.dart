import 'package:flutter/material.dart';

import 'discount02.dart';
import 'discount03.dart';
import 'discount_models.dart';

class Discount01Screen extends StatefulWidget {
  const Discount01Screen({
    super.key,
    this.initialSelectedPromotionIds = const <String>{},
  });

  static const routeName = '/discount/discount01';

  final Set<String> initialSelectedPromotionIds;

  @override
  State<Discount01Screen> createState() => _Discount01ScreenState();
}

class _Discount01ScreenState extends State<Discount01Screen> {
  static const Color _primary = Color(0xFFFF9900);
  static const Color _primarySoft = Color(0xFFFFEFED);
  static const Color _neutral900 = Color(0xFF0D1217);
  static const Color _neutral100 = Color(0xFFBABDC1);
  static const Color _neutral50 = Color(0xFFE9EAEB);

  late final Set<String> _selectedIds = Set<String>.from(
    widget.initialSelectedPromotionIds,
  );
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
                      SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 18, 24, 140),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _DiscountHeader(
                              title: 'Khuyến mãi',
                              onBack: () => Navigator.of(context).pop(),
                            ),
                            const SizedBox(height: 28),
                            _buildCodeField(context),
                            const SizedBox(height: 24),
                            const Text(
                              'Ưu đãi vận chuyển',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                height: 1.5,
                                color: _neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildPromotionList(
                              context,
                              kPromotionCatalog
                                  .where(
                                    (promotion) =>
                                        promotion.category ==
                                        PromotionCategory.shipping,
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Ưu đãi đơn hàng',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                height: 1.5,
                                color: _neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildPromotionList(
                              context,
                              kPromotionCatalog
                                  .where(
                                    (promotion) =>
                                        promotion.category ==
                                        PromotionCategory.order,
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 12),
                            InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (_) => const Discount02Screen(),
                                  ),
                                );
                              },
                              child: Ink(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: _primarySoft,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.add, color: _primary, size: 24),
                                    SizedBox(width: 16),
                                    Text(
                                      'Nhận thêm ưu đãi',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: _primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 24,
                        child: SizedBox(
                          height: 53,
                          child: FilledButton(
                            key: const Key('discount-apply-button'),
                            onPressed: () =>
                                Navigator.of(context).pop(_selectedIds),
                            style: FilledButton.styleFrom(
                              backgroundColor: _primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: const Text('Áp dụng ngay'),
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

  Widget _buildCodeField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
      decoration: BoxDecoration(
        color: const Color(0x0D1F2A37),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _neutral50),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _codeController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Mã giảm giá',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: _neutral100,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: _applyCode,
            child: const Text(
              'Xác nhận',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionList(
    BuildContext context,
    List<PromotionData> promotions,
  ) {
    return Column(
      children: [
        for (var index = 0; index < promotions.length; index++) ...[
          _PromotionCard(
            promotion: promotions[index],
            selected: _selectedIds.contains(promotions[index].id),
            onTap: promotions[index].isEnabled
                ? () => _togglePromotion(promotions[index])
                : null,
            onInfoTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) =>
                      Discount03Screen(promotion: promotions[index]),
                ),
              );
            },
          ),
          if (index != promotions.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }

  void _togglePromotion(PromotionData promotion) {
    setState(() {
      if (_selectedIds.contains(promotion.id)) {
        _selectedIds.remove(promotion.id);
        return;
      }
      _selectedIds.removeWhere(
        (selectedId) =>
            promotionById(selectedId).category == promotion.category,
      );
      _selectedIds.add(promotion.id);
    });
  }

  void _applyCode() {
    final input = _codeController.text.trim().toUpperCase();
    if (input.isEmpty) {
      return;
    }

    PromotionData? matchedPromotion;
    for (final promotion in kPromotionCatalog) {
      if (promotion.code == input) {
        matchedPromotion = promotion;
        break;
      }
    }

    if (matchedPromotion == null || !matchedPromotion.isEnabled) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Mã giảm giá không hợp lệ hoặc chưa khả dụng.'),
          ),
        );
      return;
    }

    _togglePromotion(matchedPromotion);
    _codeController.clear();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('Đã áp dụng mã ${matchedPromotion.code}.')),
      );
  }
}

class _PromotionCard extends StatelessWidget {
  const _PromotionCard({
    required this.promotion,
    required this.selected,
    required this.onInfoTap,
    this.onTap,
  });

  final PromotionData promotion;
  final bool selected;
  final VoidCallback onInfoTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = promotion.isEnabled;

    return Opacity(
      opacity: enabled ? 1 : 0.3,
      child: InkWell(
        key: ValueKey('promotion-card-${promotion.id}'),
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE9EAEB)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.confirmation_num_rounded,
                color: Color(0xFFF6BE57),
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        promotion.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D1217),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: onInfoTap,
                      child: const Icon(
                        Icons.help_rounded,
                        size: 20,
                        color: Color(0xFFBABDC1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _PromotionCheckBox(
                key: ValueKey('promotion-checkbox-${promotion.id}'),
                selected: selected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PromotionCheckBox extends StatelessWidget {
  const _PromotionCheckBox({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFF9900) : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: selected ? const Color(0xFFFF9900) : const Color(0xFFE9EAEB),
        ),
      ),
      child: selected
          ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
          : null,
    );
  }
}

class _DiscountHeader extends StatelessWidget {
  const _DiscountHeader({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BackButton(onTap: onBack),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D1217),
            ),
          ),
        ),
        const SizedBox(width: 42, height: 42),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F0D0A2C),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF0D1217),
            size: 24,
          ),
        ),
      ),
    );
  }
}
