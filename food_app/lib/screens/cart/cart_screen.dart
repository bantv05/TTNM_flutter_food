import 'package:flutter/material.dart';

import '../discount/discount_models.dart';

typedef DiscountPickerCallback =
    Future<Set<String>?> Function(Set<String> currentSelection);

enum CartVariant { summaryOnly, completedInfo }

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    required this.variant,
    this.onRequestCheckoutInfo,
    this.onPlaceOrder,
    this.onOpenDiscounts,
    this.initialSelectedPromotionIds = const <String>{},
  });

  final CartVariant variant;
  final VoidCallback? onRequestCheckoutInfo;
  final VoidCallback? onPlaceOrder;
  final DiscountPickerCallback? onOpenDiscounts;
  final Set<String> initialSelectedPromotionIds;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const Color _primary = Color(0xFFFF9900);
  static const Color _primarySoft = Color(0xFFEAC285);
  static const Color _secondary = Color(0xFFFFC700);
  static const Color _neutral900 = Color(0xFF0D1217);
  static const Color _neutral200 = Color(0xFF989DA3);
  static const Color _neutral100 = Color(0xFFBABDC1);
  static const Color _neutral50 = Color(0xFFE9EAEB);
  static const Color _iconAccent = Color(0xFFFF725E);

  late final List<CartItemData> _items = _buildInitialItems();
  late Set<String> _selectedPromotionIds = Set<String>.from(
    widget.initialSelectedPromotionIds,
  );

  bool get _hasCompletedInfo => widget.variant == CartVariant.completedInfo;

  List<PromotionData> get _selectedPromotions =>
      promotionsByIds(_selectedPromotionIds);

  PromotionData? get _selectedOrderPromotion {
    for (final promotion in _selectedPromotions) {
      if (promotion.category == PromotionCategory.order &&
          promotion.percentOff > 0) {
        return promotion;
      }
    }
    return null;
  }

  int get _subtotal {
    return _items.fold<int>(
      0,
      (sum, item) => sum + (item.discountPrice * item.quantity),
    );
  }

  int get _discountAmount {
    final orderPromotion = _selectedOrderPromotion;
    if (orderPromotion == null) {
      return 0;
    }
    return ((_subtotal * orderPromotion.percentOff) / 100).round();
  }

  int get _total => _subtotal - _discountAmount;

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_setEquals(
      oldWidget.initialSelectedPromotionIds,
      widget.initialSelectedPromotionIds,
    )) {
      _selectedPromotionIds = Set<String>.from(
        widget.initialSelectedPromotionIds,
      );
    }
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
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x140D0A2C),
                      blurRadius: 24,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 18, 24, 144),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(context),
                            const SizedBox(height: 28),
                            _buildSummarySection(),
                            const SizedBox(height: 24),
                            _buildInfoCards(context),
                            const SizedBox(height: 24),
                            _buildBillSection(),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        child: _buildBottomBar(),
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

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        _HeaderButton(
          icon: Icons.arrow_back_rounded,
          onTap: () => Navigator.of(context).maybePop(),
        ),
        const Expanded(
          child: Text(
            'Giỏ hàng của tôi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: _neutral900,
            ),
          ),
        ),
        const SizedBox(width: 42, height: 42),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Tóm tắt đơn hàng',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: _neutral900,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _handleAddItem,
              style: OutlinedButton.styleFrom(
                foregroundColor: _primary,
                side: const BorderSide(color: _primary),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: const Text('Thêm món'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            for (var index = 0; index < _items.length; index++) ...[
              CartItemCard(
                item: _items[index],
                onDecrease: () => _changeQuantity(index, -1),
                onIncrease: () => _changeQuantity(index, 1),
                onRemove: () => _removeItem(index),
                onEdit: () => _editItem(_items[index]),
              ),
              if (index != _items.length - 1) const SizedBox(height: 12),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCards(BuildContext context) {
    final selectedTags = [
      for (final promotion in _selectedPromotions) promotion.badgeLabel,
    ];

    return Column(
      children: [
        _InfoCard(
          icon: Icons.location_on,
          title: _hasCompletedInfo ? null : 'Giao đến',
          customTitle: _hasCompletedInfo
              ? Row(
                  children: const [
                    Text(
                      'Giao đến',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: _neutral900,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '->',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _neutral900,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Nhà',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _neutral900,
                      ),
                    ),
                  ],
                )
              : null,
          value: _hasCompletedInfo
              ? '570 Núi Thành, Hòa Cường, Đà Nẵng'
              : 'Chọn địa chỉ giao hàng',
          valueStyle: TextStyle(
            fontSize: _hasCompletedInfo ? 18 : 16,
            fontWeight: FontWeight.w600,
            color: _hasCompletedInfo ? _neutral900 : _neutral100,
          ),
          onTap: _handleCheckoutInfoTap,
        ),
        const SizedBox(height: 12),
        _InfoCard(
          icon: Icons.account_balance_wallet_rounded,
          title: 'Phương thức thanh toán',
          value: _hasCompletedInfo ? 'Tiền mặt' : 'Chọn phương thức thanh toán',
          valueStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _hasCompletedInfo ? _neutral900 : _neutral100,
          ),
          onTap: _handleCheckoutInfoTap,
        ),
        const SizedBox(height: 12),
        _InfoCard(
          cardKey: const Key('cart-discount-card'),
          icon: Icons.discount_outlined,
          title: 'Mã giảm giá',
          value: selectedTags.isEmpty ? 'Chọn mã giảm giá của bạn' : null,
          valueStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _neutral100,
          ),
          tags: selectedTags,
          onTap: _handleDiscountTap,
        ),
      ],
    );
  }

  Widget _buildBillSection() {
    return Column(
      children: [
        _BillRow(label: 'Tạm tính', value: _formatCurrency(_subtotal)),
        const SizedBox(height: 14),
        const _BillRow(label: 'Phí vận chuyển', value: 'FREE'),
        const SizedBox(height: 14),
        _BillRow(
          label: 'Giảm giá',
          value: '-${_formatCurrency(_discountAmount)}',
        ),
        const SizedBox(height: 12),
        const Divider(height: 1, color: _neutral900),
        const SizedBox(height: 12),
        _BillRow(
          label: 'Tổng cộng',
          value: _formatCurrency(_total),
          large: true,
          valueKey: const Key('total-price'),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x330D0A2C),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 9, 8, 9),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _formatCurrency(_total),
                key: const Key('cart-bottom-total'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: _neutral900,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 53,
                child: FilledButton(
                  key: const Key('cart-place-order-button'),
                  onPressed: _items.isEmpty ? null : widget.onPlaceOrder,
                  style: FilledButton.styleFrom(
                    backgroundColor: _hasCompletedInfo
                        ? _primary
                        : _primarySoft,
                    disabledBackgroundColor: _neutral50,
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
                  child: const Text('Đặt hàng ngay'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeQuantity(int index, int delta) {
    final item = _items[index];
    final nextQuantity = item.quantity + delta;
    if (nextQuantity < 1) {
      return;
    }

    setState(() {
      _items[index] = item.copyWith(quantity: nextQuantity);
    });
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    setState(() {
      _items.removeAt(index);
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Đã xóa "${removedItem.name}" khỏi giỏ hàng.'),
          action: SnackBarAction(
            label: 'Hoàn tác',
            onPressed: () {
              final insertIndex = index <= _items.length
                  ? index
                  : _items.length;
              setState(() {
                _items.insert(insertIndex, removedItem);
              });
            },
          ),
        ),
      );
  }

  void _editItem(CartItemData item) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Bạn có thể chỉnh sửa ghi chú cho "${item.name}" ở bước tiếp theo.',
          ),
        ),
      );
  }

  void _handleAddItem() {
    setState(() {
      _items.add(
        const CartItemData(
          id: 'extra-burger',
          name: 'Burger Gà Phi-lê Giòn Rùm',
          imageAsset: 'assets/images/cart/burger.png',
          originalPrice: 50000,
          discountPrice: 35000,
          quantity: 1,
        ),
      );
    });
  }

  void _handleCheckoutInfoTap() {
    if (widget.onRequestCheckoutInfo != null) {
      widget.onRequestCheckoutInfo!.call();
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(
            'Thông tin giao hàng và thanh toán đã được chọn cho màn hình này.',
          ),
        ),
      );
  }

  Future<void> _handleDiscountTap() async {
    if (widget.onOpenDiscounts != null) {
      final result = await widget.onOpenDiscounts!(
        Set<String>.from(_selectedPromotionIds),
      );
      if (result != null && mounted) {
        setState(() {
          _selectedPromotionIds = result;
        });
      }
      return;
    }

    _handleCheckoutInfoTap();
  }

  static List<CartItemData> _buildInitialItems() {
    return const [
      CartItemData(
        id: 'burger',
        name: 'Burger Gà Phi-lê Giòn Rùm',
        imageAsset: 'assets/images/cart/burger.png',
        originalPrice: 50000,
        discountPrice: 35000,
        quantity: 1,
        extras: [
          CartExtraData(label: 'Thêm phô mai', price: 5000),
          CartExtraData(label: 'Thêm nhân thịt', price: 10000),
        ],
      ),
      CartItemData(
        id: 'drink',
        name: 'Soda Chanh Tuyết',
        imageAsset: 'assets/images/cart/drink.png',
        originalPrice: 20000,
        discountPrice: 15000,
        quantity: 1,
      ),
      CartItemData(
        id: 'fries',
        name: 'Khoai Tây',
        imageAsset: 'assets/images/cart/fries.png',
        discountPrice: 20000,
        quantity: 1,
      ),
    ];
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
    required this.onEdit,
  });

  final CartItemData item;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onRemove;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A0D0A2C),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CartImage(imageAsset: item.imageAsset),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
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
                          color: _CartScreenState._neutral900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (item.originalPrice != null) ...[
                            Text(
                              _formatCurrency(item.originalPrice!),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: _CartScreenState._neutral200,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Flexible(
                            child: Text(
                              _formatCurrency(item.discountPrice),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _CartScreenState._primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _QuantityButton(
                            icon: Icons.remove,
                            onTap: onDecrease,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${item.quantity}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: _CartScreenState._neutral900,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _QuantityButton(icon: Icons.add, onTap: onIncrease),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 18,
                      height: 18,
                    ),
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 18,
                      color: _CartScreenState._neutral100,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 18,
                      height: 18,
                    ),
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: _CartScreenState._neutral100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (item.extras.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Divider(height: 1, color: _CartScreenState._neutral50),
            const SizedBox(height: 10),
            for (var index = 0; index < item.extras.length; index++) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.extras[index].label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: _CartScreenState._neutral900,
                      ),
                    ),
                  ),
                  Text(
                    _formatCurrency(item.extras[index].price),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _CartScreenState._primary,
                    ),
                  ),
                ],
              ),
              if (index != item.extras.length - 1) const SizedBox(height: 8),
            ],
          ],
        ],
      ),
    );
  }
}

