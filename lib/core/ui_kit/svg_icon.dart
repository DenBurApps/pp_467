import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? side;
  final Color? color;
  const SvgIcon(this.assetName, {super.key, this.side, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: side ?? 24,
      height: side ?? 24,
      child: SvgPicture.asset(
        assetName,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
