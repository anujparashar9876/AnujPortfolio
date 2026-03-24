import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  const Color primary = Color(0xFF0F172A); // Modern dark blue
  const Color accent = Color(0xFF38BDF8); // Vibrant light blue
  const Color background = Color(0xFF080F1F); // Darker background
  const Color card = Color(0xFF1E293B);

  final base = ThemeData.dark();

  return base.copyWith(
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: base.colorScheme.copyWith(
      primary: accent, 
      secondary: accent, 
      surface: card,
    ),
    textTheme: GoogleFonts.outfitTextTheme(base.textTheme).copyWith(
      displayLarge: GoogleFonts.outfit(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.white, height: 1.1),
      displayMedium: GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
      headlineSmall: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w600, color: accent),
      bodyLarge: GoogleFonts.outfit(fontSize: 18, color: Colors.white70, height: 1.6),
      bodyMedium: GoogleFonts.outfit(fontSize: 16, color: Colors.white60),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardColor: card,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
