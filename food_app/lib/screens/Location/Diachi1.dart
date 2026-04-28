import 'package:flutter/material.dart';

import '../Home/app_routes.dart';
import 'address_selection_view.dart';
import 'diachi4_routes.dart';
import 'diachi_routes.dart';

class Diachi1 extends StatelessWidget {
  const Diachi1({super.key});

  @override
  Widget build(BuildContext context) {
    return AddressSelectionView(
      selectedIndex: null,
      onBack: () => Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home01,
        (route) => false,
      ),
      onAddNew: () => Navigator.pushNamed(context, DiaChi4Routes.diachi3),
      onConfirm: () => Navigator.pushNamed(context, DiaChiRoutes.diachi2),
    );
  }
}
