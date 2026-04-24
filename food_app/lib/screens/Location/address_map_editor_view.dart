import 'package:flutter/material.dart';

class AddressMapEditorView extends StatelessWidget {
  const AddressMapEditorView({
    super.key,
    required this.addressValue,
    required this.nameValue,
    required this.mapImagePath,
    required this.onBack,
    required this.onSave,
  });

  final String addressValue;
  final String nameValue;
  final String mapImagePath;
  final VoidCallback onBack;
  final VoidCallback onSave;

  bool get isFilled => addressValue.isNotEmpty || nameValue.isNotEmpty;

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
                        'Th\u00eam \u0111\u1ecba ch\u1ec9 m\u1edbi',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _MapFrame(imagePath: mapImagePath),
                const SizedBox(height: 10),
                Container(
                  width: 54,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD0D0D0),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'V\u1ecb tr\u00ed',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202020),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _FieldCard(
                    hint: 'V\u1ecb tr\u00ed c\u1ee7a b\u1ea1n',
                    value: addressValue,
                    trailing: const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Color(0xFF303030),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _FieldCard(
                    hint: 'T\u00ean v\u1ecb tr\u00ed',
                    value: nameValue,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                  child: InkWell(
                    onTap: onSave,
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: isFilled
                            ? const Color(0xFFFF9800)
                            : const Color(0xFFFFD79A),
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

class _MapFrame extends StatelessWidget {
  const _MapFrame({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: 356,
        width: double.infinity,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, error, stackTrace) {
            return Container(
              color: const Color(0xFFF2F2F2),
              alignment: Alignment.center,
              child: const Icon(
                Icons.map_outlined,
                size: 40,
                color: Color(0xFFBDBDBD),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FieldCard extends StatelessWidget {
  const _FieldCard({
    required this.hint,
    required this.value,
    this.trailing,
  });

  final String hint;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value.isEmpty ? hint : value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: value.isEmpty ? FontWeight.w400 : FontWeight.w600,
                color: value.isEmpty
                    ? const Color(0xFFB8B8B8)
                    : const Color(0xFF202020),
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
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
