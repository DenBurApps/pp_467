import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class BlackChip extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const BlackChip({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
