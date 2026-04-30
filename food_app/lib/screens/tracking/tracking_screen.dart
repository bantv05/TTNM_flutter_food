import 'dart:async';

import 'package:flutter/material.dart';

import '../cancelorder/cancelorder1.dart';
import '../rating/rating01.dart';

const Color trackingPrimary = Color(0xFFFF9900);
const Color trackingNeutral900 = Color(0xFF0D1217);
const Color trackingNeutral400 = Color(0xFF4C555F);
const Color trackingNeutral100 = Color(0xFFBABDC1);
const Color trackingNeutral50 = Color(0xFFE9EAEB);
const String trackingDriverAvatar = 'assets/images/custom/driver_minh.png';

enum TrackingStage { searching, step1, step2, step3, step4, success }

class TrackingFlowScreen extends StatefulWidget {
  const TrackingFlowScreen({
    super.key,
    required this.stage,
    this.nextRouteName,
  });

  final TrackingStage stage;
  final String? nextRouteName;

  @override
  State<TrackingFlowScreen> createState() => _TrackingFlowScreenState();
}

class _TrackingFlowScreenState extends State<TrackingFlowScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.nextRouteName != null) {
      _timer = Timer(const Duration(seconds: 5), () {
        if (!mounted) {
          return;
        }
        Navigator.of(context).pushReplacementNamed(widget.nextRouteName!);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  bool get showDriverCard => widget.stage != TrackingStage.searching;
  bool get showBaseRoute => widget.stage != TrackingStage.searching;
  bool get showDriverMarker => widget.stage == TrackingStage.step3;
  bool get showSuccessOverlay => widget.stage == TrackingStage.success;
  bool get canCancel =>
      widget.stage == TrackingStage.searching ||
      widget.stage == TrackingStage.step1;

  int get activeStepCount {
    switch (widget.stage) {
      case TrackingStage.searching:
        return 0;
      case TrackingStage.step1:
        return 1;
      case TrackingStage.step2:
        return 2;
      case TrackingStage.step3:
        return 3;
      case TrackingStage.step4:
      case TrackingStage.success:
        return 4;
    }
  }

  double get routeStartProgress {
    switch (widget.stage) {
      case TrackingStage.step4:
      case TrackingStage.success:
        return 0.72;
      default:
        return 0;
    }
  }

  double get routeEndProgress {
    switch (widget.stage) {
      case TrackingStage.step3:
        return 0.72;
      case TrackingStage.step4:
      case TrackingStage.success:
        return 1;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 393),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 88,
                        bottom: 0,
                        child: _TrackingMap(
                          showBaseRoute: showBaseRoute,
                          showDriverMarker: showDriverMarker,
                          routeStartProgress: routeStartProgress,
                          routeEndProgress: routeEndProgress,
                        ),
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        top: 24,
                        child: _TrackingHeader(
                          onBack: () => Navigator.of(context).maybePop(),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: _TrackingBottomSheet(
                          showDriverCard: showDriverCard,
                          activeStepCount: activeStepCount,
                          canCancel: canCancel,
                          useEstimatedCopy:
                              widget.stage == TrackingStage.success,
                          onCancel: canCancel
                              ? () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => const CancelOrder01Screen(),
                                    ),
                                  );
                                }
                              : null,
                        ),
                      ),
                      if (showSuccessOverlay)
                        Positioned.fill(
                          child: _SuccessOverlay(
                            onClose: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(Rating01Screen.routeName);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TrackingHeader extends StatelessWidget {
  const _TrackingHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RoundIconButton(icon: Icons.arrow_back_rounded, onTap: onBack),
        const Expanded(
          child: Text(
            'Theo dõi đơn hàng',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: trackingNeutral900,
            ),
          ),
        ),
        const SizedBox(width: 42, height: 42),
      ],
    );
  }
}

class _TrackingMap extends StatelessWidget {
  const _TrackingMap({
    required this.showBaseRoute,
    required this.showDriverMarker,
    required this.routeStartProgress,
    required this.routeEndProgress,
  });

