import 'package:flutter/material.dart';

import '../Home/app_routes.dart';
import '../Location/diachi_routes.dart';
import '../liked.dart';
import '../order/order01.dart';

class ProfileShell extends StatelessWidget {
  const ProfileShell({
    super.key,
    required this.extraItems,
    required this.onBack,
    required this.onEdit,
    required this.onLogout,
    required this.selectedBottom,
    this.bottomSheet,
    this.overlayDialog,
    this.backgroundTint,
    this.hideLogoutButton = false,
  });

  final List<Widget> extraItems;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onLogout;
  final int selectedBottom;
  final Widget? bottomSheet;
  final Widget? overlayDialog;
  final Color? backgroundTint;
  final bool hideLogoutButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundTint ?? Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: backgroundTint != null
                  ? Border.all(color: Colors.white, width: 3)
                  : null,
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                      child: _Header(onBack: onBack),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                        child: Column(
                          children: [
                            _ProfileTopCard(onEdit: onEdit),
                            const SizedBox(height: 14),
                            if (!hideLogoutButton) ...[
                              _LogoutButton(onTap: onLogout),
                              const SizedBox(height: 14),
                            ],
                            _MenuItem(
                              icon: Icons.location_on_outlined,
                              title: '\u0110\u1ecba ch\u1ec9 c\u1ee7a t\u00f4i',
                              onTap: () => Navigator.pushNamed(
                                context,
                                DiaChiRoutes.diachi1,
                              ),
                            ),
                            const _MenuItem(
                              icon: Icons.confirmation_number_outlined,
                              title: '\u01afu \u0111\u00e3i c\u1ee7a t\u00f4i',
                            ),
                            const _MenuItem(
                              icon: Icons.credit_card_outlined,
                              title: 'Ph\u01b0\u01a1ng th\u1ee9c thanh to\u00e1n',
                            ),
                            const _MenuItem(
                              icon: Icons.message_outlined,
                              title: 'Tin nh\u1eafn',
                            ),
                            const _MenuItem(
                              icon: Icons.group_outlined,
                              title: 'M\u1eddi b\u1ea1n b\u00e8',
                            ),
                            _MenuItem(
                              icon: Icons.verified_user_outlined,
                              title: 'B\u1ea3o m\u1eadt',
                              onTap: onLogout,
                            ),
                            const _MenuItem(
                              icon: Icons.info_outline_rounded,
                              title: 'Trung t\u00e2m tr\u1ee3 gi\u00fap',
                            ),
                            ...extraItems,
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                    _BottomBar(selectedIndex: selectedBottom),
                  ],
                ),
                if (bottomSheet != null)
                  Positioned(left: 0, right: 0, bottom: 72, child: bottomSheet!),
                if (overlayDialog != null)
                  Positioned.fill(
                    child: Container(
                      color: const Color(0x52000000),
                      child: Center(child: overlayDialog),
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

class _Header extends StatelessWidget {
  const _Header({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.white,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onBack,
              child: const SizedBox(
                width: 30,
                height: 30,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 14,
                  color: Color(0xFF262626),
                ),
              ),
            ),
          ),
        ),
        const Text(
          'H\u1ed3 s\u01a1',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF202020),
          ),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Icon(
              Icons.more_horiz_rounded,
              size: 16,
              color: Color(0xFF202020),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileTopCard extends StatelessWidget {
  const _ProfileTopCard({required this.onEdit});

  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF293244), Color(0xFF111827)],
            ),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nguy\u1ec5n B\u00ecnh An',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF9800),
                ),
              ),
              SizedBox(height: 2),
              Text(
                '(+84) 20 1234 5629',
                style: TextStyle(fontSize: 9, color: Color(0xFF2E2E2E)),
              ),
              SizedBox(height: 2),
              Text(
                'binhan.abc.inc@gmail.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 8.5, color: Color(0xFF5E5E5E)),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onEdit,
          borderRadius: BorderRadius.circular(99),
          child: Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFFE79A24),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit_rounded, size: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD79A),
          borderRadius: BorderRadius.circular(999),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, size: 14, color: Color(0xFFFF8D00)),
            SizedBox(width: 8),
            Text(
              '\u0110\u0103ng xu\u1ea5t',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFF8D00),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 34,
        child: Row(
          children: [
            Icon(icon, size: 14, color: const Color(0xFF303030)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B2B2B),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
              color: Color(0xFF2B2B2B),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2B2B2B),
              ),
            ),
          ),
          trailing ?? const _FakeSwitch(enabled: false),
        ],
      ),
    );
  }
}

