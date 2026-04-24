import 'package:flutter/material.dart';

import 'hoso_routes.dart';
import 'profile_views.dart';

class Hoso4 extends StatelessWidget {
  const Hoso4({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileShell(
      extraItems: const [
        SizedBox(height: 10),
        SettingRow(
          title: 'Ng\u00f4n ng\u1eef',
          trailing: _LanguageBox(),
        ),
        SettingRow(title: 'Th\u00f4ng b\u00e1o \u0111\u1ea9y'),
        SettingRow(title: 'Ch\u1ebf \u0111\u1ed9 t\u1ed1i'),
        SettingRow(title: '\u00c2m thanh'),
      ],
      onBack: () => Navigator.pushReplacementNamed(context, HoSoRoutes.hoso1),
      onEdit: () => Navigator.pushReplacementNamed(context, HoSoRoutes.hoso3),
      onLogout: () {},
      selectedBottom: 4,
      backgroundTint: const Color(0xFFD6D6D6),
      overlayDialog: const LogoutDialogCard(),
    );
  }
}

class _LanguageBox extends StatelessWidget {
  const _LanguageBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD8D8D8)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ti\u1ebfng Vi\u1ec7t',
            style: TextStyle(fontSize: 10, color: Color(0xFF303030)),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 12,
            color: Color(0xFF606060),
          ),
        ],
      ),
    );
  }
}