  final bool showBaseRoute;
  final bool showDriverMarker;
  final double routeStartProgress;
  final double routeEndProgress;

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/tracking/map_base.png',
              fit: BoxFit.fill,
              errorBuilder: (_, _, _) {
                return Container(
                  color: const Color(0xFFEAF3FF),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.map_outlined,
                    size: 56,
                    color: trackingPrimary,
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: routeStartProgress,
                end: routeEndProgress,
              ),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeInOut,
              builder: (context, value, _) {
                return CustomPaint(
                  painter: _RoutePainter(
                    showBaseRoute: showBaseRoute,
                    activeProgress: value,
                  ),
                );
              },
            ),
          ),
          const Positioned(left: 78, bottom: 132, child: _ShopMarker()),
          const Positioned(left: 196, top: 28, child: _DestinationMarker()),
          if (showDriverMarker)
            Positioned.fill(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: routeStartProgress,
                  end: routeEndProgress,
                ),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeInOut,
                builder: (context, value, _) {
                  return CustomPaint(painter: _DriverPainter(progress: value));
                },
              ),
            ),
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 20,
                    offset: Offset(6, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.gps_fixed_rounded,
                size: 20,
                color: trackingNeutral900,
              ),
            ),
          ),
        ],
      );
    }
  }

  class _TrackingBottomSheet extends StatelessWidget {
    const _TrackingBottomSheet({
      required this.showDriverCard,
      required this.activeStepCount,
      required this.canCancel,
      required this.useEstimatedCopy,
      this.onCancel,
    });

    final bool showDriverCard;
    final int activeStepCount;
    final bool canCancel;
    final bool useEstimatedCopy;
    final VoidCallback? onCancel;

    @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 340,
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0x33000000),
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            const SizedBox(height: 24),
            if (showDriverCard) const _DriverCard() else const _SearchingCard(),
            const SizedBox(height: 24),
            _TrackingProgressBar(activeStepCount: activeStepCount),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    useEstimatedCopy
                        ? 'Thời gian giao hàng ước tính'
                        : 'Thời gian giao hàng dự kiến',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: trackingNeutral900,
                    ),
                  ),
                ),
                const Text(
                  '10:25',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: trackingNeutral400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Đơn hàng của tôi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: trackingNeutral900,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Chi tiết đơn hàng sẽ được cập nhật sau.',
                          ),
                        ),
                      );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: trackingPrimary,
                    side: const BorderSide(color: trackingPrimary),
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text('Chi tiết'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 53,
              child: FilledButton(
                onPressed: canCancel ? onCancel : null,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.white,
                  foregroundColor: trackingPrimary,
                  disabledForegroundColor:
                      trackingPrimary.withValues(alpha: 0.3),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: Text(
                  'Hủy đơn hàng',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: canCancel
                        ? trackingPrimary
                        : trackingPrimary.withValues(alpha: 0.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchingCard extends StatelessWidget {
  const _SearchingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFDEEA7), Color(0xFFFAB53C)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A0D0A2C),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white24,
            backgroundImage: AssetImage(trackingDriverAvatar),
          ),
          SizedBox(width: 16),
          Text(
            'Đang tìm tài xế...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverCard extends StatelessWidget {
  const _DriverCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFDEEA7), Color(0xFFFAB53C)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A0D0A2C),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(trackingDriverAvatar),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Minh',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: trackingNeutral900,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 13,
                          color: Color(0xFF6B5400),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B5400),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'ID DW2125',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B5400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const _SmallActionButton(icon: Icons.chat_bubble_outline_rounded),
          const SizedBox(width: 8),
          const _SmallActionButton(icon: Icons.call_outlined),
        ],
      ),
    );
  }
}

class _SmallActionButton extends StatelessWidget {
  const _SmallActionButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0D0A2C),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, size: 24, color: trackingNeutral900),
    );
  }
}

class _TrackingProgressBar extends StatelessWidget {
  const _TrackingProgressBar({required this.activeStepCount});

  final int activeStepCount;

  static const List<IconData> icons = [
    Icons.storefront_rounded,
    Icons.inventory_2_rounded,
    Icons.delivery_dining_rounded,
    Icons.check_circle_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < icons.length; index++) ...[
          _ProgressNode(icon: icons[index], active: index < activeStepCount),
          if (index != icons.length - 1)
            Expanded(
              child: Container(
                height: 2,
                color: index < activeStepCount - 1
                    ? trackingPrimary
                    : trackingNeutral50,
              ),
            ),
        ],
      ],
    );
  }
}

