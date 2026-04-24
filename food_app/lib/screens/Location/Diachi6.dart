import 'package:flutter/material.dart';

import '../Home/app_routes.dart';
import 'diachi4_routes.dart';
import 'my_addresses_view.dart';

class Diachi6 extends StatelessWidget {
  const Diachi6({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAddressesView(
      selectedIndex: 0,
      onBack: () => Navigator.pushReplacementNamed(context, DiaChi4Routes.diachi5),
      onAddNew: () => Navigator.pushNamed(context, DiaChi4Routes.diachi3),
      onSave: () => Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home02,
        (route) => false,
      ),
    );
  }
}
