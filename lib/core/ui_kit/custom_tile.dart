import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CustomTile({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(30),
      color: context.colors.primary,
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.text.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
