import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? callback;
  const CustomBackButton({super.key, this.callback});

  const CustomBackButton.transparent({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: callback ?? context.router.maybePop,
      child: SvgIcon(
        Assets.icons.back,
        side: 30,
      ),
    );
  }
}
