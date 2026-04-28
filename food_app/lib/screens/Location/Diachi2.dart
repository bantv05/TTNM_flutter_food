import 'package:flutter/material.dart';

import '../Home/app_routes.dart';
import 'address_selection_view.dart';
import 'diachi4_routes.dart';
import 'diachi_routes.dart';

class Diachi2 extends StatelessWidget {
  const Diachi2({super.key});

  @override
  Widget build(BuildContext context) {
    return AddressSelectionView(
      selectedIndex: 0,
      onBack: () => Navigator.pushReplacementNamed(context, DiaChiRoutes.diachi1),
      onAddNew: () => Navigator.pushNamed(context, DiaChi4Routes.diachi3),
      onConfirm: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.home02,
          (route) => false,
        );
      },
    );
  }
}
