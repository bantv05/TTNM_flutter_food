import 'package:flutter/material.dart';

import 'hoso_routes.dart';
import 'profile_views.dart';

class Hoso3 extends StatelessWidget {
  const Hoso3({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileShell(
      extraItems: const [
        SizedBox(height: 10),
        SettingRow(title: 'Ch\u1ebf \u0111\u1ed9 t\u1ed1i'),
        SettingRow(title: 'T\u1ef1 \u0111\u1ed9ng c\u1eadp nh\u1eadt'),
      ],
      onBack: () => Navigator.pushReplacementNamed(context, HoSoRoutes.hoso1),
      onEdit: () {},
      onLogout: () => Navigator.pushNamed(context, HoSoRoutes.hoso4),
      selectedBottom: 4,
      hideLogoutButton: true,
      backgroundTint: const Color(0xFFD6D6D6),
      bottomSheet: const ProfileEditorSheet(),
    );
  }
}
