import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final base = GoogleFonts.interTextTheme();
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accentColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      textTheme: base.apply(bodyColor: headingColor).copyWith(
        bodyLarge: const TextStyle(color: bodyTextColor, fontSize: 16, height: 1.7),
        bodyMedium: const TextStyle(color: bodyTextColor, fontSize: 14, height: 1.6),
        headlineLarge: GoogleFonts.jetBrainsMono(
          color: headingColor,
          fontWeight: FontWeight.w700,
          fontSize: 48,
          letterSpacing: -1.5,
        ),
        headlineMedium: GoogleFonts.jetBrainsMono(
          color: headingColor,
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),
        titleLarge: GoogleFonts.inter(
          color: headingColor,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        titleMedium: GoogleFonts.inter(
          color: headingColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        titleSmall: GoogleFonts.jetBrainsMono(
          color: accentColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 1,
        ),
        labelLarge: GoogleFonts.jetBrainsMono(
          color: accentColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
        labelSmall: GoogleFonts.inter(
          color: bodyTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
      ),
    );
  }

  // ── Convenience text styles ──

  static TextStyle get sectionComment => GoogleFonts.jetBrainsMono(
        color: accentColor.withValues(alpha: 0.7),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get terminalText => GoogleFonts.jetBrainsMono(
        color: bodyTextColor,
        fontSize: 12,
        height: 1.7,
      );

  static TextStyle get terminalPrompt => GoogleFonts.jetBrainsMono(
        color: accentColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.7,
      );

  static TextStyle get statNumber => GoogleFonts.jetBrainsMono(
        color: accentColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get statLabel => GoogleFonts.jetBrainsMono(
        color: bodyTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );

  static BoxDecoration cardDecoration({bool hovered = false}) =>
      BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: hovered ? accentColor.withValues(alpha: 0.35) : borderColor,
        ),
      );
}
