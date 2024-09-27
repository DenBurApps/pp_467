import 'package:flutter/material.dart';

class WhiteBorderedChip extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget child;
  const WhiteBorderedChip({super.key, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(9),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
