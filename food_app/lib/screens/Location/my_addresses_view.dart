import 'package:flutter/material.dart';

class MyAddressesView extends StatelessWidget {
  const MyAddressesView({
    super.key,
    required this.selectedIndex,
    required this.onBack,
    required this.onAddNew,
    required this.onSave,
  });

  final int selectedIndex;
  final VoidCallback onBack;
  final VoidCallback onAddNew;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _CircleBackButton(onTap: onBack),
                      ),
                      const Text(
                        '\u0110\u1ecba ch\u1ec9 c\u1ee7a t\u00f4i',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _AddressTile(
                  title: 'Nh\u00e0 ri\u00eang',
                  subtitle: '570 Nui Thanh, Hoa Cuong, Da Nang',
                  selected: selectedIndex == 0,
                ),
                const SizedBox(height: 10),
                _AddressTile(
                  title: 'C\u00f4ng ty',
                  subtitle: '32 Duong Thuong, Hoa Cuong, Da Nang',
                  selected: selectedIndex == 1,
                ),
                const SizedBox(height: 10),
                _AddressTile(
                  title: 'C\u00f4ng ty 2',
                  subtitle: '152 Luong Nhu Hoc, Cam Le, Da Nang',
                  selected: selectedIndex == 2,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: onAddNew,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD79A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: Color(0xFFFF9900),
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Th\u00eam \u0111\u1ecba ch\u1ec9 m\u1edbi',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFFF9900),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                  child: InkWell(
                    onTap: onSave,
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9800),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'L\u01b0u',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressTile extends StatelessWidget {
  const _AddressTile({
    required this.title,
    required this.subtitle,
    required this.selected,
  });

  final String title;
  final String subtitle;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE8E8E8)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF303030),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? const Color(0xFFFF8F00)
                      : const Color(0xFFCFCFCF),
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFFF8F00) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleBackButton extends StatelessWidget {
  const _CircleBackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 32,
          height: 32,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 14,
            color: Color(0xFF262626),
          ),
        ),
      ),
    );
  }
}
