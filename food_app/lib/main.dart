import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/Profile/Hoso1.dart';
import 'screens/Profile/Hoso2.dart';
import 'screens/Profile/Hoso3.dart';
import 'screens/Profile/Hoso4.dart';
import 'screens/Profile/hoso_routes.dart';
import 'screens/Location/Diachi1.dart';
import 'screens/Location/Diachi2.dart';
import 'screens/Location/diachi_routes.dart';
import 'screens/Location/Diachi3.dart';
import 'screens/Location/Diachi4.dart';
import 'screens/Location/Diachi5.dart';
import 'screens/Location/Diachi6.dart';
import 'screens/Location/diachi4_routes.dart';
import 'screens/Home/app_routes.dart';
import 'screens/Home/Home01.dart';
import 'screens/Home/Home02.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ViNa Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF97316),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      builder: (context, child) {
        return _PhoneFrameShell(child: child ?? const SizedBox.shrink());
      },
      initialRoute: AppRoutes.home01,
      routes: {
        DiaChiRoutes.diachi1: (context) => const Diachi1(),
        DiaChiRoutes.diachi2: (context) => const Diachi2(),
        DiaChi4Routes.diachi3: (context) => const Diachi3(),
        DiaChi4Routes.diachi4: (context) => const Diachi4(),
        DiaChi4Routes.diachi5: (context) => const Diachi5(),
        DiaChi4Routes.diachi6: (context) => const Diachi6(),
        HoSoRoutes.hoso1: (context) => const Hoso1(),
        HoSoRoutes.hoso2: (context) => const Hoso2(),
        HoSoRoutes.hoso3: (context) => const Hoso3(),
        HoSoRoutes.hoso4: (context) => const Hoso4(),
        AppRoutes.home01: (context) => const Home01(),
        AppRoutes.home02: (context) => const Home02(),
      },
    );
  }
}

class _PhoneFrameShell extends StatelessWidget {
  const _PhoneFrameShell({required this.child});

  final Widget child;

  static const double _phoneWidth = 390;
  static const double _phoneHeight = 844;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool useFrame =
            kIsWeb ||
            constraints.maxWidth >= 560 ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.linux;

        if (!useFrame) {
          return child;
        }

        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final double scale = [
          width / (_phoneWidth + 56),
          height / (_phoneHeight + 56),
          1.0,
        ].reduce((value, element) => value < element ? value : element);

        final double frameWidth = _phoneWidth * scale;
        final double frameHeight = _phoneHeight * scale;

        return ColoredBox(
          color: const Color(0xFFEAEFF3),
          child: Center(
            child: Container(
              width: frameWidth + 18,
              height: frameHeight + 18,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(42),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF111827), Color(0xFF2B3444)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 32,
                    offset: Offset(0, 18),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(34),
                child: Stack(
                  children: [
                    Positioned.fill(child: child),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 112,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
