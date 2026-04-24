import 'package:flutter/material.dart';

import 'address_map_editor_view.dart';
import 'diachi4_routes.dart';
import 'diachi_routes.dart';

class Diachi3 extends StatelessWidget {
  const Diachi3({super.key});

  @override
  Widget build(BuildContext context) {
    return AddressMapEditorView(
      addressValue: '',
      nameValue: '',
      mapImagePath: 'assets/images/diachi_map_1.png',
      onBack: () => Navigator.pushReplacementNamed(context, DiaChiRoutes.diachi1),
      onSave: () => Navigator.pushNamed(context, DiaChi4Routes.diachi4),
    );
  }
}
