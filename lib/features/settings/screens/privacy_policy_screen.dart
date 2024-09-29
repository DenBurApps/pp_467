import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import '../../../core/helpers/text_helper.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceBright,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const CustomBackButton(),
        title: Text(
          'Privacy Policy',
          style: context.text.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colors.surfaceDim,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Theme(
                data: ThemeData(brightness: Brightness.dark),
                child: const Markdown(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  data: TextHelper.privacy,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