class _FakeSwitch extends StatelessWidget {
  const _FakeSwitch({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 14,
      decoration: BoxDecoration(
        color: const Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(99),
      ),
      alignment: enabled ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomIcon(
            icon: Icons.home_outlined,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home01,
              (route) => false,
            ),
          ),
          _BottomIcon(
            icon: Icons.receipt_long_outlined,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const Order01Screen(),
              ),
            ),
          ),
          _BottomIcon(
            icon: Icons.favorite_border_rounded,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LikedScreen(),
              ),
            ),
          ),
          const _BottomIcon(icon: Icons.notifications_none_rounded),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF293244), Color(0xFF111827)],
                  ),
                  border: Border.all(
                    color: selectedIndex == 4
                        ? const Color(0xFFFF9800)
                        : Colors.white,
                    width: 2,
                  ),
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 14),
              ),
              const SizedBox(height: 3),
              Text(
                'H\u1ed3 s\u01a1',
                style: TextStyle(
                  fontSize: 8,
                  color: selectedIndex == 4
                      ? const Color(0xFFFF9800)
                      : const Color(0xFF9C9C9C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  const _BottomIcon({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Icon(icon, size: 18, color: const Color(0xFFB8BDC6)),
    );
  }
}

class ProfileEditorSheet extends StatelessWidget {
  const ProfileEditorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFF202020),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Thay \u0111\u1ed5i th\u00f4ng tin ng\u01b0\u1eddi d\u00f9ng',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3A3A3A),
            ),
          ),
          const SizedBox(height: 12),
          const _EditorField(
            iconBox: 'VN',
            value: '(+84) 20 1234 5629',
          ),
          const SizedBox(height: 10),
          const _EditorField(
            icon: Icons.email_outlined,
            value: 'binhan.abc.inc@gmail.com',
          ),
          const SizedBox(height: 10),
          const _EditorField(
            icon: Icons.person_outline_rounded,
            value: 'Nguy\u1ec5n B\u00ecnh An',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'H\u1ee7y',
                    style: TextStyle(fontSize: 13, color: Color(0xFFB5B5B5)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9800),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'L\u01b0u',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EditorField extends StatelessWidget {
  const _EditorField({
    this.icon,
    this.iconBox,
    required this.value,
  });

  final IconData? icon;
  final String? iconBox;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          if (iconBox != null)
            Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFEE3131),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                iconBox!,
                style: TextStyle(
                  fontSize: 7,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          else
            Icon(icon, size: 14, color: const Color(0xFFA1A1A1)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Color(0xFF303030)),
            ),
          ),
        ],
      ),
    );
  }
}

class LogoutDialogCard extends StatelessWidget {
  const LogoutDialogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 206,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 8, 0),
            child: Row(
              children: [
                const Spacer(),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE5E5E5)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 10,
                    color: Color(0xFF9D9D9D),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            '\u0110\u0103ng xu\u1ea5t',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF262626),
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              'B\u1ea1n c\u00f3 ch\u1eafc ch\u1eafn mu\u1ed1n \u0111\u0103ng xu\u1ea5t\nkh\u00f4ng?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF303030),
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: Row(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'H\u1ee7y',
                      style: TextStyle(fontSize: 13, color: Color(0xFFB5B5B5)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9800),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '\u0110\u00fang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
