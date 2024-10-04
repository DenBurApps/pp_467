import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class StepTitle extends StatelessWidget {
  final String text;
  final int step;
  final int activeStep;
  const StepTitle({
    super.key,
    required this.text,
    required this.step,
    required this.activeStep,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        text,
        style: activeStep == step
            ? context.text.bodyMedium
            : context.text.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
