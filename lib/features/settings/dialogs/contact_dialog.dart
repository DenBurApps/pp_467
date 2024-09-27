import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/helpers/text_helper.dart';

class ContactDialog extends StatefulWidget {
  const ContactDialog({
    super.key,
  });

  @override
  State<ContactDialog> createState() => _ContactDialogState();
}

class _ContactDialogState extends State<ContactDialog> {
  final subjectController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          CupertinoTextField(
            style: context.text.bodyMedium,
            controller: subjectController,
            placeholder: 'Message subject',
          ),
          const SizedBox(height: 8),
          CupertinoTextField(
            style: context.text.bodyMedium,
            controller: textController,
            placeholder: 'Message text',
            maxLines: 4,
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => context.router.popForced(),
          isDestructiveAction: true,
          child: const Text(
            'Cancel',
          ),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            context.router.popForced();
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: TextHelper.supportEmail,
              query: _encodeQueryParameters(<String, String>{
                'subject': subjectController.text,
                'body': textController.text,
              }),
            );
            launchUrl(emailLaunchUri);
          },
          child: Text(
            'Send',
            style: TextStyle(color: context.colors.primary),
          ),
        ),
      ],
    );
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
