import 'package:flutter/material.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: vwHorizonGradient),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      'PADILLA',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        letterSpacing: 3,
                        color: VwColors.neonCyan,
                        shadows: const [
                          Shadow(blurRadius: 12, color: VwColors.neonCyan),
                        ],
                      ),
                    ),
                    Text(
                      'UI/UX Designer · 3D Modeling',
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
              const SizedBox(height: 28),

              _SectionTitle('About Me'),
              _GlassCard(
                child: Text(
                  "I’m a UI/UX-focused designer who turns rough concepts into testable, delightful interfaces. "
                  "I work with wireframes, prototypes, and design systems, validating ideas with quick usability checks.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),

              _SectionTitle('Skills'),
              _GlassCard(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    _Chip('UI/UX Design'),
                    _Chip('Wireframing & Prototyping'),
                    _Chip('Design Systems'),
                    _Chip('Usability Testing'),
                    _Chip('Interaction Design'),
                    _Chip('3D Modeling'),
                  ],
                ),
              ),

              _SectionTitle('Game Projects'),
              _GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _ProjectTile(
                      title: 'Neon Runner (Prototype)',
                      blurb:
                          'Endless runner with neon HUD and haptics. Unity UI Toolkit.',
                    ),
                    Divider(color: Colors.white24),
                    _ProjectTile(
                      title: 'Pixel Quest Menu Revamp',
                      blurb:
                          'Reworked settings & inventory for faster task completion.',
                    ),
                    Divider(color: Colors.white24),
                    _ProjectTile(
                      title: 'Boss Arena HUD',
                      blurb: 'Accessible palette + cooldown rings for clarity.',
                    ),
                  ],
                ),
              ),

              _SectionTitle('Contact'),
              _GlassCard(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [_Chip('Phone: 09496048427')],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 18, 4, 10),
      child: Text(text, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0x66FFFFFF), Color(0x22FFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 2, color: Colors.white24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40FF3AAE),
            blurRadius: 24,
            spreadRadius: 1,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  const _Chip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
        gradient: const LinearGradient(
          colors: [Color(0x2200F5FF), Color(0x22FF3AAE)],
        ),
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final String title;
  final String blurb;
  const _ProjectTile({required this.title, required this.blurb});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(blurb, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
