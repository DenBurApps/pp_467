import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/gen/assets.gen.dart';

class StepCircle extends StatelessWidget {
  final int step;
  final int activeStep;
  const StepCircle({
    super.key,
    required this.step,
    required this.activeStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.primary),
        color: step == activeStep
            ? context.colors.surfaceBright
            : context.colors.primary,
      ),
      child: Builder(
        builder: (context) {
          if (step < activeStep) {
            return SvgIcon(Assets.icons.tick);
          }
          return Align(
            child: Text(
              (step + 1).toString(),
              style: step > activeStep
                  ? context.text.bodyMedium.copyWith(
                      color: context.colors.onPrimary,
                    )
                  : context.text.bodyLarge,
            ),
          );
        },
      ),
    );
  }
}
