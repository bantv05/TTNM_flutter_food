import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/Home/Home01.dart';
import 'screens/Home/Home02.dart';
import 'screens/Home/app_routes.dart';
import 'screens/Location/Diachi1.dart';
import 'screens/Location/Diachi2.dart';
import 'screens/Location/Diachi3.dart';
import 'screens/Location/Diachi4.dart';
import 'screens/Location/Diachi5.dart';
import 'screens/Location/Diachi6.dart';
import 'screens/Location/diachi4_routes.dart';
import 'screens/Location/diachi_routes.dart';
import 'screens/Profile/Hoso1.dart';
import 'screens/Profile/Hoso2.dart';
import 'screens/Profile/Hoso3.dart';
import 'screens/Profile/Hoso4.dart';
import 'screens/Profile/hoso_routes.dart';
import 'screens/batdau.dart';
import 'screens/burger/burger01.dart';
import 'screens/burger/burger02.dart';
import 'screens/burger/burger03.dart';
import 'screens/burger/burger04.dart';
import 'screens/burger/burger05.dart';
import 'screens/burger/burger06.dart';
import 'screens/burger/burger07.dart';
import 'screens/burger/burger08.dart';
import 'screens/burger/burger09.dart';
import 'screens/burger/burger10.dart';
import 'screens/burger/burger_widgets.dart';
import 'screens/cart/cart01.dart';
import 'screens/cart/cart02.dart';
import 'screens/discount/discount01.dart';
import 'screens/discount/discount02.dart';
import 'screens/liked.dart';
import 'screens/order/order01.dart';
import 'screens/rating/rating01.dart';
import 'screens/rating/rating02.dart';
import 'screens/rating/rating03.dart';
import 'screens/rating/rating04.dart';
import 'screens/tracking/tracking01.dart';
import 'screens/tracking/tracking02.dart';
import 'screens/tracking/tracking03.dart';
import 'screens/tracking/tracking04.dart';
import 'screens/tracking/tracking05.dart';
import 'screens/tracking/tracking06.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App Flows',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: BurgerColors.primary,
          primary: BurgerColors.primary,
          secondary: BurgerColors.sun,
          surface: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: BurgerColors.ink,
              displayColor: BurgerColors.ink,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: BurgerColors.line),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: BurgerColors.primary,
              width: 1.4,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
        ),
      ),
      builder: (context, child) {
        return _PhoneFrameShell(child: child ?? const SizedBox.shrink());
      },
      home: const BatDauScreen(),
      routes: {
        Burger01Screen.routeName: (_) => const Burger01Screen(),
        Burger02Screen.routeName: (_) => const Burger02Screen(),
        Burger03Screen.routeName: (_) => const Burger03Screen(),
        Burger04Screen.routeName: (_) => const Burger04Screen(),
        Burger05Screen.routeName: (_) => const Burger05Screen(),
        Burger06Screen.routeName: (_) => const Burger06Screen(),
        Burger07Screen.routeName: (_) => const Burger07Screen(),
        Burger08Screen.routeName: (_) => const Burger08Screen(),
        Burger09Screen.routeName: (_) => const Burger09Screen(),
        Burger10Screen.routeName: (_) => const Burger10Screen(),
        Cart01Screen.routeName: (_) => const Cart01Screen(),
        Cart02Screen.routeName: (_) => const Cart02Screen(),
        Discount01Screen.routeName: (_) => const Discount01Screen(),
        Discount02Screen.routeName: (_) => const Discount02Screen(),
        Rating01Screen.routeName: (_) => const Rating01Screen(),
        Rating02Screen.routeName: (_) => const Rating02Screen(),
        Rating03Screen.routeName: (_) => const Rating03Screen(),
        Rating04Screen.routeName: (_) => const Rating04Screen(),
        Tracking01Screen.routeName: (_) => const Tracking01Screen(),
        Tracking02Screen.routeName: (_) => const Tracking02Screen(),
        Tracking03Screen.routeName: (_) => const Tracking03Screen(),
        Tracking04Screen.routeName: (_) => const Tracking04Screen(),
        Tracking05Screen.routeName: (_) => const Tracking05Screen(),
        Tracking06Screen.routeName: (_) => const Tracking06Screen(),
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