class _CartImage extends StatelessWidget {
  const _CartImage({required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 75,
        height: 75,
        child: Image.asset(
          imageAsset,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) {
            return Container(
              color: _CartScreenState._neutral50,
              alignment: Alignment.center,
              child: const Icon(
                Icons.fastfood_rounded,
                color: _CartScreenState._primary,
                size: 28,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(color: _CartScreenState._neutral50),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: SizedBox(
          width: 26,
          height: 26,
          child: Icon(icon, size: 18, color: _CartScreenState._neutral900),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.onTap,
    this.cardKey,
    this.title,
    this.customTitle,
    this.value,
    this.valueStyle,
    this.tags = const [],
  });

  final IconData icon;
  final VoidCallback onTap;
  final Key? cardKey;
  final String? title;
  final Widget? customTitle;
  final String? value;
  final TextStyle? valueStyle;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: cardKey,
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.fromLTRB(16, 16, 4, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _CartScreenState._neutral50),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: _CartScreenState._iconAccent, size: 20),
                      const SizedBox(width: 8),
                      // ignore: use_null_aware_elements
                      if (customTitle != null) Expanded(child: customTitle!),
                      if (customTitle == null && title != null)
                        Expanded(
                          child: Text(
                            title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: _CartScreenState._neutral900,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (value != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      value!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: valueStyle,
                    ),
                  ],
                  if (tags.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        for (final tag in tags)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2.5,
                            ),
                            decoration: BoxDecoration(
                              color: _CartScreenState._secondary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 36,
              color: _CartScreenState._neutral100,
            ),
          ],
        ),
      ),
    );
  }
}

