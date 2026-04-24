import 'package:flutter/material.dart';

import 'address_map_editor_view.dart';
import 'diachi4_routes.dart';

class Diachi4 extends StatelessWidget {
  const Diachi4({super.key});

  @override
  Widget build(BuildContext context) {
    return AddressMapEditorView(
      addressValue: '570 N\u00fai Th\u00e0nh, H\u00f2a C\u01b0\u1eddng, \u0110\u00e0 N\u1eb5ng',
      nameValue: 'Nh\u00e0 Ri\u00eang',
      mapImagePath: 'assets/images/diachi_map_2.png',
      onBack: () => Navigator.pushReplacementNamed(context, DiaChi4Routes.diachi3),
      onSave: () => Navigator.pushNamed(context, DiaChi4Routes.diachi5),
    );
  }
}
