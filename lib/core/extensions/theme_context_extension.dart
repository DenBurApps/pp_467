import 'package:flutter/material.dart';
import 'package:pp_467/config/theme/custom_colors_theme_extension.dart';
import 'package:pp_467/config/theme/text_styles_theme_extension.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);

  TextStylesThemeExtension get text =>
      _theme.extension<TextStylesThemeExtension>()!;

  Color get scaffoldBackgroundColor => _theme.scaffoldBackgroundColor;

  ColorScheme get colors => _theme.colorScheme;

  CustomColorsThemeExtension get customColors =>
      _theme.extension<CustomColorsThemeExtension>()!;
}