class _ProgressNode extends StatelessWidget {
  const _ProgressNode({required this.icon, required this.active});

  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: trackingNeutral50),
      ),
      child: Icon(
        icon,
        size: 18,
        color: active ? trackingPrimary : trackingNeutral100,
      ),
    );
  }
}

class _SuccessOverlay extends StatelessWidget {
  const _SuccessOverlay({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x99DBD6CE),
      alignment: Alignment.center,
      child: Container(
        width: 345,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Giao hàng thành công',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF291C0A),
                  ),
                ),
                const SizedBox(height: 24),
                const Icon(
                  Icons.eco_rounded,
                  size: 140,
                  color: Color(0xFF79C441),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Thưởng thức bữa ăn của bạn!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: trackingNeutral900,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hẹn gặp lại trong đơn hàng tiếp theo!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: trackingNeutral400,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: FilledButton(
                    onPressed: onClose,
                    style: FilledButton.styleFrom(
                      backgroundColor: trackingPrimary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: onClose,
                icon: const Icon(
                  Icons.close_rounded,
                  size: 26,
                  color: Color(0xFFDBD6CE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F0D0A2C),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, size: 24, color: trackingNeutral900),
        ),
      ),
    );
  }
}

class _ShopMarker extends StatelessWidget {
  const _ShopMarker();

  @override
  Widget build(BuildContext context) {
    return _PinMarker(
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: const Color(0xFFFFC700),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.storefront_rounded,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _DestinationMarker extends StatelessWidget {
  const _DestinationMarker();

  @override
  Widget build(BuildContext context) {
    return _PinMarker(
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: trackingPrimary, width: 2),
        ),
        alignment: Alignment.center,
        child: const Text(
          'A',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: trackingNeutral900,
          ),
        ),
      ),
    );
  }
}

class _PinMarker extends StatelessWidget {
  const _PinMarker({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 42,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(top: 0, child: child),
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: const Size(12, 10),
              painter: _PinTailPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PinTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xAA0D0A2C);
    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RoutePainter extends CustomPainter {
  const _RoutePainter({
    required this.showBaseRoute,
    required this.activeProgress,
  });

  final bool showBaseRoute;
  final double activeProgress;

  static List<Offset> points(Size size) {
    return [
      Offset(size.width * 0.32, size.height * 0.58),
      Offset(size.width * 0.57, size.height * 0.48),
      Offset(size.width * 0.50, size.height * 0.26),
      Offset(size.width * 0.58, size.height * 0.22),
      Offset(size.width * 0.56, size.height * 0.12),
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()..moveTo(points(size).first.dx, points(size).first.dy);
    for (final point in points(size).skip(1)) {
      path.lineTo(point.dx, point.dy);
    }

    final grayPaint = Paint()
      ..color = const Color(0xFF8F9499)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final orangePaint = Paint()
      ..color = trackingPrimary
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    if (showBaseRoute) {
      canvas.drawPath(path, grayPaint);
    }

    if (activeProgress > 0) {
      final metric = path.computeMetrics().first;
      final activePath = metric.extractPath(0, metric.length * activeProgress);
      canvas.drawPath(activePath, orangePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _RoutePainter oldDelegate) {
    return showBaseRoute != oldDelegate.showBaseRoute ||
        activeProgress != oldDelegate.activeProgress;
  }
}

class _DriverPainter extends CustomPainter {
  const _DriverPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0 || progress >= 1) {
      return;
    }

    final route = Path()
      ..moveTo(
        _RoutePainter.points(size).first.dx,
        _RoutePainter.points(size).first.dy,
      );
    for (final point in _RoutePainter.points(size).skip(1)) {
      route.lineTo(point.dx, point.dy);
    }

    final metric = route.computeMetrics().first;
    final tangent = metric.getTangentForOffset(metric.length * progress);
    if (tangent == null) {
      return;
    }

    final center = tangent.position;
    final shadow = Paint()..color = Colors.black.withValues(alpha: 0.14);
    canvas.drawCircle(center.translate(0, 2), 14, shadow);

    final outer = Paint()..color = trackingPrimary;
    final inner = Paint()..color = Colors.white;
    final body = Paint()..color = trackingNeutral900;

    canvas.drawCircle(center, 14, outer);
    canvas.drawCircle(center, 11, inner);
    canvas.drawCircle(center, 7, body);
  }

  @override
  bool shouldRepaint(covariant _DriverPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