class _BillRow extends StatelessWidget {
  const _BillRow({
    required this.label,
    required this.value,
    this.large = false,
    this.valueKey,
  });

  final String label;
  final String value;
  final bool large;
  final Key? valueKey;

  @override
  Widget build(BuildContext context) {
    final fontSize = large ? 18.0 : 16.0;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: _CartScreenState._neutral900,
            ),
          ),
        ),
        Text(
          value,
          key: valueKey ??
              (large
                  ? const Key('cart-total-value')
                  : value.startsWith('-')
                  ? const Key('cart-discount-value')
                  : null),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: _CartScreenState._neutral900,
          ),
        ),
      ],
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.icon, required this.onTap});

  final IconData icon;
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
          child: Icon(icon, size: 24, color: _CartScreenState._neutral900),
        ),
      ),
    );
  }
}

class CartItemData {
  const CartItemData({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.discountPrice,
    required this.quantity,
    this.originalPrice,
    this.extras = const [],
  });

  final String id;
  final String name;
  final String imageAsset;
  final int? originalPrice;
  final int discountPrice;
  final int quantity;
  final List<CartExtraData> extras;

  CartItemData copyWith({
    String? id,
    String? name,
    String? imageAsset,
    int? originalPrice,
    int? discountPrice,
    int? quantity,
    List<CartExtraData>? extras,
  }) {
    return CartItemData(
      id: id ?? this.id,
      name: name ?? this.name,
      imageAsset: imageAsset ?? this.imageAsset,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPrice: discountPrice ?? this.discountPrice,
      quantity: quantity ?? this.quantity,
      extras: extras ?? this.extras,
    );
  }
}

class CartExtraData {
  const CartExtraData({required this.label, required this.price});

  final String label;
  final int price;
}

String _formatCurrency(int amount) {
  final digits = amount.toString();
  final buffer = StringBuffer();

  for (var index = 0; index < digits.length; index++) {
    final positionFromEnd = digits.length - index;
    buffer.write(digits[index]);
    if (positionFromEnd > 1 && positionFromEnd % 3 == 1) {
      buffer.write('.');
    }
  }

  return '${buffer.toString()} đ';
}

bool _setEquals(Set<String> left, Set<String> right) {
  if (left.length != right.length) {
    return false;
  }
  for (final item in left) {
    if (!right.contains(item)) {
      return false;
    }
  }
  return true;
}
