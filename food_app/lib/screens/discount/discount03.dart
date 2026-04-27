import 'package:flutter/material.dart';

import 'discount_models.dart';

class Discount03Screen extends StatelessWidget {
  const Discount03Screen({super.key, required this.promotion});

  static const routeName = '/discount/discount03';

  final PromotionData promotion;

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(color: const Color(0x33000000)),
                          ),
                        ),
                        const SizedBox(height: 36),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 798,
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 4,
                              decoration: BoxDecoration(
                                color: const Color(0x33000000),
                                borderRadius: BorderRadius.circular(11),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Thông tin khuyến mãi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0D1217),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFF6BE57),
                                            Color(0xFFFBD992),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.confirmation_num_rounded,
                                        size: 56,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      promotion.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF0D1217),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    _InfoTextBlock(
                                      title: 'Mô tả :',
                                      content: promotion.description,
                                    ),
                                    _InfoTextBlock(
                                      title: 'Thời hạn',
                                      content: promotion.dateRange,
                                    ),
                                    _InfoTextBlock(
                                      title: 'Mã giảm giá:',
                                      content: promotion.code == 'MIENPHI'
                                          ? 'MIỄN PHÍ'
                                          : promotion.code,
                                    ),
                                    _InfoTextBlock(
                                      title: 'Phạm vi áp dụng:',
                                      content: promotion.scope,
                                    ),
                                    _InfoTextBlock(
                                      title: 'Mức giảm giá:',
                                      content: promotion.discountText,
                                    ),
                                    _InfoTextBlock(
                                      title: 'Điều khoản và Điều kiện:',
                                      content: promotion.terms,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 135,
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xFF101010),
                                borderRadius: BorderRadius.circular(100),
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
    );
  }
}

class _InfoTextBlock extends StatelessWidget {
  const _InfoTextBlock({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D1217),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4C555F),
            ),
          ),
        ],
      ),
    );
  }
}
