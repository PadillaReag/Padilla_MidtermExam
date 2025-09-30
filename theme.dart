import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VwColors {
  static const bg = Color(0xFF0A0621);
  static const neonPink = Color(0xFFFF3AAE);
  static const neonCyan = Color(0xFF00F5FF);
  static const neonPurple = Color(0xFF9B5CFF);
  static const sun = Color(0xFFFFB86C);

  static get glass => null;
}

LinearGradient vwHorizonGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF0F0436),
    Color(0xFF2A0F72),
    Color(0xFF4D1C9E),
    Color(0xFF0A0621),
  ],
);

ThemeData buildVaporwaveTheme() {
  final textTheme = GoogleFonts.vt323TextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: VwColors.bg,
    textTheme: textTheme,
    colorScheme: const ColorScheme.dark(
      primary: VwColors.neonPink,
      secondary: VwColors.neonCyan,
      surface: Color(0xFF150B3E),
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    useMaterial3: true,
  );
}
