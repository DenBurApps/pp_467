import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/settings/dialogs/dialog_manager.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceBright,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const CustomBackButton(),
        title: Text(
          'Settings',
          style: context.text.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colors.surfaceDim,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Section(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    SettingsTile(
                      title: 'Contact us',
                      onPressed: () => DialogManager.showContactDialog(context),
                    ),
                    const SizedBox(height: 15),
                    SettingsTile(
                      title: 'Rate us',
                      onPressed: () async {
                        final InAppReview inAppReview = InAppReview.instance;
                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                    ),
                    Divider(
                      color: context.colors.primary,
                      height: 20,
                    ),
                    SettingsTile(
                      title: 'Privacy Policy',
                      onPressed: () =>
                          context.router.push(const PrivacyPolicyRoute()),
                    ),
                    const SizedBox(height: 15),
                    SettingsTile(
                      title: 'Terms of Use',
                      onPressed: () =>
                          context.router.push(const TermsOfUseRoute()),
                    ),
                    const SizedBox(height: 15),
                    SettingsTile(
                      title: 'Version',
                      onPressed: () =>
                          DialogManager.showAppVersionDialog(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SettingsTile({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 10),
      onPressed: onPressed,
      child: Align(
        child: Text(
          title,
          style: context.text.bodyMedium.copyWith(
            color: context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}
