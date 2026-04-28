import 'package:flutter/material.dart';

import '../Home/app_routes.dart';
import 'hoso_routes.dart';
import 'profile_views.dart';

class Hoso2 extends StatelessWidget {
  const Hoso2({super.key});

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
        SettingRow(title: 'T\u1ef1 \u0111\u1ed9ng c\u1eadp nh\u1eadt'),
        SettingRow(
          title: '\u0110i\u1ec1u kho\u1ea3n d\u1ecbch v\u1ee5',
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 11,
            color: Color(0xFF2B2B2B),
          ),
        ),
        SettingRow(
          title: 'Ch\u00ednh s\u00e1ch b\u1ea3o m\u1eadt',
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 11,
            color: Color(0xFF2B2B2B),
          ),
        ),
        SettingRow(
          title: 'V\u1ec1 \u1ee9ng d\u1ee5ng',
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 11,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ],
      onBack: () => Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home01,
        (route) => false,
      ),
      onEdit: () => Navigator.pushNamed(context, HoSoRoutes.hoso3),
      onLogout: () => Navigator.pushNamed(context, HoSoRoutes.hoso4),
      selectedBottom: 4,
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
