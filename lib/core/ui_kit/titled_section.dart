import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class TitledSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? titleColor;
  const TitledSection({
    super.key,
    required this.title,
    required this.child,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.text.displaySmall,
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}
