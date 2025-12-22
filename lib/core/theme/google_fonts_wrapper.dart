import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  // Méthode principale pour obtenir la police Fredoka avec les paramètres
  static TextStyle fredoka({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return GoogleFonts.fredoka(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
      height: height,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  // Styles prédéfinis avec Fredoka
  static TextStyle get displayLarge => fredoka(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
      );

  static TextStyle get displayMedium => fredoka(
        fontSize: 45,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get displaySmall => fredoka(
        fontSize: 36,
        fontWeight: FontWeight.w400,
      );

  // Headlines
  static TextStyle get headlineLarge => fredoka(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get headlineMedium => fredoka(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get headlineSmall => fredoka(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  // Titles
  static TextStyle get titleLarge => fredoka(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMedium => fredoka(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmall => fredoka(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  // Body
  static TextStyle get bodyLarge => fredoka(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyMedium => fredoka(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodySmall => fredoka(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  // Labels
  static TextStyle get labelLarge => fredoka(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelMedium => fredoka(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get labelSmall => fredoka(
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );

  // Buttons
  static TextStyle get buttonLarge => fredoka(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get buttonMedium => fredoka(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get buttonSmall => fredoka(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  // Captions
  static TextStyle get caption => fredoka(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );

  // Helper methods
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withValues(TextStyle style, Color color, double alpha) {
    return style.copyWith(color: color.withValues(alpha: alpha));
  }
}