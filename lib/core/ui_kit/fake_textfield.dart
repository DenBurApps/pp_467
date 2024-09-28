import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class FakeTextfield extends StatelessWidget {
  final String text;
  final bool inactive;
  const FakeTextfield({super.key, required this.text, required this.inactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text,
          style: context.text.bodyMedium.copyWith(
            color: inactive
                ? context.colors.surfaceBright
                : context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}
