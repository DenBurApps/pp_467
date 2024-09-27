import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/settings/dialogs/dialog_manager.dart';
import 'package:pp_467/gen/assets.gen.dart';
import 'package:pull_down_button/pull_down_button.dart';

class EditOrDeleteButton extends StatelessWidget {
  final VoidCallback onUpdateRequested;
  final VoidCallback onDeleteConfirmed;
  const EditOrDeleteButton({
    super.key,
    required this.onUpdateRequested,
    required this.onDeleteConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return PullDownButton(
      itemBuilder: (context) => [
        PullDownMenuItem(
          title: 'Edit',
          iconWidget: SvgIcon(Assets.icons.edit),
          onTap: onUpdateRequested,
        ),
        PullDownMenuItem(
          isDestructive: true,
          title: 'Delete',
          iconWidget: SvgIcon(Assets.icons.trash),
          onTap: () async {
            final result =
                await DialogManager.deleteConfirmationDialog(context);
            if (result != null && result) {
              onDeleteConfirmed();
            }
          },
        ),
      ],
      buttonBuilder: (context, showMenu) => CupertinoButton(
        alignment: Alignment.topRight,
        padding: EdgeInsets.zero,
        onPressed: showMenu,
        child: SvgIcon(
          Assets.icons.more,
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
