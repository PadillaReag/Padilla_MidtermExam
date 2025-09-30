import 'package:flutter/material.dart';
import '../theme.dart';

/// Animated vaporwave header with glowing avatar + dual-glow name.
/// - avatarUrl: from GitHub profile (can be empty)
/// - imgurFallback: default Imgur link (used if avatarUrl is empty)
class VwAnimatedHeader extends StatefulWidget {
  const VwAnimatedHeader({
    super.key,
    required this.name,
    required this.role,
    this.avatarUrl,
    this.height = 320,
  });

  final String name;
  final String role;
  final String? avatarUrl;
  final double height;

  @override
  State<VwAnimatedHeader> createState() => _VwAnimatedHeaderState();
}

class _VwAnimatedHeaderState extends State<VwAnimatedHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  // 🔹 fallback Imgur profile photo
  static const String _imgurFallback = 'https://i.imgur.com/sAJD0ea.jpeg';

  late final Animation<Color?> _startA =
      ColorTween(begin: VwColors.neonCyan, end: VwColors.neonPink).animate(
        CurvedAnimation(
          parent: _c,
          curve: const Interval(0.00, 0.50, curve: Curves.easeInOut),
        ),
      );

  late final Animation<Color?> _endA =
      ColorTween(begin: VwColors.neonPurple, end: VwColors.neonCyan).animate(
        CurvedAnimation(
          parent: _c,
          curve: const Interval(0.00, 0.50, curve: Curves.easeInOut),
        ),
      );

  late final Animation<Color?> _startB =
      ColorTween(begin: VwColors.neonPink, end: VwColors.neonPurple).animate(
        CurvedAnimation(
          parent: _c,
          curve: const Interval(0.50, 1.00, curve: Curves.easeInOut),
        ),
      );

  late final Animation<Color?> _endB =
      ColorTween(begin: VwColors.neonCyan, end: VwColors.neonPink).animate(
        CurvedAnimation(
          parent: _c,
          curve: const Interval(0.50, 1.00, curve: Curves.easeInOut),
        ),
      );

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 14))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasGithub = (widget.avatarUrl ?? '').trim().isNotEmpty;
    final imageUrl = hasGithub ? widget.avatarUrl! : _imgurFallback;

    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        final t = _c.value;
        final start = t < 0.5 ? _startA.value! : _startB.value!;
        final end = t < 0.5 ? _endA.value! : _endB.value!;

        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [start, end, VwColors.bg],
              stops: const [0.0, 0.7, 1.0],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // avatar with neon glow
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: VwColors.neonCyan.withOpacity(0.65),
                          blurRadius: 25,
                          spreadRadius: 5,
                        ),
                        BoxShadow(
                          color: VwColors.neonPink.withOpacity(0.65),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(imageUrl),
                      backgroundColor: Colors.transparent,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // name with dual glow
                  Text(
                    widget.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 18,
                          color: VwColors.neonCyan,
                          offset: Offset(-2, -2),
                        ),
                        Shadow(
                          blurRadius: 18,
                          color: VwColors.neonPink,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // role/tagline
                  Text(
                    widget.role,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: VwColors.neonPink,
                      shadows: const [
                        Shadow(blurRadius: 12, color: VwColors.neonPink),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
