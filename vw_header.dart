import 'package:flutter/material.dart';
import '../theme.dart';

class VwHeader extends StatelessWidget {
  final String name;
  final String role;
  final String? avatarUrl;

  const VwHeader({
    super.key,
    required this.name,
    required this.role,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(gradient: vwHorizonGradient),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: _GridPainter()),
          Align(
            alignment: const Alignment(0, -0.7),
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [VwColors.sun, Colors.transparent],
                  stops: [0.2, 1.0],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (avatarUrl != null && avatarUrl!.isNotEmpty)
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(avatarUrl!),
                  ),
                const SizedBox(height: 12),
                Text(
                  name.toUpperCase(),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    letterSpacing: 2,
                    color: VwColors.neonCyan,
                    shadows: const [
                      Shadow(blurRadius: 12, color: VwColors.neonCyan),
                    ],
                  ),
                ),
                Text(
                  role,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: VwColors.neonPink,
                    shadows: const [
                      Shadow(blurRadius: 10, color: VwColors.neonPink),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..strokeWidth = 1;

    for (double y = size.height * 0.55; y < size.height; y += 16) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    for (double x = 0; x < size.width; x += 24) {
      canvas.drawLine(
        Offset(x, size.height * 0.55),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
