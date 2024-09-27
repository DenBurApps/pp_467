import 'package:flutter/material.dart';

@immutable
class CustomColorsThemeExtension
    extends ThemeExtension<CustomColorsThemeExtension> {
  final Color edit;
  final Color delete;

  const CustomColorsThemeExtension({
    required this.edit,
    required this.delete,
  });

  @override
  CustomColorsThemeExtension copyWith({
    Color? edit,
    Color? delete,
  }) {
    return CustomColorsThemeExtension(
      edit: edit ?? this.edit,
      delete: delete ?? this.delete,
    );
  }

  @override
  CustomColorsThemeExtension lerp(
      ThemeExtension<CustomColorsThemeExtension>? other, double t) {
    if (other is! CustomColorsThemeExtension) return this;
    return CustomColorsThemeExtension(
      edit: Color.lerp(edit, other.edit, t)!,
      delete: Color.lerp(delete, other.delete, t)!,
    );
  }

  static const instance = CustomColorsThemeExtension(
    edit: Color(0xFFFBB142),
    delete: Color(0xFFF2263F),
  );
}
