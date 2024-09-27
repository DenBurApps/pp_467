import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class TextStylesThemeExtension
    extends ThemeExtension<TextStylesThemeExtension> {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  const TextStylesThemeExtension({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  @override
  TextStylesThemeExtension copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) {
    return TextStylesThemeExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
    );
  }

  @override
  TextStylesThemeExtension lerp(
      ThemeExtension<TextStylesThemeExtension>? other, double t) {
    if (other is! TextStylesThemeExtension) {
      return this;
    }
    return TextStylesThemeExtension(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
    );
  }

  static final instance = TextStylesThemeExtension(
    displayLarge: GoogleFonts.inter(
      fontSize: 42,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 26,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 16,
      height: 1.1,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 24,
      height: 1.1,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      height: 1.1,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      height: 1.1,
      fontWeight: FontWeight.w300,
    ),
  );
}
