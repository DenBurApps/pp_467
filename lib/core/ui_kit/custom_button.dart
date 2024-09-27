import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/config/theme/text_styles_theme_extension.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool active;
  final Color? color;

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.active,
    this.color,
  });

  CustomButton.title({
    super.key,
    required String title,
    required this.onPressed,
    required this.active,
    this.color,
  }) : child = Text(
          title,
          style: TextStylesThemeExtension.instance.displayMedium.copyWith(
            color: Colors.white,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Opacity(
            opacity: active ? 1 : 0.5,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: color ?? context.colors.surfaceBright,
              disabledColor: context.colors.primary,
              onPressed: active ? onPressed : null,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
