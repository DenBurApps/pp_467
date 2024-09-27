import 'package:flutter/cupertino.dart';

class Section extends StatelessWidget {
  final Widget child;
  const Section({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
