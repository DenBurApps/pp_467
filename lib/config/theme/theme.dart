import 'package:flutter/material.dart';
import 'package:pp_467/config/theme/custom_colors_theme_extension.dart';
import 'package:pp_467/config/theme/text_styles_theme_extension.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0C0B0E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFA934E),
          surface: Color(0xFF232323),
          surfaceBright: Color(0xFF3E3E3E),
          surfaceDim: Color(0xFF171717),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        extensions: [
          CustomColorsThemeExtension.instance,
          TextStylesThemeExtension.instance,
        ],
      );
}
