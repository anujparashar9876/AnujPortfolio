import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  // Replace these placeholder colors with Figma tokens.
  const Color primary = Color(0xFF0A192F); // dark hero
  const Color accent = Color(0xFF6C63FF); // accent from figma
  const Color background = Color(0xFFF7F8FA);
  const Color card = Colors.white;

  final base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: base.colorScheme.copyWith(primary: primary, secondary: accent),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.bold, color: primary),
      displayMedium: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w700, color: primary),
      headlineSmall: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: primary),
      bodyLarge: GoogleFonts.poppins(fontSize: 18, color: Colors.black87, height: 1.6),
      bodyMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    cardColor: card,
  );
}
