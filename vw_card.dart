import 'package:flutter/material.dart';
import '../theme.dart';

class VwCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final GestureTapCallback? onTap;

  const VwCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [VwColors.glass, VwColors.glass.withOpacity(0.25)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(width: 2, color: Colors.white.withOpacity(0.18)),
          boxShadow: [
            BoxShadow(
              color: VwColors.neonPink.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: VwColors.neonCyan.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
